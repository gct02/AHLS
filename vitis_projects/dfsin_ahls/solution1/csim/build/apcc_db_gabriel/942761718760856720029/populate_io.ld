#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/dfsin_ahls/solution1/csim/build/apcc_db_gabriel/942761718760856720029/populate_io.ld.bc ${1+"$@"}
