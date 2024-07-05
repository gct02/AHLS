# 1 "ldrgen/rand_c/rand1.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 339 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/tools/Xilinx/Vitis_HLS/2023.2/common/technology/autopilot/etc/autopilot_ssdm_op.h" 1
# 266 "/tools/Xilinx/Vitis_HLS/2023.2/common/technology/autopilot/etc/autopilot_ssdm_op.h"
    void _ssdm_op_IfRead() __attribute__ ((nothrow));
    void _ssdm_op_IfWrite() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfNbRead() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfNbWrite() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfCanRead() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfCanWrite() __attribute__ ((nothrow));


    void _ssdm_StreamRead() __attribute__ ((nothrow));
    void _ssdm_StreamWrite() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamNbRead() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamNbWrite() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamCanRead() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamCanWrite() __attribute__ ((nothrow));
    void _ssdm_op_ReadReq() __attribute__ ((nothrow));
    void _ssdm_op_Read() __attribute__ ((nothrow));
    void _ssdm_op_WriteReq() __attribute__ ((nothrow));
    void _ssdm_op_Write() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_NbReadReq() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_CanReadReq() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_NbWriteReq() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_CanWriteReq() __attribute__ ((nothrow));




    void _ssdm_op_MemShiftRead() __attribute__ ((nothrow));

    void _ssdm_op_PrintNone() __attribute__ ((nothrow));
    void _ssdm_op_PrintInt() __attribute__ ((nothrow));
    void _ssdm_op_PrintDouble() __attribute__ ((nothrow));

    void _ssdm_op_Wait(int) __attribute__ ((nothrow));
    void _ssdm_op_Poll() __attribute__ ((nothrow));

    void _ssdm_op_Return() __attribute__ ((nothrow));


    void _ssdm_op_SpecSynModule() __attribute__ ((nothrow));
    void _ssdm_op_SpecTopModule() __attribute__ ((nothrow));
    void _ssdm_op_SpecProcessDecl() __attribute__ ((nothrow));
    void _ssdm_op_SpecProcessDef() __attribute__ ((nothrow));
    void _ssdm_op_SpecPort() __attribute__ ((nothrow));
    void _ssdm_op_SpecConnection() __attribute__ ((nothrow));
    void _ssdm_op_SpecChannel() __attribute__ ((nothrow));
    void _ssdm_op_SpecSensitive() __attribute__ ((nothrow));
    void _ssdm_op_SpecModuleInst() __attribute__ ((nothrow));
    void _ssdm_op_SpecPortMap() __attribute__ ((nothrow));

    void _ssdm_op_SpecReset() __attribute__ ((nothrow));

    void _ssdm_op_SpecPlatform() __attribute__ ((nothrow));
    void _ssdm_op_SpecClockDomain() __attribute__ ((nothrow));
    void _ssdm_op_SpecPowerDomain() __attribute__ ((nothrow));

    int _ssdm_op_SpecRegionBegin() __attribute__ ((nothrow));
    int _ssdm_op_SpecRegionEnd() __attribute__ ((nothrow));

    void _ssdm_op_SpecLoopName() __attribute__ ((nothrow));

    void _ssdm_op_SpecLoopTripCount() __attribute__ ((nothrow));

    int _ssdm_op_SpecStateBegin() __attribute__ ((nothrow));
    int _ssdm_op_SpecStateEnd() __attribute__ ((nothrow));

    void _ssdm_op_SpecInterface() __attribute__ ((nothrow));

    void _ssdm_op_SpecPipeline() __attribute__ ((nothrow));
    void _ssdm_op_SpecDataflowPipeline() __attribute__ ((nothrow));


    void _ssdm_op_SpecLatency() __attribute__ ((nothrow));
    void _ssdm_op_SpecParallel() __attribute__ ((nothrow));
    void _ssdm_op_SpecProtocol() __attribute__ ((nothrow));
    void _ssdm_op_SpecOccurrence() __attribute__ ((nothrow));

    void _ssdm_op_SpecResource() __attribute__ ((nothrow));
    void _ssdm_op_SpecResourceLimit() __attribute__ ((nothrow));
    void _ssdm_op_SpecCHCore() __attribute__ ((nothrow));
    void _ssdm_op_SpecFUCore() __attribute__ ((nothrow));
    void _ssdm_op_SpecIFCore() __attribute__ ((nothrow));
    void _ssdm_op_SpecIPCore() __attribute__ ((nothrow));
    void _ssdm_op_SpecMemCore() __attribute__ ((nothrow));

    void _ssdm_op_SpecExt() __attribute__ ((nothrow));




    void _ssdm_SpecArrayDimSize() __attribute__ ((nothrow));

    void _ssdm_RegionBegin() __attribute__ ((nothrow));
    void _ssdm_RegionEnd() __attribute__ ((nothrow));

    void _ssdm_Unroll() __attribute__ ((nothrow));
    void _ssdm_UnrollRegion() __attribute__ ((nothrow));

    void _ssdm_InlineAll() __attribute__ ((nothrow));
    void _ssdm_InlineLoop() __attribute__ ((nothrow));
    void _ssdm_Inline() __attribute__ ((nothrow));
    void _ssdm_InlineSelf() __attribute__ ((nothrow));
    void _ssdm_InlineRegion() __attribute__ ((nothrow));

    void _ssdm_SpecArrayMap() __attribute__ ((nothrow));
    void _ssdm_SpecArrayPartition() __attribute__ ((nothrow));
    void _ssdm_SpecArrayReshape() __attribute__ ((nothrow));

    void _ssdm_SpecStream() __attribute__ ((nothrow));

    void _ssdm_op_SpecStable() __attribute__ ((nothrow));
    void _ssdm_op_SpecStableContent() __attribute__ ((nothrow));

    void _ssdm_op_SpecBindPort() __attribute__ ((nothrow));

    void _ssdm_op_SpecPipoDepth() __attribute__ ((nothrow));

    void _ssdm_SpecExpr() __attribute__ ((nothrow));
    void _ssdm_SpecExprBalance() __attribute__ ((nothrow));

    void _ssdm_SpecDependence() __attribute__ ((nothrow));

    void _ssdm_SpecLoopMerge() __attribute__ ((nothrow));
    void _ssdm_SpecLoopFlatten() __attribute__ ((nothrow));
    void _ssdm_SpecLoopRewind() __attribute__ ((nothrow));

    void _ssdm_SpecFuncInstantiation() __attribute__ ((nothrow));
    void _ssdm_SpecFuncBuffer() __attribute__ ((nothrow));
    void _ssdm_SpecFuncExtract() __attribute__ ((nothrow));
    void _ssdm_SpecConstant() __attribute__ ((nothrow));

    void _ssdm_DataPack() __attribute__ ((nothrow));
    void _ssdm_SpecDataPack() __attribute__ ((nothrow));

    void _ssdm_op_SpecBitsMap() __attribute__ ((nothrow));
    void _ssdm_op_SpecLicense() __attribute__ ((nothrow));
# 2 "<built-in>" 2
# 1 "ldrgen/rand_c/rand1.c" 2




__attribute__((sdx_kernel("fn1", 0))) unsigned int fn1(long p, long *p_4, unsigned int p_7, short p_9, float p_13,
                 long p_15, unsigned long p_21, unsigned short p_23)
{
#line 11 "/home/gabriel/Documents/UFRGS/RAISE/ahls_resource_estimation/tcl/run_hls_1.tcl"
#pragma HLSDIRECTIVE TOP name=fn1
# 7 "ldrgen/rand_c/rand1.c"

  long v_137;
  short v_135;
  short v_133;
  long v_131;
  char v_129;
  signed char v_127;
  char v_125;
  unsigned long long v_123;
  long v_121;
  unsigned short v_119;
  int v_117;
  long v_115;
  unsigned long v_113;
  long v_111;
  float v_109;
  char v_107;
  signed char v_105;
  unsigned long long v_103;
  short v_101;
  signed char v_99;
  long long v_97;
  unsigned short v_95;
  unsigned long v_93;
  char v_91;
  char v_89;
  unsigned long long v_87;
  float v_85;
  unsigned short v_83;
  unsigned long v_81;
  int v_79;
  signed char v_77;
  unsigned short v_75;
  long long v_73;
  unsigned short v_71;
  double v_69;
  int v_67;
  char v_65;
  short v_63;
  int v_61;
  int v_59;
  signed char v_57;
  unsigned long v_55;
  float v_53;
  long v_51;
  long v_49;
  unsigned int v_47;
  long v_45;
  long v_43;
  unsigned int v_41;
  char v_39;
  double v_37;
  long v_35;
  char v_33;
  unsigned short v_31;
  double v_29;
  unsigned short v_27;
  double v_25;
  unsigned int v_19;
  unsigned short v_17;
  float v_11;
  unsigned long v;
  unsigned int result;
  v_137 = -30976L;
  v_135 = (short)22050;
  v_133 = (short)-14163;
  v_131 = 44701L;
  v_129 = (char)p_15;
  v_127 = (signed char)-73;
  v_125 = (char)65;
  v_123 = 983230253ULL;
  v_121 = -42209L;
  v_119 = (unsigned short)26682;
  v_117 = -255237054;
  v_115 = (long)p_13;
  v_113 = (unsigned long)p_23;
  v_111 = (long)p_23;
  v_109 = 2990819584.f;
  v_107 = (char)p_15;
  v_105 = (signed char)-30;
  v_103 = 27543ULL;
  v_101 = (short)p_13;
  v_99 = (signed char)-76;
  v_97 = (long long)p_9;
  v_95 = (unsigned short)p_15;
  v_93 = (unsigned long)p_13;
  v_91 = (char)p_21;
  v_89 = (char)p;
  v_87 = (unsigned long long)p_15;
  v_85 = 399.138977051f;
  v_83 = (unsigned short)64593;
  v_81 = 18446744073709496774UL;
  v_79 = (int)p_7;
  v_77 = (signed char)p_13;
  v_75 = (unsigned short)p_7;
  v_73 = (long long)p_23;
  v_71 = (unsigned short)p_21;
  v_69 = 2.61417602636e+38;
  v_67 = (int)p_15;
  v_65 = (char)16;
  v_63 = (short)-20944;
  v_61 = (int)p_15;
  v_59 = -38063;
  v_57 = (signed char)*p_4;
  v_55 = (unsigned long)p_15;
  v_53 = (float)p_15;
  v_51 = *p_4;
  v_49 = -54281L;
  v_47 = 97225687U;
  v_45 = 48073L;
  v_43 = p_15;
  v_41 = (unsigned int)p;
  v_39 = (char)48;
  v_37 = (double)p_7;
  v_35 = 979630839L;
  v_33 = (char)p_15;
  v_31 = (unsigned short)p_15;
  v_29 = (double)p_23;
  v_27 = (unsigned short)31596;
  v_25 = -2754757364.32;
  v_19 = 3856U;
  v_17 = (unsigned short)p_7;
  v = (unsigned long)p_7;
  result = p_7;
  if ((unsigned long)((~ ((long)p_9 % (v_137 + 596L) ^ (long)((int)p_9 * v_67)) + 19354L) - (long)v_59) >
      2807478622UL + 1 % (unsigned long)(v_121 / -22L + 30L)) {
    if ((unsigned long long)(p_7 / 759620161U) + ((unsigned long long)(
                                                  (int)v_57 % (! v_67 + 250) >> (
                                                  (int)v_95 & 31)) |
                                                  18446744073709513414ULL % (unsigned long long)(
                                                  (int)v_65 + 970)) >
        ~ (0ULL - (unsigned long long)((long long)(p_15 % (v_51 + 526L)) - -328975596LL)) / (unsigned long long)(
        ((unsigned long)(! (v_45 - -1L) + ! ((long)v_75 % (p + 350L))) | 718371585UL) + 311UL)) {
      v_105 = (signed char)((18446744073709495619ULL << 46ULL) + (unsigned long long)v_27);
      v_51 = (long)(((unsigned int)((int)(p_13 * p_13) * (24080 * (int)((short)v_25))) / (
                     p_7 + 655U)) / (unsigned int)(- ((int)v_127 ^ (int)(~ p_9)) + 105)) + (
             ((long)((unsigned int)(v_61 % 515) + - p_7) - (p - (long)(
                                                            p_7 << (p_15 & 31L)))) -
             (long)((int)-2.89031246376e+38 - ! v_117) / 484L);
      v_121 = (long)(~ (! (v_61 / ((int)p_23 + 183) + (int)(! v_107)))) * (
              1 + p);
      v_61 = (int)(- (53802758ULL | (unsigned long long)(~ (! p_21))));
      v_57 = (signed char)(-43428L >> ((int)(- v_107) & 63));
    }
    else {
      v_71 = (unsigned short)(~ (v_121 + 56816L) / (long)((int)(! p_9) + 802));
      v_35 = (long)((unsigned long long)((long)(- (- (- p_13))) * ((long)v_57 * (
                                                                   -57L % (
                                                                   (*p_4 - (long)v_31) + 874L)))) + (
                    v_123 - 474550955ULL));
      v_27 = (unsigned short)(((long long)*p_4 - (458769995LL - (long long)(
                                                  -64L - p))) % (long long)(
                              (((long)p_9 - ((long)p_23 - p)) << ((int)((unsigned short)(
                                                                  -704.848999023f / (
                                                                  (float)v_113 + 476.f))) * (int)v_75 & 63)) + 28L) - -329939584LL);
      v_49 = (long)(! (- (13118UL % ((unsigned long)v_27 / 18446744073368103300UL + 333UL)) * (unsigned long)(
                       0L % (v_35 + 231L))));
      v_27 = (unsigned short)((long)(- (3408171520.f + (float)(18446744073709502464ULL & (unsigned long long)v_81)) - (float)(
                                     1LL + ((long long)((int)p_9 - (int)p_9) |
                                            (long long)*p_4 / -23335LL))) - ~ (- (
                              p / (p + 215L))));
    }
    if (1) {
      v_69 = (double)(~ (- (- (! v) + (unsigned long)(- (451372111L * v_51)))));
      v_29 = (double)((long)(- (- (- ((float)*p_4 * v_85)))) % (~ (*p_4 >> (
                                                                   (v_73 * (long long)v_75 - (long long)v_19) & 63LL)) + 907L));
      v_47 = (unsigned int)(~ (! -384090662LL));
      v_91 = (char)v_35;
      v_53 = (float)((long)((int)p_9 + ((int)v_39 - ((int)p_23 - (int)v_119) / 57767)) + - *p_4);
    }
    else {
      v_31 = (unsigned short)((50026996ULL * (unsigned long long)(18446744073709493866UL / (unsigned long)(
                                                                  p / 113L + 86L))) / (unsigned long long)(
                              (((long)v_69 % ((*p_4 + (long)p_23) + 772L)) % (
                               v_35 + 168L) - (long)(- p_23)) + 288L));
      v_49 = (long)p_9;
      v_81 = (unsigned long)v_63;
      v_43 = (long)((double)p_9 / ((double)((unsigned long long)((long long)(! v_61) % 9LL) * (unsigned long long)v) * (
                                   v_69 - (double)(! p_23)) + 100.));
      v_39 = (char)((unsigned long)((int)v_119 * (~ v_117 * (-34 / ((int)p_9 + 806))) + 163) - ! (! (
                    p_21 / 98UL)));
    }
    if ((int)v_31 <= (int)((unsigned short)((double)p_13 * v_69 - (double)(
                                            (unsigned long long)(~ v_43 - 4294907527L) / (
                                            (136ULL + (unsigned long long)(
                                             (unsigned int)v_91 - 59621U)) + 40ULL) + (unsigned long long)(
                                            18446744073709523382UL + (unsigned long)(
                                            ((unsigned int)v_105 + p_7) + (unsigned int)(
                                            (int)v_95 + (int)v_63))))))) {
      v_45 = (long)(! (- (v_81 % (unsigned long)((int)((double)v_111 / (
                                                       v_25 + 137.)) % (
                                                 v_79 / ((int)p_9 + 382) + 109) + 458))));
      v_97 = (long long)(~ p_7);
      v_51 = -2069875L;
      v_61 = (int)v_41;
      v_115 = (long)((long long)v_39 * (! v_73 % 108LL));
    }
    else {
      v_125 = (char)((unsigned long long)((unsigned int)(- ((double)v_57 + -2.00123967931e+38)) + 12397U) * v_87 - (unsigned long long)(
                     ((unsigned long)(~ v_105) * - (p_21 * (unsigned long)p_7)) * (unsigned long)v_79));
      v_109 = (float)(v_87 << ((unsigned long)(p / (long)((int)(- v_39) + 245)) / (
                               (unsigned long)v_31 % (((18446744073555282111UL + (unsigned long)v_35) + (unsigned long)(
                                                       (unsigned int)v_117 * p_7)) + 307UL) + 550UL) & 63UL));
      v_81 = (unsigned long)((long long)((long)((int)((unsigned short)(- (
                                                127. - v_29))) % ((int)p_23 + 313)) * (
                                         ((v_115 + 59925L) | (long)p_13) / 97L)) | ! (
                             -54823LL & (long long)(105U - ((unsigned int)p_23 + p_7))));
      v_75 = (unsigned short)(! 931797419UL);
      result = (unsigned int)(~ v_93 % 109UL);
    }
    if ((float)((((unsigned long long)(((long long)v_19 * 48787LL) * -29448LL) ^ v_123) / (unsigned long long)(
                 ~ ((long)(4294967207U / (result + 831U)) - ((long)v_127 | v_121)) + 911L)) * (unsigned long long)(! (
                (int)v_27 - - ((int)p_23 / ((int)p_23 + 188))))) >= (float)(
                                                                    (long)p_13 + (
                                                                    (long)p_13 - ~ (
                                                                    541812950L * (long)v_101))) - - (
                                                                    (float)(- (- v_99)) + p_13)) {
      v_71 = (unsigned short)(((unsigned long long)p_23 / (- (18446744072807235575ULL % (unsigned long long)(
                                                              (int)p_23 + 1009)) + 487ULL)) / 18446744073709551591ULL - (unsigned long long)(
                              ~ v_43 / (long)(! ((unsigned int)(! v_101) + p_7) + 232U)));
      v_29 = (double)(! (52949L / ((- p - (long)v_39 * p) + 840L)) << (
                      p_7 / (unsigned int)((int)p_9 + 614) & 63U));
      v = 18446744073709551615UL % (- v_81 + 1001UL) + (unsigned long)(~ (
          ! ((int)v_65 / 196476570) / ((int)p_23 + 1000)));
      v_67 = 33421;
      v_25 = (double)((long)p_9 + (long)v_91 / (~ *p_4 / 4294957762L + 550L));
    }
    else {
      v_111 = (long)(((62473ULL * (unsigned long long)(-434457168LL * (long long)p_7) - (unsigned long long)(
                       (long)((int)v_105 >> 2U) & -913619743L)) | (unsigned long long)(
                      (unsigned long)(- ((double)v_101 - v_29)) * - v_55)) &
                     (~ (18446744073709499436ULL - (unsigned long long)v_121) + (unsigned long long)(
                      (int)(~ v_75) / ((int)((unsigned short)1.02904233077e+38) + 499))) * (unsigned long long)p_15);
      v_117 = (int)(! p * (~ (((long)p_23 - v_111) - p_15 % (long)((int)v_39 + 649)) % (
                           (v_35 & 9343327232L) * *p_4 + 965L)));
      v_25 = (double)0;
      v_55 = (unsigned long)p_13;
      v_79 = (int)(- (! ((unsigned long long)v_119 % (((unsigned long long)*p_4 & v_103) + 939ULL) + 6357ULL)));
    }
    VITIS_LOOP_246_1: while ((double)(- (((unsigned long long)(~ (- p_15)) - v_123) / (unsigned long long)(
                       (3675141841UL - (v_93 - (unsigned long)3.19713662138e+38)) * 18446744073709551599UL + 261UL))) != 510.116660822) {
      v_117 = (int)v_127 * (int)((signed char)-797.719652835);
      v_45 = (long)v_77;
      v_107 = (char)((long)v_125 - ~ (! ((long)v_117 + *p_4) - (long)(
                                      (double)(- p_15) + (double)p_21 * 1034047168.92)));
      v_127 = (signed char)(~ p_9);
      v_77 = (signed char)v_115;
      v_123 = 679767266ULL;
    }
    while_0_break: ;
  }
  else {
    v_57 = (signed char)((unsigned long long)(- (((unsigned long)p_7 + p_21) * (unsigned long)p_9) % (unsigned long)(
                                              (- (112 * (int)v_27) ^ -44962816) + 837)) | (unsigned long long)(
                         (long long)(v_25 - (double)(-805.171936035f + (
                                                     (float)p_15 + p_13))) -
                         21328LL % (! ((long long)v_83 * v_97) + 923LL)));
    VITIS_LOOP_264_2: while (~ ((-32340LL + (long long)(*p_4 + (long)v_57) % ((v_97 - 53LL) + 978LL)) * (long long)(
              - (*p_4 + (long)v_105) * (long)v_57)) > (long long)((long)(
                                                                  (double)(- p_13) * (
                                                                  (double)v_93 - - (
                                                                  (double)v_45 - -6.5388465082e+37))) | ! p_15)) {
      v_103 = (unsigned long long)v_137 % 18446744073409734113ULL;
      v_75 = (unsigned short)((unsigned long long)(- (! v_75)) ^ (unsigned long long)(
                              (unsigned long)v_33 * 18446744073709511987UL));
      v_97 = (long long)((unsigned long long)v_113 % (((unsigned long long)(
                                                       ((unsigned long)(
                                                        (unsigned int)p_23 / (
                                                        v_19 + 224U)) % (
                                                        ((unsigned long)v_109 - v_93) + 183UL)) % 18446744073709551495UL) + (unsigned long long)v_73) + 635ULL));
      v_85 = -763.936889648f;
      v_35 = (long)(~ ((int)v_65 % ((int)((char)4756151296.f) + 908)) >> 20) - 468917089L;
      v_57 = (signed char)((unsigned long)((long)v_61 / (((v_111 - (long)v_119) | (long)(
                                                          p_7 - 244U)) + 575L) >> (
                                           (7543L + (long)(~ ((int)v_77 / (
                                                              (int)v_71 + 326)))) & 63L)) / (
                           - (- v_113 + (unsigned long)((int)(- v_91) + (
                                                        (int)p_9 + 242))) + 487UL));
    }
    while_0_break_0: ;
    VITIS_LOOP_287_3: while (v_131 != p) {
      v_19 = (unsigned int)((float)v_135 / (((float)v_133 + -6942157824.f) + 679.f));
      v_105 = (signed char)((v_93 % (unsigned long)(- (4294964340U % (
                                                       p_7 + 613U)) + 723U)) * (unsigned long)v_47);
      v_27 = (unsigned short)((double)((unsigned long long)((double)(! v_39) / (
                                                            (0. + (double)v_85 * v_37) + 821.)) + (
                                       (unsigned long long)v_63 * ~ v_87 + (unsigned long long)(
                                       (int)(- v_99) | (int)p_9))) + -897.546144253);
      v_123 = (unsigned long long)(! (~ p_15));
      v_99 = (signed char)p_23;
      v_131 = (long)((! (- v_123) % (unsigned long long)((((unsigned long)*p_4 + v_113) / (unsigned long)(
                                                          p_7 / 27625U + 354U) + (unsigned long)v_131) + 645UL)) * (unsigned long long)(~ p_23));
    }
    while_0_break_1: ;
    v_41 = (unsigned int)-2.04978643066e+37;
    VITIS_LOOP_302_4: while ((unsigned long long)(-4165 ^ - v_67) + ((unsigned long long)(
                                                   (- v_81 * (unsigned long)result) % (unsigned long)(
                                                   (long)(- v_79) / (
                                                   (*p_4 & 66L) + 391L) + 187L)) ^
                                                   (unsigned long long)(- (
                                                   196 * v_61)) % (((unsigned long long)p_15 + (
                                                                    (unsigned long long)v_93 - 31173ULL)) + 621ULL)) <= (unsigned long long)(
           (unsigned long)(! (*p_4 * (long)v_101 + v_111) + p_15) / (
           (((624166419UL | (unsigned long)v_79) ^ (unsigned long)(p % (
                                                                   p_15 + 31L) - -258L)) + (
            (unsigned long)(((long)v_33 % (p_15 + 887L)) * -723027697L) &
            p_21 * 2256UL)) + 784UL))) {
      v_19 = (unsigned int)(v_131 ^ 953956190L);
      v_35 = (long)p_13;
      v_91 = (char)((long)v_71 % ((- (p_15 % (long)((int)v_107 + 112)) / (
                                   ! (p_15 % (long)(p_7 + 4U)) + 713L)) % 5127L + 289L));
      v_37 = (double)((int)p_23 * (int)((unsigned short)((double)((unsigned long long)(
                                                                  (long)(
                                                                  (unsigned int)v_91 % 4294935298U) / (
                                                                  ((long)p_9 | p_15) + 961L)) + (
                                                                  v_87 + (unsigned long long)(
                                                                  52364UL / (
                                                                  p_21 + 473UL)))) + v_29)));
      v_57 = (signed char)90;
      v_61 = (int)v_129;
    }
    while_0_break_2: ;
  }
  v_39 = (char)(4132443062U % (unsigned int)((((int)v_65 - v_117) * (int)v_99 + (int)p_23) * 7154 + 192));
  if ((((p_21 - (unsigned long)(3551042575L + v_45)) >> (- (82321540ULL + (unsigned long long)p_23) & 63ULL)) + (unsigned long)(
       (double)((p_15 | (long)v_107) ^ (long)((unsigned int)v_33 + 427941859U)) * v_37)) / (unsigned long)(
      (int)v_77 + 27) >= (unsigned long)v_125) {
    VITIS_LOOP_334_5: while (0ULL >= (unsigned long long)((unsigned long)(28528. * v_29) - (
                                        ~ p_21 - 2820UL))) {
      v_61 = (int)(v_73 + (long long)-2.53662233139e+38);
      result = (unsigned int)((unsigned long long)((unsigned long)v_45 % (
                                                   - (- p_21 / (unsigned long)(
                                                      ~ p_7 + 140U)) + 212UL)) / (
                              ((unsigned long long)((long long)p % (! (
                                                                    -45191LL - (long long)p_13) + 1014LL)) - (unsigned long long)(
                               - (- p_21) / 829908UL)) + 958ULL));
      v_51 = 737778495L;
      v_69 = (double)((unsigned long)p_7 - (p_21 & (unsigned long)p) / (unsigned long)(
                                           ! (~ (~ *p_4)) + 819L));
      v_73 = (long long)(~ (((unsigned long)((-31478 << (p_21 & 31UL)) - (int)(- v_33)) + (
                             18446744073646822943UL | (unsigned long)p_7)) | 31UL));
      v_29 = (double)((unsigned long long)(p_7 | 4294923820U) + (unsigned long long)(
                                                                ((unsigned long)(
                                                                 30231 >> (
                                                                 (int)p_9 & 31)) / (
                                                                 (p_21 - p_21) + 4UL)) / (
                                                                (unsigned long)v_75 / (
                                                                ~ p_21 + 775UL) + 965UL)) * ! (
                                                                (18446744073709543705ULL / (unsigned long long)(
                                                                 (int)v_33 + 132)) % (unsigned long long)(
                                                                (unsigned long)*p_4 % (
                                                                v + 516UL) + 515UL)));
    }
    while_0_break_3: ;
    VITIS_LOOP_361_6: while ((unsigned long long)((long long)(- result) * ((long long)(! ((unsigned int)-3492727040.f)) / (
                                                         (long long)(
                                                         (long)((int)((unsigned char)v_37) % 73) * (
                                                         v_49 / 29652L)) / (
                                                         (-13007LL >> (
                                                          (int)(~ p_23) & 63)) + 969LL) + 109LL))) > (unsigned long long)(! (~ (
           (unsigned long)p_7 / (30567UL / ((unsigned long)-2.95772171796e+38 + 854UL) + 242UL))))) {
      v_31 = (unsigned short)((int)v_71 - ((int)v_65 - (int)v_63 / ((
                                                                    v_61 & 1051541428) + 96)));
      v_51 = (long)((unsigned long long)((unsigned int)((int)((short)v_37) - -31073) + 4294914614U) * (
                    (331812325ULL * (unsigned long long)v_55 | 16414ULL) % (unsigned long long)(
                    v_55 + 252UL) + (unsigned long long)(v_69 + (double)(
                                                         (long)(result & (unsigned int)v_27) / (
                                                         (*p_4 + (long)p_13) + 802L)))));
      v_55 = 60888UL;
      v_39 = (char)(! ((unsigned long)(! ((int)((unsigned short)p_13) << 9) * (
                                       (int)((signed char)(- v_29)) | 97)) % (
                       ((p_21 >> (v_59 & 63)) % (unsigned long)(((int)v_33 + -30152) + 971)) * (unsigned long)(
                       (int)(! v_33) / (v_67 + 490)) + 704UL)));
      v_59 = -944052153;
      result = (unsigned int)(- ((double)((~ v_43 + ! p_15) << 50UL) - (
                                 - ((double)v_39 - -5523161987.15) - (double)(
                                 ((unsigned long)2.75443107876e+37 + v) * (
                                 (unsigned long)v_49 * v_55)))));
    }
    while_0_break_4: ;
    VITIS_LOOP_387_7: while (((long)(~ ((int)v_39 - 50016)) - ((long)(v_41 * (unsigned int)p_23) * *p_4) / (
                                            v_43 * (long)(! p_7) + 5L)) - ~ v_45 == (long)p_9) {
      v_37 = (double)(v_49 - (long)(v_47 % 52540U));
      v_53 = (float)(~ (! (! ((int)p_9 / ((int)v_31 + 177))) % ((int)((signed char)370.925601961) / (
                                                                (int)v_57 + 25) + 159)));
      v_49 = (long)((float)p_21 * ((v_53 + (float)((18446744073709497956ULL % (unsigned long long)(
                                                    p + 293L)) * 18956ULL)) * (float)v_55));
      v_29 = (double)(~ (short)-21947);
      v_47 = (unsigned int)v_51;
      v_41 = (unsigned int)(! v_45);
    }
    while_0_break_5: ;
    if (~ ((int)((unsigned short)((float)(~ ((unsigned long long)p_13 - 65148ULL)) - -87.5666732788f)) % (
           (int)v_31 + 58)) > (int)((double)p_15 / (- ((double)((long long)v_33 * -648575014LL) + -106.797120795) + 133.)) + ~ (
                              (int)((unsigned char)((double)(p_15 + v_35) * v_37)) % 63)) {
      v_25 = (double)((int)((double)p * (((double)p_13 - ((double)p_13 - v_29)) * 8.05871093107e+37)) / (
                      ((int)p_9 * (int)(! (~ p_23)) >> 14ULL) + 507));
      result = (unsigned int)(! v_27);
      v_19 = (unsigned int)(- ((unsigned long)p_9 * ((unsigned long)(
                                                     (p_15 << 52LL) + (long)(- v_25)) +
                                                     (unsigned long)(
                                                     p % (long)(result + 572U)) / (
                                                     (978680212UL + (unsigned long)*p_4) + 688UL))));
      v_17 = (unsigned short)(! (3275551L - ! p) / -92L);
      v_11 = (float)((unsigned long long)((unsigned long)(- (- (p_15 - (long)v_17))) / (
                                          7UL % ((unsigned long)(! v_19) * p_21 + 674UL) + 662UL)) - (unsigned long long)(
                     49946LL * ~ ((long long)p_23 + 799449855LL) ^ (long long)1.34356664525e+38f));
    }
    else v_11 = (float)(unsigned char)193;
    v = (unsigned long)((float)(((long long)(-389 ^ (int)(~ p_9)) & -342330013LL) + -544981120LL) -
                        v_11 / (- p_13 + 820.f));
  }
  else {
    if (- v_45 <= 568460657L) {
      v_107 = (char)((float)((unsigned long)v_61 & (unsigned long)(~ (- v_119)) * p_21) + (
                     - (- p_13) / ((float)((v_121 + 60L) % (long)(247U * result + 178U)) + 474.f) - (float)(
                     (int)p_23 << (! *p_4 & 15L))));
      v_97 = 0LL % ((long long)v_115 * ((long long)((int)p_13 % (v_67 + 599)) * v_97) + 632LL) - (long long)(- (- (
             - v_117 - 55396)));
      v_89 = (char)(0UL - ~ (((unsigned long)v_71 * (v_113 / (unsigned long)(
                                                     (int)v_91 + 100))) / (
                             (unsigned long)(~ v_59) + 753UL)));
      v_93 = 3397887761UL;
      v_79 = (int)p_9;
    }
    else {
      v_97 = (long long)v_115;
      v_89 = (char)((float)(~ ((unsigned long)(- ((int)v_27 * (int)v_95)) / (
                               ((unsigned long)((int)v_125 % ((int)p_23 + 851)) -
                                v_113 * (unsigned long)p_15) + 982UL))) + - p_13);
      v_95 = (unsigned short)(1.56329453548e+14 * (double)(-8582765568.f * (float)((unsigned long long)v_121)));
      v_83 = (unsigned short)p_9;
      v_101 = (short)(((long long)v_19 + ((long long)(~ *p_4 + (long)(
                                                      (int)v_33 | -26689388)) - (
                                          (long long)(! p_15) + -1065928526LL))) - (long long)(
                      (long)p_9 - ~ (~ p) / (long)(((result | (unsigned int)v_25) + (unsigned int)(
                                                    (float)v_123 + p_13)) + 979U)));
    }
    VITIS_LOOP_445_8: while ((float)((unsigned long long)v_85 + ((unsigned long long)((int)((char)(- (
                                                                    (float)p_9 - v_53))) * -120) -
                                               ((57233ULL * v_87) / 18446744073709545971ULL) * (unsigned long long)(
                                               (unsigned long)(! v_89) * ! p_21))) < p_13) {
      v_111 = (long)((unsigned long long)v_105 - v_103 * (unsigned long long)(
                                                 (long long)v_101 + (
                                                 (long long)v_99 & (v_97 >> (
                                                                    (
                                                                    v_93 - (unsigned long)(
                                                                    (int)v_91 % (
                                                                    (int)((char)-2546257751.49) + 592))) & 63UL)))));
      v_109 = (float)4294956250U;
      v_89 = v_89;
      v_83 = (unsigned short)((p_21 * (unsigned long)(53U * (p_7 / (unsigned int)(
                                                             (int)p_23 + 1007))) | 576932820UL) * (unsigned long)(
                              1U - (~ ((unsigned int)p_9 - 324601457U) - (unsigned int)(
                                    26879 | (int)v_107))));
      v_97 = (long long)((unsigned long long)((unsigned long)(- ((long)(~ p_23) + *p_4)) + - (
                                              (unsigned long)(v_111 + p_15) + 910707358080UL)) / 913ULL);
      v_87 = (unsigned long long)(- ((float)(~ v_107) - (v_109 - (float)v_17) * (float)(- (
                                                        p % (long)((int)v_95 + 527)))));
    }
    while_0_break_6: ;
    v_81 = 117UL;
    v_77 = (signed char)((unsigned long)((int)p_23 - v_79) * ((((unsigned long)-2.4607110678e+38 +
                                                                (unsigned long)p_23 * v_81) % (unsigned long)(
                                                               ! (p_15 - 24165L) + 375L)) / (unsigned long)(
                                                              ~ (- (-8220 + (int)v_83)) + 309)));
    v = (unsigned long)(~ (21 % ((int)v_77 + 700)));
  }
  result = (unsigned int)(- ((unsigned long)(~ p / -27473L + *p_4) / (
                             ! (! v) % (unsigned long)((int)((unsigned short)(
                                                       (double)p_7 + 753.504256295)) % 42950 + 311) + 91UL)));
  return result;
}
