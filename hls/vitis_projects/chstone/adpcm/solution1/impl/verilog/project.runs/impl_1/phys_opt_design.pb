
B
Command: %s
53*	vivadotcl2
phys_opt_designZ4-113h px� 

@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
Implementation2	
xc7z020Z17-347h px� 
o
0Got license for feature '%s' and/or device '%s'
310*common2
Implementation2	
xc7z020Z17-349h px� 
R

Starting %s Task
103*constraints2
Initial Update TimingZ18-103h px� 
�
�The property HD.CLK_SRC of clock port %s is not set. In out-of-context mode, this prevents timing estimation for clock delay/skew167*timing2
ap_clkap_clk8Z38-242h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:05 ; elapsed = 00:00:01 . Memory (MB): peak = 3013.684 ; gain = 0.000 ; free physical = 304 ; free virtual = 6517h px� 
�
^PhysOpt_Tcl_Interface Runtime Before Starting Physical Synthesis Task | CPU: %ss |  WALL: %ss
566*	vivadotcl2
5.512
1.53Z4-1435h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2

00:00:002
00:00:00.012

3013.6842
0.0002
3042
6517Z17-722h px� 
O

Starting %s Task
103*constraints2
Physical SynthesisZ18-103h px� 
^

Phase %s%s
101*constraints2
1 2#
!Physical Synthesis InitializationZ18-101h px� 
n
EMultithreading enabled for phys_opt_design using a maximum of %s CPUs380*physynth2
8Z32-721h px� 
q
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-0.0332
-0.097Z32-619h px� 
[
%s*common2B
@Phase 1 Physical Synthesis Initialization | Checksum: 18a96c49b
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:03 ; elapsed = 00:00:01 . Memory (MB): peak = 3013.684 ; gain = 0.000 ; free physical = 316 ; free virtual = 6521h px� 
q
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-0.0332
-0.097Z32-619h px� 
V

Phase %s%s
101*constraints2
2 2
DSP Register OptimizationZ18-101h px� 
z
CPass %s. Identified %s candidate %s for DSP register optimization.
275*physynth2
12
52
cellsZ32-457h px� 
�
#Processed cell %s. %s %s pushed %s.339*physynth2�
rbd_0_i/hls_inst/inst/grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248/grp_decode_fu_142/mul_ln679_12_reg_3864_reg	rbd_0_i/hls_inst/inst/grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248/grp_decode_fu_142/mul_ln679_12_reg_3864_reg2
162
registers were2
out8Z32-665h px� 
�
#Processed cell %s. %s %s pushed %s.339*physynth2�
ybd_0_i/hls_inst/inst/grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186/grp_encode_fu_138/mul_16s_32s_46_5_1_U15/buff1_reg	ybd_0_i/hls_inst/inst/grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186/grp_encode_fu_138/mul_16s_32s_46_5_1_U15/buff1_reg2
162
registers were2
out8Z32-665h px� 
�
#Processed cell %s. %s %s pushed %s.339*physynth2�
{bd_0_i/hls_inst/inst/grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186/grp_encode_fu_138/mul_15ns_15ns_29_2_1_U63/buff0_reg	{bd_0_i/hls_inst/inst/grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186/grp_encode_fu_138/mul_15ns_15ns_29_2_1_U63/buff0_reg2
142
registers were2
out8Z32-665h px� 
�
#Processed cell %s. %s %s pushed %s.339*physynth2�
ybd_0_i/hls_inst/inst/grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186/grp_encode_fu_138/mul_16s_32s_46_5_1_U15/buff2_reg	ybd_0_i/hls_inst/inst/grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186/grp_encode_fu_138/mul_16s_32s_46_5_1_U15/buff2_reg2
162
registers were2
out8Z32-665h px� 
�
#Processed cell %s. %s %s pushed %s.339*physynth2�
zbd_0_i/hls_inst/inst/grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186/grp_encode_fu_138/mul_16s_15ns_31_2_1_U67/buff0_reg	zbd_0_i/hls_inst/inst/grp_adpcm_main_Pipeline_adpcm_main_label12_fu_186/grp_encode_fu_138/mul_16s_15ns_31_2_1_U67/buff0_reg2
132
registers were2
out8Z32-665h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
22
52
nets or cells2
752
cells2
02
cell2
02
cellZ32-775h px� 
q
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-0.0332
-0.070Z32-619h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2
00:00:00.082
00:00:00.072

3013.6842
0.0002
3152
6520Z17-722h px� 
S
%s*common2:
8Phase 2 DSP Register Optimization | Checksum: 234a5e96e
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:08 ; elapsed = 00:00:02 . Memory (MB): peak = 3013.684 ; gain = 0.000 ; free physical = 315 ; free virtual = 6520h px� 
W

Phase %s%s
101*constraints2
3 2
Critical Path OptimizationZ18-101h px� 
q
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-0.0332
-0.070Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
vbd_0_i/hls_inst/inst/grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248/grp_decode_fu_142/mul_14s_15ns_29_2_1_U174/P[0]vbd_0_i/hls_inst/inst/grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248/grp_decode_fu_142/mul_14s_15ns_29_2_1_U174/P[0]8Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2H
!bd_0_i/hls_inst/inst/dec_deth[10]!bd_0_i/hls_inst/inst/dec_deth[10]2P
%bd_0_i/hls_inst/inst/dec_deth_reg[10]	%bd_0_i/hls_inst/inst/dec_deth_reg[10]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!bd_0_i/hls_inst/inst/dec_deth[10]!bd_0_i/hls_inst/inst/dec_deth[10]8Z32-735h px� 
q
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-0.0262
-0.037Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
vbd_0_i/hls_inst/inst/grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248/grp_decode_fu_142/mul_16s_15ns_31_2_1_U176/P[0]vbd_0_i/hls_inst/inst/grp_adpcm_main_Pipeline_adpcm_main_label13_fu_248/grp_decode_fu_142/mul_16s_15ns_31_2_1_U176/P[0]8Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2H
!bd_0_i/hls_inst/inst/dec_detl[10]!bd_0_i/hls_inst/inst/dec_detl[10]2P
%bd_0_i/hls_inst/inst/dec_detl_reg[10]	%bd_0_i/hls_inst/inst/dec_detl_reg[10]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2H
!bd_0_i/hls_inst/inst/dec_detl[10]!bd_0_i/hls_inst/inst/dec_detl[10]8Z32-735h px� 
q
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-0.0112
-0.011Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2F
 bd_0_i/hls_inst/inst/dec_deth[4] bd_0_i/hls_inst/inst/dec_deth[4]2N
$bd_0_i/hls_inst/inst/dec_deth_reg[4]	$bd_0_i/hls_inst/inst/dec_deth_reg[4]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2F
 bd_0_i/hls_inst/inst/dec_deth[4] bd_0_i/hls_inst/inst/dec_deth[4]8Z32-735h px� 
o
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
0.0212
0.000Z32-619h px� 
o
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
0.0212
0.000Z32-619h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2
00:00:00.022

00:00:002

3013.6842
0.0002
3152
6520Z17-722h px� 
T
%s*common2;
9Phase 3 Critical Path Optimization | Checksum: 234a5e96e
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:09 ; elapsed = 00:00:03 . Memory (MB): peak = 3013.684 ; gain = 0.000 ; free physical = 315 ; free virtual = 6520h px� 
W

Phase %s%s
101*constraints2
4 2
Critical Path OptimizationZ18-101h px� 
o
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
0.0212
0.000Z32-619h px� 
o
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
0.0212
0.000Z32-619h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2

00:00:002

00:00:002

3013.6842
0.0002
3152
6520Z17-722h px� 
T
%s*common2;
9Phase 4 Critical Path Optimization | Checksum: 234a5e96e
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:09 ; elapsed = 00:00:03 . Memory (MB): peak = 3013.684 ; gain = 0.000 ; free physical = 315 ; free virtual = 6520h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2
00:00:00.032

00:00:002

3013.6842
0.0002
3152
6520Z17-722h px� 
t
>Post Physical Optimization Timing Summary | WNS=%s | TNS=%s |
318*physynth2
0.0212
0.000Z32-603h px� 
B
-
Summary of Physical Synthesis Optimizations
*commonh px� 
B
-============================================
*commonh px� 


*commonh px� 


*commonh px� 
�
�-------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Optimization   |  WNS Gain (ns)  |  TNS Gain (ns)  |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  DSP Register   |          0.000  |          0.027  |           75  |              0  |                     5  |           0  |           1  |  00:00:01  |
|  Critical Path  |          0.054  |          0.070  |            0  |              0  |                     3  |           0  |           2  |  00:00:00  |
|  Total          |          0.054  |          0.097  |           75  |              0  |                     8  |           0  |           3  |  00:00:01  |
-------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 


*commonh px� 


*commonh px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2

00:00:002

00:00:002

3013.6842
0.0002
3152
6520Z17-722h px� 
P
%s*common27
5Ending Physical Synthesis Task | Checksum: 1d454381e
h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:09 ; elapsed = 00:00:03 . Memory (MB): peak = 3013.684 ; gain = 0.000 ; free physical = 314 ; free virtual = 6519h px� 
H
Releasing license: %s
83*common2
ImplementationZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1592
12
02
0Z4-41h px� 
O
%s completed successfully
29*	vivadotcl2
phys_opt_designZ4-42h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Write ShapeDB Complete: 2
00:00:00.052
00:00:00.012

3028.7152
0.0002
3132
6519Z17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Wrote PlaceDB: 2

00:00:022
00:00:00.812

3028.7152
0.0002
2892
6520Z17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Wrote PulsedLatchDB: 2

00:00:002

00:00:002

3028.7152
0.0002
2892
6520Z17-722h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Wrote RouteStorage: 2
00:00:00.062
00:00:00.032

3028.7152
0.0002
2892
6520Z17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Wrote Netlist Cache: 2
00:00:00.042
00:00:00.022

3028.7152
0.0002
2862
6520Z17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Wrote Device Cache: 2
00:00:00.012

00:00:002

3028.7152
0.0002
2852
6520Z17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Write Physdb Complete: 2

00:00:022
00:00:00.872

3028.7152
0.0002
2852
6520Z17-722h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2�
�/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/hls/vitis_projects/chstone/adpcm/solution1/impl/verilog/project.runs/impl_1/bd_0_wrapper_physopt.dcpZ17-1381h px� 


End Record