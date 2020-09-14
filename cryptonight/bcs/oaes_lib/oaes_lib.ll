; ModuleID = 'oaes_lib/oaes_lib.bc'
source_filename = "oaes_lib.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-emscripten"

%struct._oaes_key = type { i32, i8*, i32, i8*, i32, i32 }
%struct.timeb = type { i32, i16, i16, i16 }
%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8* }
%struct._oaes_ctx = type { %struct._oaes_key*, i16, [16 x i8] }

@.str.1 = private unnamed_addr constant [6 x i8] c"%02x \00", align 1
@oaes_header = internal global <{ i8, i8, i8, i8, i8, i8, [10 x i8] }> <{ i8 79, i8 65, i8 69, i8 83, i8 1, i8 2, [10 x i8] zeroinitializer }>, align 16
@oaes_gf_8 = internal unnamed_addr constant [10 x i8] c"\01\02\04\08\10 @\80\1B6", align 1
@oaes_inv_sub_byte_value = internal unnamed_addr constant [16 x [16 x i8]] [[16 x i8] c"R\09j\D506\A58\BF@\A3\9E\81\F3\D7\FB", [16 x i8] c"|\E39\82\9B/\FF\874\8ECD\C4\DE\E9\CB", [16 x i8] c"T{\942\A6\C2#=\EEL\95\0BB\FA\C3N", [16 x i8] c"\08.\A1f(\D9$\B2v[\A2Im\8B\D1%", [16 x i8] c"r\F8\F6d\86h\98\16\D4\A4\\\CC]e\B6\92", [16 x i8] c"lpHP\FD\ED\B9\DA^\15FW\A7\8D\9D\84", [16 x i8] c"\90\D8\AB\00\8C\BC\D3\0A\F7\E4X\05\B8\B3E\06", [16 x i8] c"\D0,\1E\8F\CA?\0F\02\C1\AF\BD\03\01\13\8Ak", [16 x i8] c":\91\11AOg\DC\EA\97\F2\CF\CE\F0\B4\E6s", [16 x i8] c"\96\ACt\22\E7\AD5\85\E2\F97\E8\1Cu\DFn", [16 x i8] c"G\F1\1Aq\1D)\C5\89o\B7b\0E\AA\18\BE\1B", [16 x i8] c"\FCV>K\C6\D2y \9A\DB\C0\FEx\CDZ\F4", [16 x i8] c"\1F\DD\A83\88\07\C71\B1\12\10Y'\80\EC_", [16 x i8] c"`Q\7F\A9\19\B5J\0D-\E5z\9F\93\C9\9C\EF", [16 x i8] c"\A0\E0;M\AE*\F5\B0\C8\EB\BB<\83S\99a", [16 x i8] c"\17+\04~\BAw\D6&\E1i\14cU!\0C}"], align 16
@oaes_gf_mul_2 = internal unnamed_addr constant [16 x [16 x i8]] [[16 x i8] c"\00\02\04\06\08\0A\0C\0E\10\12\14\16\18\1A\1C\1E", [16 x i8] c" \22$&(*,.02468:<>", [16 x i8] c"@BDFHJLNPRTVXZ\\^", [16 x i8] c"`bdfhjlnprtvxz|~", [16 x i8] c"\80\82\84\86\88\8A\8C\8E\90\92\94\96\98\9A\9C\9E", [16 x i8] c"\A0\A2\A4\A6\A8\AA\AC\AE\B0\B2\B4\B6\B8\BA\BC\BE", [16 x i8] c"\C0\C2\C4\C6\C8\CA\CC\CE\D0\D2\D4\D6\D8\DA\DC\DE", [16 x i8] c"\E0\E2\E4\E6\E8\EA\EC\EE\F0\F2\F4\F6\F8\FA\FC\FE", [16 x i8] c"\1B\19\1F\1D\13\11\17\15\0B\09\0F\0D\03\01\07\05", [16 x i8] c";9?=3175+)/-#!'%", [16 x i8] c"[Y_]SQWUKIOMCAGE", [16 x i8] c"{y\7F}sqwukiomcage", [16 x i8] c"\9B\99\9F\9D\93\91\97\95\8B\89\8F\8D\83\81\87\85", [16 x i8] c"\BB\B9\BF\BD\B3\B1\B7\B5\AB\A9\AF\AD\A3\A1\A7\A5", [16 x i8] c"\DB\D9\DF\DD\D3\D1\D7\D5\CB\C9\CF\CD\C3\C1\C7\C5", [16 x i8] c"\FB\F9\FF\FD\F3\F1\F7\F5\EB\E9\EF\ED\E3\E1\E7\E5"], align 16
@oaes_gf_mul_3 = internal unnamed_addr constant [16 x [16 x i8]] [[16 x i8] c"\00\03\06\05\0C\0F\0A\09\18\1B\1E\1D\14\17\12\11", [16 x i8] c"0365<?:9(+.-$'\22!", [16 x i8] c"`cfelojix{~}twrq", [16 x i8] c"PSVU\\_ZYHKNMDGBA", [16 x i8] c"\C0\C3\C6\C5\CC\CF\CA\C9\D8\DB\DE\DD\D4\D7\D2\D1", [16 x i8] c"\F0\F3\F6\F5\FC\FF\FA\F9\E8\EB\EE\ED\E4\E7\E2\E1", [16 x i8] c"\A0\A3\A6\A5\AC\AF\AA\A9\B8\BB\BE\BD\B4\B7\B2\B1", [16 x i8] c"\90\93\96\95\9C\9F\9A\99\88\8B\8E\8D\84\87\82\81", [16 x i8] c"\9B\98\9D\9E\97\94\91\92\83\80\85\86\8F\8C\89\8A", [16 x i8] c"\AB\A8\AD\AE\A7\A4\A1\A2\B3\B0\B5\B6\BF\BC\B9\BA", [16 x i8] c"\FB\F8\FD\FE\F7\F4\F1\F2\E3\E0\E5\E6\EF\EC\E9\EA", [16 x i8] c"\CB\C8\CD\CE\C7\C4\C1\C2\D3\D0\D5\D6\DF\DC\D9\DA", [16 x i8] c"[X]^WTQRC@EFOLIJ", [16 x i8] c"khmngdabspuv\7F|yz", [16 x i8] c";8=>7412# %&/,)*", [16 x i8] c"\0B\08\0D\0E\07\04\01\02\13\10\15\16\1F\1C\19\1A"], align 16
@oaes_gf_mul_9 = internal unnamed_addr constant [16 x [16 x i8]] [[16 x i8] c"\00\09\12\1B$-6?HAZSle~w", [16 x i8] c"\90\99\82\8B\B4\BD\A6\AF\D8\D1\CA\C3\FC\F5\EE\E7", [16 x i8] c";2) \1F\16\0D\04szahW^EL", [16 x i8] c"\AB\A2\B9\B0\8F\86\9D\94\E3\EA\F1\F8\C7\CE\D5\DC", [16 x i8] c"v\7FdmR[@I>7,%\1A\13\08\01", [16 x i8] c"\E6\EF\F4\FD\C2\CB\D0\D9\AE\A7\BC\B5\8A\83\98\91", [16 x i8] c"MD_Vi`{r\05\0C\17\1E!(3:", [16 x i8] c"\DD\D4\CF\C6\F9\F0\EB\E2\95\9C\87\8E\B1\B8\A3\AA", [16 x i8] c"\EC\E5\FE\F7\C8\C1\DA\D3\A4\AD\B6\BF\80\89\92\9B", [16 x i8] c"|ungXQJC4=&/\10\19\02\0B", [16 x i8] c"\D7\DE\C5\CC\F3\FA\E1\E8\9F\96\8D\84\BB\B2\A9\A0", [16 x i8] c"GNU\\cjqx\0F\06\1D\14+\2290", [16 x i8] c"\9A\93\88\81\BE\B7\AC\A5\D2\DB\C0\C9\F6\FF\E4\ED", [16 x i8] c"\0A\03\18\11.'<5BKPYfot}", [16 x i8] c"\A1\A8\B3\BA\85\8C\97\9E\E9\E0\FB\F2\CD\C4\DF\D6", [16 x i8] c"18#*\15\1C\07\0Eypkb]TOF"], align 16
@oaes_gf_mul_b = internal unnamed_addr constant [16 x [16 x i8]] [[16 x i8] c"\00\0B\16\1D,':1XSNEt\7Fbi", [16 x i8] c"\B0\BB\A6\AD\9C\97\8A\81\E8\E3\FE\F5\C4\CF\D2\D9", [16 x i8] c"{pmfW\\AJ#(5>\0F\04\19\12", [16 x i8] c"\CB\C0\DD\D6\E7\EC\F1\FA\93\98\85\8E\BF\B4\A9\A2", [16 x i8] c"\F6\FD\E0\EB\DA\D1\CC\C7\AE\A5\B8\B3\82\89\94\9F", [16 x i8] c"FMP[ja|w\1E\15\08\0329$/", [16 x i8] c"\8D\86\9B\90\A1\AA\B7\BC\D5\DE\C3\C8\F9\F2\EF\E4", [16 x i8] c"=6+ \11\1A\07\0CensxIB_T", [16 x i8] c"\F7\FC\E1\EA\DB\D0\CD\C6\AF\A4\B9\B2\83\88\95\9E", [16 x i8] c"GLQZk`}v\1F\14\09\0238%.", [16 x i8] c"\8C\87\9A\91\A0\AB\B6\BD\D4\DF\C2\C9\F8\F3\EE\E5", [16 x i8] c"<7*!\10\1B\06\0DdoryHC^U", [16 x i8] c"\01\0A\17\1C-&;0YRODu~ch", [16 x i8] c"\B1\BA\A7\AC\9D\96\8B\80\E9\E2\FF\F4\C5\CE\D3\D8", [16 x i8] c"zqlgV]@K\22)4?\0E\05\18\13", [16 x i8] c"\CA\C1\DC\D7\E6\ED\F0\FB\92\99\84\8F\BE\B5\A8\A3"], align 16
@oaes_gf_mul_d = internal unnamed_addr constant [16 x [16 x i8]] [[16 x i8] c"\00\0D\1A\1749.#her\7F\\QFK", [16 x i8] c"\D0\DD\CA\C7\E4\E9\FE\F3\B8\B5\A2\AF\8C\81\96\9B", [16 x i8] c"\BB\B6\A1\AC\8F\82\95\98\D3\DE\C9\C4\E7\EA\FD\F0", [16 x i8] c"kfq|_REH\03\0E\19\147:- ", [16 x i8] c"m`wzYTCN\05\08\1F\121<+&", [16 x i8] c"\BD\B0\A7\AA\89\84\93\9E\D5\D8\CF\C2\E1\EC\FB\F6", [16 x i8] c"\D6\DB\CC\C1\E2\EF\F8\F5\BE\B3\A4\A9\8A\87\90\9D", [16 x i8] c"\06\0B\1C\112?(%nctyZW@M", [16 x i8] c"\DA\D7\C0\CD\EE\E3\F4\F9\B2\BF\A8\A5\86\8B\9C\91", [16 x i8] c"\0A\07\10\1D>3$)boxuV[LA", [16 x i8] c"al{vUXOB\09\04\13\1E=0'*", [16 x i8] c"\B1\BC\AB\A6\85\88\9F\92\D9\D4\C3\CE\ED\E0\F7\FA", [16 x i8] c"\B7\BA\AD\A0\83\8E\99\94\DF\D2\C5\C8\EB\E6\F1\FC", [16 x i8] c"gj}pS^ID\0F\02\15\18;6!,", [16 x i8] c"\0C\01\16\1B85\22/di~sP]JG", [16 x i8] c"\DC\D1\C6\CB\E8\E5\F2\FF\B4\B9\AE\A3\80\8D\9A\97"], align 16
@oaes_gf_mul_e = internal unnamed_addr constant [16 x [16 x i8]] [[16 x i8] c"\00\0E\1C\1286$*p~lbHFTZ", [16 x i8] c"\E0\EE\FC\F2\D8\D6\C4\CA\90\9E\8C\82\A8\A6\B4\BA", [16 x i8] c"\DB\D5\C7\C9\E3\ED\FF\F1\AB\A5\B7\B9\93\9D\8F\81", [16 x i8] c";5')\03\0D\1F\11KEWYs}oa", [16 x i8] c"\AD\A3\B1\BF\95\9B\89\87\DD\D3\C1\CF\E5\EB\F9\F7", [16 x i8] c"MCQ_u{ig=3!/\05\0B\19\17", [16 x i8] c"vxjdN@R\\\06\08\1A\14>0\22,", [16 x i8] c"\96\98\8A\84\AE\A0\B2\BC\E6\E8\FA\F4\DE\D0\C2\CC", [16 x i8] c"AO]Sywek1?-#\09\07\15\1B", [16 x i8] c"\A1\AF\BD\B3\99\97\85\8B\D1\DF\CD\C3\E9\E7\F5\FB", [16 x i8] c"\9A\94\86\88\A2\AC\BE\B0\EA\E4\F6\F8\D2\DC\CE\C0", [16 x i8] c"ztfhBL^P\0A\04\16\182<. ", [16 x i8] c"\EC\E2\F0\FE\D4\DA\C8\C6\9C\92\80\8E\A4\AA\B8\B6", [16 x i8] c"\0C\02\10\1E4:(&|r`nDJXV", [16 x i8] c"79+%\0F\01\13\1DGI[U\7Fqcm", [16 x i8] c"\D7\D9\CB\C5\EF\E1\F3\FD\A7\A9\BB\B5\9F\91\83\8D"], align 16
@oaes_sub_byte_value = internal unnamed_addr constant [16 x [16 x i8]] [[16 x i8] c"c|w{\F2ko\C50\01g+\FE\D7\ABv", [16 x i8] c"\CA\82\C9}\FAYG\F0\AD\D4\A2\AF\9C\A4r\C0", [16 x i8] c"\B7\FD\93&6?\F7\CC4\A5\E5\F1q\D81\15", [16 x i8] c"\04\C7#\C3\18\96\05\9A\07\12\80\E2\EB'\B2u", [16 x i8] c"\09\83,\1A\1BnZ\A0R;\D6\B3)\E3/\84", [16 x i8] c"S\D1\00\ED \FC\B1[j\CB\BE9JLX\CF", [16 x i8] c"\D0\EF\AA\FBCM3\85E\F9\02\7FP<\9F\A8", [16 x i8] c"Q\A3@\8F\92\9D8\F5\BC\B6\DA!\10\FF\F3\D2", [16 x i8] c"\CD\0C\13\EC_\97D\17\C4\A7~=d]\19s", [16 x i8] c"`\81O\DC\22*\90\88F\EE\B8\14\DE^\0B\DB", [16 x i8] c"\E02:\0AI\06$\\\C2\D3\ACb\91\95\E4y", [16 x i8] c"\E7\C87m\8D\D5N\A9lV\F4\EAez\AE\08", [16 x i8] c"\BAx%.\1C\A6\B4\C6\E8\DDt\1FK\BD\8B\8A", [16 x i8] c"p>\B5fH\03\F6\0Ea5W\B9\86\C1\1D\9E", [16 x i8] c"\E1\F8\98\11i\D9\8E\94\9B\1E\87\E9\CEU(\DF", [16 x i8] c"\8C\A1\89\0D\BF\E6BhA\99-\0F\B0T\BB\16"], align 16

; Function Attrs: nounwind
define hidden i32 @oaes_sprintf(i8* %buf, i32* %buf_len, i8* readonly %data, i32 %data_len) local_unnamed_addr #0 {
entry:
  %_temp = alloca [4 x i8], align 1
  %0 = getelementptr inbounds [4 x i8], [4 x i8]* %_temp, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #8
  %cmp = icmp eq i32* %buf_len, null
  br i1 %cmp, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %buf_len, align 4, !tbaa !2
  %mul = mul i32 %data_len, 3
  %div = lshr i32 %data_len, 4
  %add = add nuw nsw i32 %div, 1
  %add1 = add i32 %add, %mul
  store i32 %add1, i32* %buf_len, align 4, !tbaa !2
  %cmp2 = icmp eq i8* %buf, null
  br i1 %cmp2, label %cleanup, label %if.end4

if.end4:                                          ; preds = %if.end
  %cmp5 = icmp ugt i32 %add1, %1
  br i1 %cmp5, label %cleanup, label %if.end7

if.end7:                                          ; preds = %if.end4
  %cmp8 = icmp eq i8* %data, null
  br i1 %cmp8, label %cleanup, label %if.end10

if.end10:                                         ; preds = %if.end7
  store i8 0, i8* %buf, align 1
  %cmp1138 = icmp eq i32 %data_len, 0
  br i1 %cmp1138, label %cleanup, label %for.body

for.body:                                         ; preds = %if.end10, %for.inc
  %_i.039 = phi i32 [ %inc.pre-phi, %for.inc ], [ 0, %if.end10 ]
  %arrayidx = getelementptr inbounds i8, i8* %data, i32 %_i.039
  %2 = load i8, i8* %arrayidx, align 1, !tbaa !6
  %conv = zext i8 %2 to i32
  %3 = call i32 (i8*, i8*, ...) @siprintf(i8* nonnull %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 %conv)
  %call14 = call i8* @strcat(i8* nonnull %buf, i8* nonnull %0)
  %tobool = icmp eq i32 %_i.039, 0
  br i1 %tobool, label %for.inc, label %land.lhs.true

land.lhs.true:                                    ; preds = %for.body
  %add15 = add nuw i32 %_i.039, 1
  %rem = and i32 %add15, 15
  %cmp16 = icmp eq i32 %rem, 0
  br i1 %cmp16, label %if.then18, label %for.inc

if.then18:                                        ; preds = %land.lhs.true
  %strlen = tail call i32 @strlen(i8* nonnull %buf)
  %endptr = getelementptr i8, i8* %buf, i32 %strlen
  %4 = bitcast i8* %endptr to i16*
  store i16 10, i16* %4, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body, %land.lhs.true, %if.then18
  %inc.pre-phi = phi i32 [ %add15, %land.lhs.true ], [ %add15, %if.then18 ], [ 1, %for.body ]
  %exitcond = icmp eq i32 %inc.pre-phi, %data_len
  br i1 %exitcond, label %cleanup, label %for.body

cleanup:                                          ; preds = %for.inc, %if.end10, %if.end7, %if.end4, %if.end, %entry
  %retval.0 = phi i32 [ 3, %entry ], [ 0, %if.end ], [ 9, %if.end4 ], [ 4, %if.end7 ], [ 0, %if.end10 ], [ 0, %for.inc ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #8
  ret i32 %retval.0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nounwind
declare i8* @strcat(i8* returned, i8* nocapture readonly) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind
define hidden i32 @oaes_key_gen_128(i8* %ctx) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq i8* %ctx, null
  br i1 %cmp.i, label %oaes_key_gen.exit, label %if.end.i

if.end.i:                                         ; preds = %entry
  %call.i = tail call dereferenceable_or_null(24) i8* @calloc(i32 24, i32 1) #8
  %cmp1.i = icmp eq i8* %call.i, null
  br i1 %cmp1.i, label %oaes_key_gen.exit, label %if.end3.i

if.end3.i:                                        ; preds = %if.end.i
  %key.i = bitcast i8* %ctx to %struct._oaes_key**
  %0 = load %struct._oaes_key*, %struct._oaes_key** %key.i, align 4, !tbaa !7
  %tobool.i = icmp eq %struct._oaes_key* %0, null
  br i1 %tobool.i, label %if.end7.i, label %if.end.i4

if.end.i4:                                        ; preds = %if.end3.i
  %data.i2 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %0, i32 0, i32 1
  %1 = load i8*, i8** %data.i2, align 4, !tbaa !11
  %tobool.i3 = icmp eq i8* %1, null
  br i1 %tobool.i3, label %if.end4.i, label %if.then1.i

if.then1.i:                                       ; preds = %if.end.i4
  tail call void @free(i8* nonnull %1) #8
  %2 = load %struct._oaes_key*, %struct._oaes_key** %key.i, align 4, !tbaa !13
  %data3.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %2, i32 0, i32 1
  store i8* null, i8** %data3.i, align 4, !tbaa !11
  %.pre.i = load %struct._oaes_key*, %struct._oaes_key** %key.i, align 4, !tbaa !13
  br label %if.end4.i

if.end4.i:                                        ; preds = %if.then1.i, %if.end.i4
  %.in.i = phi %struct._oaes_key* [ %0, %if.end.i4 ], [ %.pre.i, %if.then1.i ]
  %exp_data.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %.in.i, i32 0, i32 3
  %3 = load i8*, i8** %exp_data.i, align 4, !tbaa !14
  %tobool5.i = icmp eq i8* %3, null
  br i1 %tobool5.i, label %oaes_key_destroy.exit, label %if.then6.i

if.then6.i:                                       ; preds = %if.end4.i
  tail call void @free(i8* nonnull %3) #8
  %4 = load %struct._oaes_key*, %struct._oaes_key** %key.i, align 4, !tbaa !13
  %exp_data8.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %4, i32 0, i32 3
  store i8* null, i8** %exp_data8.i, align 4, !tbaa !14
  %.pre1.i = load %struct._oaes_key*, %struct._oaes_key** %key.i, align 4, !tbaa !13
  br label %oaes_key_destroy.exit

oaes_key_destroy.exit:                            ; preds = %if.end4.i, %if.then6.i
  %.in2.i = phi %struct._oaes_key* [ %.in.i, %if.end4.i ], [ %.pre1.i, %if.then6.i ]
  %5 = bitcast %struct._oaes_key* %.in2.i to i8*
  tail call void @free(i8* %5) #8
  store %struct._oaes_key* null, %struct._oaes_key** %key.i, align 4, !tbaa !13
  br label %if.end7.i

if.end7.i:                                        ; preds = %oaes_key_destroy.exit, %if.end3.i
  %data_len.i = bitcast i8* %call.i to i32*
  store i32 16, i32* %data_len.i, align 4, !tbaa !15
  %call8.i = tail call dereferenceable_or_null(16) i8* @calloc(i32 16, i32 1) #8
  %data.i = getelementptr inbounds i8, i8* %call.i, i32 4
  %6 = bitcast i8* %data.i to i8**
  store i8* %call8.i, i8** %6, align 4, !tbaa !11
  %cmp10.i = icmp eq i8* %call8.i, null
  br i1 %cmp10.i, label %oaes_key_gen.exit, label %for.body.i.preheader

for.body.i.preheader:                             ; preds = %if.end7.i
  %call14.i = tail call i32 @rand() #8
  %conv.i = trunc i32 %call14.i to i8
  store i8 %conv.i, i8* %call8.i, align 1, !tbaa !6
  %call14.i.1 = tail call i32 @rand() #8
  %conv.i.1 = trunc i32 %call14.i.1 to i8
  %arrayidx.i.1 = getelementptr inbounds i8, i8* %call8.i, i32 1
  store i8 %conv.i.1, i8* %arrayidx.i.1, align 1, !tbaa !6
  %call14.i.2 = tail call i32 @rand() #8
  %conv.i.2 = trunc i32 %call14.i.2 to i8
  %arrayidx.i.2 = getelementptr inbounds i8, i8* %call8.i, i32 2
  store i8 %conv.i.2, i8* %arrayidx.i.2, align 1, !tbaa !6
  %call14.i.3 = tail call i32 @rand() #8
  %conv.i.3 = trunc i32 %call14.i.3 to i8
  %arrayidx.i.3 = getelementptr inbounds i8, i8* %call8.i, i32 3
  store i8 %conv.i.3, i8* %arrayidx.i.3, align 1, !tbaa !6
  %call14.i.4 = tail call i32 @rand() #8
  %conv.i.4 = trunc i32 %call14.i.4 to i8
  %arrayidx.i.4 = getelementptr inbounds i8, i8* %call8.i, i32 4
  store i8 %conv.i.4, i8* %arrayidx.i.4, align 1, !tbaa !6
  %call14.i.5 = tail call i32 @rand() #8
  %conv.i.5 = trunc i32 %call14.i.5 to i8
  %arrayidx.i.5 = getelementptr inbounds i8, i8* %call8.i, i32 5
  store i8 %conv.i.5, i8* %arrayidx.i.5, align 1, !tbaa !6
  %call14.i.6 = tail call i32 @rand() #8
  %conv.i.6 = trunc i32 %call14.i.6 to i8
  %arrayidx.i.6 = getelementptr inbounds i8, i8* %call8.i, i32 6
  store i8 %conv.i.6, i8* %arrayidx.i.6, align 1, !tbaa !6
  %call14.i.7 = tail call i32 @rand() #8
  %conv.i.7 = trunc i32 %call14.i.7 to i8
  %arrayidx.i.7 = getelementptr inbounds i8, i8* %call8.i, i32 7
  store i8 %conv.i.7, i8* %arrayidx.i.7, align 1, !tbaa !6
  %call14.i.8 = tail call i32 @rand() #8
  %conv.i.8 = trunc i32 %call14.i.8 to i8
  %arrayidx.i.8 = getelementptr inbounds i8, i8* %call8.i, i32 8
  store i8 %conv.i.8, i8* %arrayidx.i.8, align 1, !tbaa !6
  %call14.i.9 = tail call i32 @rand() #8
  %conv.i.9 = trunc i32 %call14.i.9 to i8
  %arrayidx.i.9 = getelementptr inbounds i8, i8* %call8.i, i32 9
  store i8 %conv.i.9, i8* %arrayidx.i.9, align 1, !tbaa !6
  %call14.i.10 = tail call i32 @rand() #8
  %conv.i.10 = trunc i32 %call14.i.10 to i8
  %arrayidx.i.10 = getelementptr inbounds i8, i8* %call8.i, i32 10
  store i8 %conv.i.10, i8* %arrayidx.i.10, align 1, !tbaa !6
  %call14.i.11 = tail call i32 @rand() #8
  %conv.i.11 = trunc i32 %call14.i.11 to i8
  %arrayidx.i.11 = getelementptr inbounds i8, i8* %call8.i, i32 11
  store i8 %conv.i.11, i8* %arrayidx.i.11, align 1, !tbaa !6
  %call14.i.12 = tail call i32 @rand() #8
  %conv.i.12 = trunc i32 %call14.i.12 to i8
  %arrayidx.i.12 = getelementptr inbounds i8, i8* %call8.i, i32 12
  store i8 %conv.i.12, i8* %arrayidx.i.12, align 1, !tbaa !6
  %call14.i.13 = tail call i32 @rand() #8
  %conv.i.13 = trunc i32 %call14.i.13 to i8
  %arrayidx.i.13 = getelementptr inbounds i8, i8* %call8.i, i32 13
  store i8 %conv.i.13, i8* %arrayidx.i.13, align 1, !tbaa !6
  %call14.i.14 = tail call i32 @rand() #8
  %conv.i.14 = trunc i32 %call14.i.14 to i8
  %arrayidx.i.14 = getelementptr inbounds i8, i8* %call8.i, i32 14
  store i8 %conv.i.14, i8* %arrayidx.i.14, align 1, !tbaa !6
  %call14.i.15 = tail call i32 @rand() #8
  %conv.i.15 = trunc i32 %call14.i.15 to i8
  %arrayidx.i.15 = getelementptr inbounds i8, i8* %call8.i, i32 15
  store i8 %conv.i.15, i8* %arrayidx.i.15, align 1, !tbaa !6
  %7 = bitcast i8* %ctx to i8**
  store i8* %call.i, i8** %7, align 4, !tbaa !7
  tail call fastcc void @oaes_key_expand(i8* nonnull %ctx) #8
  br label %oaes_key_gen.exit

oaes_key_gen.exit:                                ; preds = %entry, %if.end.i, %if.end7.i, %for.body.i.preheader
  %retval.0.i = phi i32 [ 0, %for.body.i.preheader ], [ 2, %entry ], [ 8, %if.end.i ], [ 8, %if.end7.i ]
  ret i32 %retval.0.i
}

; Function Attrs: nounwind
define hidden i32 @oaes_key_gen_192(i8* %ctx) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq i8* %ctx, null
  br i1 %cmp.i, label %oaes_key_gen.exit, label %if.end.i

if.end.i:                                         ; preds = %entry
  %call.i = tail call dereferenceable_or_null(24) i8* @calloc(i32 24, i32 1) #8
  %cmp1.i = icmp eq i8* %call.i, null
  br i1 %cmp1.i, label %oaes_key_gen.exit, label %if.end3.i

if.end3.i:                                        ; preds = %if.end.i
  %key.i = bitcast i8* %ctx to %struct._oaes_key**
  %0 = load %struct._oaes_key*, %struct._oaes_key** %key.i, align 4, !tbaa !7
  %tobool.i = icmp eq %struct._oaes_key* %0, null
  br i1 %tobool.i, label %if.end7.i, label %if.end.i4

if.end.i4:                                        ; preds = %if.end3.i
  %data.i2 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %0, i32 0, i32 1
  %1 = load i8*, i8** %data.i2, align 4, !tbaa !11
  %tobool.i3 = icmp eq i8* %1, null
  br i1 %tobool.i3, label %if.end4.i, label %if.then1.i

if.then1.i:                                       ; preds = %if.end.i4
  tail call void @free(i8* nonnull %1) #8
  %2 = load %struct._oaes_key*, %struct._oaes_key** %key.i, align 4, !tbaa !13
  %data3.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %2, i32 0, i32 1
  store i8* null, i8** %data3.i, align 4, !tbaa !11
  %.pre.i = load %struct._oaes_key*, %struct._oaes_key** %key.i, align 4, !tbaa !13
  br label %if.end4.i

if.end4.i:                                        ; preds = %if.then1.i, %if.end.i4
  %.in.i = phi %struct._oaes_key* [ %0, %if.end.i4 ], [ %.pre.i, %if.then1.i ]
  %exp_data.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %.in.i, i32 0, i32 3
  %3 = load i8*, i8** %exp_data.i, align 4, !tbaa !14
  %tobool5.i = icmp eq i8* %3, null
  br i1 %tobool5.i, label %oaes_key_destroy.exit, label %if.then6.i

if.then6.i:                                       ; preds = %if.end4.i
  tail call void @free(i8* nonnull %3) #8
  %4 = load %struct._oaes_key*, %struct._oaes_key** %key.i, align 4, !tbaa !13
  %exp_data8.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %4, i32 0, i32 3
  store i8* null, i8** %exp_data8.i, align 4, !tbaa !14
  %.pre1.i = load %struct._oaes_key*, %struct._oaes_key** %key.i, align 4, !tbaa !13
  br label %oaes_key_destroy.exit

oaes_key_destroy.exit:                            ; preds = %if.end4.i, %if.then6.i
  %.in2.i = phi %struct._oaes_key* [ %.in.i, %if.end4.i ], [ %.pre1.i, %if.then6.i ]
  %5 = bitcast %struct._oaes_key* %.in2.i to i8*
  tail call void @free(i8* %5) #8
  store %struct._oaes_key* null, %struct._oaes_key** %key.i, align 4, !tbaa !13
  br label %if.end7.i

if.end7.i:                                        ; preds = %oaes_key_destroy.exit, %if.end3.i
  %data_len.i = bitcast i8* %call.i to i32*
  store i32 24, i32* %data_len.i, align 4, !tbaa !15
  %call8.i = tail call dereferenceable_or_null(24) i8* @calloc(i32 24, i32 1) #8
  %data.i = getelementptr inbounds i8, i8* %call.i, i32 4
  %6 = bitcast i8* %data.i to i8**
  store i8* %call8.i, i8** %6, align 4, !tbaa !11
  %cmp10.i = icmp eq i8* %call8.i, null
  br i1 %cmp10.i, label %oaes_key_gen.exit, label %for.body.i.preheader

for.body.i.preheader:                             ; preds = %if.end7.i
  %call14.i = tail call i32 @rand() #8
  %conv.i = trunc i32 %call14.i to i8
  %7 = load i8*, i8** %6, align 4, !tbaa !11
  store i8 %conv.i, i8* %7, align 1, !tbaa !6
  %call14.i.1 = tail call i32 @rand() #8
  %conv.i.1 = trunc i32 %call14.i.1 to i8
  %8 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.1 = getelementptr inbounds i8, i8* %8, i32 1
  store i8 %conv.i.1, i8* %arrayidx.i.1, align 1, !tbaa !6
  %call14.i.2 = tail call i32 @rand() #8
  %conv.i.2 = trunc i32 %call14.i.2 to i8
  %9 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.2 = getelementptr inbounds i8, i8* %9, i32 2
  store i8 %conv.i.2, i8* %arrayidx.i.2, align 1, !tbaa !6
  %call14.i.3 = tail call i32 @rand() #8
  %conv.i.3 = trunc i32 %call14.i.3 to i8
  %10 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.3 = getelementptr inbounds i8, i8* %10, i32 3
  store i8 %conv.i.3, i8* %arrayidx.i.3, align 1, !tbaa !6
  %call14.i.4 = tail call i32 @rand() #8
  %conv.i.4 = trunc i32 %call14.i.4 to i8
  %11 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.4 = getelementptr inbounds i8, i8* %11, i32 4
  store i8 %conv.i.4, i8* %arrayidx.i.4, align 1, !tbaa !6
  %call14.i.5 = tail call i32 @rand() #8
  %conv.i.5 = trunc i32 %call14.i.5 to i8
  %12 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.5 = getelementptr inbounds i8, i8* %12, i32 5
  store i8 %conv.i.5, i8* %arrayidx.i.5, align 1, !tbaa !6
  %call14.i.6 = tail call i32 @rand() #8
  %conv.i.6 = trunc i32 %call14.i.6 to i8
  %13 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.6 = getelementptr inbounds i8, i8* %13, i32 6
  store i8 %conv.i.6, i8* %arrayidx.i.6, align 1, !tbaa !6
  %call14.i.7 = tail call i32 @rand() #8
  %conv.i.7 = trunc i32 %call14.i.7 to i8
  %14 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.7 = getelementptr inbounds i8, i8* %14, i32 7
  store i8 %conv.i.7, i8* %arrayidx.i.7, align 1, !tbaa !6
  %call14.i.8 = tail call i32 @rand() #8
  %conv.i.8 = trunc i32 %call14.i.8 to i8
  %15 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.8 = getelementptr inbounds i8, i8* %15, i32 8
  store i8 %conv.i.8, i8* %arrayidx.i.8, align 1, !tbaa !6
  %call14.i.9 = tail call i32 @rand() #8
  %conv.i.9 = trunc i32 %call14.i.9 to i8
  %16 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.9 = getelementptr inbounds i8, i8* %16, i32 9
  store i8 %conv.i.9, i8* %arrayidx.i.9, align 1, !tbaa !6
  %call14.i.10 = tail call i32 @rand() #8
  %conv.i.10 = trunc i32 %call14.i.10 to i8
  %17 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.10 = getelementptr inbounds i8, i8* %17, i32 10
  store i8 %conv.i.10, i8* %arrayidx.i.10, align 1, !tbaa !6
  %call14.i.11 = tail call i32 @rand() #8
  %conv.i.11 = trunc i32 %call14.i.11 to i8
  %18 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.11 = getelementptr inbounds i8, i8* %18, i32 11
  store i8 %conv.i.11, i8* %arrayidx.i.11, align 1, !tbaa !6
  %call14.i.12 = tail call i32 @rand() #8
  %conv.i.12 = trunc i32 %call14.i.12 to i8
  %19 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.12 = getelementptr inbounds i8, i8* %19, i32 12
  store i8 %conv.i.12, i8* %arrayidx.i.12, align 1, !tbaa !6
  %call14.i.13 = tail call i32 @rand() #8
  %conv.i.13 = trunc i32 %call14.i.13 to i8
  %20 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.13 = getelementptr inbounds i8, i8* %20, i32 13
  store i8 %conv.i.13, i8* %arrayidx.i.13, align 1, !tbaa !6
  %call14.i.14 = tail call i32 @rand() #8
  %conv.i.14 = trunc i32 %call14.i.14 to i8
  %21 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.14 = getelementptr inbounds i8, i8* %21, i32 14
  store i8 %conv.i.14, i8* %arrayidx.i.14, align 1, !tbaa !6
  %call14.i.15 = tail call i32 @rand() #8
  %conv.i.15 = trunc i32 %call14.i.15 to i8
  %22 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.15 = getelementptr inbounds i8, i8* %22, i32 15
  store i8 %conv.i.15, i8* %arrayidx.i.15, align 1, !tbaa !6
  %call14.i.16 = tail call i32 @rand() #8
  %conv.i.16 = trunc i32 %call14.i.16 to i8
  %23 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.16 = getelementptr inbounds i8, i8* %23, i32 16
  store i8 %conv.i.16, i8* %arrayidx.i.16, align 1, !tbaa !6
  %call14.i.17 = tail call i32 @rand() #8
  %conv.i.17 = trunc i32 %call14.i.17 to i8
  %24 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.17 = getelementptr inbounds i8, i8* %24, i32 17
  store i8 %conv.i.17, i8* %arrayidx.i.17, align 1, !tbaa !6
  %call14.i.18 = tail call i32 @rand() #8
  %conv.i.18 = trunc i32 %call14.i.18 to i8
  %25 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.18 = getelementptr inbounds i8, i8* %25, i32 18
  store i8 %conv.i.18, i8* %arrayidx.i.18, align 1, !tbaa !6
  %call14.i.19 = tail call i32 @rand() #8
  %conv.i.19 = trunc i32 %call14.i.19 to i8
  %26 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.19 = getelementptr inbounds i8, i8* %26, i32 19
  store i8 %conv.i.19, i8* %arrayidx.i.19, align 1, !tbaa !6
  %call14.i.20 = tail call i32 @rand() #8
  %conv.i.20 = trunc i32 %call14.i.20 to i8
  %27 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.20 = getelementptr inbounds i8, i8* %27, i32 20
  store i8 %conv.i.20, i8* %arrayidx.i.20, align 1, !tbaa !6
  %call14.i.21 = tail call i32 @rand() #8
  %conv.i.21 = trunc i32 %call14.i.21 to i8
  %28 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.21 = getelementptr inbounds i8, i8* %28, i32 21
  store i8 %conv.i.21, i8* %arrayidx.i.21, align 1, !tbaa !6
  %call14.i.22 = tail call i32 @rand() #8
  %conv.i.22 = trunc i32 %call14.i.22 to i8
  %29 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.22 = getelementptr inbounds i8, i8* %29, i32 22
  store i8 %conv.i.22, i8* %arrayidx.i.22, align 1, !tbaa !6
  %call14.i.23 = tail call i32 @rand() #8
  %conv.i.23 = trunc i32 %call14.i.23 to i8
  %30 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.23 = getelementptr inbounds i8, i8* %30, i32 23
  store i8 %conv.i.23, i8* %arrayidx.i.23, align 1, !tbaa !6
  %31 = bitcast i8* %ctx to i8**
  store i8* %call.i, i8** %31, align 4, !tbaa !7
  tail call fastcc void @oaes_key_expand(i8* nonnull %ctx) #8
  br label %oaes_key_gen.exit

oaes_key_gen.exit:                                ; preds = %entry, %if.end.i, %if.end7.i, %for.body.i.preheader
  %retval.0.i = phi i32 [ 0, %for.body.i.preheader ], [ 2, %entry ], [ 8, %if.end.i ], [ 8, %if.end7.i ]
  ret i32 %retval.0.i
}

; Function Attrs: nounwind
define hidden i32 @oaes_key_gen_256(i8* %ctx) local_unnamed_addr #0 {
entry:
  %cmp.i = icmp eq i8* %ctx, null
  br i1 %cmp.i, label %oaes_key_gen.exit, label %if.end.i

if.end.i:                                         ; preds = %entry
  %call.i = tail call dereferenceable_or_null(24) i8* @calloc(i32 24, i32 1) #8
  %cmp1.i = icmp eq i8* %call.i, null
  br i1 %cmp1.i, label %oaes_key_gen.exit, label %if.end3.i

if.end3.i:                                        ; preds = %if.end.i
  %key.i = bitcast i8* %ctx to %struct._oaes_key**
  %0 = load %struct._oaes_key*, %struct._oaes_key** %key.i, align 4, !tbaa !7
  %tobool.i = icmp eq %struct._oaes_key* %0, null
  br i1 %tobool.i, label %if.end7.i, label %if.end.i4

if.end.i4:                                        ; preds = %if.end3.i
  %data.i2 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %0, i32 0, i32 1
  %1 = load i8*, i8** %data.i2, align 4, !tbaa !11
  %tobool.i3 = icmp eq i8* %1, null
  br i1 %tobool.i3, label %if.end4.i, label %if.then1.i

if.then1.i:                                       ; preds = %if.end.i4
  tail call void @free(i8* nonnull %1) #8
  %2 = load %struct._oaes_key*, %struct._oaes_key** %key.i, align 4, !tbaa !13
  %data3.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %2, i32 0, i32 1
  store i8* null, i8** %data3.i, align 4, !tbaa !11
  %.pre.i = load %struct._oaes_key*, %struct._oaes_key** %key.i, align 4, !tbaa !13
  br label %if.end4.i

if.end4.i:                                        ; preds = %if.then1.i, %if.end.i4
  %.in.i = phi %struct._oaes_key* [ %0, %if.end.i4 ], [ %.pre.i, %if.then1.i ]
  %exp_data.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %.in.i, i32 0, i32 3
  %3 = load i8*, i8** %exp_data.i, align 4, !tbaa !14
  %tobool5.i = icmp eq i8* %3, null
  br i1 %tobool5.i, label %oaes_key_destroy.exit, label %if.then6.i

if.then6.i:                                       ; preds = %if.end4.i
  tail call void @free(i8* nonnull %3) #8
  %4 = load %struct._oaes_key*, %struct._oaes_key** %key.i, align 4, !tbaa !13
  %exp_data8.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %4, i32 0, i32 3
  store i8* null, i8** %exp_data8.i, align 4, !tbaa !14
  %.pre1.i = load %struct._oaes_key*, %struct._oaes_key** %key.i, align 4, !tbaa !13
  br label %oaes_key_destroy.exit

oaes_key_destroy.exit:                            ; preds = %if.end4.i, %if.then6.i
  %.in2.i = phi %struct._oaes_key* [ %.in.i, %if.end4.i ], [ %.pre1.i, %if.then6.i ]
  %5 = bitcast %struct._oaes_key* %.in2.i to i8*
  tail call void @free(i8* %5) #8
  store %struct._oaes_key* null, %struct._oaes_key** %key.i, align 4, !tbaa !13
  br label %if.end7.i

if.end7.i:                                        ; preds = %oaes_key_destroy.exit, %if.end3.i
  %data_len.i = bitcast i8* %call.i to i32*
  store i32 32, i32* %data_len.i, align 4, !tbaa !15
  %call8.i = tail call dereferenceable_or_null(32) i8* @calloc(i32 32, i32 1) #8
  %data.i = getelementptr inbounds i8, i8* %call.i, i32 4
  %6 = bitcast i8* %data.i to i8**
  store i8* %call8.i, i8** %6, align 4, !tbaa !11
  %cmp10.i = icmp eq i8* %call8.i, null
  br i1 %cmp10.i, label %oaes_key_gen.exit, label %for.body.i.preheader

for.body.i.preheader:                             ; preds = %if.end7.i
  %call14.i = tail call i32 @rand() #8
  %conv.i = trunc i32 %call14.i to i8
  %7 = load i8*, i8** %6, align 4, !tbaa !11
  store i8 %conv.i, i8* %7, align 1, !tbaa !6
  %call14.i.1 = tail call i32 @rand() #8
  %conv.i.1 = trunc i32 %call14.i.1 to i8
  %8 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.1 = getelementptr inbounds i8, i8* %8, i32 1
  store i8 %conv.i.1, i8* %arrayidx.i.1, align 1, !tbaa !6
  %call14.i.2 = tail call i32 @rand() #8
  %conv.i.2 = trunc i32 %call14.i.2 to i8
  %9 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.2 = getelementptr inbounds i8, i8* %9, i32 2
  store i8 %conv.i.2, i8* %arrayidx.i.2, align 1, !tbaa !6
  %call14.i.3 = tail call i32 @rand() #8
  %conv.i.3 = trunc i32 %call14.i.3 to i8
  %10 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.3 = getelementptr inbounds i8, i8* %10, i32 3
  store i8 %conv.i.3, i8* %arrayidx.i.3, align 1, !tbaa !6
  %call14.i.4 = tail call i32 @rand() #8
  %conv.i.4 = trunc i32 %call14.i.4 to i8
  %11 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.4 = getelementptr inbounds i8, i8* %11, i32 4
  store i8 %conv.i.4, i8* %arrayidx.i.4, align 1, !tbaa !6
  %call14.i.5 = tail call i32 @rand() #8
  %conv.i.5 = trunc i32 %call14.i.5 to i8
  %12 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.5 = getelementptr inbounds i8, i8* %12, i32 5
  store i8 %conv.i.5, i8* %arrayidx.i.5, align 1, !tbaa !6
  %call14.i.6 = tail call i32 @rand() #8
  %conv.i.6 = trunc i32 %call14.i.6 to i8
  %13 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.6 = getelementptr inbounds i8, i8* %13, i32 6
  store i8 %conv.i.6, i8* %arrayidx.i.6, align 1, !tbaa !6
  %call14.i.7 = tail call i32 @rand() #8
  %conv.i.7 = trunc i32 %call14.i.7 to i8
  %14 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.7 = getelementptr inbounds i8, i8* %14, i32 7
  store i8 %conv.i.7, i8* %arrayidx.i.7, align 1, !tbaa !6
  %call14.i.8 = tail call i32 @rand() #8
  %conv.i.8 = trunc i32 %call14.i.8 to i8
  %15 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.8 = getelementptr inbounds i8, i8* %15, i32 8
  store i8 %conv.i.8, i8* %arrayidx.i.8, align 1, !tbaa !6
  %call14.i.9 = tail call i32 @rand() #8
  %conv.i.9 = trunc i32 %call14.i.9 to i8
  %16 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.9 = getelementptr inbounds i8, i8* %16, i32 9
  store i8 %conv.i.9, i8* %arrayidx.i.9, align 1, !tbaa !6
  %call14.i.10 = tail call i32 @rand() #8
  %conv.i.10 = trunc i32 %call14.i.10 to i8
  %17 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.10 = getelementptr inbounds i8, i8* %17, i32 10
  store i8 %conv.i.10, i8* %arrayidx.i.10, align 1, !tbaa !6
  %call14.i.11 = tail call i32 @rand() #8
  %conv.i.11 = trunc i32 %call14.i.11 to i8
  %18 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.11 = getelementptr inbounds i8, i8* %18, i32 11
  store i8 %conv.i.11, i8* %arrayidx.i.11, align 1, !tbaa !6
  %call14.i.12 = tail call i32 @rand() #8
  %conv.i.12 = trunc i32 %call14.i.12 to i8
  %19 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.12 = getelementptr inbounds i8, i8* %19, i32 12
  store i8 %conv.i.12, i8* %arrayidx.i.12, align 1, !tbaa !6
  %call14.i.13 = tail call i32 @rand() #8
  %conv.i.13 = trunc i32 %call14.i.13 to i8
  %20 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.13 = getelementptr inbounds i8, i8* %20, i32 13
  store i8 %conv.i.13, i8* %arrayidx.i.13, align 1, !tbaa !6
  %call14.i.14 = tail call i32 @rand() #8
  %conv.i.14 = trunc i32 %call14.i.14 to i8
  %21 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.14 = getelementptr inbounds i8, i8* %21, i32 14
  store i8 %conv.i.14, i8* %arrayidx.i.14, align 1, !tbaa !6
  %call14.i.15 = tail call i32 @rand() #8
  %conv.i.15 = trunc i32 %call14.i.15 to i8
  %22 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.15 = getelementptr inbounds i8, i8* %22, i32 15
  store i8 %conv.i.15, i8* %arrayidx.i.15, align 1, !tbaa !6
  %call14.i.16 = tail call i32 @rand() #8
  %conv.i.16 = trunc i32 %call14.i.16 to i8
  %23 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.16 = getelementptr inbounds i8, i8* %23, i32 16
  store i8 %conv.i.16, i8* %arrayidx.i.16, align 1, !tbaa !6
  %call14.i.17 = tail call i32 @rand() #8
  %conv.i.17 = trunc i32 %call14.i.17 to i8
  %24 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.17 = getelementptr inbounds i8, i8* %24, i32 17
  store i8 %conv.i.17, i8* %arrayidx.i.17, align 1, !tbaa !6
  %call14.i.18 = tail call i32 @rand() #8
  %conv.i.18 = trunc i32 %call14.i.18 to i8
  %25 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.18 = getelementptr inbounds i8, i8* %25, i32 18
  store i8 %conv.i.18, i8* %arrayidx.i.18, align 1, !tbaa !6
  %call14.i.19 = tail call i32 @rand() #8
  %conv.i.19 = trunc i32 %call14.i.19 to i8
  %26 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.19 = getelementptr inbounds i8, i8* %26, i32 19
  store i8 %conv.i.19, i8* %arrayidx.i.19, align 1, !tbaa !6
  %call14.i.20 = tail call i32 @rand() #8
  %conv.i.20 = trunc i32 %call14.i.20 to i8
  %27 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.20 = getelementptr inbounds i8, i8* %27, i32 20
  store i8 %conv.i.20, i8* %arrayidx.i.20, align 1, !tbaa !6
  %call14.i.21 = tail call i32 @rand() #8
  %conv.i.21 = trunc i32 %call14.i.21 to i8
  %28 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.21 = getelementptr inbounds i8, i8* %28, i32 21
  store i8 %conv.i.21, i8* %arrayidx.i.21, align 1, !tbaa !6
  %call14.i.22 = tail call i32 @rand() #8
  %conv.i.22 = trunc i32 %call14.i.22 to i8
  %29 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.22 = getelementptr inbounds i8, i8* %29, i32 22
  store i8 %conv.i.22, i8* %arrayidx.i.22, align 1, !tbaa !6
  %call14.i.23 = tail call i32 @rand() #8
  %conv.i.23 = trunc i32 %call14.i.23 to i8
  %30 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.23 = getelementptr inbounds i8, i8* %30, i32 23
  store i8 %conv.i.23, i8* %arrayidx.i.23, align 1, !tbaa !6
  %call14.i.24 = tail call i32 @rand() #8
  %conv.i.24 = trunc i32 %call14.i.24 to i8
  %31 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.24 = getelementptr inbounds i8, i8* %31, i32 24
  store i8 %conv.i.24, i8* %arrayidx.i.24, align 1, !tbaa !6
  %call14.i.25 = tail call i32 @rand() #8
  %conv.i.25 = trunc i32 %call14.i.25 to i8
  %32 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.25 = getelementptr inbounds i8, i8* %32, i32 25
  store i8 %conv.i.25, i8* %arrayidx.i.25, align 1, !tbaa !6
  %call14.i.26 = tail call i32 @rand() #8
  %conv.i.26 = trunc i32 %call14.i.26 to i8
  %33 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.26 = getelementptr inbounds i8, i8* %33, i32 26
  store i8 %conv.i.26, i8* %arrayidx.i.26, align 1, !tbaa !6
  %call14.i.27 = tail call i32 @rand() #8
  %conv.i.27 = trunc i32 %call14.i.27 to i8
  %34 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.27 = getelementptr inbounds i8, i8* %34, i32 27
  store i8 %conv.i.27, i8* %arrayidx.i.27, align 1, !tbaa !6
  %call14.i.28 = tail call i32 @rand() #8
  %conv.i.28 = trunc i32 %call14.i.28 to i8
  %35 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.28 = getelementptr inbounds i8, i8* %35, i32 28
  store i8 %conv.i.28, i8* %arrayidx.i.28, align 1, !tbaa !6
  %call14.i.29 = tail call i32 @rand() #8
  %conv.i.29 = trunc i32 %call14.i.29 to i8
  %36 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.29 = getelementptr inbounds i8, i8* %36, i32 29
  store i8 %conv.i.29, i8* %arrayidx.i.29, align 1, !tbaa !6
  %call14.i.30 = tail call i32 @rand() #8
  %conv.i.30 = trunc i32 %call14.i.30 to i8
  %37 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.30 = getelementptr inbounds i8, i8* %37, i32 30
  store i8 %conv.i.30, i8* %arrayidx.i.30, align 1, !tbaa !6
  %call14.i.31 = tail call i32 @rand() #8
  %conv.i.31 = trunc i32 %call14.i.31 to i8
  %38 = load i8*, i8** %6, align 4, !tbaa !11
  %arrayidx.i.31 = getelementptr inbounds i8, i8* %38, i32 31
  store i8 %conv.i.31, i8* %arrayidx.i.31, align 1, !tbaa !6
  %39 = bitcast i8* %ctx to i8**
  store i8* %call.i, i8** %39, align 4, !tbaa !7
  tail call fastcc void @oaes_key_expand(i8* nonnull %ctx) #8
  br label %oaes_key_gen.exit

oaes_key_gen.exit:                                ; preds = %entry, %if.end.i, %if.end7.i, %for.body.i.preheader
  %retval.0.i = phi i32 [ 0, %for.body.i.preheader ], [ 2, %entry ], [ 8, %if.end.i ], [ 8, %if.end7.i ]
  ret i32 %retval.0.i
}

; Function Attrs: nounwind
define hidden i32 @oaes_key_export(i8* readonly %ctx, i8* %data, i32* %data_len) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq i8* %ctx, null
  br i1 %cmp, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %key = bitcast i8* %ctx to %struct._oaes_key**
  %0 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %cmp1 = icmp eq %struct._oaes_key* %0, null
  br i1 %cmp1, label %cleanup, label %if.end3

if.end3:                                          ; preds = %if.end
  %cmp4 = icmp eq i32* %data_len, null
  br i1 %cmp4, label %cleanup, label %if.end6

if.end6:                                          ; preds = %if.end3
  %1 = load i32, i32* %data_len, align 4, !tbaa !2
  %data_len8 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %0, i32 0, i32 0
  %2 = load i32, i32* %data_len8, align 4, !tbaa !15
  %add = add i32 %2, 16
  store i32 %add, i32* %data_len, align 4, !tbaa !2
  %cmp9 = icmp eq i8* %data, null
  br i1 %cmp9, label %cleanup, label %if.end11

if.end11:                                         ; preds = %if.end6
  %cmp12 = icmp ult i32 %1, %add
  br i1 %cmp12, label %cleanup, label %if.end14

if.end14:                                         ; preds = %if.end11
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(16) %data, i8* nonnull align 16 dereferenceable(16) getelementptr inbounds (<{ i8, i8, i8, i8, i8, i8, [10 x i8] }>, <{ i8, i8, i8, i8, i8, i8, [10 x i8] }>* @oaes_header, i32 0, i32 0), i32 16, i1 false)
  %arrayidx = getelementptr inbounds i8, i8* %data, i32 5
  store i8 1, i8* %arrayidx, align 1, !tbaa !6
  %3 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %data_len16 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %3, i32 0, i32 0
  %4 = load i32, i32* %data_len16, align 4, !tbaa !15
  %conv = trunc i32 %4 to i8
  %arrayidx17 = getelementptr inbounds i8, i8* %data, i32 7
  store i8 %conv, i8* %arrayidx17, align 1, !tbaa !6
  %add.ptr = getelementptr inbounds i8, i8* %data, i32 16
  %5 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %data19 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %5, i32 0, i32 1
  %6 = load i8*, i8** %data19, align 4, !tbaa !11
  %data_len21 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %5, i32 0, i32 0
  %7 = load i32, i32* %data_len21, align 4, !tbaa !15
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %add.ptr, i8* align 1 %6, i32 %7, i1 false)
  br label %cleanup

cleanup:                                          ; preds = %if.end11, %if.end6, %if.end3, %if.end, %entry, %if.end14
  %retval.0 = phi i32 [ 0, %if.end14 ], [ 2, %entry ], [ 7, %if.end ], [ 4, %if.end3 ], [ 0, %if.end6 ], [ 9, %if.end11 ]
  ret i32 %retval.0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #1

; Function Attrs: nounwind
define hidden i32 @oaes_key_export_data(i8* readonly %ctx, i8* %data, i32* %data_len) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq i8* %ctx, null
  br i1 %cmp, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %key = bitcast i8* %ctx to %struct._oaes_key**
  %0 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %cmp1 = icmp eq %struct._oaes_key* %0, null
  br i1 %cmp1, label %cleanup, label %if.end3

if.end3:                                          ; preds = %if.end
  %cmp4 = icmp eq i32* %data_len, null
  br i1 %cmp4, label %cleanup, label %if.end6

if.end6:                                          ; preds = %if.end3
  %1 = load i32, i32* %data_len, align 4, !tbaa !2
  %data_len8 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %0, i32 0, i32 0
  %2 = load i32, i32* %data_len8, align 4, !tbaa !15
  store i32 %2, i32* %data_len, align 4, !tbaa !2
  %cmp9 = icmp eq i8* %data, null
  br i1 %cmp9, label %cleanup, label %if.end11

if.end11:                                         ; preds = %if.end6
  %cmp12 = icmp ult i32 %1, %2
  br i1 %cmp12, label %cleanup, label %if.end14

if.end14:                                         ; preds = %if.end11
  %data16 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %0, i32 0, i32 1
  %3 = load i8*, i8** %data16, align 4, !tbaa !11
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %data, i8* align 1 %3, i32 %2, i1 false)
  br label %cleanup

cleanup:                                          ; preds = %if.end11, %if.end6, %if.end3, %if.end, %entry, %if.end14
  %retval.0 = phi i32 [ 0, %if.end14 ], [ 2, %entry ], [ 7, %if.end ], [ 4, %if.end3 ], [ 0, %if.end6 ], [ 9, %if.end11 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define hidden i32 @oaes_key_import(i8* %ctx, i8* readonly %data, i32 %data_len) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq i8* %ctx, null
  br i1 %cmp, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %cmp1 = icmp eq i8* %data, null
  br i1 %cmp1, label %cleanup, label %if.end3

if.end3:                                          ; preds = %if.end
  switch i32 %data_len, label %cleanup [
    i32 32, label %sw.epilog
    i32 40, label %sw.epilog
    i32 48, label %sw.epilog
  ]

sw.epilog:                                        ; preds = %if.end3, %if.end3, %if.end3
  %call = tail call i32 @memcmp(i8* nonnull dereferenceable(4) %data, i8* nonnull dereferenceable(4) getelementptr inbounds (<{ i8, i8, i8, i8, i8, i8, [10 x i8] }>, <{ i8, i8, i8, i8, i8, i8, [10 x i8] }>* @oaes_header, i32 0, i32 0), i32 4)
  %cmp4 = icmp eq i32 %call, 0
  br i1 %cmp4, label %if.end6, label %cleanup

if.end6:                                          ; preds = %sw.epilog
  %arrayidx = getelementptr inbounds i8, i8* %data, i32 4
  %0 = load i8, i8* %arrayidx, align 1, !tbaa !6
  %cond = icmp eq i8 %0, 1
  br i1 %cond, label %sw.epilog8, label %cleanup

sw.epilog8:                                       ; preds = %if.end6
  %arrayidx9 = getelementptr inbounds i8, i8* %data, i32 5
  %1 = load i8, i8* %arrayidx9, align 1, !tbaa !6
  %cond59 = icmp eq i8 %1, 1
  br i1 %cond59, label %sw.epilog12, label %cleanup

sw.epilog12:                                      ; preds = %sw.epilog8
  %arrayidx13 = getelementptr inbounds i8, i8* %data, i32 7
  %2 = load i8, i8* %arrayidx13, align 1, !tbaa !6
  %conv14 = zext i8 %2 to i32
  switch i8 %2, label %cleanup [
    i8 16, label %sw.epilog17
    i8 24, label %sw.epilog17
    i8 32, label %sw.epilog17
  ]

sw.epilog17:                                      ; preds = %sw.epilog12, %sw.epilog12, %sw.epilog12
  %add = add nuw nsw i32 %conv14, 16
  %cmp18 = icmp eq i32 %add, %data_len
  br i1 %cmp18, label %if.end21, label %cleanup

if.end21:                                         ; preds = %sw.epilog17
  %key = bitcast i8* %ctx to %struct._oaes_key**
  %3 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %tobool = icmp eq %struct._oaes_key* %3, null
  br i1 %tobool, label %if.end25, label %if.end.i

if.end.i:                                         ; preds = %if.end21
  %data.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %3, i32 0, i32 1
  %4 = load i8*, i8** %data.i, align 4, !tbaa !11
  %tobool.i = icmp eq i8* %4, null
  br i1 %tobool.i, label %if.end4.i, label %if.then1.i

if.then1.i:                                       ; preds = %if.end.i
  tail call void @free(i8* nonnull %4) #8
  %5 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !13
  %data3.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %5, i32 0, i32 1
  store i8* null, i8** %data3.i, align 4, !tbaa !11
  %.pre.i = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !13
  br label %if.end4.i

if.end4.i:                                        ; preds = %if.then1.i, %if.end.i
  %.in.i = phi %struct._oaes_key* [ %3, %if.end.i ], [ %.pre.i, %if.then1.i ]
  %exp_data.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %.in.i, i32 0, i32 3
  %6 = load i8*, i8** %exp_data.i, align 4, !tbaa !14
  %tobool5.i = icmp eq i8* %6, null
  br i1 %tobool5.i, label %oaes_key_destroy.exit, label %if.then6.i

if.then6.i:                                       ; preds = %if.end4.i
  tail call void @free(i8* nonnull %6) #8
  %7 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !13
  %exp_data8.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %7, i32 0, i32 3
  store i8* null, i8** %exp_data8.i, align 4, !tbaa !14
  %.pre1.i = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !13
  br label %oaes_key_destroy.exit

oaes_key_destroy.exit:                            ; preds = %if.end4.i, %if.then6.i
  %.in2.i = phi %struct._oaes_key* [ %.in.i, %if.end4.i ], [ %.pre1.i, %if.then6.i ]
  %8 = bitcast %struct._oaes_key* %.in2.i to i8*
  tail call void @free(i8* %8) #8
  store %struct._oaes_key* null, %struct._oaes_key** %key, align 4, !tbaa !13
  br label %if.end25

if.end25:                                         ; preds = %if.end21, %oaes_key_destroy.exit
  %call26 = tail call dereferenceable_or_null(24) i8* @calloc(i32 24, i32 1)
  %9 = bitcast i8* %ctx to i8**
  store i8* %call26, i8** %9, align 4, !tbaa !7
  %cmp29 = icmp eq i8* %call26, null
  br i1 %cmp29, label %cleanup, label %if.end32

if.end32:                                         ; preds = %if.end25
  %data_len34 = bitcast i8* %call26 to i32*
  store i32 %conv14, i32* %data_len34, align 4, !tbaa !15
  %call35 = tail call i8* @calloc(i32 %conv14, i32 1)
  %data37 = getelementptr inbounds i8, i8* %call26, i32 4
  %10 = bitcast i8* %data37 to i8**
  store i8* %call35, i8** %10, align 4, !tbaa !11
  %cmp40 = icmp eq i8* %call35, null
  br i1 %cmp40, label %if.end9.i106, label %if.end45

if.end9.i106:                                     ; preds = %if.end32
  tail call void @free(i8* nonnull %call26) #8
  store %struct._oaes_key* null, %struct._oaes_key** %key, align 4, !tbaa !13
  br label %cleanup

if.end45:                                         ; preds = %if.end32
  %add.ptr = getelementptr inbounds i8, i8* %data, i32 16
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %call35, i8* nonnull align 1 %add.ptr, i32 %conv14, i1 false)
  tail call fastcc void @oaes_key_expand(i8* nonnull %ctx)
  br label %cleanup

cleanup:                                          ; preds = %if.end9.i106, %if.end25, %sw.epilog17, %sw.epilog12, %sw.epilog8, %if.end6, %sw.epilog, %if.end3, %if.end, %entry, %if.end45
  %retval.0 = phi i32 [ 0, %if.end45 ], [ 2, %entry ], [ 3, %if.end ], [ 4, %if.end3 ], [ 10, %sw.epilog ], [ 10, %if.end6 ], [ 10, %sw.epilog8 ], [ 10, %sw.epilog12 ], [ 4, %sw.epilog17 ], [ 8, %if.end25 ], [ 8, %if.end9.i106 ]
  ret i32 %retval.0
}

; Function Attrs: nofree nounwind readonly
declare i32 @memcmp(i8* nocapture, i8* nocapture, i32) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare noalias i8* @calloc(i32, i32) local_unnamed_addr #2

; Function Attrs: nounwind
define internal fastcc void @oaes_key_expand(i8* nocapture readonly %ctx) unnamed_addr #0 {
entry:
  %_temp = alloca i32, align 4
  %key = bitcast i8* %ctx to %struct._oaes_key**
  %0 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %key_base = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %0, i32 0, i32 5
  store i32 8, i32* %key_base, align 4, !tbaa !16
  %num_keys = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %0, i32 0, i32 4
  store i32 15, i32* %num_keys, align 4, !tbaa !17
  %exp_data_len = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %0, i32 0, i32 2
  store i32 240, i32* %exp_data_len, align 4, !tbaa !18
  %call = tail call dereferenceable_or_null(240) i8* @calloc(i32 240, i32 1)
  %exp_data = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %0, i32 0, i32 3
  store i8* %call, i8** %exp_data, align 4, !tbaa !14
  %data = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %0, i32 0, i32 1
  %1 = load i8*, i8** %data, align 4, !tbaa !11
  %data_len = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %0, i32 0, i32 0
  %2 = load i32, i32* %data_len, align 4, !tbaa !15
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 1 %call, i8* align 1 %1, i32 %2, i1 false)
  %3 = bitcast i32* %_temp to i8*
  %_temp.sroa.0.0.add.ptr.sroa_raw_idx.i = getelementptr inbounds i8, i8* %3, i32 1
  %_temp.sroa.4.0..sroa_raw_idx.i = getelementptr inbounds i8, i8* %3, i32 3
  %add.ptr39.2 = getelementptr inbounds i8, i8* %3, i32 2
  br label %for.body

for.body:                                         ; preds = %if.end44.for.body_crit_edge, %entry
  %4 = phi %struct._oaes_key* [ %0, %entry ], [ %.pre, %if.end44.for.body_crit_edge ]
  %_i.010 = phi i32 [ 8, %entry ], [ %inc70, %if.end44.for.body_crit_edge ]
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #8
  %exp_data11 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %4, i32 0, i32 3
  %5 = load i8*, i8** %exp_data11, align 4, !tbaa !14
  %sub = shl nuw nsw i32 %_i.010, 2
  %mul = add nsw i32 %sub, -4
  %add.ptr = getelementptr inbounds i8, i8* %5, i32 %mul
  %6 = bitcast i8* %add.ptr to i32*
  %7 = load i32, i32* %6, align 1
  store i32 %7, i32* %_temp, align 4
  %rem = and i32 %_i.010, 7
  %cmp12 = icmp eq i32 %rem, 0
  %8 = lshr i32 %7, 8
  %9 = lshr i32 %7, 16
  %10 = lshr i32 %7, 24
  br i1 %cmp12, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  call void @llvm.memmove.p0i8.p0i8.i32(i8* nonnull align 4 dereferenceable(3) %3, i8* nonnull align 1 dereferenceable(3) %_temp.sroa.0.0.add.ptr.sroa_raw_idx.i, i32 3, i1 false) #8
  %11 = load i8, i8* %3, align 4, !tbaa !6
  %conv.i3 = zext i8 %11 to i32
  %shr.i4 = lshr i32 %conv.i3, 4
  %and1.i5 = and i32 %conv.i3, 15
  %arrayidx2.i6 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i4, i32 %and1.i5
  %12 = load i8, i8* %arrayidx2.i6, align 1, !tbaa !6
  %13 = load i8, i8* %_temp.sroa.0.0.add.ptr.sroa_raw_idx.i, align 1, !tbaa !6
  %conv.i3.1 = zext i8 %13 to i32
  %shr.i4.1 = lshr i32 %conv.i3.1, 4
  %and1.i5.1 = and i32 %conv.i3.1, 15
  %arrayidx2.i6.1 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i4.1, i32 %and1.i5.1
  %14 = load i8, i8* %arrayidx2.i6.1, align 1, !tbaa !6
  store i8 %14, i8* %_temp.sroa.0.0.add.ptr.sroa_raw_idx.i, align 1, !tbaa !6
  %15 = load i8, i8* %add.ptr39.2, align 2, !tbaa !6
  %conv.i3.2 = zext i8 %15 to i32
  %shr.i4.2 = lshr i32 %conv.i3.2, 4
  %and1.i5.2 = and i32 %conv.i3.2, 15
  %arrayidx2.i6.2 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i4.2, i32 %and1.i5.2
  %16 = load i8, i8* %arrayidx2.i6.2, align 1, !tbaa !6
  store i8 %16, i8* %add.ptr39.2, align 2, !tbaa !6
  %conv.i3.3 = lshr i32 %7, 4
  %shr.i4.3 = and i32 %conv.i3.3, 15
  %and1.i5.3 = and i32 %7, 15
  %arrayidx2.i6.3 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i4.3, i32 %and1.i5.3
  %17 = load i8, i8* %arrayidx2.i6.3, align 1, !tbaa !6
  store i8 %17, i8* %_temp.sroa.4.0..sroa_raw_idx.i, align 1, !tbaa !6
  %key_base22 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %4, i32 0, i32 5
  %18 = load i32, i32* %key_base22, align 4, !tbaa !16
  %div = udiv i32 %_i.010, %18
  %sub23 = add nsw i32 %div, -1
  %arrayidx24 = getelementptr inbounds [10 x i8], [10 x i8]* @oaes_gf_8, i32 0, i32 %sub23
  %19 = load i8, i8* %arrayidx24, align 1, !tbaa !6
  %xor2 = xor i8 %19, %12
  store i8 %xor2, i8* %3, align 4, !tbaa !6
  br label %if.end44

if.else:                                          ; preds = %for.body
  %20 = trunc i32 %7 to i8
  %21 = trunc i32 %10 to i8
  %22 = trunc i32 %9 to i8
  %23 = trunc i32 %8 to i8
  %key_base29 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %4, i32 0, i32 5
  %24 = load i32, i32* %key_base29, align 4, !tbaa !16
  %rem30 = urem i32 %_i.010, %24
  %cmp31 = icmp eq i32 %rem30, 4
  br i1 %cmp31, label %for.body37.preheader, label %if.end44

for.body37.preheader:                             ; preds = %if.else
  %conv.i = lshr i32 %7, 4
  %shr.i = and i32 %conv.i, 15
  %and1.i = and i32 %7, 15
  %arrayidx2.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i, i32 %and1.i
  %25 = load i8, i8* %arrayidx2.i, align 1, !tbaa !6
  store i8 %25, i8* %3, align 4, !tbaa !6
  %conv.i.1 = lshr i32 %7, 12
  %shr.i.1 = and i32 %conv.i.1, 15
  %and1.i.1 = and i32 %8, 15
  %arrayidx2.i.1 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.1, i32 %and1.i.1
  %26 = load i8, i8* %arrayidx2.i.1, align 1, !tbaa !6
  store i8 %26, i8* %_temp.sroa.0.0.add.ptr.sroa_raw_idx.i, align 1, !tbaa !6
  %conv.i.2 = lshr i32 %7, 20
  %shr.i.2 = and i32 %conv.i.2, 15
  %and1.i.2 = and i32 %9, 15
  %arrayidx2.i.2 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.2, i32 %and1.i.2
  %27 = load i8, i8* %arrayidx2.i.2, align 1, !tbaa !6
  store i8 %27, i8* %add.ptr39.2, align 2, !tbaa !6
  %shr.i.3 = lshr i32 %7, 28
  %and1.i.3 = and i32 %10, 15
  %arrayidx2.i.3 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.3, i32 %and1.i.3
  %28 = load i8, i8* %arrayidx2.i.3, align 1, !tbaa !6
  store i8 %28, i8* %_temp.sroa.4.0..sroa_raw_idx.i, align 1, !tbaa !6
  br label %if.end44

if.end44:                                         ; preds = %for.body37.preheader, %if.else, %if.then
  %29 = phi i8 [ %28, %for.body37.preheader ], [ %21, %if.else ], [ %17, %if.then ]
  %30 = phi i8 [ %27, %for.body37.preheader ], [ %22, %if.else ], [ %16, %if.then ]
  %31 = phi i8 [ %26, %for.body37.preheader ], [ %23, %if.else ], [ %14, %if.then ]
  %32 = phi i8 [ %25, %for.body37.preheader ], [ %20, %if.else ], [ %xor2, %if.then ]
  %33 = phi i32 [ %24, %for.body37.preheader ], [ %24, %if.else ], [ %18, %if.then ]
  %sub53 = sub i32 %_i.010, %33
  %mul54 = shl i32 %sub53, 2
  %arrayidx55 = getelementptr inbounds i8, i8* %5, i32 %mul54
  %34 = load i8, i8* %arrayidx55, align 1, !tbaa !6
  %xor591 = xor i8 %32, %34
  %arrayidx65 = getelementptr inbounds i8, i8* %5, i32 %sub
  store i8 %xor591, i8* %arrayidx65, align 1, !tbaa !6
  %35 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data50.1 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %35, i32 0, i32 3
  %36 = load i8*, i8** %exp_data50.1, align 4, !tbaa !14
  %key_base52.1 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %35, i32 0, i32 5
  %37 = load i32, i32* %key_base52.1, align 4, !tbaa !16
  %sub53.1 = sub i32 %_i.010, %37
  %mul54.1 = shl i32 %sub53.1, 2
  %add.1 = or i32 %mul54.1, 1
  %arrayidx55.1 = getelementptr inbounds i8, i8* %36, i32 %add.1
  %38 = load i8, i8* %arrayidx55.1, align 1, !tbaa !6
  %xor591.1 = xor i8 %31, %38
  %add64.1 = or i32 %sub, 1
  %arrayidx65.1 = getelementptr inbounds i8, i8* %36, i32 %add64.1
  store i8 %xor591.1, i8* %arrayidx65.1, align 1, !tbaa !6
  %39 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data50.2 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %39, i32 0, i32 3
  %40 = load i8*, i8** %exp_data50.2, align 4, !tbaa !14
  %key_base52.2 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %39, i32 0, i32 5
  %41 = load i32, i32* %key_base52.2, align 4, !tbaa !16
  %sub53.2 = sub i32 %_i.010, %41
  %mul54.2 = shl i32 %sub53.2, 2
  %add.2 = or i32 %mul54.2, 2
  %arrayidx55.2 = getelementptr inbounds i8, i8* %40, i32 %add.2
  %42 = load i8, i8* %arrayidx55.2, align 1, !tbaa !6
  %xor591.2 = xor i8 %30, %42
  %add64.2 = or i32 %sub, 2
  %arrayidx65.2 = getelementptr inbounds i8, i8* %40, i32 %add64.2
  store i8 %xor591.2, i8* %arrayidx65.2, align 1, !tbaa !6
  %43 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data50.3 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %43, i32 0, i32 3
  %44 = load i8*, i8** %exp_data50.3, align 4, !tbaa !14
  %key_base52.3 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %43, i32 0, i32 5
  %45 = load i32, i32* %key_base52.3, align 4, !tbaa !16
  %sub53.3 = sub i32 %_i.010, %45
  %mul54.3 = shl i32 %sub53.3, 2
  %add.3 = or i32 %mul54.3, 3
  %arrayidx55.3 = getelementptr inbounds i8, i8* %44, i32 %add.3
  %46 = load i8, i8* %arrayidx55.3, align 1, !tbaa !6
  %xor591.3 = xor i8 %29, %46
  %add64.3 = or i32 %sub, 3
  %arrayidx65.3 = getelementptr inbounds i8, i8* %44, i32 %add64.3
  store i8 %xor591.3, i8* %arrayidx65.3, align 1, !tbaa !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #8
  %inc70 = add nuw nsw i32 %_i.010, 1
  %exitcond = icmp eq i32 %inc70, 60
  br i1 %exitcond, label %for.end71, label %if.end44.for.body_crit_edge

if.end44.for.body_crit_edge:                      ; preds = %if.end44
  %.pre = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  br label %for.body

for.end71:                                        ; preds = %if.end44
  ret void
}

; Function Attrs: nounwind
define hidden i32 @oaes_key_import_data(i8* nocapture %ctx, i8* nocapture readonly %data, i32 %data_len) local_unnamed_addr #0 {
entry:
  %call = tail call dereferenceable_or_null(24) i8* @calloc(i32 24, i32 1)
  %0 = bitcast i8* %ctx to i8**
  store i8* %call, i8** %0, align 4, !tbaa !7
  %data_len2 = bitcast i8* %call to i32*
  store i32 %data_len, i32* %data_len2, align 4, !tbaa !15
  %call3 = tail call i8* @calloc(i32 %data_len, i32 1)
  %data5 = getelementptr inbounds i8, i8* %call, i32 4
  %1 = bitcast i8* %data5 to i8**
  store i8* %call3, i8** %1, align 4, !tbaa !11
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 1 %call3, i8* align 1 %data, i32 %data_len, i1 false)
  tail call fastcc void @oaes_key_expand(i8* %ctx)
  ret i32 0
}

; Function Attrs: nounwind
define hidden i8* @oaes_alloc() local_unnamed_addr #0 {
entry:
  %timer.i = alloca %struct.timeb, align 4
  %call = tail call dereferenceable_or_null(24) i8* @calloc(i32 24, i32 1)
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %0 = bitcast %struct.timeb* %timer.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %0) #8
  %call.i = call i32 @ftime(%struct.timeb* nonnull %timer.i) #8
  %time.i = getelementptr inbounds %struct.timeb, %struct.timeb* %timer.i, i32 0, i32 0
  %call1.i = call %struct.tm* @gmtime(i32* nonnull %time.i) #8
  %millitm.i = getelementptr inbounds %struct.timeb, %struct.timeb* %timer.i, i32 0, i32 1
  %1 = load i16, i16* %millitm.i, align 4, !tbaa !19
  %conv.i = zext i16 %1 to i32
  %call2.i = call i8* @calloc(i32 1, i32 %conv.i) #8
  %tm_year.i = getelementptr inbounds %struct.tm, %struct.tm* %call1.i, i32 0, i32 5
  %2 = load i32, i32* %tm_year.i, align 4, !tbaa !21
  %tm_mon.i = getelementptr inbounds %struct.tm, %struct.tm* %call1.i, i32 0, i32 4
  %3 = load i32, i32* %tm_mon.i, align 4, !tbaa !24
  %tm_mday.i = getelementptr inbounds %struct.tm, %struct.tm* %call1.i, i32 0, i32 3
  %4 = load i32, i32* %tm_mday.i, align 4, !tbaa !25
  %tm_hour.i = getelementptr inbounds %struct.tm, %struct.tm* %call1.i, i32 0, i32 2
  %5 = load i32, i32* %tm_hour.i, align 4, !tbaa !26
  %tm_min.i = getelementptr inbounds %struct.tm, %struct.tm* %call1.i, i32 0, i32 1
  %6 = load i32, i32* %tm_min.i, align 4, !tbaa !27
  %tm_sec.i = getelementptr inbounds %struct.tm, %struct.tm* %call1.i, i32 0, i32 0
  %7 = load i32, i32* %tm_sec.i, align 4, !tbaa !28
  %add.ptr.i = getelementptr inbounds i8, i8* %call2.i, i32 %conv.i
  %8 = ptrtoint i8* %add.ptr.i to i32
  %call15.i = call i32 @getpid() #8
  %add3.i = add nuw nsw i32 %conv.i, 1901
  %add4.i = add i32 %add3.i, %2
  %add5.i = add i32 %add4.i, %3
  %add6.i = add i32 %add5.i, %8
  %add7.i = add i32 %add6.i, %4
  %add8.i = add i32 %add7.i, %5
  %add11.i = add i32 %add8.i, %6
  %add14.i = add i32 %add11.i, %7
  %add16.i = add i32 %add14.i, %call15.i
  %tobool.i = icmp eq i8* %call2.i, null
  br i1 %tobool.i, label %oaes_get_seed.exit, label %if.then.i

if.then.i:                                        ; preds = %if.end
  call void @free(i8* nonnull %call2.i) #8
  br label %oaes_get_seed.exit

oaes_get_seed.exit:                               ; preds = %if.end, %if.then.i
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %0) #8
  call void @srand(i32 %add16.i) #8
  %key = bitcast i8* %call to %struct._oaes_key**
  store %struct._oaes_key* null, %struct._oaes_key** %key, align 4, !tbaa !7
  %call2 = call i32 @oaes_set_option(i8* nonnull %call, i16 zeroext 2, i8* null)
  br label %cleanup

cleanup:                                          ; preds = %entry, %oaes_get_seed.exit
  ret i8* %call
}

declare void @srand(i32) local_unnamed_addr #4

; Function Attrs: nounwind
define hidden i32 @oaes_set_option(i8* %ctx, i16 zeroext %option, i8* readonly %value) local_unnamed_addr #0 {
entry:
  %cmp = icmp eq i8* %ctx, null
  br i1 %cmp, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  switch i16 %option, label %cleanup [
    i16 1, label %sw.bb
    i16 2, label %sw.bb3
  ]

sw.bb:                                            ; preds = %if.end
  %options = getelementptr inbounds i8, i8* %ctx, i32 4
  %0 = bitcast i8* %options to i16*
  %1 = load i16, i16* %0, align 4, !tbaa !29
  %2 = and i16 %1, -3
  store i16 %2, i16* %0, align 4, !tbaa !29
  %iv = getelementptr inbounds i8, i8* %ctx, i32 6
  tail call void @llvm.memset.p0i8.i32(i8* nonnull align 2 dereferenceable(16) %iv, i8 0, i32 16, i1 false)
  br label %sw.epilog

sw.bb3:                                           ; preds = %if.end
  %options4 = getelementptr inbounds i8, i8* %ctx, i32 4
  %3 = bitcast i8* %options4 to i16*
  %4 = load i16, i16* %3, align 4, !tbaa !29
  %5 = and i16 %4, -2
  store i16 %5, i16* %3, align 4, !tbaa !29
  %tobool = icmp eq i8* %value, null
  %iv14 = getelementptr inbounds i8, i8* %ctx, i32 6
  br i1 %tobool, label %for.body.preheader, label %if.then8

for.body.preheader:                               ; preds = %sw.bb3
  %call = tail call i32 @rand() #8
  %conv13 = trunc i32 %call to i8
  store i8 %conv13, i8* %iv14, align 1, !tbaa !6
  %call.1 = tail call i32 @rand() #8
  %conv13.1 = trunc i32 %call.1 to i8
  %arrayidx.1 = getelementptr inbounds i8, i8* %ctx, i32 7
  store i8 %conv13.1, i8* %arrayidx.1, align 1, !tbaa !6
  %call.2 = tail call i32 @rand() #8
  %conv13.2 = trunc i32 %call.2 to i8
  %arrayidx.2 = getelementptr inbounds i8, i8* %ctx, i32 8
  store i8 %conv13.2, i8* %arrayidx.2, align 1, !tbaa !6
  %call.3 = tail call i32 @rand() #8
  %conv13.3 = trunc i32 %call.3 to i8
  %arrayidx.3 = getelementptr inbounds i8, i8* %ctx, i32 9
  store i8 %conv13.3, i8* %arrayidx.3, align 1, !tbaa !6
  %call.4 = tail call i32 @rand() #8
  %conv13.4 = trunc i32 %call.4 to i8
  %arrayidx.4 = getelementptr inbounds i8, i8* %ctx, i32 10
  store i8 %conv13.4, i8* %arrayidx.4, align 1, !tbaa !6
  %call.5 = tail call i32 @rand() #8
  %conv13.5 = trunc i32 %call.5 to i8
  %arrayidx.5 = getelementptr inbounds i8, i8* %ctx, i32 11
  store i8 %conv13.5, i8* %arrayidx.5, align 1, !tbaa !6
  %call.6 = tail call i32 @rand() #8
  %conv13.6 = trunc i32 %call.6 to i8
  %arrayidx.6 = getelementptr inbounds i8, i8* %ctx, i32 12
  store i8 %conv13.6, i8* %arrayidx.6, align 1, !tbaa !6
  %call.7 = tail call i32 @rand() #8
  %conv13.7 = trunc i32 %call.7 to i8
  %arrayidx.7 = getelementptr inbounds i8, i8* %ctx, i32 13
  store i8 %conv13.7, i8* %arrayidx.7, align 1, !tbaa !6
  %call.8 = tail call i32 @rand() #8
  %conv13.8 = trunc i32 %call.8 to i8
  %arrayidx.8 = getelementptr inbounds i8, i8* %ctx, i32 14
  store i8 %conv13.8, i8* %arrayidx.8, align 1, !tbaa !6
  %call.9 = tail call i32 @rand() #8
  %conv13.9 = trunc i32 %call.9 to i8
  %arrayidx.9 = getelementptr inbounds i8, i8* %ctx, i32 15
  store i8 %conv13.9, i8* %arrayidx.9, align 1, !tbaa !6
  %call.10 = tail call i32 @rand() #8
  %conv13.10 = trunc i32 %call.10 to i8
  %arrayidx.10 = getelementptr inbounds i8, i8* %ctx, i32 16
  store i8 %conv13.10, i8* %arrayidx.10, align 1, !tbaa !6
  %call.11 = tail call i32 @rand() #8
  %conv13.11 = trunc i32 %call.11 to i8
  %arrayidx.11 = getelementptr inbounds i8, i8* %ctx, i32 17
  store i8 %conv13.11, i8* %arrayidx.11, align 1, !tbaa !6
  %call.12 = tail call i32 @rand() #8
  %conv13.12 = trunc i32 %call.12 to i8
  %arrayidx.12 = getelementptr inbounds i8, i8* %ctx, i32 18
  store i8 %conv13.12, i8* %arrayidx.12, align 1, !tbaa !6
  %call.13 = tail call i32 @rand() #8
  %conv13.13 = trunc i32 %call.13 to i8
  %arrayidx.13 = getelementptr inbounds i8, i8* %ctx, i32 19
  store i8 %conv13.13, i8* %arrayidx.13, align 1, !tbaa !6
  %call.14 = tail call i32 @rand() #8
  %conv13.14 = trunc i32 %call.14 to i8
  %arrayidx.14 = getelementptr inbounds i8, i8* %ctx, i32 20
  store i8 %conv13.14, i8* %arrayidx.14, align 1, !tbaa !6
  %call.15 = tail call i32 @rand() #8
  %conv13.15 = trunc i32 %call.15 to i8
  %arrayidx.15 = getelementptr inbounds i8, i8* %ctx, i32 21
  store i8 %conv13.15, i8* %arrayidx.15, align 1, !tbaa !6
  %.pre = load i16, i16* %3, align 4, !tbaa !29
  br label %sw.epilog

if.then8:                                         ; preds = %sw.bb3
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 2 dereferenceable(16) %iv14, i8* nonnull align 1 dereferenceable(16) %value, i32 16, i1 false)
  br label %sw.epilog

sw.epilog:                                        ; preds = %for.body.preheader, %if.then8, %sw.bb
  %.pre-phi = phi i16* [ %3, %for.body.preheader ], [ %3, %if.then8 ], [ %0, %sw.bb ]
  %6 = phi i16 [ %.pre, %for.body.preheader ], [ %5, %if.then8 ], [ %2, %sw.bb ]
  %or33 = or i16 %6, %option
  store i16 %or33, i16* %.pre-phi, align 4, !tbaa !29
  br label %cleanup

cleanup:                                          ; preds = %if.end, %entry, %sw.epilog
  %retval.0 = phi i32 [ 0, %sw.epilog ], [ 2, %entry ], [ 3, %if.end ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define hidden i32 @oaes_free(i8** %ctx) local_unnamed_addr #0 {
entry:
  %0 = bitcast i8** %ctx to %struct._oaes_ctx**
  %cmp = icmp eq i8** %ctx, null
  br i1 %cmp, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %1 = load %struct._oaes_ctx*, %struct._oaes_ctx** %0, align 4, !tbaa !13
  %cmp1 = icmp eq %struct._oaes_ctx* %1, null
  br i1 %cmp1, label %cleanup, label %if.end3

if.end3:                                          ; preds = %if.end
  %2 = bitcast %struct._oaes_ctx* %1 to i8*
  %key = getelementptr inbounds %struct._oaes_ctx, %struct._oaes_ctx* %1, i32 0, i32 0
  %3 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %tobool = icmp eq %struct._oaes_key* %3, null
  br i1 %tobool, label %if.end6, label %if.end.i

if.end.i:                                         ; preds = %if.end3
  %data.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %3, i32 0, i32 1
  %4 = load i8*, i8** %data.i, align 4, !tbaa !11
  %tobool.i = icmp eq i8* %4, null
  br i1 %tobool.i, label %if.end4.i, label %if.then1.i

if.then1.i:                                       ; preds = %if.end.i
  tail call void @free(i8* nonnull %4) #8
  %5 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !13
  %data3.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %5, i32 0, i32 1
  store i8* null, i8** %data3.i, align 4, !tbaa !11
  %.pre.i = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !13
  br label %if.end4.i

if.end4.i:                                        ; preds = %if.then1.i, %if.end.i
  %.in.i = phi %struct._oaes_key* [ %3, %if.end.i ], [ %.pre.i, %if.then1.i ]
  %exp_data.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %.in.i, i32 0, i32 3
  %6 = load i8*, i8** %exp_data.i, align 4, !tbaa !14
  %tobool5.i = icmp eq i8* %6, null
  br i1 %tobool5.i, label %oaes_key_destroy.exit, label %if.then6.i

if.then6.i:                                       ; preds = %if.end4.i
  tail call void @free(i8* nonnull %6) #8
  %7 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !13
  %exp_data8.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %7, i32 0, i32 3
  store i8* null, i8** %exp_data8.i, align 4, !tbaa !14
  %.pre1.i = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !13
  br label %oaes_key_destroy.exit

oaes_key_destroy.exit:                            ; preds = %if.end4.i, %if.then6.i
  %.in2.i = phi %struct._oaes_key* [ %.in.i, %if.end4.i ], [ %.pre1.i, %if.then6.i ]
  %8 = bitcast %struct._oaes_key* %.in2.i to i8*
  tail call void @free(i8* %8) #8
  store %struct._oaes_key* null, %struct._oaes_key** %key, align 4, !tbaa !13
  %.pre = load i8*, i8** %ctx, align 4, !tbaa !13
  br label %if.end6

if.end6:                                          ; preds = %if.end3, %oaes_key_destroy.exit
  %9 = phi i8* [ %2, %if.end3 ], [ %.pre, %oaes_key_destroy.exit ]
  tail call void @free(i8* %9)
  store %struct._oaes_ctx* null, %struct._oaes_ctx** %0, align 4, !tbaa !13
  br label %cleanup

cleanup:                                          ; preds = %if.end, %entry, %if.end6
  %retval.0 = phi i32 [ 0, %if.end6 ], [ 2, %entry ], [ 0, %if.end ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #5

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #1

declare i32 @rand() local_unnamed_addr #4

; Function Attrs: nounwind
define hidden i32 @oaes_encrypt(i8* %ctx, i8* readonly %m, i32 %m_len, i8* %c, i32* %c_len) local_unnamed_addr #0 {
entry:
  %_block = alloca [16 x i8], align 16
  %rem = and i32 %m_len, 15
  %cmp = icmp eq i32 %rem, 0
  %sub = sub nuw nsw i32 16, %rem
  %spec.select = select i1 %cmp, i32 0, i32 %sub
  %tobool = icmp ne i32 %spec.select, 0
  %conv = zext i1 %tobool to i8
  %cmp3 = icmp eq i8* %ctx, null
  br i1 %cmp3, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %cmp5 = icmp eq i8* %m, null
  br i1 %cmp5, label %cleanup, label %if.end8

if.end8:                                          ; preds = %if.end
  %cmp9 = icmp eq i32* %c_len, null
  br i1 %cmp9, label %cleanup, label %if.end12

if.end12:                                         ; preds = %if.end8
  %0 = load i32, i32* %c_len, align 4, !tbaa !2
  %add = add i32 %spec.select, %m_len
  %add14 = add i32 %add, 32
  store i32 %add14, i32* %c_len, align 4, !tbaa !2
  %cmp15 = icmp eq i8* %c, null
  br i1 %cmp15, label %cleanup, label %if.end18

if.end18:                                         ; preds = %if.end12
  %cmp19 = icmp ult i32 %0, %add14
  br i1 %cmp19, label %cleanup, label %if.end22

if.end22:                                         ; preds = %if.end18
  %key = bitcast i8* %ctx to %struct._oaes_key**
  %1 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %cmp23 = icmp eq %struct._oaes_key* %1, null
  br i1 %cmp23, label %cleanup, label %if.end26

if.end26:                                         ; preds = %if.end22
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(16) %c, i8* nonnull align 16 dereferenceable(16) getelementptr inbounds (<{ i8, i8, i8, i8, i8, i8, [10 x i8] }>, <{ i8, i8, i8, i8, i8, i8, [10 x i8] }>* @oaes_header, i32 0, i32 0), i32 16, i1 false)
  %add.ptr = getelementptr inbounds i8, i8* %c, i32 6
  %options = getelementptr inbounds i8, i8* %ctx, i32 4
  %2 = bitcast i8* %options to i16*
  %3 = bitcast i8* %add.ptr to i16*
  %4 = load i16, i16* %2, align 4
  store i16 %4, i16* %3, align 1
  %_flags.0.add.ptr27.sroa_raw_idx = getelementptr inbounds i8, i8* %c, i32 8
  store i8 %conv, i8* %_flags.0.add.ptr27.sroa_raw_idx, align 1
  %add.ptr28 = getelementptr inbounds i8, i8* %c, i32 16
  %iv = getelementptr inbounds i8, i8* %ctx, i32 6
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(16) %add.ptr28, i8* nonnull align 2 dereferenceable(16) %iv, i32 16, i1 false)
  %add.ptr29 = getelementptr inbounds i8, i8* %c, i32 32
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %add.ptr29, i8* nonnull align 1 %m, i32 %m_len, i1 false)
  %cmp30150 = icmp eq i32 %add, 0
  br i1 %cmp30150, label %cleanup, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %if.end26
  %5 = getelementptr inbounds [16 x i8], [16 x i8]* %_block, i32 0, i32 0
  %arrayidx.1.i = getelementptr inbounds [16 x i8], [16 x i8]* %_block, i32 0, i32 1
  %arrayidx.2.i = getelementptr inbounds [16 x i8], [16 x i8]* %_block, i32 0, i32 2
  %arrayidx.3.i = getelementptr inbounds [16 x i8], [16 x i8]* %_block, i32 0, i32 3
  %arrayidx.4.i = getelementptr inbounds [16 x i8], [16 x i8]* %_block, i32 0, i32 4
  %arrayidx.5.i = getelementptr inbounds [16 x i8], [16 x i8]* %_block, i32 0, i32 5
  %arrayidx.6.i = getelementptr inbounds [16 x i8], [16 x i8]* %_block, i32 0, i32 6
  %arrayidx.7.i = getelementptr inbounds [16 x i8], [16 x i8]* %_block, i32 0, i32 7
  %arrayidx.8.i = getelementptr inbounds [16 x i8], [16 x i8]* %_block, i32 0, i32 8
  %arrayidx.9.i = getelementptr inbounds [16 x i8], [16 x i8]* %_block, i32 0, i32 9
  %arrayidx.10.i = getelementptr inbounds [16 x i8], [16 x i8]* %_block, i32 0, i32 10
  %arrayidx.11.i = getelementptr inbounds [16 x i8], [16 x i8]* %_block, i32 0, i32 11
  %arrayidx.12.i = getelementptr inbounds [16 x i8], [16 x i8]* %_block, i32 0, i32 12
  %arrayidx.13.i = getelementptr inbounds [16 x i8], [16 x i8]* %_block, i32 0, i32 13
  %arrayidx.14.i = getelementptr inbounds [16 x i8], [16 x i8]* %_block, i32 0, i32 14
  %arrayidx.15.i = getelementptr inbounds [16 x i8], [16 x i8]* %_block, i32 0, i32 15
  %arrayidx62.1 = getelementptr inbounds i8, i8* %ctx, i32 7
  %arrayidx62.2 = getelementptr inbounds i8, i8* %ctx, i32 8
  %arrayidx62.3 = getelementptr inbounds i8, i8* %ctx, i32 9
  %arrayidx62.4 = getelementptr inbounds i8, i8* %ctx, i32 10
  %arrayidx62.5 = getelementptr inbounds i8, i8* %ctx, i32 11
  %arrayidx62.6 = getelementptr inbounds i8, i8* %ctx, i32 12
  %arrayidx62.7 = getelementptr inbounds i8, i8* %ctx, i32 13
  %arrayidx62.8 = getelementptr inbounds i8, i8* %ctx, i32 14
  %arrayidx62.9 = getelementptr inbounds i8, i8* %ctx, i32 15
  %arrayidx62.10 = getelementptr inbounds i8, i8* %ctx, i32 16
  %arrayidx62.11 = getelementptr inbounds i8, i8* %ctx, i32 17
  %arrayidx62.12 = getelementptr inbounds i8, i8* %ctx, i32 18
  %arrayidx62.13 = getelementptr inbounds i8, i8* %ctx, i32 19
  %arrayidx62.14 = getelementptr inbounds i8, i8* %ctx, i32 20
  %arrayidx62.15 = getelementptr inbounds i8, i8* %ctx, i32 21
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %if.end84
  %_i.0152 = phi i32 [ 0, %for.body.lr.ph ], [ %add86, %if.end84 ]
  %_rc.0151 = phi i32 [ 0, %for.body.lr.ph ], [ %204, %if.end84 ]
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %5) #8
  %sub32 = sub i32 %m_len, %_i.0152
  %cmp33 = icmp ult i32 %sub32, 16
  %cond39 = select i1 %cmp33, i32 %sub32, i32 16
  %add.ptr42 = getelementptr inbounds i8, i8* %add.ptr29, i32 %_i.0152
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 %5, i8* nonnull align 1 %add.ptr42, i32 %cond39, i1 false)
  %sub44 = sub nuw nsw i32 16, %cond39
  %cmp45147 = icmp eq i32 %sub44, 0
  br i1 %cmp45147, label %for.end, label %for.body47

for.body47:                                       ; preds = %for.body, %for.body47
  %_j.0148 = phi i32 [ %add48, %for.body47 ], [ 0, %for.body ]
  %add48 = add nuw nsw i32 %_j.0148, 1
  %conv49 = trunc i32 %add48 to i8
  %add50 = add nuw nsw i32 %_j.0148, %cond39
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %_block, i32 0, i32 %add50
  store i8 %conv49, i8* %arrayidx, align 1, !tbaa !6
  %cmp45 = icmp ult i32 %add48, %sub44
  br i1 %cmp45, label %for.body47, label %for.end

for.end:                                          ; preds = %for.body47, %for.body
  %6 = load i16, i16* %2, align 4, !tbaa !29
  %7 = and i16 %6, 2
  %tobool53 = icmp eq i16 %7, 0
  br i1 %tobool53, label %if.end69, label %for.body58.preheader

for.body58.preheader:                             ; preds = %for.end
  %8 = load i8, i8* %5, align 16, !tbaa !6
  %9 = load i8, i8* %iv, align 1, !tbaa !6
  %xor146 = xor i8 %9, %8
  store i8 %xor146, i8* %5, align 16, !tbaa !6
  %10 = load i8, i8* %arrayidx.1.i, align 1, !tbaa !6
  %11 = load i8, i8* %arrayidx62.1, align 1, !tbaa !6
  %xor146.1 = xor i8 %11, %10
  store i8 %xor146.1, i8* %arrayidx.1.i, align 1, !tbaa !6
  %12 = load i8, i8* %arrayidx.2.i, align 2, !tbaa !6
  %13 = load i8, i8* %arrayidx62.2, align 1, !tbaa !6
  %xor146.2 = xor i8 %13, %12
  store i8 %xor146.2, i8* %arrayidx.2.i, align 2, !tbaa !6
  %14 = load i8, i8* %arrayidx.3.i, align 1, !tbaa !6
  %15 = load i8, i8* %arrayidx62.3, align 1, !tbaa !6
  %xor146.3 = xor i8 %15, %14
  store i8 %xor146.3, i8* %arrayidx.3.i, align 1, !tbaa !6
  %16 = load i8, i8* %arrayidx.4.i, align 4, !tbaa !6
  %17 = load i8, i8* %arrayidx62.4, align 1, !tbaa !6
  %xor146.4 = xor i8 %17, %16
  store i8 %xor146.4, i8* %arrayidx.4.i, align 4, !tbaa !6
  %18 = load i8, i8* %arrayidx.5.i, align 1, !tbaa !6
  %19 = load i8, i8* %arrayidx62.5, align 1, !tbaa !6
  %xor146.5 = xor i8 %19, %18
  store i8 %xor146.5, i8* %arrayidx.5.i, align 1, !tbaa !6
  %20 = load i8, i8* %arrayidx.6.i, align 2, !tbaa !6
  %21 = load i8, i8* %arrayidx62.6, align 1, !tbaa !6
  %xor146.6 = xor i8 %21, %20
  store i8 %xor146.6, i8* %arrayidx.6.i, align 2, !tbaa !6
  %22 = load i8, i8* %arrayidx.7.i, align 1, !tbaa !6
  %23 = load i8, i8* %arrayidx62.7, align 1, !tbaa !6
  %xor146.7 = xor i8 %23, %22
  store i8 %xor146.7, i8* %arrayidx.7.i, align 1, !tbaa !6
  %24 = load i8, i8* %arrayidx.8.i, align 8, !tbaa !6
  %25 = load i8, i8* %arrayidx62.8, align 1, !tbaa !6
  %xor146.8 = xor i8 %25, %24
  store i8 %xor146.8, i8* %arrayidx.8.i, align 8, !tbaa !6
  %26 = load i8, i8* %arrayidx.9.i, align 1, !tbaa !6
  %27 = load i8, i8* %arrayidx62.9, align 1, !tbaa !6
  %xor146.9 = xor i8 %27, %26
  store i8 %xor146.9, i8* %arrayidx.9.i, align 1, !tbaa !6
  %28 = load i8, i8* %arrayidx.10.i, align 2, !tbaa !6
  %29 = load i8, i8* %arrayidx62.10, align 1, !tbaa !6
  %xor146.10 = xor i8 %29, %28
  store i8 %xor146.10, i8* %arrayidx.10.i, align 2, !tbaa !6
  %30 = load i8, i8* %arrayidx.11.i, align 1, !tbaa !6
  %31 = load i8, i8* %arrayidx62.11, align 1, !tbaa !6
  %xor146.11 = xor i8 %31, %30
  store i8 %xor146.11, i8* %arrayidx.11.i, align 1, !tbaa !6
  %32 = load i8, i8* %arrayidx.12.i, align 4, !tbaa !6
  %33 = load i8, i8* %arrayidx62.12, align 1, !tbaa !6
  %xor146.12 = xor i8 %33, %32
  store i8 %xor146.12, i8* %arrayidx.12.i, align 4, !tbaa !6
  %34 = load i8, i8* %arrayidx.13.i, align 1, !tbaa !6
  %35 = load i8, i8* %arrayidx62.13, align 1, !tbaa !6
  %xor146.13 = xor i8 %35, %34
  store i8 %xor146.13, i8* %arrayidx.13.i, align 1, !tbaa !6
  %36 = load i8, i8* %arrayidx.14.i, align 2, !tbaa !6
  %37 = load i8, i8* %arrayidx62.14, align 1, !tbaa !6
  %xor146.14 = xor i8 %37, %36
  store i8 %xor146.14, i8* %arrayidx.14.i, align 2, !tbaa !6
  %38 = load i8, i8* %arrayidx.15.i, align 1, !tbaa !6
  %39 = load i8, i8* %arrayidx62.15, align 1, !tbaa !6
  %xor146.15 = xor i8 %39, %38
  store i8 %xor146.15, i8* %arrayidx.15.i, align 1, !tbaa !6
  br label %if.end69

if.end69:                                         ; preds = %for.body58.preheader, %for.end
  %tobool70 = icmp eq i32 %_rc.0151, 0
  br i1 %tobool70, label %if.end.i, label %lor.end

if.end.i:                                         ; preds = %if.end69
  %40 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %cmp7.i = icmp eq %struct._oaes_key* %40, null
  br i1 %cmp7.i, label %lor.end, label %for.body.preheader.i

for.body.preheader.i:                             ; preds = %if.end.i
  %41 = load i8, i8* %5, align 16, !tbaa !6
  %exp_data.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %40, i32 0, i32 3
  %42 = load i8*, i8** %exp_data.i, align 4, !tbaa !14
  %43 = load i8, i8* %42, align 1, !tbaa !6
  %xor3.i = xor i8 %43, %41
  store i8 %xor3.i, i8* %5, align 16, !tbaa !6
  %44 = load i8, i8* %arrayidx.1.i, align 1, !tbaa !6
  %arrayidx12.1.i = getelementptr inbounds i8, i8* %42, i32 1
  %45 = load i8, i8* %arrayidx12.1.i, align 1, !tbaa !6
  %xor3.1.i = xor i8 %45, %44
  store i8 %xor3.1.i, i8* %arrayidx.1.i, align 1, !tbaa !6
  %46 = load i8, i8* %arrayidx.2.i, align 2, !tbaa !6
  %arrayidx12.2.i = getelementptr inbounds i8, i8* %42, i32 2
  %47 = load i8, i8* %arrayidx12.2.i, align 1, !tbaa !6
  %xor3.2.i = xor i8 %47, %46
  store i8 %xor3.2.i, i8* %arrayidx.2.i, align 2, !tbaa !6
  %48 = load i8, i8* %arrayidx.3.i, align 1, !tbaa !6
  %arrayidx12.3.i = getelementptr inbounds i8, i8* %42, i32 3
  %49 = load i8, i8* %arrayidx12.3.i, align 1, !tbaa !6
  %xor3.3.i = xor i8 %49, %48
  store i8 %xor3.3.i, i8* %arrayidx.3.i, align 1, !tbaa !6
  %50 = load i8, i8* %arrayidx.4.i, align 4, !tbaa !6
  %arrayidx12.4.i = getelementptr inbounds i8, i8* %42, i32 4
  %51 = load i8, i8* %arrayidx12.4.i, align 1, !tbaa !6
  %xor3.4.i = xor i8 %51, %50
  store i8 %xor3.4.i, i8* %arrayidx.4.i, align 4, !tbaa !6
  %52 = load i8, i8* %arrayidx.5.i, align 1, !tbaa !6
  %arrayidx12.5.i = getelementptr inbounds i8, i8* %42, i32 5
  %53 = load i8, i8* %arrayidx12.5.i, align 1, !tbaa !6
  %xor3.5.i = xor i8 %53, %52
  store i8 %xor3.5.i, i8* %arrayidx.5.i, align 1, !tbaa !6
  %54 = load i8, i8* %arrayidx.6.i, align 2, !tbaa !6
  %arrayidx12.6.i = getelementptr inbounds i8, i8* %42, i32 6
  %55 = load i8, i8* %arrayidx12.6.i, align 1, !tbaa !6
  %xor3.6.i = xor i8 %55, %54
  store i8 %xor3.6.i, i8* %arrayidx.6.i, align 2, !tbaa !6
  %56 = load i8, i8* %arrayidx.7.i, align 1, !tbaa !6
  %arrayidx12.7.i = getelementptr inbounds i8, i8* %42, i32 7
  %57 = load i8, i8* %arrayidx12.7.i, align 1, !tbaa !6
  %xor3.7.i = xor i8 %57, %56
  store i8 %xor3.7.i, i8* %arrayidx.7.i, align 1, !tbaa !6
  %58 = load i8, i8* %arrayidx.8.i, align 8, !tbaa !6
  %arrayidx12.8.i = getelementptr inbounds i8, i8* %42, i32 8
  %59 = load i8, i8* %arrayidx12.8.i, align 1, !tbaa !6
  %xor3.8.i = xor i8 %59, %58
  store i8 %xor3.8.i, i8* %arrayidx.8.i, align 8, !tbaa !6
  %60 = load i8, i8* %arrayidx.9.i, align 1, !tbaa !6
  %arrayidx12.9.i = getelementptr inbounds i8, i8* %42, i32 9
  %61 = load i8, i8* %arrayidx12.9.i, align 1, !tbaa !6
  %xor3.9.i = xor i8 %61, %60
  store i8 %xor3.9.i, i8* %arrayidx.9.i, align 1, !tbaa !6
  %62 = load i8, i8* %arrayidx.10.i, align 2, !tbaa !6
  %arrayidx12.10.i = getelementptr inbounds i8, i8* %42, i32 10
  %63 = load i8, i8* %arrayidx12.10.i, align 1, !tbaa !6
  %xor3.10.i = xor i8 %63, %62
  store i8 %xor3.10.i, i8* %arrayidx.10.i, align 2, !tbaa !6
  %64 = load i8, i8* %arrayidx.11.i, align 1, !tbaa !6
  %arrayidx12.11.i = getelementptr inbounds i8, i8* %42, i32 11
  %65 = load i8, i8* %arrayidx12.11.i, align 1, !tbaa !6
  %xor3.11.i = xor i8 %65, %64
  store i8 %xor3.11.i, i8* %arrayidx.11.i, align 1, !tbaa !6
  %66 = load i8, i8* %arrayidx.12.i, align 4, !tbaa !6
  %arrayidx12.12.i = getelementptr inbounds i8, i8* %42, i32 12
  %67 = load i8, i8* %arrayidx12.12.i, align 1, !tbaa !6
  %xor3.12.i = xor i8 %67, %66
  store i8 %xor3.12.i, i8* %arrayidx.12.i, align 4, !tbaa !6
  %68 = load i8, i8* %arrayidx.13.i, align 1, !tbaa !6
  %arrayidx12.13.i = getelementptr inbounds i8, i8* %42, i32 13
  %69 = load i8, i8* %arrayidx12.13.i, align 1, !tbaa !6
  %xor3.13.i = xor i8 %69, %68
  store i8 %xor3.13.i, i8* %arrayidx.13.i, align 1, !tbaa !6
  %70 = load i8, i8* %arrayidx.14.i, align 2, !tbaa !6
  %arrayidx12.14.i = getelementptr inbounds i8, i8* %42, i32 14
  %71 = load i8, i8* %arrayidx12.14.i, align 1, !tbaa !6
  %xor3.14.i = xor i8 %71, %70
  store i8 %xor3.14.i, i8* %arrayidx.14.i, align 2, !tbaa !6
  %72 = load i8, i8* %arrayidx.15.i, align 1, !tbaa !6
  %arrayidx12.15.i = getelementptr inbounds i8, i8* %42, i32 15
  %73 = load i8, i8* %arrayidx12.15.i, align 1, !tbaa !6
  %xor3.15.i = xor i8 %73, %72
  store i8 %xor3.15.i, i8* %arrayidx.15.i, align 1, !tbaa !6
  %num_keys144.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %40, i32 0, i32 4
  %74 = load i32, i32* %num_keys144.i, align 4, !tbaa !17
  %sub145.i = add i32 %74, -1
  %cmp18146.i = icmp ugt i32 %sub145.i, 1
  br i1 %cmp18146.i, label %oaes_mix_cols.exit.i, label %oaes_shift_rows.exit.i

oaes_mix_cols.exit.i:                             ; preds = %for.body.preheader.i, %oaes_mix_cols.exit.i
  %75 = phi i8 [ %xor472.4.i, %oaes_mix_cols.exit.i ], [ %xor3.4.i, %for.body.preheader.i ]
  %76 = phi i8 [ %xor472.3.i, %oaes_mix_cols.exit.i ], [ %xor3.3.i, %for.body.preheader.i ]
  %77 = phi i8 [ %xor472.2.i, %oaes_mix_cols.exit.i ], [ %xor3.2.i, %for.body.preheader.i ]
  %78 = phi i8 [ %xor472.1.i, %oaes_mix_cols.exit.i ], [ %xor3.1.i, %for.body.preheader.i ]
  %79 = phi i8 [ %xor472.i, %oaes_mix_cols.exit.i ], [ %xor3.i, %for.body.preheader.i ]
  %80 = phi i8 [ %xor472.5.i, %oaes_mix_cols.exit.i ], [ %xor3.5.i, %for.body.preheader.i ]
  %81 = phi i8 [ %xor472.15.i, %oaes_mix_cols.exit.i ], [ %xor3.15.i, %for.body.preheader.i ]
  %82 = phi i8 [ %xor472.14.i, %oaes_mix_cols.exit.i ], [ %xor3.14.i, %for.body.preheader.i ]
  %83 = phi i8 [ %xor472.13.i, %oaes_mix_cols.exit.i ], [ %xor3.13.i, %for.body.preheader.i ]
  %84 = phi i8 [ %xor472.12.i, %oaes_mix_cols.exit.i ], [ %xor3.12.i, %for.body.preheader.i ]
  %85 = phi i8 [ %xor472.11.i, %oaes_mix_cols.exit.i ], [ %xor3.11.i, %for.body.preheader.i ]
  %86 = phi i8 [ %xor472.10.i, %oaes_mix_cols.exit.i ], [ %xor3.10.i, %for.body.preheader.i ]
  %87 = phi i8 [ %xor472.9.i, %oaes_mix_cols.exit.i ], [ %xor3.9.i, %for.body.preheader.i ]
  %88 = phi i8 [ %xor472.8.i, %oaes_mix_cols.exit.i ], [ %xor3.8.i, %for.body.preheader.i ]
  %89 = phi i8 [ %xor472.7.i, %oaes_mix_cols.exit.i ], [ %xor3.7.i, %for.body.preheader.i ]
  %90 = phi i8 [ %xor472.6.i, %oaes_mix_cols.exit.i ], [ %xor3.6.i, %for.body.preheader.i ]
  %_i.1147.i = phi i32 [ %inc54.i, %oaes_mix_cols.exit.i ], [ 1, %for.body.preheader.i ]
  %conv.i.i = zext i8 %79 to i32
  %shr.i.i = lshr i32 %conv.i.i, 4
  %and1.i.i = and i32 %conv.i.i, 15
  %arrayidx2.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.i, i32 %and1.i.i
  %91 = load i8, i8* %arrayidx2.i.i, align 1, !tbaa !6
  %conv.i.1.i = zext i8 %78 to i32
  %shr.i.1.i = lshr i32 %conv.i.1.i, 4
  %and1.i.1.i = and i32 %conv.i.1.i, 15
  %arrayidx2.i.1.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.1.i, i32 %and1.i.1.i
  %92 = load i8, i8* %arrayidx2.i.1.i, align 1, !tbaa !6
  %conv.i.2.i = zext i8 %77 to i32
  %shr.i.2.i = lshr i32 %conv.i.2.i, 4
  %and1.i.2.i = and i32 %conv.i.2.i, 15
  %arrayidx2.i.2.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.2.i, i32 %and1.i.2.i
  %93 = load i8, i8* %arrayidx2.i.2.i, align 1, !tbaa !6
  %conv.i.3.i = zext i8 %76 to i32
  %shr.i.3.i = lshr i32 %conv.i.3.i, 4
  %and1.i.3.i = and i32 %conv.i.3.i, 15
  %arrayidx2.i.3.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.3.i, i32 %and1.i.3.i
  %94 = load i8, i8* %arrayidx2.i.3.i, align 1, !tbaa !6
  %conv.i.4.i = zext i8 %75 to i32
  %shr.i.4.i = lshr i32 %conv.i.4.i, 4
  %and1.i.4.i = and i32 %conv.i.4.i, 15
  %arrayidx2.i.4.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.4.i, i32 %and1.i.4.i
  %95 = load i8, i8* %arrayidx2.i.4.i, align 1, !tbaa !6
  %conv.i.5.i = zext i8 %80 to i32
  %shr.i.5.i = lshr i32 %conv.i.5.i, 4
  %and1.i.5.i = and i32 %conv.i.5.i, 15
  %arrayidx2.i.5.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.5.i, i32 %and1.i.5.i
  %96 = load i8, i8* %arrayidx2.i.5.i, align 1, !tbaa !6
  %conv.i.6.i = zext i8 %90 to i32
  %shr.i.6.i = lshr i32 %conv.i.6.i, 4
  %and1.i.6.i = and i32 %conv.i.6.i, 15
  %arrayidx2.i.6.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.6.i, i32 %and1.i.6.i
  %97 = load i8, i8* %arrayidx2.i.6.i, align 1, !tbaa !6
  %conv.i.7.i = zext i8 %89 to i32
  %shr.i.7.i = lshr i32 %conv.i.7.i, 4
  %and1.i.7.i = and i32 %conv.i.7.i, 15
  %arrayidx2.i.7.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.7.i, i32 %and1.i.7.i
  %98 = load i8, i8* %arrayidx2.i.7.i, align 1, !tbaa !6
  %conv.i.8.i = zext i8 %88 to i32
  %shr.i.8.i = lshr i32 %conv.i.8.i, 4
  %and1.i.8.i = and i32 %conv.i.8.i, 15
  %arrayidx2.i.8.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.8.i, i32 %and1.i.8.i
  %99 = load i8, i8* %arrayidx2.i.8.i, align 1, !tbaa !6
  %conv.i.9.i = zext i8 %87 to i32
  %shr.i.9.i = lshr i32 %conv.i.9.i, 4
  %and1.i.9.i = and i32 %conv.i.9.i, 15
  %arrayidx2.i.9.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.9.i, i32 %and1.i.9.i
  %100 = load i8, i8* %arrayidx2.i.9.i, align 1, !tbaa !6
  %conv.i.10.i = zext i8 %86 to i32
  %shr.i.10.i = lshr i32 %conv.i.10.i, 4
  %and1.i.10.i = and i32 %conv.i.10.i, 15
  %arrayidx2.i.10.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.10.i, i32 %and1.i.10.i
  %101 = load i8, i8* %arrayidx2.i.10.i, align 1, !tbaa !6
  %conv.i.11.i = zext i8 %85 to i32
  %shr.i.11.i = lshr i32 %conv.i.11.i, 4
  %and1.i.11.i = and i32 %conv.i.11.i, 15
  %arrayidx2.i.11.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.11.i, i32 %and1.i.11.i
  %102 = load i8, i8* %arrayidx2.i.11.i, align 1, !tbaa !6
  %conv.i.12.i = zext i8 %84 to i32
  %shr.i.12.i = lshr i32 %conv.i.12.i, 4
  %and1.i.12.i = and i32 %conv.i.12.i, 15
  %arrayidx2.i.12.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.12.i, i32 %and1.i.12.i
  %103 = load i8, i8* %arrayidx2.i.12.i, align 1, !tbaa !6
  %conv.i.13.i = zext i8 %83 to i32
  %shr.i.13.i = lshr i32 %conv.i.13.i, 4
  %and1.i.13.i = and i32 %conv.i.13.i, 15
  %arrayidx2.i.13.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.13.i, i32 %and1.i.13.i
  %104 = load i8, i8* %arrayidx2.i.13.i, align 1, !tbaa !6
  %conv.i.14.i = zext i8 %82 to i32
  %shr.i.14.i = lshr i32 %conv.i.14.i, 4
  %and1.i.14.i = and i32 %conv.i.14.i, 15
  %arrayidx2.i.14.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.14.i, i32 %and1.i.14.i
  %105 = load i8, i8* %arrayidx2.i.14.i, align 1, !tbaa !6
  %conv.i.15.i = zext i8 %81 to i32
  %shr.i.15.i = lshr i32 %conv.i.15.i, 4
  %and1.i.15.i = and i32 %conv.i.15.i, 15
  %arrayidx2.i.15.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.15.i, i32 %and1.i.15.i
  %106 = load i8, i8* %arrayidx2.i.15.i, align 1, !tbaa !6
  %conv.i.i89.i = zext i8 %91 to i32
  %shr.i.i90.i = lshr i32 %conv.i.i89.i, 4
  %and1.i.i91.i = and i32 %conv.i.i89.i, 15
  %arrayidx3.i.i92.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i.i90.i, i32 %and1.i.i91.i
  %107 = load i8, i8* %arrayidx3.i.i92.i, align 1, !tbaa !6
  %conv.i36.i94.i = zext i8 %96 to i32
  %shr.i37.i95.i = lshr i32 %conv.i36.i94.i, 4
  %and1.i38.i96.i = and i32 %conv.i36.i94.i, 15
  %arrayidx6.i39.i97.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i37.i95.i, i32 %and1.i38.i96.i
  %108 = load i8, i8* %arrayidx6.i39.i97.i, align 1, !tbaa !6
  %xor1.i98.i = xor i8 %106, %101
  %xor62.i100.i = xor i8 %xor1.i98.i, %107
  %xor93.i102.i = xor i8 %xor62.i100.i, %108
  %arrayidx3.i35.i103.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i37.i95.i, i32 %and1.i38.i96.i
  %109 = load i8, i8* %arrayidx3.i35.i103.i, align 1, !tbaa !6
  %conv.i28.i104.i = zext i8 %101 to i32
  %shr.i29.i105.i = lshr i32 %conv.i28.i104.i, 4
  %and1.i30.i106.i = and i32 %conv.i28.i104.i, 15
  %arrayidx6.i31.i107.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i29.i105.i, i32 %and1.i30.i106.i
  %110 = load i8, i8* %arrayidx6.i31.i107.i, align 1, !tbaa !6
  %xor174.i108.i = xor i8 %106, %91
  %xor215.i109.i = xor i8 %xor174.i108.i, %109
  %xor246.i110.i = xor i8 %xor215.i109.i, %110
  %xor317.i111.i = xor i8 %96, %91
  %arrayidx3.i27.i112.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i29.i105.i, i32 %and1.i30.i106.i
  %111 = load i8, i8* %arrayidx3.i27.i112.i, align 1, !tbaa !6
  %xor358.i113.i = xor i8 %xor317.i111.i, %111
  %conv.i20.i114.i = zext i8 %106 to i32
  %shr.i21.i115.i = lshr i32 %conv.i20.i114.i, 4
  %and1.i22.i116.i = and i32 %conv.i20.i114.i, 15
  %arrayidx6.i23.i117.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i21.i115.i, i32 %and1.i22.i116.i
  %112 = load i8, i8* %arrayidx6.i23.i117.i, align 1, !tbaa !6
  %xor399.i118.i = xor i8 %xor358.i113.i, %112
  %arrayidx6.i.i119.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i.i90.i, i32 %and1.i.i91.i
  %113 = load i8, i8* %arrayidx6.i.i119.i, align 1, !tbaa !6
  %arrayidx3.i16.i120.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i21.i115.i, i32 %and1.i22.i116.i
  %114 = load i8, i8* %arrayidx3.i16.i120.i, align 1, !tbaa !6
  %xor4710.i121.i = xor i8 %101, %96
  %xor5011.i122.i = xor i8 %xor4710.i121.i, %113
  %xor5412.i123.i = xor i8 %xor5011.i122.i, %114
  %conv.i.i52.i = zext i8 %95 to i32
  %shr.i.i53.i = lshr i32 %conv.i.i52.i, 4
  %and1.i.i54.i = and i32 %conv.i.i52.i, 15
  %arrayidx3.i.i55.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i.i53.i, i32 %and1.i.i54.i
  %115 = load i8, i8* %arrayidx3.i.i55.i, align 1, !tbaa !6
  %conv.i36.i57.i = zext i8 %100 to i32
  %shr.i37.i58.i = lshr i32 %conv.i36.i57.i, 4
  %and1.i38.i59.i = and i32 %conv.i36.i57.i, 15
  %arrayidx6.i39.i60.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i37.i58.i, i32 %and1.i38.i59.i
  %116 = load i8, i8* %arrayidx6.i39.i60.i, align 1, !tbaa !6
  %xor1.i61.i = xor i8 %105, %94
  %xor62.i63.i = xor i8 %xor1.i61.i, %115
  %xor93.i65.i = xor i8 %xor62.i63.i, %116
  %arrayidx3.i35.i66.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i37.i58.i, i32 %and1.i38.i59.i
  %117 = load i8, i8* %arrayidx3.i35.i66.i, align 1, !tbaa !6
  %conv.i28.i67.i = zext i8 %105 to i32
  %shr.i29.i68.i = lshr i32 %conv.i28.i67.i, 4
  %and1.i30.i69.i = and i32 %conv.i28.i67.i, 15
  %arrayidx6.i31.i70.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i29.i68.i, i32 %and1.i30.i69.i
  %118 = load i8, i8* %arrayidx6.i31.i70.i, align 1, !tbaa !6
  %xor174.i71.i = xor i8 %95, %94
  %xor215.i72.i = xor i8 %xor174.i71.i, %117
  %xor246.i73.i = xor i8 %xor215.i72.i, %118
  %xor317.i74.i = xor i8 %100, %95
  %arrayidx3.i27.i75.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i29.i68.i, i32 %and1.i30.i69.i
  %119 = load i8, i8* %arrayidx3.i27.i75.i, align 1, !tbaa !6
  %xor358.i76.i = xor i8 %xor317.i74.i, %119
  %conv.i20.i77.i = zext i8 %94 to i32
  %shr.i21.i78.i = lshr i32 %conv.i20.i77.i, 4
  %and1.i22.i79.i = and i32 %conv.i20.i77.i, 15
  %arrayidx6.i23.i80.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i21.i78.i, i32 %and1.i22.i79.i
  %120 = load i8, i8* %arrayidx6.i23.i80.i, align 1, !tbaa !6
  %xor399.i81.i = xor i8 %xor358.i76.i, %120
  %arrayidx6.i.i82.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i.i53.i, i32 %and1.i.i54.i
  %121 = load i8, i8* %arrayidx6.i.i82.i, align 1, !tbaa !6
  %arrayidx3.i16.i83.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i21.i78.i, i32 %and1.i22.i79.i
  %122 = load i8, i8* %arrayidx3.i16.i83.i, align 1, !tbaa !6
  %xor4710.i84.i = xor i8 %105, %100
  %xor5011.i85.i = xor i8 %xor4710.i84.i, %121
  %xor5412.i86.i = xor i8 %xor5011.i85.i, %122
  %conv.i.i16.i = zext i8 %99 to i32
  %shr.i.i17.i = lshr i32 %conv.i.i16.i, 4
  %and1.i.i18.i = and i32 %conv.i.i16.i, 15
  %arrayidx3.i.i19.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i.i17.i, i32 %and1.i.i18.i
  %123 = load i8, i8* %arrayidx3.i.i19.i, align 1, !tbaa !6
  %conv.i36.i21.i = zext i8 %104 to i32
  %shr.i37.i22.i = lshr i32 %conv.i36.i21.i, 4
  %and1.i38.i23.i = and i32 %conv.i36.i21.i, 15
  %arrayidx6.i39.i24.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i37.i22.i, i32 %and1.i38.i23.i
  %124 = load i8, i8* %arrayidx6.i39.i24.i, align 1, !tbaa !6
  %xor1.i25.i = xor i8 %98, %93
  %xor62.i27.i = xor i8 %xor1.i25.i, %123
  %xor93.i29.i = xor i8 %xor62.i27.i, %124
  %arrayidx3.i35.i30.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i37.i22.i, i32 %and1.i38.i23.i
  %125 = load i8, i8* %arrayidx3.i35.i30.i, align 1, !tbaa !6
  %conv.i28.i31.i = zext i8 %93 to i32
  %shr.i29.i32.i = lshr i32 %conv.i28.i31.i, 4
  %and1.i30.i33.i = and i32 %conv.i28.i31.i, 15
  %arrayidx6.i31.i34.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i29.i32.i, i32 %and1.i30.i33.i
  %126 = load i8, i8* %arrayidx6.i31.i34.i, align 1, !tbaa !6
  %xor174.i35.i = xor i8 %99, %98
  %xor215.i36.i = xor i8 %xor174.i35.i, %125
  %xor246.i37.i = xor i8 %xor215.i36.i, %126
  %xor317.i38.i = xor i8 %104, %99
  %arrayidx3.i27.i39.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i29.i32.i, i32 %and1.i30.i33.i
  %127 = load i8, i8* %arrayidx3.i27.i39.i, align 1, !tbaa !6
  %xor358.i40.i = xor i8 %xor317.i38.i, %127
  %conv.i20.i41.i = zext i8 %98 to i32
  %shr.i21.i42.i = lshr i32 %conv.i20.i41.i, 4
  %and1.i22.i43.i = and i32 %conv.i20.i41.i, 15
  %arrayidx6.i23.i44.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i21.i42.i, i32 %and1.i22.i43.i
  %128 = load i8, i8* %arrayidx6.i23.i44.i, align 1, !tbaa !6
  %xor399.i45.i = xor i8 %xor358.i40.i, %128
  %arrayidx6.i.i46.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i.i17.i, i32 %and1.i.i18.i
  %129 = load i8, i8* %arrayidx6.i.i46.i, align 1, !tbaa !6
  %arrayidx3.i16.i47.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i21.i42.i, i32 %and1.i22.i43.i
  %130 = load i8, i8* %arrayidx3.i16.i47.i, align 1, !tbaa !6
  %xor4710.i48.i = xor i8 %104, %93
  %xor5011.i49.i = xor i8 %xor4710.i48.i, %129
  %xor5412.i50.i = xor i8 %xor5011.i49.i, %130
  %conv.i.i.i = zext i8 %103 to i32
  %shr.i.i.i = lshr i32 %conv.i.i.i, 4
  %and1.i.i.i = and i32 %conv.i.i.i, 15
  %arrayidx3.i.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i.i.i, i32 %and1.i.i.i
  %131 = load i8, i8* %arrayidx3.i.i.i, align 1, !tbaa !6
  %conv.i36.i.i = zext i8 %92 to i32
  %shr.i37.i.i = lshr i32 %conv.i36.i.i, 4
  %and1.i38.i.i = and i32 %conv.i36.i.i, 15
  %arrayidx6.i39.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i37.i.i, i32 %and1.i38.i.i
  %132 = load i8, i8* %arrayidx6.i39.i.i, align 1, !tbaa !6
  %xor1.i.i = xor i8 %102, %97
  %xor62.i.i = xor i8 %xor1.i.i, %131
  %xor93.i.i = xor i8 %xor62.i.i, %132
  %arrayidx3.i35.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i37.i.i, i32 %and1.i38.i.i
  %133 = load i8, i8* %arrayidx3.i35.i.i, align 1, !tbaa !6
  %conv.i28.i.i = zext i8 %97 to i32
  %shr.i29.i.i = lshr i32 %conv.i28.i.i, 4
  %and1.i30.i.i = and i32 %conv.i28.i.i, 15
  %arrayidx6.i31.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i29.i.i, i32 %and1.i30.i.i
  %134 = load i8, i8* %arrayidx6.i31.i.i, align 1, !tbaa !6
  %xor174.i.i = xor i8 %103, %102
  %xor215.i.i = xor i8 %xor174.i.i, %133
  %xor246.i.i = xor i8 %xor215.i.i, %134
  %xor317.i.i = xor i8 %103, %92
  %arrayidx3.i27.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i29.i.i, i32 %and1.i30.i.i
  %135 = load i8, i8* %arrayidx3.i27.i.i, align 1, !tbaa !6
  %xor358.i.i = xor i8 %xor317.i.i, %135
  %conv.i20.i.i = zext i8 %102 to i32
  %shr.i21.i.i = lshr i32 %conv.i20.i.i, 4
  %and1.i22.i.i = and i32 %conv.i20.i.i, 15
  %arrayidx6.i23.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i21.i.i, i32 %and1.i22.i.i
  %136 = load i8, i8* %arrayidx6.i23.i.i, align 1, !tbaa !6
  %xor399.i.i = xor i8 %xor358.i.i, %136
  %arrayidx6.i.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i.i.i, i32 %and1.i.i.i
  %137 = load i8, i8* %arrayidx6.i.i.i, align 1, !tbaa !6
  %arrayidx3.i16.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i21.i.i, i32 %and1.i22.i.i
  %138 = load i8, i8* %arrayidx3.i16.i.i, align 1, !tbaa !6
  %xor4710.i.i = xor i8 %97, %92
  %xor5011.i.i = xor i8 %xor4710.i.i, %137
  %xor5412.i.i = xor i8 %xor5011.i.i, %138
  %mul44.i = shl i32 %_i.1147.i, 4
  %arrayidx45.i = getelementptr inbounds i8, i8* %42, i32 %mul44.i
  %139 = load i8, i8* %arrayidx45.i, align 1, !tbaa !6
  %xor472.i = xor i8 %139, %xor93.i102.i
  %add.1.i = or i32 %mul44.i, 1
  %arrayidx45.1.i = getelementptr inbounds i8, i8* %42, i32 %add.1.i
  %140 = load i8, i8* %arrayidx45.1.i, align 1, !tbaa !6
  %xor472.1.i = xor i8 %140, %xor246.i110.i
  %add.2.i = or i32 %mul44.i, 2
  %arrayidx45.2.i = getelementptr inbounds i8, i8* %42, i32 %add.2.i
  %141 = load i8, i8* %arrayidx45.2.i, align 1, !tbaa !6
  %xor472.2.i = xor i8 %141, %xor399.i118.i
  %add.3.i = or i32 %mul44.i, 3
  %arrayidx45.3.i = getelementptr inbounds i8, i8* %42, i32 %add.3.i
  %142 = load i8, i8* %arrayidx45.3.i, align 1, !tbaa !6
  %xor472.3.i = xor i8 %142, %xor5412.i123.i
  %add.4.i = or i32 %mul44.i, 4
  %arrayidx45.4.i = getelementptr inbounds i8, i8* %42, i32 %add.4.i
  %143 = load i8, i8* %arrayidx45.4.i, align 1, !tbaa !6
  %xor472.4.i = xor i8 %143, %xor93.i65.i
  %add.5.i = or i32 %mul44.i, 5
  %arrayidx45.5.i = getelementptr inbounds i8, i8* %42, i32 %add.5.i
  %144 = load i8, i8* %arrayidx45.5.i, align 1, !tbaa !6
  %xor472.5.i = xor i8 %144, %xor246.i73.i
  %add.6.i = or i32 %mul44.i, 6
  %arrayidx45.6.i = getelementptr inbounds i8, i8* %42, i32 %add.6.i
  %145 = load i8, i8* %arrayidx45.6.i, align 1, !tbaa !6
  %xor472.6.i = xor i8 %145, %xor399.i81.i
  %add.7.i = or i32 %mul44.i, 7
  %arrayidx45.7.i = getelementptr inbounds i8, i8* %42, i32 %add.7.i
  %146 = load i8, i8* %arrayidx45.7.i, align 1, !tbaa !6
  %xor472.7.i = xor i8 %146, %xor5412.i86.i
  %add.8.i = or i32 %mul44.i, 8
  %arrayidx45.8.i = getelementptr inbounds i8, i8* %42, i32 %add.8.i
  %147 = load i8, i8* %arrayidx45.8.i, align 1, !tbaa !6
  %xor472.8.i = xor i8 %147, %xor93.i29.i
  %add.9.i = or i32 %mul44.i, 9
  %arrayidx45.9.i = getelementptr inbounds i8, i8* %42, i32 %add.9.i
  %148 = load i8, i8* %arrayidx45.9.i, align 1, !tbaa !6
  %xor472.9.i = xor i8 %148, %xor246.i37.i
  %add.10.i = or i32 %mul44.i, 10
  %arrayidx45.10.i = getelementptr inbounds i8, i8* %42, i32 %add.10.i
  %149 = load i8, i8* %arrayidx45.10.i, align 1, !tbaa !6
  %xor472.10.i = xor i8 %149, %xor399.i45.i
  %add.11.i = or i32 %mul44.i, 11
  %arrayidx45.11.i = getelementptr inbounds i8, i8* %42, i32 %add.11.i
  %150 = load i8, i8* %arrayidx45.11.i, align 1, !tbaa !6
  %xor472.11.i = xor i8 %150, %xor5412.i50.i
  %add.12.i = or i32 %mul44.i, 12
  %arrayidx45.12.i = getelementptr inbounds i8, i8* %42, i32 %add.12.i
  %151 = load i8, i8* %arrayidx45.12.i, align 1, !tbaa !6
  %xor472.12.i = xor i8 %151, %xor93.i.i
  %add.13.i = or i32 %mul44.i, 13
  %arrayidx45.13.i = getelementptr inbounds i8, i8* %42, i32 %add.13.i
  %152 = load i8, i8* %arrayidx45.13.i, align 1, !tbaa !6
  %xor472.13.i = xor i8 %152, %xor246.i.i
  %add.14.i = or i32 %mul44.i, 14
  %arrayidx45.14.i = getelementptr inbounds i8, i8* %42, i32 %add.14.i
  %153 = load i8, i8* %arrayidx45.14.i, align 1, !tbaa !6
  %xor472.14.i = xor i8 %153, %xor399.i.i
  %add.15.i = or i32 %mul44.i, 15
  %arrayidx45.15.i = getelementptr inbounds i8, i8* %42, i32 %add.15.i
  %154 = load i8, i8* %arrayidx45.15.i, align 1, !tbaa !6
  %xor472.15.i = xor i8 %154, %xor5412.i.i
  %inc54.i = add nuw i32 %_i.1147.i, 1
  %exitcond = icmp eq i32 %inc54.i, %sub145.i
  br i1 %exitcond, label %oaes_shift_rows.exit.i.loopexit, label %oaes_mix_cols.exit.i

oaes_shift_rows.exit.i.loopexit:                  ; preds = %oaes_mix_cols.exit.i
  store i8 %xor472.i, i8* %5, align 16
  store i8 %xor472.1.i, i8* %arrayidx.1.i, align 1
  store i8 %xor472.2.i, i8* %arrayidx.2.i, align 2
  store i8 %xor472.3.i, i8* %arrayidx.3.i, align 1
  store i8 %xor472.4.i, i8* %arrayidx.4.i, align 4
  store i8 %xor472.8.i, i8* %arrayidx.8.i, align 8
  store i8 %xor472.12.i, i8* %arrayidx.12.i, align 4
  store i8 %xor472.11.i, i8* %arrayidx.11.i, align 1
  store i8 %xor472.9.i, i8* %arrayidx.9.i, align 1
  store i8 %xor472.10.i, i8* %arrayidx.10.i, align 2
  store i8 %xor472.13.i, i8* %arrayidx.13.i, align 1
  store i8 %xor472.14.i, i8* %arrayidx.14.i, align 2
  store i8 %xor472.15.i, i8* %arrayidx.15.i, align 1
  store i8 %xor472.5.i, i8* %arrayidx.5.i, align 1
  store i8 %xor472.6.i, i8* %arrayidx.6.i, align 2
  store i8 %xor472.7.i, i8* %arrayidx.7.i, align 1
  br label %oaes_shift_rows.exit.i

oaes_shift_rows.exit.i:                           ; preds = %oaes_shift_rows.exit.i.loopexit, %for.body.preheader.i
  %155 = phi i8 [ %xor3.4.i, %for.body.preheader.i ], [ %xor472.4.i, %oaes_shift_rows.exit.i.loopexit ]
  %156 = phi i8 [ %xor3.3.i, %for.body.preheader.i ], [ %xor472.3.i, %oaes_shift_rows.exit.i.loopexit ]
  %157 = phi i8 [ %xor3.2.i, %for.body.preheader.i ], [ %xor472.2.i, %oaes_shift_rows.exit.i.loopexit ]
  %158 = phi i8 [ %xor3.1.i, %for.body.preheader.i ], [ %xor472.1.i, %oaes_shift_rows.exit.i.loopexit ]
  %159 = phi i8 [ %xor3.i, %for.body.preheader.i ], [ %xor472.i, %oaes_shift_rows.exit.i.loopexit ]
  %160 = phi i8 [ %xor3.15.i, %for.body.preheader.i ], [ %xor472.15.i, %oaes_shift_rows.exit.i.loopexit ]
  %161 = phi i8 [ %xor3.14.i, %for.body.preheader.i ], [ %xor472.14.i, %oaes_shift_rows.exit.i.loopexit ]
  %162 = phi i8 [ %xor3.13.i, %for.body.preheader.i ], [ %xor472.13.i, %oaes_shift_rows.exit.i.loopexit ]
  %163 = phi i8 [ %xor3.12.i, %for.body.preheader.i ], [ %xor472.12.i, %oaes_shift_rows.exit.i.loopexit ]
  %164 = phi i8 [ %xor3.11.i, %for.body.preheader.i ], [ %xor472.11.i, %oaes_shift_rows.exit.i.loopexit ]
  %165 = phi i8 [ %xor3.10.i, %for.body.preheader.i ], [ %xor472.10.i, %oaes_shift_rows.exit.i.loopexit ]
  %166 = phi i8 [ %xor3.9.i, %for.body.preheader.i ], [ %xor472.9.i, %oaes_shift_rows.exit.i.loopexit ]
  %167 = phi i8 [ %xor3.8.i, %for.body.preheader.i ], [ %xor472.8.i, %oaes_shift_rows.exit.i.loopexit ]
  %168 = phi i8 [ %xor3.7.i, %for.body.preheader.i ], [ %xor472.7.i, %oaes_shift_rows.exit.i.loopexit ]
  %169 = phi i8 [ %xor3.6.i, %for.body.preheader.i ], [ %xor472.6.i, %oaes_shift_rows.exit.i.loopexit ]
  %170 = phi i8 [ %xor3.5.i, %for.body.preheader.i ], [ %xor472.5.i, %oaes_shift_rows.exit.i.loopexit ]
  %conv.i7.i = zext i8 %159 to i32
  %shr.i8.i = lshr i32 %conv.i7.i, 4
  %and1.i9.i = and i32 %conv.i7.i, 15
  %arrayidx2.i10.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i8.i, i32 %and1.i9.i
  %171 = load i8, i8* %arrayidx2.i10.i, align 1, !tbaa !6
  %conv.i7.1.i = zext i8 %158 to i32
  %shr.i8.1.i = lshr i32 %conv.i7.1.i, 4
  %and1.i9.1.i = and i32 %conv.i7.1.i, 15
  %arrayidx2.i10.1.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i8.1.i, i32 %and1.i9.1.i
  %172 = load i8, i8* %arrayidx2.i10.1.i, align 1, !tbaa !6
  %conv.i7.2.i = zext i8 %157 to i32
  %shr.i8.2.i = lshr i32 %conv.i7.2.i, 4
  %and1.i9.2.i = and i32 %conv.i7.2.i, 15
  %arrayidx2.i10.2.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i8.2.i, i32 %and1.i9.2.i
  %173 = load i8, i8* %arrayidx2.i10.2.i, align 1, !tbaa !6
  %conv.i7.3.i = zext i8 %156 to i32
  %shr.i8.3.i = lshr i32 %conv.i7.3.i, 4
  %and1.i9.3.i = and i32 %conv.i7.3.i, 15
  %arrayidx2.i10.3.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i8.3.i, i32 %and1.i9.3.i
  %174 = load i8, i8* %arrayidx2.i10.3.i, align 1, !tbaa !6
  %conv.i7.4.i = zext i8 %155 to i32
  %shr.i8.4.i = lshr i32 %conv.i7.4.i, 4
  %and1.i9.4.i = and i32 %conv.i7.4.i, 15
  %arrayidx2.i10.4.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i8.4.i, i32 %and1.i9.4.i
  %175 = load i8, i8* %arrayidx2.i10.4.i, align 1, !tbaa !6
  %conv.i7.5.i = zext i8 %170 to i32
  %shr.i8.5.i = lshr i32 %conv.i7.5.i, 4
  %and1.i9.5.i = and i32 %conv.i7.5.i, 15
  %arrayidx2.i10.5.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i8.5.i, i32 %and1.i9.5.i
  %176 = load i8, i8* %arrayidx2.i10.5.i, align 1, !tbaa !6
  %conv.i7.6.i = zext i8 %169 to i32
  %shr.i8.6.i = lshr i32 %conv.i7.6.i, 4
  %and1.i9.6.i = and i32 %conv.i7.6.i, 15
  %arrayidx2.i10.6.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i8.6.i, i32 %and1.i9.6.i
  %177 = load i8, i8* %arrayidx2.i10.6.i, align 1, !tbaa !6
  %conv.i7.7.i = zext i8 %168 to i32
  %shr.i8.7.i = lshr i32 %conv.i7.7.i, 4
  %and1.i9.7.i = and i32 %conv.i7.7.i, 15
  %arrayidx2.i10.7.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i8.7.i, i32 %and1.i9.7.i
  %178 = load i8, i8* %arrayidx2.i10.7.i, align 1, !tbaa !6
  %conv.i7.8.i = zext i8 %167 to i32
  %shr.i8.8.i = lshr i32 %conv.i7.8.i, 4
  %and1.i9.8.i = and i32 %conv.i7.8.i, 15
  %arrayidx2.i10.8.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i8.8.i, i32 %and1.i9.8.i
  %179 = load i8, i8* %arrayidx2.i10.8.i, align 1, !tbaa !6
  %conv.i7.9.i = zext i8 %166 to i32
  %shr.i8.9.i = lshr i32 %conv.i7.9.i, 4
  %and1.i9.9.i = and i32 %conv.i7.9.i, 15
  %arrayidx2.i10.9.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i8.9.i, i32 %and1.i9.9.i
  %180 = load i8, i8* %arrayidx2.i10.9.i, align 1, !tbaa !6
  %conv.i7.10.i = zext i8 %165 to i32
  %shr.i8.10.i = lshr i32 %conv.i7.10.i, 4
  %and1.i9.10.i = and i32 %conv.i7.10.i, 15
  %arrayidx2.i10.10.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i8.10.i, i32 %and1.i9.10.i
  %181 = load i8, i8* %arrayidx2.i10.10.i, align 1, !tbaa !6
  %conv.i7.11.i = zext i8 %164 to i32
  %shr.i8.11.i = lshr i32 %conv.i7.11.i, 4
  %and1.i9.11.i = and i32 %conv.i7.11.i, 15
  %arrayidx2.i10.11.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i8.11.i, i32 %and1.i9.11.i
  %182 = load i8, i8* %arrayidx2.i10.11.i, align 1, !tbaa !6
  %conv.i7.12.i = zext i8 %163 to i32
  %shr.i8.12.i = lshr i32 %conv.i7.12.i, 4
  %and1.i9.12.i = and i32 %conv.i7.12.i, 15
  %arrayidx2.i10.12.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i8.12.i, i32 %and1.i9.12.i
  %183 = load i8, i8* %arrayidx2.i10.12.i, align 1, !tbaa !6
  %conv.i7.13.i = zext i8 %162 to i32
  %shr.i8.13.i = lshr i32 %conv.i7.13.i, 4
  %and1.i9.13.i = and i32 %conv.i7.13.i, 15
  %arrayidx2.i10.13.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i8.13.i, i32 %and1.i9.13.i
  %184 = load i8, i8* %arrayidx2.i10.13.i, align 1, !tbaa !6
  %conv.i7.14.i = zext i8 %161 to i32
  %shr.i8.14.i = lshr i32 %conv.i7.14.i, 4
  %and1.i9.14.i = and i32 %conv.i7.14.i, 15
  %arrayidx2.i10.14.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i8.14.i, i32 %and1.i9.14.i
  %185 = load i8, i8* %arrayidx2.i10.14.i, align 1, !tbaa !6
  %conv.i7.15.i = zext i8 %160 to i32
  %shr.i8.15.i = lshr i32 %conv.i7.15.i, 4
  %and1.i9.15.i = and i32 %conv.i7.15.i, 15
  %arrayidx2.i10.15.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i8.15.i, i32 %and1.i9.15.i
  %186 = load i8, i8* %arrayidx2.i10.15.i, align 1, !tbaa !6
  %187 = load i8*, i8** %exp_data.i, align 4, !tbaa !14
  %sub76.i = shl i32 %74, 4
  %add79.i = add i32 %sub76.i, -16
  %arrayidx80.i = getelementptr inbounds i8, i8* %187, i32 %add79.i
  %188 = load i8, i8* %arrayidx80.i, align 1, !tbaa !6
  %xor821.i = xor i8 %188, %171
  store i8 %xor821.i, i8* %5, align 16, !tbaa !6
  %add79.1.i = add i32 %sub76.i, -15
  %arrayidx80.1.i = getelementptr inbounds i8, i8* %187, i32 %add79.1.i
  %189 = load i8, i8* %arrayidx80.1.i, align 1, !tbaa !6
  %xor821.1.i = xor i8 %189, %176
  store i8 %xor821.1.i, i8* %arrayidx.1.i, align 1, !tbaa !6
  %add79.2.i = add i32 %sub76.i, -14
  %arrayidx80.2.i = getelementptr inbounds i8, i8* %187, i32 %add79.2.i
  %190 = load i8, i8* %arrayidx80.2.i, align 1, !tbaa !6
  %xor821.2.i = xor i8 %190, %181
  store i8 %xor821.2.i, i8* %arrayidx.2.i, align 2, !tbaa !6
  %add79.3.i = add i32 %sub76.i, -13
  %arrayidx80.3.i = getelementptr inbounds i8, i8* %187, i32 %add79.3.i
  %191 = load i8, i8* %arrayidx80.3.i, align 1, !tbaa !6
  %xor821.3.i = xor i8 %191, %186
  store i8 %xor821.3.i, i8* %arrayidx.3.i, align 1, !tbaa !6
  %add79.4.i = add i32 %sub76.i, -12
  %arrayidx80.4.i = getelementptr inbounds i8, i8* %187, i32 %add79.4.i
  %192 = load i8, i8* %arrayidx80.4.i, align 1, !tbaa !6
  %xor821.4.i = xor i8 %192, %175
  store i8 %xor821.4.i, i8* %arrayidx.4.i, align 4, !tbaa !6
  %add79.5.i = add i32 %sub76.i, -11
  %arrayidx80.5.i = getelementptr inbounds i8, i8* %187, i32 %add79.5.i
  %193 = load i8, i8* %arrayidx80.5.i, align 1, !tbaa !6
  %xor821.5.i = xor i8 %193, %180
  store i8 %xor821.5.i, i8* %arrayidx.5.i, align 1, !tbaa !6
  %add79.6.i = add i32 %sub76.i, -10
  %arrayidx80.6.i = getelementptr inbounds i8, i8* %187, i32 %add79.6.i
  %194 = load i8, i8* %arrayidx80.6.i, align 1, !tbaa !6
  %xor821.6.i = xor i8 %194, %185
  store i8 %xor821.6.i, i8* %arrayidx.6.i, align 2, !tbaa !6
  %add79.7.i = add i32 %sub76.i, -9
  %arrayidx80.7.i = getelementptr inbounds i8, i8* %187, i32 %add79.7.i
  %195 = load i8, i8* %arrayidx80.7.i, align 1, !tbaa !6
  %xor821.7.i = xor i8 %195, %174
  store i8 %xor821.7.i, i8* %arrayidx.7.i, align 1, !tbaa !6
  %add79.8.i = add i32 %sub76.i, -8
  %arrayidx80.8.i = getelementptr inbounds i8, i8* %187, i32 %add79.8.i
  %196 = load i8, i8* %arrayidx80.8.i, align 1, !tbaa !6
  %xor821.8.i = xor i8 %196, %179
  store i8 %xor821.8.i, i8* %arrayidx.8.i, align 8, !tbaa !6
  %add79.9.i = add i32 %sub76.i, -7
  %arrayidx80.9.i = getelementptr inbounds i8, i8* %187, i32 %add79.9.i
  %197 = load i8, i8* %arrayidx80.9.i, align 1, !tbaa !6
  %xor821.9.i = xor i8 %197, %184
  store i8 %xor821.9.i, i8* %arrayidx.9.i, align 1, !tbaa !6
  %add79.10.i = add i32 %sub76.i, -6
  %arrayidx80.10.i = getelementptr inbounds i8, i8* %187, i32 %add79.10.i
  %198 = load i8, i8* %arrayidx80.10.i, align 1, !tbaa !6
  %xor821.10.i = xor i8 %198, %173
  store i8 %xor821.10.i, i8* %arrayidx.10.i, align 2, !tbaa !6
  %add79.11.i = add i32 %sub76.i, -5
  %arrayidx80.11.i = getelementptr inbounds i8, i8* %187, i32 %add79.11.i
  %199 = load i8, i8* %arrayidx80.11.i, align 1, !tbaa !6
  %xor821.11.i = xor i8 %199, %178
  store i8 %xor821.11.i, i8* %arrayidx.11.i, align 1, !tbaa !6
  %add79.12.i = add i32 %sub76.i, -4
  %arrayidx80.12.i = getelementptr inbounds i8, i8* %187, i32 %add79.12.i
  %200 = load i8, i8* %arrayidx80.12.i, align 1, !tbaa !6
  %xor821.12.i = xor i8 %200, %183
  store i8 %xor821.12.i, i8* %arrayidx.12.i, align 4, !tbaa !6
  %add79.13.i = add i32 %sub76.i, -3
  %arrayidx80.13.i = getelementptr inbounds i8, i8* %187, i32 %add79.13.i
  %201 = load i8, i8* %arrayidx80.13.i, align 1, !tbaa !6
  %xor821.13.i = xor i8 %201, %172
  store i8 %xor821.13.i, i8* %arrayidx.13.i, align 1, !tbaa !6
  %add79.14.i = add i32 %sub76.i, -2
  %arrayidx80.14.i = getelementptr inbounds i8, i8* %187, i32 %add79.14.i
  %202 = load i8, i8* %arrayidx80.14.i, align 1, !tbaa !6
  %xor821.14.i = xor i8 %202, %177
  store i8 %xor821.14.i, i8* %arrayidx.14.i, align 2, !tbaa !6
  %add79.15.i = add i32 %sub76.i, -1
  %arrayidx80.15.i = getelementptr inbounds i8, i8* %187, i32 %add79.15.i
  %203 = load i8, i8* %arrayidx80.15.i, align 1, !tbaa !6
  %xor821.15.i = xor i8 %203, %182
  store i8 %xor821.15.i, i8* %arrayidx.15.i, align 1, !tbaa !6
  br label %lor.end

lor.end:                                          ; preds = %oaes_shift_rows.exit.i, %if.end.i, %if.end69
  %204 = phi i32 [ 1, %if.end69 ], [ 1, %if.end.i ], [ 0, %oaes_shift_rows.exit.i ]
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(16) %add.ptr42, i8* nonnull align 16 dereferenceable(16) %5, i32 16, i1 false)
  %205 = load i16, i16* %2, align 4, !tbaa !29
  %206 = and i16 %205, 2
  %tobool79 = icmp eq i16 %206, 0
  br i1 %tobool79, label %if.end84, label %if.then80

if.then80:                                        ; preds = %lor.end
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 2 dereferenceable(16) %iv, i8* nonnull align 16 dereferenceable(16) %5, i32 16, i1 false)
  br label %if.end84

if.end84:                                         ; preds = %lor.end, %if.then80
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %5) #8
  %add86 = add i32 %_i.0152, 16
  %cmp30 = icmp ult i32 %add86, %add
  br i1 %cmp30, label %for.body, label %cleanup

cleanup:                                          ; preds = %if.end84, %if.end26, %if.end22, %if.end18, %if.end12, %if.end8, %if.end, %entry
  %retval.0 = phi i32 [ 2, %entry ], [ 3, %if.end ], [ 6, %if.end8 ], [ 0, %if.end12 ], [ 9, %if.end18 ], [ 7, %if.end22 ], [ 0, %if.end26 ], [ %204, %if.end84 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define hidden i32 @oaes_decrypt(i8* readonly %ctx, i8* readonly %c, i32 %c_len, i8* %m, i32* %m_len) local_unnamed_addr #0 {
entry:
  %_iv = alloca [16 x i8], align 16
  %0 = getelementptr inbounds [16 x i8], [16 x i8]* %_iv, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %0) #8
  %cmp = icmp eq i8* %ctx, null
  br i1 %cmp, label %cleanup127, label %if.end

if.end:                                           ; preds = %entry
  %cmp1 = icmp eq i8* %c, null
  br i1 %cmp1, label %cleanup127, label %if.end3

if.end3:                                          ; preds = %if.end
  %rem = and i32 %c_len, 15
  %tobool = icmp eq i32 %rem, 0
  br i1 %tobool, label %if.end5, label %cleanup127

if.end5:                                          ; preds = %if.end3
  %cmp6 = icmp eq i32* %m_len, null
  br i1 %cmp6, label %cleanup127, label %if.end8

if.end8:                                          ; preds = %if.end5
  %1 = load i32, i32* %m_len, align 4, !tbaa !2
  %sub = add i32 %c_len, -32
  store i32 %sub, i32* %m_len, align 4, !tbaa !2
  %cmp9 = icmp eq i8* %m, null
  br i1 %cmp9, label %cleanup127, label %if.end11

if.end11:                                         ; preds = %if.end8
  %cmp12 = icmp ult i32 %1, %sub
  br i1 %cmp12, label %cleanup127, label %if.end14

if.end14:                                         ; preds = %if.end11
  %key = bitcast i8* %ctx to %struct._oaes_key**
  %2 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %cmp15 = icmp eq %struct._oaes_key* %2, null
  br i1 %cmp15, label %cleanup127, label %if.end17

if.end17:                                         ; preds = %if.end14
  %call = tail call i32 @memcmp(i8* nonnull dereferenceable(4) %c, i8* nonnull dereferenceable(4) getelementptr inbounds (<{ i8, i8, i8, i8, i8, i8, [10 x i8] }>, <{ i8, i8, i8, i8, i8, i8, [10 x i8] }>* @oaes_header, i32 0, i32 0), i32 4)
  %cmp18 = icmp eq i32 %call, 0
  br i1 %cmp18, label %if.end20, label %cleanup127

if.end20:                                         ; preds = %if.end17
  %arrayidx = getelementptr inbounds i8, i8* %c, i32 4
  %3 = load i8, i8* %arrayidx, align 1, !tbaa !6
  %cond135 = icmp eq i8 %3, 1
  br i1 %cond135, label %sw.epilog, label %cleanup127

sw.epilog:                                        ; preds = %if.end20
  %arrayidx21 = getelementptr inbounds i8, i8* %c, i32 5
  %4 = load i8, i8* %arrayidx21, align 1, !tbaa !6
  %cond136 = icmp eq i8 %4, 2
  br i1 %cond136, label %sw.epilog24, label %cleanup127

sw.epilog24:                                      ; preds = %sw.epilog
  %_options.0.add.ptr.sroa_idx = getelementptr inbounds i8, i8* %c, i32 6
  %_options.0.add.ptr.sroa_cast = bitcast i8* %_options.0.add.ptr.sroa_idx to i16*
  %_options.0.copyload = load i16, i16* %_options.0.add.ptr.sroa_cast, align 1
  %conv25 = zext i16 %_options.0.copyload to i32
  %and = and i32 %conv25, 65532
  %tobool26 = icmp eq i32 %and, 0
  br i1 %tobool26, label %if.end28, label %cleanup127

if.end28:                                         ; preds = %sw.epilog24
  %and33 = and i32 %conv25, 2
  %5 = and i32 %conv25, 3
  %6 = icmp eq i32 %5, 3
  %cmp38 = icmp eq i16 %_options.0.copyload, 0
  %or.cond207 = or i1 %cmp38, %6
  br i1 %or.cond207, label %cleanup127, label %if.end41

if.end41:                                         ; preds = %if.end28
  %_flags.0.add.ptr42.sroa_raw_idx = getelementptr inbounds i8, i8* %c, i32 8
  %_flags.0.copyload = load i8, i8* %_flags.0.add.ptr42.sroa_raw_idx, align 1
  %conv43 = zext i8 %_flags.0.copyload to i32
  %and44 = and i32 %conv43, 254
  %tobool45 = icmp eq i32 %and44, 0
  br i1 %tobool45, label %if.end47, label %cleanup127

if.end47:                                         ; preds = %if.end41
  %add.ptr48 = getelementptr inbounds i8, i8* %c, i32 16
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 dereferenceable(16) %0, i8* nonnull align 1 dereferenceable(16) %add.ptr48, i32 16, i1 false)
  %add.ptr49 = getelementptr inbounds i8, i8* %c, i32 32
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %m, i8* nonnull align 1 %add.ptr49, i32 %sub, i1 false)
  %7 = load i32, i32* %m_len, align 4, !tbaa !2
  %cmp50229 = icmp eq i32 %7, 0
  br i1 %cmp50229, label %for.end89, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %if.end47
  %tobool54 = icmp ne i32 %and33, 0
  %arrayidx81.1 = getelementptr inbounds [16 x i8], [16 x i8]* %_iv, i32 0, i32 1
  %arrayidx81.2 = getelementptr inbounds [16 x i8], [16 x i8]* %_iv, i32 0, i32 2
  %arrayidx81.3 = getelementptr inbounds [16 x i8], [16 x i8]* %_iv, i32 0, i32 3
  %arrayidx81.4 = getelementptr inbounds [16 x i8], [16 x i8]* %_iv, i32 0, i32 4
  %arrayidx81.5 = getelementptr inbounds [16 x i8], [16 x i8]* %_iv, i32 0, i32 5
  %arrayidx81.6 = getelementptr inbounds [16 x i8], [16 x i8]* %_iv, i32 0, i32 6
  %arrayidx81.7 = getelementptr inbounds [16 x i8], [16 x i8]* %_iv, i32 0, i32 7
  %arrayidx81.8 = getelementptr inbounds [16 x i8], [16 x i8]* %_iv, i32 0, i32 8
  %arrayidx81.9 = getelementptr inbounds [16 x i8], [16 x i8]* %_iv, i32 0, i32 9
  %arrayidx81.10 = getelementptr inbounds [16 x i8], [16 x i8]* %_iv, i32 0, i32 10
  %arrayidx81.11 = getelementptr inbounds [16 x i8], [16 x i8]* %_iv, i32 0, i32 11
  %arrayidx81.12 = getelementptr inbounds [16 x i8], [16 x i8]* %_iv, i32 0, i32 12
  %arrayidx81.13 = getelementptr inbounds [16 x i8], [16 x i8]* %_iv, i32 0, i32 13
  %arrayidx81.14 = getelementptr inbounds [16 x i8], [16 x i8]* %_iv, i32 0, i32 14
  %arrayidx81.15 = getelementptr inbounds [16 x i8], [16 x i8]* %_iv, i32 0, i32 15
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc87
  %8 = phi i32 [ %7, %for.body.lr.ph ], [ %316, %for.inc87 ]
  %_i.0231 = phi i32 [ 0, %for.body.lr.ph ], [ %add88, %for.inc87 ]
  %_rc.0230 = phi i32 [ 0, %for.body.lr.ph ], [ %283, %for.inc87 ]
  %cmp56 = icmp ne i32 %_i.0231, 0
  %or.cond = and i1 %tobool54, %cmp56
  br i1 %or.cond, label %if.then58, label %if.end62

if.then58:                                        ; preds = %for.body
  %add.ptr61 = getelementptr inbounds i8, i8* %add.ptr48, i32 %_i.0231
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 dereferenceable(16) %0, i8* nonnull align 1 dereferenceable(16) %add.ptr61, i32 16, i1 false)
  br label %if.end62

if.end62:                                         ; preds = %if.then58, %for.body
  %tobool63 = icmp eq i32 %_rc.0230, 0
  br i1 %tobool63, label %if.end3.i, label %lor.end

if.end3.i:                                        ; preds = %if.end62
  %add.ptr64 = getelementptr inbounds i8, i8* %m, i32 %_i.0231
  %sub65 = sub i32 %8, %_i.0231
  %cmp66 = icmp ugt i32 %sub65, 15
  br i1 %cmp66, label %if.end6.i, label %lor.end

if.end6.i:                                        ; preds = %if.end3.i
  %9 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %cmp7.i = icmp eq %struct._oaes_key* %9, null
  br i1 %cmp7.i, label %lor.end, label %for.body.preheader.i

for.body.preheader.i:                             ; preds = %if.end6.i
  %10 = load i8, i8* %add.ptr64, align 1, !tbaa !6
  %exp_data.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %9, i32 0, i32 3
  %11 = load i8*, i8** %exp_data.i, align 4, !tbaa !14
  %num_keys.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %9, i32 0, i32 4
  %12 = load i32, i32* %num_keys.i, align 4, !tbaa !17
  %sub.i = shl i32 %12, 4
  %add.i = add i32 %sub.i, -16
  %arrayidx14.i = getelementptr inbounds i8, i8* %11, i32 %add.i
  %13 = load i8, i8* %arrayidx14.i, align 1, !tbaa !6
  %xor139.i = xor i8 %13, %10
  store i8 %xor139.i, i8* %add.ptr64, align 1, !tbaa !6
  %arrayidx.1.i = getelementptr inbounds i8, i8* %add.ptr64, i32 1
  %14 = load i8, i8* %arrayidx.1.i, align 1, !tbaa !6
  %15 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.1.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %15, i32 0, i32 3
  %16 = load i8*, i8** %exp_data.1.i, align 4, !tbaa !14
  %num_keys.1.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %15, i32 0, i32 4
  %17 = load i32, i32* %num_keys.1.i, align 4, !tbaa !17
  %sub.1.i = shl i32 %17, 4
  %add.1.i = add i32 %sub.1.i, -15
  %arrayidx14.1.i = getelementptr inbounds i8, i8* %16, i32 %add.1.i
  %18 = load i8, i8* %arrayidx14.1.i, align 1, !tbaa !6
  %xor139.1.i = xor i8 %18, %14
  store i8 %xor139.1.i, i8* %arrayidx.1.i, align 1, !tbaa !6
  %arrayidx.2.i = getelementptr inbounds i8, i8* %add.ptr64, i32 2
  %19 = load i8, i8* %arrayidx.2.i, align 1, !tbaa !6
  %20 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.2.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %20, i32 0, i32 3
  %21 = load i8*, i8** %exp_data.2.i, align 4, !tbaa !14
  %num_keys.2.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %20, i32 0, i32 4
  %22 = load i32, i32* %num_keys.2.i, align 4, !tbaa !17
  %sub.2.i = shl i32 %22, 4
  %add.2.i = add i32 %sub.2.i, -14
  %arrayidx14.2.i = getelementptr inbounds i8, i8* %21, i32 %add.2.i
  %23 = load i8, i8* %arrayidx14.2.i, align 1, !tbaa !6
  %xor139.2.i = xor i8 %23, %19
  store i8 %xor139.2.i, i8* %arrayidx.2.i, align 1, !tbaa !6
  %arrayidx.3.i = getelementptr inbounds i8, i8* %add.ptr64, i32 3
  %24 = load i8, i8* %arrayidx.3.i, align 1, !tbaa !6
  %25 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.3.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %25, i32 0, i32 3
  %26 = load i8*, i8** %exp_data.3.i, align 4, !tbaa !14
  %num_keys.3.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %25, i32 0, i32 4
  %27 = load i32, i32* %num_keys.3.i, align 4, !tbaa !17
  %sub.3.i = shl i32 %27, 4
  %add.3.i = add i32 %sub.3.i, -13
  %arrayidx14.3.i = getelementptr inbounds i8, i8* %26, i32 %add.3.i
  %28 = load i8, i8* %arrayidx14.3.i, align 1, !tbaa !6
  %xor139.3.i = xor i8 %28, %24
  store i8 %xor139.3.i, i8* %arrayidx.3.i, align 1, !tbaa !6
  %arrayidx.4.i = getelementptr inbounds i8, i8* %add.ptr64, i32 4
  %29 = load i8, i8* %arrayidx.4.i, align 1, !tbaa !6
  %30 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.4.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %30, i32 0, i32 3
  %31 = load i8*, i8** %exp_data.4.i, align 4, !tbaa !14
  %num_keys.4.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %30, i32 0, i32 4
  %32 = load i32, i32* %num_keys.4.i, align 4, !tbaa !17
  %sub.4.i = shl i32 %32, 4
  %add.4.i = add i32 %sub.4.i, -12
  %arrayidx14.4.i = getelementptr inbounds i8, i8* %31, i32 %add.4.i
  %33 = load i8, i8* %arrayidx14.4.i, align 1, !tbaa !6
  %xor139.4.i = xor i8 %33, %29
  store i8 %xor139.4.i, i8* %arrayidx.4.i, align 1, !tbaa !6
  %arrayidx.5.i = getelementptr inbounds i8, i8* %add.ptr64, i32 5
  %34 = load i8, i8* %arrayidx.5.i, align 1, !tbaa !6
  %35 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.5.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %35, i32 0, i32 3
  %36 = load i8*, i8** %exp_data.5.i, align 4, !tbaa !14
  %num_keys.5.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %35, i32 0, i32 4
  %37 = load i32, i32* %num_keys.5.i, align 4, !tbaa !17
  %sub.5.i = shl i32 %37, 4
  %add.5.i = add i32 %sub.5.i, -11
  %arrayidx14.5.i = getelementptr inbounds i8, i8* %36, i32 %add.5.i
  %38 = load i8, i8* %arrayidx14.5.i, align 1, !tbaa !6
  %xor139.5.i = xor i8 %38, %34
  store i8 %xor139.5.i, i8* %arrayidx.5.i, align 1, !tbaa !6
  %arrayidx.6.i = getelementptr inbounds i8, i8* %add.ptr64, i32 6
  %39 = load i8, i8* %arrayidx.6.i, align 1, !tbaa !6
  %40 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.6.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %40, i32 0, i32 3
  %41 = load i8*, i8** %exp_data.6.i, align 4, !tbaa !14
  %num_keys.6.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %40, i32 0, i32 4
  %42 = load i32, i32* %num_keys.6.i, align 4, !tbaa !17
  %sub.6.i = shl i32 %42, 4
  %add.6.i = add i32 %sub.6.i, -10
  %arrayidx14.6.i = getelementptr inbounds i8, i8* %41, i32 %add.6.i
  %43 = load i8, i8* %arrayidx14.6.i, align 1, !tbaa !6
  %xor139.6.i = xor i8 %43, %39
  store i8 %xor139.6.i, i8* %arrayidx.6.i, align 1, !tbaa !6
  %arrayidx.7.i = getelementptr inbounds i8, i8* %add.ptr64, i32 7
  %44 = load i8, i8* %arrayidx.7.i, align 1, !tbaa !6
  %45 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.7.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %45, i32 0, i32 3
  %46 = load i8*, i8** %exp_data.7.i, align 4, !tbaa !14
  %num_keys.7.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %45, i32 0, i32 4
  %47 = load i32, i32* %num_keys.7.i, align 4, !tbaa !17
  %sub.7.i = shl i32 %47, 4
  %add.7.i = add i32 %sub.7.i, -9
  %arrayidx14.7.i = getelementptr inbounds i8, i8* %46, i32 %add.7.i
  %48 = load i8, i8* %arrayidx14.7.i, align 1, !tbaa !6
  %xor139.7.i = xor i8 %48, %44
  store i8 %xor139.7.i, i8* %arrayidx.7.i, align 1, !tbaa !6
  %arrayidx.8.i = getelementptr inbounds i8, i8* %add.ptr64, i32 8
  %49 = load i8, i8* %arrayidx.8.i, align 1, !tbaa !6
  %50 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.8.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %50, i32 0, i32 3
  %51 = load i8*, i8** %exp_data.8.i, align 4, !tbaa !14
  %num_keys.8.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %50, i32 0, i32 4
  %52 = load i32, i32* %num_keys.8.i, align 4, !tbaa !17
  %sub.8.i = shl i32 %52, 4
  %add.8.i = add i32 %sub.8.i, -8
  %arrayidx14.8.i = getelementptr inbounds i8, i8* %51, i32 %add.8.i
  %53 = load i8, i8* %arrayidx14.8.i, align 1, !tbaa !6
  %xor139.8.i = xor i8 %53, %49
  store i8 %xor139.8.i, i8* %arrayidx.8.i, align 1, !tbaa !6
  %arrayidx.9.i = getelementptr inbounds i8, i8* %add.ptr64, i32 9
  %54 = load i8, i8* %arrayidx.9.i, align 1, !tbaa !6
  %55 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.9.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %55, i32 0, i32 3
  %56 = load i8*, i8** %exp_data.9.i, align 4, !tbaa !14
  %num_keys.9.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %55, i32 0, i32 4
  %57 = load i32, i32* %num_keys.9.i, align 4, !tbaa !17
  %sub.9.i = shl i32 %57, 4
  %add.9.i = add i32 %sub.9.i, -7
  %arrayidx14.9.i = getelementptr inbounds i8, i8* %56, i32 %add.9.i
  %58 = load i8, i8* %arrayidx14.9.i, align 1, !tbaa !6
  %xor139.9.i = xor i8 %58, %54
  store i8 %xor139.9.i, i8* %arrayidx.9.i, align 1, !tbaa !6
  %arrayidx.10.i = getelementptr inbounds i8, i8* %add.ptr64, i32 10
  %59 = load i8, i8* %arrayidx.10.i, align 1, !tbaa !6
  %60 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.10.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %60, i32 0, i32 3
  %61 = load i8*, i8** %exp_data.10.i, align 4, !tbaa !14
  %num_keys.10.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %60, i32 0, i32 4
  %62 = load i32, i32* %num_keys.10.i, align 4, !tbaa !17
  %sub.10.i = shl i32 %62, 4
  %add.10.i = add i32 %sub.10.i, -6
  %arrayidx14.10.i = getelementptr inbounds i8, i8* %61, i32 %add.10.i
  %63 = load i8, i8* %arrayidx14.10.i, align 1, !tbaa !6
  %xor139.10.i = xor i8 %63, %59
  store i8 %xor139.10.i, i8* %arrayidx.10.i, align 1, !tbaa !6
  %arrayidx.11.i = getelementptr inbounds i8, i8* %add.ptr64, i32 11
  %64 = load i8, i8* %arrayidx.11.i, align 1, !tbaa !6
  %65 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.11.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %65, i32 0, i32 3
  %66 = load i8*, i8** %exp_data.11.i, align 4, !tbaa !14
  %num_keys.11.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %65, i32 0, i32 4
  %67 = load i32, i32* %num_keys.11.i, align 4, !tbaa !17
  %sub.11.i = shl i32 %67, 4
  %add.11.i = add i32 %sub.11.i, -5
  %arrayidx14.11.i = getelementptr inbounds i8, i8* %66, i32 %add.11.i
  %68 = load i8, i8* %arrayidx14.11.i, align 1, !tbaa !6
  %xor139.11.i = xor i8 %68, %64
  store i8 %xor139.11.i, i8* %arrayidx.11.i, align 1, !tbaa !6
  %arrayidx.12.i = getelementptr inbounds i8, i8* %add.ptr64, i32 12
  %69 = load i8, i8* %arrayidx.12.i, align 1, !tbaa !6
  %70 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.12.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %70, i32 0, i32 3
  %71 = load i8*, i8** %exp_data.12.i, align 4, !tbaa !14
  %num_keys.12.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %70, i32 0, i32 4
  %72 = load i32, i32* %num_keys.12.i, align 4, !tbaa !17
  %sub.12.i = shl i32 %72, 4
  %add.12.i = add i32 %sub.12.i, -4
  %arrayidx14.12.i = getelementptr inbounds i8, i8* %71, i32 %add.12.i
  %73 = load i8, i8* %arrayidx14.12.i, align 1, !tbaa !6
  %xor139.12.i = xor i8 %73, %69
  store i8 %xor139.12.i, i8* %arrayidx.12.i, align 1, !tbaa !6
  %arrayidx.13.i = getelementptr inbounds i8, i8* %add.ptr64, i32 13
  %74 = load i8, i8* %arrayidx.13.i, align 1, !tbaa !6
  %75 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.13.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %75, i32 0, i32 3
  %76 = load i8*, i8** %exp_data.13.i, align 4, !tbaa !14
  %num_keys.13.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %75, i32 0, i32 4
  %77 = load i32, i32* %num_keys.13.i, align 4, !tbaa !17
  %sub.13.i = shl i32 %77, 4
  %add.13.i = add i32 %sub.13.i, -3
  %arrayidx14.13.i = getelementptr inbounds i8, i8* %76, i32 %add.13.i
  %78 = load i8, i8* %arrayidx14.13.i, align 1, !tbaa !6
  %xor139.13.i = xor i8 %78, %74
  store i8 %xor139.13.i, i8* %arrayidx.13.i, align 1, !tbaa !6
  %arrayidx.14.i = getelementptr inbounds i8, i8* %add.ptr64, i32 14
  %79 = load i8, i8* %arrayidx.14.i, align 1, !tbaa !6
  %80 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.14.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %80, i32 0, i32 3
  %81 = load i8*, i8** %exp_data.14.i, align 4, !tbaa !14
  %num_keys.14.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %80, i32 0, i32 4
  %82 = load i32, i32* %num_keys.14.i, align 4, !tbaa !17
  %sub.14.i = shl i32 %82, 4
  %add.14.i = add i32 %sub.14.i, -2
  %arrayidx14.14.i = getelementptr inbounds i8, i8* %81, i32 %add.14.i
  %83 = load i8, i8* %arrayidx14.14.i, align 1, !tbaa !6
  %xor139.14.i = xor i8 %83, %79
  store i8 %xor139.14.i, i8* %arrayidx.14.i, align 1, !tbaa !6
  %arrayidx.15.i = getelementptr inbounds i8, i8* %add.ptr64, i32 15
  %84 = load i8, i8* %arrayidx.15.i, align 1, !tbaa !6
  %85 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.15.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %85, i32 0, i32 3
  %86 = load i8*, i8** %exp_data.15.i, align 4, !tbaa !14
  %num_keys.15.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %85, i32 0, i32 4
  %87 = load i32, i32* %num_keys.15.i, align 4, !tbaa !17
  %sub.15.i = shl i32 %87, 4
  %add.15.i = add i32 %sub.15.i, -1
  %arrayidx14.15.i = getelementptr inbounds i8, i8* %86, i32 %add.15.i
  %88 = load i8, i8* %arrayidx14.15.i, align 1, !tbaa !6
  %xor139.15.i = xor i8 %88, %84
  store i8 %xor139.15.i, i8* %arrayidx.15.i, align 1, !tbaa !6
  %89 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %num_keys19.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %89, i32 0, i32 4
  %90 = load i32, i32* %num_keys19.i, align 4, !tbaa !17
  %sub20.i = add i32 %90, -2
  br label %oaes_inv_shift_rows.exit.i

oaes_inv_shift_rows.exit.i:                       ; preds = %oaes_inv_sub_byte.exit284.preheader.i, %for.body.preheader.i
  %91 = phi i8 [ %xor139.12.i, %for.body.preheader.i ], [ %xor113.i.i, %oaes_inv_sub_byte.exit284.preheader.i ]
  %92 = phi i8 [ %xor139.8.i, %for.body.preheader.i ], [ %xor113.i166.i, %oaes_inv_sub_byte.exit284.preheader.i ]
  %93 = phi i8 [ %xor139.9.i, %for.body.preheader.i ], [ %xor286.i173.i, %oaes_inv_sub_byte.exit284.preheader.i ]
  %94 = phi i8 [ %xor139.15.i, %for.body.preheader.i ], [ %xor6212.i.i, %oaes_inv_sub_byte.exit284.preheader.i ]
  %95 = phi i8 [ %xor139.11.i, %for.body.preheader.i ], [ %xor6212.i187.i, %oaes_inv_sub_byte.exit284.preheader.i ]
  %96 = phi i8 [ %xor139.14.i, %for.body.preheader.i ], [ %xor459.i.i, %oaes_inv_sub_byte.exit284.preheader.i ]
  %97 = phi i8 [ %xor139.10.i, %for.body.preheader.i ], [ %xor459.i180.i, %oaes_inv_sub_byte.exit284.preheader.i ]
  %98 = phi i8 [ %xor139.13.i, %for.body.preheader.i ], [ %xor286.i.i, %oaes_inv_sub_byte.exit284.preheader.i ]
  %_i.1.i = phi i32 [ %sub20.i, %for.body.preheader.i ], [ %dec.i, %oaes_inv_sub_byte.exit284.preheader.i ]
  %cmp22.i = icmp eq i32 %_i.1.i, 0
  %99 = load i8, i8* %arrayidx.7.i, align 1, !tbaa !6
  %100 = load i8, i8* %arrayidx.1.i, align 1, !tbaa !6
  %101 = load i8, i8* %arrayidx.5.i, align 1, !tbaa !6
  %102 = load i8, i8* %arrayidx.2.i, align 1, !tbaa !6
  %103 = load i8, i8* %arrayidx.6.i, align 1, !tbaa !6
  %104 = load i8, i8* %arrayidx.3.i, align 1, !tbaa !6
  %105 = load i8, i8* %add.ptr64, align 1, !tbaa !6
  %conv.i.i = zext i8 %105 to i32
  %and.i.i = and i32 %conv.i.i, 15
  %shr.i.i = lshr i32 %conv.i.i, 4
  %arrayidx2.i141.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_inv_sub_byte_value, i32 0, i32 %shr.i.i, i32 %and.i.i
  %106 = load i8, i8* %arrayidx2.i141.i, align 1, !tbaa !6
  store i8 %106, i8* %add.ptr64, align 1, !tbaa !6
  %conv.i.1.i = zext i8 %98 to i32
  %and.i.1.i = and i32 %conv.i.1.i, 15
  %shr.i.1.i = lshr i32 %conv.i.1.i, 4
  %arrayidx2.i141.1.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_inv_sub_byte_value, i32 0, i32 %shr.i.1.i, i32 %and.i.1.i
  %107 = load i8, i8* %arrayidx2.i141.1.i, align 1, !tbaa !6
  store i8 %107, i8* %arrayidx.1.i, align 1, !tbaa !6
  %conv.i.2.i = zext i8 %97 to i32
  %and.i.2.i = and i32 %conv.i.2.i, 15
  %shr.i.2.i = lshr i32 %conv.i.2.i, 4
  %arrayidx2.i141.2.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_inv_sub_byte_value, i32 0, i32 %shr.i.2.i, i32 %and.i.2.i
  %108 = load i8, i8* %arrayidx2.i141.2.i, align 1, !tbaa !6
  store i8 %108, i8* %arrayidx.2.i, align 1, !tbaa !6
  %conv.i.3.i = zext i8 %99 to i32
  %and.i.3.i = and i32 %conv.i.3.i, 15
  %shr.i.3.i = lshr i32 %conv.i.3.i, 4
  %arrayidx2.i141.3.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_inv_sub_byte_value, i32 0, i32 %shr.i.3.i, i32 %and.i.3.i
  %109 = load i8, i8* %arrayidx2.i141.3.i, align 1, !tbaa !6
  store i8 %109, i8* %arrayidx.3.i, align 1, !tbaa !6
  %110 = load i8, i8* %arrayidx.4.i, align 1, !tbaa !6
  %conv.i.4.i = zext i8 %110 to i32
  %and.i.4.i = and i32 %conv.i.4.i, 15
  %shr.i.4.i = lshr i32 %conv.i.4.i, 4
  %arrayidx2.i141.4.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_inv_sub_byte_value, i32 0, i32 %shr.i.4.i, i32 %and.i.4.i
  %111 = load i8, i8* %arrayidx2.i141.4.i, align 1, !tbaa !6
  store i8 %111, i8* %arrayidx.4.i, align 1, !tbaa !6
  %conv.i.5.i = zext i8 %100 to i32
  %and.i.5.i = and i32 %conv.i.5.i, 15
  %shr.i.5.i = lshr i32 %conv.i.5.i, 4
  %arrayidx2.i141.5.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_inv_sub_byte_value, i32 0, i32 %shr.i.5.i, i32 %and.i.5.i
  %112 = load i8, i8* %arrayidx2.i141.5.i, align 1, !tbaa !6
  store i8 %112, i8* %arrayidx.5.i, align 1, !tbaa !6
  %conv.i.6.i = zext i8 %96 to i32
  %and.i.6.i = and i32 %conv.i.6.i, 15
  %shr.i.6.i = lshr i32 %conv.i.6.i, 4
  %arrayidx2.i141.6.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_inv_sub_byte_value, i32 0, i32 %shr.i.6.i, i32 %and.i.6.i
  %113 = load i8, i8* %arrayidx2.i141.6.i, align 1, !tbaa !6
  store i8 %113, i8* %arrayidx.6.i, align 1, !tbaa !6
  %conv.i.7.i = zext i8 %95 to i32
  %and.i.7.i = and i32 %conv.i.7.i, 15
  %shr.i.7.i = lshr i32 %conv.i.7.i, 4
  %arrayidx2.i141.7.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_inv_sub_byte_value, i32 0, i32 %shr.i.7.i, i32 %and.i.7.i
  %114 = load i8, i8* %arrayidx2.i141.7.i, align 1, !tbaa !6
  store i8 %114, i8* %arrayidx.7.i, align 1, !tbaa !6
  %conv.i.8.i = zext i8 %92 to i32
  %and.i.8.i = and i32 %conv.i.8.i, 15
  %shr.i.8.i = lshr i32 %conv.i.8.i, 4
  %arrayidx2.i141.8.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_inv_sub_byte_value, i32 0, i32 %shr.i.8.i, i32 %and.i.8.i
  %115 = load i8, i8* %arrayidx2.i141.8.i, align 1, !tbaa !6
  store i8 %115, i8* %arrayidx.8.i, align 1, !tbaa !6
  %conv.i.9.i = zext i8 %101 to i32
  %and.i.9.i = and i32 %conv.i.9.i, 15
  %shr.i.9.i = lshr i32 %conv.i.9.i, 4
  %arrayidx2.i141.9.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_inv_sub_byte_value, i32 0, i32 %shr.i.9.i, i32 %and.i.9.i
  %116 = load i8, i8* %arrayidx2.i141.9.i, align 1, !tbaa !6
  store i8 %116, i8* %arrayidx.9.i, align 1, !tbaa !6
  %conv.i.10.i = zext i8 %102 to i32
  %and.i.10.i = and i32 %conv.i.10.i, 15
  %shr.i.10.i = lshr i32 %conv.i.10.i, 4
  %arrayidx2.i141.10.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_inv_sub_byte_value, i32 0, i32 %shr.i.10.i, i32 %and.i.10.i
  %117 = load i8, i8* %arrayidx2.i141.10.i, align 1, !tbaa !6
  store i8 %117, i8* %arrayidx.10.i, align 1, !tbaa !6
  %conv.i.11.i = zext i8 %94 to i32
  %and.i.11.i = and i32 %conv.i.11.i, 15
  %shr.i.11.i = lshr i32 %conv.i.11.i, 4
  %arrayidx2.i141.11.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_inv_sub_byte_value, i32 0, i32 %shr.i.11.i, i32 %and.i.11.i
  %118 = load i8, i8* %arrayidx2.i141.11.i, align 1, !tbaa !6
  store i8 %118, i8* %arrayidx.11.i, align 1, !tbaa !6
  %conv.i.12.i = zext i8 %91 to i32
  %and.i.12.i = and i32 %conv.i.12.i, 15
  %shr.i.12.i = lshr i32 %conv.i.12.i, 4
  %arrayidx2.i141.12.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_inv_sub_byte_value, i32 0, i32 %shr.i.12.i, i32 %and.i.12.i
  %119 = load i8, i8* %arrayidx2.i141.12.i, align 1, !tbaa !6
  store i8 %119, i8* %arrayidx.12.i, align 1, !tbaa !6
  %conv.i.13.i = zext i8 %93 to i32
  %and.i.13.i = and i32 %conv.i.13.i, 15
  %shr.i.13.i = lshr i32 %conv.i.13.i, 4
  %arrayidx2.i141.13.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_inv_sub_byte_value, i32 0, i32 %shr.i.13.i, i32 %and.i.13.i
  %120 = load i8, i8* %arrayidx2.i141.13.i, align 1, !tbaa !6
  store i8 %120, i8* %arrayidx.13.i, align 1, !tbaa !6
  %conv.i.14.i = zext i8 %103 to i32
  %and.i.14.i = and i32 %conv.i.14.i, 15
  %shr.i.14.i = lshr i32 %conv.i.14.i, 4
  %arrayidx2.i141.14.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_inv_sub_byte_value, i32 0, i32 %shr.i.14.i, i32 %and.i.14.i
  %121 = load i8, i8* %arrayidx2.i141.14.i, align 1, !tbaa !6
  store i8 %121, i8* %arrayidx.14.i, align 1, !tbaa !6
  %conv.i.15.i = zext i8 %104 to i32
  %and.i.15.i = and i32 %conv.i.15.i, 15
  %shr.i.15.i = lshr i32 %conv.i.15.i, 4
  %arrayidx2.i141.15.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_inv_sub_byte_value, i32 0, i32 %shr.i.15.i, i32 %and.i.15.i
  %122 = load i8, i8* %arrayidx2.i141.15.i, align 1, !tbaa !6
  store i8 %122, i8* %arrayidx.15.i, align 1, !tbaa !6
  br i1 %cmp22.i, label %oaes_inv_sub_byte.exit.preheader.i, label %oaes_inv_sub_byte.exit284.preheader.i

oaes_inv_sub_byte.exit284.preheader.i:            ; preds = %oaes_inv_shift_rows.exit.i
  %mul42.i = shl i32 %_i.1.i, 4
  %123 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data40.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %123, i32 0, i32 3
  %124 = load i8*, i8** %exp_data40.i, align 4, !tbaa !14
  %arrayidx44.i = getelementptr inbounds i8, i8* %124, i32 %mul42.i
  %125 = load i8, i8* %arrayidx44.i, align 1, !tbaa !6
  %xor46138.i = xor i8 %125, %106
  store i8 %xor46138.i, i8* %add.ptr64, align 1, !tbaa !6
  %126 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data40.1.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %126, i32 0, i32 3
  %127 = load i8*, i8** %exp_data40.1.i, align 4, !tbaa !14
  %add43.1.i = or i32 %mul42.i, 1
  %arrayidx44.1.i = getelementptr inbounds i8, i8* %127, i32 %add43.1.i
  %128 = load i8, i8* %arrayidx44.1.i, align 1, !tbaa !6
  %xor46138.1.i = xor i8 %128, %107
  store i8 %xor46138.1.i, i8* %arrayidx.1.i, align 1, !tbaa !6
  %129 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data40.2.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %129, i32 0, i32 3
  %130 = load i8*, i8** %exp_data40.2.i, align 4, !tbaa !14
  %add43.2.i = or i32 %mul42.i, 2
  %arrayidx44.2.i = getelementptr inbounds i8, i8* %130, i32 %add43.2.i
  %131 = load i8, i8* %arrayidx44.2.i, align 1, !tbaa !6
  %xor46138.2.i = xor i8 %131, %108
  store i8 %xor46138.2.i, i8* %arrayidx.2.i, align 1, !tbaa !6
  %132 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data40.3.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %132, i32 0, i32 3
  %133 = load i8*, i8** %exp_data40.3.i, align 4, !tbaa !14
  %add43.3.i = or i32 %mul42.i, 3
  %arrayidx44.3.i = getelementptr inbounds i8, i8* %133, i32 %add43.3.i
  %134 = load i8, i8* %arrayidx44.3.i, align 1, !tbaa !6
  %xor46138.3.i = xor i8 %134, %109
  store i8 %xor46138.3.i, i8* %arrayidx.3.i, align 1, !tbaa !6
  %135 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data40.4.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %135, i32 0, i32 3
  %136 = load i8*, i8** %exp_data40.4.i, align 4, !tbaa !14
  %add43.4.i = or i32 %mul42.i, 4
  %arrayidx44.4.i = getelementptr inbounds i8, i8* %136, i32 %add43.4.i
  %137 = load i8, i8* %arrayidx44.4.i, align 1, !tbaa !6
  %xor46138.4.i = xor i8 %137, %111
  store i8 %xor46138.4.i, i8* %arrayidx.4.i, align 1, !tbaa !6
  %138 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data40.5.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %138, i32 0, i32 3
  %139 = load i8*, i8** %exp_data40.5.i, align 4, !tbaa !14
  %add43.5.i = or i32 %mul42.i, 5
  %arrayidx44.5.i = getelementptr inbounds i8, i8* %139, i32 %add43.5.i
  %140 = load i8, i8* %arrayidx44.5.i, align 1, !tbaa !6
  %xor46138.5.i = xor i8 %140, %112
  store i8 %xor46138.5.i, i8* %arrayidx.5.i, align 1, !tbaa !6
  %141 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data40.6.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %141, i32 0, i32 3
  %142 = load i8*, i8** %exp_data40.6.i, align 4, !tbaa !14
  %add43.6.i = or i32 %mul42.i, 6
  %arrayidx44.6.i = getelementptr inbounds i8, i8* %142, i32 %add43.6.i
  %143 = load i8, i8* %arrayidx44.6.i, align 1, !tbaa !6
  %xor46138.6.i = xor i8 %143, %113
  store i8 %xor46138.6.i, i8* %arrayidx.6.i, align 1, !tbaa !6
  %144 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data40.7.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %144, i32 0, i32 3
  %145 = load i8*, i8** %exp_data40.7.i, align 4, !tbaa !14
  %add43.7.i = or i32 %mul42.i, 7
  %arrayidx44.7.i = getelementptr inbounds i8, i8* %145, i32 %add43.7.i
  %146 = load i8, i8* %arrayidx44.7.i, align 1, !tbaa !6
  %xor46138.7.i = xor i8 %146, %114
  store i8 %xor46138.7.i, i8* %arrayidx.7.i, align 1, !tbaa !6
  %147 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data40.8.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %147, i32 0, i32 3
  %148 = load i8*, i8** %exp_data40.8.i, align 4, !tbaa !14
  %add43.8.i = or i32 %mul42.i, 8
  %arrayidx44.8.i = getelementptr inbounds i8, i8* %148, i32 %add43.8.i
  %149 = load i8, i8* %arrayidx44.8.i, align 1, !tbaa !6
  %xor46138.8.i = xor i8 %149, %115
  store i8 %xor46138.8.i, i8* %arrayidx.8.i, align 1, !tbaa !6
  %150 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data40.9.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %150, i32 0, i32 3
  %151 = load i8*, i8** %exp_data40.9.i, align 4, !tbaa !14
  %add43.9.i = or i32 %mul42.i, 9
  %arrayidx44.9.i = getelementptr inbounds i8, i8* %151, i32 %add43.9.i
  %152 = load i8, i8* %arrayidx44.9.i, align 1, !tbaa !6
  %xor46138.9.i = xor i8 %152, %116
  store i8 %xor46138.9.i, i8* %arrayidx.9.i, align 1, !tbaa !6
  %153 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data40.10.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %153, i32 0, i32 3
  %154 = load i8*, i8** %exp_data40.10.i, align 4, !tbaa !14
  %add43.10.i = or i32 %mul42.i, 10
  %arrayidx44.10.i = getelementptr inbounds i8, i8* %154, i32 %add43.10.i
  %155 = load i8, i8* %arrayidx44.10.i, align 1, !tbaa !6
  %xor46138.10.i = xor i8 %155, %117
  store i8 %xor46138.10.i, i8* %arrayidx.10.i, align 1, !tbaa !6
  %156 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data40.11.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %156, i32 0, i32 3
  %157 = load i8*, i8** %exp_data40.11.i, align 4, !tbaa !14
  %add43.11.i = or i32 %mul42.i, 11
  %arrayidx44.11.i = getelementptr inbounds i8, i8* %157, i32 %add43.11.i
  %158 = load i8, i8* %arrayidx44.11.i, align 1, !tbaa !6
  %xor46138.11.i = xor i8 %158, %118
  store i8 %xor46138.11.i, i8* %arrayidx.11.i, align 1, !tbaa !6
  %159 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data40.12.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %159, i32 0, i32 3
  %160 = load i8*, i8** %exp_data40.12.i, align 4, !tbaa !14
  %add43.12.i = or i32 %mul42.i, 12
  %arrayidx44.12.i = getelementptr inbounds i8, i8* %160, i32 %add43.12.i
  %161 = load i8, i8* %arrayidx44.12.i, align 1, !tbaa !6
  %xor46138.12.i = xor i8 %161, %119
  store i8 %xor46138.12.i, i8* %arrayidx.12.i, align 1, !tbaa !6
  %162 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data40.13.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %162, i32 0, i32 3
  %163 = load i8*, i8** %exp_data40.13.i, align 4, !tbaa !14
  %add43.13.i = or i32 %mul42.i, 13
  %arrayidx44.13.i = getelementptr inbounds i8, i8* %163, i32 %add43.13.i
  %164 = load i8, i8* %arrayidx44.13.i, align 1, !tbaa !6
  %xor46138.13.i = xor i8 %164, %120
  store i8 %xor46138.13.i, i8* %arrayidx.13.i, align 1, !tbaa !6
  %165 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data40.14.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %165, i32 0, i32 3
  %166 = load i8*, i8** %exp_data40.14.i, align 4, !tbaa !14
  %add43.14.i = or i32 %mul42.i, 14
  %arrayidx44.14.i = getelementptr inbounds i8, i8* %166, i32 %add43.14.i
  %167 = load i8, i8* %arrayidx44.14.i, align 1, !tbaa !6
  %xor46138.14.i = xor i8 %167, %121
  store i8 %xor46138.14.i, i8* %arrayidx.14.i, align 1, !tbaa !6
  %168 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data40.15.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %168, i32 0, i32 3
  %169 = load i8*, i8** %exp_data40.15.i, align 4, !tbaa !14
  %add43.15.i = or i32 %mul42.i, 15
  %arrayidx44.15.i = getelementptr inbounds i8, i8* %169, i32 %add43.15.i
  %170 = load i8, i8* %arrayidx44.15.i, align 1, !tbaa !6
  %xor46138.15.i = xor i8 %170, %122
  store i8 %xor46138.15.i, i8* %arrayidx.15.i, align 1, !tbaa !6
  %conv.i.i234.i = zext i8 %xor46138.i to i32
  %shr.i.i235.i = lshr i32 %conv.i.i234.i, 4
  %and1.i.i236.i = and i32 %conv.i.i234.i, 15
  %arrayidx18.i.i237.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_e, i32 0, i32 %shr.i.i235.i, i32 %and1.i.i236.i
  %171 = load i8, i8* %arrayidx18.i.i237.i, align 1, !tbaa !6
  %conv.i66.i239.i = zext i8 %xor46138.1.i to i32
  %shr.i67.i240.i = lshr i32 %conv.i66.i239.i, 4
  %and1.i68.i241.i = and i32 %conv.i66.i239.i, 15
  %arrayidx12.i69.i242.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_b, i32 0, i32 %shr.i67.i240.i, i32 %and1.i68.i241.i
  %172 = load i8, i8* %arrayidx12.i69.i242.i, align 1, !tbaa !6
  %xor1.i243.i = xor i8 %172, %171
  %conv.i62.i245.i = zext i8 %xor46138.2.i to i32
  %shr.i63.i246.i = lshr i32 %conv.i62.i245.i, 4
  %and1.i64.i247.i = and i32 %conv.i62.i245.i, 15
  %arrayidx15.i65.i248.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_d, i32 0, i32 %shr.i63.i246.i, i32 %and1.i64.i247.i
  %173 = load i8, i8* %arrayidx15.i65.i248.i, align 1, !tbaa !6
  %xor72.i249.i = xor i8 %xor1.i243.i, %173
  %conv.i58.i251.i = zext i8 %xor46138.3.i to i32
  %shr.i59.i252.i = lshr i32 %conv.i58.i251.i, 4
  %and1.i60.i253.i = and i32 %conv.i58.i251.i, 15
  %arrayidx9.i61.i254.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_9, i32 0, i32 %shr.i59.i252.i, i32 %and1.i60.i253.i
  %174 = load i8, i8* %arrayidx9.i61.i254.i, align 1, !tbaa !6
  %xor113.i255.i = xor i8 %xor72.i249.i, %174
  %arrayidx9.i57.i256.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_9, i32 0, i32 %shr.i.i235.i, i32 %and1.i.i236.i
  %175 = load i8, i8* %arrayidx9.i57.i256.i, align 1, !tbaa !6
  %arrayidx18.i53.i257.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_e, i32 0, i32 %shr.i67.i240.i, i32 %and1.i68.i241.i
  %176 = load i8, i8* %arrayidx18.i53.i257.i, align 1, !tbaa !6
  %xor204.i258.i = xor i8 %176, %175
  %arrayidx12.i49.i259.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_b, i32 0, i32 %shr.i63.i246.i, i32 %and1.i64.i247.i
  %177 = load i8, i8* %arrayidx12.i49.i259.i, align 1, !tbaa !6
  %xor245.i260.i = xor i8 %xor204.i258.i, %177
  %arrayidx15.i45.i261.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_d, i32 0, i32 %shr.i59.i252.i, i32 %and1.i60.i253.i
  %178 = load i8, i8* %arrayidx15.i45.i261.i, align 1, !tbaa !6
  %xor286.i262.i = xor i8 %xor245.i260.i, %178
  %arrayidx15.i41.i263.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_d, i32 0, i32 %shr.i.i235.i, i32 %and1.i.i236.i
  %179 = load i8, i8* %arrayidx15.i41.i263.i, align 1, !tbaa !6
  %arrayidx9.i37.i264.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_9, i32 0, i32 %shr.i67.i240.i, i32 %and1.i68.i241.i
  %180 = load i8, i8* %arrayidx9.i37.i264.i, align 1, !tbaa !6
  %xor377.i265.i = xor i8 %180, %179
  %arrayidx18.i33.i266.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_e, i32 0, i32 %shr.i63.i246.i, i32 %and1.i64.i247.i
  %181 = load i8, i8* %arrayidx18.i33.i266.i, align 1, !tbaa !6
  %xor418.i267.i = xor i8 %xor377.i265.i, %181
  %arrayidx12.i29.i268.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_b, i32 0, i32 %shr.i59.i252.i, i32 %and1.i60.i253.i
  %182 = load i8, i8* %arrayidx12.i29.i268.i, align 1, !tbaa !6
  %xor459.i269.i = xor i8 %xor418.i267.i, %182
  %arrayidx12.i.i270.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_b, i32 0, i32 %shr.i.i235.i, i32 %and1.i.i236.i
  %183 = load i8, i8* %arrayidx12.i.i270.i, align 1, !tbaa !6
  %arrayidx15.i.i271.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_d, i32 0, i32 %shr.i67.i240.i, i32 %and1.i68.i241.i
  %184 = load i8, i8* %arrayidx15.i.i271.i, align 1, !tbaa !6
  %xor5410.i272.i = xor i8 %184, %183
  %arrayidx9.i.i273.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_9, i32 0, i32 %shr.i63.i246.i, i32 %and1.i64.i247.i
  %185 = load i8, i8* %arrayidx9.i.i273.i, align 1, !tbaa !6
  %xor5811.i274.i = xor i8 %xor5410.i272.i, %185
  %arrayidx18.i16.i275.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_e, i32 0, i32 %shr.i59.i252.i, i32 %and1.i60.i253.i
  %186 = load i8, i8* %arrayidx18.i16.i275.i, align 1, !tbaa !6
  %xor6212.i276.i = xor i8 %xor5811.i274.i, %186
  store i8 %xor113.i255.i, i8* %add.ptr64, align 1
  store i8 %xor286.i262.i, i8* %arrayidx.1.i, align 1
  store i8 %xor459.i269.i, i8* %arrayidx.2.i, align 1
  store i8 %xor6212.i276.i, i8* %arrayidx.3.i, align 1
  %conv.i.i189.i = zext i8 %xor46138.4.i to i32
  %shr.i.i190.i = lshr i32 %conv.i.i189.i, 4
  %and1.i.i191.i = and i32 %conv.i.i189.i, 15
  %arrayidx18.i.i192.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_e, i32 0, i32 %shr.i.i190.i, i32 %and1.i.i191.i
  %187 = load i8, i8* %arrayidx18.i.i192.i, align 1, !tbaa !6
  %conv.i66.i194.i = zext i8 %xor46138.5.i to i32
  %shr.i67.i195.i = lshr i32 %conv.i66.i194.i, 4
  %and1.i68.i196.i = and i32 %conv.i66.i194.i, 15
  %arrayidx12.i69.i197.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_b, i32 0, i32 %shr.i67.i195.i, i32 %and1.i68.i196.i
  %188 = load i8, i8* %arrayidx12.i69.i197.i, align 1, !tbaa !6
  %xor1.i198.i = xor i8 %188, %187
  %conv.i62.i200.i = zext i8 %xor46138.6.i to i32
  %shr.i63.i201.i = lshr i32 %conv.i62.i200.i, 4
  %and1.i64.i202.i = and i32 %conv.i62.i200.i, 15
  %arrayidx15.i65.i203.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_d, i32 0, i32 %shr.i63.i201.i, i32 %and1.i64.i202.i
  %189 = load i8, i8* %arrayidx15.i65.i203.i, align 1, !tbaa !6
  %xor72.i204.i = xor i8 %xor1.i198.i, %189
  %conv.i58.i206.i = zext i8 %xor46138.7.i to i32
  %shr.i59.i207.i = lshr i32 %conv.i58.i206.i, 4
  %and1.i60.i208.i = and i32 %conv.i58.i206.i, 15
  %arrayidx9.i61.i209.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_9, i32 0, i32 %shr.i59.i207.i, i32 %and1.i60.i208.i
  %190 = load i8, i8* %arrayidx9.i61.i209.i, align 1, !tbaa !6
  %xor113.i210.i = xor i8 %xor72.i204.i, %190
  %arrayidx9.i57.i211.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_9, i32 0, i32 %shr.i.i190.i, i32 %and1.i.i191.i
  %191 = load i8, i8* %arrayidx9.i57.i211.i, align 1, !tbaa !6
  %arrayidx18.i53.i212.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_e, i32 0, i32 %shr.i67.i195.i, i32 %and1.i68.i196.i
  %192 = load i8, i8* %arrayidx18.i53.i212.i, align 1, !tbaa !6
  %xor204.i213.i = xor i8 %192, %191
  %arrayidx12.i49.i214.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_b, i32 0, i32 %shr.i63.i201.i, i32 %and1.i64.i202.i
  %193 = load i8, i8* %arrayidx12.i49.i214.i, align 1, !tbaa !6
  %xor245.i215.i = xor i8 %xor204.i213.i, %193
  %arrayidx15.i45.i216.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_d, i32 0, i32 %shr.i59.i207.i, i32 %and1.i60.i208.i
  %194 = load i8, i8* %arrayidx15.i45.i216.i, align 1, !tbaa !6
  %xor286.i217.i = xor i8 %xor245.i215.i, %194
  %arrayidx15.i41.i218.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_d, i32 0, i32 %shr.i.i190.i, i32 %and1.i.i191.i
  %195 = load i8, i8* %arrayidx15.i41.i218.i, align 1, !tbaa !6
  %arrayidx9.i37.i219.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_9, i32 0, i32 %shr.i67.i195.i, i32 %and1.i68.i196.i
  %196 = load i8, i8* %arrayidx9.i37.i219.i, align 1, !tbaa !6
  %xor377.i220.i = xor i8 %196, %195
  %arrayidx18.i33.i221.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_e, i32 0, i32 %shr.i63.i201.i, i32 %and1.i64.i202.i
  %197 = load i8, i8* %arrayidx18.i33.i221.i, align 1, !tbaa !6
  %xor418.i222.i = xor i8 %xor377.i220.i, %197
  %arrayidx12.i29.i223.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_b, i32 0, i32 %shr.i59.i207.i, i32 %and1.i60.i208.i
  %198 = load i8, i8* %arrayidx12.i29.i223.i, align 1, !tbaa !6
  %xor459.i224.i = xor i8 %xor418.i222.i, %198
  %arrayidx12.i.i225.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_b, i32 0, i32 %shr.i.i190.i, i32 %and1.i.i191.i
  %199 = load i8, i8* %arrayidx12.i.i225.i, align 1, !tbaa !6
  %arrayidx15.i.i226.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_d, i32 0, i32 %shr.i67.i195.i, i32 %and1.i68.i196.i
  %200 = load i8, i8* %arrayidx15.i.i226.i, align 1, !tbaa !6
  %xor5410.i227.i = xor i8 %200, %199
  %arrayidx9.i.i228.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_9, i32 0, i32 %shr.i63.i201.i, i32 %and1.i64.i202.i
  %201 = load i8, i8* %arrayidx9.i.i228.i, align 1, !tbaa !6
  %xor5811.i229.i = xor i8 %xor5410.i227.i, %201
  %arrayidx18.i16.i230.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_e, i32 0, i32 %shr.i59.i207.i, i32 %and1.i60.i208.i
  %202 = load i8, i8* %arrayidx18.i16.i230.i, align 1, !tbaa !6
  %xor6212.i231.i = xor i8 %xor5811.i229.i, %202
  store i8 %xor113.i210.i, i8* %arrayidx.4.i, align 1
  store i8 %xor286.i217.i, i8* %arrayidx.5.i, align 1
  store i8 %xor459.i224.i, i8* %arrayidx.6.i, align 1
  store i8 %xor6212.i231.i, i8* %arrayidx.7.i, align 1
  %conv.i.i145.i = zext i8 %xor46138.8.i to i32
  %shr.i.i146.i = lshr i32 %conv.i.i145.i, 4
  %and1.i.i147.i = and i32 %conv.i.i145.i, 15
  %arrayidx18.i.i148.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_e, i32 0, i32 %shr.i.i146.i, i32 %and1.i.i147.i
  %203 = load i8, i8* %arrayidx18.i.i148.i, align 1, !tbaa !6
  %conv.i66.i150.i = zext i8 %xor46138.9.i to i32
  %shr.i67.i151.i = lshr i32 %conv.i66.i150.i, 4
  %and1.i68.i152.i = and i32 %conv.i66.i150.i, 15
  %arrayidx12.i69.i153.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_b, i32 0, i32 %shr.i67.i151.i, i32 %and1.i68.i152.i
  %204 = load i8, i8* %arrayidx12.i69.i153.i, align 1, !tbaa !6
  %xor1.i154.i = xor i8 %204, %203
  %conv.i62.i156.i = zext i8 %xor46138.10.i to i32
  %shr.i63.i157.i = lshr i32 %conv.i62.i156.i, 4
  %and1.i64.i158.i = and i32 %conv.i62.i156.i, 15
  %arrayidx15.i65.i159.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_d, i32 0, i32 %shr.i63.i157.i, i32 %and1.i64.i158.i
  %205 = load i8, i8* %arrayidx15.i65.i159.i, align 1, !tbaa !6
  %xor72.i160.i = xor i8 %xor1.i154.i, %205
  %conv.i58.i162.i = zext i8 %xor46138.11.i to i32
  %shr.i59.i163.i = lshr i32 %conv.i58.i162.i, 4
  %and1.i60.i164.i = and i32 %conv.i58.i162.i, 15
  %arrayidx9.i61.i165.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_9, i32 0, i32 %shr.i59.i163.i, i32 %and1.i60.i164.i
  %206 = load i8, i8* %arrayidx9.i61.i165.i, align 1, !tbaa !6
  %xor113.i166.i = xor i8 %xor72.i160.i, %206
  %arrayidx9.i57.i167.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_9, i32 0, i32 %shr.i.i146.i, i32 %and1.i.i147.i
  %207 = load i8, i8* %arrayidx9.i57.i167.i, align 1, !tbaa !6
  %arrayidx18.i53.i168.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_e, i32 0, i32 %shr.i67.i151.i, i32 %and1.i68.i152.i
  %208 = load i8, i8* %arrayidx18.i53.i168.i, align 1, !tbaa !6
  %xor204.i169.i = xor i8 %208, %207
  %arrayidx12.i49.i170.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_b, i32 0, i32 %shr.i63.i157.i, i32 %and1.i64.i158.i
  %209 = load i8, i8* %arrayidx12.i49.i170.i, align 1, !tbaa !6
  %xor245.i171.i = xor i8 %xor204.i169.i, %209
  %arrayidx15.i45.i172.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_d, i32 0, i32 %shr.i59.i163.i, i32 %and1.i60.i164.i
  %210 = load i8, i8* %arrayidx15.i45.i172.i, align 1, !tbaa !6
  %xor286.i173.i = xor i8 %xor245.i171.i, %210
  %arrayidx15.i41.i174.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_d, i32 0, i32 %shr.i.i146.i, i32 %and1.i.i147.i
  %211 = load i8, i8* %arrayidx15.i41.i174.i, align 1, !tbaa !6
  %arrayidx9.i37.i175.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_9, i32 0, i32 %shr.i67.i151.i, i32 %and1.i68.i152.i
  %212 = load i8, i8* %arrayidx9.i37.i175.i, align 1, !tbaa !6
  %xor377.i176.i = xor i8 %212, %211
  %arrayidx18.i33.i177.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_e, i32 0, i32 %shr.i63.i157.i, i32 %and1.i64.i158.i
  %213 = load i8, i8* %arrayidx18.i33.i177.i, align 1, !tbaa !6
  %xor418.i178.i = xor i8 %xor377.i176.i, %213
  %arrayidx12.i29.i179.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_b, i32 0, i32 %shr.i59.i163.i, i32 %and1.i60.i164.i
  %214 = load i8, i8* %arrayidx12.i29.i179.i, align 1, !tbaa !6
  %xor459.i180.i = xor i8 %xor418.i178.i, %214
  %arrayidx12.i.i181.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_b, i32 0, i32 %shr.i.i146.i, i32 %and1.i.i147.i
  %215 = load i8, i8* %arrayidx12.i.i181.i, align 1, !tbaa !6
  %arrayidx15.i.i182.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_d, i32 0, i32 %shr.i67.i151.i, i32 %and1.i68.i152.i
  %216 = load i8, i8* %arrayidx15.i.i182.i, align 1, !tbaa !6
  %xor5410.i183.i = xor i8 %216, %215
  %arrayidx9.i.i184.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_9, i32 0, i32 %shr.i63.i157.i, i32 %and1.i64.i158.i
  %217 = load i8, i8* %arrayidx9.i.i184.i, align 1, !tbaa !6
  %xor5811.i185.i = xor i8 %xor5410.i183.i, %217
  %arrayidx18.i16.i186.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_e, i32 0, i32 %shr.i59.i163.i, i32 %and1.i60.i164.i
  %218 = load i8, i8* %arrayidx18.i16.i186.i, align 1, !tbaa !6
  %xor6212.i187.i = xor i8 %xor5811.i185.i, %218
  store i8 %xor113.i166.i, i8* %arrayidx.8.i, align 1
  store i8 %xor286.i173.i, i8* %arrayidx.9.i, align 1
  store i8 %xor459.i180.i, i8* %arrayidx.10.i, align 1
  store i8 %xor6212.i187.i, i8* %arrayidx.11.i, align 1
  %conv.i.i.i = zext i8 %xor46138.12.i to i32
  %shr.i.i.i = lshr i32 %conv.i.i.i, 4
  %and1.i.i.i = and i32 %conv.i.i.i, 15
  %arrayidx18.i.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_e, i32 0, i32 %shr.i.i.i, i32 %and1.i.i.i
  %219 = load i8, i8* %arrayidx18.i.i.i, align 1, !tbaa !6
  %conv.i66.i.i = zext i8 %xor46138.13.i to i32
  %shr.i67.i.i = lshr i32 %conv.i66.i.i, 4
  %and1.i68.i.i = and i32 %conv.i66.i.i, 15
  %arrayidx12.i69.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_b, i32 0, i32 %shr.i67.i.i, i32 %and1.i68.i.i
  %220 = load i8, i8* %arrayidx12.i69.i.i, align 1, !tbaa !6
  %xor1.i.i = xor i8 %220, %219
  %conv.i62.i.i = zext i8 %xor46138.14.i to i32
  %shr.i63.i.i = lshr i32 %conv.i62.i.i, 4
  %and1.i64.i.i = and i32 %conv.i62.i.i, 15
  %arrayidx15.i65.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_d, i32 0, i32 %shr.i63.i.i, i32 %and1.i64.i.i
  %221 = load i8, i8* %arrayidx15.i65.i.i, align 1, !tbaa !6
  %xor72.i.i = xor i8 %xor1.i.i, %221
  %conv.i58.i.i = zext i8 %xor46138.15.i to i32
  %shr.i59.i.i = lshr i32 %conv.i58.i.i, 4
  %and1.i60.i.i = and i32 %conv.i58.i.i, 15
  %arrayidx9.i61.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_9, i32 0, i32 %shr.i59.i.i, i32 %and1.i60.i.i
  %222 = load i8, i8* %arrayidx9.i61.i.i, align 1, !tbaa !6
  %xor113.i.i = xor i8 %xor72.i.i, %222
  %arrayidx9.i57.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_9, i32 0, i32 %shr.i.i.i, i32 %and1.i.i.i
  %223 = load i8, i8* %arrayidx9.i57.i.i, align 1, !tbaa !6
  %arrayidx18.i53.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_e, i32 0, i32 %shr.i67.i.i, i32 %and1.i68.i.i
  %224 = load i8, i8* %arrayidx18.i53.i.i, align 1, !tbaa !6
  %xor204.i.i = xor i8 %224, %223
  %arrayidx12.i49.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_b, i32 0, i32 %shr.i63.i.i, i32 %and1.i64.i.i
  %225 = load i8, i8* %arrayidx12.i49.i.i, align 1, !tbaa !6
  %xor245.i.i = xor i8 %xor204.i.i, %225
  %arrayidx15.i45.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_d, i32 0, i32 %shr.i59.i.i, i32 %and1.i60.i.i
  %226 = load i8, i8* %arrayidx15.i45.i.i, align 1, !tbaa !6
  %xor286.i.i = xor i8 %xor245.i.i, %226
  %arrayidx15.i41.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_d, i32 0, i32 %shr.i.i.i, i32 %and1.i.i.i
  %227 = load i8, i8* %arrayidx15.i41.i.i, align 1, !tbaa !6
  %arrayidx9.i37.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_9, i32 0, i32 %shr.i67.i.i, i32 %and1.i68.i.i
  %228 = load i8, i8* %arrayidx9.i37.i.i, align 1, !tbaa !6
  %xor377.i.i = xor i8 %228, %227
  %arrayidx18.i33.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_e, i32 0, i32 %shr.i63.i.i, i32 %and1.i64.i.i
  %229 = load i8, i8* %arrayidx18.i33.i.i, align 1, !tbaa !6
  %xor418.i.i = xor i8 %xor377.i.i, %229
  %arrayidx12.i29.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_b, i32 0, i32 %shr.i59.i.i, i32 %and1.i60.i.i
  %230 = load i8, i8* %arrayidx12.i29.i.i, align 1, !tbaa !6
  %xor459.i.i = xor i8 %xor418.i.i, %230
  %arrayidx12.i.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_b, i32 0, i32 %shr.i.i.i, i32 %and1.i.i.i
  %231 = load i8, i8* %arrayidx12.i.i.i, align 1, !tbaa !6
  %arrayidx15.i.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_d, i32 0, i32 %shr.i67.i.i, i32 %and1.i68.i.i
  %232 = load i8, i8* %arrayidx15.i.i.i, align 1, !tbaa !6
  %xor5410.i.i = xor i8 %232, %231
  %arrayidx9.i.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_9, i32 0, i32 %shr.i63.i.i, i32 %and1.i64.i.i
  %233 = load i8, i8* %arrayidx9.i.i.i, align 1, !tbaa !6
  %xor5811.i.i = xor i8 %xor5410.i.i, %233
  %arrayidx18.i16.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_e, i32 0, i32 %shr.i59.i.i, i32 %and1.i60.i.i
  %234 = load i8, i8* %arrayidx18.i16.i.i, align 1, !tbaa !6
  %xor6212.i.i = xor i8 %xor5811.i.i, %234
  store i8 %xor113.i.i, i8* %arrayidx.12.i, align 1
  store i8 %xor286.i.i, i8* %arrayidx.13.i, align 1
  store i8 %xor459.i.i, i8* %arrayidx.14.i, align 1
  store i8 %xor6212.i.i, i8* %arrayidx.15.i, align 1
  %dec.i = add i32 %_i.1.i, -1
  br label %oaes_inv_shift_rows.exit.i

oaes_inv_sub_byte.exit.preheader.i:               ; preds = %oaes_inv_shift_rows.exit.i
  %235 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data78.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %235, i32 0, i32 3
  %236 = load i8*, i8** %exp_data78.i, align 4, !tbaa !14
  %237 = load i8, i8* %236, align 1, !tbaa !6
  %xor81137.i = xor i8 %237, %106
  store i8 %xor81137.i, i8* %add.ptr64, align 1, !tbaa !6
  %238 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data78.1.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %238, i32 0, i32 3
  %239 = load i8*, i8** %exp_data78.1.i, align 4, !tbaa !14
  %arrayidx79.1.i = getelementptr inbounds i8, i8* %239, i32 1
  %240 = load i8, i8* %arrayidx79.1.i, align 1, !tbaa !6
  %xor81137.1.i = xor i8 %240, %107
  store i8 %xor81137.1.i, i8* %arrayidx.1.i, align 1, !tbaa !6
  %241 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data78.2.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %241, i32 0, i32 3
  %242 = load i8*, i8** %exp_data78.2.i, align 4, !tbaa !14
  %arrayidx79.2.i = getelementptr inbounds i8, i8* %242, i32 2
  %243 = load i8, i8* %arrayidx79.2.i, align 1, !tbaa !6
  %xor81137.2.i = xor i8 %243, %108
  store i8 %xor81137.2.i, i8* %arrayidx.2.i, align 1, !tbaa !6
  %244 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data78.3.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %244, i32 0, i32 3
  %245 = load i8*, i8** %exp_data78.3.i, align 4, !tbaa !14
  %arrayidx79.3.i = getelementptr inbounds i8, i8* %245, i32 3
  %246 = load i8, i8* %arrayidx79.3.i, align 1, !tbaa !6
  %xor81137.3.i = xor i8 %246, %109
  store i8 %xor81137.3.i, i8* %arrayidx.3.i, align 1, !tbaa !6
  %247 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data78.4.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %247, i32 0, i32 3
  %248 = load i8*, i8** %exp_data78.4.i, align 4, !tbaa !14
  %arrayidx79.4.i = getelementptr inbounds i8, i8* %248, i32 4
  %249 = load i8, i8* %arrayidx79.4.i, align 1, !tbaa !6
  %xor81137.4.i = xor i8 %249, %111
  store i8 %xor81137.4.i, i8* %arrayidx.4.i, align 1, !tbaa !6
  %250 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data78.5.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %250, i32 0, i32 3
  %251 = load i8*, i8** %exp_data78.5.i, align 4, !tbaa !14
  %arrayidx79.5.i = getelementptr inbounds i8, i8* %251, i32 5
  %252 = load i8, i8* %arrayidx79.5.i, align 1, !tbaa !6
  %xor81137.5.i = xor i8 %252, %112
  store i8 %xor81137.5.i, i8* %arrayidx.5.i, align 1, !tbaa !6
  %253 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data78.6.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %253, i32 0, i32 3
  %254 = load i8*, i8** %exp_data78.6.i, align 4, !tbaa !14
  %arrayidx79.6.i = getelementptr inbounds i8, i8* %254, i32 6
  %255 = load i8, i8* %arrayidx79.6.i, align 1, !tbaa !6
  %xor81137.6.i = xor i8 %255, %113
  store i8 %xor81137.6.i, i8* %arrayidx.6.i, align 1, !tbaa !6
  %256 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data78.7.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %256, i32 0, i32 3
  %257 = load i8*, i8** %exp_data78.7.i, align 4, !tbaa !14
  %arrayidx79.7.i = getelementptr inbounds i8, i8* %257, i32 7
  %258 = load i8, i8* %arrayidx79.7.i, align 1, !tbaa !6
  %xor81137.7.i = xor i8 %258, %114
  store i8 %xor81137.7.i, i8* %arrayidx.7.i, align 1, !tbaa !6
  %259 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data78.8.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %259, i32 0, i32 3
  %260 = load i8*, i8** %exp_data78.8.i, align 4, !tbaa !14
  %arrayidx79.8.i = getelementptr inbounds i8, i8* %260, i32 8
  %261 = load i8, i8* %arrayidx79.8.i, align 1, !tbaa !6
  %xor81137.8.i = xor i8 %261, %115
  store i8 %xor81137.8.i, i8* %arrayidx.8.i, align 1, !tbaa !6
  %262 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data78.9.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %262, i32 0, i32 3
  %263 = load i8*, i8** %exp_data78.9.i, align 4, !tbaa !14
  %arrayidx79.9.i = getelementptr inbounds i8, i8* %263, i32 9
  %264 = load i8, i8* %arrayidx79.9.i, align 1, !tbaa !6
  %xor81137.9.i = xor i8 %264, %116
  store i8 %xor81137.9.i, i8* %arrayidx.9.i, align 1, !tbaa !6
  %265 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data78.10.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %265, i32 0, i32 3
  %266 = load i8*, i8** %exp_data78.10.i, align 4, !tbaa !14
  %arrayidx79.10.i = getelementptr inbounds i8, i8* %266, i32 10
  %267 = load i8, i8* %arrayidx79.10.i, align 1, !tbaa !6
  %xor81137.10.i = xor i8 %267, %117
  store i8 %xor81137.10.i, i8* %arrayidx.10.i, align 1, !tbaa !6
  %268 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data78.11.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %268, i32 0, i32 3
  %269 = load i8*, i8** %exp_data78.11.i, align 4, !tbaa !14
  %arrayidx79.11.i = getelementptr inbounds i8, i8* %269, i32 11
  %270 = load i8, i8* %arrayidx79.11.i, align 1, !tbaa !6
  %xor81137.11.i = xor i8 %270, %118
  store i8 %xor81137.11.i, i8* %arrayidx.11.i, align 1, !tbaa !6
  %271 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data78.12.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %271, i32 0, i32 3
  %272 = load i8*, i8** %exp_data78.12.i, align 4, !tbaa !14
  %arrayidx79.12.i = getelementptr inbounds i8, i8* %272, i32 12
  %273 = load i8, i8* %arrayidx79.12.i, align 1, !tbaa !6
  %xor81137.12.i = xor i8 %273, %119
  store i8 %xor81137.12.i, i8* %arrayidx.12.i, align 1, !tbaa !6
  %274 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data78.13.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %274, i32 0, i32 3
  %275 = load i8*, i8** %exp_data78.13.i, align 4, !tbaa !14
  %arrayidx79.13.i = getelementptr inbounds i8, i8* %275, i32 13
  %276 = load i8, i8* %arrayidx79.13.i, align 1, !tbaa !6
  %xor81137.13.i = xor i8 %276, %120
  store i8 %xor81137.13.i, i8* %arrayidx.13.i, align 1, !tbaa !6
  %277 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data78.14.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %277, i32 0, i32 3
  %278 = load i8*, i8** %exp_data78.14.i, align 4, !tbaa !14
  %arrayidx79.14.i = getelementptr inbounds i8, i8* %278, i32 14
  %279 = load i8, i8* %arrayidx79.14.i, align 1, !tbaa !6
  %xor81137.14.i = xor i8 %279, %121
  store i8 %xor81137.14.i, i8* %arrayidx.14.i, align 1, !tbaa !6
  %280 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data78.15.i = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %280, i32 0, i32 3
  %281 = load i8*, i8** %exp_data78.15.i, align 4, !tbaa !14
  %arrayidx79.15.i = getelementptr inbounds i8, i8* %281, i32 15
  %282 = load i8, i8* %arrayidx79.15.i, align 1, !tbaa !6
  %xor81137.15.i = xor i8 %282, %122
  store i8 %xor81137.15.i, i8* %arrayidx.15.i, align 1, !tbaa !6
  br label %lor.end

lor.end:                                          ; preds = %oaes_inv_sub_byte.exit.preheader.i, %if.end6.i, %if.end3.i, %if.end62
  %283 = phi i32 [ 1, %if.end62 ], [ 1, %if.end3.i ], [ 1, %if.end6.i ], [ 0, %oaes_inv_sub_byte.exit.preheader.i ]
  br i1 %tobool54, label %for.body78.preheader, label %for.inc87

for.body78.preheader:                             ; preds = %lor.end
  %arrayidx79 = getelementptr inbounds i8, i8* %m, i32 %_i.0231
  %284 = load i8, i8* %arrayidx79, align 1, !tbaa !6
  %285 = load i8, i8* %0, align 16, !tbaa !6
  %xor204 = xor i8 %285, %284
  store i8 %xor204, i8* %arrayidx79, align 1, !tbaa !6
  %add.1 = or i32 %_i.0231, 1
  %arrayidx79.1 = getelementptr inbounds i8, i8* %m, i32 %add.1
  %286 = load i8, i8* %arrayidx79.1, align 1, !tbaa !6
  %287 = load i8, i8* %arrayidx81.1, align 1, !tbaa !6
  %xor204.1 = xor i8 %287, %286
  store i8 %xor204.1, i8* %arrayidx79.1, align 1, !tbaa !6
  %add.2 = or i32 %_i.0231, 2
  %arrayidx79.2 = getelementptr inbounds i8, i8* %m, i32 %add.2
  %288 = load i8, i8* %arrayidx79.2, align 1, !tbaa !6
  %289 = load i8, i8* %arrayidx81.2, align 2, !tbaa !6
  %xor204.2 = xor i8 %289, %288
  store i8 %xor204.2, i8* %arrayidx79.2, align 1, !tbaa !6
  %add.3 = or i32 %_i.0231, 3
  %arrayidx79.3 = getelementptr inbounds i8, i8* %m, i32 %add.3
  %290 = load i8, i8* %arrayidx79.3, align 1, !tbaa !6
  %291 = load i8, i8* %arrayidx81.3, align 1, !tbaa !6
  %xor204.3 = xor i8 %291, %290
  store i8 %xor204.3, i8* %arrayidx79.3, align 1, !tbaa !6
  %add.4 = or i32 %_i.0231, 4
  %arrayidx79.4 = getelementptr inbounds i8, i8* %m, i32 %add.4
  %292 = load i8, i8* %arrayidx79.4, align 1, !tbaa !6
  %293 = load i8, i8* %arrayidx81.4, align 4, !tbaa !6
  %xor204.4 = xor i8 %293, %292
  store i8 %xor204.4, i8* %arrayidx79.4, align 1, !tbaa !6
  %add.5 = or i32 %_i.0231, 5
  %arrayidx79.5 = getelementptr inbounds i8, i8* %m, i32 %add.5
  %294 = load i8, i8* %arrayidx79.5, align 1, !tbaa !6
  %295 = load i8, i8* %arrayidx81.5, align 1, !tbaa !6
  %xor204.5 = xor i8 %295, %294
  store i8 %xor204.5, i8* %arrayidx79.5, align 1, !tbaa !6
  %add.6 = or i32 %_i.0231, 6
  %arrayidx79.6 = getelementptr inbounds i8, i8* %m, i32 %add.6
  %296 = load i8, i8* %arrayidx79.6, align 1, !tbaa !6
  %297 = load i8, i8* %arrayidx81.6, align 2, !tbaa !6
  %xor204.6 = xor i8 %297, %296
  store i8 %xor204.6, i8* %arrayidx79.6, align 1, !tbaa !6
  %add.7 = or i32 %_i.0231, 7
  %arrayidx79.7 = getelementptr inbounds i8, i8* %m, i32 %add.7
  %298 = load i8, i8* %arrayidx79.7, align 1, !tbaa !6
  %299 = load i8, i8* %arrayidx81.7, align 1, !tbaa !6
  %xor204.7 = xor i8 %299, %298
  store i8 %xor204.7, i8* %arrayidx79.7, align 1, !tbaa !6
  %add.8 = or i32 %_i.0231, 8
  %arrayidx79.8 = getelementptr inbounds i8, i8* %m, i32 %add.8
  %300 = load i8, i8* %arrayidx79.8, align 1, !tbaa !6
  %301 = load i8, i8* %arrayidx81.8, align 8, !tbaa !6
  %xor204.8 = xor i8 %301, %300
  store i8 %xor204.8, i8* %arrayidx79.8, align 1, !tbaa !6
  %add.9 = or i32 %_i.0231, 9
  %arrayidx79.9 = getelementptr inbounds i8, i8* %m, i32 %add.9
  %302 = load i8, i8* %arrayidx79.9, align 1, !tbaa !6
  %303 = load i8, i8* %arrayidx81.9, align 1, !tbaa !6
  %xor204.9 = xor i8 %303, %302
  store i8 %xor204.9, i8* %arrayidx79.9, align 1, !tbaa !6
  %add.10 = or i32 %_i.0231, 10
  %arrayidx79.10 = getelementptr inbounds i8, i8* %m, i32 %add.10
  %304 = load i8, i8* %arrayidx79.10, align 1, !tbaa !6
  %305 = load i8, i8* %arrayidx81.10, align 2, !tbaa !6
  %xor204.10 = xor i8 %305, %304
  store i8 %xor204.10, i8* %arrayidx79.10, align 1, !tbaa !6
  %add.11 = or i32 %_i.0231, 11
  %arrayidx79.11 = getelementptr inbounds i8, i8* %m, i32 %add.11
  %306 = load i8, i8* %arrayidx79.11, align 1, !tbaa !6
  %307 = load i8, i8* %arrayidx81.11, align 1, !tbaa !6
  %xor204.11 = xor i8 %307, %306
  store i8 %xor204.11, i8* %arrayidx79.11, align 1, !tbaa !6
  %add.12 = or i32 %_i.0231, 12
  %arrayidx79.12 = getelementptr inbounds i8, i8* %m, i32 %add.12
  %308 = load i8, i8* %arrayidx79.12, align 1, !tbaa !6
  %309 = load i8, i8* %arrayidx81.12, align 4, !tbaa !6
  %xor204.12 = xor i8 %309, %308
  store i8 %xor204.12, i8* %arrayidx79.12, align 1, !tbaa !6
  %add.13 = or i32 %_i.0231, 13
  %arrayidx79.13 = getelementptr inbounds i8, i8* %m, i32 %add.13
  %310 = load i8, i8* %arrayidx79.13, align 1, !tbaa !6
  %311 = load i8, i8* %arrayidx81.13, align 1, !tbaa !6
  %xor204.13 = xor i8 %311, %310
  store i8 %xor204.13, i8* %arrayidx79.13, align 1, !tbaa !6
  %add.14 = or i32 %_i.0231, 14
  %arrayidx79.14 = getelementptr inbounds i8, i8* %m, i32 %add.14
  %312 = load i8, i8* %arrayidx79.14, align 1, !tbaa !6
  %313 = load i8, i8* %arrayidx81.14, align 2, !tbaa !6
  %xor204.14 = xor i8 %313, %312
  store i8 %xor204.14, i8* %arrayidx79.14, align 1, !tbaa !6
  %add.15 = or i32 %_i.0231, 15
  %arrayidx79.15 = getelementptr inbounds i8, i8* %m, i32 %add.15
  %314 = load i8, i8* %arrayidx79.15, align 1, !tbaa !6
  %315 = load i8, i8* %arrayidx81.15, align 1, !tbaa !6
  %xor204.15 = xor i8 %315, %314
  store i8 %xor204.15, i8* %arrayidx79.15, align 1, !tbaa !6
  br label %for.inc87

for.inc87:                                        ; preds = %for.body78.preheader, %lor.end
  %add88 = add i32 %_i.0231, 16
  %316 = load i32, i32* %m_len, align 4, !tbaa !2
  %cmp50 = icmp ugt i32 %316, %add88
  br i1 %cmp50, label %for.body, label %for.end89

for.end89:                                        ; preds = %for.inc87, %if.end47
  %.lcssa224 = phi i32 [ 0, %if.end47 ], [ %316, %for.inc87 ]
  %and91 = and i32 %conv43, 1
  %tobool92 = icmp eq i32 %and91, 0
  br i1 %tobool92, label %cleanup127, label %if.then93

if.then93:                                        ; preds = %for.end89
  %sub94 = add i32 %.lcssa224, -1
  %arrayidx95 = getelementptr inbounds i8, i8* %m, i32 %sub94
  %317 = load i8, i8* %arrayidx95, align 1, !tbaa !6
  %conv96 = zext i8 %317 to i32
  %318 = add i8 %317, -1
  %319 = icmp ugt i8 %318, 14
  br i1 %319, label %cleanup127, label %for.body106

for.body106:                                      ; preds = %if.then93, %for.body106
  %_is_pad.0227 = phi i32 [ %spec.select206, %for.body106 ], [ 1, %if.then93 ]
  %_i.1226 = phi i32 [ %inc117, %for.body106 ], [ 0, %if.then93 ]
  %320 = xor i32 %_i.1226, -1
  %sub108 = add i32 %.lcssa224, %320
  %arrayidx109 = getelementptr inbounds i8, i8* %m, i32 %sub108
  %321 = load i8, i8* %arrayidx109, align 1, !tbaa !6
  %conv110 = zext i8 %321 to i32
  %sub111 = sub nsw i32 %conv96, %_i.1226
  %cmp112 = icmp eq i32 %sub111, %conv110
  %spec.select206 = select i1 %cmp112, i32 %_is_pad.0227, i32 0
  %inc117 = add nuw nsw i32 %_i.1226, 1
  %exitcond = icmp eq i32 %inc117, %conv96
  br i1 %exitcond, label %for.end118, label %for.body106

for.end118:                                       ; preds = %for.body106
  %phitmp = icmp eq i32 %spec.select206, 0
  br i1 %phitmp, label %cleanup127, label %if.then120

if.then120:                                       ; preds = %for.end118
  %add.ptr121 = getelementptr inbounds i8, i8* %m, i32 %.lcssa224
  %idx.neg = sub nsw i32 0, %conv96
  %add.ptr122 = getelementptr inbounds i8, i8* %add.ptr121, i32 %idx.neg
  tail call void @llvm.memset.p0i8.i32(i8* nonnull align 1 %add.ptr122, i8 0, i32 %conv96, i1 false)
  %322 = load i32, i32* %m_len, align 4, !tbaa !2
  %sub123 = sub i32 %322, %conv96
  store i32 %sub123, i32* %m_len, align 4, !tbaa !2
  br label %cleanup127

cleanup127:                                       ; preds = %if.end28, %for.end89, %if.then120, %if.then93, %for.end118, %if.end41, %sw.epilog24, %sw.epilog, %if.end20, %if.end17, %if.end14, %if.end11, %if.end8, %if.end5, %if.end3, %if.end, %entry
  %retval.1 = phi i32 [ 2, %entry ], [ 3, %if.end ], [ 4, %if.end3 ], [ 6, %if.end5 ], [ 0, %if.end8 ], [ 9, %if.end11 ], [ 7, %if.end14 ], [ 10, %if.end17 ], [ 10, %if.end20 ], [ 10, %sw.epilog ], [ 10, %sw.epilog24 ], [ 10, %if.end28 ], [ 10, %if.end41 ], [ 10, %for.end118 ], [ 10, %if.then93 ], [ 0, %if.then120 ], [ 0, %for.end89 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0) #8
  ret i32 %retval.1
}

; Function Attrs: nofree norecurse nounwind
define hidden i32 @oaes_encryption_round(i8* readonly %key, i8* %c) local_unnamed_addr #6 {
entry:
  %cmp = icmp eq i8* %key, null
  br i1 %cmp, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %cmp1 = icmp eq i8* %c, null
  br i1 %cmp1, label %cleanup, label %oaes_sub_byte.exit.preheader

oaes_sub_byte.exit.preheader:                     ; preds = %if.end
  %0 = load i8, i8* %c, align 1, !tbaa !6
  %conv.i = zext i8 %0 to i32
  %shr.i = lshr i32 %conv.i, 4
  %and1.i = and i32 %conv.i, 15
  %arrayidx2.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i, i32 %and1.i
  %1 = load i8, i8* %arrayidx2.i, align 1, !tbaa !6
  store i8 %1, i8* %c, align 1, !tbaa !6
  %add.ptr.1 = getelementptr inbounds i8, i8* %c, i32 1
  %2 = load i8, i8* %add.ptr.1, align 1, !tbaa !6
  %conv.i.1 = zext i8 %2 to i32
  %shr.i.1 = lshr i32 %conv.i.1, 4
  %and1.i.1 = and i32 %conv.i.1, 15
  %arrayidx2.i.1 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.1, i32 %and1.i.1
  %3 = load i8, i8* %arrayidx2.i.1, align 1, !tbaa !6
  store i8 %3, i8* %add.ptr.1, align 1, !tbaa !6
  %add.ptr.2 = getelementptr inbounds i8, i8* %c, i32 2
  %4 = load i8, i8* %add.ptr.2, align 1, !tbaa !6
  %conv.i.2 = zext i8 %4 to i32
  %shr.i.2 = lshr i32 %conv.i.2, 4
  %and1.i.2 = and i32 %conv.i.2, 15
  %arrayidx2.i.2 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.2, i32 %and1.i.2
  %5 = load i8, i8* %arrayidx2.i.2, align 1, !tbaa !6
  store i8 %5, i8* %add.ptr.2, align 1, !tbaa !6
  %add.ptr.3 = getelementptr inbounds i8, i8* %c, i32 3
  %6 = load i8, i8* %add.ptr.3, align 1, !tbaa !6
  %conv.i.3 = zext i8 %6 to i32
  %shr.i.3 = lshr i32 %conv.i.3, 4
  %and1.i.3 = and i32 %conv.i.3, 15
  %arrayidx2.i.3 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.3, i32 %and1.i.3
  %7 = load i8, i8* %arrayidx2.i.3, align 1, !tbaa !6
  %add.ptr.4 = getelementptr inbounds i8, i8* %c, i32 4
  %8 = load i8, i8* %add.ptr.4, align 1, !tbaa !6
  %conv.i.4 = zext i8 %8 to i32
  %shr.i.4 = lshr i32 %conv.i.4, 4
  %and1.i.4 = and i32 %conv.i.4, 15
  %arrayidx2.i.4 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.4, i32 %and1.i.4
  %9 = load i8, i8* %arrayidx2.i.4, align 1, !tbaa !6
  store i8 %9, i8* %add.ptr.4, align 1, !tbaa !6
  %add.ptr.5 = getelementptr inbounds i8, i8* %c, i32 5
  %10 = load i8, i8* %add.ptr.5, align 1, !tbaa !6
  %conv.i.5 = zext i8 %10 to i32
  %shr.i.5 = lshr i32 %conv.i.5, 4
  %and1.i.5 = and i32 %conv.i.5, 15
  %arrayidx2.i.5 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.5, i32 %and1.i.5
  %11 = load i8, i8* %arrayidx2.i.5, align 1, !tbaa !6
  %add.ptr.6 = getelementptr inbounds i8, i8* %c, i32 6
  %12 = load i8, i8* %add.ptr.6, align 1, !tbaa !6
  %conv.i.6 = zext i8 %12 to i32
  %shr.i.6 = lshr i32 %conv.i.6, 4
  %and1.i.6 = and i32 %conv.i.6, 15
  %arrayidx2.i.6 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.6, i32 %and1.i.6
  %13 = load i8, i8* %arrayidx2.i.6, align 1, !tbaa !6
  %add.ptr.7 = getelementptr inbounds i8, i8* %c, i32 7
  %14 = load i8, i8* %add.ptr.7, align 1, !tbaa !6
  %conv.i.7 = zext i8 %14 to i32
  %shr.i.7 = lshr i32 %conv.i.7, 4
  %and1.i.7 = and i32 %conv.i.7, 15
  %arrayidx2.i.7 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.7, i32 %and1.i.7
  %15 = load i8, i8* %arrayidx2.i.7, align 1, !tbaa !6
  %add.ptr.8 = getelementptr inbounds i8, i8* %c, i32 8
  %16 = load i8, i8* %add.ptr.8, align 1, !tbaa !6
  %conv.i.8 = zext i8 %16 to i32
  %shr.i.8 = lshr i32 %conv.i.8, 4
  %and1.i.8 = and i32 %conv.i.8, 15
  %arrayidx2.i.8 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.8, i32 %and1.i.8
  %17 = load i8, i8* %arrayidx2.i.8, align 1, !tbaa !6
  store i8 %17, i8* %add.ptr.8, align 1, !tbaa !6
  %add.ptr.9 = getelementptr inbounds i8, i8* %c, i32 9
  %18 = load i8, i8* %add.ptr.9, align 1, !tbaa !6
  %conv.i.9 = zext i8 %18 to i32
  %shr.i.9 = lshr i32 %conv.i.9, 4
  %and1.i.9 = and i32 %conv.i.9, 15
  %arrayidx2.i.9 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.9, i32 %and1.i.9
  %19 = load i8, i8* %arrayidx2.i.9, align 1, !tbaa !6
  %add.ptr.10 = getelementptr inbounds i8, i8* %c, i32 10
  %20 = load i8, i8* %add.ptr.10, align 1, !tbaa !6
  %conv.i.10 = zext i8 %20 to i32
  %shr.i.10 = lshr i32 %conv.i.10, 4
  %and1.i.10 = and i32 %conv.i.10, 15
  %arrayidx2.i.10 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.10, i32 %and1.i.10
  %21 = load i8, i8* %arrayidx2.i.10, align 1, !tbaa !6
  %add.ptr.11 = getelementptr inbounds i8, i8* %c, i32 11
  %22 = load i8, i8* %add.ptr.11, align 1, !tbaa !6
  %conv.i.11 = zext i8 %22 to i32
  %shr.i.11 = lshr i32 %conv.i.11, 4
  %and1.i.11 = and i32 %conv.i.11, 15
  %arrayidx2.i.11 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.11, i32 %and1.i.11
  %23 = load i8, i8* %arrayidx2.i.11, align 1, !tbaa !6
  %add.ptr.12 = getelementptr inbounds i8, i8* %c, i32 12
  %24 = load i8, i8* %add.ptr.12, align 1, !tbaa !6
  %conv.i.12 = zext i8 %24 to i32
  %shr.i.12 = lshr i32 %conv.i.12, 4
  %and1.i.12 = and i32 %conv.i.12, 15
  %arrayidx2.i.12 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.12, i32 %and1.i.12
  %25 = load i8, i8* %arrayidx2.i.12, align 1, !tbaa !6
  store i8 %25, i8* %add.ptr.12, align 1, !tbaa !6
  %add.ptr.13 = getelementptr inbounds i8, i8* %c, i32 13
  %26 = load i8, i8* %add.ptr.13, align 1, !tbaa !6
  %conv.i.13 = zext i8 %26 to i32
  %shr.i.13 = lshr i32 %conv.i.13, 4
  %and1.i.13 = and i32 %conv.i.13, 15
  %arrayidx2.i.13 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.13, i32 %and1.i.13
  %27 = load i8, i8* %arrayidx2.i.13, align 1, !tbaa !6
  %add.ptr.14 = getelementptr inbounds i8, i8* %c, i32 14
  %28 = load i8, i8* %add.ptr.14, align 1, !tbaa !6
  %conv.i.14 = zext i8 %28 to i32
  %shr.i.14 = lshr i32 %conv.i.14, 4
  %and1.i.14 = and i32 %conv.i.14, 15
  %arrayidx2.i.14 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.14, i32 %and1.i.14
  %29 = load i8, i8* %arrayidx2.i.14, align 1, !tbaa !6
  %add.ptr.15 = getelementptr inbounds i8, i8* %c, i32 15
  %30 = load i8, i8* %add.ptr.15, align 1, !tbaa !6
  %conv.i.15 = zext i8 %30 to i32
  %shr.i.15 = lshr i32 %conv.i.15, 4
  %and1.i.15 = and i32 %conv.i.15, 15
  %arrayidx2.i.15 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_sub_byte_value, i32 0, i32 %shr.i.15, i32 %and1.i.15
  %31 = load i8, i8* %arrayidx2.i.15, align 1, !tbaa !6
  %32 = load i8, i8* %add.ptr.2, align 1, !tbaa !6
  %33 = load i8, i8* %add.ptr.1, align 1, !tbaa !6
  store i8 %15, i8* %add.ptr.11, align 1, !tbaa !6
  store i8 %27, i8* %add.ptr.9, align 1, !tbaa !6
  store i8 %32, i8* %add.ptr.10, align 1, !tbaa !6
  store i8 %33, i8* %add.ptr.13, align 1, !tbaa !6
  store i8 %13, i8* %add.ptr.14, align 1, !tbaa !6
  store i8 %23, i8* %add.ptr.15, align 1, !tbaa !6
  %34 = load i8, i8* %c, align 1, !tbaa !6
  %conv.i.i111 = zext i8 %34 to i32
  %shr.i.i112 = lshr i32 %conv.i.i111, 4
  %and1.i.i113 = and i32 %conv.i.i111, 15
  %arrayidx3.i.i114 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i.i112, i32 %and1.i.i113
  %35 = load i8, i8* %arrayidx3.i.i114, align 1, !tbaa !6
  %conv.i36.i116 = zext i8 %11 to i32
  %shr.i37.i117 = lshr i32 %conv.i36.i116, 4
  %and1.i38.i118 = and i32 %conv.i36.i116, 15
  %arrayidx6.i39.i119 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i37.i117, i32 %and1.i38.i118
  %36 = load i8, i8* %arrayidx6.i39.i119, align 1, !tbaa !6
  %xor1.i120 = xor i8 %36, %35
  %xor62.i122 = xor i8 %xor1.i120, %21
  %xor93.i124 = xor i8 %xor62.i122, %31
  %arrayidx3.i35.i125 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i37.i117, i32 %and1.i38.i118
  %37 = load i8, i8* %arrayidx3.i35.i125, align 1, !tbaa !6
  %conv.i28.i126 = zext i8 %21 to i32
  %shr.i29.i127 = lshr i32 %conv.i28.i126, 4
  %and1.i30.i128 = and i32 %conv.i28.i126, 15
  %arrayidx6.i31.i129 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i29.i127, i32 %and1.i30.i128
  %38 = load i8, i8* %arrayidx6.i31.i129, align 1, !tbaa !6
  %xor174.i130 = xor i8 %31, %34
  %xor215.i131 = xor i8 %xor174.i130, %37
  %xor246.i132 = xor i8 %xor215.i131, %38
  %xor317.i133 = xor i8 %11, %34
  %arrayidx3.i27.i134 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i29.i127, i32 %and1.i30.i128
  %39 = load i8, i8* %arrayidx3.i27.i134, align 1, !tbaa !6
  %xor358.i135 = xor i8 %xor317.i133, %39
  %conv.i20.i136 = zext i8 %31 to i32
  %shr.i21.i137 = lshr i32 %conv.i20.i136, 4
  %and1.i22.i138 = and i32 %conv.i20.i136, 15
  %arrayidx6.i23.i139 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i21.i137, i32 %and1.i22.i138
  %40 = load i8, i8* %arrayidx6.i23.i139, align 1, !tbaa !6
  %xor399.i140 = xor i8 %xor358.i135, %40
  %arrayidx6.i.i141 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i.i112, i32 %and1.i.i113
  %41 = load i8, i8* %arrayidx6.i.i141, align 1, !tbaa !6
  %arrayidx3.i16.i142 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i21.i137, i32 %and1.i22.i138
  %42 = load i8, i8* %arrayidx3.i16.i142, align 1, !tbaa !6
  %xor4710.i143 = xor i8 %21, %11
  %xor5011.i144 = xor i8 %xor4710.i143, %41
  %xor5412.i145 = xor i8 %xor5011.i144, %42
  store i8 %xor93.i124, i8* %c, align 1
  store i8 %xor246.i132, i8* %add.ptr.1, align 1
  store i8 %xor399.i140, i8* %add.ptr.2, align 1
  store i8 %xor5412.i145, i8* %add.ptr.3, align 1
  %43 = load i8, i8* %add.ptr.4, align 1, !tbaa !6
  %conv.i.i74 = zext i8 %43 to i32
  %shr.i.i75 = lshr i32 %conv.i.i74, 4
  %and1.i.i76 = and i32 %conv.i.i74, 15
  %arrayidx3.i.i77 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i.i75, i32 %and1.i.i76
  %44 = load i8, i8* %arrayidx3.i.i77, align 1, !tbaa !6
  %conv.i36.i79 = zext i8 %19 to i32
  %shr.i37.i80 = lshr i32 %conv.i36.i79, 4
  %and1.i38.i81 = and i32 %conv.i36.i79, 15
  %arrayidx6.i39.i82 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i37.i80, i32 %and1.i38.i81
  %45 = load i8, i8* %arrayidx6.i39.i82, align 1, !tbaa !6
  %xor1.i83 = xor i8 %45, %44
  %xor62.i85 = xor i8 %xor1.i83, %29
  %xor93.i87 = xor i8 %xor62.i85, %7
  %arrayidx3.i35.i88 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i37.i80, i32 %and1.i38.i81
  %46 = load i8, i8* %arrayidx3.i35.i88, align 1, !tbaa !6
  %conv.i28.i89 = zext i8 %29 to i32
  %shr.i29.i90 = lshr i32 %conv.i28.i89, 4
  %and1.i30.i91 = and i32 %conv.i28.i89, 15
  %arrayidx6.i31.i92 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i29.i90, i32 %and1.i30.i91
  %47 = load i8, i8* %arrayidx6.i31.i92, align 1, !tbaa !6
  %xor174.i93 = xor i8 %7, %43
  %xor215.i94 = xor i8 %xor174.i93, %46
  %xor246.i95 = xor i8 %xor215.i94, %47
  %xor317.i96 = xor i8 %19, %43
  %arrayidx3.i27.i97 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i29.i90, i32 %and1.i30.i91
  %48 = load i8, i8* %arrayidx3.i27.i97, align 1, !tbaa !6
  %xor358.i98 = xor i8 %xor317.i96, %48
  %conv.i20.i99 = zext i8 %7 to i32
  %shr.i21.i100 = lshr i32 %conv.i20.i99, 4
  %and1.i22.i101 = and i32 %conv.i20.i99, 15
  %arrayidx6.i23.i102 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i21.i100, i32 %and1.i22.i101
  %49 = load i8, i8* %arrayidx6.i23.i102, align 1, !tbaa !6
  %xor399.i103 = xor i8 %xor358.i98, %49
  %arrayidx6.i.i104 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i.i75, i32 %and1.i.i76
  %50 = load i8, i8* %arrayidx6.i.i104, align 1, !tbaa !6
  %arrayidx3.i16.i105 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i21.i100, i32 %and1.i22.i101
  %51 = load i8, i8* %arrayidx3.i16.i105, align 1, !tbaa !6
  %xor4710.i106 = xor i8 %29, %19
  %xor5011.i107 = xor i8 %xor4710.i106, %50
  %xor5412.i108 = xor i8 %xor5011.i107, %51
  store i8 %xor93.i87, i8* %add.ptr.4, align 1
  store i8 %xor246.i95, i8* %add.ptr.5, align 1
  store i8 %xor399.i103, i8* %add.ptr.6, align 1
  store i8 %xor5412.i108, i8* %add.ptr.7, align 1
  %52 = load i8, i8* %add.ptr.8, align 1, !tbaa !6
  %conv.i.i38 = zext i8 %52 to i32
  %shr.i.i39 = lshr i32 %conv.i.i38, 4
  %and1.i.i40 = and i32 %conv.i.i38, 15
  %arrayidx3.i.i41 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i.i39, i32 %and1.i.i40
  %53 = load i8, i8* %arrayidx3.i.i41, align 1, !tbaa !6
  %54 = load i8, i8* %add.ptr.9, align 1, !tbaa !6
  %conv.i36.i43 = zext i8 %54 to i32
  %shr.i37.i44 = lshr i32 %conv.i36.i43, 4
  %and1.i38.i45 = and i32 %conv.i36.i43, 15
  %arrayidx6.i39.i46 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i37.i44, i32 %and1.i38.i45
  %55 = load i8, i8* %arrayidx6.i39.i46, align 1, !tbaa !6
  %xor1.i47 = xor i8 %55, %53
  %56 = load i8, i8* %add.ptr.10, align 1, !tbaa !6
  %xor62.i49 = xor i8 %xor1.i47, %56
  %57 = load i8, i8* %add.ptr.11, align 1, !tbaa !6
  %xor93.i51 = xor i8 %xor62.i49, %57
  %arrayidx3.i35.i52 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i37.i44, i32 %and1.i38.i45
  %58 = load i8, i8* %arrayidx3.i35.i52, align 1, !tbaa !6
  %conv.i28.i53 = zext i8 %56 to i32
  %shr.i29.i54 = lshr i32 %conv.i28.i53, 4
  %and1.i30.i55 = and i32 %conv.i28.i53, 15
  %arrayidx6.i31.i56 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i29.i54, i32 %and1.i30.i55
  %59 = load i8, i8* %arrayidx6.i31.i56, align 1, !tbaa !6
  %xor174.i57 = xor i8 %57, %52
  %xor215.i58 = xor i8 %xor174.i57, %58
  %xor246.i59 = xor i8 %xor215.i58, %59
  %xor317.i60 = xor i8 %54, %52
  %arrayidx3.i27.i61 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i29.i54, i32 %and1.i30.i55
  %60 = load i8, i8* %arrayidx3.i27.i61, align 1, !tbaa !6
  %xor358.i62 = xor i8 %xor317.i60, %60
  %conv.i20.i63 = zext i8 %57 to i32
  %shr.i21.i64 = lshr i32 %conv.i20.i63, 4
  %and1.i22.i65 = and i32 %conv.i20.i63, 15
  %arrayidx6.i23.i66 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i21.i64, i32 %and1.i22.i65
  %61 = load i8, i8* %arrayidx6.i23.i66, align 1, !tbaa !6
  %xor399.i67 = xor i8 %xor358.i62, %61
  %arrayidx6.i.i68 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i.i39, i32 %and1.i.i40
  %62 = load i8, i8* %arrayidx6.i.i68, align 1, !tbaa !6
  %arrayidx3.i16.i69 = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i21.i64, i32 %and1.i22.i65
  %63 = load i8, i8* %arrayidx3.i16.i69, align 1, !tbaa !6
  %xor4710.i70 = xor i8 %56, %54
  %xor5011.i71 = xor i8 %xor4710.i70, %62
  %xor5412.i72 = xor i8 %xor5011.i71, %63
  store i8 %xor93.i51, i8* %add.ptr.8, align 1
  store i8 %xor246.i59, i8* %add.ptr.9, align 1
  store i8 %xor399.i67, i8* %add.ptr.10, align 1
  store i8 %xor5412.i72, i8* %add.ptr.11, align 1
  %64 = load i8, i8* %add.ptr.12, align 1, !tbaa !6
  %conv.i.i = zext i8 %64 to i32
  %shr.i.i = lshr i32 %conv.i.i, 4
  %and1.i.i = and i32 %conv.i.i, 15
  %arrayidx3.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i.i, i32 %and1.i.i
  %65 = load i8, i8* %arrayidx3.i.i, align 1, !tbaa !6
  %66 = load i8, i8* %add.ptr.13, align 1, !tbaa !6
  %conv.i36.i = zext i8 %66 to i32
  %shr.i37.i = lshr i32 %conv.i36.i, 4
  %and1.i38.i = and i32 %conv.i36.i, 15
  %arrayidx6.i39.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i37.i, i32 %and1.i38.i
  %67 = load i8, i8* %arrayidx6.i39.i, align 1, !tbaa !6
  %xor1.i = xor i8 %67, %65
  %68 = load i8, i8* %add.ptr.14, align 1, !tbaa !6
  %xor62.i = xor i8 %xor1.i, %68
  %69 = load i8, i8* %add.ptr.15, align 1, !tbaa !6
  %xor93.i = xor i8 %xor62.i, %69
  %arrayidx3.i35.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i37.i, i32 %and1.i38.i
  %70 = load i8, i8* %arrayidx3.i35.i, align 1, !tbaa !6
  %conv.i28.i = zext i8 %68 to i32
  %shr.i29.i = lshr i32 %conv.i28.i, 4
  %and1.i30.i = and i32 %conv.i28.i, 15
  %arrayidx6.i31.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i29.i, i32 %and1.i30.i
  %71 = load i8, i8* %arrayidx6.i31.i, align 1, !tbaa !6
  %xor174.i = xor i8 %69, %64
  %xor215.i = xor i8 %xor174.i, %70
  %xor246.i = xor i8 %xor215.i, %71
  %xor317.i = xor i8 %66, %64
  %arrayidx3.i27.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i29.i, i32 %and1.i30.i
  %72 = load i8, i8* %arrayidx3.i27.i, align 1, !tbaa !6
  %xor358.i = xor i8 %xor317.i, %72
  %conv.i20.i = zext i8 %69 to i32
  %shr.i21.i = lshr i32 %conv.i20.i, 4
  %and1.i22.i = and i32 %conv.i20.i, 15
  %arrayidx6.i23.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i21.i, i32 %and1.i22.i
  %73 = load i8, i8* %arrayidx6.i23.i, align 1, !tbaa !6
  %xor399.i = xor i8 %xor358.i, %73
  %arrayidx6.i.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_3, i32 0, i32 %shr.i.i, i32 %and1.i.i
  %74 = load i8, i8* %arrayidx6.i.i, align 1, !tbaa !6
  %arrayidx3.i16.i = getelementptr inbounds [16 x [16 x i8]], [16 x [16 x i8]]* @oaes_gf_mul_2, i32 0, i32 %shr.i21.i, i32 %and1.i22.i
  %75 = load i8, i8* %arrayidx3.i16.i, align 1, !tbaa !6
  %xor4710.i = xor i8 %68, %66
  %xor5011.i = xor i8 %xor4710.i, %74
  %xor5412.i = xor i8 %xor5011.i, %75
  store i8 %xor93.i, i8* %add.ptr.12, align 1
  store i8 %xor246.i, i8* %add.ptr.13, align 1
  store i8 %xor399.i, i8* %add.ptr.14, align 1
  store i8 %xor5412.i, i8* %add.ptr.15, align 1
  %76 = load i8, i8* %key, align 1, !tbaa !6
  %77 = load i8, i8* %c, align 1, !tbaa !6
  %xor36 = xor i8 %77, %76
  store i8 %xor36, i8* %c, align 1, !tbaa !6
  %arrayidx.1 = getelementptr inbounds i8, i8* %key, i32 1
  %78 = load i8, i8* %arrayidx.1, align 1, !tbaa !6
  %79 = load i8, i8* %add.ptr.1, align 1, !tbaa !6
  %xor36.1 = xor i8 %79, %78
  store i8 %xor36.1, i8* %add.ptr.1, align 1, !tbaa !6
  %arrayidx.2 = getelementptr inbounds i8, i8* %key, i32 2
  %80 = load i8, i8* %arrayidx.2, align 1, !tbaa !6
  %81 = load i8, i8* %add.ptr.2, align 1, !tbaa !6
  %xor36.2 = xor i8 %81, %80
  store i8 %xor36.2, i8* %add.ptr.2, align 1, !tbaa !6
  %arrayidx.3 = getelementptr inbounds i8, i8* %key, i32 3
  %82 = load i8, i8* %arrayidx.3, align 1, !tbaa !6
  %83 = load i8, i8* %add.ptr.3, align 1, !tbaa !6
  %xor36.3 = xor i8 %83, %82
  store i8 %xor36.3, i8* %add.ptr.3, align 1, !tbaa !6
  %arrayidx.4 = getelementptr inbounds i8, i8* %key, i32 4
  %84 = load i8, i8* %arrayidx.4, align 1, !tbaa !6
  %85 = load i8, i8* %add.ptr.4, align 1, !tbaa !6
  %xor36.4 = xor i8 %85, %84
  store i8 %xor36.4, i8* %add.ptr.4, align 1, !tbaa !6
  %arrayidx.5 = getelementptr inbounds i8, i8* %key, i32 5
  %86 = load i8, i8* %arrayidx.5, align 1, !tbaa !6
  %87 = load i8, i8* %add.ptr.5, align 1, !tbaa !6
  %xor36.5 = xor i8 %87, %86
  store i8 %xor36.5, i8* %add.ptr.5, align 1, !tbaa !6
  %arrayidx.6 = getelementptr inbounds i8, i8* %key, i32 6
  %88 = load i8, i8* %arrayidx.6, align 1, !tbaa !6
  %89 = load i8, i8* %add.ptr.6, align 1, !tbaa !6
  %xor36.6 = xor i8 %89, %88
  store i8 %xor36.6, i8* %add.ptr.6, align 1, !tbaa !6
  %arrayidx.7 = getelementptr inbounds i8, i8* %key, i32 7
  %90 = load i8, i8* %arrayidx.7, align 1, !tbaa !6
  %91 = load i8, i8* %add.ptr.7, align 1, !tbaa !6
  %xor36.7 = xor i8 %91, %90
  store i8 %xor36.7, i8* %add.ptr.7, align 1, !tbaa !6
  %arrayidx.8 = getelementptr inbounds i8, i8* %key, i32 8
  %92 = load i8, i8* %arrayidx.8, align 1, !tbaa !6
  %xor36.8 = xor i8 %xor93.i51, %92
  store i8 %xor36.8, i8* %add.ptr.8, align 1, !tbaa !6
  %arrayidx.9 = getelementptr inbounds i8, i8* %key, i32 9
  %93 = load i8, i8* %arrayidx.9, align 1, !tbaa !6
  %xor36.9 = xor i8 %xor246.i59, %93
  store i8 %xor36.9, i8* %add.ptr.9, align 1, !tbaa !6
  %arrayidx.10 = getelementptr inbounds i8, i8* %key, i32 10
  %94 = load i8, i8* %arrayidx.10, align 1, !tbaa !6
  %xor36.10 = xor i8 %xor399.i67, %94
  store i8 %xor36.10, i8* %add.ptr.10, align 1, !tbaa !6
  %arrayidx.11 = getelementptr inbounds i8, i8* %key, i32 11
  %95 = load i8, i8* %arrayidx.11, align 1, !tbaa !6
  %96 = load i8, i8* %add.ptr.11, align 1, !tbaa !6
  %xor36.11 = xor i8 %96, %95
  store i8 %xor36.11, i8* %add.ptr.11, align 1, !tbaa !6
  %arrayidx.12 = getelementptr inbounds i8, i8* %key, i32 12
  %97 = load i8, i8* %arrayidx.12, align 1, !tbaa !6
  %xor36.12 = xor i8 %xor93.i, %97
  store i8 %xor36.12, i8* %add.ptr.12, align 1, !tbaa !6
  %arrayidx.13 = getelementptr inbounds i8, i8* %key, i32 13
  %98 = load i8, i8* %arrayidx.13, align 1, !tbaa !6
  %xor36.13 = xor i8 %xor246.i, %98
  store i8 %xor36.13, i8* %add.ptr.13, align 1, !tbaa !6
  %arrayidx.14 = getelementptr inbounds i8, i8* %key, i32 14
  %99 = load i8, i8* %arrayidx.14, align 1, !tbaa !6
  %xor36.14 = xor i8 %xor399.i, %99
  store i8 %xor36.14, i8* %add.ptr.14, align 1, !tbaa !6
  %arrayidx.15 = getelementptr inbounds i8, i8* %key, i32 15
  %100 = load i8, i8* %arrayidx.15, align 1, !tbaa !6
  %xor36.15 = xor i8 %xor5412.i, %100
  store i8 %xor36.15, i8* %add.ptr.15, align 1, !tbaa !6
  br label %cleanup

cleanup:                                          ; preds = %oaes_sub_byte.exit.preheader, %if.end, %entry
  %retval.0 = phi i32 [ 2, %entry ], [ 3, %if.end ], [ 0, %oaes_sub_byte.exit.preheader ]
  ret i32 %retval.0
}

; Function Attrs: nofree norecurse nounwind
define hidden i32 @oaes_pseudo_encrypt_ecb(i8* readonly %ctx, i8* %c) local_unnamed_addr #6 {
entry:
  %cmp = icmp eq i8* %ctx, null
  br i1 %cmp, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %cmp1 = icmp eq i8* %c, null
  br i1 %cmp1, label %cleanup, label %if.end3

if.end3:                                          ; preds = %if.end
  %key = bitcast i8* %ctx to %struct._oaes_key**
  %0 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %cmp4 = icmp eq %struct._oaes_key* %0, null
  br i1 %cmp4, label %cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %if.end3
  %exp_data = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %0, i32 0, i32 3
  %1 = load i8*, i8** %exp_data, align 4, !tbaa !14
  %call = tail call i32 @oaes_encryption_round(i8* %1, i8* nonnull %c)
  %2 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.1 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %2, i32 0, i32 3
  %3 = load i8*, i8** %exp_data.1, align 4, !tbaa !14
  %arrayidx.1 = getelementptr inbounds i8, i8* %3, i32 16
  %call.1 = tail call i32 @oaes_encryption_round(i8* nonnull %arrayidx.1, i8* nonnull %c)
  %4 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.2 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %4, i32 0, i32 3
  %5 = load i8*, i8** %exp_data.2, align 4, !tbaa !14
  %arrayidx.2 = getelementptr inbounds i8, i8* %5, i32 32
  %call.2 = tail call i32 @oaes_encryption_round(i8* nonnull %arrayidx.2, i8* nonnull %c)
  %6 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.3 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %6, i32 0, i32 3
  %7 = load i8*, i8** %exp_data.3, align 4, !tbaa !14
  %arrayidx.3 = getelementptr inbounds i8, i8* %7, i32 48
  %call.3 = tail call i32 @oaes_encryption_round(i8* nonnull %arrayidx.3, i8* nonnull %c)
  %8 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.4 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %8, i32 0, i32 3
  %9 = load i8*, i8** %exp_data.4, align 4, !tbaa !14
  %arrayidx.4 = getelementptr inbounds i8, i8* %9, i32 64
  %call.4 = tail call i32 @oaes_encryption_round(i8* nonnull %arrayidx.4, i8* nonnull %c)
  %10 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.5 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %10, i32 0, i32 3
  %11 = load i8*, i8** %exp_data.5, align 4, !tbaa !14
  %arrayidx.5 = getelementptr inbounds i8, i8* %11, i32 80
  %call.5 = tail call i32 @oaes_encryption_round(i8* nonnull %arrayidx.5, i8* nonnull %c)
  %12 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.6 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %12, i32 0, i32 3
  %13 = load i8*, i8** %exp_data.6, align 4, !tbaa !14
  %arrayidx.6 = getelementptr inbounds i8, i8* %13, i32 96
  %call.6 = tail call i32 @oaes_encryption_round(i8* nonnull %arrayidx.6, i8* nonnull %c)
  %14 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.7 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %14, i32 0, i32 3
  %15 = load i8*, i8** %exp_data.7, align 4, !tbaa !14
  %arrayidx.7 = getelementptr inbounds i8, i8* %15, i32 112
  %call.7 = tail call i32 @oaes_encryption_round(i8* nonnull %arrayidx.7, i8* nonnull %c)
  %16 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.8 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %16, i32 0, i32 3
  %17 = load i8*, i8** %exp_data.8, align 4, !tbaa !14
  %arrayidx.8 = getelementptr inbounds i8, i8* %17, i32 128
  %call.8 = tail call i32 @oaes_encryption_round(i8* nonnull %arrayidx.8, i8* nonnull %c)
  %18 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !7
  %exp_data.9 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %18, i32 0, i32 3
  %19 = load i8*, i8** %exp_data.9, align 4, !tbaa !14
  %arrayidx.9 = getelementptr inbounds i8, i8* %19, i32 144
  %call.9 = tail call i32 @oaes_encryption_round(i8* nonnull %arrayidx.9, i8* nonnull %c)
  br label %cleanup

cleanup:                                          ; preds = %for.body.preheader, %if.end3, %if.end, %entry
  %retval.0 = phi i32 [ 2, %entry ], [ 3, %if.end ], [ 7, %if.end3 ], [ 0, %for.body.preheader ]
  ret i32 %retval.0
}

declare i32 @ftime(%struct.timeb*) local_unnamed_addr #4

declare %struct.tm* @gmtime(i32*) local_unnamed_addr #4

declare i32 @getpid() local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare i32 @siprintf(i8* noalias nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nofree nounwind readonly
declare i32 @strlen(i8* nocapture) local_unnamed_addr #7

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i1 immarg) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nofree norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { argmemonly nofree nounwind readonly }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (/b/s/w/ir/cache/git/chromium.googlesource.com-external-github.com-llvm-llvm--project 3774bcf9f84520a8c35bf765d9a528040d68a14b)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"long", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!4, !4, i64 0}
!7 = !{!8, !9, i64 0}
!8 = !{!"_oaes_ctx", !9, i64 0, !10, i64 4, !4, i64 6}
!9 = !{!"any pointer", !4, i64 0}
!10 = !{!"short", !4, i64 0}
!11 = !{!12, !9, i64 4}
!12 = !{!"_oaes_key", !3, i64 0, !9, i64 4, !3, i64 8, !9, i64 12, !3, i64 16, !3, i64 20}
!13 = !{!9, !9, i64 0}
!14 = !{!12, !9, i64 12}
!15 = !{!12, !3, i64 0}
!16 = !{!12, !3, i64 20}
!17 = !{!12, !3, i64 16}
!18 = !{!12, !3, i64 8}
!19 = !{!20, !10, i64 4}
!20 = !{!"timeb", !3, i64 0, !10, i64 4, !10, i64 6, !10, i64 8}
!21 = !{!22, !23, i64 20}
!22 = !{!"tm", !23, i64 0, !23, i64 4, !23, i64 8, !23, i64 12, !23, i64 16, !23, i64 20, !23, i64 24, !23, i64 28, !23, i64 32, !3, i64 36, !9, i64 40}
!23 = !{!"int", !4, i64 0}
!24 = !{!22, !23, i64 16}
!25 = !{!22, !23, i64 12}
!26 = !{!22, !23, i64 8}
!27 = !{!22, !23, i64 4}
!28 = !{!22, !23, i64 0}
!29 = !{!8, !10, i64 4}
