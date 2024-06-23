#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/adpcm_ahls/solution1/csim/build/apcc_db_gabriel/375031718834769148516/populate_io.ld.bc ${1+"$@"}
