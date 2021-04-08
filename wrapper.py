import os
import sys
import wfunctions as func


cut = "c17"
cut_file = f"ISCAS85\\{cut}.v"
fname = "mid.v"

i, o = func.get_config(cut_file)
o1, o2 = func.generate_port_lines(i, o, "TEST_IP", "CUT_OP", "FF_OP")
func.change_mid(fname, cut, o1, o2)
