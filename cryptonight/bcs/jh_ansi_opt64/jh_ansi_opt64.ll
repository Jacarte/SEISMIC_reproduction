; ModuleID = 'jh_ansi_opt64/jh_ansi_opt64.bc'
source_filename = "jh_ansi_opt64.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-emscripten"

%struct.hashState = type { i32, i64, i64, [8 x i8], [8 x [2 x i64]], [64 x i8] }

@.str = private unnamed_addr constant [15 x i8] c"ret == SUCCESS\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"jh_ansi_opt64.c\00", align 1
@__func__.jh = private unnamed_addr constant [3 x i8] c"jh\00", align 1
@JH224_H0 = internal unnamed_addr constant [128 x i8] c"-\FE\DDb\F9\9A\98\AC\AE|\AC\D6\19\D64\E7\A4\83\10\05\BC0\12\16\B8`8\C6\C9f\14\94f\D9\89\9F%\80po\CE\9E\A3\1B\1D\9B\1A\DC\11\E82_{6n\10\F9\94\85\7F\02\FA\06\C1\1BO\1B\\\D8\C8@\B3\97\F6\A1\7Fns\80\99\DC\DF\93\A5\AD\EA\A3\D3\A41\E8\DE\C9S\9Ah\22\B4\A9\8A\EC\86\A1\E4\D5t\AC\95\9C\E5l\F0\15\96\0D\EA\B5\AB+\BF\96\11\DC\F0\DDd\EAn", align 16
@JH256_H0 = internal unnamed_addr constant [128 x i8] c"\EB\98\A3A, \D3\EB\92\CD\BE{\9C\B2E\C1\1C\93Q\91`\D4\C7\FA&\00\82\D6~P\8A\03\A4#\9E&w&\B9E\E0\FB\1AH\D4\1A\94w\CD\B5\AB&\02k\17zV\F0$B\0F\FF/\A8q\A3\96\89\7F.Mu\1D\14I\08\F7}\E2b'v\95\F7v$\8F\94\87\D5\B6WG\80)l\\^'-\AC\8E\0DlQ\84P\C6W\05z\0F{\E4\D3gp$\12\EA\89\E3\AB\13\D3\1C\D7i", align 16
@JH384_H0 = internal unnamed_addr constant [128 x i8] c"H\1E;\C6\D8\139\8Am;^\89J\DE\87\9Bc\FA\EAh\D4\80\AD.3,\CB!H\0F\82g\98\AE\C8M\90\82\B9(\D4U\EA0A\11BI6\F5U\B2\92HG\EC\C7%\0A\93\BA\F4<\E1V\9B\7F\8A'\DBEL\9E\FC\BDIc\97\AF\0EX\9F\C2}&\AA\80\CD\80\C0\8B\8C\9D\EB.\DA\8Ay\81\E8\F8\D57:\F49g\AD\DD\D1zq\A9\B4\D3\BD\A4u\D3\94\97l?\BA\98Bs\7F", align 16
@JH512_H0 = internal unnamed_addr constant [128 x i8] c"o\D1K\96>\00\AA\17cj.\05z\15\D5C\8A\22^\8D\0C\97\EF\0B\E94\12Y\F2\B3\C3a\89\1D\A0\C1So\80\1E*\A9\05k\EA+m\80X\8E\CC\DB u\BA\A6\A9\0F:v\BA\F8;\F7\01i\E6\05A\E3JiF\B5\8A\8E.o\E6Z\10G\A7\D0\C1\84<$;nq\B1-Z\C1\99\CFW\F6\EC\9D\B1\F8V\A7\06\88|W\16\B1V\E3\C2\FC\DF\E6\85\17\FBTZFx\CC\8C\DDK", align 16
@E8_bitslice_roundconstant = internal unnamed_addr constant [42 x [32 x i8]] [[32 x i8] c"r\D5\DE\A2\DF\15\F8g{\84\15\0A\B7#\15W\81\AB\D6\90MZ\87\F6N\9FO\C5\C3\D1+@", [32 x i8] c"\EA\98:\E0\\E\FA\9C\03\C5\D2\99f\B2\99\9Af\02\96\B4\F2\BBS\8A\B5V\14\1A\88\DB\A21", [32 x i8] c"\03\A3Z\\\9A\19\0E\DB@?\B2\0A\87\C1D\10\1C\05\19\80\84\9E\95\1Do3\EB\AD^\E7\CD\DC", [32 x i8] c"\10\BA\13\92\02\BFkA\DCxe\15\F7\BB'\D0\0A,\8197\AAxP?\1A\BF\D2A\00\91\D3", [32 x i8] c"B-Z\0D\F6\CC~\90\DDb\9F\9C\92\C0\97\CE\18\\\A7\0B\C7+D\AC\D1\DFe\D6c\C6\FC#", [32 x i8] c"\97nl\03\9E\E0\B8\1A!\05E~Dl\EC\A8\EE\F1\03\BB]\8Ea\FA\FD\96\97\B2\94\83\81\97", [32 x i8] c"J\8E\857\DB\030/*g\8D-\FB\9Fj\95\8A\FEs\81\F8\B8il\8A\C7rF\C0\7FB\14", [32 x i8] c"\C5\F4\15\8F\BD\C7^\C4uDo\A7\8F\11\BB\80R\DEu\B7\AE\E4\88\BC\82\B8\00\1E\98\A6\A3\F4", [32 x i8] c"\8E\F4\8F3\A9\A3c\15\AA_V$\D5\B7\F9\89\B6\F1\ED |Z\E0\FD6\CA\E9Z\06B,6", [32 x i8] c"\CE)5CN\FE\98=S:\F9ts\9AK\A7\D0\F5\1FYoN\81\86\0E\9D\AD\81\AF\D8Z\9F", [32 x i8] c"\A7\05\06g\EE4bj\8B\0B(\BEn\B9\17'Gt\07&\C6\80\10?\E0\A0~o\C6~H{", [32 x i8] c"\0DU\0A\A5J\F8\A4\C0\91\E3\E7\9F\97\8E\F1\9E\86vr\81P`\8D\D4~\9EZA\F3\E5\B0b", [32 x i8] c"\FC\9F\1F\EC@T z\E3\E4\1A\00\CE\F4\C9\84O\D7\94\F5\9D\FA\95\D8U.~\11$\C3T\A5", [32 x i8] c"[\DFr(\BD\FEn(x\F5\7F\E2\0F\A5\C4\B2\05\89|\EF\EEI\D3.D~\93\85\EB(Y\7F", [32 x i8] c"p_i7\B3$1J^\86(\F1\1D\D6\E4e\C7\1Bw\04Q\B9 \E7t\FEC\E8#\D4\87\8A", [32 x i8] c"})\E8\A3\92v\94\F2\DD\CBz\09\9B0\D9\C1\1D\1B0\FB[\DC\1B\E0\DA$IO\F2\9C\82\BF", [32 x i8] c"\A4\E7\BA1\B4p\BF\FF\0D2D\05\DE\F8\BCH;\AE\FC2S\BB\D39E\9F\C3\C1\E0)\8B\A0", [32 x i8] c"\E5\C9\05\FD\F7\AE\09\0F\94p4\12B\90\F14\A2q\B7\01\E3D\ED\95\E9;\8E6O/\98J", [32 x i8] c"\88@\1Dc\A0l\F6\15G\C1DK\87R\AF\FF~\BBJ\F1\E2\0A\C60Fp\B6\C5\CCn\8C\E6", [32 x i8] c"\A4\D5\A4V\BDO\CA\00\DA\9D\84K\C8>\18\AEsW\CEE0d\D1\AD\E8\A6\CEh\14\\%g", [32 x i8] c"\A3\DA\8C\F2\CB\0E\E1\163\E9\06X\9A\94\99\9A\1F`\B2 \C2o\84{\D1\CE\AC\7F\A0\D1\85\18", [32 x i8] c"2Y[\A1\8D\DD\19\D3P\9A\1C\C0\AA\A5\B4F\9F=cg\E4\04k\BA\F6\CA\19\AB\0BV\EE~", [32 x i8] c"\1F\B1y\EA\A9(!t\E9\BD\F75;6Q\EE\1DW\ACZuP\D3v:F\C2\FE\A3}p\01", [32 x i8] c"\F75\C1\AF\98\A4\D8Bx\ED\EC \9EkgyA\83c\15\EA:\DB\A8\FA\C3;M2\83,\83", [32 x i8] c"\A7@;\1F\1C'G\F3Y@\F04\B7-v\9A\E7>Nl\D2!O\FD\B8\FD\8D9\DCWY\EF", [32 x i8] c"\8D\9B\0CI+I\EB\DA[\A2\D7Ih\F3p\0D};\AE\D0z\8DU\84\F5\A5\E9\F0\E4\F8\8Ee", [32 x i8] c"\A0\B8\A2\F46\10;S\0C\A8\07\9Eu>\ECZ\91h\94\92V\E8\88O[\B0\\U\F8\BA\BCL", [32 x i8] c"\E3\BB;\99\F3\87\94{u\DA\F4\D6rk\1C]d\AE\AC(\DC4\B3ml4\A5P\B8(\DBq", [32 x i8] c"\F8a\E2\F2\10\8DQ*\E3\DBd3Y\DDu\FC\1C\AC\BC\F1C\CE?\A2g\BB\D1<\02\E8C\B0", [32 x i8] c"3\0A[\CA\88)\A1u\7F4\19M\B4\16S\\\92;\94\C3\0EyM\1Eytu\D7\B6\EE\AF?", [32 x i8] c"\EA\A8\D4\F7\BE\1A9!\\\F4~\09L#'Q&\A3$S\BA2<\D2D\A3\17Jm\A6\D5\AD", [32 x i8] c"\B5\1D>\A6\AF\F2\C9\08\83Y=\98\91k<VL\F8|\A1r\86`MF\E2>\CC\08n\C7\F6", [32 x i8] c"/\983\B3\B1\BCv^+\D6f\A5\EF\C4\E6*\06\F4\B6\E8\BE\C1\D46t\EE\82\15\BC\EF!c", [32 x i8] c"\FD\C1N\0D\F4S\C9i\A7}Z\C4\06XX&~\C1\14\16\06\E0\FA\16~\90\AF=(c\9D?", [32 x i8] c"\D2\C9\F2\E3\00\9B\D2\0C_\AA\CE0\B7\D4\0C0t*Q\16\F2\E02\98\0D\EB0\D8\E3\CE\F8\9A", [32 x i8] c"K\C5\9E{\B5\F1y\92\FFQ\E6n\04\86h\D3\9B#MW\E6\96g1\CC\E6\A6\F3\17\0Au\05", [32 x i8] c"\B1v\81\D9\132l\CE<\17R\84\F8\05\A2b\F4+\CB\B3xG\15G\FFFT\82#\93jH", [32 x i8] c"8\DFX\07N^ee\F2\FC|\89\FC\86P\8E1p.D\D0\0B\CA\86\F0@\09\A20xGN", [32 x i8] c"e\A0\EE9\D1\F78\83\F7^\E97\E4,:\BD!\97\B2&\01\13\F8o\A3D\ED\D1\EF\9F\DE\E7", [32 x i8] c"\8B\A0\DF\15v%\92\D9<\85\F7\F6\12\DCB\BE\D8\A7\EC|\AB'\B0~S\8D}\DA\AA>\A8\DE", [32 x i8] c"\AA%\CE\93\BD\02i\D8Z\F6C\FD\1As\08\F9\C0_\EF\DA\17J\19\A5\97Mf3L\FD!j", [32 x i8] c"5\B4\981\DBA\15p\EA\1E\0F\BB\ED\CDT\9B\9A\D0c\A1Q\97@r\F6u\9D\BF\91Go\E2"], align 16

; Function Attrs: nounwind
define hidden void @jh(i32 %bit_len, i8* nocapture readonly %input, i32 %input_bit_length, i8* nocapture %output) local_unnamed_addr #0 {
entry:
  %state.i = alloca %struct.hashState, align 16
  %conv = zext i32 %input_bit_length to i64
  %0 = bitcast %struct.hashState* %state.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 224, i8* nonnull %0) #4
  %1 = add i32 %bit_len, -224
  %2 = lshr i32 %1, 5
  %3 = shl i32 %1, 27
  %4 = or i32 %2, %3
  switch i32 %4, label %lor.rhs [
    i32 9, label %if.then.i
    i32 5, label %if.then.i
    i32 1, label %if.then.i
    i32 0, label %if.then.i
  ]

if.then.i:                                        ; preds = %entry, %entry, %entry, %entry
  %databitlen.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 1
  %hashbitlen1.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 0
  %5 = bitcast i64* %databitlen.i.i to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %5, i8 0, i64 16, i1 false) #4
  store i32 %bit_len, i32* %hashbitlen1.i.i, align 16, !tbaa !2
  switch i32 %4, label %if.end50.i.i [
    i32 0, label %sw.bb.i.i
    i32 1, label %sw.bb2.i.i
    i32 5, label %sw.bb5.i.i
    i32 9, label %sw.bb8.i.i
  ]

sw.bb.i.i:                                        ; preds = %if.then.i
  %arraydecay.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 4, i32 0
  %6 = bitcast [2 x i64]* %arraydecay.i.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 dereferenceable(128) %6, i8* nonnull align 16 dereferenceable(128) getelementptr inbounds ([128 x i8], [128 x i8]* @JH224_H0, i32 0, i32 0), i32 128, i1 false) #4
  br label %if.end50.i.i

sw.bb2.i.i:                                       ; preds = %if.then.i
  %arraydecay4.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 4, i32 0
  %7 = bitcast [2 x i64]* %arraydecay4.i.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 dereferenceable(128) %7, i8* nonnull align 16 dereferenceable(128) getelementptr inbounds ([128 x i8], [128 x i8]* @JH256_H0, i32 0, i32 0), i32 128, i1 false) #4
  br label %if.end50.i.i

sw.bb5.i.i:                                       ; preds = %if.then.i
  %arraydecay7.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 4, i32 0
  %8 = bitcast [2 x i64]* %arraydecay7.i.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 dereferenceable(128) %8, i8* nonnull align 16 dereferenceable(128) getelementptr inbounds ([128 x i8], [128 x i8]* @JH384_H0, i32 0, i32 0), i32 128, i1 false) #4
  br label %if.end50.i.i

sw.bb8.i.i:                                       ; preds = %if.then.i
  %arraydecay10.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 4, i32 0
  %9 = bitcast [2 x i64]* %arraydecay10.i.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 dereferenceable(128) %9, i8* nonnull align 16 dereferenceable(128) getelementptr inbounds ([128 x i8], [128 x i8]* @JH512_H0, i32 0, i32 0), i32 128, i1 false) #4
  br label %if.end50.i.i

if.end50.i.i:                                     ; preds = %sw.bb8.i.i, %sw.bb5.i.i, %sw.bb2.i.i, %sw.bb.i.i, %if.then.i
  store i64 %conv, i64* %databitlen.i.i, align 8, !tbaa !8
  %datasize_in_buffer.i17.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 2
  %cmp30.i.i = icmp ugt i32 %input_bit_length, 511
  br i1 %cmp30.i.i, label %for.body.lr.ph.i.i, label %for.end.i.i

for.body.lr.ph.i.i:                               ; preds = %if.end50.i.i
  %arraydecay54.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 5, i32 0
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %for.body.i.i, %for.body.lr.ph.i.i
  %index.14.i.i = phi i64 [ 0, %for.body.lr.ph.i.i ], [ %add57.i.i, %for.body.i.i ]
  %databitlen.addr.23.i.i = phi i64 [ %conv, %for.body.lr.ph.i.i ], [ %sub58.i.i, %for.body.i.i ]
  %idx.ext55.i.i = trunc i64 %index.14.i.i to i32
  %add.ptr56.i.i = getelementptr inbounds i8, i8* %input, i32 %idx.ext55.i.i
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 dereferenceable(64) %arraydecay54.i.i, i8* nonnull align 1 dereferenceable(64) %add.ptr56.i.i, i32 64, i1 false) #4
  call fastcc void @F8(%struct.hashState* nonnull %state.i) #4
  %add57.i.i = add nuw nsw i64 %index.14.i.i, 64
  %sub58.i.i = add i64 %databitlen.addr.23.i.i, -512
  %cmp51.i.i = icmp ugt i64 %sub58.i.i, 511
  br i1 %cmp51.i.i, label %for.body.i.i, label %for.end.i.loopexit.i

for.end.i.loopexit.i:                             ; preds = %for.body.i.i
  %phitmp.i = trunc i64 %add57.i.i to i32
  br label %for.end.i.i

for.end.i.i:                                      ; preds = %for.end.i.loopexit.i, %if.end50.i.i
  %databitlen.addr.2.lcssa.i.i = phi i64 [ %conv, %if.end50.i.i ], [ %sub58.i.i, %for.end.i.loopexit.i ]
  %index.1.lcssa.i.i = phi i32 [ 0, %if.end50.i.i ], [ %phitmp.i, %for.end.i.loopexit.i ]
  %cmp59.i.i = icmp eq i64 %databitlen.addr.2.lcssa.i.i, 0
  br i1 %cmp59.i.i, label %Update.exit.i, label %if.then61.i.i

if.then61.i.i:                                    ; preds = %for.end.i.i
  %and62.i.i = and i64 %databitlen.addr.2.lcssa.i.i, 7
  %cmp63.i.i = icmp eq i64 %and62.i.i, 0
  %arraydecay67.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 5, i32 0
  %add.ptr69.i.i = getelementptr inbounds i8, i8* %input, i32 %index.1.lcssa.i.i
  %and70.i.i = lshr i64 %databitlen.addr.2.lcssa.i.i, 3
  %conv72.i.i = trunc i64 %and70.i.i to i32
  br i1 %cmp63.i.i, label %if.then65.i.i, label %if.else73.i.i

if.then65.i.i:                                    ; preds = %if.then61.i.i
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 %arraydecay67.i.i, i8* align 1 %add.ptr69.i.i, i32 %conv72.i.i, i1 false) #4
  br label %if.end82.i.i

if.else73.i.i:                                    ; preds = %if.then61.i.i
  %conv81.i28.i = add nuw nsw i32 %conv72.i.i, 1
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 %arraydecay67.i.i, i8* nonnull align 1 dereferenceable(1) %add.ptr69.i.i, i32 %conv81.i28.i, i1 false) #4
  br label %if.end82.i.i

if.end82.i.i:                                     ; preds = %if.else73.i.i, %if.then65.i.i
  store i64 %databitlen.addr.2.lcssa.i.i, i64* %datasize_in_buffer.i17.i, align 16, !tbaa !9
  br label %Update.exit.i

Update.exit.i:                                    ; preds = %if.end82.i.i, %for.end.i.i
  %10 = load i64, i64* %databitlen.i.i, align 8, !tbaa !8
  %and.i.i = and i64 %10, 511
  %cmp.i.i = icmp eq i64 %and.i.i, 0
  br i1 %cmp.i.i, label %if.then.i.i, label %if.else.i.i

if.then.i.i:                                      ; preds = %Update.exit.i
  %arraydecay.i15.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 5, i32 0
  call void @llvm.memset.p0i8.i32(i8* nonnull align 16 dereferenceable(64) %arraydecay.i15.i, i8 0, i32 64, i1 false) #4
  store i8 -128, i8* %arraydecay.i15.i, align 16, !tbaa !10
  br label %if.end131.i.i

if.else.i.i:                                      ; preds = %Update.exit.i
  %11 = load i64, i64* %datasize_in_buffer.i17.i, align 16, !tbaa !9
  %and47.i.i = and i64 %11, 7
  %cmp48.i.i = icmp eq i64 %and47.i.i, 0
  %shr53.i.i = lshr i64 %and.i.i, 3
  %conv54.i.i = trunc i64 %shr53.i.i to i32
  br i1 %cmp48.i.i, label %for.body.preheader.i.i, label %for.cond64.preheader.i.i

for.cond64.preheader.i.i:                         ; preds = %if.else.i.i
  %cmp6511.i.i = icmp eq i32 %conv54.i.i, 63
  br i1 %cmp6511.i.i, label %if.end.i.i, label %for.body67.preheader.i.i

for.body67.preheader.i.i:                         ; preds = %for.cond64.preheader.i.i
  %12 = add nuw nsw i32 %conv54.i.i, 161
  %uglygep15.i.i = getelementptr i8, i8* %0, i32 %12
  %13 = xor i32 %conv54.i.i, 63
  call void @llvm.memset.p0i8.i32(i8* align 1 %uglygep15.i.i, i8 0, i32 %13, i1 false) #4
  br label %if.end.i.i

for.body.preheader.i.i:                           ; preds = %if.else.i.i
  %14 = add nuw nsw i32 %conv54.i.i, 160
  %uglygep.i.i = getelementptr i8, i8* %0, i32 %14
  %15 = sub nuw nsw i32 64, %conv54.i.i
  call void @llvm.memset.p0i8.i32(i8* align 1 %uglygep.i.i, i8 0, i32 %15, i1 false) #4
  br label %if.end.i.i

if.end.i.i:                                       ; preds = %for.body.preheader.i.i, %for.body67.preheader.i.i, %for.cond64.preheader.i.i
  %16 = trunc i64 %10 to i32
  %17 = and i32 %16, 7
  %sh_prom.i.i = xor i32 %17, 7
  %shl.i.i = shl nuw i32 1, %sh_prom.i.i
  %and77.i.i = lshr i64 %10, 3
  %18 = trunc i64 %and77.i.i to i32
  %idxprom.i.i = and i32 %18, 63
  %arrayidx79.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 5, i32 %idxprom.i.i
  %19 = load i8, i8* %arrayidx79.i.i, align 1, !tbaa !10
  %20 = trunc i32 %shl.i.i to i8
  %conv81.i.i = or i8 %19, %20
  store i8 %conv81.i.i, i8* %arrayidx79.i.i, align 1, !tbaa !10
  call fastcc void @F8(%struct.hashState* nonnull %state.i) #4
  %arraydecay83.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 5, i32 0
  call void @llvm.memset.p0i8.i32(i8* nonnull align 16 dereferenceable(64) %arraydecay83.i.i, i8 0, i32 64, i1 false) #4
  %21 = load i64, i64* %databitlen.i.i, align 8, !tbaa !8
  br label %if.end131.i.i

if.end131.i.i:                                    ; preds = %if.end.i.i, %if.then.i.i
  %.sink11 = phi i64 [ %21, %if.end.i.i ], [ %10, %if.then.i.i ]
  %conv86.i.i = trunc i64 %.sink11 to i8
  %arrayidx88.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 5, i32 63
  store i8 %conv86.i.i, i8* %arrayidx88.i.i, align 1, !tbaa !10
  %shr90.i.i = lshr i64 %.sink11, 8
  %conv92.i.i = trunc i64 %shr90.i.i to i8
  %arrayidx94.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 5, i32 62
  store i8 %conv92.i.i, i8* %arrayidx94.i.i, align 2, !tbaa !10
  %shr96.i.i = lshr i64 %.sink11, 16
  %conv98.i.i = trunc i64 %shr96.i.i to i8
  %arrayidx100.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 5, i32 61
  store i8 %conv98.i.i, i8* %arrayidx100.i.i, align 1, !tbaa !10
  %shr102.i.i = lshr i64 %.sink11, 24
  %conv104.i.i = trunc i64 %shr102.i.i to i8
  %arrayidx106.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 5, i32 60
  store i8 %conv104.i.i, i8* %arrayidx106.i.i, align 4, !tbaa !10
  %shr108.i.i = lshr i64 %.sink11, 32
  %conv110.i.i = trunc i64 %shr108.i.i to i8
  %arrayidx112.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 5, i32 59
  store i8 %conv110.i.i, i8* %arrayidx112.i.i, align 1, !tbaa !10
  %shr114.i.i = lshr i64 %.sink11, 40
  %conv116.i.i = trunc i64 %shr114.i.i to i8
  %arrayidx118.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 5, i32 58
  store i8 %conv116.i.i, i8* %arrayidx118.i.i, align 2, !tbaa !10
  %shr120.i.i = lshr i64 %.sink11, 48
  %conv122.i.i = trunc i64 %shr120.i.i to i8
  %arrayidx124.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 5, i32 57
  store i8 %conv122.i.i, i8* %arrayidx124.i.i, align 1, !tbaa !10
  %shr126.i.i = lshr i64 %.sink11, 56
  %conv128.i.i = trunc i64 %shr126.i.i to i8
  %arrayidx130.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 5, i32 56
  store i8 %conv128.i.i, i8* %arrayidx130.i.i, align 8, !tbaa !10
  call fastcc void @F8(%struct.hashState* nonnull %state.i) #4
  %22 = load i32, i32* %hashbitlen1.i.i, align 16, !tbaa !2
  %23 = add i32 %22, -224
  %24 = lshr i32 %23, 5
  %25 = shl i32 %23, 27
  %26 = or i32 %24, %25
  switch i32 %26, label %lor.end [
    i32 0, label %sw.bb.i16.i
    i32 1, label %sw.bb134.i.i
    i32 5, label %sw.bb139.i.i
    i32 9, label %sw.bb144.i.i
  ]

sw.bb.i16.i:                                      ; preds = %if.end131.i.i
  %add.ptr6.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 4, i32 4
  %add.ptr.i.i = bitcast [2 x i64]* %add.ptr6.i.i to i8*
  %add.ptr133.i.i = getelementptr inbounds i8, i8* %add.ptr.i.i, i32 36
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(28) %output, i8* nonnull align 4 dereferenceable(28) %add.ptr133.i.i, i32 28, i1 false) #4
  br label %lor.end

sw.bb134.i.i:                                     ; preds = %if.end131.i.i
  %add.ptr1385.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 4, i32 6
  %add.ptr138.i.i = bitcast [2 x i64]* %add.ptr1385.i.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(32) %output, i8* nonnull align 16 dereferenceable(32) %add.ptr138.i.i, i32 32, i1 false) #4
  br label %lor.end

sw.bb139.i.i:                                     ; preds = %if.end131.i.i
  %add.ptr1433.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 4, i32 5
  %add.ptr143.i.i = bitcast [2 x i64]* %add.ptr1433.i.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(48) %output, i8* nonnull align 16 dereferenceable(48) %add.ptr143.i.i, i32 48, i1 false) #4
  br label %lor.end

sw.bb144.i.i:                                     ; preds = %if.end131.i.i
  %add.ptr1471.i.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state.i, i32 0, i32 4, i32 4
  %add.ptr147.i.i = bitcast [2 x i64]* %add.ptr1471.i.i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(64) %output, i8* nonnull align 16 dereferenceable(64) %add.ptr147.i.i, i32 64, i1 false) #4
  br label %lor.end

lor.rhs:                                          ; preds = %entry
  call void @llvm.lifetime.end.p0i8(i64 224, i8* nonnull %0) #4
  tail call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i32 0, i32 0), i32 376, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @__func__.jh, i32 0, i32 0)) #5
  unreachable

lor.end:                                          ; preds = %if.end131.i.i, %sw.bb.i16.i, %sw.bb134.i.i, %sw.bb139.i.i, %sw.bb144.i.i
  call void @llvm.lifetime.end.p0i8(i64 224, i8* nonnull %0) #4
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: noreturn
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #1

; Function Attrs: nofree norecurse nounwind
define internal fastcc void @F8(%struct.hashState* nocapture %state) unnamed_addr #3 {
entry:
  %arraydecay = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 5, i32 0
  %0 = bitcast i8* %arraydecay to i64*
  %1 = load i64, i64* %0, align 8, !tbaa !11
  %arrayidx4 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 4, i32 0, i32 0
  %2 = load i64, i64* %arrayidx4, align 8, !tbaa !11
  %xor = xor i64 %2, %1
  store i64 %xor, i64* %arrayidx4, align 8, !tbaa !11
  %arrayidx.1 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 5, i32 8
  %3 = bitcast i8* %arrayidx.1 to i64*
  %4 = load i64, i64* %3, align 8, !tbaa !11
  %arrayidx4.1 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 4, i32 0, i32 1
  %5 = load i64, i64* %arrayidx4.1, align 8, !tbaa !11
  %xor.1 = xor i64 %5, %4
  store i64 %xor.1, i64* %arrayidx4.1, align 8, !tbaa !11
  %arrayidx.2 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 5, i32 16
  %6 = bitcast i8* %arrayidx.2 to i64*
  %7 = load i64, i64* %6, align 8, !tbaa !11
  %arrayidx4.2 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 4, i32 1, i32 0
  %8 = load i64, i64* %arrayidx4.2, align 8, !tbaa !11
  %xor.2 = xor i64 %8, %7
  store i64 %xor.2, i64* %arrayidx4.2, align 8, !tbaa !11
  %arrayidx.3 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 5, i32 24
  %9 = bitcast i8* %arrayidx.3 to i64*
  %10 = load i64, i64* %9, align 8, !tbaa !11
  %arrayidx4.3 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 4, i32 1, i32 1
  %11 = load i64, i64* %arrayidx4.3, align 8, !tbaa !11
  %xor.3 = xor i64 %11, %10
  store i64 %xor.3, i64* %arrayidx4.3, align 8, !tbaa !11
  %arrayidx.4 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 5, i32 32
  %12 = bitcast i8* %arrayidx.4 to i64*
  %13 = load i64, i64* %12, align 8, !tbaa !11
  %arrayidx4.4 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 4, i32 2, i32 0
  %14 = load i64, i64* %arrayidx4.4, align 8, !tbaa !11
  %xor.4 = xor i64 %14, %13
  store i64 %xor.4, i64* %arrayidx4.4, align 8, !tbaa !11
  %arrayidx.5 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 5, i32 40
  %15 = bitcast i8* %arrayidx.5 to i64*
  %16 = load i64, i64* %15, align 8, !tbaa !11
  %arrayidx4.5 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 4, i32 2, i32 1
  %17 = load i64, i64* %arrayidx4.5, align 8, !tbaa !11
  %xor.5 = xor i64 %17, %16
  store i64 %xor.5, i64* %arrayidx4.5, align 8, !tbaa !11
  %arrayidx.6 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 5, i32 48
  %18 = bitcast i8* %arrayidx.6 to i64*
  %19 = load i64, i64* %18, align 8, !tbaa !11
  %arrayidx4.6 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 4, i32 3, i32 0
  %20 = load i64, i64* %arrayidx4.6, align 8, !tbaa !11
  %xor.6 = xor i64 %20, %19
  store i64 %xor.6, i64* %arrayidx4.6, align 8, !tbaa !11
  %arrayidx.7 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 5, i32 56
  %21 = bitcast i8* %arrayidx.7 to i64*
  %22 = load i64, i64* %21, align 8, !tbaa !11
  %arrayidx4.7 = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 4, i32 3, i32 1
  %23 = load i64, i64* %arrayidx4.7, align 8, !tbaa !11
  %xor.7 = xor i64 %23, %22
  store i64 %xor.7, i64* %arrayidx4.7, align 8, !tbaa !11
  %arrayidx12.phi.trans.insert.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 4, i32 7, i32 0
  %.pre.i = load i64, i64* %arrayidx12.phi.trans.insert.i, align 8, !tbaa !11
  %arrayidx34.phi.trans.insert.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 4, i32 5, i32 0
  %.pre4315.i = load i64, i64* %arrayidx34.phi.trans.insert.i, align 8, !tbaa !11
  %arrayidx4.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 4, i32 6, i32 0
  %arrayidx21.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 4, i32 4, i32 0
  %arrayidx4.1.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 4, i32 6, i32 1
  %arrayidx12.1.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 4, i32 7, i32 1
  %arrayidx21.1.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 4, i32 4, i32 1
  %arrayidx34.1.i = getelementptr inbounds %struct.hashState, %struct.hashState* %state, i32 0, i32 4, i32 5, i32 1
  %arrayidx4.i.promoted = load i64, i64* %arrayidx4.i, align 8, !tbaa !11
  %arrayidx21.i.promoted = load i64, i64* %arrayidx21.i, align 8, !tbaa !11
  %arrayidx4.1.i.promoted = load i64, i64* %arrayidx4.1.i, align 8, !tbaa !11
  %arrayidx12.1.i.promoted = load i64, i64* %arrayidx12.1.i, align 8, !tbaa !11
  %arrayidx21.1.i.promoted = load i64, i64* %arrayidx21.1.i, align 8, !tbaa !11
  %arrayidx34.1.i.promoted = load i64, i64* %arrayidx34.1.i, align 8, !tbaa !11
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.preheader.i, %entry
  %xor2951.i50 = phi i64 [ %xor.7, %entry ], [ %xor2951.i, %for.cond1.preheader.i ]
  %xor2992.1.i49 = phi i64 [ %xor.5, %entry ], [ %xor2992.1.i, %for.cond1.preheader.i ]
  %xor2942.i48 = phi i64 [ %xor.3, %entry ], [ %xor2942.i, %for.cond1.preheader.i ]
  %xor2965.i47 = phi i64 [ %arrayidx34.1.i.promoted, %entry ], [ %xor2965.i, %for.cond1.preheader.i ]
  %xor2983.1.i46 = phi i64 [ %xor.1, %entry ], [ %xor2983.1.i, %for.cond1.preheader.i ]
  %xor3006.1.i45 = phi i64 [ %arrayidx21.1.i.promoted, %entry ], [ %xor3006.1.i, %for.cond1.preheader.i ]
  %xor2974.i44 = phi i64 [ %arrayidx12.1.i.promoted, %entry ], [ %xor2974.i, %for.cond1.preheader.i ]
  %xor3015.1.i43 = phi i64 [ %arrayidx4.1.i.promoted, %entry ], [ %xor3015.1.i, %for.cond1.preheader.i ]
  %xor2992.i42 = phi i64 [ %xor.4, %entry ], [ %xor2992.i, %for.cond1.preheader.i ]
  %xor2983.i41 = phi i64 [ %xor, %entry ], [ %xor2983.i, %for.cond1.preheader.i ]
  %xor3006.i40 = phi i64 [ %arrayidx21.i.promoted, %entry ], [ %xor3006.i, %for.cond1.preheader.i ]
  %xor3015.i39 = phi i64 [ %arrayidx4.i.promoted, %entry ], [ %xor3015.i, %for.cond1.preheader.i ]
  %24 = phi i64 [ %xor.6, %entry ], [ %xor2951.1.i, %for.cond1.preheader.i ]
  %25 = phi i64 [ %xor.2, %entry ], [ %xor2942.1.i, %for.cond1.preheader.i ]
  %26 = phi i64 [ %.pre4315.i, %entry ], [ %xor2965.1.i, %for.cond1.preheader.i ]
  %27 = phi i64 [ %.pre.i, %entry ], [ %xor2974.1.i, %for.cond1.preheader.i ]
  %roundnumber.04314.i = phi i64 [ 0, %entry ], [ %add3042.i, %for.cond1.preheader.i ]
  %idxprom23.i = trunc i64 %roundnumber.04314.i to i32
  %arraydecay.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom23.i, i32 0
  %28 = bitcast i8* %arraydecay.i to i64*
  %neg.i = xor i64 %xor3015.i39, -1
  %neg13.i = xor i64 %27, -1
  %neg22.i = xor i64 %xor3006.i40, -1
  %29 = load i64, i64* %28, align 16, !tbaa !11
  %and.i = and i64 %29, %neg22.i
  %xor.i = xor i64 %xor2983.i41, %and.i
  %neg35.i = xor i64 %26, -1
  %arrayidx42.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom23.i, i32 16
  %30 = bitcast i8* %arrayidx42.i to i64*
  %31 = load i64, i64* %30, align 16, !tbaa !11
  %and43.i = and i64 %31, %neg35.i
  %xor48.i = xor i64 %and43.i, %25
  %and63.i = and i64 %xor2992.i42, %xor.i
  %xor64.i = xor i64 %and63.i, %29
  %and80.i = and i64 %xor48.i, %24
  %xor81.i = xor i64 %and80.i, %31
  %and90.i = and i64 %xor3006.i40, %neg.i
  %xor95.i = xor i64 %xor.i, %and90.i
  %and104.i = and i64 %26, %neg13.i
  %xor109.i = xor i64 %xor48.i, %and104.i
  %neg114.i = xor i64 %xor2992.i42, -1
  %and119.i = and i64 %xor3006.i40, %neg114.i
  %xor124.i = xor i64 %and119.i, %neg.i
  %neg129.i = xor i64 %24, -1
  %and134.i = and i64 %26, %neg129.i
  %xor139.i = xor i64 %and134.i, %neg13.i
  %and148.i = and i64 %xor95.i, %xor3006.i40
  %xor153.i = xor i64 %and148.i, %xor2992.i42
  %and162.i = and i64 %xor109.i, %26
  %xor167.i = xor i64 %and162.i, %24
  %neg176.i = xor i64 %and119.i, %xor3015.i39
  %and177.i = and i64 %neg176.i, %xor95.i
  %xor182.i = xor i64 %and177.i, %xor3006.i40
  %neg191.i = xor i64 %and134.i, %27
  %and192.i = and i64 %xor109.i, %neg191.i
  %xor197.i = xor i64 %and192.i, %26
  %or.i = or i64 %xor124.i, %xor153.i
  %xor210.i = xor i64 %or.i, %xor95.i
  %or219.i = or i64 %xor167.i, %xor139.i
  %xor224.i = xor i64 %or219.i, %xor109.i
  %and233.i = and i64 %xor182.i, %xor153.i
  %xor238.i = xor i64 %and233.i, %xor124.i
  %and247.i = and i64 %xor197.i, %xor167.i
  %and257.i = and i64 %xor210.i, %xor64.i
  %xor262.i = xor i64 %and257.i, %xor153.i
  %and267.i = and i64 %xor224.i, %xor81.i
  %xor277.i = xor i64 %xor182.i, %xor64.i
  %xor291.i = xor i64 %xor262.i, %xor224.i
  %xor272.i = xor i64 %xor277.i, %xor167.i
  %xor300.i = xor i64 %xor272.i, %and267.i
  %xor309.i = xor i64 %xor197.i, %xor81.i
  %xor282.i = xor i64 %xor309.i, %xor210.i
  %xor314.i = xor i64 %xor282.i, %xor238.i
  %xor252.i = xor i64 %xor210.i, %xor139.i
  %xor323.i = xor i64 %xor252.i, %and247.i
  %xor332.i = xor i64 %xor300.i, %xor210.i
  %xor341.i = xor i64 %xor314.i, %xor262.i
  %xor350.i = xor i64 %xor291.i, %xor277.i
  %xor355.i = xor i64 %xor350.i, %xor323.i
  %xor364.i = xor i64 %xor291.i, %xor238.i
  %and369.i = shl i64 %xor291.i, 1
  %shl.i = and i64 %and369.i, -6148914691236517206
  %and374.i = lshr i64 %xor291.i, 1
  %shr.i = and i64 %and374.i, 6148914691236517205
  %or375.i = or i64 %shl.i, %shr.i
  %and384.i = shl i64 %xor300.i, 1
  %shl385.i = and i64 %and384.i, -6148914691236517206
  %and390.i = lshr i64 %xor300.i, 1
  %shr391.i = and i64 %and390.i, 6148914691236517205
  %or392.i = or i64 %shl385.i, %shr391.i
  %and401.i = shl i64 %xor314.i, 1
  %shl402.i = and i64 %and401.i, -6148914691236517206
  %and407.i = lshr i64 %xor314.i, 1
  %shr408.i = and i64 %and407.i, 6148914691236517205
  %or409.i = or i64 %shl402.i, %shr408.i
  %and418.i = shl i64 %xor323.i, 1
  %shl419.i = and i64 %and418.i, -6148914691236517206
  %and424.i = lshr i64 %xor323.i, 1
  %shr425.i = and i64 %and424.i, 6148914691236517205
  %or426.i = or i64 %shl419.i, %shr425.i
  %neg.1.i = xor i64 %xor3015.1.i43, -1
  %neg13.1.i = xor i64 %xor2974.i44, -1
  %neg22.1.i = xor i64 %xor3006.1.i45, -1
  %arrayidx26.1.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom23.i, i32 8
  %32 = bitcast i8* %arrayidx26.1.i to i64*
  %33 = load i64, i64* %32, align 8, !tbaa !11
  %and.1.i = and i64 %33, %neg22.1.i
  %xor.1.i = xor i64 %xor2983.1.i46, %and.1.i
  %neg35.1.i = xor i64 %xor2965.i47, -1
  %arrayidx42.1.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom23.i, i32 24
  %34 = bitcast i8* %arrayidx42.1.i to i64*
  %35 = load i64, i64* %34, align 8, !tbaa !11
  %and43.1.i = and i64 %35, %neg35.1.i
  %xor48.1.i = xor i64 %xor2942.i48, %and43.1.i
  %and63.1.i = and i64 %xor2992.1.i49, %xor.1.i
  %xor64.1.i = xor i64 %and63.1.i, %33
  %and80.1.i = and i64 %xor2951.i50, %xor48.1.i
  %xor81.1.i = xor i64 %and80.1.i, %35
  %and90.1.i = and i64 %xor3006.1.i45, %neg.1.i
  %xor95.1.i = xor i64 %xor.1.i, %and90.1.i
  %and104.1.i = and i64 %xor2965.i47, %neg13.1.i
  %xor109.1.i = xor i64 %xor48.1.i, %and104.1.i
  %neg114.1.i = xor i64 %xor2992.1.i49, -1
  %and119.1.i = and i64 %xor3006.1.i45, %neg114.1.i
  %xor124.1.i = xor i64 %and119.1.i, %neg.1.i
  %neg129.1.i = xor i64 %xor2951.i50, -1
  %and134.1.i = and i64 %xor2965.i47, %neg129.1.i
  %xor139.1.i = xor i64 %and134.1.i, %neg13.1.i
  %and148.1.i = and i64 %xor95.1.i, %xor3006.1.i45
  %xor153.1.i = xor i64 %xor2992.1.i49, %and148.1.i
  %and162.1.i = and i64 %xor109.1.i, %xor2965.i47
  %xor167.1.i = xor i64 %and162.1.i, %xor2951.i50
  %neg176.1.i = xor i64 %and119.1.i, %xor3015.1.i43
  %and177.1.i = and i64 %neg176.1.i, %xor95.1.i
  %xor182.1.i = xor i64 %and177.1.i, %xor3006.1.i45
  %neg191.1.i = xor i64 %and134.1.i, %xor2974.i44
  %and192.1.i = and i64 %neg191.1.i, %xor109.1.i
  %xor197.1.i = xor i64 %and192.1.i, %xor2965.i47
  %or.1.i = or i64 %xor124.1.i, %xor153.1.i
  %xor210.1.i = xor i64 %or.1.i, %xor95.1.i
  %or219.1.i = or i64 %xor139.1.i, %xor167.1.i
  %xor224.1.i = xor i64 %or219.1.i, %xor109.1.i
  %and233.1.i = and i64 %xor182.1.i, %xor153.1.i
  %xor238.1.i = xor i64 %and233.1.i, %xor124.1.i
  %and247.1.i = and i64 %xor197.1.i, %xor167.1.i
  %and257.1.i = and i64 %xor210.1.i, %xor64.1.i
  %xor262.1.i = xor i64 %and257.1.i, %xor153.1.i
  %and267.1.i = and i64 %xor224.1.i, %xor81.1.i
  %xor277.1.i = xor i64 %xor182.1.i, %xor64.1.i
  %xor291.1.i = xor i64 %xor262.1.i, %xor224.1.i
  %xor272.1.i = xor i64 %xor277.1.i, %xor167.1.i
  %xor300.1.i = xor i64 %xor272.1.i, %and267.1.i
  %xor309.1.i = xor i64 %xor210.1.i, %xor81.1.i
  %xor282.1.i = xor i64 %xor309.1.i, %xor197.1.i
  %xor314.1.i = xor i64 %xor282.1.i, %xor238.1.i
  %xor252.1.i = xor i64 %xor210.1.i, %xor139.1.i
  %xor323.1.i = xor i64 %xor252.1.i, %and247.1.i
  %xor332.1.i = xor i64 %xor300.1.i, %xor210.1.i
  %xor341.1.i = xor i64 %xor314.1.i, %xor262.1.i
  %xor350.1.i = xor i64 %xor291.1.i, %xor277.1.i
  %xor355.1.i = xor i64 %xor350.1.i, %xor323.1.i
  %xor364.1.i = xor i64 %xor291.1.i, %xor238.1.i
  %and369.1.i = shl i64 %xor291.1.i, 1
  %shl.1.i = and i64 %and369.1.i, -6148914691236517206
  %and374.1.i = lshr i64 %xor291.1.i, 1
  %shr.1.i = and i64 %and374.1.i, 6148914691236517205
  %or375.1.i = or i64 %shl.1.i, %shr.1.i
  %and384.1.i = shl i64 %xor300.1.i, 1
  %shl385.1.i = and i64 %and384.1.i, -6148914691236517206
  %and390.1.i = lshr i64 %xor300.1.i, 1
  %shr391.1.i = and i64 %and390.1.i, 6148914691236517205
  %or392.1.i = or i64 %shl385.1.i, %shr391.1.i
  %and401.1.i = shl i64 %xor314.1.i, 1
  %shl402.1.i = and i64 %and401.1.i, -6148914691236517206
  %and407.1.i = lshr i64 %xor314.1.i, 1
  %shr408.1.i = and i64 %and407.1.i, 6148914691236517205
  %or409.1.i = or i64 %shl402.1.i, %shr408.1.i
  %and418.1.i = shl i64 %xor323.1.i, 1
  %shl419.1.i = and i64 %and418.1.i, -6148914691236517206
  %and424.1.i = lshr i64 %xor323.1.i, 1
  %shr425.1.i = and i64 %and424.1.i, 6148914691236517205
  %or426.1.i = or i64 %shl419.1.i, %shr425.1.i
  %idxprom458.i = add i32 %idxprom23.i, 1
  %arraydecay460.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom458.i, i32 0
  %36 = bitcast i8* %arraydecay460.i to i64*
  %neg438.i = xor i64 %xor364.i, -1
  %neg447.i = xor i64 %or426.i, -1
  %neg456.i = xor i64 %xor355.i, -1
  %37 = load i64, i64* %36, align 16, !tbaa !11
  %and463.i = and i64 %37, %neg456.i
  %xor468.i = xor i64 %and463.i, %xor332.i
  %neg473.i = xor i64 %or409.i, -1
  %arrayidx480.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom458.i, i32 16
  %38 = bitcast i8* %arrayidx480.i to i64*
  %39 = load i64, i64* %38, align 16, !tbaa !11
  %and481.i = and i64 %39, %neg473.i
  %xor486.i = xor i64 %and481.i, %or375.i
  %and501.i = and i64 %xor468.i, %xor341.i
  %xor502.i = xor i64 %and501.i, %37
  %and518.i = and i64 %xor486.i, %or392.i
  %xor519.i = xor i64 %and518.i, %39
  %and528.i = and i64 %xor355.i, %neg438.i
  %xor533.i = xor i64 %xor468.i, %and528.i
  %and542.i = and i64 %or409.i, %neg447.i
  %xor547.i = xor i64 %xor486.i, %and542.i
  %neg552.i = xor i64 %xor341.i, -1
  %and557.i = and i64 %xor355.i, %neg552.i
  %xor562.i = xor i64 %and557.i, %neg438.i
  %neg567.i = xor i64 %or392.i, -1
  %and572.i = and i64 %or409.i, %neg567.i
  %xor577.i = xor i64 %and572.i, %neg447.i
  %and586.i = and i64 %xor533.i, %xor355.i
  %xor591.i = xor i64 %and586.i, %xor341.i
  %and600.i = and i64 %xor547.i, %or409.i
  %xor605.i = xor i64 %and600.i, %or392.i
  %neg614.i = xor i64 %and557.i, %xor364.i
  %and615.i = and i64 %xor533.i, %neg614.i
  %xor620.i = xor i64 %and615.i, %xor355.i
  %neg629.i = xor i64 %and572.i, %or426.i
  %and630.i = and i64 %xor547.i, %neg629.i
  %xor635.i = xor i64 %and630.i, %or409.i
  %or644.i = or i64 %xor591.i, %xor562.i
  %xor649.i = xor i64 %or644.i, %xor533.i
  %or658.i = or i64 %xor605.i, %xor577.i
  %xor663.i = xor i64 %or658.i, %xor547.i
  %and672.i = and i64 %xor620.i, %xor591.i
  %xor677.i = xor i64 %and672.i, %xor562.i
  %and686.i = and i64 %xor635.i, %xor605.i
  %xor691.i = xor i64 %and686.i, %xor577.i
  %and696.i = and i64 %xor649.i, %xor502.i
  %xor701.i = xor i64 %and696.i, %xor591.i
  %and706.i = and i64 %xor663.i, %xor519.i
  %xor716.i = xor i64 %xor620.i, %xor502.i
  %xor730.i = xor i64 %xor701.i, %xor663.i
  %xor711.i = xor i64 %xor716.i, %xor605.i
  %xor739.i = xor i64 %xor711.i, %and706.i
  %xor748.i = xor i64 %xor635.i, %xor519.i
  %xor721.i = xor i64 %xor748.i, %xor649.i
  %xor753.i = xor i64 %xor721.i, %xor677.i
  %xor762.i = xor i64 %xor691.i, %xor649.i
  %xor771.i = xor i64 %xor739.i, %xor649.i
  %xor780.i = xor i64 %xor701.i, %xor753.i
  %xor789.i = xor i64 %xor762.i, %xor716.i
  %xor794.i = xor i64 %xor789.i, %xor730.i
  %xor803.i = xor i64 %xor730.i, %xor677.i
  %and808.i = shl i64 %xor730.i, 2
  %shl809.i = and i64 %and808.i, -3689348814741910324
  %and814.i = lshr i64 %xor730.i, 2
  %shr815.i = and i64 %and814.i, 3689348814741910323
  %or816.i = or i64 %shl809.i, %shr815.i
  %and825.i = shl i64 %xor739.i, 2
  %shl826.i = and i64 %and825.i, -3689348814741910324
  %and831.i = lshr i64 %xor739.i, 2
  %shr832.i = and i64 %and831.i, 3689348814741910323
  %or833.i = or i64 %shl826.i, %shr832.i
  %and842.i = shl i64 %xor753.i, 2
  %shl843.i = and i64 %and842.i, -3689348814741910324
  %and848.i = lshr i64 %xor753.i, 2
  %shr849.i = and i64 %and848.i, 3689348814741910323
  %or850.i = or i64 %shl843.i, %shr849.i
  %and859.i = shl i64 %xor762.i, 2
  %shl860.i = and i64 %and859.i, -3689348814741910324
  %and865.i = lshr i64 %xor762.i, 2
  %shr866.i = and i64 %and865.i, 3689348814741910323
  %or867.i = or i64 %shl860.i, %shr866.i
  %neg438.1.i = xor i64 %xor364.1.i, -1
  %neg447.1.i = xor i64 %or426.1.i, -1
  %neg456.1.i = xor i64 %xor355.1.i, -1
  %arrayidx462.1.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom458.i, i32 8
  %40 = bitcast i8* %arrayidx462.1.i to i64*
  %41 = load i64, i64* %40, align 8, !tbaa !11
  %and463.1.i = and i64 %41, %neg456.1.i
  %xor468.1.i = xor i64 %and463.1.i, %xor332.1.i
  %neg473.1.i = xor i64 %or409.1.i, -1
  %arrayidx480.1.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom458.i, i32 24
  %42 = bitcast i8* %arrayidx480.1.i to i64*
  %43 = load i64, i64* %42, align 8, !tbaa !11
  %and481.1.i = and i64 %43, %neg473.1.i
  %xor486.1.i = xor i64 %and481.1.i, %or375.1.i
  %and501.1.i = and i64 %xor468.1.i, %xor341.1.i
  %xor502.1.i = xor i64 %and501.1.i, %41
  %and518.1.i = and i64 %xor486.1.i, %or392.1.i
  %xor519.1.i = xor i64 %and518.1.i, %43
  %and528.1.i = and i64 %xor355.1.i, %neg438.1.i
  %xor533.1.i = xor i64 %xor468.1.i, %and528.1.i
  %and542.1.i = and i64 %or409.1.i, %neg447.1.i
  %xor547.1.i = xor i64 %xor486.1.i, %and542.1.i
  %neg552.1.i = xor i64 %xor341.1.i, -1
  %and557.1.i = and i64 %xor355.1.i, %neg552.1.i
  %xor562.1.i = xor i64 %and557.1.i, %neg438.1.i
  %neg567.1.i = xor i64 %or392.1.i, -1
  %and572.1.i = and i64 %or409.1.i, %neg567.1.i
  %xor577.1.i = xor i64 %and572.1.i, %neg447.1.i
  %and586.1.i = and i64 %xor533.1.i, %xor355.1.i
  %xor591.1.i = xor i64 %and586.1.i, %xor341.1.i
  %and600.1.i = and i64 %xor547.1.i, %or409.1.i
  %xor605.1.i = xor i64 %and600.1.i, %or392.1.i
  %neg614.1.i = xor i64 %and557.1.i, %xor364.1.i
  %and615.1.i = and i64 %xor533.1.i, %neg614.1.i
  %xor620.1.i = xor i64 %and615.1.i, %xor355.1.i
  %neg629.1.i = xor i64 %and572.1.i, %or426.1.i
  %and630.1.i = and i64 %xor547.1.i, %neg629.1.i
  %xor635.1.i = xor i64 %and630.1.i, %or409.1.i
  %or644.1.i = or i64 %xor591.1.i, %xor562.1.i
  %xor649.1.i = xor i64 %or644.1.i, %xor533.1.i
  %or658.1.i = or i64 %xor605.1.i, %xor577.1.i
  %xor663.1.i = xor i64 %or658.1.i, %xor547.1.i
  %and672.1.i = and i64 %xor620.1.i, %xor591.1.i
  %xor677.1.i = xor i64 %and672.1.i, %xor562.1.i
  %and686.1.i = and i64 %xor635.1.i, %xor605.1.i
  %xor691.1.i = xor i64 %and686.1.i, %xor577.1.i
  %and696.1.i = and i64 %xor649.1.i, %xor502.1.i
  %xor701.1.i = xor i64 %and696.1.i, %xor591.1.i
  %and706.1.i = and i64 %xor663.1.i, %xor519.1.i
  %xor716.1.i = xor i64 %xor620.1.i, %xor502.1.i
  %xor730.1.i = xor i64 %xor701.1.i, %xor663.1.i
  %xor711.1.i = xor i64 %xor716.1.i, %xor605.1.i
  %xor739.1.i = xor i64 %xor711.1.i, %and706.1.i
  %xor748.1.i = xor i64 %xor635.1.i, %xor519.1.i
  %xor721.1.i = xor i64 %xor748.1.i, %xor649.1.i
  %xor753.1.i = xor i64 %xor721.1.i, %xor677.1.i
  %xor762.1.i = xor i64 %xor691.1.i, %xor649.1.i
  %xor771.1.i = xor i64 %xor739.1.i, %xor649.1.i
  %xor780.1.i = xor i64 %xor701.1.i, %xor753.1.i
  %xor789.1.i = xor i64 %xor762.1.i, %xor716.1.i
  %xor794.1.i = xor i64 %xor789.1.i, %xor730.1.i
  %xor803.1.i = xor i64 %xor730.1.i, %xor677.1.i
  %and808.1.i = shl i64 %xor730.1.i, 2
  %shl809.1.i = and i64 %and808.1.i, -3689348814741910324
  %and814.1.i = lshr i64 %xor730.1.i, 2
  %shr815.1.i = and i64 %and814.1.i, 3689348814741910323
  %or816.1.i = or i64 %shl809.1.i, %shr815.1.i
  %and825.1.i = shl i64 %xor739.1.i, 2
  %shl826.1.i = and i64 %and825.1.i, -3689348814741910324
  %and831.1.i = lshr i64 %xor739.1.i, 2
  %shr832.1.i = and i64 %and831.1.i, 3689348814741910323
  %or833.1.i = or i64 %shl826.1.i, %shr832.1.i
  %and842.1.i = shl i64 %xor753.1.i, 2
  %shl843.1.i = and i64 %and842.1.i, -3689348814741910324
  %and848.1.i = lshr i64 %xor753.1.i, 2
  %shr849.1.i = and i64 %and848.1.i, 3689348814741910323
  %or850.1.i = or i64 %shl843.1.i, %shr849.1.i
  %and859.1.i = shl i64 %xor762.1.i, 2
  %shl860.1.i = and i64 %and859.1.i, -3689348814741910324
  %and865.1.i = lshr i64 %xor762.1.i, 2
  %shr866.1.i = and i64 %and865.1.i, 3689348814741910323
  %or867.1.i = or i64 %shl860.1.i, %shr866.1.i
  %idxprom902.i = add i32 %idxprom23.i, 2
  %arraydecay904.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom902.i, i32 0
  %44 = bitcast i8* %arraydecay904.i to i64*
  %neg882.i = xor i64 %xor803.i, -1
  %neg891.i = xor i64 %or867.i, -1
  %neg900.i = xor i64 %xor794.i, -1
  %45 = load i64, i64* %44, align 16, !tbaa !11
  %and907.i = and i64 %45, %neg900.i
  %xor912.i = xor i64 %and907.i, %xor771.i
  %neg917.i = xor i64 %or850.i, -1
  %arrayidx924.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom902.i, i32 16
  %46 = bitcast i8* %arrayidx924.i to i64*
  %47 = load i64, i64* %46, align 16, !tbaa !11
  %and925.i = and i64 %47, %neg917.i
  %xor930.i = xor i64 %and925.i, %or816.i
  %and945.i = and i64 %xor912.i, %xor780.i
  %xor946.i = xor i64 %and945.i, %45
  %and962.i = and i64 %xor930.i, %or833.i
  %xor963.i = xor i64 %and962.i, %47
  %and972.i = and i64 %xor794.i, %neg882.i
  %xor977.i = xor i64 %xor912.i, %and972.i
  %and986.i = and i64 %or850.i, %neg891.i
  %xor991.i = xor i64 %xor930.i, %and986.i
  %neg996.i = xor i64 %xor780.i, -1
  %and1001.i = and i64 %xor794.i, %neg996.i
  %xor1006.i = xor i64 %and1001.i, %neg882.i
  %neg1011.i = xor i64 %or833.i, -1
  %and1016.i = and i64 %or850.i, %neg1011.i
  %xor1021.i = xor i64 %and1016.i, %neg891.i
  %and1030.i = and i64 %xor977.i, %xor794.i
  %xor1035.i = xor i64 %and1030.i, %xor780.i
  %and1044.i = and i64 %xor991.i, %or850.i
  %xor1049.i = xor i64 %and1044.i, %or833.i
  %neg1058.i = xor i64 %and1001.i, %xor803.i
  %and1059.i = and i64 %xor977.i, %neg1058.i
  %xor1064.i = xor i64 %and1059.i, %xor794.i
  %neg1073.i = xor i64 %and1016.i, %or867.i
  %and1074.i = and i64 %xor991.i, %neg1073.i
  %xor1079.i = xor i64 %and1074.i, %or850.i
  %or1088.i = or i64 %xor1035.i, %xor1006.i
  %xor1093.i = xor i64 %or1088.i, %xor977.i
  %or1102.i = or i64 %xor1049.i, %xor1021.i
  %xor1107.i = xor i64 %or1102.i, %xor991.i
  %and1116.i = and i64 %xor1064.i, %xor1035.i
  %xor1121.i = xor i64 %and1116.i, %xor1006.i
  %and1130.i = and i64 %xor1079.i, %xor1049.i
  %xor1135.i = xor i64 %and1130.i, %xor1021.i
  %and1140.i = and i64 %xor1093.i, %xor946.i
  %xor1145.i = xor i64 %and1140.i, %xor1035.i
  %and1150.i = and i64 %xor1107.i, %xor963.i
  %xor1160.i = xor i64 %xor1064.i, %xor946.i
  %xor1174.i = xor i64 %xor1145.i, %xor1107.i
  %xor1155.i = xor i64 %xor1160.i, %xor1049.i
  %xor1183.i = xor i64 %xor1155.i, %and1150.i
  %xor1192.i = xor i64 %xor1079.i, %xor963.i
  %xor1165.i = xor i64 %xor1192.i, %xor1093.i
  %xor1197.i = xor i64 %xor1165.i, %xor1121.i
  %xor1206.i = xor i64 %xor1135.i, %xor1093.i
  %xor1215.i = xor i64 %xor1183.i, %xor1093.i
  %xor1224.i = xor i64 %xor1145.i, %xor1197.i
  %xor1233.i = xor i64 %xor1206.i, %xor1160.i
  %xor1238.i = xor i64 %xor1233.i, %xor1174.i
  %xor1247.i = xor i64 %xor1174.i, %xor1121.i
  %and1252.i = shl i64 %xor1174.i, 4
  %shl1253.i = and i64 %and1252.i, -1085102592571150096
  %and1258.i = lshr i64 %xor1174.i, 4
  %shr1259.i = and i64 %and1258.i, 1085102592571150095
  %or1260.i = or i64 %shl1253.i, %shr1259.i
  %and1269.i = shl i64 %xor1183.i, 4
  %shl1270.i = and i64 %and1269.i, -1085102592571150096
  %and1275.i = lshr i64 %xor1183.i, 4
  %shr1276.i = and i64 %and1275.i, 1085102592571150095
  %or1277.i = or i64 %shl1270.i, %shr1276.i
  %and1286.i = shl i64 %xor1197.i, 4
  %shl1287.i = and i64 %and1286.i, -1085102592571150096
  %and1292.i = lshr i64 %xor1197.i, 4
  %shr1293.i = and i64 %and1292.i, 1085102592571150095
  %or1294.i = or i64 %shl1287.i, %shr1293.i
  %and1303.i = shl i64 %xor1206.i, 4
  %shl1304.i = and i64 %and1303.i, -1085102592571150096
  %and1309.i = lshr i64 %xor1206.i, 4
  %shr1310.i = and i64 %and1309.i, 1085102592571150095
  %or1311.i = or i64 %shl1304.i, %shr1310.i
  %neg882.1.i = xor i64 %xor803.1.i, -1
  %neg891.1.i = xor i64 %or867.1.i, -1
  %neg900.1.i = xor i64 %xor794.1.i, -1
  %arrayidx906.1.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom902.i, i32 8
  %48 = bitcast i8* %arrayidx906.1.i to i64*
  %49 = load i64, i64* %48, align 8, !tbaa !11
  %and907.1.i = and i64 %49, %neg900.1.i
  %xor912.1.i = xor i64 %and907.1.i, %xor771.1.i
  %neg917.1.i = xor i64 %or850.1.i, -1
  %arrayidx924.1.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom902.i, i32 24
  %50 = bitcast i8* %arrayidx924.1.i to i64*
  %51 = load i64, i64* %50, align 8, !tbaa !11
  %and925.1.i = and i64 %51, %neg917.1.i
  %xor930.1.i = xor i64 %and925.1.i, %or816.1.i
  %and945.1.i = and i64 %xor912.1.i, %xor780.1.i
  %xor946.1.i = xor i64 %and945.1.i, %49
  %and962.1.i = and i64 %xor930.1.i, %or833.1.i
  %xor963.1.i = xor i64 %and962.1.i, %51
  %and972.1.i = and i64 %xor794.1.i, %neg882.1.i
  %xor977.1.i = xor i64 %xor912.1.i, %and972.1.i
  %and986.1.i = and i64 %or850.1.i, %neg891.1.i
  %xor991.1.i = xor i64 %xor930.1.i, %and986.1.i
  %neg996.1.i = xor i64 %xor780.1.i, -1
  %and1001.1.i = and i64 %xor794.1.i, %neg996.1.i
  %xor1006.1.i = xor i64 %and1001.1.i, %neg882.1.i
  %neg1011.1.i = xor i64 %or833.1.i, -1
  %and1016.1.i = and i64 %or850.1.i, %neg1011.1.i
  %xor1021.1.i = xor i64 %and1016.1.i, %neg891.1.i
  %and1030.1.i = and i64 %xor977.1.i, %xor794.1.i
  %xor1035.1.i = xor i64 %and1030.1.i, %xor780.1.i
  %and1044.1.i = and i64 %xor991.1.i, %or850.1.i
  %xor1049.1.i = xor i64 %and1044.1.i, %or833.1.i
  %neg1058.1.i = xor i64 %and1001.1.i, %xor803.1.i
  %and1059.1.i = and i64 %xor977.1.i, %neg1058.1.i
  %xor1064.1.i = xor i64 %and1059.1.i, %xor794.1.i
  %neg1073.1.i = xor i64 %and1016.1.i, %or867.1.i
  %and1074.1.i = and i64 %xor991.1.i, %neg1073.1.i
  %xor1079.1.i = xor i64 %and1074.1.i, %or850.1.i
  %or1088.1.i = or i64 %xor1035.1.i, %xor1006.1.i
  %xor1093.1.i = xor i64 %or1088.1.i, %xor977.1.i
  %or1102.1.i = or i64 %xor1049.1.i, %xor1021.1.i
  %xor1107.1.i = xor i64 %or1102.1.i, %xor991.1.i
  %and1116.1.i = and i64 %xor1064.1.i, %xor1035.1.i
  %xor1121.1.i = xor i64 %and1116.1.i, %xor1006.1.i
  %and1130.1.i = and i64 %xor1079.1.i, %xor1049.1.i
  %xor1135.1.i = xor i64 %and1130.1.i, %xor1021.1.i
  %and1140.1.i = and i64 %xor1093.1.i, %xor946.1.i
  %xor1145.1.i = xor i64 %and1140.1.i, %xor1035.1.i
  %and1150.1.i = and i64 %xor1107.1.i, %xor963.1.i
  %xor1160.1.i = xor i64 %xor1064.1.i, %xor946.1.i
  %xor1174.1.i = xor i64 %xor1145.1.i, %xor1107.1.i
  %xor1155.1.i = xor i64 %xor1160.1.i, %xor1049.1.i
  %xor1183.1.i = xor i64 %xor1155.1.i, %and1150.1.i
  %xor1192.1.i = xor i64 %xor1079.1.i, %xor963.1.i
  %xor1165.1.i = xor i64 %xor1192.1.i, %xor1093.1.i
  %xor1197.1.i = xor i64 %xor1165.1.i, %xor1121.1.i
  %xor1206.1.i = xor i64 %xor1135.1.i, %xor1093.1.i
  %xor1215.1.i = xor i64 %xor1183.1.i, %xor1093.1.i
  %xor1224.1.i = xor i64 %xor1145.1.i, %xor1197.1.i
  %xor1233.1.i = xor i64 %xor1206.1.i, %xor1160.1.i
  %xor1238.1.i = xor i64 %xor1233.1.i, %xor1174.1.i
  %xor1247.1.i = xor i64 %xor1174.1.i, %xor1121.1.i
  %and1252.1.i = shl i64 %xor1174.1.i, 4
  %shl1253.1.i = and i64 %and1252.1.i, -1085102592571150096
  %and1258.1.i = lshr i64 %xor1174.1.i, 4
  %shr1259.1.i = and i64 %and1258.1.i, 1085102592571150095
  %or1260.1.i = or i64 %shl1253.1.i, %shr1259.1.i
  %and1269.1.i = shl i64 %xor1183.1.i, 4
  %shl1270.1.i = and i64 %and1269.1.i, -1085102592571150096
  %and1275.1.i = lshr i64 %xor1183.1.i, 4
  %shr1276.1.i = and i64 %and1275.1.i, 1085102592571150095
  %or1277.1.i = or i64 %shl1270.1.i, %shr1276.1.i
  %and1286.1.i = shl i64 %xor1197.1.i, 4
  %shl1287.1.i = and i64 %and1286.1.i, -1085102592571150096
  %and1292.1.i = lshr i64 %xor1197.1.i, 4
  %shr1293.1.i = and i64 %and1292.1.i, 1085102592571150095
  %or1294.1.i = or i64 %shl1287.1.i, %shr1293.1.i
  %and1303.1.i = shl i64 %xor1206.1.i, 4
  %shl1304.1.i = and i64 %and1303.1.i, -1085102592571150096
  %and1309.1.i = lshr i64 %xor1206.1.i, 4
  %shr1310.1.i = and i64 %and1309.1.i, 1085102592571150095
  %or1311.1.i = or i64 %shl1304.1.i, %shr1310.1.i
  %idxprom1346.i = add i32 %idxprom23.i, 3
  %arraydecay1348.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom1346.i, i32 0
  %52 = bitcast i8* %arraydecay1348.i to i64*
  %neg1326.i = xor i64 %xor1247.i, -1
  %neg1335.i = xor i64 %or1311.i, -1
  %neg1344.i = xor i64 %xor1238.i, -1
  %53 = load i64, i64* %52, align 16, !tbaa !11
  %and1351.i = and i64 %53, %neg1344.i
  %xor1356.i = xor i64 %and1351.i, %xor1215.i
  %neg1361.i = xor i64 %or1294.i, -1
  %arrayidx1368.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom1346.i, i32 16
  %54 = bitcast i8* %arrayidx1368.i to i64*
  %55 = load i64, i64* %54, align 16, !tbaa !11
  %and1369.i = and i64 %55, %neg1361.i
  %xor1374.i = xor i64 %and1369.i, %or1260.i
  %and1389.i = and i64 %xor1356.i, %xor1224.i
  %xor1390.i = xor i64 %and1389.i, %53
  %and1406.i = and i64 %xor1374.i, %or1277.i
  %xor1407.i = xor i64 %and1406.i, %55
  %and1416.i = and i64 %xor1238.i, %neg1326.i
  %xor1421.i = xor i64 %xor1356.i, %and1416.i
  %and1430.i = and i64 %or1294.i, %neg1335.i
  %xor1435.i = xor i64 %xor1374.i, %and1430.i
  %neg1440.i = xor i64 %xor1224.i, -1
  %and1445.i = and i64 %xor1238.i, %neg1440.i
  %xor1450.i = xor i64 %and1445.i, %neg1326.i
  %neg1455.i = xor i64 %or1277.i, -1
  %and1460.i = and i64 %or1294.i, %neg1455.i
  %xor1465.i = xor i64 %and1460.i, %neg1335.i
  %and1474.i = and i64 %xor1421.i, %xor1238.i
  %xor1479.i = xor i64 %and1474.i, %xor1224.i
  %and1488.i = and i64 %xor1435.i, %or1294.i
  %xor1493.i = xor i64 %and1488.i, %or1277.i
  %neg1502.i = xor i64 %and1445.i, %xor1247.i
  %and1503.i = and i64 %xor1421.i, %neg1502.i
  %xor1508.i = xor i64 %and1503.i, %xor1238.i
  %neg1517.i = xor i64 %and1460.i, %or1311.i
  %and1518.i = and i64 %xor1435.i, %neg1517.i
  %xor1523.i = xor i64 %and1518.i, %or1294.i
  %or1532.i = or i64 %xor1479.i, %xor1450.i
  %xor1537.i = xor i64 %or1532.i, %xor1421.i
  %or1546.i = or i64 %xor1493.i, %xor1465.i
  %xor1551.i = xor i64 %or1546.i, %xor1435.i
  %and1560.i = and i64 %xor1508.i, %xor1479.i
  %xor1565.i = xor i64 %and1560.i, %xor1450.i
  %and1574.i = and i64 %xor1523.i, %xor1493.i
  %xor1579.i = xor i64 %and1574.i, %xor1465.i
  %and1584.i = and i64 %xor1537.i, %xor1390.i
  %xor1589.i = xor i64 %and1584.i, %xor1479.i
  %and1594.i = and i64 %xor1551.i, %xor1407.i
  %xor1604.i = xor i64 %xor1508.i, %xor1390.i
  %xor1618.i = xor i64 %xor1589.i, %xor1551.i
  %xor1599.i = xor i64 %xor1604.i, %xor1493.i
  %xor1627.i = xor i64 %xor1599.i, %and1594.i
  %xor1636.i = xor i64 %xor1523.i, %xor1407.i
  %xor1609.i = xor i64 %xor1636.i, %xor1537.i
  %xor1641.i = xor i64 %xor1609.i, %xor1565.i
  %xor1650.i = xor i64 %xor1579.i, %xor1537.i
  %xor1659.i = xor i64 %xor1627.i, %xor1537.i
  %xor1668.i = xor i64 %xor1589.i, %xor1641.i
  %xor1677.i = xor i64 %xor1650.i, %xor1604.i
  %xor1682.i = xor i64 %xor1677.i, %xor1618.i
  %xor1691.i = xor i64 %xor1618.i, %xor1565.i
  %and1696.i = shl i64 %xor1618.i, 8
  %shl1697.i = and i64 %and1696.i, -71777214294589696
  %and1702.i = lshr i64 %xor1618.i, 8
  %shr1703.i = and i64 %and1702.i, 71777214294589695
  %or1704.i = or i64 %shl1697.i, %shr1703.i
  %and1713.i = shl i64 %xor1627.i, 8
  %shl1714.i = and i64 %and1713.i, -71777214294589696
  %and1719.i = lshr i64 %xor1627.i, 8
  %shr1720.i = and i64 %and1719.i, 71777214294589695
  %or1721.i = or i64 %shl1714.i, %shr1720.i
  %and1730.i = shl i64 %xor1641.i, 8
  %shl1731.i = and i64 %and1730.i, -71777214294589696
  %and1736.i = lshr i64 %xor1641.i, 8
  %shr1737.i = and i64 %and1736.i, 71777214294589695
  %or1738.i = or i64 %shl1731.i, %shr1737.i
  %and1747.i = shl i64 %xor1650.i, 8
  %shl1748.i = and i64 %and1747.i, -71777214294589696
  %and1753.i = lshr i64 %xor1650.i, 8
  %shr1754.i = and i64 %and1753.i, 71777214294589695
  %or1755.i = or i64 %shl1748.i, %shr1754.i
  %neg1326.1.i = xor i64 %xor1247.1.i, -1
  %neg1335.1.i = xor i64 %or1311.1.i, -1
  %neg1344.1.i = xor i64 %xor1238.1.i, -1
  %arrayidx1350.1.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom1346.i, i32 8
  %56 = bitcast i8* %arrayidx1350.1.i to i64*
  %57 = load i64, i64* %56, align 8, !tbaa !11
  %and1351.1.i = and i64 %57, %neg1344.1.i
  %xor1356.1.i = xor i64 %and1351.1.i, %xor1215.1.i
  %neg1361.1.i = xor i64 %or1294.1.i, -1
  %arrayidx1368.1.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom1346.i, i32 24
  %58 = bitcast i8* %arrayidx1368.1.i to i64*
  %59 = load i64, i64* %58, align 8, !tbaa !11
  %and1369.1.i = and i64 %59, %neg1361.1.i
  %xor1374.1.i = xor i64 %and1369.1.i, %or1260.1.i
  %and1389.1.i = and i64 %xor1356.1.i, %xor1224.1.i
  %xor1390.1.i = xor i64 %and1389.1.i, %57
  %and1406.1.i = and i64 %xor1374.1.i, %or1277.1.i
  %xor1407.1.i = xor i64 %and1406.1.i, %59
  %and1416.1.i = and i64 %xor1238.1.i, %neg1326.1.i
  %xor1421.1.i = xor i64 %xor1356.1.i, %and1416.1.i
  %and1430.1.i = and i64 %or1294.1.i, %neg1335.1.i
  %xor1435.1.i = xor i64 %xor1374.1.i, %and1430.1.i
  %neg1440.1.i = xor i64 %xor1224.1.i, -1
  %and1445.1.i = and i64 %xor1238.1.i, %neg1440.1.i
  %xor1450.1.i = xor i64 %and1445.1.i, %neg1326.1.i
  %neg1455.1.i = xor i64 %or1277.1.i, -1
  %and1460.1.i = and i64 %or1294.1.i, %neg1455.1.i
  %xor1465.1.i = xor i64 %and1460.1.i, %neg1335.1.i
  %and1474.1.i = and i64 %xor1421.1.i, %xor1238.1.i
  %xor1479.1.i = xor i64 %and1474.1.i, %xor1224.1.i
  %and1488.1.i = and i64 %xor1435.1.i, %or1294.1.i
  %xor1493.1.i = xor i64 %and1488.1.i, %or1277.1.i
  %neg1502.1.i = xor i64 %and1445.1.i, %xor1247.1.i
  %and1503.1.i = and i64 %xor1421.1.i, %neg1502.1.i
  %xor1508.1.i = xor i64 %and1503.1.i, %xor1238.1.i
  %neg1517.1.i = xor i64 %and1460.1.i, %or1311.1.i
  %and1518.1.i = and i64 %xor1435.1.i, %neg1517.1.i
  %xor1523.1.i = xor i64 %and1518.1.i, %or1294.1.i
  %or1532.1.i = or i64 %xor1479.1.i, %xor1450.1.i
  %xor1537.1.i = xor i64 %or1532.1.i, %xor1421.1.i
  %or1546.1.i = or i64 %xor1493.1.i, %xor1465.1.i
  %xor1551.1.i = xor i64 %or1546.1.i, %xor1435.1.i
  %and1560.1.i = and i64 %xor1508.1.i, %xor1479.1.i
  %xor1565.1.i = xor i64 %and1560.1.i, %xor1450.1.i
  %and1574.1.i = and i64 %xor1523.1.i, %xor1493.1.i
  %xor1579.1.i = xor i64 %and1574.1.i, %xor1465.1.i
  %and1584.1.i = and i64 %xor1537.1.i, %xor1390.1.i
  %xor1589.1.i = xor i64 %and1584.1.i, %xor1479.1.i
  %and1594.1.i = and i64 %xor1551.1.i, %xor1407.1.i
  %xor1604.1.i = xor i64 %xor1508.1.i, %xor1390.1.i
  %xor1618.1.i = xor i64 %xor1589.1.i, %xor1551.1.i
  %xor1599.1.i = xor i64 %xor1604.1.i, %xor1493.1.i
  %xor1627.1.i = xor i64 %xor1599.1.i, %and1594.1.i
  %xor1636.1.i = xor i64 %xor1523.1.i, %xor1407.1.i
  %xor1609.1.i = xor i64 %xor1636.1.i, %xor1537.1.i
  %xor1641.1.i = xor i64 %xor1609.1.i, %xor1565.1.i
  %xor1650.1.i = xor i64 %xor1579.1.i, %xor1537.1.i
  %xor1659.1.i = xor i64 %xor1627.1.i, %xor1537.1.i
  %xor1668.1.i = xor i64 %xor1589.1.i, %xor1641.1.i
  %xor1677.1.i = xor i64 %xor1650.1.i, %xor1604.1.i
  %xor1682.1.i = xor i64 %xor1677.1.i, %xor1618.1.i
  %xor1691.1.i = xor i64 %xor1618.1.i, %xor1565.1.i
  %and1696.1.i = shl i64 %xor1618.1.i, 8
  %shl1697.1.i = and i64 %and1696.1.i, -71777214294589696
  %and1702.1.i = lshr i64 %xor1618.1.i, 8
  %shr1703.1.i = and i64 %and1702.1.i, 71777214294589695
  %or1704.1.i = or i64 %shl1697.1.i, %shr1703.1.i
  %and1713.1.i = shl i64 %xor1627.1.i, 8
  %shl1714.1.i = and i64 %and1713.1.i, -71777214294589696
  %and1719.1.i = lshr i64 %xor1627.1.i, 8
  %shr1720.1.i = and i64 %and1719.1.i, 71777214294589695
  %or1721.1.i = or i64 %shl1714.1.i, %shr1720.1.i
  %and1730.1.i = shl i64 %xor1641.1.i, 8
  %shl1731.1.i = and i64 %and1730.1.i, -71777214294589696
  %and1736.1.i = lshr i64 %xor1641.1.i, 8
  %shr1737.1.i = and i64 %and1736.1.i, 71777214294589695
  %or1738.1.i = or i64 %shl1731.1.i, %shr1737.1.i
  %and1747.1.i = shl i64 %xor1650.1.i, 8
  %shl1748.1.i = and i64 %and1747.1.i, -71777214294589696
  %and1753.1.i = lshr i64 %xor1650.1.i, 8
  %shr1754.1.i = and i64 %and1753.1.i, 71777214294589695
  %or1755.1.i = or i64 %shl1748.1.i, %shr1754.1.i
  %idxprom1790.i = add i32 %idxprom23.i, 4
  %arraydecay1792.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom1790.i, i32 0
  %60 = bitcast i8* %arraydecay1792.i to i64*
  %neg1770.i = xor i64 %xor1691.i, -1
  %neg1779.i = xor i64 %or1755.i, -1
  %neg1788.i = xor i64 %xor1682.i, -1
  %61 = load i64, i64* %60, align 16, !tbaa !11
  %and1795.i = and i64 %61, %neg1788.i
  %xor1800.i = xor i64 %and1795.i, %xor1659.i
  %neg1805.i = xor i64 %or1738.i, -1
  %arrayidx1812.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom1790.i, i32 16
  %62 = bitcast i8* %arrayidx1812.i to i64*
  %63 = load i64, i64* %62, align 16, !tbaa !11
  %and1813.i = and i64 %63, %neg1805.i
  %xor1818.i = xor i64 %and1813.i, %or1704.i
  %and1833.i = and i64 %xor1800.i, %xor1668.i
  %xor1834.i = xor i64 %and1833.i, %61
  %and1850.i = and i64 %xor1818.i, %or1721.i
  %xor1851.i = xor i64 %and1850.i, %63
  %and1860.i = and i64 %xor1682.i, %neg1770.i
  %xor1865.i = xor i64 %xor1800.i, %and1860.i
  %and1874.i = and i64 %or1738.i, %neg1779.i
  %xor1879.i = xor i64 %xor1818.i, %and1874.i
  %neg1884.i = xor i64 %xor1668.i, -1
  %and1889.i = and i64 %xor1682.i, %neg1884.i
  %xor1894.i = xor i64 %and1889.i, %neg1770.i
  %neg1899.i = xor i64 %or1721.i, -1
  %and1904.i = and i64 %or1738.i, %neg1899.i
  %xor1909.i = xor i64 %and1904.i, %neg1779.i
  %and1918.i = and i64 %xor1865.i, %xor1682.i
  %xor1923.i = xor i64 %and1918.i, %xor1668.i
  %and1932.i = and i64 %xor1879.i, %or1738.i
  %xor1937.i = xor i64 %and1932.i, %or1721.i
  %neg1946.i = xor i64 %and1889.i, %xor1691.i
  %and1947.i = and i64 %xor1865.i, %neg1946.i
  %xor1952.i = xor i64 %and1947.i, %xor1682.i
  %neg1961.i = xor i64 %and1904.i, %or1755.i
  %and1962.i = and i64 %xor1879.i, %neg1961.i
  %xor1967.i = xor i64 %and1962.i, %or1738.i
  %or1976.i = or i64 %xor1923.i, %xor1894.i
  %xor1981.i = xor i64 %or1976.i, %xor1865.i
  %or1990.i = or i64 %xor1937.i, %xor1909.i
  %xor1995.i = xor i64 %or1990.i, %xor1879.i
  %and2004.i = and i64 %xor1952.i, %xor1923.i
  %xor2009.i = xor i64 %and2004.i, %xor1894.i
  %and2018.i = and i64 %xor1967.i, %xor1937.i
  %xor2023.i = xor i64 %and2018.i, %xor1909.i
  %and2028.i = and i64 %xor1981.i, %xor1834.i
  %xor2033.i = xor i64 %and2028.i, %xor1923.i
  %and2038.i = and i64 %xor1995.i, %xor1851.i
  %xor2048.i = xor i64 %xor1952.i, %xor1834.i
  %xor2062.i = xor i64 %xor2033.i, %xor1995.i
  %xor2043.i = xor i64 %xor2048.i, %xor1937.i
  %xor2071.i = xor i64 %xor2043.i, %and2038.i
  %xor2080.i = xor i64 %xor1967.i, %xor1851.i
  %xor2053.i = xor i64 %xor2080.i, %xor1981.i
  %xor2085.i = xor i64 %xor2053.i, %xor2009.i
  %xor2094.i = xor i64 %xor2023.i, %xor1981.i
  %xor2103.i = xor i64 %xor2071.i, %xor1981.i
  %xor2112.i = xor i64 %xor2033.i, %xor2085.i
  %xor2121.i = xor i64 %xor2094.i, %xor2048.i
  %xor2126.i = xor i64 %xor2121.i, %xor2062.i
  %xor2135.i = xor i64 %xor2062.i, %xor2009.i
  %and2140.i = shl i64 %xor2062.i, 16
  %shl2141.i = and i64 %and2140.i, -281470681808896
  %and2146.i = lshr i64 %xor2062.i, 16
  %shr2147.i = and i64 %and2146.i, 281470681808895
  %or2148.i = or i64 %shl2141.i, %shr2147.i
  %and2157.i = shl i64 %xor2071.i, 16
  %shl2158.i = and i64 %and2157.i, -281470681808896
  %and2163.i = lshr i64 %xor2071.i, 16
  %shr2164.i = and i64 %and2163.i, 281470681808895
  %or2165.i = or i64 %shl2158.i, %shr2164.i
  %and2174.i = shl i64 %xor2085.i, 16
  %shl2175.i = and i64 %and2174.i, -281470681808896
  %and2180.i = lshr i64 %xor2085.i, 16
  %shr2181.i = and i64 %and2180.i, 281470681808895
  %or2182.i = or i64 %shl2175.i, %shr2181.i
  %and2191.i = shl i64 %xor2094.i, 16
  %shl2192.i = and i64 %and2191.i, -281470681808896
  %and2197.i = lshr i64 %xor2094.i, 16
  %shr2198.i = and i64 %and2197.i, 281470681808895
  %or2199.i = or i64 %shl2192.i, %shr2198.i
  %neg1770.1.i = xor i64 %xor1691.1.i, -1
  %neg1779.1.i = xor i64 %or1755.1.i, -1
  %neg1788.1.i = xor i64 %xor1682.1.i, -1
  %arrayidx1794.1.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom1790.i, i32 8
  %64 = bitcast i8* %arrayidx1794.1.i to i64*
  %65 = load i64, i64* %64, align 8, !tbaa !11
  %and1795.1.i = and i64 %65, %neg1788.1.i
  %xor1800.1.i = xor i64 %and1795.1.i, %xor1659.1.i
  %neg1805.1.i = xor i64 %or1738.1.i, -1
  %arrayidx1812.1.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom1790.i, i32 24
  %66 = bitcast i8* %arrayidx1812.1.i to i64*
  %67 = load i64, i64* %66, align 8, !tbaa !11
  %and1813.1.i = and i64 %67, %neg1805.1.i
  %xor1818.1.i = xor i64 %and1813.1.i, %or1704.1.i
  %and1833.1.i = and i64 %xor1800.1.i, %xor1668.1.i
  %xor1834.1.i = xor i64 %and1833.1.i, %65
  %and1850.1.i = and i64 %xor1818.1.i, %or1721.1.i
  %xor1851.1.i = xor i64 %and1850.1.i, %67
  %and1860.1.i = and i64 %xor1682.1.i, %neg1770.1.i
  %xor1865.1.i = xor i64 %xor1800.1.i, %and1860.1.i
  %and1874.1.i = and i64 %or1738.1.i, %neg1779.1.i
  %xor1879.1.i = xor i64 %xor1818.1.i, %and1874.1.i
  %neg1884.1.i = xor i64 %xor1668.1.i, -1
  %and1889.1.i = and i64 %xor1682.1.i, %neg1884.1.i
  %xor1894.1.i = xor i64 %and1889.1.i, %neg1770.1.i
  %neg1899.1.i = xor i64 %or1721.1.i, -1
  %and1904.1.i = and i64 %or1738.1.i, %neg1899.1.i
  %xor1909.1.i = xor i64 %and1904.1.i, %neg1779.1.i
  %and1918.1.i = and i64 %xor1865.1.i, %xor1682.1.i
  %xor1923.1.i = xor i64 %and1918.1.i, %xor1668.1.i
  %and1932.1.i = and i64 %xor1879.1.i, %or1738.1.i
  %xor1937.1.i = xor i64 %and1932.1.i, %or1721.1.i
  %neg1946.1.i = xor i64 %and1889.1.i, %xor1691.1.i
  %and1947.1.i = and i64 %xor1865.1.i, %neg1946.1.i
  %xor1952.1.i = xor i64 %and1947.1.i, %xor1682.1.i
  %neg1961.1.i = xor i64 %and1904.1.i, %or1755.1.i
  %and1962.1.i = and i64 %xor1879.1.i, %neg1961.1.i
  %xor1967.1.i = xor i64 %and1962.1.i, %or1738.1.i
  %or1976.1.i = or i64 %xor1923.1.i, %xor1894.1.i
  %xor1981.1.i = xor i64 %or1976.1.i, %xor1865.1.i
  %or1990.1.i = or i64 %xor1937.1.i, %xor1909.1.i
  %xor1995.1.i = xor i64 %or1990.1.i, %xor1879.1.i
  %and2004.1.i = and i64 %xor1952.1.i, %xor1923.1.i
  %xor2009.1.i = xor i64 %and2004.1.i, %xor1894.1.i
  %and2018.1.i = and i64 %xor1967.1.i, %xor1937.1.i
  %xor2023.1.i = xor i64 %and2018.1.i, %xor1909.1.i
  %and2028.1.i = and i64 %xor1981.1.i, %xor1834.1.i
  %xor2033.1.i = xor i64 %and2028.1.i, %xor1923.1.i
  %and2038.1.i = and i64 %xor1995.1.i, %xor1851.1.i
  %xor2048.1.i = xor i64 %xor1952.1.i, %xor1834.1.i
  %xor2062.1.i = xor i64 %xor2033.1.i, %xor1995.1.i
  %xor2043.1.i = xor i64 %xor2048.1.i, %xor1937.1.i
  %xor2071.1.i = xor i64 %xor2043.1.i, %and2038.1.i
  %xor2080.1.i = xor i64 %xor1967.1.i, %xor1851.1.i
  %xor2053.1.i = xor i64 %xor2080.1.i, %xor1981.1.i
  %xor2085.1.i = xor i64 %xor2053.1.i, %xor2009.1.i
  %xor2094.1.i = xor i64 %xor2023.1.i, %xor1981.1.i
  %xor2103.1.i = xor i64 %xor2071.1.i, %xor1981.1.i
  %xor2112.1.i = xor i64 %xor2033.1.i, %xor2085.1.i
  %xor2121.1.i = xor i64 %xor2094.1.i, %xor2048.1.i
  %xor2126.1.i = xor i64 %xor2121.1.i, %xor2062.1.i
  %xor2135.1.i = xor i64 %xor2062.1.i, %xor2009.1.i
  %and2140.1.i = shl i64 %xor2062.1.i, 16
  %shl2141.1.i = and i64 %and2140.1.i, -281470681808896
  %and2146.1.i = lshr i64 %xor2062.1.i, 16
  %shr2147.1.i = and i64 %and2146.1.i, 281470681808895
  %or2148.1.i = or i64 %shl2141.1.i, %shr2147.1.i
  %and2157.1.i = shl i64 %xor2071.1.i, 16
  %shl2158.1.i = and i64 %and2157.1.i, -281470681808896
  %and2163.1.i = lshr i64 %xor2071.1.i, 16
  %shr2164.1.i = and i64 %and2163.1.i, 281470681808895
  %or2165.1.i = or i64 %shl2158.1.i, %shr2164.1.i
  %and2174.1.i = shl i64 %xor2085.1.i, 16
  %shl2175.1.i = and i64 %and2174.1.i, -281470681808896
  %and2180.1.i = lshr i64 %xor2085.1.i, 16
  %shr2181.1.i = and i64 %and2180.1.i, 281470681808895
  %or2182.1.i = or i64 %shl2175.1.i, %shr2181.1.i
  %and2191.1.i = shl i64 %xor2094.1.i, 16
  %shl2192.1.i = and i64 %and2191.1.i, -281470681808896
  %and2197.1.i = lshr i64 %xor2094.1.i, 16
  %shr2198.1.i = and i64 %and2197.1.i, 281470681808895
  %or2199.1.i = or i64 %shl2192.1.i, %shr2198.1.i
  %idxprom2234.i = add i32 %idxprom23.i, 5
  %arraydecay2236.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom2234.i, i32 0
  %68 = bitcast i8* %arraydecay2236.i to i64*
  %neg2214.i = xor i64 %xor2135.i, -1
  %neg2223.i = xor i64 %or2199.i, -1
  %neg2232.i = xor i64 %xor2126.i, -1
  %69 = load i64, i64* %68, align 16, !tbaa !11
  %and2239.i = and i64 %69, %neg2232.i
  %xor2244.i = xor i64 %and2239.i, %xor2103.i
  %neg2249.i = xor i64 %or2182.i, -1
  %arrayidx2256.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom2234.i, i32 16
  %70 = bitcast i8* %arrayidx2256.i to i64*
  %71 = load i64, i64* %70, align 16, !tbaa !11
  %and2257.i = and i64 %71, %neg2249.i
  %xor2262.i = xor i64 %and2257.i, %or2148.i
  %and2277.i = and i64 %xor2244.i, %xor2112.i
  %xor2278.i = xor i64 %and2277.i, %69
  %and2294.i = and i64 %xor2262.i, %or2165.i
  %xor2295.i = xor i64 %and2294.i, %71
  %and2304.i = and i64 %xor2126.i, %neg2214.i
  %xor2309.i = xor i64 %xor2244.i, %and2304.i
  %and2318.i = and i64 %or2182.i, %neg2223.i
  %xor2323.i = xor i64 %xor2262.i, %and2318.i
  %neg2328.i = xor i64 %xor2112.i, -1
  %and2333.i = and i64 %xor2126.i, %neg2328.i
  %xor2338.i = xor i64 %and2333.i, %neg2214.i
  %neg2343.i = xor i64 %or2165.i, -1
  %and2348.i = and i64 %or2182.i, %neg2343.i
  %xor2353.i = xor i64 %and2348.i, %neg2223.i
  %and2362.i = and i64 %xor2309.i, %xor2126.i
  %xor2367.i = xor i64 %and2362.i, %xor2112.i
  %and2376.i = and i64 %xor2323.i, %or2182.i
  %xor2381.i = xor i64 %and2376.i, %or2165.i
  %neg2390.i = xor i64 %and2333.i, %xor2135.i
  %and2391.i = and i64 %xor2309.i, %neg2390.i
  %xor2396.i = xor i64 %and2391.i, %xor2126.i
  %neg2405.i = xor i64 %and2348.i, %or2199.i
  %and2406.i = and i64 %xor2323.i, %neg2405.i
  %xor2411.i = xor i64 %and2406.i, %or2182.i
  %or2420.i = or i64 %xor2367.i, %xor2338.i
  %xor2425.i = xor i64 %or2420.i, %xor2309.i
  %or2434.i = or i64 %xor2381.i, %xor2353.i
  %xor2439.i = xor i64 %or2434.i, %xor2323.i
  %and2448.i = and i64 %xor2396.i, %xor2367.i
  %xor2453.i = xor i64 %and2448.i, %xor2338.i
  %and2462.i = and i64 %xor2411.i, %xor2381.i
  %xor2467.i = xor i64 %and2462.i, %xor2353.i
  %and2472.i = and i64 %xor2425.i, %xor2278.i
  %xor2477.i = xor i64 %and2472.i, %xor2367.i
  %and2482.i = and i64 %xor2439.i, %xor2295.i
  %xor2492.i = xor i64 %xor2396.i, %xor2278.i
  %xor2506.i = xor i64 %xor2477.i, %xor2439.i
  %xor2487.i = xor i64 %xor2492.i, %xor2381.i
  %xor2515.i = xor i64 %xor2487.i, %and2482.i
  %xor2524.i = xor i64 %xor2411.i, %xor2295.i
  %xor2497.i = xor i64 %xor2524.i, %xor2425.i
  %xor2529.i = xor i64 %xor2497.i, %xor2453.i
  %xor2538.i = xor i64 %xor2467.i, %xor2425.i
  %xor2547.i = xor i64 %xor2515.i, %xor2425.i
  %xor2556.i = xor i64 %xor2477.i, %xor2529.i
  %xor2565.i = xor i64 %xor2538.i, %xor2492.i
  %xor2570.i = xor i64 %xor2565.i, %xor2506.i
  %xor2579.i = xor i64 %xor2506.i, %xor2453.i
  %shl2584.i = shl i64 %xor2506.i, 32
  %shr2589.i = lshr i64 %xor2506.i, 32
  %or2590.i = or i64 %shl2584.i, %shr2589.i
  %shl2599.i = shl i64 %xor2515.i, 32
  %shr2604.i = lshr i64 %xor2515.i, 32
  %or2605.i = or i64 %shl2599.i, %shr2604.i
  %shl2614.i = shl i64 %xor2529.i, 32
  %shr2619.i = lshr i64 %xor2529.i, 32
  %or2620.i = or i64 %shl2614.i, %shr2619.i
  %shl2629.i = shl i64 %xor2538.i, 32
  %shr2634.i = lshr i64 %xor2538.i, 32
  %or2635.i = or i64 %shl2629.i, %shr2634.i
  %neg2214.1.i = xor i64 %xor2135.1.i, -1
  %neg2223.1.i = xor i64 %or2199.1.i, -1
  %neg2232.1.i = xor i64 %xor2126.1.i, -1
  %arrayidx2238.1.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom2234.i, i32 8
  %72 = bitcast i8* %arrayidx2238.1.i to i64*
  %73 = load i64, i64* %72, align 8, !tbaa !11
  %and2239.1.i = and i64 %73, %neg2232.1.i
  %xor2244.1.i = xor i64 %and2239.1.i, %xor2103.1.i
  %neg2249.1.i = xor i64 %or2182.1.i, -1
  %arrayidx2256.1.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom2234.i, i32 24
  %74 = bitcast i8* %arrayidx2256.1.i to i64*
  %75 = load i64, i64* %74, align 8, !tbaa !11
  %and2257.1.i = and i64 %75, %neg2249.1.i
  %xor2262.1.i = xor i64 %and2257.1.i, %or2148.1.i
  %and2277.1.i = and i64 %xor2244.1.i, %xor2112.1.i
  %xor2278.1.i = xor i64 %and2277.1.i, %73
  %and2294.1.i = and i64 %xor2262.1.i, %or2165.1.i
  %xor2295.1.i = xor i64 %and2294.1.i, %75
  %and2304.1.i = and i64 %xor2126.1.i, %neg2214.1.i
  %xor2309.1.i = xor i64 %xor2244.1.i, %and2304.1.i
  %and2318.1.i = and i64 %or2182.1.i, %neg2223.1.i
  %xor2323.1.i = xor i64 %xor2262.1.i, %and2318.1.i
  %neg2328.1.i = xor i64 %xor2112.1.i, -1
  %and2333.1.i = and i64 %xor2126.1.i, %neg2328.1.i
  %xor2338.1.i = xor i64 %and2333.1.i, %neg2214.1.i
  %neg2343.1.i = xor i64 %or2165.1.i, -1
  %and2348.1.i = and i64 %or2182.1.i, %neg2343.1.i
  %xor2353.1.i = xor i64 %and2348.1.i, %neg2223.1.i
  %and2362.1.i = and i64 %xor2309.1.i, %xor2126.1.i
  %xor2367.1.i = xor i64 %and2362.1.i, %xor2112.1.i
  %and2376.1.i = and i64 %xor2323.1.i, %or2182.1.i
  %xor2381.1.i = xor i64 %and2376.1.i, %or2165.1.i
  %neg2390.1.i = xor i64 %and2333.1.i, %xor2135.1.i
  %and2391.1.i = and i64 %xor2309.1.i, %neg2390.1.i
  %xor2396.1.i = xor i64 %and2391.1.i, %xor2126.1.i
  %neg2405.1.i = xor i64 %and2348.1.i, %or2199.1.i
  %and2406.1.i = and i64 %xor2323.1.i, %neg2405.1.i
  %xor2411.1.i = xor i64 %and2406.1.i, %or2182.1.i
  %or2420.1.i = or i64 %xor2367.1.i, %xor2338.1.i
  %xor2425.1.i = xor i64 %or2420.1.i, %xor2309.1.i
  %or2434.1.i = or i64 %xor2381.1.i, %xor2353.1.i
  %xor2439.1.i = xor i64 %or2434.1.i, %xor2323.1.i
  %and2448.1.i = and i64 %xor2396.1.i, %xor2367.1.i
  %xor2453.1.i = xor i64 %and2448.1.i, %xor2338.1.i
  %and2462.1.i = and i64 %xor2411.1.i, %xor2381.1.i
  %xor2467.1.i = xor i64 %and2462.1.i, %xor2353.1.i
  %and2472.1.i = and i64 %xor2425.1.i, %xor2278.1.i
  %xor2477.1.i = xor i64 %and2472.1.i, %xor2367.1.i
  %and2482.1.i = and i64 %xor2439.1.i, %xor2295.1.i
  %xor2492.1.i = xor i64 %xor2396.1.i, %xor2278.1.i
  %xor2506.1.i = xor i64 %xor2477.1.i, %xor2439.1.i
  %xor2487.1.i = xor i64 %xor2492.1.i, %xor2381.1.i
  %xor2515.1.i = xor i64 %xor2487.1.i, %and2482.1.i
  %xor2524.1.i = xor i64 %xor2411.1.i, %xor2295.1.i
  %xor2497.1.i = xor i64 %xor2524.1.i, %xor2425.1.i
  %xor2529.1.i = xor i64 %xor2497.1.i, %xor2453.1.i
  %xor2538.1.i = xor i64 %xor2467.1.i, %xor2425.1.i
  %xor2547.1.i = xor i64 %xor2515.1.i, %xor2425.1.i
  %xor2556.1.i = xor i64 %xor2477.1.i, %xor2529.1.i
  %xor2565.1.i = xor i64 %xor2538.1.i, %xor2492.1.i
  %xor2570.1.i = xor i64 %xor2565.1.i, %xor2506.1.i
  %xor2579.1.i = xor i64 %xor2506.1.i, %xor2453.1.i
  %shl2584.1.i = shl i64 %xor2506.1.i, 32
  %shr2589.1.i = lshr i64 %xor2506.1.i, 32
  %or2590.1.i = or i64 %shl2584.1.i, %shr2589.1.i
  %shl2599.1.i = shl i64 %xor2515.1.i, 32
  %shr2604.1.i = lshr i64 %xor2515.1.i, 32
  %or2605.1.i = or i64 %shl2599.1.i, %shr2604.1.i
  %shl2614.1.i = shl i64 %xor2529.1.i, 32
  %shr2619.1.i = lshr i64 %xor2529.1.i, 32
  %or2620.1.i = or i64 %shl2614.1.i, %shr2619.1.i
  %shl2629.1.i = shl i64 %xor2538.1.i, 32
  %shr2634.1.i = lshr i64 %xor2538.1.i, 32
  %or2635.1.i = or i64 %shl2629.1.i, %shr2634.1.i
  %idxprom2670.i = add i32 %idxprom23.i, 6
  %arraydecay2672.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom2670.i, i32 0
  %76 = bitcast i8* %arraydecay2672.i to i64*
  %neg2650.i = xor i64 %xor2579.i, -1
  %neg2659.i = xor i64 %or2635.i, -1
  %neg2668.i = xor i64 %xor2570.i, -1
  %77 = load i64, i64* %76, align 16, !tbaa !11
  %and2675.i = and i64 %77, %neg2668.i
  %xor2680.i = xor i64 %and2675.i, %xor2547.i
  %neg2685.i = xor i64 %or2620.i, -1
  %arrayidx2692.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom2670.i, i32 16
  %78 = bitcast i8* %arrayidx2692.i to i64*
  %79 = load i64, i64* %78, align 16, !tbaa !11
  %and2693.i = and i64 %79, %neg2685.i
  %xor2698.i = xor i64 %and2693.i, %or2590.i
  %and2713.i = and i64 %xor2680.i, %xor2556.i
  %xor2714.i = xor i64 %and2713.i, %77
  %and2730.i = and i64 %xor2698.i, %or2605.i
  %xor2731.i = xor i64 %and2730.i, %79
  %and2740.i = and i64 %xor2570.i, %neg2650.i
  %xor2745.i = xor i64 %xor2680.i, %and2740.i
  %and2754.i = and i64 %or2620.i, %neg2659.i
  %xor2759.i = xor i64 %xor2698.i, %and2754.i
  %neg2764.i = xor i64 %xor2556.i, -1
  %and2769.i = and i64 %xor2570.i, %neg2764.i
  %xor2774.i = xor i64 %and2769.i, %neg2650.i
  %neg2779.i = xor i64 %or2605.i, -1
  %and2784.i = and i64 %or2620.i, %neg2779.i
  %xor2789.i = xor i64 %and2784.i, %neg2659.i
  %and2798.i = and i64 %xor2745.i, %xor2570.i
  %xor2803.i = xor i64 %and2798.i, %xor2556.i
  %and2812.i = and i64 %xor2759.i, %or2620.i
  %xor2817.i = xor i64 %and2812.i, %or2605.i
  %neg2826.i = xor i64 %and2769.i, %xor2579.i
  %and2827.i = and i64 %xor2745.i, %neg2826.i
  %xor2832.i = xor i64 %and2827.i, %xor2570.i
  %neg2841.i = xor i64 %and2784.i, %or2635.i
  %and2842.i = and i64 %xor2759.i, %neg2841.i
  %xor2847.i = xor i64 %and2842.i, %or2620.i
  %or2856.i = or i64 %xor2803.i, %xor2774.i
  %xor2861.i = xor i64 %or2856.i, %xor2745.i
  %or2870.i = or i64 %xor2817.i, %xor2789.i
  %xor2875.i = xor i64 %or2870.i, %xor2759.i
  %and2884.i = and i64 %xor2832.i, %xor2803.i
  %xor2889.i = xor i64 %and2884.i, %xor2774.i
  %and2898.i = and i64 %xor2847.i, %xor2817.i
  %xor2903.i = xor i64 %and2898.i, %xor2789.i
  %and2908.i = and i64 %xor2861.i, %xor2714.i
  %xor2913.i = xor i64 %and2908.i, %xor2803.i
  %and2918.i = and i64 %xor2875.i, %xor2731.i
  %xor2928.i = xor i64 %xor2832.i, %xor2714.i
  %xor2942.i = xor i64 %xor2913.i, %xor2875.i
  %xor2923.i = xor i64 %xor2928.i, %xor2817.i
  %xor2951.i = xor i64 %xor2923.i, %and2918.i
  %xor2960.i = xor i64 %xor2847.i, %xor2731.i
  %xor2933.i = xor i64 %xor2960.i, %xor2861.i
  %xor2965.i = xor i64 %xor2933.i, %xor2889.i
  %xor2974.i = xor i64 %xor2903.i, %xor2861.i
  %xor2983.i = xor i64 %xor2951.i, %xor2861.i
  %xor2992.i = xor i64 %xor2913.i, %xor2965.i
  %xor3001.i = xor i64 %xor2974.i, %xor2928.i
  %xor3006.i = xor i64 %xor3001.i, %xor2942.i
  %xor3015.i = xor i64 %xor2942.i, %xor2889.i
  %neg2650.1.i = xor i64 %xor2579.1.i, -1
  %neg2659.1.i = xor i64 %or2635.1.i, -1
  %neg2668.1.i = xor i64 %xor2570.1.i, -1
  %arrayidx2674.1.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom2670.i, i32 8
  %80 = bitcast i8* %arrayidx2674.1.i to i64*
  %81 = load i64, i64* %80, align 8, !tbaa !11
  %and2675.1.i = and i64 %81, %neg2668.1.i
  %xor2680.1.i = xor i64 %and2675.1.i, %xor2547.1.i
  %neg2685.1.i = xor i64 %or2620.1.i, -1
  %arrayidx2692.1.i = getelementptr inbounds [42 x [32 x i8]], [42 x [32 x i8]]* @E8_bitslice_roundconstant, i32 0, i32 %idxprom2670.i, i32 24
  %82 = bitcast i8* %arrayidx2692.1.i to i64*
  %83 = load i64, i64* %82, align 8, !tbaa !11
  %and2693.1.i = and i64 %83, %neg2685.1.i
  %xor2698.1.i = xor i64 %and2693.1.i, %or2590.1.i
  %and2713.1.i = and i64 %xor2680.1.i, %xor2556.1.i
  %xor2714.1.i = xor i64 %and2713.1.i, %81
  %and2730.1.i = and i64 %xor2698.1.i, %or2605.1.i
  %xor2731.1.i = xor i64 %and2730.1.i, %83
  %and2740.1.i = and i64 %xor2570.1.i, %neg2650.1.i
  %xor2745.1.i = xor i64 %xor2680.1.i, %and2740.1.i
  %and2754.1.i = and i64 %or2620.1.i, %neg2659.1.i
  %xor2759.1.i = xor i64 %xor2698.1.i, %and2754.1.i
  %neg2764.1.i = xor i64 %xor2556.1.i, -1
  %and2769.1.i = and i64 %xor2570.1.i, %neg2764.1.i
  %xor2774.1.i = xor i64 %and2769.1.i, %neg2650.1.i
  %neg2779.1.i = xor i64 %or2605.1.i, -1
  %and2784.1.i = and i64 %or2620.1.i, %neg2779.1.i
  %xor2789.1.i = xor i64 %and2784.1.i, %neg2659.1.i
  %and2798.1.i = and i64 %xor2745.1.i, %xor2570.1.i
  %xor2803.1.i = xor i64 %and2798.1.i, %xor2556.1.i
  %and2812.1.i = and i64 %xor2759.1.i, %or2620.1.i
  %xor2817.1.i = xor i64 %and2812.1.i, %or2605.1.i
  %neg2826.1.i = xor i64 %and2769.1.i, %xor2579.1.i
  %and2827.1.i = and i64 %xor2745.1.i, %neg2826.1.i
  %xor2832.1.i = xor i64 %and2827.1.i, %xor2570.1.i
  %neg2841.1.i = xor i64 %and2784.1.i, %or2635.1.i
  %and2842.1.i = and i64 %xor2759.1.i, %neg2841.1.i
  %xor2847.1.i = xor i64 %and2842.1.i, %or2620.1.i
  %or2856.1.i = or i64 %xor2803.1.i, %xor2774.1.i
  %xor2861.1.i = xor i64 %or2856.1.i, %xor2745.1.i
  %or2870.1.i = or i64 %xor2817.1.i, %xor2789.1.i
  %xor2875.1.i = xor i64 %or2870.1.i, %xor2759.1.i
  %and2884.1.i = and i64 %xor2832.1.i, %xor2803.1.i
  %xor2889.1.i = xor i64 %and2884.1.i, %xor2774.1.i
  %and2898.1.i = and i64 %xor2847.1.i, %xor2817.1.i
  %xor2903.1.i = xor i64 %and2898.1.i, %xor2789.1.i
  %and2908.1.i = and i64 %xor2861.1.i, %xor2714.1.i
  %xor2913.1.i = xor i64 %and2908.1.i, %xor2803.1.i
  %and2918.1.i = and i64 %xor2875.1.i, %xor2731.1.i
  %xor2928.1.i = xor i64 %xor2832.1.i, %xor2714.1.i
  %xor2942.1.i = xor i64 %xor2913.1.i, %xor2875.1.i
  %xor2923.1.i = xor i64 %xor2928.1.i, %xor2817.1.i
  %xor2951.1.i = xor i64 %xor2923.1.i, %and2918.1.i
  %xor2960.1.i = xor i64 %xor2847.1.i, %xor2731.1.i
  %xor2933.1.i = xor i64 %xor2960.1.i, %xor2861.1.i
  %xor2965.1.i = xor i64 %xor2933.1.i, %xor2889.1.i
  %xor2974.1.i = xor i64 %xor2903.1.i, %xor2861.1.i
  %xor2983.1.i = xor i64 %xor2951.1.i, %xor2861.1.i
  %xor2992.1.i = xor i64 %xor2913.1.i, %xor2965.1.i
  %xor3001.1.i = xor i64 %xor2974.1.i, %xor2928.1.i
  %xor3006.1.i = xor i64 %xor3001.1.i, %xor2942.1.i
  %xor3015.1.i = xor i64 %xor2942.1.i, %xor2889.1.i
  %add3042.i = add nuw nsw i64 %roundnumber.04314.i, 7
  %cmp.i = icmp ult i64 %roundnumber.04314.i, 35
  br i1 %cmp.i, label %for.cond1.preheader.i, label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond1.preheader.i
  store i64 %xor2983.i, i64* %arrayidx4, align 8, !tbaa !11
  store i64 %xor2992.i, i64* %arrayidx4.4, align 8, !tbaa !11
  store i64 %xor2942.1.i, i64* %arrayidx4.2, align 16, !tbaa !11
  store i64 %xor2951.1.i, i64* %arrayidx4.6, align 16, !tbaa !11
  store i64 %xor2983.1.i, i64* %arrayidx4.1, align 8, !tbaa !11
  store i64 %xor2942.i, i64* %arrayidx4.3, align 8, !tbaa !11
  store i64 %xor2992.1.i, i64* %arrayidx4.5, align 8, !tbaa !11
  store i64 %xor2951.i, i64* %arrayidx4.7, align 8, !tbaa !11
  %84 = load i64, i64* %0, align 8, !tbaa !11
  %xor20 = xor i64 %xor3006.i, %84
  store i64 %xor20, i64* %arrayidx21.i, align 8, !tbaa !11
  %85 = load i64, i64* %3, align 8, !tbaa !11
  %xor20.1 = xor i64 %xor3006.1.i, %85
  store i64 %xor20.1, i64* %arrayidx21.1.i, align 8, !tbaa !11
  %86 = load i64, i64* %6, align 8, !tbaa !11
  %xor20.2 = xor i64 %xor2965.1.i, %86
  store i64 %xor20.2, i64* %arrayidx34.phi.trans.insert.i, align 8, !tbaa !11
  %87 = load i64, i64* %9, align 8, !tbaa !11
  %xor20.3 = xor i64 %xor2965.i, %87
  store i64 %xor20.3, i64* %arrayidx34.1.i, align 8, !tbaa !11
  %88 = load i64, i64* %12, align 8, !tbaa !11
  %xor20.4 = xor i64 %xor3015.i, %88
  store i64 %xor20.4, i64* %arrayidx4.i, align 8, !tbaa !11
  %89 = load i64, i64* %15, align 8, !tbaa !11
  %xor20.5 = xor i64 %xor3015.1.i, %89
  store i64 %xor20.5, i64* %arrayidx4.1.i, align 8, !tbaa !11
  %90 = load i64, i64* %18, align 8, !tbaa !11
  %xor20.6 = xor i64 %xor2974.1.i, %90
  store i64 %xor20.6, i64* %arrayidx12.phi.trans.insert.i, align 8, !tbaa !11
  %91 = load i64, i64* %21, align 8, !tbaa !11
  %xor20.7 = xor i64 %xor2974.i, %91
  store i64 %xor20.7, i64* %arrayidx12.1.i, align 8, !tbaa !11
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (/b/s/w/ir/cache/git/chromium.googlesource.com-external-github.com-llvm-llvm--project 3774bcf9f84520a8c35bf765d9a528040d68a14b)"}
!2 = !{!3, !4, i64 0}
!3 = !{!"", !4, i64 0, !7, i64 8, !7, i64 16, !5, i64 32, !5, i64 160}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"long long", !5, i64 0}
!8 = !{!3, !7, i64 8}
!9 = !{!3, !7, i64 16}
!10 = !{!5, !5, i64 0}
!11 = !{!7, !7, i64 0}
