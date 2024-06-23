<AutoPilot:project xmlns:AutoPilot="com.autoesl.autopilot.project" top="adpcm_main" name="adpcm_ahls">
    <files>
        <file name="../../../benchmarks/chstone/adpcm/src/adpcm_host.c" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
        <file name="../../../benchmarks/chstone/adpcm/src/iolib/populate_io.c" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
        <file name="benchmarks/chstone/adpcm/src/adpcm.c" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions>
        <solution name="solution1" status=""/>
    </solutions>
    <Simulation argv="/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/inputs/test/inputVec1.txt output.txt">
        <SimFlow name="csim" setup="false" optimizeCompile="false" clean="false" ldflags="" mflags=""/>
    </Simulation>
</AutoPilot:project>

