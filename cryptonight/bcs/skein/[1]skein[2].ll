; ModuleID = 'skein/[1]skein[2].bc'
source_filename = "skein.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-emscripten"

%union.anon.1 = type { [16 x i64] }
%union.anon.0 = type { [8 x i64] }
%struct.hashState = type { i32, %union.anon }
%union.anon = type { %struct.Skein1024_Ctxt_t }
%struct.Skein1024_Ctxt_t = type { %struct.Skein_Ctxt_Hdr_t, [16 x i64], [128 x i8] }
%struct.Skein_Ctxt_Hdr_t = type { i32, i32, [2 x i64] }
%struct.Skein_512_Ctxt_t = type { %struct.Skein_Ctxt_Hdr_t, [8 x i64], [64 x i8] }
%struct.Skein_256_Ctxt_t = type { %struct.Skein_Ctxt_Hdr_t, [4 x i64], [32 x i8] }

@SKEIN_256_IV_128 = hidden local_unnamed_addr constant [4 x i64] [i64 -2228972824489528736, i64 -8629553674646093540, i64 1155188648486244218, i64 -3677226592081559102], align 16
@SKEIN_256_IV_160 = hidden local_unnamed_addr constant [4 x i64] [i64 1450197650740764312, i64 3081844928540042640, i64 -3136097061834271170, i64 3301952811952417661], align 16
@SKEIN_256_IV_224 = hidden local_unnamed_addr constant [4 x i64] [i64 -4176654842910610933, i64 -8688192972455077604, i64 -7364642305011795836, i64 4056579644589979102], align 16
@SKEIN_256_IV_256 = hidden local_unnamed_addr constant [4 x i64] [i64 -243853671043386295, i64 3443677322885453875, i64 -5531612722399640561, i64 7662005193972177513], align 16
@SKEIN_512_IV_128 = hidden local_unnamed_addr constant [8 x i64] [i64 -6288014694233956526, i64 2204638249859346602, i64 3502419045458743507, i64 -4829063503441264548, i64 983504137758028059, i64 1880512238245786339, i64 -6715892782214108542, i64 7602827311880509485], align 16
@SKEIN_512_IV_160 = hidden local_unnamed_addr constant [8 x i64] [i64 2934123928682216849, i64 -4399710721982728305, i64 1684584802963255058, i64 5744138295201861711, i64 2444857010922934358, i64 -2807833639722848072, i64 -5121587834665610502, i64 118355523173251694], align 16
@SKEIN_512_IV_224 = hidden local_unnamed_addr constant [8 x i64] [i64 -3688341020067007964, i64 -3772225436291745297, i64 -8300862168937575580, i64 4146387520469897396, i64 1106145742801415120, i64 7455425944880474941, i64 -7351063101234211863, i64 -7048981346965512457], align 16
@SKEIN_512_IV_256 = hidden local_unnamed_addr constant [8 x i64] [i64 -3688372635733115373, i64 -1714305546867594773, i64 6174048478977683055, i64 3037510430686418139, i64 -1439460426187442557, i64 -1755217697375493551, i64 -4364063934328942203, i64 4534485012945173523], align 16
@SKEIN_512_IV_384 = hidden local_unnamed_addr constant [8 x i64] [i64 -6631894876634615969, i64 -5692838220127733084, i64 -7099962856338682626, i64 -2911352911530754598, i64 2000907093792408677, i64 9140007292425499655, i64 6093301768906360022, i64 2769176472213098488], align 16
@SKEIN_512_IV_512 = hidden local_unnamed_addr constant [8 x i64] [i64 5261240102383538638, i64 978932832955457283, i64 -8083517948103779378, i64 -7339365279355032399, i64 6752626034097301424, i64 -1531723821829733388, i64 -7417126464950782685, i64 -5901786942805128141], align 16
@SKEIN1024_IV_384 = hidden local_unnamed_addr constant [16 x i64] [i64 5837428971662821941, i64 -77746587483573990, i64 900859593031937393, i64 6971917825029607926, i64 -7559622524543075272, i64 -1765165783650722502, i64 8752823626657968186, i64 -5660247751832163781, i64 -3910107424281834900, i64 7318511266817254644, i64 -7729085808744889952, i64 4520476160478215494, i64 3311569644924470594, i64 4276842053204993302, i64 5209429820118383841, i64 3248055513497972714], align 16
@SKEIN1024_IV_512 = hidden local_unnamed_addr constant [16 x i64] [i64 -3824666188867495144, i64 -6909913791333144574, i64 3712096742784706693, i64 3984272818902412828, i64 -2367309134422507017, i64 -2017541630624335406, i64 -6457364471635691082, i64 -393073417188227238, i64 -9000745610408761450, i64 374513177534108088, i64 -4325444532422210701, i64 -4769659705168547026, i64 6096323936832144519, i64 7423911797997213718, i64 -5058341743932990511, i64 1020417949955017076], align 16
@SKEIN1024_IV_1024 = hidden local_unnamed_addr constant [16 x i64] [i64 -3056859997349141675, i64 1564408309651595276, i64 5872946452714669296, i64 269443931446226863, i64 2066808069366720664, i64 7949147512366979231, i64 8638675932900051674, i64 -4531151511243411293, i64 -2967508242827928907, i64 7681746768227630605, i64 -7907258758156315854, i64 1882256010534388436, i64 690868493690407864, i64 7310148287346284186, i64 7060852991742072730, i64 2152812356051330361], align 16

; Function Attrs: nofree norecurse nounwind
define hidden void @Skein_Put64_LSB_First(i8* nocapture %dst, i64* nocapture readonly %src, i32 %bCnt) local_unnamed_addr #0 {
entry:
  %cmp8 = icmp eq i32 %bCnt, 0
  br i1 %cmp8, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %n.09 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %shr = lshr i32 %n.09, 3
  %arrayidx = getelementptr inbounds i64, i64* %src, i32 %shr
  %0 = load i64, i64* %arrayidx, align 8, !tbaa !2
  %and = shl i32 %n.09, 3
  %mul = and i32 %and, 56
  %sh_prom = zext i32 %mul to i64
  %shr1 = lshr i64 %0, %sh_prom
  %conv = trunc i64 %shr1 to i8
  %arrayidx2 = getelementptr inbounds i8, i8* %dst, i32 %n.09
  store i8 %conv, i8* %arrayidx2, align 1, !tbaa !6
  %inc = add nuw i32 %n.09, 1
  %exitcond = icmp eq i32 %inc, %bCnt
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree norecurse nounwind
define hidden void @Skein_Get64_LSB_First(i64* nocapture %dst, i8* nocapture readonly %src, i32 %wCnt) local_unnamed_addr #0 {
entry:
  %mul = shl i32 %wCnt, 3
  %cmp54 = icmp eq i32 %mul, 0
  br i1 %cmp54, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %n.055 = phi i32 [ %add35, %for.body ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds i8, i8* %src, i32 %n.055
  %0 = load i8, i8* %arrayidx, align 1, !tbaa !6
  %conv = zext i8 %0 to i64
  %add = or i32 %n.055, 1
  %arrayidx1 = getelementptr inbounds i8, i8* %src, i32 %add
  %1 = load i8, i8* %arrayidx1, align 1, !tbaa !6
  %conv2 = zext i8 %1 to i64
  %shl = shl nuw nsw i64 %conv2, 8
  %add3 = or i64 %shl, %conv
  %add4 = or i32 %n.055, 2
  %arrayidx5 = getelementptr inbounds i8, i8* %src, i32 %add4
  %2 = load i8, i8* %arrayidx5, align 1, !tbaa !6
  %conv6 = zext i8 %2 to i64
  %shl7 = shl nuw nsw i64 %conv6, 16
  %add8 = or i64 %add3, %shl7
  %add9 = or i32 %n.055, 3
  %arrayidx10 = getelementptr inbounds i8, i8* %src, i32 %add9
  %3 = load i8, i8* %arrayidx10, align 1, !tbaa !6
  %conv11 = zext i8 %3 to i64
  %shl12 = shl nuw nsw i64 %conv11, 24
  %add13 = or i64 %add8, %shl12
  %add14 = or i32 %n.055, 4
  %arrayidx15 = getelementptr inbounds i8, i8* %src, i32 %add14
  %4 = load i8, i8* %arrayidx15, align 1, !tbaa !6
  %conv16 = zext i8 %4 to i64
  %shl17 = shl nuw nsw i64 %conv16, 32
  %add18 = or i64 %add13, %shl17
  %add19 = or i32 %n.055, 5
  %arrayidx20 = getelementptr inbounds i8, i8* %src, i32 %add19
  %5 = load i8, i8* %arrayidx20, align 1, !tbaa !6
  %conv21 = zext i8 %5 to i64
  %shl22 = shl nuw nsw i64 %conv21, 40
  %add23 = or i64 %add18, %shl22
  %add24 = or i32 %n.055, 6
  %arrayidx25 = getelementptr inbounds i8, i8* %src, i32 %add24
  %6 = load i8, i8* %arrayidx25, align 1, !tbaa !6
  %conv26 = zext i8 %6 to i64
  %shl27 = shl nuw nsw i64 %conv26, 48
  %add28 = add i64 %add23, %shl27
  %add29 = or i32 %n.055, 7
  %arrayidx30 = getelementptr inbounds i8, i8* %src, i32 %add29
  %7 = load i8, i8* %arrayidx30, align 1, !tbaa !6
  %conv31 = zext i8 %7 to i64
  %shl32 = shl nuw i64 %conv31, 56
  %add33 = add i64 %add28, %shl32
  %div = lshr exact i32 %n.055, 3
  %arrayidx34 = getelementptr inbounds i64, i64* %dst, i32 %div
  store i64 %add33, i64* %arrayidx34, align 8, !tbaa !2
  %add35 = add nuw i32 %n.055, 8
  %cmp = icmp ult i32 %add35, %mul
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; Function Attrs: nounwind
define hidden i32 @skein(i32 %hashbitlen, i8* readonly %data, i32 %databitlen, i8* nocapture %hashval) local_unnamed_addr #2 {
entry:
  %X.i48.i = alloca [16 x i64], align 16
  %X.i1.i = alloca [4 x i64], align 16
  %X.i.i = alloca [8 x i64], align 16
  %b.i = alloca i8, align 1
  %cfg.i1.i = alloca %union.anon.1, align 8
  %cfg.i.i = alloca %union.anon.0, align 8
  %state = alloca %struct.hashState, align 8
  %0 = bitcast %struct.hashState* %state to i8*
  call void @llvm.lifetime.start.p0i8(i64 288, i8* nonnull %0) #3
  %cmp.i = icmp slt i32 %hashbitlen, 513
  %statebits.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 0
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %entry
  store i32 512, i32* %statebits.i, align 8, !tbaa !7
  %u.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1
  %1 = bitcast %union.anon.0* %cfg.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %1) #3
  %hashBitLen1.i.i = getelementptr %union.anon, %union.anon* %u.i, i32 0, i32 0, i32 0, i32 0
  store i32 %hashbitlen, i32* %hashBitLen1.i.i, align 8, !tbaa !10
  %2 = add i32 %hashbitlen, -224
  %3 = lshr i32 %2, 5
  %4 = shl i32 %2, 27
  %5 = or i32 %3, %4
  switch i32 %5, label %sw.default.i.i [
    i32 9, label %sw.bb.i.i
    i32 5, label %sw.bb2.i.i
    i32 1, label %sw.bb5.i.i
    i32 0, label %sw.bb8.i.i
  ]

sw.bb.i.i:                                        ; preds = %if.then.i
  %6 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 1, i32 0
  %7 = bitcast i64* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 8 dereferenceable(64) %7, i8* nonnull align 16 dereferenceable(64) bitcast ([8 x i64]* @SKEIN_512_IV_512 to i8*), i32 64, i1 false) #3
  br label %Skein_512_Init.exit.i

sw.bb2.i.i:                                       ; preds = %if.then.i
  %8 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 1, i32 0
  %9 = bitcast i64* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 8 dereferenceable(64) %9, i8* nonnull align 16 dereferenceable(64) bitcast ([8 x i64]* @SKEIN_512_IV_384 to i8*), i32 64, i1 false) #3
  br label %Skein_512_Init.exit.i

sw.bb5.i.i:                                       ; preds = %if.then.i
  %10 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 1, i32 0
  %11 = bitcast i64* %10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 8 dereferenceable(64) %11, i8* nonnull align 16 dereferenceable(64) bitcast ([8 x i64]* @SKEIN_512_IV_256 to i8*), i32 64, i1 false) #3
  br label %Skein_512_Init.exit.i

sw.bb8.i.i:                                       ; preds = %if.then.i
  %12 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 1, i32 0
  %13 = bitcast i64* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 8 dereferenceable(64) %13, i8* nonnull align 16 dereferenceable(64) bitcast ([8 x i64]* @SKEIN_512_IV_224 to i8*), i32 64, i1 false) #3
  br label %Skein_512_Init.exit.i

sw.default.i.i:                                   ; preds = %if.then.i
  %ctx_512.i = bitcast %union.anon* %u.i to %struct.Skein_512_Ctxt_t*
  %14 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 2, i32 0
  store i64 0, i64* %14, align 8, !tbaa !2
  %15 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 2, i32 1
  store i64 -4323455642275676160, i64* %15, align 8, !tbaa !2
  %16 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 1
  store i32 0, i32* %16, align 4, !tbaa !14
  %arrayidx16.i.i = getelementptr inbounds %union.anon.0, %union.anon.0* %cfg.i.i, i32 0, i32 0, i32 0
  store i64 6001118190787100672, i64* %arrayidx16.i.i, align 8, !tbaa !6
  %conv.i.i = zext i32 %hashbitlen to i64
  %shl.i.i = shl i64 %conv.i.i, 56
  %17 = shl i64 %conv.i.i, 40
  %shl19.i.i = and i64 %17, 71776119061217280
  %or.i.i = or i64 %shl19.i.i, %shl.i.i
  %18 = shl nuw nsw i64 %conv.i.i, 24
  %shl23.i.i = and i64 %18, 280375465082880
  %or24.i.i = or i64 %or.i.i, %shl23.i.i
  %shr26.i.i = lshr i64 %conv.i.i, 24
  %shl28.i.i = shl nuw nsw i64 %shr26.i.i, 32
  %or29.i.i = or i64 %or24.i.i, %shl28.i.i
  %arrayidx50.i.i = getelementptr inbounds %union.anon.0, %union.anon.0* %cfg.i.i, i32 0, i32 0, i32 1
  store i64 %or29.i.i, i64* %arrayidx50.i.i, align 8, !tbaa !6
  %arrayidx52.i.i = getelementptr inbounds %union.anon.0, %union.anon.0* %cfg.i.i, i32 0, i32 0, i32 2
  %19 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 1, i32 0
  %20 = bitcast i64* %19 to i8*
  %21 = bitcast i64* %arrayidx52.i.i to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(48) %21, i8 0, i64 48, i1 false) #3
  call void @llvm.memset.p0i8.i32(i8* nonnull align 8 dereferenceable(64) %20, i8 0, i32 64, i1 false) #3
  call fastcc void @Skein_512_Process_Block(%struct.Skein_512_Ctxt_t* nonnull %ctx_512.i, i8* nonnull %1, i32 1, i32 32) #3
  br label %Skein_512_Init.exit.i

Skein_512_Init.exit.i:                            ; preds = %sw.default.i.i, %sw.bb8.i.i, %sw.bb5.i.i, %sw.bb2.i.i, %sw.bb.i.i
  %22 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 2, i32 0
  store i64 0, i64* %22, align 8, !tbaa !2
  %23 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 2, i32 1
  store i64 8070450532247928832, i64* %23, align 8, !tbaa !2
  %24 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 1
  store i32 0, i32* %24, align 4, !tbaa !14
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %1) #3
  br label %Init.exit

if.else.i:                                        ; preds = %entry
  store i32 1024, i32* %statebits.i, align 8, !tbaa !7
  %ctx1024.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0
  %25 = bitcast %union.anon.1* %cfg.i1.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %25) #3
  %hashBitLen1.i2.i = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx1024.i, i32 0, i32 0, i32 0
  store i32 %hashbitlen, i32* %hashBitLen1.i2.i, align 8, !tbaa !15
  %cond.i = icmp eq i32 %hashbitlen, 1024
  br i1 %cond.i, label %sw.bb5.i8.i, label %sw.default.i14.i

sw.bb5.i8.i:                                      ; preds = %if.else.i
  %arraydecay7.i7.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 1, i32 0
  %26 = bitcast i64* %arraydecay7.i7.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 8 dereferenceable(128) %26, i8* nonnull align 16 dereferenceable(128) bitcast ([16 x i64]* @SKEIN1024_IV_1024 to i8*), i32 128, i1 false) #3
  br label %Skein1024_Init.exit.i

sw.default.i14.i:                                 ; preds = %if.else.i
  %arrayidx.i9.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 2, i32 0
  store i64 0, i64* %arrayidx.i9.i, align 8, !tbaa !2
  %arrayidx11.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 2, i32 1
  store i64 -4323455642275676160, i64* %arrayidx11.i.i, align 8, !tbaa !2
  %bCnt.i10.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 1
  store i32 0, i32* %bCnt.i10.i, align 4, !tbaa !17
  %arrayidx13.i.i = getelementptr inbounds %union.anon.1, %union.anon.1* %cfg.i1.i, i32 0, i32 0, i32 0
  store i64 6001118190787100672, i64* %arrayidx13.i.i, align 8, !tbaa !6
  %conv.i11.i = zext i32 %hashbitlen to i64
  %shl.i12.i = shl i64 %conv.i11.i, 56
  %27 = shl i64 %conv.i11.i, 40
  %shl16.i.i = and i64 %27, 71776119061217280
  %or.i13.i = or i64 %shl16.i.i, %shl.i12.i
  %28 = shl nuw nsw i64 %conv.i11.i, 24
  %shl20.i.i = and i64 %28, 280375465082880
  %or21.i.i = or i64 %or.i13.i, %shl20.i.i
  %shr23.i.i = lshr i64 %conv.i11.i, 24
  %shl25.i.i = shl nuw nsw i64 %shr23.i.i, 32
  %or26.i.i = or i64 %or21.i.i, %shl25.i.i
  %arrayidx47.i.i = getelementptr inbounds %union.anon.1, %union.anon.1* %cfg.i1.i, i32 0, i32 0, i32 1
  store i64 %or26.i.i, i64* %arrayidx47.i.i, align 8, !tbaa !6
  %arrayidx49.i.i = getelementptr inbounds %union.anon.1, %union.anon.1* %cfg.i1.i, i32 0, i32 0, i32 2
  %arraydecay53.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 1, i32 0
  %29 = bitcast i64* %arraydecay53.i.i to i8*
  %30 = bitcast i64* %arrayidx49.i.i to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(112) %30, i8 0, i64 112, i1 false) #3
  call void @llvm.memset.p0i8.i32(i8* nonnull align 8 dereferenceable(128) %29, i8 0, i32 128, i1 false) #3
  call fastcc void @Skein1024_Process_Block(%struct.Skein1024_Ctxt_t* nonnull %ctx1024.i, i8* nonnull %25, i32 1, i32 32) #3
  br label %Skein1024_Init.exit.i

Skein1024_Init.exit.i:                            ; preds = %sw.default.i14.i, %sw.bb5.i8.i
  %arrayidx57.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 2, i32 0
  store i64 0, i64* %arrayidx57.i.i, align 8, !tbaa !2
  %arrayidx60.i15.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 2, i32 1
  store i64 8070450532247928832, i64* %arrayidx60.i15.i, align 8, !tbaa !2
  %bCnt62.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 1
  store i32 0, i32* %bCnt62.i.i, align 4, !tbaa !17
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %25) #3
  br label %Init.exit

Init.exit:                                        ; preds = %Skein_512_Init.exit.i, %Skein1024_Init.exit.i
  %and.i = and i32 %databitlen, 7
  %cmp.i5 = icmp eq i32 %and.i, 0
  br i1 %cmp.i5, label %if.then.i7, label %if.else.i11

if.then.i7:                                       ; preds = %Init.exit
  %31 = load i32, i32* %statebits.i, align 8, !tbaa !7
  %shr.i = lshr i32 %31, 8
  %and1.i = and i32 %shr.i, 3
  switch i32 %and1.i, label %Update.exit [
    i32 2, label %sw.bb.i
    i32 1, label %sw.bb3.i
    i32 0, label %sw.bb7.i
  ]

sw.bb.i:                                          ; preds = %if.then.i7
  %u.i8 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1
  %ctx_512.i9 = bitcast %union.anon* %u.i8 to %struct.Skein_512_Ctxt_t*
  %shr2.i = lshr i32 %databitlen, 3
  %32 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 1
  %cmp.i.i = icmp ugt i32 %databitlen, 519
  br i1 %cmp.i.i, label %if.then19.i.i, label %if.end25.i.i

if.then19.i.i:                                    ; preds = %sw.bb.i
  %sub20.i.i = add nsw i32 %shr2.i, -1
  %div.i.i = lshr i32 %sub20.i.i, 6
  call fastcc void @Skein_512_Process_Block(%struct.Skein_512_Ctxt_t* nonnull %ctx_512.i9, i8* %data, i32 %div.i.i, i32 64) #3
  %mul.i.i = and i32 %sub20.i.i, -64
  %sub21.i.i = sub nsw i32 %shr2.i, %mul.i.i
  %add.ptr23.i.i = getelementptr inbounds i8, i8* %data, i32 %mul.i.i
  br label %if.end25.i.i

if.end25.i.i:                                     ; preds = %if.then19.i.i, %sw.bb.i
  %msg.addr.2.i.i = phi i8* [ %add.ptr23.i.i, %if.then19.i.i ], [ %data, %sw.bb.i ]
  %msgByteCnt.addr.2.i.i = phi i32 [ %sub21.i.i, %if.then19.i.i ], [ %shr2.i, %sw.bb.i ]
  %tobool26.i.i = icmp eq i32 %msgByteCnt.addr.2.i.i, 0
  br i1 %tobool26.i.i, label %Update.exit, label %if.then27.i.i

if.then27.i.i:                                    ; preds = %if.end25.i.i
  %33 = load i32, i32* %32, align 4, !tbaa !14
  %arrayidx31.i.i = getelementptr inbounds %struct.Skein_512_Ctxt_t, %struct.Skein_512_Ctxt_t* %ctx_512.i9, i32 0, i32 2, i32 %33
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %arrayidx31.i.i, i8* align 1 %msg.addr.2.i.i, i32 %msgByteCnt.addr.2.i.i, i1 false) #3
  %34 = load i32, i32* %32, align 4, !tbaa !14
  %add34.i.i = add i32 %34, %msgByteCnt.addr.2.i.i
  store i32 %add34.i.i, i32* %32, align 4, !tbaa !14
  br label %Update.exit

sw.bb3.i:                                         ; preds = %if.then.i7
  %u4.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1
  %ctx_256.i = bitcast %union.anon* %u4.i to %struct.Skein_256_Ctxt_t*
  %shr5.i = lshr i32 %databitlen, 3
  %35 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 1
  %cmp.i82.i = icmp ugt i32 %databitlen, 263
  br i1 %cmp.i82.i, label %if.then19.i106.i, label %if.end25.i110.i

if.then19.i106.i:                                 ; preds = %sw.bb3.i
  %sub20.i101.i = add nsw i32 %shr5.i, -1
  %div.i102.i = lshr i32 %sub20.i101.i, 5
  call fastcc void @Skein_256_Process_Block(%struct.Skein_256_Ctxt_t* nonnull %ctx_256.i, i8* %data, i32 %div.i102.i, i32 32) #3
  %mul.i103.i = and i32 %sub20.i101.i, -32
  %sub21.i104.i = sub nsw i32 %shr5.i, %mul.i103.i
  %add.ptr23.i105.i = getelementptr inbounds i8, i8* %data, i32 %mul.i103.i
  br label %if.end25.i110.i

if.end25.i110.i:                                  ; preds = %if.then19.i106.i, %sw.bb3.i
  %msg.addr.2.i107.i = phi i8* [ %add.ptr23.i105.i, %if.then19.i106.i ], [ %data, %sw.bb3.i ]
  %msgByteCnt.addr.2.i108.i = phi i32 [ %sub21.i104.i, %if.then19.i106.i ], [ %shr5.i, %sw.bb3.i ]
  %tobool26.i109.i = icmp eq i32 %msgByteCnt.addr.2.i108.i, 0
  br i1 %tobool26.i109.i, label %Update.exit, label %if.then27.i113.i

if.then27.i113.i:                                 ; preds = %if.end25.i110.i
  %36 = load i32, i32* %35, align 4, !tbaa !18
  %arrayidx31.i111.i = getelementptr inbounds %struct.Skein_256_Ctxt_t, %struct.Skein_256_Ctxt_t* %ctx_256.i, i32 0, i32 2, i32 %36
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %arrayidx31.i111.i, i8* align 1 %msg.addr.2.i107.i, i32 %msgByteCnt.addr.2.i108.i, i1 false) #3
  %37 = load i32, i32* %35, align 4, !tbaa !18
  %add34.i112.i = add i32 %37, %msgByteCnt.addr.2.i108.i
  store i32 %add34.i112.i, i32* %35, align 4, !tbaa !18
  br label %Update.exit

sw.bb7.i:                                         ; preds = %if.then.i7
  %shr9.i = lshr i32 %databitlen, 3
  %bCnt.i114.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 1
  %cmp.i116.i = icmp ugt i32 %databitlen, 1031
  br i1 %cmp.i116.i, label %if.then19.i140.i, label %if.end25.i144.i

if.then19.i140.i:                                 ; preds = %sw.bb7.i
  %ctx1024.i10 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0
  %sub20.i135.i = add nsw i32 %shr9.i, -1
  %div.i136.i = lshr i32 %sub20.i135.i, 7
  call fastcc void @Skein1024_Process_Block(%struct.Skein1024_Ctxt_t* nonnull %ctx1024.i10, i8* %data, i32 %div.i136.i, i32 128) #3
  %mul.i137.i = and i32 %sub20.i135.i, -128
  %sub21.i138.i = sub nsw i32 %shr9.i, %mul.i137.i
  %add.ptr23.i139.i = getelementptr inbounds i8, i8* %data, i32 %mul.i137.i
  br label %if.end25.i144.i

if.end25.i144.i:                                  ; preds = %if.then19.i140.i, %sw.bb7.i
  %msg.addr.2.i141.i = phi i8* [ %add.ptr23.i139.i, %if.then19.i140.i ], [ %data, %sw.bb7.i ]
  %msgByteCnt.addr.2.i142.i = phi i32 [ %sub21.i138.i, %if.then19.i140.i ], [ %shr9.i, %sw.bb7.i ]
  %tobool26.i143.i = icmp eq i32 %msgByteCnt.addr.2.i142.i, 0
  br i1 %tobool26.i143.i, label %Update.exit, label %if.then27.i147.i

if.then27.i147.i:                                 ; preds = %if.end25.i144.i
  %38 = load i32, i32* %bCnt.i114.i, align 4, !tbaa !17
  %arrayidx31.i145.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 2, i32 %38
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %arrayidx31.i145.i, i8* align 1 %msg.addr.2.i141.i, i32 %msgByteCnt.addr.2.i142.i, i1 false) #3
  %39 = load i32, i32* %bCnt.i114.i, align 4, !tbaa !17
  %add34.i146.i = add i32 %39, %msgByteCnt.addr.2.i142.i
  store i32 %add34.i146.i, i32* %bCnt.i114.i, align 4, !tbaa !17
  br label %Update.exit

if.else.i11:                                      ; preds = %Init.exit
  %shr11.i = lshr i32 %databitlen, 3
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %b.i) #3
  %sub.i = xor i32 %and.i, 7
  %shl.i = shl nuw i32 1, %sub.i
  %arrayidx.i = getelementptr inbounds i8, i8* %data, i32 %shr11.i
  %40 = load i8, i8* %arrayidx.i, align 1, !tbaa !6
  %conv14.i = zext i8 %40 to i32
  %sub16.i = sub nsw i32 0, %shl.i
  %and17.i = and i32 %conv14.i, %sub16.i
  %or.i = or i32 %and17.i, %shl.i
  %conv19.i = trunc i32 %or.i to i8
  store i8 %conv19.i, i8* %b.i, align 1, !tbaa !6
  %41 = load i32, i32* %statebits.i, align 8, !tbaa !7
  %shr21.i = lshr i32 %41, 8
  %and22.i = and i32 %shr21.i, 3
  switch i32 %and22.i, label %cleanup.i [
    i32 2, label %sw.bb23.i
    i32 1, label %sw.bb31.i
    i32 0, label %sw.bb39.i
  ]

sw.bb23.i:                                        ; preds = %if.else.i11
  %u24.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1
  %ctx_51225.i = bitcast %union.anon* %u24.i to %struct.Skein_512_Ctxt_t*
  %42 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 1
  %cmp.i150.i = icmp ugt i32 %databitlen, 519
  br i1 %cmp.i150.i, label %if.then19.i174.i, label %if.end25.i178.i

if.then19.i174.i:                                 ; preds = %sw.bb23.i
  %sub20.i169.i = add nsw i32 %shr11.i, -1
  %div.i170.i = lshr i32 %sub20.i169.i, 6
  call fastcc void @Skein_512_Process_Block(%struct.Skein_512_Ctxt_t* nonnull %ctx_51225.i, i8* nonnull %data, i32 %div.i170.i, i32 64) #3
  %mul.i171.i = and i32 %sub20.i169.i, -64
  %sub21.i172.i = sub nsw i32 %shr11.i, %mul.i171.i
  %add.ptr23.i173.i = getelementptr inbounds i8, i8* %data, i32 %mul.i171.i
  %.pre376.i.pre = load i32, i32* %42, align 4, !tbaa !14
  br label %if.end25.i178.i

if.end25.i178.i:                                  ; preds = %if.then19.i174.i, %sw.bb23.i
  %.pre376.i = phi i32 [ %.pre376.i.pre, %if.then19.i174.i ], [ 0, %sw.bb23.i ]
  %msg.addr.2.i175.i = phi i8* [ %add.ptr23.i173.i, %if.then19.i174.i ], [ %data, %sw.bb23.i ]
  %msgByteCnt.addr.2.i176.i = phi i32 [ %sub21.i172.i, %if.then19.i174.i ], [ %shr11.i, %sw.bb23.i ]
  %tobool26.i177.i = icmp eq i32 %msgByteCnt.addr.2.i176.i, 0
  br i1 %tobool26.i177.i, label %Skein_512_Update.exit182.i, label %if.then27.i181.i

if.then27.i181.i:                                 ; preds = %if.end25.i178.i
  %arrayidx31.i179.i = getelementptr inbounds %struct.Skein_512_Ctxt_t, %struct.Skein_512_Ctxt_t* %ctx_51225.i, i32 0, i32 2, i32 %.pre376.i
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %arrayidx31.i179.i, i8* align 1 %msg.addr.2.i175.i, i32 %msgByteCnt.addr.2.i176.i, i1 false) #3
  %43 = load i32, i32* %42, align 4, !tbaa !14
  %add34.i180.i = add i32 %43, %msgByteCnt.addr.2.i176.i
  store i32 %add34.i180.i, i32* %42, align 4, !tbaa !14
  br label %Skein_512_Update.exit182.i

Skein_512_Update.exit182.i:                       ; preds = %if.then27.i181.i, %if.end25.i178.i
  %44 = phi i32 [ %add34.i180.i, %if.then27.i181.i ], [ %.pre376.i, %if.end25.i178.i ]
  %add.i184.i = add i32 %44, 1
  %cmp.i185.i = icmp ugt i32 %add.i184.i, 64
  br i1 %cmp.i185.i, label %if.then3.i190.i, label %if.then27.i216.i

if.then3.i190.i:                                  ; preds = %Skein_512_Update.exit182.i
  %sub.i188.i = sub i32 64, %44
  %tobool6.i189.i = icmp eq i32 %sub.i188.i, 0
  br i1 %tobool6.i189.i, label %if.end17.i203.i, label %if.then7.i195.i

if.then7.i195.i:                                  ; preds = %if.then3.i190.i
  %arrayidx.i191.i = getelementptr inbounds %struct.Skein_512_Ctxt_t, %struct.Skein_512_Ctxt_t* %ctx_51225.i, i32 0, i32 2, i32 %44
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %arrayidx.i191.i, i8* nonnull align 1 %b.i, i32 %sub.i188.i, i1 false) #3
  %sub10.i192.i = add i32 %44, -63
  %add.ptr.i193.i = getelementptr inbounds i8, i8* %b.i, i32 %sub.i188.i
  %45 = load i32, i32* %42, align 4, !tbaa !14
  %add13.i194.i = add i32 %45, %sub.i188.i
  store i32 %add13.i194.i, i32* %42, align 4, !tbaa !14
  br label %if.end17.i203.i

if.end17.i203.i:                                  ; preds = %if.then7.i195.i, %if.then3.i190.i
  %msg.addr.0.i196.i = phi i8* [ %add.ptr.i193.i, %if.then7.i195.i ], [ %b.i, %if.then3.i190.i ]
  %msgByteCnt.addr.0.i197.i = phi i32 [ %sub10.i192.i, %if.then7.i195.i ], [ 1, %if.then3.i190.i ]
  %arraydecay.i198.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 1, i32 8
  %46 = bitcast i64* %arraydecay.i198.i to i8*
  call fastcc void @Skein_512_Process_Block(%struct.Skein_512_Ctxt_t* nonnull %ctx_51225.i, i8* nonnull %46, i32 1, i32 64) #3
  store i32 0, i32* %42, align 4, !tbaa !14
  %cmp18.i202.i = icmp ugt i32 %msgByteCnt.addr.0.i197.i, 64
  br i1 %cmp18.i202.i, label %if.end25.i213.i, label %if.then27.i216.i

if.end25.i213.i:                                  ; preds = %if.end17.i203.i
  %sub20.i204.i = add i32 %msgByteCnt.addr.0.i197.i, -1
  %div.i205.i = lshr i32 %sub20.i204.i, 6
  call fastcc void @Skein_512_Process_Block(%struct.Skein_512_Ctxt_t* nonnull %ctx_51225.i, i8* nonnull %msg.addr.0.i196.i, i32 %div.i205.i, i32 64) #3
  %mul.i206.i = and i32 %sub20.i204.i, -64
  %sub21.i207.i = sub i32 %msgByteCnt.addr.0.i197.i, %mul.i206.i
  %tobool26.i212.i = icmp eq i32 %sub21.i207.i, 0
  br i1 %tobool26.i212.i, label %sw.epilog.i, label %if.end25.i213.if.then27.i216_crit_edge.i

if.end25.i213.if.then27.i216_crit_edge.i:         ; preds = %if.end25.i213.i
  %add.ptr23.i208.i = getelementptr inbounds i8, i8* %msg.addr.0.i196.i, i32 %mul.i206.i
  %.pre377.i = load i32, i32* %42, align 4, !tbaa !14
  br label %if.then27.i216.i

if.then27.i216.i:                                 ; preds = %if.end25.i213.if.then27.i216_crit_edge.i, %if.end17.i203.i, %Skein_512_Update.exit182.i
  %47 = phi i32 [ %.pre377.i, %if.end25.i213.if.then27.i216_crit_edge.i ], [ %44, %Skein_512_Update.exit182.i ], [ 0, %if.end17.i203.i ]
  %msgByteCnt.addr.2.i211362.i = phi i32 [ %sub21.i207.i, %if.end25.i213.if.then27.i216_crit_edge.i ], [ 1, %Skein_512_Update.exit182.i ], [ %msgByteCnt.addr.0.i197.i, %if.end17.i203.i ]
  %msg.addr.2.i210361.i = phi i8* [ %add.ptr23.i208.i, %if.end25.i213.if.then27.i216_crit_edge.i ], [ %b.i, %Skein_512_Update.exit182.i ], [ %msg.addr.0.i196.i, %if.end17.i203.i ]
  %arrayidx31.i214.i = getelementptr inbounds %struct.Skein_512_Ctxt_t, %struct.Skein_512_Ctxt_t* %ctx_51225.i, i32 0, i32 2, i32 %47
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %arrayidx31.i214.i, i8* align 1 %msg.addr.2.i210361.i, i32 %msgByteCnt.addr.2.i211362.i, i1 false) #3
  %48 = load i32, i32* %42, align 4, !tbaa !14
  %add34.i215.i = add i32 %48, %msgByteCnt.addr.2.i211362.i
  store i32 %add34.i215.i, i32* %42, align 4, !tbaa !14
  br label %sw.epilog.i

sw.bb31.i:                                        ; preds = %if.else.i11
  %u32.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1
  %ctx_25633.i = bitcast %union.anon* %u32.i to %struct.Skein_256_Ctxt_t*
  %49 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 1
  %cmp.i220.i = icmp ugt i32 %databitlen, 263
  br i1 %cmp.i220.i, label %if.then19.i244.i, label %if.end25.i248.i

if.then19.i244.i:                                 ; preds = %sw.bb31.i
  %sub20.i239.i = add nsw i32 %shr11.i, -1
  %div.i240.i = lshr i32 %sub20.i239.i, 5
  call fastcc void @Skein_256_Process_Block(%struct.Skein_256_Ctxt_t* nonnull %ctx_25633.i, i8* nonnull %data, i32 %div.i240.i, i32 32) #3
  %mul.i241.i = and i32 %sub20.i239.i, -32
  %sub21.i242.i = sub nsw i32 %shr11.i, %mul.i241.i
  %add.ptr23.i243.i = getelementptr inbounds i8, i8* %data, i32 %mul.i241.i
  %.pre374.i.pre = load i32, i32* %49, align 4, !tbaa !18
  br label %if.end25.i248.i

if.end25.i248.i:                                  ; preds = %if.then19.i244.i, %sw.bb31.i
  %.pre374.i = phi i32 [ %.pre374.i.pre, %if.then19.i244.i ], [ 0, %sw.bb31.i ]
  %msg.addr.2.i245.i = phi i8* [ %add.ptr23.i243.i, %if.then19.i244.i ], [ %data, %sw.bb31.i ]
  %msgByteCnt.addr.2.i246.i = phi i32 [ %sub21.i242.i, %if.then19.i244.i ], [ %shr11.i, %sw.bb31.i ]
  %tobool26.i247.i = icmp eq i32 %msgByteCnt.addr.2.i246.i, 0
  br i1 %tobool26.i247.i, label %Skein_256_Update.exit252.i, label %if.then27.i251.i

if.then27.i251.i:                                 ; preds = %if.end25.i248.i
  %arrayidx31.i249.i = getelementptr inbounds %struct.Skein_256_Ctxt_t, %struct.Skein_256_Ctxt_t* %ctx_25633.i, i32 0, i32 2, i32 %.pre374.i
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %arrayidx31.i249.i, i8* align 1 %msg.addr.2.i245.i, i32 %msgByteCnt.addr.2.i246.i, i1 false) #3
  %50 = load i32, i32* %49, align 4, !tbaa !18
  %add34.i250.i = add i32 %50, %msgByteCnt.addr.2.i246.i
  store i32 %add34.i250.i, i32* %49, align 4, !tbaa !18
  br label %Skein_256_Update.exit252.i

Skein_256_Update.exit252.i:                       ; preds = %if.then27.i251.i, %if.end25.i248.i
  %51 = phi i32 [ %add34.i250.i, %if.then27.i251.i ], [ %.pre374.i, %if.end25.i248.i ]
  %add.i254.i = add i32 %51, 1
  %cmp.i255.i = icmp ugt i32 %add.i254.i, 32
  br i1 %cmp.i255.i, label %if.then3.i260.i, label %if.then27.i286.i

if.then3.i260.i:                                  ; preds = %Skein_256_Update.exit252.i
  %sub.i258.i = sub i32 32, %51
  %tobool6.i259.i = icmp eq i32 %sub.i258.i, 0
  br i1 %tobool6.i259.i, label %if.end17.i273.i, label %if.then7.i265.i

if.then7.i265.i:                                  ; preds = %if.then3.i260.i
  %arrayidx.i261.i = getelementptr inbounds %struct.Skein_256_Ctxt_t, %struct.Skein_256_Ctxt_t* %ctx_25633.i, i32 0, i32 2, i32 %51
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %arrayidx.i261.i, i8* nonnull align 1 %b.i, i32 %sub.i258.i, i1 false) #3
  %sub10.i262.i = add i32 %51, -31
  %add.ptr.i263.i = getelementptr inbounds i8, i8* %b.i, i32 %sub.i258.i
  %52 = load i32, i32* %49, align 4, !tbaa !18
  %add13.i264.i = add i32 %52, %sub.i258.i
  store i32 %add13.i264.i, i32* %49, align 4, !tbaa !18
  br label %if.end17.i273.i

if.end17.i273.i:                                  ; preds = %if.then7.i265.i, %if.then3.i260.i
  %msg.addr.0.i266.i = phi i8* [ %add.ptr.i263.i, %if.then7.i265.i ], [ %b.i, %if.then3.i260.i ]
  %msgByteCnt.addr.0.i267.i = phi i32 [ %sub10.i262.i, %if.then7.i265.i ], [ 1, %if.then3.i260.i ]
  %arraydecay.i268.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 1, i32 4
  %53 = bitcast i64* %arraydecay.i268.i to i8*
  call fastcc void @Skein_256_Process_Block(%struct.Skein_256_Ctxt_t* nonnull %ctx_25633.i, i8* nonnull %53, i32 1, i32 32) #3
  store i32 0, i32* %49, align 4, !tbaa !18
  %cmp18.i272.i = icmp ugt i32 %msgByteCnt.addr.0.i267.i, 32
  br i1 %cmp18.i272.i, label %if.end25.i283.i, label %if.then27.i286.i

if.end25.i283.i:                                  ; preds = %if.end17.i273.i
  %sub20.i274.i = add i32 %msgByteCnt.addr.0.i267.i, -1
  %div.i275.i = lshr i32 %sub20.i274.i, 5
  call fastcc void @Skein_256_Process_Block(%struct.Skein_256_Ctxt_t* nonnull %ctx_25633.i, i8* nonnull %msg.addr.0.i266.i, i32 %div.i275.i, i32 32) #3
  %mul.i276.i = and i32 %sub20.i274.i, -32
  %sub21.i277.i = sub i32 %msgByteCnt.addr.0.i267.i, %mul.i276.i
  %tobool26.i282.i = icmp eq i32 %sub21.i277.i, 0
  br i1 %tobool26.i282.i, label %sw.epilog.i, label %if.end25.i283.if.then27.i286_crit_edge.i

if.end25.i283.if.then27.i286_crit_edge.i:         ; preds = %if.end25.i283.i
  %add.ptr23.i278.i = getelementptr inbounds i8, i8* %msg.addr.0.i266.i, i32 %mul.i276.i
  %.pre375.i = load i32, i32* %49, align 4, !tbaa !18
  br label %if.then27.i286.i

if.then27.i286.i:                                 ; preds = %if.end25.i283.if.then27.i286_crit_edge.i, %if.end17.i273.i, %Skein_256_Update.exit252.i
  %54 = phi i32 [ %.pre375.i, %if.end25.i283.if.then27.i286_crit_edge.i ], [ %51, %Skein_256_Update.exit252.i ], [ 0, %if.end17.i273.i ]
  %msgByteCnt.addr.2.i281367.i = phi i32 [ %sub21.i277.i, %if.end25.i283.if.then27.i286_crit_edge.i ], [ 1, %Skein_256_Update.exit252.i ], [ %msgByteCnt.addr.0.i267.i, %if.end17.i273.i ]
  %msg.addr.2.i280366.i = phi i8* [ %add.ptr23.i278.i, %if.end25.i283.if.then27.i286_crit_edge.i ], [ %b.i, %Skein_256_Update.exit252.i ], [ %msg.addr.0.i266.i, %if.end17.i273.i ]
  %arrayidx31.i284.i = getelementptr inbounds %struct.Skein_256_Ctxt_t, %struct.Skein_256_Ctxt_t* %ctx_25633.i, i32 0, i32 2, i32 %54
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %arrayidx31.i284.i, i8* align 1 %msg.addr.2.i280366.i, i32 %msgByteCnt.addr.2.i281367.i, i1 false) #3
  %55 = load i32, i32* %49, align 4, !tbaa !18
  %add34.i285.i = add i32 %55, %msgByteCnt.addr.2.i281367.i
  store i32 %add34.i285.i, i32* %49, align 4, !tbaa !18
  br label %sw.epilog.i

sw.bb39.i:                                        ; preds = %if.else.i11
  %ctx102441.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0
  %bCnt.i288.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 1
  %cmp.i290.i = icmp ugt i32 %databitlen, 1031
  br i1 %cmp.i290.i, label %if.then19.i314.i, label %if.end25.i318.i

if.then19.i314.i:                                 ; preds = %sw.bb39.i
  %sub20.i309.i = add nsw i32 %shr11.i, -1
  %div.i310.i = lshr i32 %sub20.i309.i, 7
  call fastcc void @Skein1024_Process_Block(%struct.Skein1024_Ctxt_t* nonnull %ctx102441.i, i8* nonnull %data, i32 %div.i310.i, i32 128) #3
  %mul.i311.i = and i32 %sub20.i309.i, -128
  %sub21.i312.i = sub nsw i32 %shr11.i, %mul.i311.i
  %add.ptr23.i313.i = getelementptr inbounds i8, i8* %data, i32 %mul.i311.i
  %.pre.i.pre = load i32, i32* %bCnt.i288.i, align 4, !tbaa !17
  br label %if.end25.i318.i

if.end25.i318.i:                                  ; preds = %if.then19.i314.i, %sw.bb39.i
  %.pre.i = phi i32 [ %.pre.i.pre, %if.then19.i314.i ], [ 0, %sw.bb39.i ]
  %msg.addr.2.i315.i = phi i8* [ %add.ptr23.i313.i, %if.then19.i314.i ], [ %data, %sw.bb39.i ]
  %msgByteCnt.addr.2.i316.i = phi i32 [ %sub21.i312.i, %if.then19.i314.i ], [ %shr11.i, %sw.bb39.i ]
  %tobool26.i317.i = icmp eq i32 %msgByteCnt.addr.2.i316.i, 0
  br i1 %tobool26.i317.i, label %Skein1024_Update.exit322.i, label %if.then27.i321.i

if.then27.i321.i:                                 ; preds = %if.end25.i318.i
  %arrayidx31.i319.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 2, i32 %.pre.i
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %arrayidx31.i319.i, i8* align 1 %msg.addr.2.i315.i, i32 %msgByteCnt.addr.2.i316.i, i1 false) #3
  %56 = load i32, i32* %bCnt.i288.i, align 4, !tbaa !17
  %add34.i320.i = add i32 %56, %msgByteCnt.addr.2.i316.i
  store i32 %add34.i320.i, i32* %bCnt.i288.i, align 4, !tbaa !17
  br label %Skein1024_Update.exit322.i

Skein1024_Update.exit322.i:                       ; preds = %if.then27.i321.i, %if.end25.i318.i
  %57 = phi i32 [ %add34.i320.i, %if.then27.i321.i ], [ %.pre.i, %if.end25.i318.i ]
  %add.i324.i = add i32 %57, 1
  %cmp.i325.i = icmp ugt i32 %add.i324.i, 128
  br i1 %cmp.i325.i, label %if.then3.i330.i, label %if.then27.i356.i

if.then3.i330.i:                                  ; preds = %Skein1024_Update.exit322.i
  %sub.i328.i = sub i32 128, %57
  %tobool6.i329.i = icmp eq i32 %sub.i328.i, 0
  br i1 %tobool6.i329.i, label %if.end17.i343.i, label %if.then7.i335.i

if.then7.i335.i:                                  ; preds = %if.then3.i330.i
  %arrayidx.i331.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 2, i32 %57
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %arrayidx.i331.i, i8* nonnull align 1 %b.i, i32 %sub.i328.i, i1 false) #3
  %sub10.i332.i = add i32 %57, -127
  %add.ptr.i333.i = getelementptr inbounds i8, i8* %b.i, i32 %sub.i328.i
  %58 = load i32, i32* %bCnt.i288.i, align 4, !tbaa !17
  %add13.i334.i = add i32 %58, %sub.i328.i
  store i32 %add13.i334.i, i32* %bCnt.i288.i, align 4, !tbaa !17
  br label %if.end17.i343.i

if.end17.i343.i:                                  ; preds = %if.then7.i335.i, %if.then3.i330.i
  %msg.addr.0.i336.i = phi i8* [ %add.ptr.i333.i, %if.then7.i335.i ], [ %b.i, %if.then3.i330.i ]
  %msgByteCnt.addr.0.i337.i = phi i32 [ %sub10.i332.i, %if.then7.i335.i ], [ 1, %if.then3.i330.i ]
  %arraydecay.i338.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 2, i32 0
  call fastcc void @Skein1024_Process_Block(%struct.Skein1024_Ctxt_t* nonnull %ctx102441.i, i8* nonnull %arraydecay.i338.i, i32 1, i32 128) #3
  store i32 0, i32* %bCnt.i288.i, align 4, !tbaa !17
  %cmp18.i342.i = icmp ugt i32 %msgByteCnt.addr.0.i337.i, 128
  br i1 %cmp18.i342.i, label %if.end25.i353.i, label %if.then27.i356.i

if.end25.i353.i:                                  ; preds = %if.end17.i343.i
  %sub20.i344.i = add i32 %msgByteCnt.addr.0.i337.i, -1
  %div.i345.i = lshr i32 %sub20.i344.i, 7
  call fastcc void @Skein1024_Process_Block(%struct.Skein1024_Ctxt_t* nonnull %ctx102441.i, i8* nonnull %msg.addr.0.i336.i, i32 %div.i345.i, i32 128) #3
  %mul.i346.i = and i32 %sub20.i344.i, -128
  %sub21.i347.i = sub i32 %msgByteCnt.addr.0.i337.i, %mul.i346.i
  br i1 false, label %sw.epilog.i, label %if.end25.i353.if.then27.i356_crit_edge.i

if.end25.i353.if.then27.i356_crit_edge.i:         ; preds = %if.end25.i353.i
  %add.ptr23.i348.i = getelementptr inbounds i8, i8* %msg.addr.0.i336.i, i32 %mul.i346.i
  %.pre373.i = load i32, i32* %bCnt.i288.i, align 4, !tbaa !17
  br label %if.then27.i356.i

if.then27.i356.i:                                 ; preds = %if.end25.i353.if.then27.i356_crit_edge.i, %if.end17.i343.i, %Skein1024_Update.exit322.i
  %59 = phi i32 [ %.pre373.i, %if.end25.i353.if.then27.i356_crit_edge.i ], [ %57, %Skein1024_Update.exit322.i ], [ 0, %if.end17.i343.i ]
  %msgByteCnt.addr.2.i351372.i = phi i32 [ %sub21.i347.i, %if.end25.i353.if.then27.i356_crit_edge.i ], [ 1, %Skein1024_Update.exit322.i ], [ %msgByteCnt.addr.0.i337.i, %if.end17.i343.i ]
  %msg.addr.2.i350371.i = phi i8* [ %add.ptr23.i348.i, %if.end25.i353.if.then27.i356_crit_edge.i ], [ %b.i, %Skein1024_Update.exit322.i ], [ %msg.addr.0.i336.i, %if.end17.i343.i ]
  %arrayidx31.i354.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 2, i32 %59
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %arrayidx31.i354.i, i8* align 1 %msg.addr.2.i350371.i, i32 %msgByteCnt.addr.2.i351372.i, i1 false) #3
  %60 = load i32, i32* %bCnt.i288.i, align 4, !tbaa !17
  %add34.i355.i = add i32 %60, %msgByteCnt.addr.2.i351372.i
  store i32 %add34.i355.i, i32* %bCnt.i288.i, align 4, !tbaa !17
  br label %sw.epilog.i

sw.epilog.i:                                      ; preds = %if.then27.i356.i, %if.end25.i353.i, %if.then27.i286.i, %if.end25.i283.i, %if.then27.i216.i, %if.end25.i213.i
  %arrayidx49.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 2, i32 1
  %61 = load i64, i64* %arrayidx49.i, align 8, !tbaa !6
  %or50.i = or i64 %61, 36028797018963968
  store i64 %or50.i, i64* %arrayidx49.i, align 8, !tbaa !6
  br label %cleanup.i

cleanup.i:                                        ; preds = %sw.epilog.i, %if.else.i11
  %retval.0.i = phi i32 [ 0, %sw.epilog.i ], [ 1, %if.else.i11 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %b.i) #3
  br label %Update.exit

Update.exit:                                      ; preds = %if.then.i7, %if.end25.i.i, %if.then27.i.i, %if.end25.i110.i, %if.then27.i113.i, %if.end25.i144.i, %if.then27.i147.i, %cleanup.i
  %retval.1.i = phi i32 [ %retval.0.i, %cleanup.i ], [ 1, %if.then.i7 ], [ 0, %if.end25.i.i ], [ 0, %if.then27.i.i ], [ 0, %if.end25.i110.i ], [ 0, %if.then27.i113.i ], [ 0, %if.end25.i144.i ], [ 0, %if.then27.i147.i ]
  %62 = load i32, i32* %statebits.i, align 8, !tbaa !7
  %shr.i13 = lshr i32 %62, 8
  %and.i14 = and i32 %shr.i13, 3
  switch i32 %and.i14, label %Final.exit [
    i32 2, label %sw.bb.i19
    i32 1, label %sw.bb1.i
    i32 0, label %sw.bb4.i
  ]

sw.bb.i19:                                        ; preds = %Update.exit
  %u.i15 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1
  %ctx_512.i16 = bitcast %union.anon* %u.i15 to %struct.Skein_512_Ctxt_t*
  %X.0.X.0..sroa_cast.i.i = bitcast [8 x i64]* %X.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %X.0.X.0..sroa_cast.i.i)
  %63 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 2, i32 1
  %64 = load i64, i64* %63, align 8, !tbaa !2
  %or.i.i17 = or i64 %64, -9223372036854775808
  store i64 %or.i.i17, i64* %63, align 8, !tbaa !2
  %65 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 1
  %66 = load i32, i32* %65, align 4, !tbaa !14
  %cmp.i.i18 = icmp ult i32 %66, 64
  br i1 %cmp.i.i18, label %if.then.i.i21, label %if.end.i.i24

if.then.i.i21:                                    ; preds = %sw.bb.i19
  %arrayidx4.i.i = getelementptr inbounds %struct.Skein_512_Ctxt_t, %struct.Skein_512_Ctxt_t* %ctx_512.i16, i32 0, i32 2, i32 %66
  %sub.i.i20 = sub nuw nsw i32 64, %66
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 %arrayidx4.i.i, i8 0, i32 %sub.i.i20, i1 false) #3
  %.pre.i.i = load i32, i32* %65, align 4, !tbaa !14
  br label %if.end.i.i24

if.end.i.i24:                                     ; preds = %if.then.i.i21, %sw.bb.i19
  %67 = phi i32 [ %.pre.i.i, %if.then.i.i21 ], [ %66, %sw.bb.i19 ]
  %arraydecay.i.i22 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 1, i32 8
  %68 = bitcast i64* %arraydecay.i.i22 to i8*
  call fastcc void @Skein_512_Process_Block(%struct.Skein_512_Ctxt_t* nonnull %ctx_512.i16, i8* nonnull %68, i32 1, i32 %67) #3
  %hashBitLen.i.i = getelementptr %union.anon, %union.anon* %u.i15, i32 0, i32 0, i32 0, i32 0
  %69 = load i32, i32* %hashBitLen.i.i, align 8, !tbaa !10
  %add.i.i23 = add i32 %69, 7
  %shr.i.i = lshr i32 %add.i.i23, 3
  call void @llvm.memset.p0i8.i32(i8* nonnull align 8 dereferenceable(64) %68, i8 0, i32 64, i1 false) #3
  %70 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 1, i32 0
  %71 = bitcast i64* %70 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 dereferenceable(64) %X.0.X.0..sroa_cast.i.i, i8* nonnull align 8 dereferenceable(64) %71, i32 64, i1 false) #3
  %cmp162.i.i = icmp eq i32 %shr.i.i, 0
  br i1 %cmp162.i.i, label %Skein_512_Final.exit.i, label %for.body.lr.ph.i.i

for.body.lr.ph.i.i:                               ; preds = %if.end.i.i24
  %72 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 2, i32 0
  %73 = add nsw i32 %shr.i.i, -1
  %74 = lshr i32 %73, 6
  %75 = add nuw nsw i32 %74, 1
  %wide.trip.count.i.i = zext i32 %75 to i64
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %Skein_Put64_LSB_First.exit.i.i, %for.body.lr.ph.i.i
  %indvars.iv.i.i = phi i64 [ 0, %for.body.lr.ph.i.i ], [ %indvars.iv.next.i.i, %Skein_Put64_LSB_First.exit.i.i ]
  %mul4.i.i = phi i32 [ 0, %for.body.lr.ph.i.i ], [ %mul.i.i31, %Skein_Put64_LSB_First.exit.i.i ]
  %i.03.i.i = phi i32 [ 0, %for.body.lr.ph.i.i ], [ %inc.i.i, %Skein_Put64_LSB_First.exit.i.i ]
  %shl.i.i25 = shl i64 %indvars.iv.i.i, 56
  %76 = shl i64 %indvars.iv.i.i, 40
  %shl20.i.i26 = and i64 %76, 71776119061217280
  %or21.i.i27 = or i64 %shl20.i.i26, %shl.i.i25
  %77 = shl nuw nsw i64 %indvars.iv.i.i, 24
  %shl25.i.i28 = and i64 %77, 280375465082880
  %or26.i.i29 = or i64 %or21.i.i27, %shl25.i.i28
  %shr28.i.i = lshr i64 %indvars.iv.i.i, 24
  %shl30.i.i = shl nuw nsw i64 %shr28.i.i, 32
  %or31.i.i = or i64 %or26.i.i29, %shl30.i.i
  store i64 %or31.i.i, i64* %arraydecay.i.i22, align 8, !tbaa !2
  store i64 0, i64* %72, align 8, !tbaa !2
  store i64 -72057594037927936, i64* %63, align 8, !tbaa !2
  store i32 0, i32* %65, align 4, !tbaa !14
  call fastcc void @Skein_512_Process_Block(%struct.Skein_512_Ctxt_t* nonnull %ctx_512.i16, i8* nonnull %68, i32 1, i32 8) #3
  %sub65.i.i = sub nsw i32 %shr.i.i, %mul4.i.i
  %cmp66.inv.i.i = icmp ult i32 %sub65.i.i, 64
  %spec.store.select.i.i = select i1 %cmp66.inv.i.i, i32 %sub65.i.i, i32 64
  %add.ptr.i.i30 = getelementptr inbounds i8, i8* %hashval, i32 %mul4.i.i
  %cmp8.i.i.i = icmp eq i32 %spec.store.select.i.i, 0
  br i1 %cmp8.i.i.i, label %Skein_Put64_LSB_First.exit.i.i, label %for.body.i.i.i

for.body.i.i.i:                                   ; preds = %for.body.i.i, %for.body.i.i.i
  %n.09.i.i.i = phi i32 [ %inc.i.i.i, %for.body.i.i.i ], [ 0, %for.body.i.i ]
  %shr.i.i.i = lshr i32 %n.09.i.i.i, 3
  %arrayidx.i.i.i = getelementptr inbounds %struct.Skein_512_Ctxt_t, %struct.Skein_512_Ctxt_t* %ctx_512.i16, i32 0, i32 1, i32 %shr.i.i.i
  %78 = load i64, i64* %arrayidx.i.i.i, align 8, !tbaa !2
  %and.i.i.i = shl i32 %n.09.i.i.i, 3
  %mul.i.i.i = and i32 %and.i.i.i, 56
  %sh_prom.i.i.i = zext i32 %mul.i.i.i to i64
  %shr1.i.i.i = lshr i64 %78, %sh_prom.i.i.i
  %conv.i.i.i = trunc i64 %shr1.i.i.i to i8
  %arrayidx2.i.i.i = getelementptr inbounds i8, i8* %add.ptr.i.i30, i32 %n.09.i.i.i
  store i8 %conv.i.i.i, i8* %arrayidx2.i.i.i, align 1, !tbaa !6
  %inc.i.i.i = add nuw nsw i32 %n.09.i.i.i, 1
  %exitcond.i.i.i = icmp eq i32 %inc.i.i.i, %spec.store.select.i.i
  br i1 %exitcond.i.i.i, label %Skein_Put64_LSB_First.exit.i.i, label %for.body.i.i.i

Skein_Put64_LSB_First.exit.i.i:                   ; preds = %for.body.i.i.i, %for.body.i.i
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 8 dereferenceable(64) %71, i8* nonnull align 16 dereferenceable(64) %X.0.X.0..sroa_cast.i.i, i32 64, i1 false) #3
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.i.i, 1
  %inc.i.i = add nuw nsw i32 %i.03.i.i, 1
  %mul.i.i31 = shl i32 %inc.i.i, 6
  %exitcond.i.i = icmp eq i64 %indvars.iv.next.i.i, %wide.trip.count.i.i
  br i1 %exitcond.i.i, label %Skein_512_Final.exit.i, label %for.body.i.i

Skein_512_Final.exit.i:                           ; preds = %Skein_Put64_LSB_First.exit.i.i, %if.end.i.i24
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %X.0.X.0..sroa_cast.i.i)
  br label %Final.exit

sw.bb1.i:                                         ; preds = %Update.exit
  %u2.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1
  %ctx_256.i32 = bitcast %union.anon* %u2.i to %struct.Skein_256_Ctxt_t*
  %X.0.X.0..sroa_cast.i2.i = bitcast [4 x i64]* %X.i1.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %X.0.X.0..sroa_cast.i2.i)
  %79 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 2, i32 1
  %80 = load i64, i64* %79, align 8, !tbaa !2
  %or.i4.i = or i64 %80, -9223372036854775808
  store i64 %or.i4.i, i64* %79, align 8, !tbaa !2
  %81 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 1
  %82 = load i32, i32* %81, align 4, !tbaa !18
  %cmp.i6.i = icmp ult i32 %82, 32
  br i1 %cmp.i6.i, label %if.then.i10.i, label %if.end.i17.i

if.then.i10.i:                                    ; preds = %sw.bb1.i
  %arrayidx4.i7.i = getelementptr inbounds %struct.Skein_256_Ctxt_t, %struct.Skein_256_Ctxt_t* %ctx_256.i32, i32 0, i32 2, i32 %82
  %sub.i8.i = sub nuw nsw i32 32, %82
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 %arrayidx4.i7.i, i8 0, i32 %sub.i8.i, i1 false) #3
  %.pre.i9.i = load i32, i32* %81, align 4, !tbaa !18
  br label %if.end.i17.i

if.end.i17.i:                                     ; preds = %if.then.i10.i, %sw.bb1.i
  %83 = phi i32 [ %.pre.i9.i, %if.then.i10.i ], [ %82, %sw.bb1.i ]
  %arraydecay.i11.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 1, i32 4
  %84 = bitcast i64* %arraydecay.i11.i to i8*
  call fastcc void @Skein_256_Process_Block(%struct.Skein_256_Ctxt_t* nonnull %ctx_256.i32, i8* nonnull %84, i32 1, i32 %83) #3
  %hashBitLen.i12.i = getelementptr %union.anon, %union.anon* %u2.i, i32 0, i32 0, i32 0, i32 0
  %85 = load i32, i32* %hashBitLen.i12.i, align 8, !tbaa !20
  %add.i13.i = add i32 %85, 7
  %shr.i14.i = lshr i32 %add.i13.i, 3
  call void @llvm.memset.p0i8.i32(i8* nonnull align 8 dereferenceable(32) %84, i8 0, i32 32, i1 false) #3
  %86 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 1, i32 0
  %87 = bitcast i64* %86 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 dereferenceable(32) %X.0.X.0..sroa_cast.i2.i, i8* nonnull align 8 dereferenceable(32) %87, i32 32, i1 false) #3
  %cmp162.i16.i = icmp eq i32 %shr.i14.i, 0
  br i1 %cmp162.i16.i, label %Skein_256_Final.exit.i, label %for.body.lr.ph.i19.i

for.body.lr.ph.i19.i:                             ; preds = %if.end.i17.i
  %88 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 2, i32 0
  %89 = zext i32 %shr.i14.i to i64
  br label %for.body.i33.i

for.body.i33.i:                                   ; preds = %Skein_Put64_LSB_First.exit.i47.i, %for.body.lr.ph.i19.i
  %indvars.iv.i20.i = phi i64 [ 0, %for.body.lr.ph.i19.i ], [ %indvars.iv.next.i46.i, %Skein_Put64_LSB_First.exit.i47.i ]
  %i.03.i21.i = phi i32 [ 0, %for.body.lr.ph.i19.i ], [ %add74.i.i, %Skein_Put64_LSB_First.exit.i47.i ]
  %shl.i22.i = shl i64 %indvars.iv.i20.i, 56
  %90 = shl i64 %indvars.iv.i20.i, 40
  %shl20.i23.i = and i64 %90, 71776119061217280
  %or21.i24.i = or i64 %shl20.i23.i, %shl.i22.i
  %91 = shl nuw nsw i64 %indvars.iv.i20.i, 24
  %shl25.i25.i = and i64 %91, 280375465082880
  %or26.i26.i = or i64 %or21.i24.i, %shl25.i25.i
  %shr28.i27.i = lshr i64 %indvars.iv.i20.i, 24
  %shl30.i28.i = shl nuw nsw i64 %shr28.i27.i, 32
  %or31.i29.i = or i64 %or26.i26.i, %shl30.i28.i
  store i64 %or31.i29.i, i64* %arraydecay.i11.i, align 8, !tbaa !2
  store i64 0, i64* %88, align 8, !tbaa !2
  store i64 -72057594037927936, i64* %79, align 8, !tbaa !2
  store i32 0, i32* %81, align 4, !tbaa !18
  call fastcc void @Skein_256_Process_Block(%struct.Skein_256_Ctxt_t* nonnull %ctx_256.i32, i8* nonnull %84, i32 1, i32 8) #3
  %92 = trunc i64 %indvars.iv.i20.i to i32
  %93 = sub i32 %shr.i14.i, %92
  %cmp65.inv.i.i = icmp ult i32 %93, 32
  %spec.store.select.i30.i = select i1 %cmp65.inv.i.i, i32 %93, i32 32
  %add.ptr.i31.i = getelementptr inbounds i8, i8* %hashval, i32 %i.03.i21.i
  %cmp8.i.i32.i = icmp eq i32 %spec.store.select.i30.i, 0
  br i1 %cmp8.i.i32.i, label %Skein_Put64_LSB_First.exit.i47.i, label %for.body.i.i45.i

for.body.i.i45.i:                                 ; preds = %for.body.i33.i, %for.body.i.i45.i
  %n.09.i.i34.i = phi i32 [ %inc.i.i43.i, %for.body.i.i45.i ], [ 0, %for.body.i33.i ]
  %shr.i.i35.i = lshr i32 %n.09.i.i34.i, 3
  %arrayidx.i.i36.i = getelementptr inbounds %struct.Skein_256_Ctxt_t, %struct.Skein_256_Ctxt_t* %ctx_256.i32, i32 0, i32 1, i32 %shr.i.i35.i
  %94 = load i64, i64* %arrayidx.i.i36.i, align 8, !tbaa !2
  %and.i.i37.i = shl i32 %n.09.i.i34.i, 3
  %mul.i.i38.i = and i32 %and.i.i37.i, 56
  %sh_prom.i.i39.i = zext i32 %mul.i.i38.i to i64
  %shr1.i.i40.i = lshr i64 %94, %sh_prom.i.i39.i
  %conv.i.i41.i = trunc i64 %shr1.i.i40.i to i8
  %arrayidx2.i.i42.i = getelementptr inbounds i8, i8* %add.ptr.i31.i, i32 %n.09.i.i34.i
  store i8 %conv.i.i41.i, i8* %arrayidx2.i.i42.i, align 1, !tbaa !6
  %inc.i.i43.i = add nuw nsw i32 %n.09.i.i34.i, 1
  %exitcond.i.i44.i = icmp eq i32 %inc.i.i43.i, %spec.store.select.i30.i
  br i1 %exitcond.i.i44.i, label %Skein_Put64_LSB_First.exit.i47.i, label %for.body.i.i45.i

Skein_Put64_LSB_First.exit.i47.i:                 ; preds = %for.body.i.i45.i, %for.body.i33.i
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 8 dereferenceable(32) %87, i8* nonnull align 16 dereferenceable(32) %X.0.X.0..sroa_cast.i2.i, i32 32, i1 false) #3
  %indvars.iv.next.i46.i = add nuw nsw i64 %indvars.iv.i20.i, 32
  %add74.i.i = add nuw nsw i32 %i.03.i21.i, 32
  %cmp16.i.i = icmp ult i64 %indvars.iv.next.i46.i, %89
  br i1 %cmp16.i.i, label %for.body.i33.i, label %Skein_256_Final.exit.i

Skein_256_Final.exit.i:                           ; preds = %Skein_Put64_LSB_First.exit.i47.i, %if.end.i17.i
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %X.0.X.0..sroa_cast.i2.i)
  br label %Final.exit

sw.bb4.i:                                         ; preds = %Update.exit
  %ctx1024.i33 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0
  %X.0.X.0..sroa_cast.i49.i = bitcast [16 x i64]* %X.i48.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %X.0.X.0..sroa_cast.i49.i)
  %arrayidx.i50.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 2, i32 1
  %95 = load i64, i64* %arrayidx.i50.i, align 8, !tbaa !2
  %or.i51.i = or i64 %95, -9223372036854775808
  store i64 %or.i51.i, i64* %arrayidx.i50.i, align 8, !tbaa !2
  %bCnt.i52.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 1
  %96 = load i32, i32* %bCnt.i52.i, align 4, !tbaa !17
  %cmp.i53.i = icmp ult i32 %96, 128
  br i1 %cmp.i53.i, label %if.then.i57.i, label %if.end.i64.i

if.then.i57.i:                                    ; preds = %sw.bb4.i
  %arrayidx4.i54.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 2, i32 %96
  %sub.i55.i = sub nuw nsw i32 128, %96
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 %arrayidx4.i54.i, i8 0, i32 %sub.i55.i, i1 false) #3
  %.pre.i56.i = load i32, i32* %bCnt.i52.i, align 4, !tbaa !17
  br label %if.end.i64.i

if.end.i64.i:                                     ; preds = %if.then.i57.i, %sw.bb4.i
  %97 = phi i32 [ %.pre.i56.i, %if.then.i57.i ], [ %96, %sw.bb4.i ]
  %arraydecay.i58.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 2, i32 0
  call fastcc void @Skein1024_Process_Block(%struct.Skein1024_Ctxt_t* nonnull %ctx1024.i33, i8* nonnull %arraydecay.i58.i, i32 1, i32 %97) #3
  %hashBitLen.i59.i = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx1024.i33, i32 0, i32 0, i32 0
  %98 = load i32, i32* %hashBitLen.i59.i, align 8, !tbaa !15
  %add.i60.i = add i32 %98, 7
  %shr.i61.i = lshr i32 %add.i60.i, 3
  call void @llvm.memset.p0i8.i32(i8* nonnull align 8 dereferenceable(128) %arraydecay.i58.i, i8 0, i32 128, i1 false) #3
  %arraydecay15.i62.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 1, i32 0
  %99 = bitcast i64* %arraydecay15.i62.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 dereferenceable(128) %X.0.X.0..sroa_cast.i49.i, i8* nonnull align 8 dereferenceable(128) %99, i32 128, i1 false) #3
  %cmp162.i63.i = icmp eq i32 %shr.i61.i, 0
  br i1 %cmp162.i63.i, label %Skein1024_Final.exit.i, label %for.body.lr.ph.i67.i

for.body.lr.ph.i67.i:                             ; preds = %if.end.i64.i
  %100 = bitcast i8* %arraydecay.i58.i to i64*
  %arrayidx56.i65.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 0, i32 2, i32 0
  %101 = add nsw i32 %shr.i61.i, -1
  %102 = lshr i32 %101, 7
  %103 = add nuw nsw i32 %102, 1
  %wide.trip.count.i66.i = zext i32 %103 to i64
  br label %for.body.i84.i

for.body.i84.i:                                   ; preds = %Skein_Put64_LSB_First.exit.i101.i, %for.body.lr.ph.i67.i
  %indvars.iv.i68.i = phi i64 [ 0, %for.body.lr.ph.i67.i ], [ %indvars.iv.next.i97.i, %Skein_Put64_LSB_First.exit.i101.i ]
  %mul4.i69.i = phi i32 [ 0, %for.body.lr.ph.i67.i ], [ %mul.i99.i, %Skein_Put64_LSB_First.exit.i101.i ]
  %i.03.i70.i = phi i32 [ 0, %for.body.lr.ph.i67.i ], [ %inc.i98.i, %Skein_Put64_LSB_First.exit.i101.i ]
  %shl.i71.i = shl i64 %indvars.iv.i68.i, 56
  %104 = shl i64 %indvars.iv.i68.i, 40
  %shl20.i72.i = and i64 %104, 71776119061217280
  %or21.i73.i = or i64 %shl20.i72.i, %shl.i71.i
  %105 = shl nuw nsw i64 %indvars.iv.i68.i, 24
  %shl25.i74.i = and i64 %105, 280375465082880
  %or26.i75.i = or i64 %or21.i73.i, %shl25.i74.i
  %shr28.i76.i = lshr i64 %indvars.iv.i68.i, 24
  %shl30.i77.i = shl nuw nsw i64 %shr28.i76.i, 32
  %or31.i78.i = or i64 %or26.i75.i, %shl30.i77.i
  store i64 %or31.i78.i, i64* %100, align 8, !tbaa !2
  store i64 0, i64* %arrayidx56.i65.i, align 8, !tbaa !2
  store i64 -72057594037927936, i64* %arrayidx.i50.i, align 8, !tbaa !2
  store i32 0, i32* %bCnt.i52.i, align 4, !tbaa !17
  call fastcc void @Skein1024_Process_Block(%struct.Skein1024_Ctxt_t* nonnull %ctx1024.i33, i8* nonnull %arraydecay.i58.i, i32 1, i32 8) #3
  %sub65.i79.i = sub nsw i32 %shr.i61.i, %mul4.i69.i
  %cmp66.inv.i80.i = icmp ult i32 %sub65.i79.i, 128
  %spec.store.select.i81.i = select i1 %cmp66.inv.i80.i, i32 %sub65.i79.i, i32 128
  %add.ptr.i82.i = getelementptr inbounds i8, i8* %hashval, i32 %mul4.i69.i
  %cmp8.i.i83.i = icmp eq i32 %spec.store.select.i81.i, 0
  br i1 %cmp8.i.i83.i, label %Skein_Put64_LSB_First.exit.i101.i, label %for.body.i.i96.i

for.body.i.i96.i:                                 ; preds = %for.body.i84.i, %for.body.i.i96.i
  %n.09.i.i85.i = phi i32 [ %inc.i.i94.i, %for.body.i.i96.i ], [ 0, %for.body.i84.i ]
  %shr.i.i86.i = lshr i32 %n.09.i.i85.i, 3
  %arrayidx.i.i87.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 1, i32 0, i32 1, i32 %shr.i.i86.i
  %106 = load i64, i64* %arrayidx.i.i87.i, align 8, !tbaa !2
  %and.i.i88.i = shl i32 %n.09.i.i85.i, 3
  %mul.i.i89.i = and i32 %and.i.i88.i, 56
  %sh_prom.i.i90.i = zext i32 %mul.i.i89.i to i64
  %shr1.i.i91.i = lshr i64 %106, %sh_prom.i.i90.i
  %conv.i.i92.i = trunc i64 %shr1.i.i91.i to i8
  %arrayidx2.i.i93.i = getelementptr inbounds i8, i8* %add.ptr.i82.i, i32 %n.09.i.i85.i
  store i8 %conv.i.i92.i, i8* %arrayidx2.i.i93.i, align 1, !tbaa !6
  %inc.i.i94.i = add nuw nsw i32 %n.09.i.i85.i, 1
  %exitcond.i.i95.i = icmp eq i32 %inc.i.i94.i, %spec.store.select.i81.i
  br i1 %exitcond.i.i95.i, label %Skein_Put64_LSB_First.exit.i101.i, label %for.body.i.i96.i

Skein_Put64_LSB_First.exit.i101.i:                ; preds = %for.body.i.i96.i, %for.body.i84.i
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 8 dereferenceable(128) %99, i8* nonnull align 16 dereferenceable(128) %X.0.X.0..sroa_cast.i49.i, i32 128, i1 false) #3
  %indvars.iv.next.i97.i = add nuw nsw i64 %indvars.iv.i68.i, 1
  %inc.i98.i = add nuw nsw i32 %i.03.i70.i, 1
  %mul.i99.i = shl i32 %inc.i98.i, 7
  %exitcond.i100.i = icmp eq i64 %indvars.iv.next.i97.i, %wide.trip.count.i66.i
  br i1 %exitcond.i100.i, label %Skein1024_Final.exit.i, label %for.body.i84.i

Skein1024_Final.exit.i:                           ; preds = %Skein_Put64_LSB_First.exit.i101.i, %if.end.i64.i
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %X.0.X.0..sroa_cast.i49.i)
  br label %Final.exit

Final.exit:                                       ; preds = %Update.exit, %Skein_512_Final.exit.i, %Skein_256_Final.exit.i, %Skein1024_Final.exit.i
  call void @llvm.lifetime.end.p0i8(i64 288, i8* nonnull %0) #3
  ret i32 %retval.1.i
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #1

; Function Attrs: nounwind
define internal fastcc void @Skein_512_Process_Block(%struct.Skein_512_Ctxt_t* nocapture %ctx, i8* nocapture readonly %blkPtr, i32 %blkCnt, i32 %byteCntAdd) unnamed_addr #2 {
entry:
  %w = alloca [8 x i64], align 16
  %0 = bitcast [8 x i64]* %w to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %0) #3
  %arrayidx = getelementptr inbounds %struct.Skein_512_Ctxt_t, %struct.Skein_512_Ctxt_t* %ctx, i32 0, i32 0, i32 2, i32 0
  %1 = load i64, i64* %arrayidx, align 8, !tbaa !2
  %arrayidx4 = getelementptr inbounds %struct.Skein_512_Ctxt_t, %struct.Skein_512_Ctxt_t* %ctx, i32 0, i32 0, i32 2, i32 1
  %2 = load i64, i64* %arrayidx4, align 8, !tbaa !2
  %conv = zext i32 %byteCntAdd to i64
  %arrayidx11 = getelementptr inbounds %struct.Skein_512_Ctxt_t, %struct.Skein_512_Ctxt_t* %ctx, i32 0, i32 1, i32 0
  %arrayidx16 = getelementptr inbounds %struct.Skein_512_Ctxt_t, %struct.Skein_512_Ctxt_t* %ctx, i32 0, i32 1, i32 1
  %arrayidx21 = getelementptr inbounds %struct.Skein_512_Ctxt_t, %struct.Skein_512_Ctxt_t* %ctx, i32 0, i32 1, i32 2
  %arrayidx26 = getelementptr inbounds %struct.Skein_512_Ctxt_t, %struct.Skein_512_Ctxt_t* %ctx, i32 0, i32 1, i32 3
  %arrayidx31 = getelementptr inbounds %struct.Skein_512_Ctxt_t, %struct.Skein_512_Ctxt_t* %ctx, i32 0, i32 1, i32 4
  %arrayidx36 = getelementptr inbounds %struct.Skein_512_Ctxt_t, %struct.Skein_512_Ctxt_t* %ctx, i32 0, i32 1, i32 5
  %arrayidx41 = getelementptr inbounds %struct.Skein_512_Ctxt_t, %struct.Skein_512_Ctxt_t* %ctx, i32 0, i32 1, i32 6
  %arrayidx46 = getelementptr inbounds %struct.Skein_512_Ctxt_t, %struct.Skein_512_Ctxt_t* %ctx, i32 0, i32 1, i32 7
  %arraydecay94 = getelementptr inbounds [8 x i64], [8 x i64]* %w, i32 0, i32 0
  %arrayidx100 = getelementptr inbounds [8 x i64], [8 x i64]* %w, i32 0, i32 1
  %arrayidx105 = getelementptr inbounds [8 x i64], [8 x i64]* %w, i32 0, i32 2
  %arrayidx110 = getelementptr inbounds [8 x i64], [8 x i64]* %w, i32 0, i32 3
  %arrayidx115 = getelementptr inbounds [8 x i64], [8 x i64]* %w, i32 0, i32 4
  %arrayidx120 = getelementptr inbounds [8 x i64], [8 x i64]* %w, i32 0, i32 5
  %arrayidx129 = getelementptr inbounds [8 x i64], [8 x i64]* %w, i32 0, i32 6
  %arrayidx138 = getelementptr inbounds [8 x i64], [8 x i64]* %w, i32 0, i32 7
  %.pre = load i64, i64* %arrayidx11, align 8, !tbaa !2
  %.pre4488 = load i64, i64* %arrayidx16, align 8, !tbaa !2
  %.pre4489 = load i64, i64* %arrayidx21, align 8, !tbaa !2
  %.pre4490 = load i64, i64* %arrayidx26, align 8, !tbaa !2
  %.pre4491 = load i64, i64* %arrayidx31, align 8, !tbaa !2
  %.pre4492 = load i64, i64* %arrayidx36, align 8, !tbaa !2
  %.pre4493 = load i64, i64* %arrayidx41, align 8, !tbaa !2
  %.pre4494 = load i64, i64* %arrayidx46, align 8, !tbaa !2
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %3 = phi i64 [ %.pre4494, %entry ], [ %xor2366, %do.body ]
  %4 = phi i64 [ %.pre4493, %entry ], [ %xor2362, %do.body ]
  %5 = phi i64 [ %.pre4492, %entry ], [ %xor2358, %do.body ]
  %6 = phi i64 [ %.pre4491, %entry ], [ %xor2354, %do.body ]
  %7 = phi i64 [ %.pre4490, %entry ], [ %xor2350, %do.body ]
  %8 = phi i64 [ %.pre4489, %entry ], [ %xor2346, %do.body ]
  %9 = phi i64 [ %.pre4488, %entry ], [ %xor2342, %do.body ]
  %10 = phi i64 [ %.pre, %entry ], [ %xor2338, %do.body ]
  %kw.sroa.0.0 = phi i64 [ %1, %entry ], [ %add, %do.body ]
  %kw.sroa.20.0 = phi i64 [ %2, %entry ], [ %and, %do.body ]
  %blkCnt.addr.0 = phi i32 [ %blkCnt, %entry ], [ %dec, %do.body ]
  %blkPtr.addr.0 = phi i8* [ %blkPtr, %entry ], [ %add.ptr143, %do.body ]
  %xor = xor i64 %10, 2004413935125273122
  %xor59 = xor i64 %xor, %9
  %xor63 = xor i64 %xor59, %8
  %xor67 = xor i64 %xor63, %7
  %xor71 = xor i64 %xor67, %6
  %xor75 = xor i64 %xor71, %5
  %xor79 = xor i64 %xor75, %4
  %xor80 = xor i64 %xor79, %3
  %11 = load i8, i8* %blkPtr.addr.0, align 1, !tbaa !6
  %conv.i = zext i8 %11 to i64
  %arrayidx1.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 1
  %12 = load i8, i8* %arrayidx1.i, align 1, !tbaa !6
  %conv2.i = zext i8 %12 to i64
  %shl.i = shl nuw nsw i64 %conv2.i, 8
  %add3.i = or i64 %shl.i, %conv.i
  %arrayidx5.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 2
  %13 = load i8, i8* %arrayidx5.i, align 1, !tbaa !6
  %conv6.i = zext i8 %13 to i64
  %shl7.i = shl nuw nsw i64 %conv6.i, 16
  %add8.i = or i64 %add3.i, %shl7.i
  %arrayidx10.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 3
  %14 = load i8, i8* %arrayidx10.i, align 1, !tbaa !6
  %conv11.i = zext i8 %14 to i64
  %shl12.i = shl nuw nsw i64 %conv11.i, 24
  %add13.i = or i64 %add8.i, %shl12.i
  %arrayidx15.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 4
  %15 = load i8, i8* %arrayidx15.i, align 1, !tbaa !6
  %conv16.i = zext i8 %15 to i64
  %shl17.i = shl nuw nsw i64 %conv16.i, 32
  %add18.i = or i64 %add13.i, %shl17.i
  %arrayidx20.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 5
  %16 = load i8, i8* %arrayidx20.i, align 1, !tbaa !6
  %conv21.i = zext i8 %16 to i64
  %shl22.i = shl nuw nsw i64 %conv21.i, 40
  %add23.i = or i64 %add18.i, %shl22.i
  %arrayidx25.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 6
  %17 = load i8, i8* %arrayidx25.i, align 1, !tbaa !6
  %conv26.i = zext i8 %17 to i64
  %shl27.i = shl nuw nsw i64 %conv26.i, 48
  %add28.i = add i64 %add23.i, %shl27.i
  %arrayidx30.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 7
  %18 = load i8, i8* %arrayidx30.i, align 1, !tbaa !6
  %conv31.i = zext i8 %18 to i64
  %shl32.i = shl nuw i64 %conv31.i, 56
  %add33.i = add i64 %add28.i, %shl32.i
  store i64 %add33.i, i64* %arraydecay94, align 16, !tbaa !2
  %arrayidx.i.1 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 8
  %19 = load i8, i8* %arrayidx.i.1, align 1, !tbaa !6
  %conv.i.1 = zext i8 %19 to i64
  %arrayidx1.i.1 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 9
  %20 = load i8, i8* %arrayidx1.i.1, align 1, !tbaa !6
  %conv2.i.1 = zext i8 %20 to i64
  %shl.i.1 = shl nuw nsw i64 %conv2.i.1, 8
  %add3.i.1 = or i64 %shl.i.1, %conv.i.1
  %arrayidx5.i.1 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 10
  %21 = load i8, i8* %arrayidx5.i.1, align 1, !tbaa !6
  %conv6.i.1 = zext i8 %21 to i64
  %shl7.i.1 = shl nuw nsw i64 %conv6.i.1, 16
  %add8.i.1 = or i64 %add3.i.1, %shl7.i.1
  %arrayidx10.i.1 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 11
  %22 = load i8, i8* %arrayidx10.i.1, align 1, !tbaa !6
  %conv11.i.1 = zext i8 %22 to i64
  %shl12.i.1 = shl nuw nsw i64 %conv11.i.1, 24
  %add13.i.1 = or i64 %add8.i.1, %shl12.i.1
  %arrayidx15.i.1 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 12
  %23 = load i8, i8* %arrayidx15.i.1, align 1, !tbaa !6
  %conv16.i.1 = zext i8 %23 to i64
  %shl17.i.1 = shl nuw nsw i64 %conv16.i.1, 32
  %add18.i.1 = or i64 %add13.i.1, %shl17.i.1
  %arrayidx20.i.1 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 13
  %24 = load i8, i8* %arrayidx20.i.1, align 1, !tbaa !6
  %conv21.i.1 = zext i8 %24 to i64
  %shl22.i.1 = shl nuw nsw i64 %conv21.i.1, 40
  %add23.i.1 = or i64 %add18.i.1, %shl22.i.1
  %arrayidx25.i.1 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 14
  %25 = load i8, i8* %arrayidx25.i.1, align 1, !tbaa !6
  %conv26.i.1 = zext i8 %25 to i64
  %shl27.i.1 = shl nuw nsw i64 %conv26.i.1, 48
  %add28.i.1 = add i64 %add23.i.1, %shl27.i.1
  %arrayidx30.i.1 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 15
  %26 = load i8, i8* %arrayidx30.i.1, align 1, !tbaa !6
  %conv31.i.1 = zext i8 %26 to i64
  %shl32.i.1 = shl nuw i64 %conv31.i.1, 56
  %add33.i.1 = add i64 %add28.i.1, %shl32.i.1
  store i64 %add33.i.1, i64* %arrayidx100, align 8, !tbaa !2
  %arrayidx.i.2 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 16
  %27 = load i8, i8* %arrayidx.i.2, align 1, !tbaa !6
  %conv.i.2 = zext i8 %27 to i64
  %arrayidx1.i.2 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 17
  %28 = load i8, i8* %arrayidx1.i.2, align 1, !tbaa !6
  %conv2.i.2 = zext i8 %28 to i64
  %shl.i.2 = shl nuw nsw i64 %conv2.i.2, 8
  %add3.i.2 = or i64 %shl.i.2, %conv.i.2
  %arrayidx5.i.2 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 18
  %29 = load i8, i8* %arrayidx5.i.2, align 1, !tbaa !6
  %conv6.i.2 = zext i8 %29 to i64
  %shl7.i.2 = shl nuw nsw i64 %conv6.i.2, 16
  %add8.i.2 = or i64 %add3.i.2, %shl7.i.2
  %arrayidx10.i.2 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 19
  %30 = load i8, i8* %arrayidx10.i.2, align 1, !tbaa !6
  %conv11.i.2 = zext i8 %30 to i64
  %shl12.i.2 = shl nuw nsw i64 %conv11.i.2, 24
  %add13.i.2 = or i64 %add8.i.2, %shl12.i.2
  %arrayidx15.i.2 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 20
  %31 = load i8, i8* %arrayidx15.i.2, align 1, !tbaa !6
  %conv16.i.2 = zext i8 %31 to i64
  %shl17.i.2 = shl nuw nsw i64 %conv16.i.2, 32
  %add18.i.2 = or i64 %add13.i.2, %shl17.i.2
  %arrayidx20.i.2 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 21
  %32 = load i8, i8* %arrayidx20.i.2, align 1, !tbaa !6
  %conv21.i.2 = zext i8 %32 to i64
  %shl22.i.2 = shl nuw nsw i64 %conv21.i.2, 40
  %add23.i.2 = or i64 %add18.i.2, %shl22.i.2
  %arrayidx25.i.2 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 22
  %33 = load i8, i8* %arrayidx25.i.2, align 1, !tbaa !6
  %conv26.i.2 = zext i8 %33 to i64
  %shl27.i.2 = shl nuw nsw i64 %conv26.i.2, 48
  %add28.i.2 = add i64 %add23.i.2, %shl27.i.2
  %arrayidx30.i.2 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 23
  %34 = load i8, i8* %arrayidx30.i.2, align 1, !tbaa !6
  %conv31.i.2 = zext i8 %34 to i64
  %shl32.i.2 = shl nuw i64 %conv31.i.2, 56
  %add33.i.2 = add i64 %add28.i.2, %shl32.i.2
  store i64 %add33.i.2, i64* %arrayidx105, align 16, !tbaa !2
  %arrayidx.i.3 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 24
  %35 = load i8, i8* %arrayidx.i.3, align 1, !tbaa !6
  %conv.i.3 = zext i8 %35 to i64
  %arrayidx1.i.3 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 25
  %36 = load i8, i8* %arrayidx1.i.3, align 1, !tbaa !6
  %conv2.i.3 = zext i8 %36 to i64
  %shl.i.3 = shl nuw nsw i64 %conv2.i.3, 8
  %add3.i.3 = or i64 %shl.i.3, %conv.i.3
  %arrayidx5.i.3 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 26
  %37 = load i8, i8* %arrayidx5.i.3, align 1, !tbaa !6
  %conv6.i.3 = zext i8 %37 to i64
  %shl7.i.3 = shl nuw nsw i64 %conv6.i.3, 16
  %add8.i.3 = or i64 %add3.i.3, %shl7.i.3
  %arrayidx10.i.3 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 27
  %38 = load i8, i8* %arrayidx10.i.3, align 1, !tbaa !6
  %conv11.i.3 = zext i8 %38 to i64
  %shl12.i.3 = shl nuw nsw i64 %conv11.i.3, 24
  %add13.i.3 = or i64 %add8.i.3, %shl12.i.3
  %arrayidx15.i.3 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 28
  %39 = load i8, i8* %arrayidx15.i.3, align 1, !tbaa !6
  %conv16.i.3 = zext i8 %39 to i64
  %shl17.i.3 = shl nuw nsw i64 %conv16.i.3, 32
  %add18.i.3 = or i64 %add13.i.3, %shl17.i.3
  %arrayidx20.i.3 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 29
  %40 = load i8, i8* %arrayidx20.i.3, align 1, !tbaa !6
  %conv21.i.3 = zext i8 %40 to i64
  %shl22.i.3 = shl nuw nsw i64 %conv21.i.3, 40
  %add23.i.3 = or i64 %add18.i.3, %shl22.i.3
  %arrayidx25.i.3 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 30
  %41 = load i8, i8* %arrayidx25.i.3, align 1, !tbaa !6
  %conv26.i.3 = zext i8 %41 to i64
  %shl27.i.3 = shl nuw nsw i64 %conv26.i.3, 48
  %add28.i.3 = add i64 %add23.i.3, %shl27.i.3
  %arrayidx30.i.3 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 31
  %42 = load i8, i8* %arrayidx30.i.3, align 1, !tbaa !6
  %conv31.i.3 = zext i8 %42 to i64
  %shl32.i.3 = shl nuw i64 %conv31.i.3, 56
  %add33.i.3 = add i64 %add28.i.3, %shl32.i.3
  store i64 %add33.i.3, i64* %arrayidx110, align 8, !tbaa !2
  %arrayidx.i.4 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 32
  %43 = load i8, i8* %arrayidx.i.4, align 1, !tbaa !6
  %conv.i.4 = zext i8 %43 to i64
  %arrayidx1.i.4 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 33
  %44 = load i8, i8* %arrayidx1.i.4, align 1, !tbaa !6
  %conv2.i.4 = zext i8 %44 to i64
  %shl.i.4 = shl nuw nsw i64 %conv2.i.4, 8
  %add3.i.4 = or i64 %shl.i.4, %conv.i.4
  %arrayidx5.i.4 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 34
  %45 = load i8, i8* %arrayidx5.i.4, align 1, !tbaa !6
  %conv6.i.4 = zext i8 %45 to i64
  %shl7.i.4 = shl nuw nsw i64 %conv6.i.4, 16
  %add8.i.4 = or i64 %add3.i.4, %shl7.i.4
  %arrayidx10.i.4 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 35
  %46 = load i8, i8* %arrayidx10.i.4, align 1, !tbaa !6
  %conv11.i.4 = zext i8 %46 to i64
  %shl12.i.4 = shl nuw nsw i64 %conv11.i.4, 24
  %add13.i.4 = or i64 %add8.i.4, %shl12.i.4
  %arrayidx15.i.4 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 36
  %47 = load i8, i8* %arrayidx15.i.4, align 1, !tbaa !6
  %conv16.i.4 = zext i8 %47 to i64
  %shl17.i.4 = shl nuw nsw i64 %conv16.i.4, 32
  %add18.i.4 = or i64 %add13.i.4, %shl17.i.4
  %arrayidx20.i.4 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 37
  %48 = load i8, i8* %arrayidx20.i.4, align 1, !tbaa !6
  %conv21.i.4 = zext i8 %48 to i64
  %shl22.i.4 = shl nuw nsw i64 %conv21.i.4, 40
  %add23.i.4 = or i64 %add18.i.4, %shl22.i.4
  %arrayidx25.i.4 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 38
  %49 = load i8, i8* %arrayidx25.i.4, align 1, !tbaa !6
  %conv26.i.4 = zext i8 %49 to i64
  %shl27.i.4 = shl nuw nsw i64 %conv26.i.4, 48
  %add28.i.4 = add i64 %add23.i.4, %shl27.i.4
  %arrayidx30.i.4 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 39
  %50 = load i8, i8* %arrayidx30.i.4, align 1, !tbaa !6
  %conv31.i.4 = zext i8 %50 to i64
  %shl32.i.4 = shl nuw i64 %conv31.i.4, 56
  %add33.i.4 = add i64 %add28.i.4, %shl32.i.4
  store i64 %add33.i.4, i64* %arrayidx115, align 16, !tbaa !2
  %arrayidx.i.5 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 40
  %51 = load i8, i8* %arrayidx.i.5, align 1, !tbaa !6
  %conv.i.5 = zext i8 %51 to i64
  %arrayidx1.i.5 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 41
  %52 = load i8, i8* %arrayidx1.i.5, align 1, !tbaa !6
  %conv2.i.5 = zext i8 %52 to i64
  %shl.i.5 = shl nuw nsw i64 %conv2.i.5, 8
  %add3.i.5 = or i64 %shl.i.5, %conv.i.5
  %arrayidx5.i.5 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 42
  %53 = load i8, i8* %arrayidx5.i.5, align 1, !tbaa !6
  %conv6.i.5 = zext i8 %53 to i64
  %shl7.i.5 = shl nuw nsw i64 %conv6.i.5, 16
  %add8.i.5 = or i64 %add3.i.5, %shl7.i.5
  %arrayidx10.i.5 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 43
  %54 = load i8, i8* %arrayidx10.i.5, align 1, !tbaa !6
  %conv11.i.5 = zext i8 %54 to i64
  %shl12.i.5 = shl nuw nsw i64 %conv11.i.5, 24
  %add13.i.5 = or i64 %add8.i.5, %shl12.i.5
  %arrayidx15.i.5 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 44
  %55 = load i8, i8* %arrayidx15.i.5, align 1, !tbaa !6
  %conv16.i.5 = zext i8 %55 to i64
  %shl17.i.5 = shl nuw nsw i64 %conv16.i.5, 32
  %add18.i.5 = or i64 %add13.i.5, %shl17.i.5
  %arrayidx20.i.5 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 45
  %56 = load i8, i8* %arrayidx20.i.5, align 1, !tbaa !6
  %conv21.i.5 = zext i8 %56 to i64
  %shl22.i.5 = shl nuw nsw i64 %conv21.i.5, 40
  %add23.i.5 = or i64 %add18.i.5, %shl22.i.5
  %arrayidx25.i.5 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 46
  %57 = load i8, i8* %arrayidx25.i.5, align 1, !tbaa !6
  %conv26.i.5 = zext i8 %57 to i64
  %shl27.i.5 = shl nuw nsw i64 %conv26.i.5, 48
  %add28.i.5 = add i64 %add23.i.5, %shl27.i.5
  %arrayidx30.i.5 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 47
  %58 = load i8, i8* %arrayidx30.i.5, align 1, !tbaa !6
  %conv31.i.5 = zext i8 %58 to i64
  %shl32.i.5 = shl nuw i64 %conv31.i.5, 56
  %add33.i.5 = add i64 %add28.i.5, %shl32.i.5
  store i64 %add33.i.5, i64* %arrayidx120, align 8, !tbaa !2
  %arrayidx.i.6 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 48
  %59 = load i8, i8* %arrayidx.i.6, align 1, !tbaa !6
  %conv.i.6 = zext i8 %59 to i64
  %arrayidx1.i.6 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 49
  %60 = load i8, i8* %arrayidx1.i.6, align 1, !tbaa !6
  %conv2.i.6 = zext i8 %60 to i64
  %shl.i.6 = shl nuw nsw i64 %conv2.i.6, 8
  %add3.i.6 = or i64 %shl.i.6, %conv.i.6
  %arrayidx5.i.6 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 50
  %61 = load i8, i8* %arrayidx5.i.6, align 1, !tbaa !6
  %conv6.i.6 = zext i8 %61 to i64
  %shl7.i.6 = shl nuw nsw i64 %conv6.i.6, 16
  %add8.i.6 = or i64 %add3.i.6, %shl7.i.6
  %arrayidx10.i.6 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 51
  %62 = load i8, i8* %arrayidx10.i.6, align 1, !tbaa !6
  %conv11.i.6 = zext i8 %62 to i64
  %shl12.i.6 = shl nuw nsw i64 %conv11.i.6, 24
  %add13.i.6 = or i64 %add8.i.6, %shl12.i.6
  %arrayidx15.i.6 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 52
  %63 = load i8, i8* %arrayidx15.i.6, align 1, !tbaa !6
  %conv16.i.6 = zext i8 %63 to i64
  %shl17.i.6 = shl nuw nsw i64 %conv16.i.6, 32
  %add18.i.6 = or i64 %add13.i.6, %shl17.i.6
  %arrayidx20.i.6 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 53
  %64 = load i8, i8* %arrayidx20.i.6, align 1, !tbaa !6
  %conv21.i.6 = zext i8 %64 to i64
  %shl22.i.6 = shl nuw nsw i64 %conv21.i.6, 40
  %add23.i.6 = or i64 %add18.i.6, %shl22.i.6
  %arrayidx25.i.6 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 54
  %65 = load i8, i8* %arrayidx25.i.6, align 1, !tbaa !6
  %conv26.i.6 = zext i8 %65 to i64
  %shl27.i.6 = shl nuw nsw i64 %conv26.i.6, 48
  %add28.i.6 = add i64 %add23.i.6, %shl27.i.6
  %arrayidx30.i.6 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 55
  %66 = load i8, i8* %arrayidx30.i.6, align 1, !tbaa !6
  %conv31.i.6 = zext i8 %66 to i64
  %shl32.i.6 = shl nuw i64 %conv31.i.6, 56
  %add33.i.6 = add i64 %add28.i.6, %shl32.i.6
  store i64 %add33.i.6, i64* %arrayidx129, align 16, !tbaa !2
  %arrayidx.i.7 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 56
  %67 = load i8, i8* %arrayidx.i.7, align 1, !tbaa !6
  %conv.i.7 = zext i8 %67 to i64
  %arrayidx1.i.7 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 57
  %68 = load i8, i8* %arrayidx1.i.7, align 1, !tbaa !6
  %conv2.i.7 = zext i8 %68 to i64
  %shl.i.7 = shl nuw nsw i64 %conv2.i.7, 8
  %add3.i.7 = or i64 %shl.i.7, %conv.i.7
  %arrayidx5.i.7 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 58
  %69 = load i8, i8* %arrayidx5.i.7, align 1, !tbaa !6
  %conv6.i.7 = zext i8 %69 to i64
  %shl7.i.7 = shl nuw nsw i64 %conv6.i.7, 16
  %add8.i.7 = or i64 %add3.i.7, %shl7.i.7
  %arrayidx10.i.7 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 59
  %70 = load i8, i8* %arrayidx10.i.7, align 1, !tbaa !6
  %conv11.i.7 = zext i8 %70 to i64
  %shl12.i.7 = shl nuw nsw i64 %conv11.i.7, 24
  %add13.i.7 = or i64 %add8.i.7, %shl12.i.7
  %arrayidx15.i.7 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 60
  %71 = load i8, i8* %arrayidx15.i.7, align 1, !tbaa !6
  %conv16.i.7 = zext i8 %71 to i64
  %shl17.i.7 = shl nuw nsw i64 %conv16.i.7, 32
  %add18.i.7 = or i64 %add13.i.7, %shl17.i.7
  %arrayidx20.i.7 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 61
  %72 = load i8, i8* %arrayidx20.i.7, align 1, !tbaa !6
  %conv21.i.7 = zext i8 %72 to i64
  %shl22.i.7 = shl nuw nsw i64 %conv21.i.7, 40
  %add23.i.7 = or i64 %add18.i.7, %shl22.i.7
  %arrayidx25.i.7 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 62
  %73 = load i8, i8* %arrayidx25.i.7, align 1, !tbaa !6
  %conv26.i.7 = zext i8 %73 to i64
  %shl27.i.7 = shl nuw nsw i64 %conv26.i.7, 48
  %add28.i.7 = add i64 %add23.i.7, %shl27.i.7
  %arrayidx30.i.7 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 63
  %74 = load i8, i8* %arrayidx30.i.7, align 1, !tbaa !6
  %conv31.i.7 = zext i8 %74 to i64
  %shl32.i.7 = shl nuw i64 %conv31.i.7, 56
  %add33.i.7 = add i64 %add28.i.7, %shl32.i.7
  store i64 %add33.i.7, i64* %arrayidx138, align 8, !tbaa !2
  %add = add i64 %kw.sroa.0.0, %conv
  %xor90 = xor i64 %add, %kw.sroa.20.0
  %75 = load i64, i64* %arraydecay94, align 16, !tbaa !2
  %add99 = add i64 %75, %10
  %76 = load i64, i64* %arrayidx100, align 8, !tbaa !2
  %add104 = add i64 %76, %9
  %77 = load i64, i64* %arrayidx105, align 16, !tbaa !2
  %add109 = add i64 %77, %8
  %78 = load i64, i64* %arrayidx110, align 8, !tbaa !2
  %add114 = add i64 %78, %7
  %79 = load i64, i64* %arrayidx115, align 16, !tbaa !2
  %add119 = add i64 %79, %6
  %add124 = add i64 %5, %add
  %add128 = add i64 %add124, %add33.i.5
  %add142 = add i64 %add33.i.7, %3
  %add.ptr143 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 64
  %add144 = add i64 %add99, %add104
  %shl = shl i64 %add104, 46
  %shr = lshr i64 %add104, 18
  %or = or i64 %shl, %shr
  %xor145 = xor i64 %or, %add144
  %add146 = add i64 %add109, %add114
  %shl147 = shl i64 %add114, 36
  %shr148 = lshr i64 %add114, 28
  %or149 = or i64 %shl147, %shr148
  %xor150 = xor i64 %or149, %add146
  %add151 = add i64 %add119, %add128
  %shl152 = shl i64 %add128, 19
  %shr153 = lshr i64 %add128, 45
  %or154 = or i64 %shl152, %shr153
  %xor155 = xor i64 %or154, %add151
  %add133 = add i64 %4, %kw.sroa.20.0
  %add137 = add i64 %add133, %add33.i.6
  %add156 = add i64 %add137, %add142
  %shl157 = shl i64 %add142, 37
  %shr158 = lshr i64 %add142, 27
  %or159 = or i64 %shl157, %shr158
  %xor160 = xor i64 %or159, %add156
  %add161 = add i64 %add146, %xor145
  %shl162 = shl i64 %xor145, 33
  %shr163 = lshr i64 %xor145, 31
  %or164 = or i64 %shl162, %shr163
  %xor165 = xor i64 %or164, %add161
  %add166 = add i64 %xor160, %add151
  %shl167 = shl i64 %xor160, 27
  %shr168 = lshr i64 %xor160, 37
  %or169 = or i64 %shl167, %shr168
  %xor170 = xor i64 %or169, %add166
  %add171 = add i64 %xor155, %add156
  %shl172 = shl i64 %xor155, 14
  %shr173 = lshr i64 %xor155, 50
  %or174 = or i64 %shl172, %shr173
  %xor175 = xor i64 %or174, %add171
  %add176 = add i64 %xor150, %add144
  %shl177 = shl i64 %xor150, 42
  %shr178 = lshr i64 %xor150, 22
  %or179 = or i64 %shl177, %shr178
  %xor180 = xor i64 %or179, %add176
  %add181 = add i64 %add166, %xor165
  %shl182 = shl i64 %xor165, 17
  %shr183 = lshr i64 %xor165, 47
  %or184 = or i64 %shl182, %shr183
  %xor185 = xor i64 %add181, %or184
  %add186 = add i64 %add171, %xor180
  %shl187 = shl i64 %xor180, 49
  %shr188 = lshr i64 %xor180, 15
  %or189 = or i64 %shl187, %shr188
  %xor190 = xor i64 %or189, %add186
  %add191 = add i64 %xor175, %add176
  %shl192 = shl i64 %xor175, 36
  %shr193 = lshr i64 %xor175, 28
  %or194 = or i64 %shl192, %shr193
  %xor195 = xor i64 %or194, %add191
  %add196 = add i64 %xor170, %add161
  %shl197 = shl i64 %xor170, 39
  %shr198 = lshr i64 %xor170, 25
  %or199 = or i64 %shl197, %shr198
  %xor200 = xor i64 %or199, %add196
  %add201 = add i64 %xor185, %add186
  %shl202 = shl i64 %xor185, 44
  %shr203 = lshr i64 %xor185, 20
  %or204 = or i64 %shl202, %shr203
  %xor205 = xor i64 %or204, %add201
  %add206 = add i64 %xor200, %add191
  %shl207 = shl i64 %xor200, 9
  %shr208 = lshr i64 %xor200, 55
  %or209 = or i64 %shl207, %shr208
  %xor210 = xor i64 %or209, %add206
  %add211 = add i64 %xor195, %add196
  %shl212 = shl i64 %xor195, 54
  %shr213 = lshr i64 %xor195, 10
  %or214 = or i64 %shl212, %shr213
  %xor215 = xor i64 %or214, %add211
  %add216 = add i64 %add181, %xor190
  %shl217 = shl i64 %xor190, 56
  %shr218 = lshr i64 %xor190, 8
  %or219 = or i64 %shl217, %shr218
  %xor220 = xor i64 %or219, %add216
  %add224 = add i64 %add206, %9
  %add228 = add i64 %xor205, %8
  %add232 = add i64 %add211, %7
  %add236 = add i64 %xor220, %6
  %add240 = add i64 %add216, %5
  %add248 = add i64 %xor215, %add133
  %add255 = add i64 %3, %xor90
  %add256 = add i64 %add201, %add255
  %add261 = add i64 %xor80, 1
  %add262 = add i64 %add261, %xor210
  %add263 = add i64 %add224, %add228
  %shl264 = shl i64 %add228, 39
  %shr265 = lshr i64 %add228, 25
  %or266 = or i64 %shl264, %shr265
  %xor267 = xor i64 %or266, %add263
  %add268 = add i64 %add232, %add236
  %shl269 = shl i64 %add236, 30
  %shr270 = lshr i64 %add236, 34
  %or271 = or i64 %shl269, %shr270
  %xor272 = xor i64 %or271, %add268
  %add273 = add i64 %add240, %add248
  %shl274 = shl i64 %add248, 34
  %shr275 = lshr i64 %add248, 30
  %or276 = or i64 %shl274, %shr275
  %xor277 = xor i64 %or276, %add273
  %add278 = add i64 %add256, %add262
  %shl279 = shl i64 %add262, 24
  %shr280 = lshr i64 %add262, 40
  %or281 = or i64 %shl279, %shr280
  %xor282 = xor i64 %or281, %add278
  %add283 = add i64 %xor267, %add268
  %shl284 = shl i64 %xor267, 13
  %shr285 = lshr i64 %xor267, 51
  %or286 = or i64 %shl284, %shr285
  %xor287 = xor i64 %or286, %add283
  %add288 = add i64 %xor282, %add273
  %shl289 = shl i64 %xor282, 50
  %shr290 = lshr i64 %xor282, 14
  %or291 = or i64 %shl289, %shr290
  %xor292 = xor i64 %or291, %add288
  %add293 = add i64 %xor277, %add278
  %shl294 = shl i64 %xor277, 10
  %shr295 = lshr i64 %xor277, 54
  %or296 = or i64 %shl294, %shr295
  %xor297 = xor i64 %or296, %add293
  %add298 = add i64 %add263, %xor272
  %shl299 = shl i64 %xor272, 17
  %shr300 = lshr i64 %xor272, 47
  %or301 = or i64 %shl299, %shr300
  %xor302 = xor i64 %or301, %add298
  %add303 = add i64 %add288, %xor287
  %shl304 = shl i64 %xor287, 25
  %shr305 = lshr i64 %xor287, 39
  %or306 = or i64 %shl304, %shr305
  %xor307 = xor i64 %or306, %add303
  %add308 = add i64 %add293, %xor302
  %shl309 = shl i64 %xor302, 29
  %shr310 = lshr i64 %xor302, 35
  %or311 = or i64 %shl309, %shr310
  %xor312 = xor i64 %or311, %add308
  %add313 = add i64 %xor297, %add298
  %shl314 = shl i64 %xor297, 39
  %shr315 = lshr i64 %xor297, 25
  %or316 = or i64 %shl314, %shr315
  %xor317 = xor i64 %or316, %add313
  %add318 = add i64 %xor292, %add283
  %shl319 = shl i64 %xor292, 43
  %shr320 = lshr i64 %xor292, 21
  %or321 = or i64 %shl319, %shr320
  %xor322 = xor i64 %or321, %add318
  %add323 = add i64 %xor307, %add308
  %shl324 = shl i64 %xor307, 8
  %shr325 = lshr i64 %xor307, 56
  %or326 = or i64 %shl324, %shr325
  %xor327 = xor i64 %or326, %add323
  %add328 = add i64 %xor322, %add313
  %shl329 = shl i64 %xor322, 35
  %shr330 = lshr i64 %xor322, 29
  %or331 = or i64 %shl329, %shr330
  %xor332 = xor i64 %or331, %add328
  %add333 = add i64 %xor317, %add318
  %shl334 = shl i64 %xor317, 56
  %shr335 = lshr i64 %xor317, 8
  %or336 = or i64 %shl334, %shr335
  %xor337 = xor i64 %or336, %add333
  %add338 = add i64 %add303, %xor312
  %shl339 = shl i64 %xor312, 22
  %shr340 = lshr i64 %xor312, 42
  %or341 = or i64 %shl339, %shr340
  %xor342 = xor i64 %or341, %add338
  %add346 = add i64 %add328, %8
  %add350 = add i64 %xor327, %7
  %add354 = add i64 %add333, %6
  %add358 = add i64 %xor342, %5
  %add362 = add i64 %add338, %4
  %add370 = add i64 %xor337, %add255
  %add377 = add i64 %xor80, %add
  %add378 = add i64 %add323, %add377
  %add383 = add i64 %10, 2
  %add384 = add i64 %add383, %xor332
  %add385 = add i64 %add346, %add350
  %shl386 = shl i64 %add350, 46
  %shr387 = lshr i64 %add350, 18
  %or388 = or i64 %shl386, %shr387
  %xor389 = xor i64 %or388, %add385
  %add390 = add i64 %add354, %add358
  %shl391 = shl i64 %add358, 36
  %shr392 = lshr i64 %add358, 28
  %or393 = or i64 %shl391, %shr392
  %xor394 = xor i64 %or393, %add390
  %add395 = add i64 %add362, %add370
  %shl396 = shl i64 %add370, 19
  %shr397 = lshr i64 %add370, 45
  %or398 = or i64 %shl396, %shr397
  %xor399 = xor i64 %or398, %add395
  %add400 = add i64 %add378, %add384
  %shl401 = shl i64 %add384, 37
  %shr402 = lshr i64 %add384, 27
  %or403 = or i64 %shl401, %shr402
  %xor404 = xor i64 %or403, %add400
  %add405 = add i64 %xor389, %add390
  %shl406 = shl i64 %xor389, 33
  %shr407 = lshr i64 %xor389, 31
  %or408 = or i64 %shl406, %shr407
  %xor409 = xor i64 %or408, %add405
  %add410 = add i64 %xor404, %add395
  %shl411 = shl i64 %xor404, 27
  %shr412 = lshr i64 %xor404, 37
  %or413 = or i64 %shl411, %shr412
  %xor414 = xor i64 %or413, %add410
  %add415 = add i64 %xor399, %add400
  %shl416 = shl i64 %xor399, 14
  %shr417 = lshr i64 %xor399, 50
  %or418 = or i64 %shl416, %shr417
  %xor419 = xor i64 %or418, %add415
  %add420 = add i64 %add385, %xor394
  %shl421 = shl i64 %xor394, 42
  %shr422 = lshr i64 %xor394, 22
  %or423 = or i64 %shl421, %shr422
  %xor424 = xor i64 %or423, %add420
  %add425 = add i64 %add410, %xor409
  %shl426 = shl i64 %xor409, 17
  %shr427 = lshr i64 %xor409, 47
  %or428 = or i64 %shl426, %shr427
  %xor429 = xor i64 %or428, %add425
  %add430 = add i64 %add415, %xor424
  %shl431 = shl i64 %xor424, 49
  %shr432 = lshr i64 %xor424, 15
  %or433 = or i64 %shl431, %shr432
  %xor434 = xor i64 %or433, %add430
  %add435 = add i64 %xor419, %add420
  %shl436 = shl i64 %xor419, 36
  %shr437 = lshr i64 %xor419, 28
  %or438 = or i64 %shl436, %shr437
  %xor439 = xor i64 %or438, %add435
  %add440 = add i64 %xor414, %add405
  %shl441 = shl i64 %xor414, 39
  %shr442 = lshr i64 %xor414, 25
  %or443 = or i64 %shl441, %shr442
  %xor444 = xor i64 %or443, %add440
  %add445 = add i64 %xor429, %add430
  %shl446 = shl i64 %xor429, 44
  %shr447 = lshr i64 %xor429, 20
  %or448 = or i64 %shl446, %shr447
  %xor449 = xor i64 %or448, %add445
  %add450 = add i64 %xor444, %add435
  %shl451 = shl i64 %xor444, 9
  %shr452 = lshr i64 %xor444, 55
  %or453 = or i64 %shl451, %shr452
  %xor454 = xor i64 %or453, %add450
  %add455 = add i64 %xor439, %add440
  %shl456 = shl i64 %xor439, 54
  %shr457 = lshr i64 %xor439, 10
  %or458 = or i64 %shl456, %shr457
  %xor459 = xor i64 %or458, %add455
  %add460 = add i64 %add425, %xor434
  %shl461 = shl i64 %xor434, 56
  %shr462 = lshr i64 %xor434, 8
  %or463 = or i64 %shl461, %shr462
  %xor464 = xor i64 %or463, %add460
  %add468 = add i64 %add450, %7
  %add472 = add i64 %xor449, %6
  %add476 = add i64 %add455, %5
  %add480 = add i64 %xor464, %4
  %add484 = add i64 %add460, %3
  %add492 = add i64 %xor459, %add377
  %add499 = add i64 %10, %kw.sroa.20.0
  %add500 = add i64 %add445, %add499
  %add505 = add i64 %9, 3
  %add506 = add i64 %add505, %xor454
  %add507 = add i64 %add468, %add472
  %shl508 = shl i64 %add472, 39
  %shr509 = lshr i64 %add472, 25
  %or510 = or i64 %shl508, %shr509
  %xor511 = xor i64 %or510, %add507
  %add512 = add i64 %add476, %add480
  %shl513 = shl i64 %add480, 30
  %shr514 = lshr i64 %add480, 34
  %or515 = or i64 %shl513, %shr514
  %xor516 = xor i64 %or515, %add512
  %add517 = add i64 %add484, %add492
  %shl518 = shl i64 %add492, 34
  %shr519 = lshr i64 %add492, 30
  %or520 = or i64 %shl518, %shr519
  %xor521 = xor i64 %or520, %add517
  %add522 = add i64 %add500, %add506
  %shl523 = shl i64 %add506, 24
  %shr524 = lshr i64 %add506, 40
  %or525 = or i64 %shl523, %shr524
  %xor526 = xor i64 %or525, %add522
  %add527 = add i64 %xor511, %add512
  %shl528 = shl i64 %xor511, 13
  %shr529 = lshr i64 %xor511, 51
  %or530 = or i64 %shl528, %shr529
  %xor531 = xor i64 %or530, %add527
  %add532 = add i64 %xor526, %add517
  %shl533 = shl i64 %xor526, 50
  %shr534 = lshr i64 %xor526, 14
  %or535 = or i64 %shl533, %shr534
  %xor536 = xor i64 %or535, %add532
  %add537 = add i64 %xor521, %add522
  %shl538 = shl i64 %xor521, 10
  %shr539 = lshr i64 %xor521, 54
  %or540 = or i64 %shl538, %shr539
  %xor541 = xor i64 %or540, %add537
  %add542 = add i64 %add507, %xor516
  %shl543 = shl i64 %xor516, 17
  %shr544 = lshr i64 %xor516, 47
  %or545 = or i64 %shl543, %shr544
  %xor546 = xor i64 %or545, %add542
  %add547 = add i64 %add532, %xor531
  %shl548 = shl i64 %xor531, 25
  %shr549 = lshr i64 %xor531, 39
  %or550 = or i64 %shl548, %shr549
  %xor551 = xor i64 %or550, %add547
  %add552 = add i64 %add537, %xor546
  %shl553 = shl i64 %xor546, 29
  %shr554 = lshr i64 %xor546, 35
  %or555 = or i64 %shl553, %shr554
  %xor556 = xor i64 %or555, %add552
  %add557 = add i64 %xor541, %add542
  %shl558 = shl i64 %xor541, 39
  %shr559 = lshr i64 %xor541, 25
  %or560 = or i64 %shl558, %shr559
  %xor561 = xor i64 %or560, %add557
  %add562 = add i64 %xor536, %add527
  %shl563 = shl i64 %xor536, 43
  %shr564 = lshr i64 %xor536, 21
  %or565 = or i64 %shl563, %shr564
  %xor566 = xor i64 %or565, %add562
  %add567 = add i64 %xor551, %add552
  %shl568 = shl i64 %xor551, 8
  %shr569 = lshr i64 %xor551, 56
  %or570 = or i64 %shl568, %shr569
  %xor571 = xor i64 %or570, %add567
  %add572 = add i64 %xor566, %add557
  %shl573 = shl i64 %xor566, 35
  %shr574 = lshr i64 %xor566, 29
  %or575 = or i64 %shl573, %shr574
  %xor576 = xor i64 %or575, %add572
  %add577 = add i64 %xor561, %add562
  %shl578 = shl i64 %xor561, 56
  %shr579 = lshr i64 %xor561, 8
  %or580 = or i64 %shl578, %shr579
  %xor581 = xor i64 %or580, %add577
  %add582 = add i64 %add547, %xor556
  %shl583 = shl i64 %xor556, 22
  %shr584 = lshr i64 %xor556, 42
  %or585 = or i64 %shl583, %shr584
  %xor586 = xor i64 %or585, %add582
  %add590 = add i64 %add572, %6
  %add594 = add i64 %xor571, %5
  %add598 = add i64 %add577, %4
  %add602 = add i64 %xor586, %3
  %add606 = add i64 %add582, %xor80
  %add614 = add i64 %xor581, %add499
  %add621 = add i64 %9, %xor90
  %add622 = add i64 %add567, %add621
  %add627 = add i64 %8, 4
  %add628 = add i64 %add627, %xor576
  %add629 = add i64 %add590, %add594
  %shl630 = shl i64 %add594, 46
  %shr631 = lshr i64 %add594, 18
  %or632 = or i64 %shl630, %shr631
  %xor633 = xor i64 %or632, %add629
  %add634 = add i64 %add598, %add602
  %shl635 = shl i64 %add602, 36
  %shr636 = lshr i64 %add602, 28
  %or637 = or i64 %shl635, %shr636
  %xor638 = xor i64 %or637, %add634
  %add639 = add i64 %add606, %add614
  %shl640 = shl i64 %add614, 19
  %shr641 = lshr i64 %add614, 45
  %or642 = or i64 %shl640, %shr641
  %xor643 = xor i64 %or642, %add639
  %add644 = add i64 %add622, %add628
  %shl645 = shl i64 %add628, 37
  %shr646 = lshr i64 %add628, 27
  %or647 = or i64 %shl645, %shr646
  %xor648 = xor i64 %or647, %add644
  %add649 = add i64 %xor633, %add634
  %shl650 = shl i64 %xor633, 33
  %shr651 = lshr i64 %xor633, 31
  %or652 = or i64 %shl650, %shr651
  %xor653 = xor i64 %or652, %add649
  %add654 = add i64 %xor648, %add639
  %shl655 = shl i64 %xor648, 27
  %shr656 = lshr i64 %xor648, 37
  %or657 = or i64 %shl655, %shr656
  %xor658 = xor i64 %or657, %add654
  %add659 = add i64 %xor643, %add644
  %shl660 = shl i64 %xor643, 14
  %shr661 = lshr i64 %xor643, 50
  %or662 = or i64 %shl660, %shr661
  %xor663 = xor i64 %or662, %add659
  %add664 = add i64 %add629, %xor638
  %shl665 = shl i64 %xor638, 42
  %shr666 = lshr i64 %xor638, 22
  %or667 = or i64 %shl665, %shr666
  %xor668 = xor i64 %or667, %add664
  %add669 = add i64 %add654, %xor653
  %shl670 = shl i64 %xor653, 17
  %shr671 = lshr i64 %xor653, 47
  %or672 = or i64 %shl670, %shr671
  %xor673 = xor i64 %or672, %add669
  %add674 = add i64 %add659, %xor668
  %shl675 = shl i64 %xor668, 49
  %shr676 = lshr i64 %xor668, 15
  %or677 = or i64 %shl675, %shr676
  %xor678 = xor i64 %or677, %add674
  %add679 = add i64 %xor663, %add664
  %shl680 = shl i64 %xor663, 36
  %shr681 = lshr i64 %xor663, 28
  %or682 = or i64 %shl680, %shr681
  %xor683 = xor i64 %or682, %add679
  %add684 = add i64 %xor658, %add649
  %shl685 = shl i64 %xor658, 39
  %shr686 = lshr i64 %xor658, 25
  %or687 = or i64 %shl685, %shr686
  %xor688 = xor i64 %or687, %add684
  %add689 = add i64 %xor673, %add674
  %shl690 = shl i64 %xor673, 44
  %shr691 = lshr i64 %xor673, 20
  %or692 = or i64 %shl690, %shr691
  %xor693 = xor i64 %or692, %add689
  %add694 = add i64 %xor688, %add679
  %shl695 = shl i64 %xor688, 9
  %shr696 = lshr i64 %xor688, 55
  %or697 = or i64 %shl695, %shr696
  %xor698 = xor i64 %or697, %add694
  %add699 = add i64 %xor683, %add684
  %shl700 = shl i64 %xor683, 54
  %shr701 = lshr i64 %xor683, 10
  %or702 = or i64 %shl700, %shr701
  %xor703 = xor i64 %or702, %add699
  %add704 = add i64 %add669, %xor678
  %shl705 = shl i64 %xor678, 56
  %shr706 = lshr i64 %xor678, 8
  %or707 = or i64 %shl705, %shr706
  %xor708 = xor i64 %or707, %add704
  %add712 = add i64 %add694, %5
  %add716 = add i64 %xor693, %4
  %add720 = add i64 %add699, %3
  %add724 = add i64 %xor708, %xor80
  %add728 = add i64 %add704, %10
  %add736 = add i64 %xor703, %add621
  %add743 = add i64 %8, %add
  %add744 = add i64 %add689, %add743
  %add749 = add i64 %7, 5
  %add750 = add i64 %add749, %xor698
  %add751 = add i64 %add712, %add716
  %shl752 = shl i64 %add716, 39
  %shr753 = lshr i64 %add716, 25
  %or754 = or i64 %shl752, %shr753
  %xor755 = xor i64 %or754, %add751
  %add756 = add i64 %add720, %add724
  %shl757 = shl i64 %add724, 30
  %shr758 = lshr i64 %add724, 34
  %or759 = or i64 %shl757, %shr758
  %xor760 = xor i64 %or759, %add756
  %add761 = add i64 %add728, %add736
  %shl762 = shl i64 %add736, 34
  %shr763 = lshr i64 %add736, 30
  %or764 = or i64 %shl762, %shr763
  %xor765 = xor i64 %or764, %add761
  %add766 = add i64 %add744, %add750
  %shl767 = shl i64 %add750, 24
  %shr768 = lshr i64 %add750, 40
  %or769 = or i64 %shl767, %shr768
  %xor770 = xor i64 %or769, %add766
  %add771 = add i64 %xor755, %add756
  %shl772 = shl i64 %xor755, 13
  %shr773 = lshr i64 %xor755, 51
  %or774 = or i64 %shl772, %shr773
  %xor775 = xor i64 %or774, %add771
  %add776 = add i64 %xor770, %add761
  %shl777 = shl i64 %xor770, 50
  %shr778 = lshr i64 %xor770, 14
  %or779 = or i64 %shl777, %shr778
  %xor780 = xor i64 %or779, %add776
  %add781 = add i64 %xor765, %add766
  %shl782 = shl i64 %xor765, 10
  %shr783 = lshr i64 %xor765, 54
  %or784 = or i64 %shl782, %shr783
  %xor785 = xor i64 %or784, %add781
  %add786 = add i64 %add751, %xor760
  %shl787 = shl i64 %xor760, 17
  %shr788 = lshr i64 %xor760, 47
  %or789 = or i64 %shl787, %shr788
  %xor790 = xor i64 %or789, %add786
  %add791 = add i64 %add776, %xor775
  %shl792 = shl i64 %xor775, 25
  %shr793 = lshr i64 %xor775, 39
  %or794 = or i64 %shl792, %shr793
  %xor795 = xor i64 %or794, %add791
  %add796 = add i64 %add781, %xor790
  %shl797 = shl i64 %xor790, 29
  %shr798 = lshr i64 %xor790, 35
  %or799 = or i64 %shl797, %shr798
  %xor800 = xor i64 %or799, %add796
  %add801 = add i64 %xor785, %add786
  %shl802 = shl i64 %xor785, 39
  %shr803 = lshr i64 %xor785, 25
  %or804 = or i64 %shl802, %shr803
  %xor805 = xor i64 %or804, %add801
  %add806 = add i64 %xor780, %add771
  %shl807 = shl i64 %xor780, 43
  %shr808 = lshr i64 %xor780, 21
  %or809 = or i64 %shl807, %shr808
  %xor810 = xor i64 %or809, %add806
  %add811 = add i64 %xor795, %add796
  %shl812 = shl i64 %xor795, 8
  %shr813 = lshr i64 %xor795, 56
  %or814 = or i64 %shl812, %shr813
  %xor815 = xor i64 %or814, %add811
  %add816 = add i64 %xor810, %add801
  %shl817 = shl i64 %xor810, 35
  %shr818 = lshr i64 %xor810, 29
  %or819 = or i64 %shl817, %shr818
  %xor820 = xor i64 %or819, %add816
  %add821 = add i64 %xor805, %add806
  %shl822 = shl i64 %xor805, 56
  %shr823 = lshr i64 %xor805, 8
  %or824 = or i64 %shl822, %shr823
  %xor825 = xor i64 %or824, %add821
  %add826 = add i64 %add791, %xor800
  %shl827 = shl i64 %xor800, 22
  %shr828 = lshr i64 %xor800, 42
  %or829 = or i64 %shl827, %shr828
  %xor830 = xor i64 %or829, %add826
  %add834 = add i64 %add816, %4
  %add838 = add i64 %xor815, %3
  %add842 = add i64 %add821, %xor80
  %add846 = add i64 %xor830, %10
  %add850 = add i64 %add826, %9
  %add858 = add i64 %xor825, %add743
  %add865 = add i64 %7, %kw.sroa.20.0
  %add866 = add i64 %add811, %add865
  %add871 = add i64 %6, 6
  %add872 = add i64 %add871, %xor820
  %add873 = add i64 %add834, %add838
  %shl874 = shl i64 %add838, 46
  %shr875 = lshr i64 %add838, 18
  %or876 = or i64 %shl874, %shr875
  %xor877 = xor i64 %or876, %add873
  %add878 = add i64 %add842, %add846
  %shl879 = shl i64 %add846, 36
  %shr880 = lshr i64 %add846, 28
  %or881 = or i64 %shl879, %shr880
  %xor882 = xor i64 %or881, %add878
  %add883 = add i64 %add850, %add858
  %shl884 = shl i64 %add858, 19
  %shr885 = lshr i64 %add858, 45
  %or886 = or i64 %shl884, %shr885
  %xor887 = xor i64 %or886, %add883
  %add888 = add i64 %add866, %add872
  %shl889 = shl i64 %add872, 37
  %shr890 = lshr i64 %add872, 27
  %or891 = or i64 %shl889, %shr890
  %xor892 = xor i64 %or891, %add888
  %add893 = add i64 %xor877, %add878
  %shl894 = shl i64 %xor877, 33
  %shr895 = lshr i64 %xor877, 31
  %or896 = or i64 %shl894, %shr895
  %xor897 = xor i64 %or896, %add893
  %add898 = add i64 %xor892, %add883
  %shl899 = shl i64 %xor892, 27
  %shr900 = lshr i64 %xor892, 37
  %or901 = or i64 %shl899, %shr900
  %xor902 = xor i64 %or901, %add898
  %add903 = add i64 %xor887, %add888
  %shl904 = shl i64 %xor887, 14
  %shr905 = lshr i64 %xor887, 50
  %or906 = or i64 %shl904, %shr905
  %xor907 = xor i64 %or906, %add903
  %add908 = add i64 %add873, %xor882
  %shl909 = shl i64 %xor882, 42
  %shr910 = lshr i64 %xor882, 22
  %or911 = or i64 %shl909, %shr910
  %xor912 = xor i64 %or911, %add908
  %add913 = add i64 %add898, %xor897
  %shl914 = shl i64 %xor897, 17
  %shr915 = lshr i64 %xor897, 47
  %or916 = or i64 %shl914, %shr915
  %xor917 = xor i64 %or916, %add913
  %add918 = add i64 %add903, %xor912
  %shl919 = shl i64 %xor912, 49
  %shr920 = lshr i64 %xor912, 15
  %or921 = or i64 %shl919, %shr920
  %xor922 = xor i64 %or921, %add918
  %add923 = add i64 %xor907, %add908
  %shl924 = shl i64 %xor907, 36
  %shr925 = lshr i64 %xor907, 28
  %or926 = or i64 %shl924, %shr925
  %xor927 = xor i64 %or926, %add923
  %add928 = add i64 %xor902, %add893
  %shl929 = shl i64 %xor902, 39
  %shr930 = lshr i64 %xor902, 25
  %or931 = or i64 %shl929, %shr930
  %xor932 = xor i64 %or931, %add928
  %add933 = add i64 %xor917, %add918
  %shl934 = shl i64 %xor917, 44
  %shr935 = lshr i64 %xor917, 20
  %or936 = or i64 %shl934, %shr935
  %xor937 = xor i64 %or936, %add933
  %add938 = add i64 %xor932, %add923
  %shl939 = shl i64 %xor932, 9
  %shr940 = lshr i64 %xor932, 55
  %or941 = or i64 %shl939, %shr940
  %xor942 = xor i64 %or941, %add938
  %add943 = add i64 %xor927, %add928
  %shl944 = shl i64 %xor927, 54
  %shr945 = lshr i64 %xor927, 10
  %or946 = or i64 %shl944, %shr945
  %xor947 = xor i64 %or946, %add943
  %add948 = add i64 %add913, %xor922
  %shl949 = shl i64 %xor922, 56
  %shr950 = lshr i64 %xor922, 8
  %or951 = or i64 %shl949, %shr950
  %xor952 = xor i64 %or951, %add948
  %add956 = add i64 %add938, %3
  %add960 = add i64 %xor937, %xor80
  %add964 = add i64 %add943, %10
  %add968 = add i64 %xor952, %9
  %add972 = add i64 %add948, %8
  %add980 = add i64 %xor947, %add865
  %add987 = add i64 %6, %xor90
  %add988 = add i64 %add933, %add987
  %add993 = add i64 %5, 7
  %add994 = add i64 %add993, %xor942
  %add995 = add i64 %add956, %add960
  %shl996 = shl i64 %add960, 39
  %shr997 = lshr i64 %add960, 25
  %or998 = or i64 %shl996, %shr997
  %xor999 = xor i64 %or998, %add995
  %add1000 = add i64 %add964, %add968
  %shl1001 = shl i64 %add968, 30
  %shr1002 = lshr i64 %add968, 34
  %or1003 = or i64 %shl1001, %shr1002
  %xor1004 = xor i64 %or1003, %add1000
  %add1005 = add i64 %add972, %add980
  %shl1006 = shl i64 %add980, 34
  %shr1007 = lshr i64 %add980, 30
  %or1008 = or i64 %shl1006, %shr1007
  %xor1009 = xor i64 %or1008, %add1005
  %add1010 = add i64 %add988, %add994
  %shl1011 = shl i64 %add994, 24
  %shr1012 = lshr i64 %add994, 40
  %or1013 = or i64 %shl1011, %shr1012
  %xor1014 = xor i64 %or1013, %add1010
  %add1015 = add i64 %xor999, %add1000
  %shl1016 = shl i64 %xor999, 13
  %shr1017 = lshr i64 %xor999, 51
  %or1018 = or i64 %shl1016, %shr1017
  %xor1019 = xor i64 %or1018, %add1015
  %add1020 = add i64 %xor1014, %add1005
  %shl1021 = shl i64 %xor1014, 50
  %shr1022 = lshr i64 %xor1014, 14
  %or1023 = or i64 %shl1021, %shr1022
  %xor1024 = xor i64 %or1023, %add1020
  %add1025 = add i64 %xor1009, %add1010
  %shl1026 = shl i64 %xor1009, 10
  %shr1027 = lshr i64 %xor1009, 54
  %or1028 = or i64 %shl1026, %shr1027
  %xor1029 = xor i64 %or1028, %add1025
  %add1030 = add i64 %add995, %xor1004
  %shl1031 = shl i64 %xor1004, 17
  %shr1032 = lshr i64 %xor1004, 47
  %or1033 = or i64 %shl1031, %shr1032
  %xor1034 = xor i64 %or1033, %add1030
  %add1035 = add i64 %add1020, %xor1019
  %shl1036 = shl i64 %xor1019, 25
  %shr1037 = lshr i64 %xor1019, 39
  %or1038 = or i64 %shl1036, %shr1037
  %xor1039 = xor i64 %or1038, %add1035
  %add1040 = add i64 %add1025, %xor1034
  %shl1041 = shl i64 %xor1034, 29
  %shr1042 = lshr i64 %xor1034, 35
  %or1043 = or i64 %shl1041, %shr1042
  %xor1044 = xor i64 %or1043, %add1040
  %add1045 = add i64 %xor1029, %add1030
  %shl1046 = shl i64 %xor1029, 39
  %shr1047 = lshr i64 %xor1029, 25
  %or1048 = or i64 %shl1046, %shr1047
  %xor1049 = xor i64 %or1048, %add1045
  %add1050 = add i64 %xor1024, %add1015
  %shl1051 = shl i64 %xor1024, 43
  %shr1052 = lshr i64 %xor1024, 21
  %or1053 = or i64 %shl1051, %shr1052
  %xor1054 = xor i64 %or1053, %add1050
  %add1055 = add i64 %xor1039, %add1040
  %shl1056 = shl i64 %xor1039, 8
  %shr1057 = lshr i64 %xor1039, 56
  %or1058 = or i64 %shl1056, %shr1057
  %xor1059 = xor i64 %or1058, %add1055
  %add1060 = add i64 %xor1054, %add1045
  %shl1061 = shl i64 %xor1054, 35
  %shr1062 = lshr i64 %xor1054, 29
  %or1063 = or i64 %shl1061, %shr1062
  %xor1064 = xor i64 %or1063, %add1060
  %add1065 = add i64 %xor1049, %add1050
  %shl1066 = shl i64 %xor1049, 56
  %shr1067 = lshr i64 %xor1049, 8
  %or1068 = or i64 %shl1066, %shr1067
  %xor1069 = xor i64 %or1068, %add1065
  %add1070 = add i64 %add1035, %xor1044
  %shl1071 = shl i64 %xor1044, 22
  %shr1072 = lshr i64 %xor1044, 42
  %or1073 = or i64 %shl1071, %shr1072
  %xor1074 = xor i64 %or1073, %add1070
  %add1078 = add i64 %add1060, %xor80
  %add1082 = add i64 %xor1059, %10
  %add1086 = add i64 %add1065, %9
  %add1090 = add i64 %xor1074, %8
  %add1094 = add i64 %add1070, %7
  %add1102 = add i64 %xor1069, %add987
  %add1110 = add i64 %add1055, %add124
  %add1115 = add i64 %4, 8
  %add1116 = add i64 %add1115, %xor1064
  %add1117 = add i64 %add1078, %add1082
  %shl1118 = shl i64 %add1082, 46
  %shr1119 = lshr i64 %add1082, 18
  %or1120 = or i64 %shl1118, %shr1119
  %xor1121 = xor i64 %or1120, %add1117
  %add1122 = add i64 %add1086, %add1090
  %shl1123 = shl i64 %add1090, 36
  %shr1124 = lshr i64 %add1090, 28
  %or1125 = or i64 %shl1123, %shr1124
  %xor1126 = xor i64 %or1125, %add1122
  %add1127 = add i64 %add1094, %add1102
  %shl1128 = shl i64 %add1102, 19
  %shr1129 = lshr i64 %add1102, 45
  %or1130 = or i64 %shl1128, %shr1129
  %xor1131 = xor i64 %or1130, %add1127
  %add1132 = add i64 %add1110, %add1116
  %shl1133 = shl i64 %add1116, 37
  %shr1134 = lshr i64 %add1116, 27
  %or1135 = or i64 %shl1133, %shr1134
  %xor1136 = xor i64 %or1135, %add1132
  %add1137 = add i64 %xor1121, %add1122
  %shl1138 = shl i64 %xor1121, 33
  %shr1139 = lshr i64 %xor1121, 31
  %or1140 = or i64 %shl1138, %shr1139
  %xor1141 = xor i64 %or1140, %add1137
  %add1142 = add i64 %xor1136, %add1127
  %shl1143 = shl i64 %xor1136, 27
  %shr1144 = lshr i64 %xor1136, 37
  %or1145 = or i64 %shl1143, %shr1144
  %xor1146 = xor i64 %or1145, %add1142
  %add1147 = add i64 %xor1131, %add1132
  %shl1148 = shl i64 %xor1131, 14
  %shr1149 = lshr i64 %xor1131, 50
  %or1150 = or i64 %shl1148, %shr1149
  %xor1151 = xor i64 %or1150, %add1147
  %add1152 = add i64 %add1117, %xor1126
  %shl1153 = shl i64 %xor1126, 42
  %shr1154 = lshr i64 %xor1126, 22
  %or1155 = or i64 %shl1153, %shr1154
  %xor1156 = xor i64 %or1155, %add1152
  %add1157 = add i64 %add1142, %xor1141
  %shl1158 = shl i64 %xor1141, 17
  %shr1159 = lshr i64 %xor1141, 47
  %or1160 = or i64 %shl1158, %shr1159
  %xor1161 = xor i64 %or1160, %add1157
  %add1162 = add i64 %add1147, %xor1156
  %shl1163 = shl i64 %xor1156, 49
  %shr1164 = lshr i64 %xor1156, 15
  %or1165 = or i64 %shl1163, %shr1164
  %xor1166 = xor i64 %or1165, %add1162
  %add1167 = add i64 %xor1151, %add1152
  %shl1168 = shl i64 %xor1151, 36
  %shr1169 = lshr i64 %xor1151, 28
  %or1170 = or i64 %shl1168, %shr1169
  %xor1171 = xor i64 %or1170, %add1167
  %add1172 = add i64 %xor1146, %add1137
  %shl1173 = shl i64 %xor1146, 39
  %shr1174 = lshr i64 %xor1146, 25
  %or1175 = or i64 %shl1173, %shr1174
  %xor1176 = xor i64 %or1175, %add1172
  %add1177 = add i64 %xor1161, %add1162
  %shl1178 = shl i64 %xor1161, 44
  %shr1179 = lshr i64 %xor1161, 20
  %or1180 = or i64 %shl1178, %shr1179
  %xor1181 = xor i64 %or1180, %add1177
  %add1182 = add i64 %xor1176, %add1167
  %shl1183 = shl i64 %xor1176, 9
  %shr1184 = lshr i64 %xor1176, 55
  %or1185 = or i64 %shl1183, %shr1184
  %xor1186 = xor i64 %or1185, %add1182
  %add1187 = add i64 %xor1171, %add1172
  %shl1188 = shl i64 %xor1171, 54
  %shr1189 = lshr i64 %xor1171, 10
  %or1190 = or i64 %shl1188, %shr1189
  %xor1191 = xor i64 %or1190, %add1187
  %add1192 = add i64 %add1157, %xor1166
  %shl1193 = shl i64 %xor1166, 56
  %shr1194 = lshr i64 %xor1166, 8
  %or1195 = or i64 %shl1193, %shr1194
  %xor1196 = xor i64 %or1195, %add1192
  %add1200 = add i64 %add1182, %10
  %add1204 = add i64 %xor1181, %9
  %add1208 = add i64 %add1187, %8
  %add1212 = add i64 %xor1196, %7
  %add1216 = add i64 %add1192, %6
  %add1224 = add i64 %xor1191, %add124
  %add1232 = add i64 %add1177, %add133
  %add1237 = add i64 %3, 9
  %add1238 = add i64 %add1237, %xor1186
  %add1239 = add i64 %add1200, %add1204
  %shl1240 = shl i64 %add1204, 39
  %shr1241 = lshr i64 %add1204, 25
  %or1242 = or i64 %shl1240, %shr1241
  %xor1243 = xor i64 %or1242, %add1239
  %add1244 = add i64 %add1208, %add1212
  %shl1245 = shl i64 %add1212, 30
  %shr1246 = lshr i64 %add1212, 34
  %or1247 = or i64 %shl1245, %shr1246
  %xor1248 = xor i64 %or1247, %add1244
  %add1249 = add i64 %add1216, %add1224
  %shl1250 = shl i64 %add1224, 34
  %shr1251 = lshr i64 %add1224, 30
  %or1252 = or i64 %shl1250, %shr1251
  %xor1253 = xor i64 %or1252, %add1249
  %add1254 = add i64 %add1232, %add1238
  %shl1255 = shl i64 %add1238, 24
  %shr1256 = lshr i64 %add1238, 40
  %or1257 = or i64 %shl1255, %shr1256
  %xor1258 = xor i64 %or1257, %add1254
  %add1259 = add i64 %xor1243, %add1244
  %shl1260 = shl i64 %xor1243, 13
  %shr1261 = lshr i64 %xor1243, 51
  %or1262 = or i64 %shl1260, %shr1261
  %xor1263 = xor i64 %or1262, %add1259
  %add1264 = add i64 %xor1258, %add1249
  %shl1265 = shl i64 %xor1258, 50
  %shr1266 = lshr i64 %xor1258, 14
  %or1267 = or i64 %shl1265, %shr1266
  %xor1268 = xor i64 %or1267, %add1264
  %add1269 = add i64 %xor1253, %add1254
  %shl1270 = shl i64 %xor1253, 10
  %shr1271 = lshr i64 %xor1253, 54
  %or1272 = or i64 %shl1270, %shr1271
  %xor1273 = xor i64 %or1272, %add1269
  %add1274 = add i64 %add1239, %xor1248
  %shl1275 = shl i64 %xor1248, 17
  %shr1276 = lshr i64 %xor1248, 47
  %or1277 = or i64 %shl1275, %shr1276
  %xor1278 = xor i64 %or1277, %add1274
  %add1279 = add i64 %add1264, %xor1263
  %shl1280 = shl i64 %xor1263, 25
  %shr1281 = lshr i64 %xor1263, 39
  %or1282 = or i64 %shl1280, %shr1281
  %xor1283 = xor i64 %or1282, %add1279
  %add1284 = add i64 %add1269, %xor1278
  %shl1285 = shl i64 %xor1278, 29
  %shr1286 = lshr i64 %xor1278, 35
  %or1287 = or i64 %shl1285, %shr1286
  %xor1288 = xor i64 %or1287, %add1284
  %add1289 = add i64 %xor1273, %add1274
  %shl1290 = shl i64 %xor1273, 39
  %shr1291 = lshr i64 %xor1273, 25
  %or1292 = or i64 %shl1290, %shr1291
  %xor1293 = xor i64 %or1292, %add1289
  %add1294 = add i64 %xor1268, %add1259
  %shl1295 = shl i64 %xor1268, 43
  %shr1296 = lshr i64 %xor1268, 21
  %or1297 = or i64 %shl1295, %shr1296
  %xor1298 = xor i64 %or1297, %add1294
  %add1299 = add i64 %xor1283, %add1284
  %shl1300 = shl i64 %xor1283, 8
  %shr1301 = lshr i64 %xor1283, 56
  %or1302 = or i64 %shl1300, %shr1301
  %xor1303 = xor i64 %or1302, %add1299
  %add1304 = add i64 %xor1298, %add1289
  %shl1305 = shl i64 %xor1298, 35
  %shr1306 = lshr i64 %xor1298, 29
  %or1307 = or i64 %shl1305, %shr1306
  %xor1308 = xor i64 %or1307, %add1304
  %add1309 = add i64 %xor1293, %add1294
  %shl1310 = shl i64 %xor1293, 56
  %shr1311 = lshr i64 %xor1293, 8
  %or1312 = or i64 %shl1310, %shr1311
  %xor1313 = xor i64 %or1312, %add1309
  %add1314 = add i64 %add1279, %xor1288
  %shl1315 = shl i64 %xor1288, 22
  %shr1316 = lshr i64 %xor1288, 42
  %or1317 = or i64 %shl1315, %shr1316
  %xor1318 = xor i64 %or1317, %add1314
  %add1322 = add i64 %add1304, %9
  %add1326 = add i64 %xor1303, %8
  %add1330 = add i64 %add1309, %7
  %add1334 = add i64 %xor1318, %6
  %add1338 = add i64 %add1314, %5
  %add1346 = add i64 %xor1313, %add133
  %add1354 = add i64 %add1299, %add255
  %add1359 = add i64 %xor80, 10
  %add1360 = add i64 %add1359, %xor1308
  %add1361 = add i64 %add1322, %add1326
  %shl1362 = shl i64 %add1326, 46
  %shr1363 = lshr i64 %add1326, 18
  %or1364 = or i64 %shl1362, %shr1363
  %xor1365 = xor i64 %or1364, %add1361
  %add1366 = add i64 %add1330, %add1334
  %shl1367 = shl i64 %add1334, 36
  %shr1368 = lshr i64 %add1334, 28
  %or1369 = or i64 %shl1367, %shr1368
  %xor1370 = xor i64 %or1369, %add1366
  %add1371 = add i64 %add1338, %add1346
  %shl1372 = shl i64 %add1346, 19
  %shr1373 = lshr i64 %add1346, 45
  %or1374 = or i64 %shl1372, %shr1373
  %xor1375 = xor i64 %or1374, %add1371
  %add1376 = add i64 %add1354, %add1360
  %shl1377 = shl i64 %add1360, 37
  %shr1378 = lshr i64 %add1360, 27
  %or1379 = or i64 %shl1377, %shr1378
  %xor1380 = xor i64 %or1379, %add1376
  %add1381 = add i64 %xor1365, %add1366
  %shl1382 = shl i64 %xor1365, 33
  %shr1383 = lshr i64 %xor1365, 31
  %or1384 = or i64 %shl1382, %shr1383
  %xor1385 = xor i64 %or1384, %add1381
  %add1386 = add i64 %xor1380, %add1371
  %shl1387 = shl i64 %xor1380, 27
  %shr1388 = lshr i64 %xor1380, 37
  %or1389 = or i64 %shl1387, %shr1388
  %xor1390 = xor i64 %or1389, %add1386
  %add1391 = add i64 %xor1375, %add1376
  %shl1392 = shl i64 %xor1375, 14
  %shr1393 = lshr i64 %xor1375, 50
  %or1394 = or i64 %shl1392, %shr1393
  %xor1395 = xor i64 %or1394, %add1391
  %add1396 = add i64 %add1361, %xor1370
  %shl1397 = shl i64 %xor1370, 42
  %shr1398 = lshr i64 %xor1370, 22
  %or1399 = or i64 %shl1397, %shr1398
  %xor1400 = xor i64 %or1399, %add1396
  %add1401 = add i64 %add1386, %xor1385
  %shl1402 = shl i64 %xor1385, 17
  %shr1403 = lshr i64 %xor1385, 47
  %or1404 = or i64 %shl1402, %shr1403
  %xor1405 = xor i64 %or1404, %add1401
  %add1406 = add i64 %add1391, %xor1400
  %shl1407 = shl i64 %xor1400, 49
  %shr1408 = lshr i64 %xor1400, 15
  %or1409 = or i64 %shl1407, %shr1408
  %xor1410 = xor i64 %or1409, %add1406
  %add1411 = add i64 %xor1395, %add1396
  %shl1412 = shl i64 %xor1395, 36
  %shr1413 = lshr i64 %xor1395, 28
  %or1414 = or i64 %shl1412, %shr1413
  %xor1415 = xor i64 %or1414, %add1411
  %add1416 = add i64 %xor1390, %add1381
  %shl1417 = shl i64 %xor1390, 39
  %shr1418 = lshr i64 %xor1390, 25
  %or1419 = or i64 %shl1417, %shr1418
  %xor1420 = xor i64 %or1419, %add1416
  %add1421 = add i64 %xor1405, %add1406
  %shl1422 = shl i64 %xor1405, 44
  %shr1423 = lshr i64 %xor1405, 20
  %or1424 = or i64 %shl1422, %shr1423
  %xor1425 = xor i64 %or1424, %add1421
  %add1426 = add i64 %xor1420, %add1411
  %shl1427 = shl i64 %xor1420, 9
  %shr1428 = lshr i64 %xor1420, 55
  %or1429 = or i64 %shl1427, %shr1428
  %xor1430 = xor i64 %or1429, %add1426
  %add1431 = add i64 %xor1415, %add1416
  %shl1432 = shl i64 %xor1415, 54
  %shr1433 = lshr i64 %xor1415, 10
  %or1434 = or i64 %shl1432, %shr1433
  %xor1435 = xor i64 %or1434, %add1431
  %add1436 = add i64 %add1401, %xor1410
  %shl1437 = shl i64 %xor1410, 56
  %shr1438 = lshr i64 %xor1410, 8
  %or1439 = or i64 %shl1437, %shr1438
  %xor1440 = xor i64 %or1439, %add1436
  %add1444 = add i64 %add1426, %8
  %add1448 = add i64 %xor1425, %7
  %add1452 = add i64 %add1431, %6
  %add1456 = add i64 %xor1440, %5
  %add1460 = add i64 %add1436, %4
  %add1468 = add i64 %xor1435, %add255
  %add1476 = add i64 %add1421, %add377
  %add1481 = add i64 %10, 11
  %add1482 = add i64 %add1481, %xor1430
  %add1483 = add i64 %add1444, %add1448
  %shl1484 = shl i64 %add1448, 39
  %shr1485 = lshr i64 %add1448, 25
  %or1486 = or i64 %shl1484, %shr1485
  %xor1487 = xor i64 %or1486, %add1483
  %add1488 = add i64 %add1452, %add1456
  %shl1489 = shl i64 %add1456, 30
  %shr1490 = lshr i64 %add1456, 34
  %or1491 = or i64 %shl1489, %shr1490
  %xor1492 = xor i64 %or1491, %add1488
  %add1493 = add i64 %add1460, %add1468
  %shl1494 = shl i64 %add1468, 34
  %shr1495 = lshr i64 %add1468, 30
  %or1496 = or i64 %shl1494, %shr1495
  %xor1497 = xor i64 %or1496, %add1493
  %add1498 = add i64 %add1476, %add1482
  %shl1499 = shl i64 %add1482, 24
  %shr1500 = lshr i64 %add1482, 40
  %or1501 = or i64 %shl1499, %shr1500
  %xor1502 = xor i64 %or1501, %add1498
  %add1503 = add i64 %xor1487, %add1488
  %shl1504 = shl i64 %xor1487, 13
  %shr1505 = lshr i64 %xor1487, 51
  %or1506 = or i64 %shl1504, %shr1505
  %xor1507 = xor i64 %or1506, %add1503
  %add1508 = add i64 %xor1502, %add1493
  %shl1509 = shl i64 %xor1502, 50
  %shr1510 = lshr i64 %xor1502, 14
  %or1511 = or i64 %shl1509, %shr1510
  %xor1512 = xor i64 %or1511, %add1508
  %add1513 = add i64 %xor1497, %add1498
  %shl1514 = shl i64 %xor1497, 10
  %shr1515 = lshr i64 %xor1497, 54
  %or1516 = or i64 %shl1514, %shr1515
  %xor1517 = xor i64 %or1516, %add1513
  %add1518 = add i64 %add1483, %xor1492
  %shl1519 = shl i64 %xor1492, 17
  %shr1520 = lshr i64 %xor1492, 47
  %or1521 = or i64 %shl1519, %shr1520
  %xor1522 = xor i64 %or1521, %add1518
  %add1523 = add i64 %add1508, %xor1507
  %shl1524 = shl i64 %xor1507, 25
  %shr1525 = lshr i64 %xor1507, 39
  %or1526 = or i64 %shl1524, %shr1525
  %xor1527 = xor i64 %or1526, %add1523
  %add1528 = add i64 %add1513, %xor1522
  %shl1529 = shl i64 %xor1522, 29
  %shr1530 = lshr i64 %xor1522, 35
  %or1531 = or i64 %shl1529, %shr1530
  %xor1532 = xor i64 %or1531, %add1528
  %add1533 = add i64 %xor1517, %add1518
  %shl1534 = shl i64 %xor1517, 39
  %shr1535 = lshr i64 %xor1517, 25
  %or1536 = or i64 %shl1534, %shr1535
  %xor1537 = xor i64 %or1536, %add1533
  %add1538 = add i64 %xor1512, %add1503
  %shl1539 = shl i64 %xor1512, 43
  %shr1540 = lshr i64 %xor1512, 21
  %or1541 = or i64 %shl1539, %shr1540
  %xor1542 = xor i64 %or1541, %add1538
  %add1543 = add i64 %xor1527, %add1528
  %shl1544 = shl i64 %xor1527, 8
  %shr1545 = lshr i64 %xor1527, 56
  %or1546 = or i64 %shl1544, %shr1545
  %xor1547 = xor i64 %or1546, %add1543
  %add1548 = add i64 %xor1542, %add1533
  %shl1549 = shl i64 %xor1542, 35
  %shr1550 = lshr i64 %xor1542, 29
  %or1551 = or i64 %shl1549, %shr1550
  %xor1552 = xor i64 %or1551, %add1548
  %add1553 = add i64 %xor1537, %add1538
  %shl1554 = shl i64 %xor1537, 56
  %shr1555 = lshr i64 %xor1537, 8
  %or1556 = or i64 %shl1554, %shr1555
  %xor1557 = xor i64 %or1556, %add1553
  %add1558 = add i64 %add1523, %xor1532
  %shl1559 = shl i64 %xor1532, 22
  %shr1560 = lshr i64 %xor1532, 42
  %or1561 = or i64 %shl1559, %shr1560
  %xor1562 = xor i64 %or1561, %add1558
  %add1566 = add i64 %add1548, %7
  %add1570 = add i64 %xor1547, %6
  %add1574 = add i64 %add1553, %5
  %add1578 = add i64 %xor1562, %4
  %add1582 = add i64 %add1558, %3
  %add1590 = add i64 %xor1557, %add377
  %add1598 = add i64 %add1543, %add499
  %add1603 = add i64 %9, 12
  %add1604 = add i64 %add1603, %xor1552
  %add1605 = add i64 %add1566, %add1570
  %shl1606 = shl i64 %add1570, 46
  %shr1607 = lshr i64 %add1570, 18
  %or1608 = or i64 %shl1606, %shr1607
  %xor1609 = xor i64 %or1608, %add1605
  %add1610 = add i64 %add1574, %add1578
  %shl1611 = shl i64 %add1578, 36
  %shr1612 = lshr i64 %add1578, 28
  %or1613 = or i64 %shl1611, %shr1612
  %xor1614 = xor i64 %or1613, %add1610
  %add1615 = add i64 %add1582, %add1590
  %shl1616 = shl i64 %add1590, 19
  %shr1617 = lshr i64 %add1590, 45
  %or1618 = or i64 %shl1616, %shr1617
  %xor1619 = xor i64 %or1618, %add1615
  %add1620 = add i64 %add1598, %add1604
  %shl1621 = shl i64 %add1604, 37
  %shr1622 = lshr i64 %add1604, 27
  %or1623 = or i64 %shl1621, %shr1622
  %xor1624 = xor i64 %or1623, %add1620
  %add1625 = add i64 %xor1609, %add1610
  %shl1626 = shl i64 %xor1609, 33
  %shr1627 = lshr i64 %xor1609, 31
  %or1628 = or i64 %shl1626, %shr1627
  %xor1629 = xor i64 %or1628, %add1625
  %add1630 = add i64 %xor1624, %add1615
  %shl1631 = shl i64 %xor1624, 27
  %shr1632 = lshr i64 %xor1624, 37
  %or1633 = or i64 %shl1631, %shr1632
  %xor1634 = xor i64 %or1633, %add1630
  %add1635 = add i64 %xor1619, %add1620
  %shl1636 = shl i64 %xor1619, 14
  %shr1637 = lshr i64 %xor1619, 50
  %or1638 = or i64 %shl1636, %shr1637
  %xor1639 = xor i64 %or1638, %add1635
  %add1640 = add i64 %add1605, %xor1614
  %shl1641 = shl i64 %xor1614, 42
  %shr1642 = lshr i64 %xor1614, 22
  %or1643 = or i64 %shl1641, %shr1642
  %xor1644 = xor i64 %or1643, %add1640
  %add1645 = add i64 %add1630, %xor1629
  %shl1646 = shl i64 %xor1629, 17
  %shr1647 = lshr i64 %xor1629, 47
  %or1648 = or i64 %shl1646, %shr1647
  %xor1649 = xor i64 %or1648, %add1645
  %add1650 = add i64 %add1635, %xor1644
  %shl1651 = shl i64 %xor1644, 49
  %shr1652 = lshr i64 %xor1644, 15
  %or1653 = or i64 %shl1651, %shr1652
  %xor1654 = xor i64 %or1653, %add1650
  %add1655 = add i64 %xor1639, %add1640
  %shl1656 = shl i64 %xor1639, 36
  %shr1657 = lshr i64 %xor1639, 28
  %or1658 = or i64 %shl1656, %shr1657
  %xor1659 = xor i64 %or1658, %add1655
  %add1660 = add i64 %xor1634, %add1625
  %shl1661 = shl i64 %xor1634, 39
  %shr1662 = lshr i64 %xor1634, 25
  %or1663 = or i64 %shl1661, %shr1662
  %xor1664 = xor i64 %or1663, %add1660
  %add1665 = add i64 %xor1649, %add1650
  %shl1666 = shl i64 %xor1649, 44
  %shr1667 = lshr i64 %xor1649, 20
  %or1668 = or i64 %shl1666, %shr1667
  %xor1669 = xor i64 %or1668, %add1665
  %add1670 = add i64 %xor1664, %add1655
  %shl1671 = shl i64 %xor1664, 9
  %shr1672 = lshr i64 %xor1664, 55
  %or1673 = or i64 %shl1671, %shr1672
  %xor1674 = xor i64 %or1673, %add1670
  %add1675 = add i64 %xor1659, %add1660
  %shl1676 = shl i64 %xor1659, 54
  %shr1677 = lshr i64 %xor1659, 10
  %or1678 = or i64 %shl1676, %shr1677
  %xor1679 = xor i64 %or1678, %add1675
  %add1680 = add i64 %add1645, %xor1654
  %shl1681 = shl i64 %xor1654, 56
  %shr1682 = lshr i64 %xor1654, 8
  %or1683 = or i64 %shl1681, %shr1682
  %xor1684 = xor i64 %or1683, %add1680
  %add1688 = add i64 %add1670, %6
  %add1692 = add i64 %xor1669, %5
  %add1696 = add i64 %add1675, %4
  %add1700 = add i64 %xor1684, %3
  %add1704 = add i64 %add1680, %xor80
  %add1712 = add i64 %xor1679, %add499
  %add1720 = add i64 %add1665, %add621
  %add1725 = add i64 %8, 13
  %add1726 = add i64 %add1725, %xor1674
  %add1727 = add i64 %add1688, %add1692
  %shl1728 = shl i64 %add1692, 39
  %shr1729 = lshr i64 %add1692, 25
  %or1730 = or i64 %shl1728, %shr1729
  %xor1731 = xor i64 %or1730, %add1727
  %add1732 = add i64 %add1696, %add1700
  %shl1733 = shl i64 %add1700, 30
  %shr1734 = lshr i64 %add1700, 34
  %or1735 = or i64 %shl1733, %shr1734
  %xor1736 = xor i64 %or1735, %add1732
  %add1737 = add i64 %add1704, %add1712
  %shl1738 = shl i64 %add1712, 34
  %shr1739 = lshr i64 %add1712, 30
  %or1740 = or i64 %shl1738, %shr1739
  %xor1741 = xor i64 %or1740, %add1737
  %add1742 = add i64 %add1720, %add1726
  %shl1743 = shl i64 %add1726, 24
  %shr1744 = lshr i64 %add1726, 40
  %or1745 = or i64 %shl1743, %shr1744
  %xor1746 = xor i64 %or1745, %add1742
  %add1747 = add i64 %xor1731, %add1732
  %shl1748 = shl i64 %xor1731, 13
  %shr1749 = lshr i64 %xor1731, 51
  %or1750 = or i64 %shl1748, %shr1749
  %xor1751 = xor i64 %or1750, %add1747
  %add1752 = add i64 %xor1746, %add1737
  %shl1753 = shl i64 %xor1746, 50
  %shr1754 = lshr i64 %xor1746, 14
  %or1755 = or i64 %shl1753, %shr1754
  %xor1756 = xor i64 %or1755, %add1752
  %add1757 = add i64 %xor1741, %add1742
  %shl1758 = shl i64 %xor1741, 10
  %shr1759 = lshr i64 %xor1741, 54
  %or1760 = or i64 %shl1758, %shr1759
  %xor1761 = xor i64 %or1760, %add1757
  %add1762 = add i64 %add1727, %xor1736
  %shl1763 = shl i64 %xor1736, 17
  %shr1764 = lshr i64 %xor1736, 47
  %or1765 = or i64 %shl1763, %shr1764
  %xor1766 = xor i64 %or1765, %add1762
  %add1767 = add i64 %add1752, %xor1751
  %shl1768 = shl i64 %xor1751, 25
  %shr1769 = lshr i64 %xor1751, 39
  %or1770 = or i64 %shl1768, %shr1769
  %xor1771 = xor i64 %or1770, %add1767
  %add1772 = add i64 %add1757, %xor1766
  %shl1773 = shl i64 %xor1766, 29
  %shr1774 = lshr i64 %xor1766, 35
  %or1775 = or i64 %shl1773, %shr1774
  %xor1776 = xor i64 %or1775, %add1772
  %add1777 = add i64 %xor1761, %add1762
  %shl1778 = shl i64 %xor1761, 39
  %shr1779 = lshr i64 %xor1761, 25
  %or1780 = or i64 %shl1778, %shr1779
  %xor1781 = xor i64 %or1780, %add1777
  %add1782 = add i64 %xor1756, %add1747
  %shl1783 = shl i64 %xor1756, 43
  %shr1784 = lshr i64 %xor1756, 21
  %or1785 = or i64 %shl1783, %shr1784
  %xor1786 = xor i64 %or1785, %add1782
  %add1787 = add i64 %xor1771, %add1772
  %shl1788 = shl i64 %xor1771, 8
  %shr1789 = lshr i64 %xor1771, 56
  %or1790 = or i64 %shl1788, %shr1789
  %xor1791 = xor i64 %or1790, %add1787
  %add1792 = add i64 %xor1786, %add1777
  %shl1793 = shl i64 %xor1786, 35
  %shr1794 = lshr i64 %xor1786, 29
  %or1795 = or i64 %shl1793, %shr1794
  %xor1796 = xor i64 %or1795, %add1792
  %add1797 = add i64 %xor1781, %add1782
  %shl1798 = shl i64 %xor1781, 56
  %shr1799 = lshr i64 %xor1781, 8
  %or1800 = or i64 %shl1798, %shr1799
  %xor1801 = xor i64 %or1800, %add1797
  %add1802 = add i64 %add1767, %xor1776
  %shl1803 = shl i64 %xor1776, 22
  %shr1804 = lshr i64 %xor1776, 42
  %or1805 = or i64 %shl1803, %shr1804
  %xor1806 = xor i64 %or1805, %add1802
  %add1810 = add i64 %add1792, %5
  %add1814 = add i64 %xor1791, %4
  %add1818 = add i64 %add1797, %3
  %add1822 = add i64 %xor1806, %xor80
  %add1826 = add i64 %add1802, %10
  %add1834 = add i64 %xor1801, %add621
  %add1842 = add i64 %add1787, %add743
  %add1847 = add i64 %7, 14
  %add1848 = add i64 %add1847, %xor1796
  %add1849 = add i64 %add1810, %add1814
  %shl1850 = shl i64 %add1814, 46
  %shr1851 = lshr i64 %add1814, 18
  %or1852 = or i64 %shl1850, %shr1851
  %xor1853 = xor i64 %or1852, %add1849
  %add1854 = add i64 %add1818, %add1822
  %shl1855 = shl i64 %add1822, 36
  %shr1856 = lshr i64 %add1822, 28
  %or1857 = or i64 %shl1855, %shr1856
  %xor1858 = xor i64 %or1857, %add1854
  %add1859 = add i64 %add1826, %add1834
  %shl1860 = shl i64 %add1834, 19
  %shr1861 = lshr i64 %add1834, 45
  %or1862 = or i64 %shl1860, %shr1861
  %xor1863 = xor i64 %or1862, %add1859
  %add1864 = add i64 %add1842, %add1848
  %shl1865 = shl i64 %add1848, 37
  %shr1866 = lshr i64 %add1848, 27
  %or1867 = or i64 %shl1865, %shr1866
  %xor1868 = xor i64 %or1867, %add1864
  %add1869 = add i64 %xor1853, %add1854
  %shl1870 = shl i64 %xor1853, 33
  %shr1871 = lshr i64 %xor1853, 31
  %or1872 = or i64 %shl1870, %shr1871
  %xor1873 = xor i64 %or1872, %add1869
  %add1874 = add i64 %xor1868, %add1859
  %shl1875 = shl i64 %xor1868, 27
  %shr1876 = lshr i64 %xor1868, 37
  %or1877 = or i64 %shl1875, %shr1876
  %xor1878 = xor i64 %or1877, %add1874
  %add1879 = add i64 %xor1863, %add1864
  %shl1880 = shl i64 %xor1863, 14
  %shr1881 = lshr i64 %xor1863, 50
  %or1882 = or i64 %shl1880, %shr1881
  %xor1883 = xor i64 %or1882, %add1879
  %add1884 = add i64 %add1849, %xor1858
  %shl1885 = shl i64 %xor1858, 42
  %shr1886 = lshr i64 %xor1858, 22
  %or1887 = or i64 %shl1885, %shr1886
  %xor1888 = xor i64 %or1887, %add1884
  %add1889 = add i64 %add1874, %xor1873
  %shl1890 = shl i64 %xor1873, 17
  %shr1891 = lshr i64 %xor1873, 47
  %or1892 = or i64 %shl1890, %shr1891
  %xor1893 = xor i64 %or1892, %add1889
  %add1894 = add i64 %add1879, %xor1888
  %shl1895 = shl i64 %xor1888, 49
  %shr1896 = lshr i64 %xor1888, 15
  %or1897 = or i64 %shl1895, %shr1896
  %xor1898 = xor i64 %or1897, %add1894
  %add1899 = add i64 %xor1883, %add1884
  %shl1900 = shl i64 %xor1883, 36
  %shr1901 = lshr i64 %xor1883, 28
  %or1902 = or i64 %shl1900, %shr1901
  %xor1903 = xor i64 %or1902, %add1899
  %add1904 = add i64 %xor1878, %add1869
  %shl1905 = shl i64 %xor1878, 39
  %shr1906 = lshr i64 %xor1878, 25
  %or1907 = or i64 %shl1905, %shr1906
  %xor1908 = xor i64 %or1907, %add1904
  %add1909 = add i64 %xor1893, %add1894
  %shl1910 = shl i64 %xor1893, 44
  %shr1911 = lshr i64 %xor1893, 20
  %or1912 = or i64 %shl1910, %shr1911
  %xor1913 = xor i64 %or1912, %add1909
  %add1914 = add i64 %xor1908, %add1899
  %shl1915 = shl i64 %xor1908, 9
  %shr1916 = lshr i64 %xor1908, 55
  %or1917 = or i64 %shl1915, %shr1916
  %xor1918 = xor i64 %or1917, %add1914
  %add1919 = add i64 %xor1903, %add1904
  %shl1920 = shl i64 %xor1903, 54
  %shr1921 = lshr i64 %xor1903, 10
  %or1922 = or i64 %shl1920, %shr1921
  %xor1923 = xor i64 %or1922, %add1919
  %add1924 = add i64 %add1889, %xor1898
  %shl1925 = shl i64 %xor1898, 56
  %shr1926 = lshr i64 %xor1898, 8
  %or1927 = or i64 %shl1925, %shr1926
  %xor1928 = xor i64 %or1927, %add1924
  %add1932 = add i64 %add1914, %4
  %add1936 = add i64 %xor1913, %3
  %add1940 = add i64 %add1919, %xor80
  %add1944 = add i64 %xor1928, %10
  %add1948 = add i64 %add1924, %9
  %add1956 = add i64 %xor1923, %add743
  %add1964 = add i64 %add1909, %add865
  %add1969 = add i64 %6, 15
  %add1970 = add i64 %add1969, %xor1918
  %add1971 = add i64 %add1932, %add1936
  %shl1972 = shl i64 %add1936, 39
  %shr1973 = lshr i64 %add1936, 25
  %or1974 = or i64 %shl1972, %shr1973
  %xor1975 = xor i64 %or1974, %add1971
  %add1976 = add i64 %add1940, %add1944
  %shl1977 = shl i64 %add1944, 30
  %shr1978 = lshr i64 %add1944, 34
  %or1979 = or i64 %shl1977, %shr1978
  %xor1980 = xor i64 %or1979, %add1976
  %add1981 = add i64 %add1948, %add1956
  %shl1982 = shl i64 %add1956, 34
  %shr1983 = lshr i64 %add1956, 30
  %or1984 = or i64 %shl1982, %shr1983
  %xor1985 = xor i64 %or1984, %add1981
  %add1986 = add i64 %add1964, %add1970
  %shl1987 = shl i64 %add1970, 24
  %shr1988 = lshr i64 %add1970, 40
  %or1989 = or i64 %shl1987, %shr1988
  %xor1990 = xor i64 %or1989, %add1986
  %add1991 = add i64 %xor1975, %add1976
  %shl1992 = shl i64 %xor1975, 13
  %shr1993 = lshr i64 %xor1975, 51
  %or1994 = or i64 %shl1992, %shr1993
  %xor1995 = xor i64 %or1994, %add1991
  %add1996 = add i64 %xor1990, %add1981
  %shl1997 = shl i64 %xor1990, 50
  %shr1998 = lshr i64 %xor1990, 14
  %or1999 = or i64 %shl1997, %shr1998
  %xor2000 = xor i64 %or1999, %add1996
  %add2001 = add i64 %xor1985, %add1986
  %shl2002 = shl i64 %xor1985, 10
  %shr2003 = lshr i64 %xor1985, 54
  %or2004 = or i64 %shl2002, %shr2003
  %xor2005 = xor i64 %or2004, %add2001
  %add2006 = add i64 %add1971, %xor1980
  %shl2007 = shl i64 %xor1980, 17
  %shr2008 = lshr i64 %xor1980, 47
  %or2009 = or i64 %shl2007, %shr2008
  %xor2010 = xor i64 %or2009, %add2006
  %add2011 = add i64 %add1996, %xor1995
  %shl2012 = shl i64 %xor1995, 25
  %shr2013 = lshr i64 %xor1995, 39
  %or2014 = or i64 %shl2012, %shr2013
  %xor2015 = xor i64 %or2014, %add2011
  %add2016 = add i64 %add2001, %xor2010
  %shl2017 = shl i64 %xor2010, 29
  %shr2018 = lshr i64 %xor2010, 35
  %or2019 = or i64 %shl2017, %shr2018
  %xor2020 = xor i64 %or2019, %add2016
  %add2021 = add i64 %xor2005, %add2006
  %shl2022 = shl i64 %xor2005, 39
  %shr2023 = lshr i64 %xor2005, 25
  %or2024 = or i64 %shl2022, %shr2023
  %xor2025 = xor i64 %or2024, %add2021
  %add2026 = add i64 %xor2000, %add1991
  %shl2027 = shl i64 %xor2000, 43
  %shr2028 = lshr i64 %xor2000, 21
  %or2029 = or i64 %shl2027, %shr2028
  %xor2030 = xor i64 %or2029, %add2026
  %add2031 = add i64 %xor2015, %add2016
  %shl2032 = shl i64 %xor2015, 8
  %shr2033 = lshr i64 %xor2015, 56
  %or2034 = or i64 %shl2032, %shr2033
  %xor2035 = xor i64 %or2034, %add2031
  %add2036 = add i64 %xor2030, %add2021
  %shl2037 = shl i64 %xor2030, 35
  %shr2038 = lshr i64 %xor2030, 29
  %or2039 = or i64 %shl2037, %shr2038
  %xor2040 = xor i64 %or2039, %add2036
  %add2041 = add i64 %xor2025, %add2026
  %shl2042 = shl i64 %xor2025, 56
  %shr2043 = lshr i64 %xor2025, 8
  %or2044 = or i64 %shl2042, %shr2043
  %xor2045 = xor i64 %or2044, %add2041
  %add2046 = add i64 %add2011, %xor2020
  %shl2047 = shl i64 %xor2020, 22
  %shr2048 = lshr i64 %xor2020, 42
  %or2049 = or i64 %shl2047, %shr2048
  %xor2050 = xor i64 %or2049, %add2046
  %add2054 = add i64 %add2036, %3
  %add2058 = add i64 %xor2035, %xor80
  %add2062 = add i64 %add2041, %10
  %add2066 = add i64 %xor2050, %9
  %add2070 = add i64 %add2046, %8
  %add2078 = add i64 %xor2045, %add865
  %add2086 = add i64 %add2031, %add987
  %add2091 = add i64 %5, 16
  %add2092 = add i64 %add2091, %xor2040
  %add2093 = add i64 %add2054, %add2058
  %shl2094 = shl i64 %add2058, 46
  %shr2095 = lshr i64 %add2058, 18
  %or2096 = or i64 %shl2094, %shr2095
  %xor2097 = xor i64 %or2096, %add2093
  %add2098 = add i64 %add2062, %add2066
  %shl2099 = shl i64 %add2066, 36
  %shr2100 = lshr i64 %add2066, 28
  %or2101 = or i64 %shl2099, %shr2100
  %xor2102 = xor i64 %or2101, %add2098
  %add2103 = add i64 %add2070, %add2078
  %shl2104 = shl i64 %add2078, 19
  %shr2105 = lshr i64 %add2078, 45
  %or2106 = or i64 %shl2104, %shr2105
  %xor2107 = xor i64 %or2106, %add2103
  %add2108 = add i64 %add2086, %add2092
  %shl2109 = shl i64 %add2092, 37
  %shr2110 = lshr i64 %add2092, 27
  %or2111 = or i64 %shl2109, %shr2110
  %xor2112 = xor i64 %or2111, %add2108
  %add2113 = add i64 %xor2097, %add2098
  %shl2114 = shl i64 %xor2097, 33
  %shr2115 = lshr i64 %xor2097, 31
  %or2116 = or i64 %shl2114, %shr2115
  %xor2117 = xor i64 %or2116, %add2113
  %add2118 = add i64 %xor2112, %add2103
  %shl2119 = shl i64 %xor2112, 27
  %shr2120 = lshr i64 %xor2112, 37
  %or2121 = or i64 %shl2119, %shr2120
  %xor2122 = xor i64 %or2121, %add2118
  %add2123 = add i64 %xor2107, %add2108
  %shl2124 = shl i64 %xor2107, 14
  %shr2125 = lshr i64 %xor2107, 50
  %or2126 = or i64 %shl2124, %shr2125
  %xor2127 = xor i64 %or2126, %add2123
  %add2128 = add i64 %add2093, %xor2102
  %shl2129 = shl i64 %xor2102, 42
  %shr2130 = lshr i64 %xor2102, 22
  %or2131 = or i64 %shl2129, %shr2130
  %xor2132 = xor i64 %or2131, %add2128
  %add2133 = add i64 %add2118, %xor2117
  %shl2134 = shl i64 %xor2117, 17
  %shr2135 = lshr i64 %xor2117, 47
  %or2136 = or i64 %shl2134, %shr2135
  %xor2137 = xor i64 %or2136, %add2133
  %add2138 = add i64 %add2123, %xor2132
  %shl2139 = shl i64 %xor2132, 49
  %shr2140 = lshr i64 %xor2132, 15
  %or2141 = or i64 %shl2139, %shr2140
  %xor2142 = xor i64 %or2141, %add2138
  %add2143 = add i64 %xor2127, %add2128
  %shl2144 = shl i64 %xor2127, 36
  %shr2145 = lshr i64 %xor2127, 28
  %or2146 = or i64 %shl2144, %shr2145
  %xor2147 = xor i64 %or2146, %add2143
  %add2148 = add i64 %xor2122, %add2113
  %shl2149 = shl i64 %xor2122, 39
  %shr2150 = lshr i64 %xor2122, 25
  %or2151 = or i64 %shl2149, %shr2150
  %xor2152 = xor i64 %or2151, %add2148
  %add2153 = add i64 %xor2137, %add2138
  %shl2154 = shl i64 %xor2137, 44
  %shr2155 = lshr i64 %xor2137, 20
  %or2156 = or i64 %shl2154, %shr2155
  %xor2157 = xor i64 %or2156, %add2153
  %add2158 = add i64 %xor2152, %add2143
  %shl2159 = shl i64 %xor2152, 9
  %shr2160 = lshr i64 %xor2152, 55
  %or2161 = or i64 %shl2159, %shr2160
  %xor2162 = xor i64 %or2161, %add2158
  %add2163 = add i64 %xor2147, %add2148
  %shl2164 = shl i64 %xor2147, 54
  %shr2165 = lshr i64 %xor2147, 10
  %or2166 = or i64 %shl2164, %shr2165
  %xor2167 = xor i64 %or2166, %add2163
  %add2168 = add i64 %add2133, %xor2142
  %shl2169 = shl i64 %xor2142, 56
  %shr2170 = lshr i64 %xor2142, 8
  %or2171 = or i64 %shl2169, %shr2170
  %xor2172 = xor i64 %or2171, %add2168
  %add2176 = add i64 %add2158, %xor80
  %add2180 = add i64 %xor2157, %10
  %add2184 = add i64 %add2163, %9
  %add2188 = add i64 %xor2172, %8
  %add2192 = add i64 %add2168, %7
  %add2200 = add i64 %xor2167, %add987
  %add2208 = add i64 %add2153, %add124
  %add2213 = add i64 %4, 17
  %add2214 = add i64 %add2213, %xor2162
  %add2215 = add i64 %add2176, %add2180
  %shl2216 = shl i64 %add2180, 39
  %shr2217 = lshr i64 %add2180, 25
  %or2218 = or i64 %shl2216, %shr2217
  %xor2219 = xor i64 %or2218, %add2215
  %add2220 = add i64 %add2184, %add2188
  %shl2221 = shl i64 %add2188, 30
  %shr2222 = lshr i64 %add2188, 34
  %or2223 = or i64 %shl2221, %shr2222
  %xor2224 = xor i64 %or2223, %add2220
  %add2225 = add i64 %add2192, %add2200
  %shl2226 = shl i64 %add2200, 34
  %shr2227 = lshr i64 %add2200, 30
  %or2228 = or i64 %shl2226, %shr2227
  %xor2229 = xor i64 %or2228, %add2225
  %add2230 = add i64 %add2208, %add2214
  %shl2231 = shl i64 %add2214, 24
  %shr2232 = lshr i64 %add2214, 40
  %or2233 = or i64 %shl2231, %shr2232
  %xor2234 = xor i64 %or2233, %add2230
  %add2235 = add i64 %xor2219, %add2220
  %shl2236 = shl i64 %xor2219, 13
  %shr2237 = lshr i64 %xor2219, 51
  %or2238 = or i64 %shl2236, %shr2237
  %xor2239 = xor i64 %or2238, %add2235
  %add2240 = add i64 %xor2234, %add2225
  %shl2241 = shl i64 %xor2234, 50
  %shr2242 = lshr i64 %xor2234, 14
  %or2243 = or i64 %shl2241, %shr2242
  %xor2244 = xor i64 %or2243, %add2240
  %add2245 = add i64 %xor2229, %add2230
  %shl2246 = shl i64 %xor2229, 10
  %shr2247 = lshr i64 %xor2229, 54
  %or2248 = or i64 %shl2246, %shr2247
  %xor2249 = xor i64 %or2248, %add2245
  %add2250 = add i64 %add2215, %xor2224
  %shl2251 = shl i64 %xor2224, 17
  %shr2252 = lshr i64 %xor2224, 47
  %or2253 = or i64 %shl2251, %shr2252
  %xor2254 = xor i64 %or2253, %add2250
  %add2255 = add i64 %add2240, %xor2239
  %shl2256 = shl i64 %xor2239, 25
  %shr2257 = lshr i64 %xor2239, 39
  %or2258 = or i64 %shl2256, %shr2257
  %xor2259 = xor i64 %or2258, %add2255
  %add2260 = add i64 %add2245, %xor2254
  %shl2261 = shl i64 %xor2254, 29
  %shr2262 = lshr i64 %xor2254, 35
  %or2263 = or i64 %shl2261, %shr2262
  %xor2264 = xor i64 %or2263, %add2260
  %add2265 = add i64 %xor2249, %add2250
  %shl2266 = shl i64 %xor2249, 39
  %shr2267 = lshr i64 %xor2249, 25
  %or2268 = or i64 %shl2266, %shr2267
  %xor2269 = xor i64 %or2268, %add2265
  %add2270 = add i64 %xor2244, %add2235
  %shl2271 = shl i64 %xor2244, 43
  %shr2272 = lshr i64 %xor2244, 21
  %or2273 = or i64 %shl2271, %shr2272
  %xor2274 = xor i64 %or2273, %add2270
  %add2275 = add i64 %xor2259, %add2260
  %shl2276 = shl i64 %xor2259, 8
  %shr2277 = lshr i64 %xor2259, 56
  %or2278 = or i64 %shl2276, %shr2277
  %xor2279 = xor i64 %or2278, %add2275
  %add2280 = add i64 %xor2274, %add2265
  %shl2281 = shl i64 %xor2274, 35
  %shr2282 = lshr i64 %xor2274, 29
  %or2283 = or i64 %shl2281, %shr2282
  %xor2284 = xor i64 %or2283, %add2280
  %add2285 = add i64 %xor2269, %add2270
  %shl2286 = shl i64 %xor2269, 56
  %shr2287 = lshr i64 %xor2269, 8
  %or2288 = or i64 %shl2286, %shr2287
  %xor2289 = xor i64 %or2288, %add2285
  %add2290 = add i64 %add2255, %xor2264
  %shl2291 = shl i64 %xor2264, 22
  %shr2292 = lshr i64 %xor2264, 42
  %or2293 = or i64 %shl2291, %shr2292
  %xor2294 = xor i64 %or2293, %add2290
  %add2298 = add i64 %add2280, %10
  %add2302 = add i64 %xor2279, %9
  %add2306 = add i64 %add2285, %8
  %add2310 = add i64 %xor2294, %7
  %add2314 = add i64 %add2290, %6
  %add2322 = add i64 %xor2289, %add124
  %add2330 = add i64 %add2275, %add133
  %add2335 = add i64 %3, 18
  %add2336 = add i64 %add2335, %xor2284
  %xor2338 = xor i64 %add2298, %75
  store i64 %xor2338, i64* %arrayidx11, align 8, !tbaa !2
  %xor2342 = xor i64 %add2302, %76
  store i64 %xor2342, i64* %arrayidx16, align 8, !tbaa !2
  %xor2346 = xor i64 %add2306, %77
  store i64 %xor2346, i64* %arrayidx21, align 8, !tbaa !2
  %xor2350 = xor i64 %add2310, %78
  store i64 %xor2350, i64* %arrayidx26, align 8, !tbaa !2
  %xor2354 = xor i64 %add2314, %79
  store i64 %xor2354, i64* %arrayidx31, align 8, !tbaa !2
  %xor2358 = xor i64 %add2322, %add33.i.5
  store i64 %xor2358, i64* %arrayidx36, align 8, !tbaa !2
  %xor2362 = xor i64 %add2330, %add33.i.6
  store i64 %xor2362, i64* %arrayidx41, align 8, !tbaa !2
  %xor2366 = xor i64 %add2336, %add33.i.7
  store i64 %xor2366, i64* %arrayidx46, align 8, !tbaa !2
  %and = and i64 %kw.sroa.20.0, -4611686018427387905
  %dec = add i32 %blkCnt.addr.0, -1
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %do.end, label %do.body

do.end:                                           ; preds = %do.body
  store i64 %add, i64* %arrayidx, align 8, !tbaa !2
  store i64 %and, i64* %arrayidx4, align 8, !tbaa !2
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %0) #3
  ret void
}

; Function Attrs: nounwind
define internal fastcc void @Skein1024_Process_Block(%struct.Skein1024_Ctxt_t* nocapture %ctx, i8* nocapture readonly %blkPtr, i32 %blkCnt, i32 %byteCntAdd) unnamed_addr #2 {
entry:
  %kw = alloca [40 x i64], align 16
  %w = alloca [16 x i64], align 16
  %0 = bitcast [40 x i64]* %kw to i8*
  call void @llvm.lifetime.start.p0i8(i64 320, i8* nonnull %0) #3
  %1 = bitcast [16 x i64]* %w to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %1) #3
  %arrayidx = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx, i32 0, i32 0, i32 2, i32 0
  %2 = load i64, i64* %arrayidx, align 8, !tbaa !2
  %arraydecay = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 0
  store i64 %2, i64* %arraydecay, align 16, !tbaa !2
  %arrayidx4 = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx, i32 0, i32 0, i32 2, i32 1
  %3 = load i64, i64* %arrayidx4, align 8, !tbaa !2
  %arrayidx7 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 1
  store i64 %3, i64* %arrayidx7, align 8, !tbaa !2
  %conv = zext i32 %byteCntAdd to i64
  %arrayidx11 = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx, i32 0, i32 1, i32 0
  %add.ptr13 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 3
  %arrayidx17 = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx, i32 0, i32 1, i32 1
  %arrayidx20 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 4
  %arrayidx22 = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx, i32 0, i32 1, i32 2
  %arrayidx25 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 5
  %arrayidx27 = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx, i32 0, i32 1, i32 3
  %arrayidx30 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 6
  %arrayidx32 = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx, i32 0, i32 1, i32 4
  %arrayidx35 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 7
  %arrayidx37 = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx, i32 0, i32 1, i32 5
  %arrayidx40 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 8
  %arrayidx42 = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx, i32 0, i32 1, i32 6
  %arrayidx45 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 9
  %arrayidx47 = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx, i32 0, i32 1, i32 7
  %arrayidx50 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 10
  %arrayidx52 = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx, i32 0, i32 1, i32 8
  %arrayidx55 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 11
  %arrayidx57 = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx, i32 0, i32 1, i32 9
  %arrayidx60 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 12
  %arrayidx62 = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx, i32 0, i32 1, i32 10
  %arrayidx65 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 13
  %arrayidx67 = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx, i32 0, i32 1, i32 11
  %arrayidx70 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 14
  %arrayidx72 = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx, i32 0, i32 1, i32 12
  %arrayidx75 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 15
  %arrayidx77 = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx, i32 0, i32 1, i32 13
  %arrayidx80 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 16
  %arrayidx82 = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx, i32 0, i32 1, i32 14
  %arrayidx85 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 17
  %arrayidx87 = getelementptr inbounds %struct.Skein1024_Ctxt_t, %struct.Skein1024_Ctxt_t* %ctx, i32 0, i32 1, i32 15
  %arrayidx90 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 18
  %arrayidx156 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 19
  %arrayidx166 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 2
  %arraydecay167 = getelementptr inbounds [16 x i64], [16 x i64]* %w, i32 0, i32 0
  %arrayidx173 = getelementptr inbounds [16 x i64], [16 x i64]* %w, i32 0, i32 1
  %arrayidx178 = getelementptr inbounds [16 x i64], [16 x i64]* %w, i32 0, i32 2
  %arrayidx183 = getelementptr inbounds [16 x i64], [16 x i64]* %w, i32 0, i32 3
  %arrayidx188 = getelementptr inbounds [16 x i64], [16 x i64]* %w, i32 0, i32 4
  %arrayidx193 = getelementptr inbounds [16 x i64], [16 x i64]* %w, i32 0, i32 5
  %arrayidx198 = getelementptr inbounds [16 x i64], [16 x i64]* %w, i32 0, i32 6
  %arrayidx203 = getelementptr inbounds [16 x i64], [16 x i64]* %w, i32 0, i32 7
  %arrayidx208 = getelementptr inbounds [16 x i64], [16 x i64]* %w, i32 0, i32 8
  %arrayidx213 = getelementptr inbounds [16 x i64], [16 x i64]* %w, i32 0, i32 9
  %arrayidx218 = getelementptr inbounds [16 x i64], [16 x i64]* %w, i32 0, i32 10
  %arrayidx223 = getelementptr inbounds [16 x i64], [16 x i64]* %w, i32 0, i32 11
  %arrayidx228 = getelementptr inbounds [16 x i64], [16 x i64]* %w, i32 0, i32 12
  %arrayidx233 = getelementptr inbounds [16 x i64], [16 x i64]* %w, i32 0, i32 13
  %arrayidx242 = getelementptr inbounds [16 x i64], [16 x i64]* %w, i32 0, i32 14
  %arrayidx251 = getelementptr inbounds [16 x i64], [16 x i64]* %w, i32 0, i32 15
  %.pre1466 = load i64, i64* %arrayidx11, align 8, !tbaa !2
  %.pre1467 = load i64, i64* %arrayidx17, align 8, !tbaa !2
  %.pre1468 = load i64, i64* %arrayidx22, align 8, !tbaa !2
  %.pre1469 = load i64, i64* %arrayidx27, align 8, !tbaa !2
  %.pre1470 = load i64, i64* %arrayidx32, align 8, !tbaa !2
  %.pre1471 = load i64, i64* %arrayidx37, align 8, !tbaa !2
  %.pre1472 = load i64, i64* %arrayidx42, align 8, !tbaa !2
  %.pre1473 = load i64, i64* %arrayidx47, align 8, !tbaa !2
  %.pre1474 = load i64, i64* %arrayidx52, align 8, !tbaa !2
  %.pre1475 = load i64, i64* %arrayidx57, align 8, !tbaa !2
  %.pre1476 = load i64, i64* %arrayidx62, align 8, !tbaa !2
  %.pre1477 = load i64, i64* %arrayidx67, align 8, !tbaa !2
  %.pre1478 = load i64, i64* %arrayidx72, align 8, !tbaa !2
  %.pre1479 = load i64, i64* %arrayidx77, align 8, !tbaa !2
  %.pre1480 = load i64, i64* %arrayidx82, align 8, !tbaa !2
  %.pre1481 = load i64, i64* %arrayidx87, align 8, !tbaa !2
  br label %do.body

do.body:                                          ; preds = %for.end.do.body_crit_edge, %entry
  %4 = phi i64 [ %3, %entry ], [ %and, %for.end.do.body_crit_edge ]
  %5 = phi i64 [ %.pre1481, %entry ], [ %xor897, %for.end.do.body_crit_edge ]
  %6 = phi i64 [ %.pre1480, %entry ], [ %xor893, %for.end.do.body_crit_edge ]
  %7 = phi i64 [ %.pre1479, %entry ], [ %xor889, %for.end.do.body_crit_edge ]
  %8 = phi i64 [ %.pre1478, %entry ], [ %xor885, %for.end.do.body_crit_edge ]
  %9 = phi i64 [ %.pre1477, %entry ], [ %xor881, %for.end.do.body_crit_edge ]
  %10 = phi i64 [ %.pre1476, %entry ], [ %xor877, %for.end.do.body_crit_edge ]
  %11 = phi i64 [ %.pre1475, %entry ], [ %xor873, %for.end.do.body_crit_edge ]
  %12 = phi i64 [ %.pre1474, %entry ], [ %xor869, %for.end.do.body_crit_edge ]
  %13 = phi i64 [ %.pre1473, %entry ], [ %xor865, %for.end.do.body_crit_edge ]
  %14 = phi i64 [ %.pre1472, %entry ], [ %xor861, %for.end.do.body_crit_edge ]
  %15 = phi i64 [ %.pre1471, %entry ], [ %xor857, %for.end.do.body_crit_edge ]
  %16 = phi i64 [ %.pre1470, %entry ], [ %xor853, %for.end.do.body_crit_edge ]
  %17 = phi i64 [ %.pre1469, %entry ], [ %xor849, %for.end.do.body_crit_edge ]
  %18 = phi i64 [ %.pre1468, %entry ], [ %xor845, %for.end.do.body_crit_edge ]
  %19 = phi i64 [ %.pre1467, %entry ], [ %xor841, %for.end.do.body_crit_edge ]
  %20 = phi i64 [ %.pre1466, %entry ], [ %xor837, %for.end.do.body_crit_edge ]
  %21 = phi i64 [ %2, %entry ], [ %.pre, %for.end.do.body_crit_edge ]
  %blkCnt.addr.0 = phi i32 [ %blkCnt, %entry ], [ %dec, %for.end.do.body_crit_edge ]
  %blkPtr.addr.0 = phi i8* [ %blkPtr, %entry ], [ %add.ptr903, %for.end.do.body_crit_edge ]
  %add = add i64 %21, %conv
  store i64 %add, i64* %arraydecay, align 16, !tbaa !2
  store i64 %20, i64* %add.ptr13, align 8, !tbaa !2
  store i64 %19, i64* %arrayidx20, align 16, !tbaa !2
  store i64 %18, i64* %arrayidx25, align 8, !tbaa !2
  store i64 %17, i64* %arrayidx30, align 16, !tbaa !2
  store i64 %16, i64* %arrayidx35, align 8, !tbaa !2
  store i64 %15, i64* %arrayidx40, align 16, !tbaa !2
  store i64 %14, i64* %arrayidx45, align 8, !tbaa !2
  store i64 %13, i64* %arrayidx50, align 16, !tbaa !2
  store i64 %12, i64* %arrayidx55, align 8, !tbaa !2
  store i64 %11, i64* %arrayidx60, align 16, !tbaa !2
  store i64 %10, i64* %arrayidx65, align 8, !tbaa !2
  store i64 %9, i64* %arrayidx70, align 16, !tbaa !2
  store i64 %8, i64* %arrayidx75, align 8, !tbaa !2
  store i64 %7, i64* %arrayidx80, align 16, !tbaa !2
  store i64 %6, i64* %arrayidx85, align 8, !tbaa !2
  store i64 %5, i64* %arrayidx90, align 16, !tbaa !2
  %xor = xor i64 %20, 2004413935125273122
  %xor100 = xor i64 %xor, %19
  %xor104 = xor i64 %xor100, %18
  %xor108 = xor i64 %xor104, %17
  %xor112 = xor i64 %xor108, %16
  %xor116 = xor i64 %xor112, %15
  %xor120 = xor i64 %xor116, %14
  %xor124 = xor i64 %xor120, %13
  %xor128 = xor i64 %xor124, %12
  %xor132 = xor i64 %xor128, %11
  %xor136 = xor i64 %xor132, %10
  %xor140 = xor i64 %xor136, %9
  %xor144 = xor i64 %xor140, %8
  %xor148 = xor i64 %xor144, %7
  %xor152 = xor i64 %xor148, %6
  %xor153 = xor i64 %xor152, %5
  store i64 %xor153, i64* %arrayidx156, align 8, !tbaa !2
  %xor163 = xor i64 %4, %add
  store i64 %xor163, i64* %arrayidx166, align 16, !tbaa !2
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %do.body
  %n.055.i = phi i32 [ %add35.i, %for.body.i ], [ 0, %do.body ]
  %arrayidx.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 %n.055.i
  %22 = load i8, i8* %arrayidx.i, align 1, !tbaa !6
  %conv.i = zext i8 %22 to i64
  %add.i = or i32 %n.055.i, 1
  %arrayidx1.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 %add.i
  %23 = load i8, i8* %arrayidx1.i, align 1, !tbaa !6
  %conv2.i = zext i8 %23 to i64
  %shl.i = shl nuw nsw i64 %conv2.i, 8
  %add3.i = or i64 %shl.i, %conv.i
  %add4.i = or i32 %n.055.i, 2
  %arrayidx5.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 %add4.i
  %24 = load i8, i8* %arrayidx5.i, align 1, !tbaa !6
  %conv6.i = zext i8 %24 to i64
  %shl7.i = shl nuw nsw i64 %conv6.i, 16
  %add8.i = or i64 %add3.i, %shl7.i
  %add9.i = or i32 %n.055.i, 3
  %arrayidx10.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 %add9.i
  %25 = load i8, i8* %arrayidx10.i, align 1, !tbaa !6
  %conv11.i = zext i8 %25 to i64
  %shl12.i = shl nuw nsw i64 %conv11.i, 24
  %add13.i = or i64 %add8.i, %shl12.i
  %add14.i = or i32 %n.055.i, 4
  %arrayidx15.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 %add14.i
  %26 = load i8, i8* %arrayidx15.i, align 1, !tbaa !6
  %conv16.i = zext i8 %26 to i64
  %shl17.i = shl nuw nsw i64 %conv16.i, 32
  %add18.i = or i64 %add13.i, %shl17.i
  %add19.i = or i32 %n.055.i, 5
  %arrayidx20.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 %add19.i
  %27 = load i8, i8* %arrayidx20.i, align 1, !tbaa !6
  %conv21.i = zext i8 %27 to i64
  %shl22.i = shl nuw nsw i64 %conv21.i, 40
  %add23.i = or i64 %add18.i, %shl22.i
  %add24.i = or i32 %n.055.i, 6
  %arrayidx25.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 %add24.i
  %28 = load i8, i8* %arrayidx25.i, align 1, !tbaa !6
  %conv26.i = zext i8 %28 to i64
  %shl27.i = shl nuw nsw i64 %conv26.i, 48
  %add28.i = add i64 %add23.i, %shl27.i
  %add29.i = or i32 %n.055.i, 7
  %arrayidx30.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 %add29.i
  %29 = load i8, i8* %arrayidx30.i, align 1, !tbaa !6
  %conv31.i = zext i8 %29 to i64
  %shl32.i = shl nuw i64 %conv31.i, 56
  %add33.i = add i64 %add28.i, %shl32.i
  %div.i = lshr exact i32 %n.055.i, 3
  %arrayidx34.i = getelementptr inbounds [16 x i64], [16 x i64]* %w, i32 0, i32 %div.i
  store i64 %add33.i, i64* %arrayidx34.i, align 8, !tbaa !2
  %add35.i = add nuw nsw i32 %n.055.i, 8
  %cmp.i = icmp ult i32 %n.055.i, 120
  br i1 %cmp.i, label %for.body.i, label %Skein_Get64_LSB_First.exit

Skein_Get64_LSB_First.exit:                       ; preds = %for.body.i
  %30 = load i64, i64* %arraydecay167, align 16, !tbaa !2
  %add172 = add i64 %30, %20
  %31 = load i64, i64* %arrayidx173, align 8, !tbaa !2
  %add177 = add i64 %31, %19
  %32 = load i64, i64* %arrayidx178, align 16, !tbaa !2
  %add182 = add i64 %32, %18
  %33 = load i64, i64* %arrayidx183, align 8, !tbaa !2
  %add187 = add i64 %33, %17
  %34 = load i64, i64* %arrayidx188, align 16, !tbaa !2
  %add192 = add i64 %34, %16
  %35 = load i64, i64* %arrayidx193, align 8, !tbaa !2
  %add197 = add i64 %35, %15
  %36 = load i64, i64* %arrayidx198, align 16, !tbaa !2
  %add202 = add i64 %36, %14
  %37 = load i64, i64* %arrayidx203, align 8, !tbaa !2
  %add207 = add i64 %37, %13
  %38 = load i64, i64* %arrayidx208, align 16, !tbaa !2
  %add212 = add i64 %38, %12
  %39 = load i64, i64* %arrayidx213, align 8, !tbaa !2
  %add217 = add i64 %39, %11
  %40 = load i64, i64* %arrayidx218, align 16, !tbaa !2
  %add222 = add i64 %40, %10
  %41 = load i64, i64* %arrayidx223, align 8, !tbaa !2
  %add227 = add i64 %41, %9
  %42 = load i64, i64* %arrayidx228, align 16, !tbaa !2
  %add232 = add i64 %42, %8
  %43 = load i64, i64* %arrayidx233, align 8, !tbaa !2
  %add237 = add i64 %7, %add
  %add241 = add i64 %add237, %43
  %44 = load i64, i64* %arrayidx242, align 16, !tbaa !2
  %add246 = add i64 %4, %6
  %add250 = add i64 %add246, %44
  %45 = load i64, i64* %arrayidx251, align 8, !tbaa !2
  %add255 = add i64 %45, %5
  br label %for.body

for.body:                                         ; preds = %Skein_Get64_LSB_First.exit, %for.body
  %indvars.iv = phi i64 [ 1, %Skein_Get64_LSB_First.exit ], [ %indvars.iv.next, %for.body ]
  %X15.01448 = phi i64 [ %add255, %Skein_Get64_LSB_First.exit ], [ %add814, %for.body ]
  %X14.01447 = phi i64 [ %add250, %Skein_Get64_LSB_First.exit ], [ %add805, %for.body ]
  %X13.01446 = phi i64 [ %add241, %Skein_Get64_LSB_First.exit ], [ %add793, %for.body ]
  %X12.01445 = phi i64 [ %add232, %Skein_Get64_LSB_First.exit ], [ %add781, %for.body ]
  %X11.01444 = phi i64 [ %add227, %Skein_Get64_LSB_First.exit ], [ %add775, %for.body ]
  %X10.01443 = phi i64 [ %add222, %Skein_Get64_LSB_First.exit ], [ %add769, %for.body ]
  %X09.01442 = phi i64 [ %add217, %Skein_Get64_LSB_First.exit ], [ %add763, %for.body ]
  %X08.01441 = phi i64 [ %add212, %Skein_Get64_LSB_First.exit ], [ %add757, %for.body ]
  %X07.01440 = phi i64 [ %add207, %Skein_Get64_LSB_First.exit ], [ %add751, %for.body ]
  %X06.01439 = phi i64 [ %add202, %Skein_Get64_LSB_First.exit ], [ %add745, %for.body ]
  %X05.01438 = phi i64 [ %add197, %Skein_Get64_LSB_First.exit ], [ %add739, %for.body ]
  %X04.01437 = phi i64 [ %add192, %Skein_Get64_LSB_First.exit ], [ %add733, %for.body ]
  %X03.01436 = phi i64 [ %add187, %Skein_Get64_LSB_First.exit ], [ %add727, %for.body ]
  %X02.01435 = phi i64 [ %add182, %Skein_Get64_LSB_First.exit ], [ %add721, %for.body ]
  %X01.01434 = phi i64 [ %add177, %Skein_Get64_LSB_First.exit ], [ %add715, %for.body ]
  %X00.01433 = phi i64 [ %add172, %Skein_Get64_LSB_First.exit ], [ %add709, %for.body ]
  %r.01432 = phi i32 [ 1, %Skein_Get64_LSB_First.exit ], [ %add429, %for.body ]
  %add257 = add i64 %X01.01434, %X00.01433
  %shl = shl i64 %X01.01434, 24
  %shr = lshr i64 %X01.01434, 40
  %or = or i64 %shl, %shr
  %xor258 = xor i64 %or, %add257
  %add259 = add i64 %X03.01436, %X02.01435
  %shl260 = shl i64 %X03.01436, 13
  %shr261 = lshr i64 %X03.01436, 51
  %or262 = or i64 %shl260, %shr261
  %xor263 = xor i64 %or262, %add259
  %add264 = add i64 %X05.01438, %X04.01437
  %shl265 = shl i64 %X05.01438, 8
  %shr266 = lshr i64 %X05.01438, 56
  %or267 = or i64 %shl265, %shr266
  %xor268 = xor i64 %or267, %add264
  %add269 = add i64 %X07.01440, %X06.01439
  %shl270 = shl i64 %X07.01440, 47
  %shr271 = lshr i64 %X07.01440, 17
  %or272 = or i64 %shl270, %shr271
  %xor273 = xor i64 %or272, %add269
  %add274 = add i64 %X09.01442, %X08.01441
  %shl275 = shl i64 %X09.01442, 8
  %shr276 = lshr i64 %X09.01442, 56
  %or277 = or i64 %shl275, %shr276
  %xor278 = xor i64 %or277, %add274
  %add279 = add i64 %X11.01444, %X10.01443
  %shl280 = shl i64 %X11.01444, 17
  %shr281 = lshr i64 %X11.01444, 47
  %or282 = or i64 %shl280, %shr281
  %xor283 = xor i64 %or282, %add279
  %add284 = add i64 %X13.01446, %X12.01445
  %shl285 = shl i64 %X13.01446, 22
  %shr286 = lshr i64 %X13.01446, 42
  %or287 = or i64 %shl285, %shr286
  %xor288 = xor i64 %or287, %add284
  %add289 = add i64 %X15.01448, %X14.01447
  %shl290 = shl i64 %X15.01448, 37
  %shr291 = lshr i64 %X15.01448, 27
  %or292 = or i64 %shl290, %shr291
  %xor293 = xor i64 %or292, %add289
  %add294 = add i64 %xor278, %add257
  %shl295 = shl i64 %xor278, 38
  %shr296 = lshr i64 %xor278, 26
  %or297 = or i64 %shl295, %shr296
  %xor298 = xor i64 %or297, %add294
  %add299 = add i64 %xor288, %add259
  %shl300 = shl i64 %xor288, 19
  %shr301 = lshr i64 %xor288, 45
  %or302 = or i64 %shl300, %shr301
  %xor303 = xor i64 %or302, %add299
  %add304 = add i64 %xor283, %add269
  %shl305 = shl i64 %xor283, 10
  %shr306 = lshr i64 %xor283, 54
  %or307 = or i64 %shl305, %shr306
  %xor308 = xor i64 %or307, %add304
  %add309 = add i64 %xor293, %add264
  %shl310 = shl i64 %xor293, 55
  %shr311 = lshr i64 %xor293, 9
  %or312 = or i64 %shl310, %shr311
  %xor313 = xor i64 %or312, %add309
  %add314 = add i64 %add279, %xor273
  %shl315 = shl i64 %xor273, 49
  %shr316 = lshr i64 %xor273, 15
  %or317 = or i64 %shl315, %shr316
  %xor318 = xor i64 %add314, %or317
  %add319 = add i64 %add284, %xor263
  %shl320 = shl i64 %xor263, 18
  %shr321 = lshr i64 %xor263, 46
  %or322 = or i64 %shl320, %shr321
  %xor323 = xor i64 %add319, %or322
  %add324 = add i64 %add289, %xor268
  %shl325 = shl i64 %xor268, 23
  %shr326 = lshr i64 %xor268, 41
  %or327 = or i64 %shl325, %shr326
  %xor328 = xor i64 %add324, %or327
  %add329 = add i64 %add274, %xor258
  %shl330 = shl i64 %xor258, 52
  %shr331 = lshr i64 %xor258, 12
  %or332 = or i64 %shl330, %shr331
  %xor333 = xor i64 %add329, %or332
  %add334 = add i64 %xor318, %add294
  %shl335 = shl i64 %xor318, 33
  %shr336 = lshr i64 %xor318, 31
  %or337 = or i64 %shl335, %shr336
  %xor338 = xor i64 %or337, %add334
  %add339 = add i64 %xor328, %add299
  %shl340 = shl i64 %xor328, 4
  %shr341 = lshr i64 %xor328, 60
  %or342 = or i64 %shl340, %shr341
  %xor343 = xor i64 %or342, %add339
  %add344 = add i64 %add309, %xor323
  %shl345 = shl i64 %xor323, 51
  %shr346 = lshr i64 %xor323, 13
  %or347 = or i64 %shl345, %shr346
  %xor348 = xor i64 %add344, %or347
  %add349 = add i64 %add304, %xor333
  %shl350 = shl i64 %xor333, 13
  %shr351 = lshr i64 %xor333, 51
  %or352 = or i64 %shl350, %shr351
  %xor353 = xor i64 %add349, %or352
  %add354 = add i64 %xor313, %add319
  %shl355 = shl i64 %xor313, 34
  %shr356 = lshr i64 %xor313, 30
  %or357 = or i64 %shl355, %shr356
  %xor358 = xor i64 %or357, %add354
  %add359 = add i64 %xor303, %add324
  %shl360 = shl i64 %xor303, 41
  %shr361 = lshr i64 %xor303, 23
  %or362 = or i64 %shl360, %shr361
  %xor363 = xor i64 %or362, %add359
  %add364 = add i64 %xor308, %add329
  %shl365 = shl i64 %xor308, 59
  %shr366 = lshr i64 %xor308, 5
  %or367 = or i64 %shl365, %shr366
  %xor368 = xor i64 %or367, %add364
  %add369 = add i64 %xor298, %add314
  %shl370 = shl i64 %xor298, 17
  %shr371 = lshr i64 %xor298, 47
  %or372 = or i64 %shl370, %shr371
  %xor373 = xor i64 %or372, %add369
  %add374 = add i64 %xor358, %add334
  %shl375 = shl i64 %xor358, 5
  %shr376 = lshr i64 %xor358, 59
  %or377 = or i64 %shl375, %shr376
  %xor378 = xor i64 %or377, %add374
  %add379 = add i64 %xor368, %add339
  %shl380 = shl i64 %xor368, 20
  %shr381 = lshr i64 %xor368, 44
  %or382 = or i64 %shl380, %shr381
  %xor383 = xor i64 %or382, %add379
  %add384 = add i64 %xor363, %add349
  %shl385 = shl i64 %xor363, 48
  %shr386 = lshr i64 %xor363, 16
  %or387 = or i64 %shl385, %shr386
  %xor388 = xor i64 %or387, %add384
  %add389 = add i64 %add344, %xor373
  %shl390 = shl i64 %xor373, 41
  %shr391 = lshr i64 %xor373, 23
  %or392 = or i64 %shl390, %shr391
  %xor393 = xor i64 %add389, %or392
  %add394 = add i64 %add359, %xor353
  %shl395 = shl i64 %xor353, 47
  %shr396 = lshr i64 %xor353, 17
  %or397 = or i64 %shl395, %shr396
  %xor398 = xor i64 %add394, %or397
  %add399 = add i64 %xor343, %add364
  %shl400 = shl i64 %xor343, 28
  %shr401 = lshr i64 %xor343, 36
  %or402 = or i64 %shl400, %shr401
  %xor403 = xor i64 %or402, %add399
  %add404 = add i64 %xor348, %add369
  %shl405 = shl i64 %xor348, 16
  %shr406 = lshr i64 %xor348, 48
  %or407 = or i64 %shl405, %shr406
  %xor408 = xor i64 %or407, %add404
  %add409 = add i64 %add354, %xor338
  %shl410 = shl i64 %xor338, 25
  %shr411 = lshr i64 %xor338, 39
  %or412 = or i64 %shl410, %shr411
  %xor413 = xor i64 %add409, %or412
  %arrayidx418 = getelementptr inbounds i64, i64* %add.ptr13, i32 %r.01432
  %46 = load i64, i64* %arrayidx418, align 8, !tbaa !2
  %add419 = add i64 %46, %add374
  %47 = add nuw nsw i64 %indvars.iv, 1
  %add423 = add nuw nsw i32 %r.01432, 1
  %48 = trunc i64 %47 to i32
  %arrayidx424 = getelementptr inbounds i64, i64* %add.ptr13, i32 %48
  %49 = load i64, i64* %arrayidx424, align 8, !tbaa !2
  %add425 = add i64 %49, %xor398
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2
  %add429 = add nuw nsw i32 %r.01432, 2
  %50 = trunc i64 %indvars.iv.next to i32
  %arrayidx430 = getelementptr inbounds i64, i64* %add.ptr13, i32 %50
  %51 = load i64, i64* %arrayidx430, align 8, !tbaa !2
  %add431 = add i64 %51, %add379
  %add435 = add nuw nsw i32 %r.01432, 3
  %52 = trunc i64 %indvars.iv to i32
  %53 = add i32 %52, 3
  %arrayidx436 = getelementptr inbounds i64, i64* %add.ptr13, i32 %53
  %54 = load i64, i64* %arrayidx436, align 8, !tbaa !2
  %add437 = add i64 %54, %xor408
  %55 = add i32 %52, 4
  %arrayidx442 = getelementptr inbounds i64, i64* %add.ptr13, i32 %55
  %56 = load i64, i64* %arrayidx442, align 8, !tbaa !2
  %add443 = add i64 %56, %add389
  %57 = add i32 %52, 5
  %arrayidx448 = getelementptr inbounds i64, i64* %add.ptr13, i32 %57
  %58 = load i64, i64* %arrayidx448, align 8, !tbaa !2
  %add449 = add i64 %58, %xor403
  %59 = add i32 %52, 6
  %arrayidx454 = getelementptr inbounds i64, i64* %add.ptr13, i32 %59
  %60 = load i64, i64* %arrayidx454, align 8, !tbaa !2
  %add455 = add i64 %60, %add384
  %61 = add i32 %52, 7
  %arrayidx460 = getelementptr inbounds i64, i64* %add.ptr13, i32 %61
  %62 = load i64, i64* %arrayidx460, align 8, !tbaa !2
  %add461 = add i64 %62, %xor413
  %63 = add i32 %52, 8
  %arrayidx466 = getelementptr inbounds i64, i64* %add.ptr13, i32 %63
  %64 = load i64, i64* %arrayidx466, align 8, !tbaa !2
  %add467 = add i64 %64, %add399
  %65 = add i32 %52, 9
  %arrayidx472 = getelementptr inbounds i64, i64* %add.ptr13, i32 %65
  %66 = load i64, i64* %arrayidx472, align 8, !tbaa !2
  %add473 = add i64 %66, %xor393
  %67 = add i32 %52, 10
  %arrayidx478 = getelementptr inbounds i64, i64* %add.ptr13, i32 %67
  %68 = load i64, i64* %arrayidx478, align 8, !tbaa !2
  %add479 = add i64 %68, %add404
  %69 = add i32 %52, 11
  %arrayidx484 = getelementptr inbounds i64, i64* %add.ptr13, i32 %69
  %70 = load i64, i64* %arrayidx484, align 8, !tbaa !2
  %add485 = add i64 %70, %xor383
  %71 = add i32 %52, 12
  %arrayidx490 = getelementptr inbounds i64, i64* %add.ptr13, i32 %71
  %72 = load i64, i64* %arrayidx490, align 8, !tbaa !2
  %add491 = add i64 %72, %add409
  %73 = add i32 %52, 13
  %arrayidx496 = getelementptr inbounds i64, i64* %add.ptr13, i32 %73
  %74 = load i64, i64* %arrayidx496, align 8, !tbaa !2
  %arrayidx501 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 %r.01432
  %75 = load i64, i64* %arrayidx501, align 8, !tbaa !2
  %add502 = add i64 %74, %xor388
  %add503 = add i64 %add502, %75
  %76 = add i32 %52, 14
  %arrayidx508 = getelementptr inbounds i64, i64* %add.ptr13, i32 %76
  %77 = load i64, i64* %arrayidx508, align 8, !tbaa !2
  %arrayidx513 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 %add423
  %78 = load i64, i64* %arrayidx513, align 8, !tbaa !2
  %add514 = add i64 %78, %77
  %add515 = add i64 %add514, %add394
  %79 = add i32 %52, 15
  %arrayidx520 = getelementptr inbounds i64, i64* %add.ptr13, i32 %79
  %80 = load i64, i64* %arrayidx520, align 8, !tbaa !2
  %add522 = add i64 %xor378, %indvars.iv
  %add524 = add i64 %add522, %80
  %sub = add nsw i32 %r.01432, -1
  %arrayidx528 = getelementptr inbounds i64, i64* %add.ptr13, i32 %sub
  %81 = load i64, i64* %arrayidx528, align 8, !tbaa !2
  %82 = add i32 %52, 16
  %arrayidx533 = getelementptr inbounds i64, i64* %add.ptr13, i32 %82
  store i64 %81, i64* %arrayidx533, align 8, !tbaa !2
  %arrayidx538 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 %sub
  %83 = load i64, i64* %arrayidx538, align 8, !tbaa !2
  %arrayidx543 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 %add429
  store i64 %83, i64* %arrayidx543, align 8, !tbaa !2
  %add544 = add i64 %add419, %add425
  %shl545 = shl i64 %add425, 41
  %shr546 = lshr i64 %add425, 23
  %or547 = or i64 %shl545, %shr546
  %xor548 = xor i64 %or547, %add544
  %add549 = add i64 %add431, %add437
  %shl550 = shl i64 %add437, 9
  %shr551 = lshr i64 %add437, 55
  %or552 = or i64 %shl550, %shr551
  %xor553 = xor i64 %or552, %add549
  %add554 = add i64 %add443, %add449
  %shl555 = shl i64 %add449, 37
  %shr556 = lshr i64 %add449, 27
  %or557 = or i64 %shl555, %shr556
  %xor558 = xor i64 %or557, %add554
  %add559 = add i64 %add455, %add461
  %shl560 = shl i64 %add461, 31
  %shr561 = lshr i64 %add461, 33
  %or562 = or i64 %shl560, %shr561
  %xor563 = xor i64 %or562, %add559
  %add564 = add i64 %add467, %add473
  %shl565 = shl i64 %add473, 12
  %shr566 = lshr i64 %add473, 52
  %or567 = or i64 %shl565, %shr566
  %xor568 = xor i64 %or567, %add564
  %add569 = add i64 %add479, %add485
  %shl570 = shl i64 %add485, 47
  %shr571 = lshr i64 %add485, 17
  %or572 = or i64 %shl570, %shr571
  %xor573 = xor i64 %or572, %add569
  %add574 = add i64 %add491, %add503
  %shl575 = shl i64 %add503, 44
  %shr576 = lshr i64 %add503, 20
  %or577 = or i64 %shl575, %shr576
  %xor578 = xor i64 %or577, %add574
  %add579 = add i64 %add515, %add524
  %shl580 = shl i64 %add524, 30
  %shr581 = lshr i64 %add524, 34
  %or582 = or i64 %shl580, %shr581
  %xor583 = xor i64 %or582, %add579
  %add584 = add i64 %xor568, %add544
  %shl585 = shl i64 %xor568, 16
  %shr586 = lshr i64 %xor568, 48
  %or587 = or i64 %shl585, %shr586
  %xor588 = xor i64 %or587, %add584
  %add589 = add i64 %xor578, %add549
  %shl590 = shl i64 %xor578, 34
  %shr591 = lshr i64 %xor578, 30
  %or592 = or i64 %shl590, %shr591
  %xor593 = xor i64 %or592, %add589
  %add594 = add i64 %xor573, %add559
  %shl595 = shl i64 %xor573, 56
  %shr596 = lshr i64 %xor573, 8
  %or597 = or i64 %shl595, %shr596
  %xor598 = xor i64 %or597, %add594
  %add599 = add i64 %xor583, %add554
  %shl600 = shl i64 %xor583, 51
  %shr601 = lshr i64 %xor583, 13
  %or602 = or i64 %shl600, %shr601
  %xor603 = xor i64 %or602, %add599
  %add604 = add i64 %add569, %xor563
  %shl605 = shl i64 %xor563, 4
  %shr606 = lshr i64 %xor563, 60
  %or607 = or i64 %shl605, %shr606
  %xor608 = xor i64 %add604, %or607
  %add609 = add i64 %add574, %xor553
  %shl610 = shl i64 %xor553, 53
  %shr611 = lshr i64 %xor553, 11
  %or612 = or i64 %shl610, %shr611
  %xor613 = xor i64 %add609, %or612
  %add614 = add i64 %add579, %xor558
  %shl615 = shl i64 %xor558, 42
  %shr616 = lshr i64 %xor558, 22
  %or617 = or i64 %shl615, %shr616
  %xor618 = xor i64 %add614, %or617
  %add619 = add i64 %add564, %xor548
  %shl620 = shl i64 %xor548, 41
  %shr621 = lshr i64 %xor548, 23
  %or622 = or i64 %shl620, %shr621
  %xor623 = xor i64 %add619, %or622
  %add624 = add i64 %xor608, %add584
  %shl625 = shl i64 %xor608, 31
  %shr626 = lshr i64 %xor608, 33
  %or627 = or i64 %shl625, %shr626
  %xor628 = xor i64 %or627, %add624
  %add629 = add i64 %xor618, %add589
  %shl630 = shl i64 %xor618, 44
  %shr631 = lshr i64 %xor618, 20
  %or632 = or i64 %shl630, %shr631
  %xor633 = xor i64 %or632, %add629
  %add634 = add i64 %add599, %xor613
  %shl635 = shl i64 %xor613, 47
  %shr636 = lshr i64 %xor613, 17
  %or637 = or i64 %shl635, %shr636
  %xor638 = xor i64 %add634, %or637
  %add639 = add i64 %add594, %xor623
  %shl640 = shl i64 %xor623, 46
  %shr641 = lshr i64 %xor623, 18
  %or642 = or i64 %shl640, %shr641
  %xor643 = xor i64 %add639, %or642
  %add644 = add i64 %xor603, %add609
  %shl645 = shl i64 %xor603, 19
  %shr646 = lshr i64 %xor603, 45
  %or647 = or i64 %shl645, %shr646
  %xor648 = xor i64 %or647, %add644
  %add649 = add i64 %xor593, %add614
  %shl650 = shl i64 %xor593, 42
  %shr651 = lshr i64 %xor593, 22
  %or652 = or i64 %shl650, %shr651
  %xor653 = xor i64 %or652, %add649
  %add654 = add i64 %xor598, %add619
  %shl655 = shl i64 %xor598, 44
  %shr656 = lshr i64 %xor598, 20
  %or657 = or i64 %shl655, %shr656
  %xor658 = xor i64 %or657, %add654
  %add659 = add i64 %xor588, %add604
  %shl660 = shl i64 %xor588, 25
  %shr661 = lshr i64 %xor588, 39
  %or662 = or i64 %shl660, %shr661
  %xor663 = xor i64 %or662, %add659
  %add664 = add i64 %xor648, %add624
  %shl665 = shl i64 %xor648, 9
  %shr666 = lshr i64 %xor648, 55
  %or667 = or i64 %shl665, %shr666
  %xor668 = xor i64 %or667, %add664
  %add669 = add i64 %add629, %xor658
  %shl670 = shl i64 %xor658, 48
  %shr671 = lshr i64 %xor658, 16
  %or672 = or i64 %shl670, %shr671
  %xor673 = xor i64 %add669, %or672
  %add674 = add i64 %xor653, %add639
  %shl675 = shl i64 %xor653, 35
  %shr676 = lshr i64 %xor653, 29
  %or677 = or i64 %shl675, %shr676
  %xor678 = xor i64 %or677, %add674
  %add679 = add i64 %add634, %xor663
  %shl680 = shl i64 %xor663, 52
  %shr681 = lshr i64 %xor663, 12
  %or682 = or i64 %shl680, %shr681
  %xor683 = xor i64 %add679, %or682
  %add684 = add i64 %add649, %xor643
  %shl685 = shl i64 %xor643, 23
  %shr686 = lshr i64 %xor643, 41
  %or687 = or i64 %shl685, %shr686
  %xor688 = xor i64 %add684, %or687
  %add689 = add i64 %xor633, %add654
  %shl690 = shl i64 %xor633, 31
  %shr691 = lshr i64 %xor633, 33
  %or692 = or i64 %shl690, %shr691
  %xor693 = xor i64 %or692, %add689
  %add694 = add i64 %xor638, %add659
  %shl695 = shl i64 %xor638, 37
  %shr696 = lshr i64 %xor638, 27
  %or697 = or i64 %shl695, %shr696
  %xor698 = xor i64 %or697, %add694
  %add699 = add i64 %add644, %xor628
  %shl700 = shl i64 %xor628, 20
  %shr701 = lshr i64 %xor628, 44
  %or702 = or i64 %shl700, %shr701
  %xor703 = xor i64 %add699, %or702
  %add709 = add i64 %add664, %49
  %add715 = add i64 %xor688, %51
  %add721 = add i64 %add669, %54
  %add727 = add i64 %xor698, %56
  %add733 = add i64 %add679, %58
  %add739 = add i64 %xor693, %60
  %add745 = add i64 %add674, %62
  %add751 = add i64 %xor703, %64
  %add757 = add i64 %add689, %66
  %add763 = add i64 %xor683, %68
  %add769 = add i64 %add694, %70
  %add775 = add i64 %xor673, %72
  %add781 = add i64 %add699, %74
  %add793 = add i64 %xor678, %add514
  %add804 = add i64 %83, %80
  %add805 = add i64 %add804, %add684
  %add813 = add i64 %47, %81
  %add814 = add i64 %add813, %xor668
  %84 = add i32 %52, 17
  %arrayidx824 = getelementptr inbounds i64, i64* %add.ptr13, i32 %84
  store i64 %46, i64* %arrayidx824, align 8, !tbaa !2
  %arrayidx834 = getelementptr inbounds [40 x i64], [40 x i64]* %kw, i32 0, i32 %add435
  store i64 %75, i64* %arrayidx834, align 8, !tbaa !2
  %cmp = icmp ult i64 %indvars.iv, 19
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  %xor837 = xor i64 %add709, %30
  store i64 %xor837, i64* %arrayidx11, align 8, !tbaa !2
  %xor841 = xor i64 %add715, %31
  store i64 %xor841, i64* %arrayidx17, align 8, !tbaa !2
  %xor845 = xor i64 %add721, %32
  store i64 %xor845, i64* %arrayidx22, align 8, !tbaa !2
  %xor849 = xor i64 %add727, %33
  store i64 %xor849, i64* %arrayidx27, align 8, !tbaa !2
  %xor853 = xor i64 %add733, %34
  store i64 %xor853, i64* %arrayidx32, align 8, !tbaa !2
  %xor857 = xor i64 %add739, %35
  store i64 %xor857, i64* %arrayidx37, align 8, !tbaa !2
  %xor861 = xor i64 %add745, %36
  store i64 %xor861, i64* %arrayidx42, align 8, !tbaa !2
  %xor865 = xor i64 %add751, %37
  store i64 %xor865, i64* %arrayidx47, align 8, !tbaa !2
  %xor869 = xor i64 %add757, %38
  store i64 %xor869, i64* %arrayidx52, align 8, !tbaa !2
  %xor873 = xor i64 %add763, %39
  store i64 %xor873, i64* %arrayidx57, align 8, !tbaa !2
  %xor877 = xor i64 %add769, %40
  store i64 %xor877, i64* %arrayidx62, align 8, !tbaa !2
  %xor881 = xor i64 %add775, %41
  store i64 %xor881, i64* %arrayidx67, align 8, !tbaa !2
  %xor885 = xor i64 %add781, %42
  store i64 %xor885, i64* %arrayidx72, align 8, !tbaa !2
  %xor889 = xor i64 %add793, %43
  store i64 %xor889, i64* %arrayidx77, align 8, !tbaa !2
  %xor893 = xor i64 %add805, %44
  store i64 %xor893, i64* %arrayidx82, align 8, !tbaa !2
  %xor897 = xor i64 %add814, %45
  store i64 %xor897, i64* %arrayidx87, align 8, !tbaa !2
  %85 = load i64, i64* %arrayidx7, align 8, !tbaa !2
  %and = and i64 %85, -4611686018427387905
  store i64 %and, i64* %arrayidx7, align 8, !tbaa !2
  %dec = add i32 %blkCnt.addr.0, -1
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %do.end, label %for.end.do.body_crit_edge

for.end.do.body_crit_edge:                        ; preds = %for.end
  %add.ptr903 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 128
  %.pre = load i64, i64* %arraydecay, align 16, !tbaa !2
  br label %do.body

do.end:                                           ; preds = %for.end
  %86 = load i64, i64* %arraydecay, align 16, !tbaa !2
  store i64 %86, i64* %arrayidx, align 8, !tbaa !2
  store i64 %and, i64* %arrayidx4, align 8, !tbaa !2
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %1) #3
  call void @llvm.lifetime.end.p0i8(i64 320, i8* nonnull %0) #3
  ret void
}

; Function Attrs: nounwind
define internal fastcc void @Skein_256_Process_Block(%struct.Skein_256_Ctxt_t* nocapture %ctx, i8* nocapture readonly %blkPtr, i32 %blkCnt, i32 %byteCntAdd) unnamed_addr #2 {
entry:
  %w = alloca [4 x i64], align 16
  %0 = bitcast [4 x i64]* %w to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %0) #3
  %arrayidx = getelementptr inbounds %struct.Skein_256_Ctxt_t, %struct.Skein_256_Ctxt_t* %ctx, i32 0, i32 0, i32 2, i32 0
  %1 = load i64, i64* %arrayidx, align 8, !tbaa !2
  %arrayidx4 = getelementptr inbounds %struct.Skein_256_Ctxt_t, %struct.Skein_256_Ctxt_t* %ctx, i32 0, i32 0, i32 2, i32 1
  %2 = load i64, i64* %arrayidx4, align 8, !tbaa !2
  %conv = zext i32 %byteCntAdd to i64
  %arrayidx11 = getelementptr inbounds %struct.Skein_256_Ctxt_t, %struct.Skein_256_Ctxt_t* %ctx, i32 0, i32 1, i32 0
  %arrayidx16 = getelementptr inbounds %struct.Skein_256_Ctxt_t, %struct.Skein_256_Ctxt_t* %ctx, i32 0, i32 1, i32 1
  %arrayidx21 = getelementptr inbounds %struct.Skein_256_Ctxt_t, %struct.Skein_256_Ctxt_t* %ctx, i32 0, i32 1, i32 2
  %arrayidx26 = getelementptr inbounds %struct.Skein_256_Ctxt_t, %struct.Skein_256_Ctxt_t* %ctx, i32 0, i32 1, i32 3
  %arraydecay58 = getelementptr inbounds [4 x i64], [4 x i64]* %w, i32 0, i32 0
  %arrayidx64 = getelementptr inbounds [4 x i64], [4 x i64]* %w, i32 0, i32 1
  %arrayidx73 = getelementptr inbounds [4 x i64], [4 x i64]* %w, i32 0, i32 2
  %arrayidx82 = getelementptr inbounds [4 x i64], [4 x i64]* %w, i32 0, i32 3
  %.pre = load i64, i64* %arrayidx11, align 8, !tbaa !2
  %.pre2380 = load i64, i64* %arrayidx16, align 8, !tbaa !2
  %.pre2381 = load i64, i64* %arrayidx21, align 8, !tbaa !2
  %.pre2382 = load i64, i64* %arrayidx26, align 8, !tbaa !2
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %3 = phi i64 [ %.pre2382, %entry ], [ %xor1286, %do.body ]
  %4 = phi i64 [ %.pre2381, %entry ], [ %xor1282, %do.body ]
  %5 = phi i64 [ %.pre2380, %entry ], [ %xor1278, %do.body ]
  %6 = phi i64 [ %.pre, %entry ], [ %xor1274, %do.body ]
  %kw.sroa.0.0 = phi i64 [ %1, %entry ], [ %add, %do.body ]
  %kw.sroa.20.0 = phi i64 [ %2, %entry ], [ %and, %do.body ]
  %blkCnt.addr.0 = phi i32 [ %blkCnt, %entry ], [ %dec, %do.body ]
  %blkPtr.addr.0 = phi i8* [ %blkPtr, %entry ], [ %add.ptr87, %do.body ]
  %xor = xor i64 %6, 2004413935125273122
  %xor39 = xor i64 %xor, %5
  %xor43 = xor i64 %xor39, %4
  %xor44 = xor i64 %xor43, %3
  %7 = load i8, i8* %blkPtr.addr.0, align 1, !tbaa !6
  %conv.i = zext i8 %7 to i64
  %arrayidx1.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 1
  %8 = load i8, i8* %arrayidx1.i, align 1, !tbaa !6
  %conv2.i = zext i8 %8 to i64
  %shl.i = shl nuw nsw i64 %conv2.i, 8
  %add3.i = or i64 %shl.i, %conv.i
  %arrayidx5.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 2
  %9 = load i8, i8* %arrayidx5.i, align 1, !tbaa !6
  %conv6.i = zext i8 %9 to i64
  %shl7.i = shl nuw nsw i64 %conv6.i, 16
  %add8.i = or i64 %add3.i, %shl7.i
  %arrayidx10.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 3
  %10 = load i8, i8* %arrayidx10.i, align 1, !tbaa !6
  %conv11.i = zext i8 %10 to i64
  %shl12.i = shl nuw nsw i64 %conv11.i, 24
  %add13.i = or i64 %add8.i, %shl12.i
  %arrayidx15.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 4
  %11 = load i8, i8* %arrayidx15.i, align 1, !tbaa !6
  %conv16.i = zext i8 %11 to i64
  %shl17.i = shl nuw nsw i64 %conv16.i, 32
  %add18.i = or i64 %add13.i, %shl17.i
  %arrayidx20.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 5
  %12 = load i8, i8* %arrayidx20.i, align 1, !tbaa !6
  %conv21.i = zext i8 %12 to i64
  %shl22.i = shl nuw nsw i64 %conv21.i, 40
  %add23.i = or i64 %add18.i, %shl22.i
  %arrayidx25.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 6
  %13 = load i8, i8* %arrayidx25.i, align 1, !tbaa !6
  %conv26.i = zext i8 %13 to i64
  %shl27.i = shl nuw nsw i64 %conv26.i, 48
  %add28.i = add i64 %add23.i, %shl27.i
  %arrayidx30.i = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 7
  %14 = load i8, i8* %arrayidx30.i, align 1, !tbaa !6
  %conv31.i = zext i8 %14 to i64
  %shl32.i = shl nuw i64 %conv31.i, 56
  %add33.i = add i64 %add28.i, %shl32.i
  store i64 %add33.i, i64* %arraydecay58, align 16, !tbaa !2
  %arrayidx.i.1 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 8
  %15 = load i8, i8* %arrayidx.i.1, align 1, !tbaa !6
  %conv.i.1 = zext i8 %15 to i64
  %arrayidx1.i.1 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 9
  %16 = load i8, i8* %arrayidx1.i.1, align 1, !tbaa !6
  %conv2.i.1 = zext i8 %16 to i64
  %shl.i.1 = shl nuw nsw i64 %conv2.i.1, 8
  %add3.i.1 = or i64 %shl.i.1, %conv.i.1
  %arrayidx5.i.1 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 10
  %17 = load i8, i8* %arrayidx5.i.1, align 1, !tbaa !6
  %conv6.i.1 = zext i8 %17 to i64
  %shl7.i.1 = shl nuw nsw i64 %conv6.i.1, 16
  %add8.i.1 = or i64 %add3.i.1, %shl7.i.1
  %arrayidx10.i.1 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 11
  %18 = load i8, i8* %arrayidx10.i.1, align 1, !tbaa !6
  %conv11.i.1 = zext i8 %18 to i64
  %shl12.i.1 = shl nuw nsw i64 %conv11.i.1, 24
  %add13.i.1 = or i64 %add8.i.1, %shl12.i.1
  %arrayidx15.i.1 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 12
  %19 = load i8, i8* %arrayidx15.i.1, align 1, !tbaa !6
  %conv16.i.1 = zext i8 %19 to i64
  %shl17.i.1 = shl nuw nsw i64 %conv16.i.1, 32
  %add18.i.1 = or i64 %add13.i.1, %shl17.i.1
  %arrayidx20.i.1 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 13
  %20 = load i8, i8* %arrayidx20.i.1, align 1, !tbaa !6
  %conv21.i.1 = zext i8 %20 to i64
  %shl22.i.1 = shl nuw nsw i64 %conv21.i.1, 40
  %add23.i.1 = or i64 %add18.i.1, %shl22.i.1
  %arrayidx25.i.1 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 14
  %21 = load i8, i8* %arrayidx25.i.1, align 1, !tbaa !6
  %conv26.i.1 = zext i8 %21 to i64
  %shl27.i.1 = shl nuw nsw i64 %conv26.i.1, 48
  %add28.i.1 = add i64 %add23.i.1, %shl27.i.1
  %arrayidx30.i.1 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 15
  %22 = load i8, i8* %arrayidx30.i.1, align 1, !tbaa !6
  %conv31.i.1 = zext i8 %22 to i64
  %shl32.i.1 = shl nuw i64 %conv31.i.1, 56
  %add33.i.1 = add i64 %add28.i.1, %shl32.i.1
  store i64 %add33.i.1, i64* %arrayidx64, align 8, !tbaa !2
  %arrayidx.i.2 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 16
  %23 = load i8, i8* %arrayidx.i.2, align 1, !tbaa !6
  %conv.i.2 = zext i8 %23 to i64
  %arrayidx1.i.2 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 17
  %24 = load i8, i8* %arrayidx1.i.2, align 1, !tbaa !6
  %conv2.i.2 = zext i8 %24 to i64
  %shl.i.2 = shl nuw nsw i64 %conv2.i.2, 8
  %add3.i.2 = or i64 %shl.i.2, %conv.i.2
  %arrayidx5.i.2 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 18
  %25 = load i8, i8* %arrayidx5.i.2, align 1, !tbaa !6
  %conv6.i.2 = zext i8 %25 to i64
  %shl7.i.2 = shl nuw nsw i64 %conv6.i.2, 16
  %add8.i.2 = or i64 %add3.i.2, %shl7.i.2
  %arrayidx10.i.2 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 19
  %26 = load i8, i8* %arrayidx10.i.2, align 1, !tbaa !6
  %conv11.i.2 = zext i8 %26 to i64
  %shl12.i.2 = shl nuw nsw i64 %conv11.i.2, 24
  %add13.i.2 = or i64 %add8.i.2, %shl12.i.2
  %arrayidx15.i.2 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 20
  %27 = load i8, i8* %arrayidx15.i.2, align 1, !tbaa !6
  %conv16.i.2 = zext i8 %27 to i64
  %shl17.i.2 = shl nuw nsw i64 %conv16.i.2, 32
  %add18.i.2 = or i64 %add13.i.2, %shl17.i.2
  %arrayidx20.i.2 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 21
  %28 = load i8, i8* %arrayidx20.i.2, align 1, !tbaa !6
  %conv21.i.2 = zext i8 %28 to i64
  %shl22.i.2 = shl nuw nsw i64 %conv21.i.2, 40
  %add23.i.2 = or i64 %add18.i.2, %shl22.i.2
  %arrayidx25.i.2 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 22
  %29 = load i8, i8* %arrayidx25.i.2, align 1, !tbaa !6
  %conv26.i.2 = zext i8 %29 to i64
  %shl27.i.2 = shl nuw nsw i64 %conv26.i.2, 48
  %add28.i.2 = add i64 %add23.i.2, %shl27.i.2
  %arrayidx30.i.2 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 23
  %30 = load i8, i8* %arrayidx30.i.2, align 1, !tbaa !6
  %conv31.i.2 = zext i8 %30 to i64
  %shl32.i.2 = shl nuw i64 %conv31.i.2, 56
  %add33.i.2 = add i64 %add28.i.2, %shl32.i.2
  store i64 %add33.i.2, i64* %arrayidx73, align 16, !tbaa !2
  %arrayidx.i.3 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 24
  %31 = load i8, i8* %arrayidx.i.3, align 1, !tbaa !6
  %conv.i.3 = zext i8 %31 to i64
  %arrayidx1.i.3 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 25
  %32 = load i8, i8* %arrayidx1.i.3, align 1, !tbaa !6
  %conv2.i.3 = zext i8 %32 to i64
  %shl.i.3 = shl nuw nsw i64 %conv2.i.3, 8
  %add3.i.3 = or i64 %shl.i.3, %conv.i.3
  %arrayidx5.i.3 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 26
  %33 = load i8, i8* %arrayidx5.i.3, align 1, !tbaa !6
  %conv6.i.3 = zext i8 %33 to i64
  %shl7.i.3 = shl nuw nsw i64 %conv6.i.3, 16
  %add8.i.3 = or i64 %add3.i.3, %shl7.i.3
  %arrayidx10.i.3 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 27
  %34 = load i8, i8* %arrayidx10.i.3, align 1, !tbaa !6
  %conv11.i.3 = zext i8 %34 to i64
  %shl12.i.3 = shl nuw nsw i64 %conv11.i.3, 24
  %add13.i.3 = or i64 %add8.i.3, %shl12.i.3
  %arrayidx15.i.3 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 28
  %35 = load i8, i8* %arrayidx15.i.3, align 1, !tbaa !6
  %conv16.i.3 = zext i8 %35 to i64
  %shl17.i.3 = shl nuw nsw i64 %conv16.i.3, 32
  %add18.i.3 = or i64 %add13.i.3, %shl17.i.3
  %arrayidx20.i.3 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 29
  %36 = load i8, i8* %arrayidx20.i.3, align 1, !tbaa !6
  %conv21.i.3 = zext i8 %36 to i64
  %shl22.i.3 = shl nuw nsw i64 %conv21.i.3, 40
  %add23.i.3 = or i64 %add18.i.3, %shl22.i.3
  %arrayidx25.i.3 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 30
  %37 = load i8, i8* %arrayidx25.i.3, align 1, !tbaa !6
  %conv26.i.3 = zext i8 %37 to i64
  %shl27.i.3 = shl nuw nsw i64 %conv26.i.3, 48
  %add28.i.3 = add i64 %add23.i.3, %shl27.i.3
  %arrayidx30.i.3 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 31
  %38 = load i8, i8* %arrayidx30.i.3, align 1, !tbaa !6
  %conv31.i.3 = zext i8 %38 to i64
  %shl32.i.3 = shl nuw i64 %conv31.i.3, 56
  %add33.i.3 = add i64 %add28.i.3, %shl32.i.3
  store i64 %add33.i.3, i64* %arrayidx82, align 8, !tbaa !2
  %add = add i64 %kw.sroa.0.0, %conv
  %xor54 = xor i64 %add, %kw.sroa.20.0
  %39 = load i64, i64* %arraydecay58, align 16, !tbaa !2
  %add63 = add i64 %39, %6
  %add68 = add i64 %5, %add
  %add72 = add i64 %add68, %add33.i.1
  %add86 = add i64 %add33.i.3, %3
  %add.ptr87 = getelementptr inbounds i8, i8* %blkPtr.addr.0, i32 32
  %add88 = add i64 %add63, %add72
  %shl = shl i64 %add72, 14
  %shr = lshr i64 %add72, 50
  %or = or i64 %shl, %shr
  %xor89 = xor i64 %or, %add88
  %add77 = add i64 %4, %kw.sroa.20.0
  %add81 = add i64 %add77, %add33.i.2
  %add90 = add i64 %add81, %add86
  %shl91 = shl i64 %add86, 16
  %shr92 = lshr i64 %add86, 48
  %or93 = or i64 %shl91, %shr92
  %xor94 = xor i64 %or93, %add90
  %add95 = add i64 %xor94, %add88
  %shl96 = shl i64 %xor94, 52
  %shr97 = lshr i64 %xor94, 12
  %or98 = or i64 %shl96, %shr97
  %xor99 = xor i64 %or98, %add95
  %add100 = add i64 %xor89, %add90
  %shl101 = shl i64 %xor89, 57
  %shr102 = lshr i64 %xor89, 7
  %or103 = or i64 %shl101, %shr102
  %xor104 = xor i64 %or103, %add100
  %add105 = add i64 %xor104, %add95
  %shl106 = shl i64 %xor104, 23
  %shr107 = lshr i64 %xor104, 41
  %or108 = or i64 %shl106, %shr107
  %xor109 = xor i64 %or108, %add105
  %add110 = add i64 %xor99, %add100
  %shl111 = shl i64 %xor99, 40
  %shr112 = lshr i64 %xor99, 24
  %or113 = or i64 %shl111, %shr112
  %xor114 = xor i64 %or113, %add110
  %add115 = add i64 %xor114, %add105
  %shl116 = shl i64 %xor114, 5
  %shr117 = lshr i64 %xor114, 59
  %or118 = or i64 %shl116, %shr117
  %xor119 = xor i64 %or118, %add115
  %add120 = add i64 %xor109, %add110
  %shl121 = shl i64 %xor109, 37
  %shr122 = lshr i64 %xor109, 27
  %or123 = or i64 %shl121, %shr122
  %xor124 = xor i64 %or123, %add120
  %add128 = add i64 %add115, %5
  %add136 = add i64 %xor124, %add77
  %add143 = add i64 %3, %xor54
  %add144 = add i64 %add120, %add143
  %add149 = add i64 %xor44, 1
  %add150 = add i64 %add149, %xor119
  %add151 = add i64 %add128, %add136
  %shl152 = shl i64 %add136, 25
  %shr153 = lshr i64 %add136, 39
  %or154 = or i64 %shl152, %shr153
  %xor155 = xor i64 %or154, %add151
  %add156 = add i64 %add144, %add150
  %shl157 = shl i64 %add150, 33
  %shr158 = lshr i64 %add150, 31
  %or159 = or i64 %shl157, %shr158
  %xor160 = xor i64 %or159, %add156
  %add161 = add i64 %xor160, %add151
  %shl162 = shl i64 %xor160, 46
  %shr163 = lshr i64 %xor160, 18
  %or164 = or i64 %shl162, %shr163
  %xor165 = xor i64 %or164, %add161
  %add166 = add i64 %xor155, %add156
  %shl167 = shl i64 %xor155, 12
  %shr168 = lshr i64 %xor155, 52
  %or169 = or i64 %shl167, %shr168
  %xor170 = xor i64 %or169, %add166
  %add171 = add i64 %xor170, %add161
  %shl172 = shl i64 %xor170, 58
  %shr173 = lshr i64 %xor170, 6
  %or174 = or i64 %shl172, %shr173
  %xor175 = xor i64 %or174, %add171
  %add176 = add i64 %xor165, %add166
  %shl177 = shl i64 %xor165, 22
  %shr178 = lshr i64 %xor165, 42
  %or179 = or i64 %shl177, %shr178
  %xor180 = xor i64 %or179, %add176
  %add181 = add i64 %xor180, %add171
  %shl182 = shl i64 %xor180, 32
  %shr183 = lshr i64 %xor180, 32
  %or184 = or i64 %shl182, %shr183
  %xor185 = xor i64 %or184, %add181
  %add186 = add i64 %xor175, %add176
  %shl187 = shl i64 %xor175, 32
  %shr188 = lshr i64 %xor175, 32
  %or189 = or i64 %shl187, %shr188
  %xor190 = xor i64 %or189, %add186
  %add194 = add i64 %add181, %4
  %add202 = add i64 %xor190, %add143
  %add209 = add i64 %xor44, %add
  %add210 = add i64 %add186, %add209
  %add215 = add i64 %6, 2
  %add216 = add i64 %add215, %xor185
  %add217 = add i64 %add194, %add202
  %shl218 = shl i64 %add202, 14
  %shr219 = lshr i64 %add202, 50
  %or220 = or i64 %shl218, %shr219
  %xor221 = xor i64 %or220, %add217
  %add222 = add i64 %add210, %add216
  %shl223 = shl i64 %add216, 16
  %shr224 = lshr i64 %add216, 48
  %or225 = or i64 %shl223, %shr224
  %xor226 = xor i64 %or225, %add222
  %add227 = add i64 %xor226, %add217
  %shl228 = shl i64 %xor226, 52
  %shr229 = lshr i64 %xor226, 12
  %or230 = or i64 %shl228, %shr229
  %xor231 = xor i64 %or230, %add227
  %add232 = add i64 %xor221, %add222
  %shl233 = shl i64 %xor221, 57
  %shr234 = lshr i64 %xor221, 7
  %or235 = or i64 %shl233, %shr234
  %xor236 = xor i64 %or235, %add232
  %add237 = add i64 %xor236, %add227
  %shl238 = shl i64 %xor236, 23
  %shr239 = lshr i64 %xor236, 41
  %or240 = or i64 %shl238, %shr239
  %xor241 = xor i64 %or240, %add237
  %add242 = add i64 %xor231, %add232
  %shl243 = shl i64 %xor231, 40
  %shr244 = lshr i64 %xor231, 24
  %or245 = or i64 %shl243, %shr244
  %xor246 = xor i64 %or245, %add242
  %add247 = add i64 %xor246, %add237
  %shl248 = shl i64 %xor246, 5
  %shr249 = lshr i64 %xor246, 59
  %or250 = or i64 %shl248, %shr249
  %xor251 = xor i64 %or250, %add247
  %add252 = add i64 %xor241, %add242
  %shl253 = shl i64 %xor241, 37
  %shr254 = lshr i64 %xor241, 27
  %or255 = or i64 %shl253, %shr254
  %xor256 = xor i64 %or255, %add252
  %add260 = add i64 %add247, %3
  %add268 = add i64 %xor256, %add209
  %add275 = add i64 %6, %kw.sroa.20.0
  %add276 = add i64 %add252, %add275
  %add281 = add i64 %5, 3
  %add282 = add i64 %add281, %xor251
  %add283 = add i64 %add260, %add268
  %shl284 = shl i64 %add268, 25
  %shr285 = lshr i64 %add268, 39
  %or286 = or i64 %shl284, %shr285
  %xor287 = xor i64 %or286, %add283
  %add288 = add i64 %add276, %add282
  %shl289 = shl i64 %add282, 33
  %shr290 = lshr i64 %add282, 31
  %or291 = or i64 %shl289, %shr290
  %xor292 = xor i64 %or291, %add288
  %add293 = add i64 %xor292, %add283
  %shl294 = shl i64 %xor292, 46
  %shr295 = lshr i64 %xor292, 18
  %or296 = or i64 %shl294, %shr295
  %xor297 = xor i64 %or296, %add293
  %add298 = add i64 %xor287, %add288
  %shl299 = shl i64 %xor287, 12
  %shr300 = lshr i64 %xor287, 52
  %or301 = or i64 %shl299, %shr300
  %xor302 = xor i64 %or301, %add298
  %add303 = add i64 %xor302, %add293
  %shl304 = shl i64 %xor302, 58
  %shr305 = lshr i64 %xor302, 6
  %or306 = or i64 %shl304, %shr305
  %xor307 = xor i64 %or306, %add303
  %add308 = add i64 %xor297, %add298
  %shl309 = shl i64 %xor297, 22
  %shr310 = lshr i64 %xor297, 42
  %or311 = or i64 %shl309, %shr310
  %xor312 = xor i64 %or311, %add308
  %add313 = add i64 %xor312, %add303
  %shl314 = shl i64 %xor312, 32
  %shr315 = lshr i64 %xor312, 32
  %or316 = or i64 %shl314, %shr315
  %xor317 = xor i64 %or316, %add313
  %add318 = add i64 %xor307, %add308
  %shl319 = shl i64 %xor307, 32
  %shr320 = lshr i64 %xor307, 32
  %or321 = or i64 %shl319, %shr320
  %xor322 = xor i64 %or321, %add318
  %add326 = add i64 %add313, %xor44
  %add334 = add i64 %xor322, %add275
  %add341 = add i64 %5, %xor54
  %add342 = add i64 %add318, %add341
  %add347 = add i64 %4, 4
  %add348 = add i64 %add347, %xor317
  %add349 = add i64 %add326, %add334
  %shl350 = shl i64 %add334, 14
  %shr351 = lshr i64 %add334, 50
  %or352 = or i64 %shl350, %shr351
  %xor353 = xor i64 %or352, %add349
  %add354 = add i64 %add342, %add348
  %shl355 = shl i64 %add348, 16
  %shr356 = lshr i64 %add348, 48
  %or357 = or i64 %shl355, %shr356
  %xor358 = xor i64 %or357, %add354
  %add359 = add i64 %xor358, %add349
  %shl360 = shl i64 %xor358, 52
  %shr361 = lshr i64 %xor358, 12
  %or362 = or i64 %shl360, %shr361
  %xor363 = xor i64 %or362, %add359
  %add364 = add i64 %xor353, %add354
  %shl365 = shl i64 %xor353, 57
  %shr366 = lshr i64 %xor353, 7
  %or367 = or i64 %shl365, %shr366
  %xor368 = xor i64 %or367, %add364
  %add369 = add i64 %xor368, %add359
  %shl370 = shl i64 %xor368, 23
  %shr371 = lshr i64 %xor368, 41
  %or372 = or i64 %shl370, %shr371
  %xor373 = xor i64 %or372, %add369
  %add374 = add i64 %xor363, %add364
  %shl375 = shl i64 %xor363, 40
  %shr376 = lshr i64 %xor363, 24
  %or377 = or i64 %shl375, %shr376
  %xor378 = xor i64 %or377, %add374
  %add379 = add i64 %xor378, %add369
  %shl380 = shl i64 %xor378, 5
  %shr381 = lshr i64 %xor378, 59
  %or382 = or i64 %shl380, %shr381
  %xor383 = xor i64 %or382, %add379
  %add384 = add i64 %xor373, %add374
  %shl385 = shl i64 %xor373, 37
  %shr386 = lshr i64 %xor373, 27
  %or387 = or i64 %shl385, %shr386
  %xor388 = xor i64 %or387, %add384
  %add392 = add i64 %add379, %6
  %add400 = add i64 %xor388, %add341
  %add407 = add i64 %4, %add
  %add408 = add i64 %add384, %add407
  %add413 = add i64 %3, 5
  %add414 = add i64 %add413, %xor383
  %add415 = add i64 %add392, %add400
  %shl416 = shl i64 %add400, 25
  %shr417 = lshr i64 %add400, 39
  %or418 = or i64 %shl416, %shr417
  %xor419 = xor i64 %or418, %add415
  %add420 = add i64 %add408, %add414
  %shl421 = shl i64 %add414, 33
  %shr422 = lshr i64 %add414, 31
  %or423 = or i64 %shl421, %shr422
  %xor424 = xor i64 %or423, %add420
  %add425 = add i64 %xor424, %add415
  %shl426 = shl i64 %xor424, 46
  %shr427 = lshr i64 %xor424, 18
  %or428 = or i64 %shl426, %shr427
  %xor429 = xor i64 %or428, %add425
  %add430 = add i64 %xor419, %add420
  %shl431 = shl i64 %xor419, 12
  %shr432 = lshr i64 %xor419, 52
  %or433 = or i64 %shl431, %shr432
  %xor434 = xor i64 %or433, %add430
  %add435 = add i64 %xor434, %add425
  %shl436 = shl i64 %xor434, 58
  %shr437 = lshr i64 %xor434, 6
  %or438 = or i64 %shl436, %shr437
  %xor439 = xor i64 %or438, %add435
  %add440 = add i64 %xor429, %add430
  %shl441 = shl i64 %xor429, 22
  %shr442 = lshr i64 %xor429, 42
  %or443 = or i64 %shl441, %shr442
  %xor444 = xor i64 %or443, %add440
  %add445 = add i64 %xor444, %add435
  %shl446 = shl i64 %xor444, 32
  %shr447 = lshr i64 %xor444, 32
  %or448 = or i64 %shl446, %shr447
  %xor449 = xor i64 %or448, %add445
  %add450 = add i64 %xor439, %add440
  %shl451 = shl i64 %xor439, 32
  %shr452 = lshr i64 %xor439, 32
  %or453 = or i64 %shl451, %shr452
  %xor454 = xor i64 %or453, %add450
  %add458 = add i64 %add445, %5
  %add466 = add i64 %xor454, %add407
  %add473 = add i64 %3, %kw.sroa.20.0
  %add474 = add i64 %add450, %add473
  %add479 = add i64 %xor44, 6
  %add480 = add i64 %add479, %xor449
  %add481 = add i64 %add458, %add466
  %shl482 = shl i64 %add466, 14
  %shr483 = lshr i64 %add466, 50
  %or484 = or i64 %shl482, %shr483
  %xor485 = xor i64 %or484, %add481
  %add486 = add i64 %add474, %add480
  %shl487 = shl i64 %add480, 16
  %shr488 = lshr i64 %add480, 48
  %or489 = or i64 %shl487, %shr488
  %xor490 = xor i64 %or489, %add486
  %add491 = add i64 %xor490, %add481
  %shl492 = shl i64 %xor490, 52
  %shr493 = lshr i64 %xor490, 12
  %or494 = or i64 %shl492, %shr493
  %xor495 = xor i64 %or494, %add491
  %add496 = add i64 %xor485, %add486
  %shl497 = shl i64 %xor485, 57
  %shr498 = lshr i64 %xor485, 7
  %or499 = or i64 %shl497, %shr498
  %xor500 = xor i64 %or499, %add496
  %add501 = add i64 %xor500, %add491
  %shl502 = shl i64 %xor500, 23
  %shr503 = lshr i64 %xor500, 41
  %or504 = or i64 %shl502, %shr503
  %xor505 = xor i64 %or504, %add501
  %add506 = add i64 %xor495, %add496
  %shl507 = shl i64 %xor495, 40
  %shr508 = lshr i64 %xor495, 24
  %or509 = or i64 %shl507, %shr508
  %xor510 = xor i64 %or509, %add506
  %add511 = add i64 %xor510, %add501
  %shl512 = shl i64 %xor510, 5
  %shr513 = lshr i64 %xor510, 59
  %or514 = or i64 %shl512, %shr513
  %xor515 = xor i64 %or514, %add511
  %add516 = add i64 %xor505, %add506
  %shl517 = shl i64 %xor505, 37
  %shr518 = lshr i64 %xor505, 27
  %or519 = or i64 %shl517, %shr518
  %xor520 = xor i64 %or519, %add516
  %add524 = add i64 %add511, %4
  %add532 = add i64 %xor520, %add473
  %add539 = add i64 %xor44, %xor54
  %add540 = add i64 %add516, %add539
  %add545 = add i64 %6, 7
  %add546 = add i64 %add545, %xor515
  %add547 = add i64 %add524, %add532
  %shl548 = shl i64 %add532, 25
  %shr549 = lshr i64 %add532, 39
  %or550 = or i64 %shl548, %shr549
  %xor551 = xor i64 %or550, %add547
  %add552 = add i64 %add540, %add546
  %shl553 = shl i64 %add546, 33
  %shr554 = lshr i64 %add546, 31
  %or555 = or i64 %shl553, %shr554
  %xor556 = xor i64 %or555, %add552
  %add557 = add i64 %xor556, %add547
  %shl558 = shl i64 %xor556, 46
  %shr559 = lshr i64 %xor556, 18
  %or560 = or i64 %shl558, %shr559
  %xor561 = xor i64 %or560, %add557
  %add562 = add i64 %xor551, %add552
  %shl563 = shl i64 %xor551, 12
  %shr564 = lshr i64 %xor551, 52
  %or565 = or i64 %shl563, %shr564
  %xor566 = xor i64 %or565, %add562
  %add567 = add i64 %xor566, %add557
  %shl568 = shl i64 %xor566, 58
  %shr569 = lshr i64 %xor566, 6
  %or570 = or i64 %shl568, %shr569
  %xor571 = xor i64 %or570, %add567
  %add572 = add i64 %xor561, %add562
  %shl573 = shl i64 %xor561, 22
  %shr574 = lshr i64 %xor561, 42
  %or575 = or i64 %shl573, %shr574
  %xor576 = xor i64 %or575, %add572
  %add577 = add i64 %xor576, %add567
  %shl578 = shl i64 %xor576, 32
  %shr579 = lshr i64 %xor576, 32
  %or580 = or i64 %shl578, %shr579
  %xor581 = xor i64 %or580, %add577
  %add582 = add i64 %xor571, %add572
  %shl583 = shl i64 %xor571, 32
  %shr584 = lshr i64 %xor571, 32
  %or585 = or i64 %shl583, %shr584
  %xor586 = xor i64 %or585, %add582
  %add590 = add i64 %add577, %3
  %add598 = add i64 %xor586, %add539
  %add605 = add i64 %6, %add
  %add606 = add i64 %add582, %add605
  %add611 = add i64 %5, 8
  %add612 = add i64 %add611, %xor581
  %add613 = add i64 %add590, %add598
  %shl614 = shl i64 %add598, 14
  %shr615 = lshr i64 %add598, 50
  %or616 = or i64 %shl614, %shr615
  %xor617 = xor i64 %or616, %add613
  %add618 = add i64 %add606, %add612
  %shl619 = shl i64 %add612, 16
  %shr620 = lshr i64 %add612, 48
  %or621 = or i64 %shl619, %shr620
  %xor622 = xor i64 %or621, %add618
  %add623 = add i64 %xor622, %add613
  %shl624 = shl i64 %xor622, 52
  %shr625 = lshr i64 %xor622, 12
  %or626 = or i64 %shl624, %shr625
  %xor627 = xor i64 %or626, %add623
  %add628 = add i64 %xor617, %add618
  %shl629 = shl i64 %xor617, 57
  %shr630 = lshr i64 %xor617, 7
  %or631 = or i64 %shl629, %shr630
  %xor632 = xor i64 %or631, %add628
  %add633 = add i64 %xor632, %add623
  %shl634 = shl i64 %xor632, 23
  %shr635 = lshr i64 %xor632, 41
  %or636 = or i64 %shl634, %shr635
  %xor637 = xor i64 %or636, %add633
  %add638 = add i64 %xor627, %add628
  %shl639 = shl i64 %xor627, 40
  %shr640 = lshr i64 %xor627, 24
  %or641 = or i64 %shl639, %shr640
  %xor642 = xor i64 %or641, %add638
  %add643 = add i64 %xor642, %add633
  %shl644 = shl i64 %xor642, 5
  %shr645 = lshr i64 %xor642, 59
  %or646 = or i64 %shl644, %shr645
  %xor647 = xor i64 %or646, %add643
  %add648 = add i64 %xor637, %add638
  %shl649 = shl i64 %xor637, 37
  %shr650 = lshr i64 %xor637, 27
  %or651 = or i64 %shl649, %shr650
  %xor652 = xor i64 %or651, %add648
  %add656 = add i64 %add643, %xor44
  %add664 = add i64 %xor652, %add605
  %add671 = add i64 %5, %kw.sroa.20.0
  %add672 = add i64 %add648, %add671
  %add677 = add i64 %4, 9
  %add678 = add i64 %add677, %xor647
  %add679 = add i64 %add656, %add664
  %shl680 = shl i64 %add664, 25
  %shr681 = lshr i64 %add664, 39
  %or682 = or i64 %shl680, %shr681
  %xor683 = xor i64 %or682, %add679
  %add684 = add i64 %add672, %add678
  %shl685 = shl i64 %add678, 33
  %shr686 = lshr i64 %add678, 31
  %or687 = or i64 %shl685, %shr686
  %xor688 = xor i64 %or687, %add684
  %add689 = add i64 %xor688, %add679
  %shl690 = shl i64 %xor688, 46
  %shr691 = lshr i64 %xor688, 18
  %or692 = or i64 %shl690, %shr691
  %xor693 = xor i64 %or692, %add689
  %add694 = add i64 %xor683, %add684
  %shl695 = shl i64 %xor683, 12
  %shr696 = lshr i64 %xor683, 52
  %or697 = or i64 %shl695, %shr696
  %xor698 = xor i64 %or697, %add694
  %add699 = add i64 %xor698, %add689
  %shl700 = shl i64 %xor698, 58
  %shr701 = lshr i64 %xor698, 6
  %or702 = or i64 %shl700, %shr701
  %xor703 = xor i64 %or702, %add699
  %add704 = add i64 %xor693, %add694
  %shl705 = shl i64 %xor693, 22
  %shr706 = lshr i64 %xor693, 42
  %or707 = or i64 %shl705, %shr706
  %xor708 = xor i64 %or707, %add704
  %add709 = add i64 %xor708, %add699
  %shl710 = shl i64 %xor708, 32
  %shr711 = lshr i64 %xor708, 32
  %or712 = or i64 %shl710, %shr711
  %xor713 = xor i64 %or712, %add709
  %add714 = add i64 %xor703, %add704
  %shl715 = shl i64 %xor703, 32
  %shr716 = lshr i64 %xor703, 32
  %or717 = or i64 %shl715, %shr716
  %xor718 = xor i64 %or717, %add714
  %add722 = add i64 %add709, %6
  %add730 = add i64 %xor718, %add671
  %add737 = add i64 %4, %xor54
  %add738 = add i64 %add714, %add737
  %add743 = add i64 %3, 10
  %add744 = add i64 %add743, %xor713
  %add745 = add i64 %add722, %add730
  %shl746 = shl i64 %add730, 14
  %shr747 = lshr i64 %add730, 50
  %or748 = or i64 %shl746, %shr747
  %xor749 = xor i64 %or748, %add745
  %add750 = add i64 %add738, %add744
  %shl751 = shl i64 %add744, 16
  %shr752 = lshr i64 %add744, 48
  %or753 = or i64 %shl751, %shr752
  %xor754 = xor i64 %or753, %add750
  %add755 = add i64 %xor754, %add745
  %shl756 = shl i64 %xor754, 52
  %shr757 = lshr i64 %xor754, 12
  %or758 = or i64 %shl756, %shr757
  %xor759 = xor i64 %or758, %add755
  %add760 = add i64 %xor749, %add750
  %shl761 = shl i64 %xor749, 57
  %shr762 = lshr i64 %xor749, 7
  %or763 = or i64 %shl761, %shr762
  %xor764 = xor i64 %or763, %add760
  %add765 = add i64 %xor764, %add755
  %shl766 = shl i64 %xor764, 23
  %shr767 = lshr i64 %xor764, 41
  %or768 = or i64 %shl766, %shr767
  %xor769 = xor i64 %or768, %add765
  %add770 = add i64 %xor759, %add760
  %shl771 = shl i64 %xor759, 40
  %shr772 = lshr i64 %xor759, 24
  %or773 = or i64 %shl771, %shr772
  %xor774 = xor i64 %or773, %add770
  %add775 = add i64 %xor774, %add765
  %shl776 = shl i64 %xor774, 5
  %shr777 = lshr i64 %xor774, 59
  %or778 = or i64 %shl776, %shr777
  %xor779 = xor i64 %or778, %add775
  %add780 = add i64 %xor769, %add770
  %shl781 = shl i64 %xor769, 37
  %shr782 = lshr i64 %xor769, 27
  %or783 = or i64 %shl781, %shr782
  %xor784 = xor i64 %or783, %add780
  %add788 = add i64 %add775, %5
  %add796 = add i64 %xor784, %add737
  %add803 = add i64 %3, %add
  %add804 = add i64 %add780, %add803
  %add809 = add i64 %xor44, 11
  %add810 = add i64 %add809, %xor779
  %add811 = add i64 %add788, %add796
  %shl812 = shl i64 %add796, 25
  %shr813 = lshr i64 %add796, 39
  %or814 = or i64 %shl812, %shr813
  %xor815 = xor i64 %or814, %add811
  %add816 = add i64 %add804, %add810
  %shl817 = shl i64 %add810, 33
  %shr818 = lshr i64 %add810, 31
  %or819 = or i64 %shl817, %shr818
  %xor820 = xor i64 %or819, %add816
  %add821 = add i64 %xor820, %add811
  %shl822 = shl i64 %xor820, 46
  %shr823 = lshr i64 %xor820, 18
  %or824 = or i64 %shl822, %shr823
  %xor825 = xor i64 %or824, %add821
  %add826 = add i64 %xor815, %add816
  %shl827 = shl i64 %xor815, 12
  %shr828 = lshr i64 %xor815, 52
  %or829 = or i64 %shl827, %shr828
  %xor830 = xor i64 %or829, %add826
  %add831 = add i64 %xor830, %add821
  %shl832 = shl i64 %xor830, 58
  %shr833 = lshr i64 %xor830, 6
  %or834 = or i64 %shl832, %shr833
  %xor835 = xor i64 %or834, %add831
  %add836 = add i64 %xor825, %add826
  %shl837 = shl i64 %xor825, 22
  %shr838 = lshr i64 %xor825, 42
  %or839 = or i64 %shl837, %shr838
  %xor840 = xor i64 %or839, %add836
  %add841 = add i64 %xor840, %add831
  %shl842 = shl i64 %xor840, 32
  %shr843 = lshr i64 %xor840, 32
  %or844 = or i64 %shl842, %shr843
  %xor845 = xor i64 %or844, %add841
  %add846 = add i64 %xor835, %add836
  %shl847 = shl i64 %xor835, 32
  %shr848 = lshr i64 %xor835, 32
  %or849 = or i64 %shl847, %shr848
  %xor850 = xor i64 %or849, %add846
  %add854 = add i64 %add841, %4
  %add862 = add i64 %xor850, %add803
  %add869 = add i64 %xor44, %kw.sroa.20.0
  %add870 = add i64 %add846, %add869
  %add875 = add i64 %6, 12
  %add876 = add i64 %add875, %xor845
  %add877 = add i64 %add854, %add862
  %shl878 = shl i64 %add862, 14
  %shr879 = lshr i64 %add862, 50
  %or880 = or i64 %shl878, %shr879
  %xor881 = xor i64 %or880, %add877
  %add882 = add i64 %add870, %add876
  %shl883 = shl i64 %add876, 16
  %shr884 = lshr i64 %add876, 48
  %or885 = or i64 %shl883, %shr884
  %xor886 = xor i64 %or885, %add882
  %add887 = add i64 %xor886, %add877
  %shl888 = shl i64 %xor886, 52
  %shr889 = lshr i64 %xor886, 12
  %or890 = or i64 %shl888, %shr889
  %xor891 = xor i64 %or890, %add887
  %add892 = add i64 %xor881, %add882
  %shl893 = shl i64 %xor881, 57
  %shr894 = lshr i64 %xor881, 7
  %or895 = or i64 %shl893, %shr894
  %xor896 = xor i64 %or895, %add892
  %add897 = add i64 %xor896, %add887
  %shl898 = shl i64 %xor896, 23
  %shr899 = lshr i64 %xor896, 41
  %or900 = or i64 %shl898, %shr899
  %xor901 = xor i64 %or900, %add897
  %add902 = add i64 %xor891, %add892
  %shl903 = shl i64 %xor891, 40
  %shr904 = lshr i64 %xor891, 24
  %or905 = or i64 %shl903, %shr904
  %xor906 = xor i64 %or905, %add902
  %add907 = add i64 %xor906, %add897
  %shl908 = shl i64 %xor906, 5
  %shr909 = lshr i64 %xor906, 59
  %or910 = or i64 %shl908, %shr909
  %xor911 = xor i64 %or910, %add907
  %add912 = add i64 %xor901, %add902
  %shl913 = shl i64 %xor901, 37
  %shr914 = lshr i64 %xor901, 27
  %or915 = or i64 %shl913, %shr914
  %xor916 = xor i64 %or915, %add912
  %add920 = add i64 %add907, %3
  %add928 = add i64 %xor916, %add869
  %add935 = add i64 %6, %xor54
  %add936 = add i64 %add912, %add935
  %add941 = add i64 %5, 13
  %add942 = add i64 %add941, %xor911
  %add943 = add i64 %add920, %add928
  %shl944 = shl i64 %add928, 25
  %shr945 = lshr i64 %add928, 39
  %or946 = or i64 %shl944, %shr945
  %xor947 = xor i64 %or946, %add943
  %add948 = add i64 %add936, %add942
  %shl949 = shl i64 %add942, 33
  %shr950 = lshr i64 %add942, 31
  %or951 = or i64 %shl949, %shr950
  %xor952 = xor i64 %or951, %add948
  %add953 = add i64 %xor952, %add943
  %shl954 = shl i64 %xor952, 46
  %shr955 = lshr i64 %xor952, 18
  %or956 = or i64 %shl954, %shr955
  %xor957 = xor i64 %or956, %add953
  %add958 = add i64 %xor947, %add948
  %shl959 = shl i64 %xor947, 12
  %shr960 = lshr i64 %xor947, 52
  %or961 = or i64 %shl959, %shr960
  %xor962 = xor i64 %or961, %add958
  %add963 = add i64 %xor962, %add953
  %shl964 = shl i64 %xor962, 58
  %shr965 = lshr i64 %xor962, 6
  %or966 = or i64 %shl964, %shr965
  %xor967 = xor i64 %or966, %add963
  %add968 = add i64 %xor957, %add958
  %shl969 = shl i64 %xor957, 22
  %shr970 = lshr i64 %xor957, 42
  %or971 = or i64 %shl969, %shr970
  %xor972 = xor i64 %or971, %add968
  %add973 = add i64 %xor972, %add963
  %shl974 = shl i64 %xor972, 32
  %shr975 = lshr i64 %xor972, 32
  %or976 = or i64 %shl974, %shr975
  %xor977 = xor i64 %or976, %add973
  %add978 = add i64 %xor967, %add968
  %shl979 = shl i64 %xor967, 32
  %shr980 = lshr i64 %xor967, 32
  %or981 = or i64 %shl979, %shr980
  %xor982 = xor i64 %or981, %add978
  %add986 = add i64 %add973, %xor44
  %add994 = add i64 %xor982, %add935
  %add1002 = add i64 %add978, %add68
  %add1007 = add i64 %4, 14
  %add1008 = add i64 %add1007, %xor977
  %add1009 = add i64 %add986, %add994
  %shl1010 = shl i64 %add994, 14
  %shr1011 = lshr i64 %add994, 50
  %or1012 = or i64 %shl1010, %shr1011
  %xor1013 = xor i64 %or1012, %add1009
  %add1014 = add i64 %add1002, %add1008
  %shl1015 = shl i64 %add1008, 16
  %shr1016 = lshr i64 %add1008, 48
  %or1017 = or i64 %shl1015, %shr1016
  %xor1018 = xor i64 %or1017, %add1014
  %add1019 = add i64 %xor1018, %add1009
  %shl1020 = shl i64 %xor1018, 52
  %shr1021 = lshr i64 %xor1018, 12
  %or1022 = or i64 %shl1020, %shr1021
  %xor1023 = xor i64 %or1022, %add1019
  %add1024 = add i64 %xor1013, %add1014
  %shl1025 = shl i64 %xor1013, 57
  %shr1026 = lshr i64 %xor1013, 7
  %or1027 = or i64 %shl1025, %shr1026
  %xor1028 = xor i64 %or1027, %add1024
  %add1029 = add i64 %xor1028, %add1019
  %shl1030 = shl i64 %xor1028, 23
  %shr1031 = lshr i64 %xor1028, 41
  %or1032 = or i64 %shl1030, %shr1031
  %xor1033 = xor i64 %or1032, %add1029
  %add1034 = add i64 %xor1023, %add1024
  %shl1035 = shl i64 %xor1023, 40
  %shr1036 = lshr i64 %xor1023, 24
  %or1037 = or i64 %shl1035, %shr1036
  %xor1038 = xor i64 %or1037, %add1034
  %add1039 = add i64 %xor1038, %add1029
  %shl1040 = shl i64 %xor1038, 5
  %shr1041 = lshr i64 %xor1038, 59
  %or1042 = or i64 %shl1040, %shr1041
  %xor1043 = xor i64 %or1042, %add1039
  %add1044 = add i64 %xor1033, %add1034
  %shl1045 = shl i64 %xor1033, 37
  %shr1046 = lshr i64 %xor1033, 27
  %or1047 = or i64 %shl1045, %shr1046
  %xor1048 = xor i64 %or1047, %add1044
  %add1052 = add i64 %add1039, %6
  %add1060 = add i64 %xor1048, %add68
  %add1068 = add i64 %add1044, %add77
  %add1073 = add i64 %3, 15
  %add1074 = add i64 %add1073, %xor1043
  %add1075 = add i64 %add1052, %add1060
  %shl1076 = shl i64 %add1060, 25
  %shr1077 = lshr i64 %add1060, 39
  %or1078 = or i64 %shl1076, %shr1077
  %xor1079 = xor i64 %or1078, %add1075
  %add1080 = add i64 %add1068, %add1074
  %shl1081 = shl i64 %add1074, 33
  %shr1082 = lshr i64 %add1074, 31
  %or1083 = or i64 %shl1081, %shr1082
  %xor1084 = xor i64 %or1083, %add1080
  %add1085 = add i64 %xor1084, %add1075
  %shl1086 = shl i64 %xor1084, 46
  %shr1087 = lshr i64 %xor1084, 18
  %or1088 = or i64 %shl1086, %shr1087
  %xor1089 = xor i64 %or1088, %add1085
  %add1090 = add i64 %xor1079, %add1080
  %shl1091 = shl i64 %xor1079, 12
  %shr1092 = lshr i64 %xor1079, 52
  %or1093 = or i64 %shl1091, %shr1092
  %xor1094 = xor i64 %or1093, %add1090
  %add1095 = add i64 %xor1094, %add1085
  %shl1096 = shl i64 %xor1094, 58
  %shr1097 = lshr i64 %xor1094, 6
  %or1098 = or i64 %shl1096, %shr1097
  %xor1099 = xor i64 %or1098, %add1095
  %add1100 = add i64 %xor1089, %add1090
  %shl1101 = shl i64 %xor1089, 22
  %shr1102 = lshr i64 %xor1089, 42
  %or1103 = or i64 %shl1101, %shr1102
  %xor1104 = xor i64 %or1103, %add1100
  %add1105 = add i64 %xor1104, %add1095
  %shl1106 = shl i64 %xor1104, 32
  %shr1107 = lshr i64 %xor1104, 32
  %or1108 = or i64 %shl1106, %shr1107
  %xor1109 = xor i64 %or1108, %add1105
  %add1110 = add i64 %xor1099, %add1100
  %shl1111 = shl i64 %xor1099, 32
  %shr1112 = lshr i64 %xor1099, 32
  %or1113 = or i64 %shl1111, %shr1112
  %xor1114 = xor i64 %or1113, %add1110
  %add1118 = add i64 %add1105, %5
  %add1126 = add i64 %xor1114, %add77
  %add1134 = add i64 %add1110, %add143
  %add1139 = add i64 %xor44, 16
  %add1140 = add i64 %add1139, %xor1109
  %add1141 = add i64 %add1118, %add1126
  %shl1142 = shl i64 %add1126, 14
  %shr1143 = lshr i64 %add1126, 50
  %or1144 = or i64 %shl1142, %shr1143
  %xor1145 = xor i64 %or1144, %add1141
  %add1146 = add i64 %add1134, %add1140
  %shl1147 = shl i64 %add1140, 16
  %shr1148 = lshr i64 %add1140, 48
  %or1149 = or i64 %shl1147, %shr1148
  %xor1150 = xor i64 %or1149, %add1146
  %add1151 = add i64 %xor1150, %add1141
  %shl1152 = shl i64 %xor1150, 52
  %shr1153 = lshr i64 %xor1150, 12
  %or1154 = or i64 %shl1152, %shr1153
  %xor1155 = xor i64 %or1154, %add1151
  %add1156 = add i64 %xor1145, %add1146
  %shl1157 = shl i64 %xor1145, 57
  %shr1158 = lshr i64 %xor1145, 7
  %or1159 = or i64 %shl1157, %shr1158
  %xor1160 = xor i64 %or1159, %add1156
  %add1161 = add i64 %xor1160, %add1151
  %shl1162 = shl i64 %xor1160, 23
  %shr1163 = lshr i64 %xor1160, 41
  %or1164 = or i64 %shl1162, %shr1163
  %xor1165 = xor i64 %or1164, %add1161
  %add1166 = add i64 %xor1155, %add1156
  %shl1167 = shl i64 %xor1155, 40
  %shr1168 = lshr i64 %xor1155, 24
  %or1169 = or i64 %shl1167, %shr1168
  %xor1170 = xor i64 %or1169, %add1166
  %add1171 = add i64 %xor1170, %add1161
  %shl1172 = shl i64 %xor1170, 5
  %shr1173 = lshr i64 %xor1170, 59
  %or1174 = or i64 %shl1172, %shr1173
  %xor1175 = xor i64 %or1174, %add1171
  %add1176 = add i64 %xor1165, %add1166
  %shl1177 = shl i64 %xor1165, 37
  %shr1178 = lshr i64 %xor1165, 27
  %or1179 = or i64 %shl1177, %shr1178
  %xor1180 = xor i64 %or1179, %add1176
  %add1184 = add i64 %add1171, %4
  %add1192 = add i64 %xor1180, %add143
  %add1200 = add i64 %add1176, %add209
  %add1205 = add i64 %6, 17
  %add1206 = add i64 %add1205, %xor1175
  %add1207 = add i64 %add1184, %add1192
  %shl1208 = shl i64 %add1192, 25
  %shr1209 = lshr i64 %add1192, 39
  %or1210 = or i64 %shl1208, %shr1209
  %xor1211 = xor i64 %or1210, %add1207
  %add1212 = add i64 %add1200, %add1206
  %shl1213 = shl i64 %add1206, 33
  %shr1214 = lshr i64 %add1206, 31
  %or1215 = or i64 %shl1213, %shr1214
  %xor1216 = xor i64 %or1215, %add1212
  %add1217 = add i64 %xor1216, %add1207
  %shl1218 = shl i64 %xor1216, 46
  %shr1219 = lshr i64 %xor1216, 18
  %or1220 = or i64 %shl1218, %shr1219
  %xor1221 = xor i64 %or1220, %add1217
  %add1222 = add i64 %xor1211, %add1212
  %shl1223 = shl i64 %xor1211, 12
  %shr1224 = lshr i64 %xor1211, 52
  %or1225 = or i64 %shl1223, %shr1224
  %xor1226 = xor i64 %or1225, %add1222
  %add1227 = add i64 %xor1226, %add1217
  %shl1228 = shl i64 %xor1226, 58
  %shr1229 = lshr i64 %xor1226, 6
  %or1230 = or i64 %shl1228, %shr1229
  %xor1231 = xor i64 %or1230, %add1227
  %add1232 = add i64 %xor1221, %add1222
  %shl1233 = shl i64 %xor1221, 22
  %shr1234 = lshr i64 %xor1221, 42
  %or1235 = or i64 %shl1233, %shr1234
  %xor1236 = xor i64 %or1235, %add1232
  %add1237 = add i64 %xor1236, %add1227
  %shl1238 = shl i64 %xor1236, 32
  %shr1239 = lshr i64 %xor1236, 32
  %or1240 = or i64 %shl1238, %shr1239
  %xor1241 = xor i64 %or1240, %add1237
  %add1242 = add i64 %xor1231, %add1232
  %shl1243 = shl i64 %xor1231, 32
  %shr1244 = lshr i64 %xor1231, 32
  %or1245 = or i64 %shl1243, %shr1244
  %xor1246 = xor i64 %or1245, %add1242
  %add1250 = add i64 %add1237, %3
  %add1258 = add i64 %xor1246, %add209
  %add1266 = add i64 %add1242, %add275
  %add1271 = add i64 %5, 18
  %add1272 = add i64 %add1271, %xor1241
  %xor1274 = xor i64 %add1250, %39
  store i64 %xor1274, i64* %arrayidx11, align 8, !tbaa !2
  %xor1278 = xor i64 %add1258, %add33.i.1
  store i64 %xor1278, i64* %arrayidx16, align 8, !tbaa !2
  %xor1282 = xor i64 %add1266, %add33.i.2
  store i64 %xor1282, i64* %arrayidx21, align 8, !tbaa !2
  %xor1286 = xor i64 %add1272, %add33.i.3
  store i64 %xor1286, i64* %arrayidx26, align 8, !tbaa !2
  %and = and i64 %kw.sroa.20.0, -4611686018427387905
  %dec = add i32 %blkCnt.addr.0, -1
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %do.end, label %do.body

do.end:                                           ; preds = %do.body
  store i64 %add, i64* %arrayidx, align 8, !tbaa !2
  store i64 %and, i64* %arrayidx4, align 8, !tbaa !2
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %0) #3
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

attributes #0 = { nofree norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (/b/s/w/ir/cache/git/chromium.googlesource.com-external-github.com-llvm-llvm--project 3774bcf9f84520a8c35bf765d9a528040d68a14b)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"long long", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!4, !4, i64 0}
!7 = !{!8, !9, i64 0}
!8 = !{!"", !9, i64 0, !4, i64 8}
!9 = !{!"int", !4, i64 0}
!10 = !{!11, !13, i64 0}
!11 = !{!"", !12, i64 0, !4, i64 24, !4, i64 88}
!12 = !{!"", !13, i64 0, !13, i64 4, !4, i64 8}
!13 = !{!"long", !4, i64 0}
!14 = !{!11, !13, i64 4}
!15 = !{!16, !13, i64 0}
!16 = !{!"", !12, i64 0, !4, i64 24, !4, i64 152}
!17 = !{!16, !13, i64 4}
!18 = !{!19, !13, i64 4}
!19 = !{!"", !12, i64 0, !4, i64 24, !4, i64 56}
!20 = !{!19, !13, i64 0}
