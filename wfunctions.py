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
    fl = open(v_file, "r")
    lines = fl.readlines()
    for Line in lines:
        if Line[2:10].strip().lower() == "ninputs":
            i = int(Line[11:])
        if Line[2:11].strip().lower() == "noutputs":
            o = int(Line[12:])
        if(i != None and o != None):
            break
    return i, o

def change_mid(mid, cut, o02, o12, params = ""):
    s = r"// Anchor"
    o01 = f"\t{cut} #({params}) faulty(\n"
    o11 = f"\t{cut} #({params}) faultf(\n"
    
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

