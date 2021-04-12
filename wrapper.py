import wfunctions as func
import threading as th

cut = ["c17", "c432", "c499", "c880", "c1908", "c2670", "c3540", "c6288", "c7552"]
iters = [1]*len(cut)
thresh1 = [0.7]*len(cut)
thresh2 = [0.3]*len(cut)
mid_file = "mid.v"
top_file = "top.v"

# # Preprocess Files  
# for c in cut:
#     func.cut_f(c)


# MultiThreaded Op (Doesn't work as the same mid file is to be used each time)
# if __name__ == "__main__":

#     for i, c in enumerate(cut):
#         func.os.system(f"del /f output_{c}.txt")
#         arg = (c, mid_file, top_file, iters[i], thresh1[i], thresh2[i])
#         t = th.Thread(target = func.iter_random_each, args = arg)
#         t.start()

# for c, iter, thresha, threshb in zip(cut, iters, thresh1, thresh2:
#     func.iter_random_each(c, mid_file, top_file, iter, thresha, threshb)


func.prep_source(cut[0], mid_file, top_file)