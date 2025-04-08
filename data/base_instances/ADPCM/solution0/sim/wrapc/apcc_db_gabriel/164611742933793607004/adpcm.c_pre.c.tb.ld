#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/ADPCM/solution0/sim/wrapc/apcc_db_gabriel/164611742933793607004/adpcm.c_pre.c.tb.ld.bc ${1+"$@"}
