import os
import wfunctions as func


cut = "c499"
cut_file = f"ISCAS85\\{cut}.v"
mid_file = "mid.v"
top_file = "top.v"

i, o = func.get_config(cut_file)

o1, o2 = func.generate_port_lines(i, o, "TEST_IP", "CUT_OP", "FF_OP")
func.change_mid(mid_file, cut, o1, o2)
func.change_top_params(top_file, int(i), int(o))

os.system(".\\run.bat")