import os
import re
from math import log2, ceil

def generate_port_lines(i, o, inp_arr, out_arr1, out_arr2):
    l1 = ""
    l2 = ""
    for c in range(i):
        l1 = l1 + inp_arr + f"[{i-c-1}], "
        l2 = l2 + inp_arr + f"[{i-c-1}], "
    
    for c in range(o):
        l1 = l1 + out_arr1 + f"[{o-c-1}], "
        l2 = l2 + out_arr2 + f"[{o-c-1}], "

    l1 = "\t\t" + l1[ : len(l1) - 2 ] + "\n"
    l2 = "\t\t" + l2[ : len(l2) - 2 ] + "\n"
    
    return l1, l2

def get_config(v_file):
    i = None
    o = None
    f = None
    with open(v_file, "r") as fl:
        lines = fl.readlines()
    for Line in lines:
        F0 = re.findall("ninputs [0-9]+", Line.lower())
        if F0 != []:
            i = int(re.findall("[0-9]+", F0[0])[0])
        F1 = re.findall("noutputs [0-9]+", Line.lower())
        if F1 != []:
            o = int(re.findall("[0-9]+", F1[0])[0])
        F2 = re.findall("nfaults [0-9]+", Line.lower())
        if F2 != []:
            f = int(re.findall("[0-9]+", F2[0])[0])

        if(i != None and o != None and f != None):
            break
    return i, o, f

def mod_mid(mid, cut, inputs, outputs, inp_arr, out_arr1, out_arr2, params = ""):
    
    o02, o12 = generate_port_lines(inputs, outputs, inp_arr, out_arr1, out_arr2)
    o01 = f"\t{cut}f #({params}) faulty(\n"
    o11 = f"\t{cut} #({params}) faultf(\n"

    s = r"// Anchor"

    f = open(mid, "a+")
    f.seek(0)
    lines = f.readlines()
    for i, line in enumerate(lines):
        line = line.strip()
        if line == s:
            lines[i+1] = o01
            lines[i+2] = o02
            lines[i+4] = o11
            lines[i+5] = o12
            break
    f.close()
    f = open(mid, "w")
    f.write("".join(lines))

def mod_top_params(fname, inputs = 3, outputs = 1, faults = 100, rc_bits = 2, clk = 5):
    
    fbits = ceil(log2(faults))
    
    f = open(fname, "r")
    f.seek(0)
    p = "\tparameter"
    lines = f.readlines()
    for i, line in enumerate(lines):
        if (line.strip().lower()[2:]).strip() == "params":
            lines[i+1] = p + f" IN_BITS = {inputs};\n"
            lines[i+2] = p + f" OUT_BITS = {outputs};\n"
            lines[i+3] = p + f" RC_OUT_BITS = {rc_bits};\n"
            lines[i+4] = p + f" TOT_FAULT_BITS = {fbits};\n"
            lines[i+5] = p + f" ERR_TOTAL = {faults};\n"
            lines[i+6] = p + f" clk_period = {clk};\n"
            break
    f.close()
    f = open (fname, "w")
    f.write("".join(lines))
           
def wrap(cut, mid_file, top_file):
    
    cut_file = f"ISCAS85\\{cut}.v"
    inputs, outputs, faults = get_config(cut_file)
    mod_mid(mid_file, cut, inputs, outputs, "TEST_IP", "CUT_OP", "FF_OP")
    mod_top_params(top_file, inputs, outputs, faults)

    os.system("iverilog -o output -c .compile")
    os.system(f"echo {cut.upper()} >> output.txt")
    os.system(f"vvp output >> output.txt")


def cut_f(cut):
# Note that this function needs to be run only once 
# and not on every compilation to edit the faulty cut file
    cut_file = f"ISCAS85\\{cut}"
    
    with open(cut_file + ".v", "r") as f:
        lines = f.readlines()
    
    # net_dict contains only the nets that are input to gates and not their outputs
    net_dict = {}
    fanouts = {}
    PIs = []

    flag = 0
    insert_index = 0
    struc_index = 0

    # Builds net_dict, PIs and fanouts dictionaries/libraries
    for m, line in enumerate(lines):

        # For all Nets
        if line.strip().lower()[2:].strip() == "anchor":
            flag = 3
            struc_index = m + 1
            continue
        # For PIs
        if line.strip().lower()[0:5].strip() == "input":
            flag = 2

        # For Code Addition of Fault Model
        if line.strip().lower()[2:].strip() == "faultmodel":
            insert_index = m + 1

        # Builds new_dict(flag = 3)
        if flag == 3:
            L =  re.findall("[(].*[)]",line)
            try:
                L = L[0][1:len(L[0])-1]
                L = L.split(",")
                for i, n in enumerate(L):
                    if i == 0:
                        continue
                    try:
                        net_dict[n.strip()] = net_dict[n.strip()] + 1
                    except:
                        net_dict[n.strip()] = 1
            except IndexError:
                break
        
        # Collects PIs (flag = 2)
        if flag == 2 and line.strip(" \n\t\r") == "":
            flag = 0
        if flag == 2:
            L = re.findall(" .*[,]*.*",line)
            for i, L1 in enumerate(L):
                L[i] = L1.strip()
                L[i] = L[i][:-1]
                L[i] = L[i].split(",")
                for n in L[i]:
                    PIs.append(n)
    
    # Collects fanouts from new_dict
    for key in net_dict:
        if net_dict[key] > 1:
            fanouts[key] = net_dict[key]
            # Remove from PIs if net also fanout
            try:
                PIs.remove(key)
            except:
                continue

    # Build FaultModel Lines:
    num_fan = 0
    for key in fanouts:
        num_fan = num_fan + fanouts[key]

    regf = "\treg fault;\n"
    enable = f"reg [{len(PIs) + num_fan -1}:0] FEN;\n"
    PIwires = "wire " if len(PIs) else "" 
    PIinstance = ""
    FANwires = "wire " if len(fanouts) else ""
    FANinstance = ""
    
    # Build PIs wires and FIMs
    for i,net in enumerate(PIs):
        PIwires = PIwires + net + "_t,"
        if i == len(PIs) - 1:
            PIwires = PIwires[:-1] + ";\n"
        if i % 10 == 9:
            PIwires = PIwires + "\n     "
        PIinstance = PIinstance + f"fim PI_{net}( .fault(fault), .net({net}), .FEN(FEN[{i}]), .op({net}_t) );\n"

    # Build FANOUTs wires and FIMs
    k = 0
    for key in fanouts:
        num = fanouts[key]
        for i in range(num):
            FANwires = FANwires + key + f"_t{i},"
            k = k + 1
            if k == num_fan:
                FANwires = FANwires[:-1] + ";\n"
            if k % 10 == 9:
                FANwires = FANwires + "\n     "
            FANinstance = FANinstance + f"fim FAN_{key}_{i} ( .fault(fault), .net({key}), .FEN(FEN[{len(PIs) + k - 1}]), .op({key}_t{i}) );\n"
    
    # Edits to existing code
    L = lines[struc_index:]
    fan = fanouts.copy()
    for ind, struc in enumerate(L):
        if struc.strip().lower() == "":
            break
        for net in PIs:
            F = re.findall(f"{net}[ ,)]+", struc)
            if  F == []:
                continue
            F = F[0]
            spl = re.split(f"{net}[ ,)]+", struc)
            F = re.sub(f"{net}",f"{net}_t", F)
            spl.insert(1,F)
            # Net Replaced
            struc = ("".join(spl))
            lines[struc_index+ind] = struc
        
        for key in fan:
            F = re.findall(f"[ ,]+{key}[ ,)]+", struc) 
            if F == []:
                continue
            F = F[0]
            spl = re.split(f"[ ,]+{key}[ ,)]+", struc)
            F = re.sub(f"{key}",f"{key}_t{fanouts[key]-fan[key]}", F)
            fan[key] = fan[key] - 1
            spl.insert(1,F)
            struc = ("".join(spl))
            lines[struc_index + ind] = struc

    # Write Everything to File 
    # --This process changes indices 
    # --hence it needs to be done after the 
    # --edits are made to the existing code
    final = regf + PIwires + FANwires + enable + PIinstance + FANinstance
    final = final.strip()
    for i, ins in enumerate(final.split("\n")):
        lines.insert(insert_index + i,  ins + "\n")

    with open(cut_file + "f.v", "w") as f:
        f.writelines(lines)
    
    # Update CUT and CUTf file to have number of 
    # faults and required bits in the header
    # also update the module name of faulty cut
    fff = 2*(num_fan + len(PIs))
    with open(cut_file + ".v", "r") as f0:
        r = f0.readlines()

    for Line in r:
        if Line[0:2] != "//":
            break
        F2 = re.findall("nfaults [0-9]+", Line.lower())
        if F2 != []:
            r = 0
            break
    
    # If Nfaults already in header, dont write again
    if r != 0:
        for i, ri in enumerate(r):
            if ri[0:2] != "//":
                r.insert(i, "//" + f" Nfaults {fff}\n")
                break
        with open(cut_file + ".v", "w") as f0:
            f0.writelines(r)
        
        with open(cut_file + "f.v", "r") as f0:
            r = f0.readlines()
        for i, ri in enumerate(r):
            if ri[0:2] != "//":
                r.insert(i, "//" + f" Nfaults {fff}\n")
                break
            
    with open(cut_file + "f.v", "r") as f0: 
        r = f0.readlines()
    
    for i, ri in enumerate(r):
        # Change Module Name
        F = re.findall("module c[0-9]+ ", ri)
        if F == []:
            continue
        F = F[0]
        spl = re.split("module c[0-9]+ ", ri)
        F = re.sub("module c[0-9]+ ", F[:-1] + "f ", F)
        spl.insert(1, F)
        r[i] = "".join(spl)
        break

    with open(cut_file + "f.v", "w") as f0:
        f0.writelines(r)