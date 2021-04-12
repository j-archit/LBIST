import wfunctions as func

cut = ["c499"]
iters = [500]
thresh1 = [0.35]
mid_file = "mid.v"
top_file = "top.v"

# Preprocess Files  
for c in cut:
    func.cut_f(c)
func.os.system("del /f output.txt")
for c, iter, thresh in zip(cut, iters, thresh1):
    func.wrap_each(c, mid_file, top_file, iter, thresh)
