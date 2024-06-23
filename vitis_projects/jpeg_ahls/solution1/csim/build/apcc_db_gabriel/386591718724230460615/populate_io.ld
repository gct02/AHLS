#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/jpeg_ahls/solution1/csim/build/apcc_db_gabriel/386591718724230460615/populate_io.ld.bc ${1+"$@"}
