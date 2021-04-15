import wfunctions as func
import getopt, sys

def main(args):
    cut = ["c17", "c432", "c499", "c880", "c1908", "c2670"]
    mid_file = "mid.v"
    top_file = "top.v"
    iters = [1]*len(cut)
    thresh1 = [0.7]*len(cut)
    thresh2 = [0.3]*len(cut)
    pre = False
    cset = False
    NUM = None

    try:
        opts = getopt.getopt(args, "pc:m:t:n:", ["prepf", "cfile", "midfile", "topfile", "cnum"])
        opts = opts[0]
    except getopt.GetoptError:
        print("wrapper.py -c <cut_file> -m <mid_file> -t <top_file> -n <cnum>")
    
    for opt, arg in opts:
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
            for c in cut:
                func.cut_f(c)
        if NUM != None and cset == True:
            print("Arguement Combination not understood, Exiting")
            return
        if NUM != None:
            # Prepares the Source Files as per CUT
            func.prep_source(cut[NUM], mid_file, top_file)
            print(f"Source Modified for {cut[NUM]}")

        if cset == True:
            func.prep_source(cut, mid_file, top_file)
            print(f"Source Modified for {cut}")
    else:
        if pre:
            print("Preprocessing CUT Fault Files")
            for c in cut:
                func.cut_f(c)
    sys.exit(2)

if __name__ == "__main__":
    main(sys.argv[1:])