#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/dfsin_ahls/solution1/csim/build/apcc_db_gabriel/941991718760852907500/dfsin_host.ld.bc ${1+"$@"}
