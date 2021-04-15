import wfunctions as func
import getopt, sys

def main(args):
    cut = ["c17", "c432", "c499", "c880", "c1908"]
    mid_file = "mid.v"
    top_file = "top.v"
    iters = [1]*len(cut)
    thresh1 = [0.7]*len(cut)
    thresh2 = [0.3]*len(cut)
    pre = False
    cset = False
    exe = False
    NUM = None

    try:
        opts = getopt.getopt(args, "epc:m:t:n:", ["exec", "prepf", "cfile", "midfile", "topfile", "cnum"])
        opts = opts[0]
    except getopt.GetoptError:
        print("wrapper.py -e -p -c <cut_file> -m <mid_file> -t <top_file> -n <cnum>")
    
    for opt, arg in opts:
        if opt in ("-e","--exec"):
            exe = True
        if opt in ("-c","--cfile"):
            cut = arg
            cset = True
        if opt in ("-p","--pre"):
            pre = True
        if opt in ("-m","--midfile"):
            mid_file = arg
        if opt in ("-t","--topfile"):
            top_file = arg
        if opt in ("-n","--cnum"):
            NUM = int(arg)
    
    if NUM != None or cset == True:
        if pre:
            if cset == True:
                print(f"Preprocessing CUT Fault File for {cut}.v --> {cut}f.v")
                func.cut_f(cut)
            if NUM != None:
                print(f"Preprocessing CUT Fault File for {cut[NUM]}.v --> {cut[NUM]}f.v")
                func.cut_f(cut[NUM])
        
        if NUM != None and cset == True:
            print("Arguement Combination not understood, Exiting")
            return
        if NUM != None:
            # Prepares the Source Files as per CUT
            func.prep_source(cut[NUM], mid_file, top_file)
            print(f"Verilog Source Modified for {cut[NUM]}")

        if cset == True:
            func.prep_source(cut, mid_file, top_file)
            print(f"Verilog Source Modified for {cut}")
    else:
        if pre:
            for c in cut:
                print(f"Preprocessing CUT Fault File for {c}.v --> {c}f.v")
                func.cut_f(c)
    if exe:
        print("\nCompile and Output: \n\niverilog -o output -c .compile\nvvp output")
        func.os.system("iverilog -o output -c .compile")
        func.os.system("vvp output")

    sys.exit(2)

if __name__ == "__main__":
    main(sys.argv[1:])