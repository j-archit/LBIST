import wfunctions as func

cut = ["c17", "c432", "c499"]
mid_file = "mid.v"
top_file = "top.v"

# Preproccesing CUT Files:
for c in cut:
    func.cut_f(c)

# func.os.system("del /f output.txt")
# for c in cut:
#     func.wrap(c, mid_file, top_file)


