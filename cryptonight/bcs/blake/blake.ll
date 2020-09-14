; ModuleID = 'blake/blake.bc'
source_filename = "blake.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-emscripten"

%struct.state = type { [8 x i32], [4 x i32], [2 x i32], i32, i32, [64 x i8] }
%struct.hmac_state = type { %struct.state, %struct.state }

@sigma = hidden local_unnamed_addr constant [14 x [16 x i8]] [[16 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F", [16 x i8] c"\0E\0A\04\08\09\0F\0D\06\01\0C\00\02\0B\07\05\03", [16 x i8] c"\0B\08\0C\00\05\02\0F\0D\0A\0E\03\06\07\01\09\04", [16 x i8] c"\07\09\03\01\0D\0C\0B\0E\02\06\05\0A\04\00\0F\08", [16 x i8] c"\09\00\05\07\02\04\0A\0F\0E\01\0B\0C\06\08\03\0D", [16 x i8] c"\02\0C\06\0A\00\0B\08\03\04\0D\07\05\0F\0E\01\09", [16 x i8] c"\0C\05\01\0F\0E\0D\04\0A\00\07\06\03\09\02\08\0B", [16 x i8] c"\0D\0B\07\0E\0C\01\03\09\05\00\0F\04\08\06\02\0A", [16 x i8] c"\06\0F\0E\09\0B\03\00\08\0C\02\0D\07\01\04\0A\05", [16 x i8] c"\0A\02\08\04\07\06\01\05\0F\0B\09\0E\03\0C\0D\00", [16 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F", [16 x i8] c"\0E\0A\04\08\09\0F\0D\06\01\0C\00\02\0B\07\05\03", [16 x i8] c"\0B\08\0C\00\05\02\0F\0D\0A\0E\03\06\07\01\09\04", [16 x i8] c"\07\09\03\01\0D\0C\0B\0E\02\06\05\0A\04\00\0F\08"], align 16
@cst = hidden local_unnamed_addr constant [16 x i32] [i32 608135816, i32 -2052912941, i32 320440878, i32 57701188, i32 -1542899678, i32 698298832, i32 137296536, i32 -330404727, i32 1160258022, i32 953160567, i32 -1101764913, i32 887688300, i32 -1062458953, i32 -914599715, i32 1065670069, i32 -1253635817], align 16
@padding = internal constant <{ i8, [63 x i8] }> <{ i8 -128, [63 x i8] zeroinitializer }>, align 16

; Function Attrs: nounwind
define hidden void @blake256_compress(%struct.state* nocapture %S, i8* nocapture readonly %block) local_unnamed_addr #0 {
entry:
  %v = alloca [16 x i32], align 16
  %0 = bitcast [16 x i32]* %v to i8*
  %m = alloca [16 x i32], align 16
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %0) #3
  %1 = bitcast [16 x i32]* %m to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %1) #3
  %2 = load i8, i8* %block, align 1, !tbaa !2
  %conv = zext i8 %2 to i32
  %shl = shl nuw i32 %conv, 24
  %arrayidx3 = getelementptr inbounds i8, i8* %block, i32 1
  %3 = load i8, i8* %arrayidx3, align 1, !tbaa !2
  %conv4 = zext i8 %3 to i32
  %shl5 = shl nuw nsw i32 %conv4, 16
  %or = or i32 %shl5, %shl
  %arrayidx8 = getelementptr inbounds i8, i8* %block, i32 2
  %4 = load i8, i8* %arrayidx8, align 1, !tbaa !2
  %conv9 = zext i8 %4 to i32
  %shl10 = shl nuw nsw i32 %conv9, 8
  %or11 = or i32 %or, %shl10
  %arrayidx14 = getelementptr inbounds i8, i8* %block, i32 3
  %5 = load i8, i8* %arrayidx14, align 1, !tbaa !2
  %conv15 = zext i8 %5 to i32
  %or16 = or i32 %or11, %conv15
  %arrayidx17 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 0
  store i32 %or16, i32* %arrayidx17, align 16, !tbaa !5
  %add.ptr.1 = getelementptr inbounds i8, i8* %block, i32 4
  %6 = load i8, i8* %add.ptr.1, align 1, !tbaa !2
  %conv.1 = zext i8 %6 to i32
  %shl.1 = shl nuw i32 %conv.1, 24
  %arrayidx3.1 = getelementptr inbounds i8, i8* %block, i32 5
  %7 = load i8, i8* %arrayidx3.1, align 1, !tbaa !2
  %conv4.1 = zext i8 %7 to i32
  %shl5.1 = shl nuw nsw i32 %conv4.1, 16
  %or.1 = or i32 %shl5.1, %shl.1
  %arrayidx8.1 = getelementptr inbounds i8, i8* %block, i32 6
  %8 = load i8, i8* %arrayidx8.1, align 1, !tbaa !2
  %conv9.1 = zext i8 %8 to i32
  %shl10.1 = shl nuw nsw i32 %conv9.1, 8
  %or11.1 = or i32 %or.1, %shl10.1
  %arrayidx14.1 = getelementptr inbounds i8, i8* %block, i32 7
  %9 = load i8, i8* %arrayidx14.1, align 1, !tbaa !2
  %conv15.1 = zext i8 %9 to i32
  %or16.1 = or i32 %or11.1, %conv15.1
  %arrayidx17.1 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 1
  store i32 %or16.1, i32* %arrayidx17.1, align 4, !tbaa !5
  %add.ptr.2 = getelementptr inbounds i8, i8* %block, i32 8
  %10 = load i8, i8* %add.ptr.2, align 1, !tbaa !2
  %conv.2 = zext i8 %10 to i32
  %shl.2 = shl nuw i32 %conv.2, 24
  %arrayidx3.2 = getelementptr inbounds i8, i8* %block, i32 9
  %11 = load i8, i8* %arrayidx3.2, align 1, !tbaa !2
  %conv4.2 = zext i8 %11 to i32
  %shl5.2 = shl nuw nsw i32 %conv4.2, 16
  %or.2 = or i32 %shl5.2, %shl.2
  %arrayidx8.2 = getelementptr inbounds i8, i8* %block, i32 10
  %12 = load i8, i8* %arrayidx8.2, align 1, !tbaa !2
  %conv9.2 = zext i8 %12 to i32
  %shl10.2 = shl nuw nsw i32 %conv9.2, 8
  %or11.2 = or i32 %or.2, %shl10.2
  %arrayidx14.2 = getelementptr inbounds i8, i8* %block, i32 11
  %13 = load i8, i8* %arrayidx14.2, align 1, !tbaa !2
  %conv15.2 = zext i8 %13 to i32
  %or16.2 = or i32 %or11.2, %conv15.2
  %arrayidx17.2 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 2
  store i32 %or16.2, i32* %arrayidx17.2, align 8, !tbaa !5
  %add.ptr.3 = getelementptr inbounds i8, i8* %block, i32 12
  %14 = load i8, i8* %add.ptr.3, align 1, !tbaa !2
  %conv.3 = zext i8 %14 to i32
  %shl.3 = shl nuw i32 %conv.3, 24
  %arrayidx3.3 = getelementptr inbounds i8, i8* %block, i32 13
  %15 = load i8, i8* %arrayidx3.3, align 1, !tbaa !2
  %conv4.3 = zext i8 %15 to i32
  %shl5.3 = shl nuw nsw i32 %conv4.3, 16
  %or.3 = or i32 %shl5.3, %shl.3
  %arrayidx8.3 = getelementptr inbounds i8, i8* %block, i32 14
  %16 = load i8, i8* %arrayidx8.3, align 1, !tbaa !2
  %conv9.3 = zext i8 %16 to i32
  %shl10.3 = shl nuw nsw i32 %conv9.3, 8
  %or11.3 = or i32 %or.3, %shl10.3
  %arrayidx14.3 = getelementptr inbounds i8, i8* %block, i32 15
  %17 = load i8, i8* %arrayidx14.3, align 1, !tbaa !2
  %conv15.3 = zext i8 %17 to i32
  %or16.3 = or i32 %or11.3, %conv15.3
  %arrayidx17.3 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 3
  store i32 %or16.3, i32* %arrayidx17.3, align 4, !tbaa !5
  %add.ptr.4 = getelementptr inbounds i8, i8* %block, i32 16
  %18 = load i8, i8* %add.ptr.4, align 1, !tbaa !2
  %conv.4 = zext i8 %18 to i32
  %shl.4 = shl nuw i32 %conv.4, 24
  %arrayidx3.4 = getelementptr inbounds i8, i8* %block, i32 17
  %19 = load i8, i8* %arrayidx3.4, align 1, !tbaa !2
  %conv4.4 = zext i8 %19 to i32
  %shl5.4 = shl nuw nsw i32 %conv4.4, 16
  %or.4 = or i32 %shl5.4, %shl.4
  %arrayidx8.4 = getelementptr inbounds i8, i8* %block, i32 18
  %20 = load i8, i8* %arrayidx8.4, align 1, !tbaa !2
  %conv9.4 = zext i8 %20 to i32
  %shl10.4 = shl nuw nsw i32 %conv9.4, 8
  %or11.4 = or i32 %or.4, %shl10.4
  %arrayidx14.4 = getelementptr inbounds i8, i8* %block, i32 19
  %21 = load i8, i8* %arrayidx14.4, align 1, !tbaa !2
  %conv15.4 = zext i8 %21 to i32
  %or16.4 = or i32 %or11.4, %conv15.4
  %arrayidx17.4 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 4
  store i32 %or16.4, i32* %arrayidx17.4, align 16, !tbaa !5
  %add.ptr.5 = getelementptr inbounds i8, i8* %block, i32 20
  %22 = load i8, i8* %add.ptr.5, align 1, !tbaa !2
  %conv.5 = zext i8 %22 to i32
  %shl.5 = shl nuw i32 %conv.5, 24
  %arrayidx3.5 = getelementptr inbounds i8, i8* %block, i32 21
  %23 = load i8, i8* %arrayidx3.5, align 1, !tbaa !2
  %conv4.5 = zext i8 %23 to i32
  %shl5.5 = shl nuw nsw i32 %conv4.5, 16
  %or.5 = or i32 %shl5.5, %shl.5
  %arrayidx8.5 = getelementptr inbounds i8, i8* %block, i32 22
  %24 = load i8, i8* %arrayidx8.5, align 1, !tbaa !2
  %conv9.5 = zext i8 %24 to i32
  %shl10.5 = shl nuw nsw i32 %conv9.5, 8
  %or11.5 = or i32 %or.5, %shl10.5
  %arrayidx14.5 = getelementptr inbounds i8, i8* %block, i32 23
  %25 = load i8, i8* %arrayidx14.5, align 1, !tbaa !2
  %conv15.5 = zext i8 %25 to i32
  %or16.5 = or i32 %or11.5, %conv15.5
  %arrayidx17.5 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 5
  store i32 %or16.5, i32* %arrayidx17.5, align 4, !tbaa !5
  %add.ptr.6 = getelementptr inbounds i8, i8* %block, i32 24
  %26 = load i8, i8* %add.ptr.6, align 1, !tbaa !2
  %conv.6 = zext i8 %26 to i32
  %shl.6 = shl nuw i32 %conv.6, 24
  %arrayidx3.6 = getelementptr inbounds i8, i8* %block, i32 25
  %27 = load i8, i8* %arrayidx3.6, align 1, !tbaa !2
  %conv4.6 = zext i8 %27 to i32
  %shl5.6 = shl nuw nsw i32 %conv4.6, 16
  %or.6 = or i32 %shl5.6, %shl.6
  %arrayidx8.6 = getelementptr inbounds i8, i8* %block, i32 26
  %28 = load i8, i8* %arrayidx8.6, align 1, !tbaa !2
  %conv9.6 = zext i8 %28 to i32
  %shl10.6 = shl nuw nsw i32 %conv9.6, 8
  %or11.6 = or i32 %or.6, %shl10.6
  %arrayidx14.6 = getelementptr inbounds i8, i8* %block, i32 27
  %29 = load i8, i8* %arrayidx14.6, align 1, !tbaa !2
  %conv15.6 = zext i8 %29 to i32
  %or16.6 = or i32 %or11.6, %conv15.6
  %arrayidx17.6 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 6
  store i32 %or16.6, i32* %arrayidx17.6, align 8, !tbaa !5
  %add.ptr.7 = getelementptr inbounds i8, i8* %block, i32 28
  %30 = load i8, i8* %add.ptr.7, align 1, !tbaa !2
  %conv.7 = zext i8 %30 to i32
  %shl.7 = shl nuw i32 %conv.7, 24
  %arrayidx3.7 = getelementptr inbounds i8, i8* %block, i32 29
  %31 = load i8, i8* %arrayidx3.7, align 1, !tbaa !2
  %conv4.7 = zext i8 %31 to i32
  %shl5.7 = shl nuw nsw i32 %conv4.7, 16
  %or.7 = or i32 %shl5.7, %shl.7
  %arrayidx8.7 = getelementptr inbounds i8, i8* %block, i32 30
  %32 = load i8, i8* %arrayidx8.7, align 1, !tbaa !2
  %conv9.7 = zext i8 %32 to i32
  %shl10.7 = shl nuw nsw i32 %conv9.7, 8
  %or11.7 = or i32 %or.7, %shl10.7
  %arrayidx14.7 = getelementptr inbounds i8, i8* %block, i32 31
  %33 = load i8, i8* %arrayidx14.7, align 1, !tbaa !2
  %conv15.7 = zext i8 %33 to i32
  %or16.7 = or i32 %or11.7, %conv15.7
  %arrayidx17.7 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 7
  store i32 %or16.7, i32* %arrayidx17.7, align 4, !tbaa !5
  %add.ptr.8 = getelementptr inbounds i8, i8* %block, i32 32
  %34 = load i8, i8* %add.ptr.8, align 1, !tbaa !2
  %conv.8 = zext i8 %34 to i32
  %shl.8 = shl nuw i32 %conv.8, 24
  %arrayidx3.8 = getelementptr inbounds i8, i8* %block, i32 33
  %35 = load i8, i8* %arrayidx3.8, align 1, !tbaa !2
  %conv4.8 = zext i8 %35 to i32
  %shl5.8 = shl nuw nsw i32 %conv4.8, 16
  %or.8 = or i32 %shl5.8, %shl.8
  %arrayidx8.8 = getelementptr inbounds i8, i8* %block, i32 34
  %36 = load i8, i8* %arrayidx8.8, align 1, !tbaa !2
  %conv9.8 = zext i8 %36 to i32
  %shl10.8 = shl nuw nsw i32 %conv9.8, 8
  %or11.8 = or i32 %or.8, %shl10.8
  %arrayidx14.8 = getelementptr inbounds i8, i8* %block, i32 35
  %37 = load i8, i8* %arrayidx14.8, align 1, !tbaa !2
  %conv15.8 = zext i8 %37 to i32
  %or16.8 = or i32 %or11.8, %conv15.8
  %arrayidx17.8 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 8
  store i32 %or16.8, i32* %arrayidx17.8, align 16, !tbaa !5
  %add.ptr.9 = getelementptr inbounds i8, i8* %block, i32 36
  %38 = load i8, i8* %add.ptr.9, align 1, !tbaa !2
  %conv.9 = zext i8 %38 to i32
  %shl.9 = shl nuw i32 %conv.9, 24
  %arrayidx3.9 = getelementptr inbounds i8, i8* %block, i32 37
  %39 = load i8, i8* %arrayidx3.9, align 1, !tbaa !2
  %conv4.9 = zext i8 %39 to i32
  %shl5.9 = shl nuw nsw i32 %conv4.9, 16
  %or.9 = or i32 %shl5.9, %shl.9
  %arrayidx8.9 = getelementptr inbounds i8, i8* %block, i32 38
  %40 = load i8, i8* %arrayidx8.9, align 1, !tbaa !2
  %conv9.9 = zext i8 %40 to i32
  %shl10.9 = shl nuw nsw i32 %conv9.9, 8
  %or11.9 = or i32 %or.9, %shl10.9
  %arrayidx14.9 = getelementptr inbounds i8, i8* %block, i32 39
  %41 = load i8, i8* %arrayidx14.9, align 1, !tbaa !2
  %conv15.9 = zext i8 %41 to i32
  %or16.9 = or i32 %or11.9, %conv15.9
  %arrayidx17.9 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 9
  store i32 %or16.9, i32* %arrayidx17.9, align 4, !tbaa !5
  %add.ptr.10 = getelementptr inbounds i8, i8* %block, i32 40
  %42 = load i8, i8* %add.ptr.10, align 1, !tbaa !2
  %conv.10 = zext i8 %42 to i32
  %shl.10 = shl nuw i32 %conv.10, 24
  %arrayidx3.10 = getelementptr inbounds i8, i8* %block, i32 41
  %43 = load i8, i8* %arrayidx3.10, align 1, !tbaa !2
  %conv4.10 = zext i8 %43 to i32
  %shl5.10 = shl nuw nsw i32 %conv4.10, 16
  %or.10 = or i32 %shl5.10, %shl.10
  %arrayidx8.10 = getelementptr inbounds i8, i8* %block, i32 42
  %44 = load i8, i8* %arrayidx8.10, align 1, !tbaa !2
  %conv9.10 = zext i8 %44 to i32
  %shl10.10 = shl nuw nsw i32 %conv9.10, 8
  %or11.10 = or i32 %or.10, %shl10.10
  %arrayidx14.10 = getelementptr inbounds i8, i8* %block, i32 43
  %45 = load i8, i8* %arrayidx14.10, align 1, !tbaa !2
  %conv15.10 = zext i8 %45 to i32
  %or16.10 = or i32 %or11.10, %conv15.10
  %arrayidx17.10 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 10
  store i32 %or16.10, i32* %arrayidx17.10, align 8, !tbaa !5
  %add.ptr.11 = getelementptr inbounds i8, i8* %block, i32 44
  %46 = load i8, i8* %add.ptr.11, align 1, !tbaa !2
  %conv.11 = zext i8 %46 to i32
  %shl.11 = shl nuw i32 %conv.11, 24
  %arrayidx3.11 = getelementptr inbounds i8, i8* %block, i32 45
  %47 = load i8, i8* %arrayidx3.11, align 1, !tbaa !2
  %conv4.11 = zext i8 %47 to i32
  %shl5.11 = shl nuw nsw i32 %conv4.11, 16
  %or.11 = or i32 %shl5.11, %shl.11
  %arrayidx8.11 = getelementptr inbounds i8, i8* %block, i32 46
  %48 = load i8, i8* %arrayidx8.11, align 1, !tbaa !2
  %conv9.11 = zext i8 %48 to i32
  %shl10.11 = shl nuw nsw i32 %conv9.11, 8
  %or11.11 = or i32 %or.11, %shl10.11
  %arrayidx14.11 = getelementptr inbounds i8, i8* %block, i32 47
  %49 = load i8, i8* %arrayidx14.11, align 1, !tbaa !2
  %conv15.11 = zext i8 %49 to i32
  %or16.11 = or i32 %or11.11, %conv15.11
  %arrayidx17.11 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 11
  store i32 %or16.11, i32* %arrayidx17.11, align 4, !tbaa !5
  %add.ptr.12 = getelementptr inbounds i8, i8* %block, i32 48
  %50 = load i8, i8* %add.ptr.12, align 1, !tbaa !2
  %conv.12 = zext i8 %50 to i32
  %shl.12 = shl nuw i32 %conv.12, 24
  %arrayidx3.12 = getelementptr inbounds i8, i8* %block, i32 49
  %51 = load i8, i8* %arrayidx3.12, align 1, !tbaa !2
  %conv4.12 = zext i8 %51 to i32
  %shl5.12 = shl nuw nsw i32 %conv4.12, 16
  %or.12 = or i32 %shl5.12, %shl.12
  %arrayidx8.12 = getelementptr inbounds i8, i8* %block, i32 50
  %52 = load i8, i8* %arrayidx8.12, align 1, !tbaa !2
  %conv9.12 = zext i8 %52 to i32
  %shl10.12 = shl nuw nsw i32 %conv9.12, 8
  %or11.12 = or i32 %or.12, %shl10.12
  %arrayidx14.12 = getelementptr inbounds i8, i8* %block, i32 51
  %53 = load i8, i8* %arrayidx14.12, align 1, !tbaa !2
  %conv15.12 = zext i8 %53 to i32
  %or16.12 = or i32 %or11.12, %conv15.12
  %arrayidx17.12 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 12
  store i32 %or16.12, i32* %arrayidx17.12, align 16, !tbaa !5
  %add.ptr.13 = getelementptr inbounds i8, i8* %block, i32 52
  %54 = load i8, i8* %add.ptr.13, align 1, !tbaa !2
  %conv.13 = zext i8 %54 to i32
  %shl.13 = shl nuw i32 %conv.13, 24
  %arrayidx3.13 = getelementptr inbounds i8, i8* %block, i32 53
  %55 = load i8, i8* %arrayidx3.13, align 1, !tbaa !2
  %conv4.13 = zext i8 %55 to i32
  %shl5.13 = shl nuw nsw i32 %conv4.13, 16
  %or.13 = or i32 %shl5.13, %shl.13
  %arrayidx8.13 = getelementptr inbounds i8, i8* %block, i32 54
  %56 = load i8, i8* %arrayidx8.13, align 1, !tbaa !2
  %conv9.13 = zext i8 %56 to i32
  %shl10.13 = shl nuw nsw i32 %conv9.13, 8
  %or11.13 = or i32 %or.13, %shl10.13
  %arrayidx14.13 = getelementptr inbounds i8, i8* %block, i32 55
  %57 = load i8, i8* %arrayidx14.13, align 1, !tbaa !2
  %conv15.13 = zext i8 %57 to i32
  %or16.13 = or i32 %or11.13, %conv15.13
  %arrayidx17.13 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 13
  store i32 %or16.13, i32* %arrayidx17.13, align 4, !tbaa !5
  %add.ptr.14 = getelementptr inbounds i8, i8* %block, i32 56
  %58 = load i8, i8* %add.ptr.14, align 1, !tbaa !2
  %conv.14 = zext i8 %58 to i32
  %shl.14 = shl nuw i32 %conv.14, 24
  %arrayidx3.14 = getelementptr inbounds i8, i8* %block, i32 57
  %59 = load i8, i8* %arrayidx3.14, align 1, !tbaa !2
  %conv4.14 = zext i8 %59 to i32
  %shl5.14 = shl nuw nsw i32 %conv4.14, 16
  %or.14 = or i32 %shl5.14, %shl.14
  %arrayidx8.14 = getelementptr inbounds i8, i8* %block, i32 58
  %60 = load i8, i8* %arrayidx8.14, align 1, !tbaa !2
  %conv9.14 = zext i8 %60 to i32
  %shl10.14 = shl nuw nsw i32 %conv9.14, 8
  %or11.14 = or i32 %or.14, %shl10.14
  %arrayidx14.14 = getelementptr inbounds i8, i8* %block, i32 59
  %61 = load i8, i8* %arrayidx14.14, align 1, !tbaa !2
  %conv15.14 = zext i8 %61 to i32
  %or16.14 = or i32 %or11.14, %conv15.14
  %arrayidx17.14 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 14
  store i32 %or16.14, i32* %arrayidx17.14, align 8, !tbaa !5
  %add.ptr.15 = getelementptr inbounds i8, i8* %block, i32 60
  %62 = load i8, i8* %add.ptr.15, align 1, !tbaa !2
  %conv.15 = zext i8 %62 to i32
  %shl.15 = shl nuw i32 %conv.15, 24
  %arrayidx3.15 = getelementptr inbounds i8, i8* %block, i32 61
  %63 = load i8, i8* %arrayidx3.15, align 1, !tbaa !2
  %conv4.15 = zext i8 %63 to i32
  %shl5.15 = shl nuw nsw i32 %conv4.15, 16
  %or.15 = or i32 %shl5.15, %shl.15
  %arrayidx8.15 = getelementptr inbounds i8, i8* %block, i32 62
  %64 = load i8, i8* %arrayidx8.15, align 1, !tbaa !2
  %conv9.15 = zext i8 %64 to i32
  %shl10.15 = shl nuw nsw i32 %conv9.15, 8
  %or11.15 = or i32 %or.15, %shl10.15
  %arrayidx14.15 = getelementptr inbounds i8, i8* %block, i32 63
  %65 = load i8, i8* %arrayidx14.15, align 1, !tbaa !2
  %conv15.15 = zext i8 %65 to i32
  %or16.15 = or i32 %or11.15, %conv15.15
  %arrayidx17.15 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 15
  store i32 %or16.15, i32* %arrayidx17.15, align 4, !tbaa !5
  %S755 = bitcast %struct.state* %S to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 dereferenceable(32) %0, i8* nonnull align 4 dereferenceable(32) %S755, i32 32, i1 false)
  %arrayidx27 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 1, i32 0
  %66 = load i32, i32* %arrayidx27, align 4, !tbaa !5
  %xor = xor i32 %66, 608135816
  %arrayidx28 = getelementptr inbounds [16 x i32], [16 x i32]* %v, i32 0, i32 8
  store i32 %xor, i32* %arrayidx28, align 16, !tbaa !5
  %arrayidx30 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 1, i32 1
  %67 = load i32, i32* %arrayidx30, align 4, !tbaa !5
  %xor31 = xor i32 %67, -2052912941
  %arrayidx32 = getelementptr inbounds [16 x i32], [16 x i32]* %v, i32 0, i32 9
  store i32 %xor31, i32* %arrayidx32, align 4, !tbaa !5
  %arrayidx34 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 1, i32 2
  %68 = load i32, i32* %arrayidx34, align 4, !tbaa !5
  %xor35 = xor i32 %68, 320440878
  %arrayidx36 = getelementptr inbounds [16 x i32], [16 x i32]* %v, i32 0, i32 10
  store i32 %xor35, i32* %arrayidx36, align 8, !tbaa !5
  %arrayidx38 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 1, i32 3
  %69 = load i32, i32* %arrayidx38, align 4, !tbaa !5
  %xor39 = xor i32 %69, 57701188
  %arrayidx40 = getelementptr inbounds [16 x i32], [16 x i32]* %v, i32 0, i32 11
  store i32 %xor39, i32* %arrayidx40, align 4, !tbaa !5
  %arrayidx41 = getelementptr inbounds [16 x i32], [16 x i32]* %v, i32 0, i32 12
  store i32 -1542899678, i32* %arrayidx41, align 16, !tbaa !5
  %arrayidx42 = getelementptr inbounds [16 x i32], [16 x i32]* %v, i32 0, i32 13
  store i32 698298832, i32* %arrayidx42, align 4, !tbaa !5
  %arrayidx43 = getelementptr inbounds [16 x i32], [16 x i32]* %v, i32 0, i32 14
  store i32 137296536, i32* %arrayidx43, align 8, !tbaa !5
  %arrayidx44 = getelementptr inbounds [16 x i32], [16 x i32]* %v, i32 0, i32 15
  store i32 -330404727, i32* %arrayidx44, align 4, !tbaa !5
  %nullt = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 4
  %70 = load i32, i32* %nullt, align 4, !tbaa !7
  %cmp45 = icmp eq i32 %70, 0
  br i1 %cmp45, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %arrayidx47 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 2, i32 0
  %71 = load i32, i32* %arrayidx47, align 4, !tbaa !5
  %xor49 = xor i32 %71, -1542899678
  store i32 %xor49, i32* %arrayidx41, align 16, !tbaa !5
  %xor53 = xor i32 %71, 698298832
  store i32 %xor53, i32* %arrayidx42, align 4, !tbaa !5
  %arrayidx55 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 2, i32 1
  %72 = load i32, i32* %arrayidx55, align 4, !tbaa !5
  %xor57 = xor i32 %72, 137296536
  store i32 %xor57, i32* %arrayidx43, align 8, !tbaa !5
  %xor61 = xor i32 %72, -330404727
  store i32 %xor61, i32* %arrayidx44, align 4, !tbaa !5
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %arrayidx44.promoted = phi i32 [ %xor61, %if.then ], [ -330404727, %entry ]
  %arrayidx43.promoted = phi i32 [ %xor57, %if.then ], [ 137296536, %entry ]
  %arrayidx42.promoted = phi i32 [ %xor53, %if.then ], [ 698298832, %entry ]
  %arrayidx41.promoted = phi i32 [ %xor49, %if.then ], [ -1542899678, %entry ]
  %arrayidx74 = getelementptr inbounds [16 x i32], [16 x i32]* %v, i32 0, i32 4
  %arrayidx75 = getelementptr inbounds [16 x i32], [16 x i32]* %v, i32 0, i32 0
  %arrayidx144 = getelementptr inbounds [16 x i32], [16 x i32]* %v, i32 0, i32 5
  %arrayidx146 = getelementptr inbounds [16 x i32], [16 x i32]* %v, i32 0, i32 1
  %arrayidx216 = getelementptr inbounds [16 x i32], [16 x i32]* %v, i32 0, i32 6
  %arrayidx218 = getelementptr inbounds [16 x i32], [16 x i32]* %v, i32 0, i32 2
  %arrayidx288 = getelementptr inbounds [16 x i32], [16 x i32]* %v, i32 0, i32 7
  %arrayidx290 = getelementptr inbounds [16 x i32], [16 x i32]* %v, i32 0, i32 3
  %arrayidx74.promoted = load i32, i32* %arrayidx74, align 16, !tbaa !5
  %arrayidx75.promoted = load i32, i32* %arrayidx75, align 16, !tbaa !5
  %arrayidx144.promoted = load i32, i32* %arrayidx144, align 4, !tbaa !5
  %arrayidx146.promoted = load i32, i32* %arrayidx146, align 4, !tbaa !5
  %arrayidx216.promoted = load i32, i32* %arrayidx216, align 8, !tbaa !5
  %arrayidx218.promoted = load i32, i32* %arrayidx218, align 8, !tbaa !5
  %arrayidx288.promoted = load i32, i32* %arrayidx288, align 4, !tbaa !5
  %arrayidx290.promoted = load i32, i32* %arrayidx290, align 4, !tbaa !5
  br label %for.body65

for.cond642.preheader:                            ; preds = %for.body65
  %arrayidx648 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 0
  %73 = load i32, i32* %arrayidx648, align 4, !tbaa !5
  %xor649 = xor i32 %73, %add543
  %arrayidx648.1 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 1
  %74 = load i32, i32* %arrayidx648.1, align 4, !tbaa !5
  %xor649.1 = xor i32 %74, %add615
  %arrayidx648.2 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 2
  %75 = load i32, i32* %arrayidx648.2, align 4, !tbaa !5
  %xor649.2 = xor i32 %75, %add471
  %arrayidx648.3 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 3
  %76 = load i32, i32* %arrayidx648.3, align 4, !tbaa !5
  %xor649.3 = xor i32 %76, %add399
  %arrayidx648.4 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 4
  %77 = load i32, i32* %arrayidx648.4, align 4, !tbaa !5
  %xor649.4 = xor i32 %77, %or421
  %arrayidx648.5 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 5
  %78 = load i32, i32* %arrayidx648.5, align 4, !tbaa !5
  %xor649.5 = xor i32 %78, %or565
  %arrayidx648.6 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 6
  %79 = load i32, i32* %arrayidx648.6, align 4, !tbaa !5
  %xor649.6 = xor i32 %79, %or637
  %arrayidx648.7 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 7
  %80 = load i32, i32* %arrayidx648.7, align 4, !tbaa !5
  %xor649.7 = xor i32 %80, %or493
  %xor649.8 = xor i32 %xor649, %add484
  %xor649.9 = xor i32 %xor649.1, %add412
  %xor649.10 = xor i32 %xor649.2, %add556
  %xor649.11 = xor i32 %xor649.3, %add628
  %xor649.12 = xor i32 %xor649.4, %or624
  %xor649.13 = xor i32 %xor649.5, %or480
  %xor649.14 = xor i32 %xor649.6, %or408
  %xor649.15 = xor i32 %xor649.7, %or552
  %81 = load i32, i32* %arrayidx27, align 4, !tbaa !5
  %xor662 = xor i32 %xor649.8, %81
  store i32 %xor662, i32* %arrayidx648, align 4, !tbaa !5
  %82 = load i32, i32* %arrayidx30, align 4, !tbaa !5
  %xor662.1 = xor i32 %xor649.9, %82
  store i32 %xor662.1, i32* %arrayidx648.1, align 4, !tbaa !5
  %83 = load i32, i32* %arrayidx34, align 4, !tbaa !5
  %xor662.2 = xor i32 %xor649.10, %83
  store i32 %xor662.2, i32* %arrayidx648.2, align 4, !tbaa !5
  %84 = load i32, i32* %arrayidx38, align 4, !tbaa !5
  %xor662.3 = xor i32 %xor649.11, %84
  store i32 %xor662.3, i32* %arrayidx648.3, align 4, !tbaa !5
  %xor662.4 = xor i32 %xor649.12, %81
  store i32 %xor662.4, i32* %arrayidx648.4, align 4, !tbaa !5
  %xor662.5 = xor i32 %xor649.13, %82
  store i32 %xor662.5, i32* %arrayidx648.5, align 4, !tbaa !5
  %xor662.6 = xor i32 %xor649.14, %83
  store i32 %xor662.6, i32* %arrayidx648.6, align 4, !tbaa !5
  %xor662.7 = xor i32 %xor649.15, %84
  store i32 %xor662.7, i32* %arrayidx648.7, align 4, !tbaa !5
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %1) #3
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %0) #3
  ret void

for.body65:                                       ; preds = %for.body65, %if.end
  %add628753 = phi i32 [ %xor39, %if.end ], [ %add628, %for.body65 ]
  %or552752 = phi i32 [ %arrayidx44.promoted, %if.end ], [ %or552, %for.body65 ]
  %add399751 = phi i32 [ %arrayidx290.promoted, %if.end ], [ %add399, %for.body65 ]
  %or493750 = phi i32 [ %arrayidx288.promoted, %if.end ], [ %or493, %for.body65 ]
  %add556749 = phi i32 [ %xor35, %if.end ], [ %add556, %for.body65 ]
  %or408748 = phi i32 [ %arrayidx43.promoted, %if.end ], [ %or408, %for.body65 ]
  %add471747 = phi i32 [ %arrayidx218.promoted, %if.end ], [ %add471, %for.body65 ]
  %or637746 = phi i32 [ %arrayidx216.promoted, %if.end ], [ %or637, %for.body65 ]
  %add412745 = phi i32 [ %xor31, %if.end ], [ %add412, %for.body65 ]
  %or480744 = phi i32 [ %arrayidx42.promoted, %if.end ], [ %or480, %for.body65 ]
  %add615743 = phi i32 [ %arrayidx146.promoted, %if.end ], [ %add615, %for.body65 ]
  %or565742 = phi i32 [ %arrayidx144.promoted, %if.end ], [ %or565, %for.body65 ]
  %add484741 = phi i32 [ %xor, %if.end ], [ %add484, %for.body65 ]
  %or624740 = phi i32 [ %arrayidx41.promoted, %if.end ], [ %or624, %for.body65 ]
  %add543739 = phi i32 [ %arrayidx75.promoted, %if.end ], [ %add543, %for.body65 ]
  %or421738 = phi i32 [ %arrayidx74.promoted, %if.end ], [ %or421, %for.body65 ]
  %i.2735 = phi i32 [ 0, %if.end ], [ %inc640, %for.body65 ]
  %arrayidx67 = getelementptr inbounds [14 x [16 x i8]], [14 x [16 x i8]]* @sigma, i32 0, i32 %i.2735, i32 0
  %85 = load i8, i8* %arrayidx67, align 16, !tbaa !2
  %idxprom = zext i8 %85 to i32
  %arrayidx68 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 %idxprom
  %86 = load i32, i32* %arrayidx68, align 4, !tbaa !5
  %arrayidx70 = getelementptr inbounds [14 x [16 x i8]], [14 x [16 x i8]]* @sigma, i32 0, i32 %i.2735, i32 1
  %87 = load i8, i8* %arrayidx70, align 1, !tbaa !2
  %idxprom71 = zext i8 %87 to i32
  %arrayidx72 = getelementptr inbounds [16 x i32], [16 x i32]* @cst, i32 0, i32 %idxprom71
  %88 = load i32, i32* %arrayidx72, align 4, !tbaa !5
  %xor73 = xor i32 %88, %86
  %add = add i32 %xor73, %or421738
  %add76 = add i32 %add, %add543739
  %xor79 = xor i32 %or624740, %add76
  %shl80 = shl i32 %xor79, 16
  %shr = lshr i32 %xor79, 16
  %or84 = or i32 %shl80, %shr
  %add88 = add i32 %or84, %add484741
  %xor91 = xor i32 %add88, %or421738
  %shl92 = shl i32 %xor91, 20
  %shr96 = lshr i32 %xor91, 12
  %or97 = or i32 %shl92, %shr96
  %arrayidx102 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 %idxprom71
  %89 = load i32, i32* %arrayidx102, align 4, !tbaa !5
  %arrayidx106 = getelementptr inbounds [16 x i32], [16 x i32]* @cst, i32 0, i32 %idxprom
  %90 = load i32, i32* %arrayidx106, align 4, !tbaa !5
  %xor107 = xor i32 %90, %89
  %add109 = add i32 %or97, %add76
  %add111 = add i32 %add109, %xor107
  %xor114 = xor i32 %add111, %or84
  %shl115 = shl i32 %xor114, 24
  %shr119 = lshr i32 %xor114, 8
  %or120 = or i32 %shl115, %shr119
  %add124 = add i32 %or120, %add88
  %xor127 = xor i32 %add124, %or97
  %shl128 = shl i32 %xor127, 25
  %shr132 = lshr i32 %xor127, 7
  %or133 = or i32 %shl128, %shr132
  %arrayidx136 = getelementptr inbounds [14 x [16 x i8]], [14 x [16 x i8]]* @sigma, i32 0, i32 %i.2735, i32 2
  %91 = load i8, i8* %arrayidx136, align 2, !tbaa !2
  %idxprom137 = zext i8 %91 to i32
  %arrayidx138 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 %idxprom137
  %92 = load i32, i32* %arrayidx138, align 4, !tbaa !5
  %arrayidx140 = getelementptr inbounds [14 x [16 x i8]], [14 x [16 x i8]]* @sigma, i32 0, i32 %i.2735, i32 3
  %93 = load i8, i8* %arrayidx140, align 1, !tbaa !2
  %idxprom141 = zext i8 %93 to i32
  %arrayidx142 = getelementptr inbounds [16 x i32], [16 x i32]* @cst, i32 0, i32 %idxprom141
  %94 = load i32, i32* %arrayidx142, align 4, !tbaa !5
  %xor143 = xor i32 %94, %92
  %add145 = add i32 %xor143, %or565742
  %add147 = add i32 %add145, %add615743
  %xor150 = xor i32 %or480744, %add147
  %shl151 = shl i32 %xor150, 16
  %shr155 = lshr i32 %xor150, 16
  %or156 = or i32 %shl151, %shr155
  %add160 = add i32 %or156, %add412745
  %xor163 = xor i32 %add160, %or565742
  %shl164 = shl i32 %xor163, 20
  %shr168 = lshr i32 %xor163, 12
  %or169 = or i32 %shl164, %shr168
  %arrayidx174 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 %idxprom141
  %95 = load i32, i32* %arrayidx174, align 4, !tbaa !5
  %arrayidx178 = getelementptr inbounds [16 x i32], [16 x i32]* @cst, i32 0, i32 %idxprom137
  %96 = load i32, i32* %arrayidx178, align 4, !tbaa !5
  %xor179 = xor i32 %96, %95
  %add181 = add i32 %or169, %add147
  %add183 = add i32 %add181, %xor179
  %xor186 = xor i32 %add183, %or156
  %shl187 = shl i32 %xor186, 24
  %shr191 = lshr i32 %xor186, 8
  %or192 = or i32 %shl187, %shr191
  %add196 = add i32 %or192, %add160
  %xor199 = xor i32 %add196, %or169
  %shl200 = shl i32 %xor199, 25
  %shr204 = lshr i32 %xor199, 7
  %or205 = or i32 %shl200, %shr204
  %arrayidx208 = getelementptr inbounds [14 x [16 x i8]], [14 x [16 x i8]]* @sigma, i32 0, i32 %i.2735, i32 4
  %97 = load i8, i8* %arrayidx208, align 4, !tbaa !2
  %idxprom209 = zext i8 %97 to i32
  %arrayidx210 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 %idxprom209
  %98 = load i32, i32* %arrayidx210, align 4, !tbaa !5
  %arrayidx212 = getelementptr inbounds [14 x [16 x i8]], [14 x [16 x i8]]* @sigma, i32 0, i32 %i.2735, i32 5
  %99 = load i8, i8* %arrayidx212, align 1, !tbaa !2
  %idxprom213 = zext i8 %99 to i32
  %arrayidx214 = getelementptr inbounds [16 x i32], [16 x i32]* @cst, i32 0, i32 %idxprom213
  %100 = load i32, i32* %arrayidx214, align 4, !tbaa !5
  %xor215 = xor i32 %100, %98
  %add217 = add i32 %xor215, %or637746
  %add219 = add i32 %add217, %add471747
  %xor222 = xor i32 %or408748, %add219
  %shl223 = shl i32 %xor222, 16
  %shr227 = lshr i32 %xor222, 16
  %or228 = or i32 %shl223, %shr227
  %add232 = add i32 %or228, %add556749
  %xor235 = xor i32 %add232, %or637746
  %shl236 = shl i32 %xor235, 20
  %shr240 = lshr i32 %xor235, 12
  %or241 = or i32 %shl236, %shr240
  %arrayidx246 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 %idxprom213
  %101 = load i32, i32* %arrayidx246, align 4, !tbaa !5
  %arrayidx250 = getelementptr inbounds [16 x i32], [16 x i32]* @cst, i32 0, i32 %idxprom209
  %102 = load i32, i32* %arrayidx250, align 4, !tbaa !5
  %xor251 = xor i32 %102, %101
  %add253 = add i32 %or241, %add219
  %add255 = add i32 %add253, %xor251
  %xor258 = xor i32 %add255, %or228
  %shl259 = shl i32 %xor258, 24
  %shr263 = lshr i32 %xor258, 8
  %or264 = or i32 %shl259, %shr263
  %add268 = add i32 %or264, %add232
  %xor271 = xor i32 %add268, %or241
  %shl272 = shl i32 %xor271, 25
  %shr276 = lshr i32 %xor271, 7
  %or277 = or i32 %shl272, %shr276
  %arrayidx280 = getelementptr inbounds [14 x [16 x i8]], [14 x [16 x i8]]* @sigma, i32 0, i32 %i.2735, i32 6
  %103 = load i8, i8* %arrayidx280, align 2, !tbaa !2
  %idxprom281 = zext i8 %103 to i32
  %arrayidx282 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 %idxprom281
  %104 = load i32, i32* %arrayidx282, align 4, !tbaa !5
  %arrayidx284 = getelementptr inbounds [14 x [16 x i8]], [14 x [16 x i8]]* @sigma, i32 0, i32 %i.2735, i32 7
  %105 = load i8, i8* %arrayidx284, align 1, !tbaa !2
  %idxprom285 = zext i8 %105 to i32
  %arrayidx286 = getelementptr inbounds [16 x i32], [16 x i32]* @cst, i32 0, i32 %idxprom285
  %106 = load i32, i32* %arrayidx286, align 4, !tbaa !5
  %xor287 = xor i32 %106, %104
  %add289 = add i32 %xor287, %or493750
  %add291 = add i32 %add289, %add399751
  %xor294 = xor i32 %or552752, %add291
  %shl295 = shl i32 %xor294, 16
  %shr299 = lshr i32 %xor294, 16
  %or300 = or i32 %shl295, %shr299
  %add304 = add i32 %or300, %add628753
  %xor307 = xor i32 %add304, %or493750
  %shl308 = shl i32 %xor307, 20
  %shr312 = lshr i32 %xor307, 12
  %or313 = or i32 %shl308, %shr312
  %arrayidx318 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 %idxprom285
  %107 = load i32, i32* %arrayidx318, align 4, !tbaa !5
  %arrayidx322 = getelementptr inbounds [16 x i32], [16 x i32]* @cst, i32 0, i32 %idxprom281
  %108 = load i32, i32* %arrayidx322, align 4, !tbaa !5
  %xor323 = xor i32 %108, %107
  %add325 = add i32 %or313, %add291
  %add327 = add i32 %add325, %xor323
  %xor330 = xor i32 %add327, %or300
  %shl331 = shl i32 %xor330, 24
  %shr335 = lshr i32 %xor330, 8
  %or336 = or i32 %shl331, %shr335
  %add340 = add i32 %or336, %add304
  %xor343 = xor i32 %add340, %or313
  %shl344 = shl i32 %xor343, 25
  %shr348 = lshr i32 %xor343, 7
  %or349 = or i32 %shl344, %shr348
  %arrayidx352 = getelementptr inbounds [14 x [16 x i8]], [14 x [16 x i8]]* @sigma, i32 0, i32 %i.2735, i32 14
  %109 = load i8, i8* %arrayidx352, align 2, !tbaa !2
  %idxprom353 = zext i8 %109 to i32
  %arrayidx354 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 %idxprom353
  %110 = load i32, i32* %arrayidx354, align 4, !tbaa !5
  %arrayidx356 = getelementptr inbounds [14 x [16 x i8]], [14 x [16 x i8]]* @sigma, i32 0, i32 %i.2735, i32 15
  %111 = load i8, i8* %arrayidx356, align 1, !tbaa !2
  %idxprom357 = zext i8 %111 to i32
  %arrayidx358 = getelementptr inbounds [16 x i32], [16 x i32]* @cst, i32 0, i32 %idxprom357
  %112 = load i32, i32* %arrayidx358, align 4, !tbaa !5
  %xor359 = xor i32 %112, %110
  %add361 = add i32 %add327, %or133
  %add363 = add i32 %add361, %xor359
  %xor366 = xor i32 %add363, %or264
  %shl367 = shl i32 %xor366, 16
  %shr371 = lshr i32 %xor366, 16
  %or372 = or i32 %shl367, %shr371
  %add376 = add i32 %or372, %add196
  %xor379 = xor i32 %add376, %or133
  %shl380 = shl i32 %xor379, 20
  %shr384 = lshr i32 %xor379, 12
  %or385 = or i32 %shl380, %shr384
  %arrayidx390 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 %idxprom357
  %113 = load i32, i32* %arrayidx390, align 4, !tbaa !5
  %arrayidx394 = getelementptr inbounds [16 x i32], [16 x i32]* @cst, i32 0, i32 %idxprom353
  %114 = load i32, i32* %arrayidx394, align 4, !tbaa !5
  %xor395 = xor i32 %114, %113
  %add397 = add i32 %xor395, %add363
  %add399 = add i32 %add397, %or385
  %xor402 = xor i32 %add399, %or372
  %shl403 = shl i32 %xor402, 24
  %shr407 = lshr i32 %xor402, 8
  %or408 = or i32 %shl403, %shr407
  %add412 = add i32 %or408, %add376
  %xor415 = xor i32 %add412, %or385
  %shl416 = shl i32 %xor415, 25
  %shr420 = lshr i32 %xor415, 7
  %or421 = or i32 %shl416, %shr420
  %arrayidx424 = getelementptr inbounds [14 x [16 x i8]], [14 x [16 x i8]]* @sigma, i32 0, i32 %i.2735, i32 12
  %115 = load i8, i8* %arrayidx424, align 4, !tbaa !2
  %idxprom425 = zext i8 %115 to i32
  %arrayidx426 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 %idxprom425
  %116 = load i32, i32* %arrayidx426, align 4, !tbaa !5
  %arrayidx428 = getelementptr inbounds [14 x [16 x i8]], [14 x [16 x i8]]* @sigma, i32 0, i32 %i.2735, i32 13
  %117 = load i8, i8* %arrayidx428, align 1, !tbaa !2
  %idxprom429 = zext i8 %117 to i32
  %arrayidx430 = getelementptr inbounds [16 x i32], [16 x i32]* @cst, i32 0, i32 %idxprom429
  %118 = load i32, i32* %arrayidx430, align 4, !tbaa !5
  %xor431 = xor i32 %118, %116
  %add433 = add i32 %or349, %add255
  %add435 = add i32 %add433, %xor431
  %xor438 = xor i32 %add435, %or192
  %shl439 = shl i32 %xor438, 16
  %shr443 = lshr i32 %xor438, 16
  %or444 = or i32 %shl439, %shr443
  %add448 = add i32 %or444, %add124
  %xor451 = xor i32 %add448, %or349
  %shl452 = shl i32 %xor451, 20
  %shr456 = lshr i32 %xor451, 12
  %or457 = or i32 %shl452, %shr456
  %arrayidx462 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 %idxprom429
  %119 = load i32, i32* %arrayidx462, align 4, !tbaa !5
  %arrayidx466 = getelementptr inbounds [16 x i32], [16 x i32]* @cst, i32 0, i32 %idxprom425
  %120 = load i32, i32* %arrayidx466, align 4, !tbaa !5
  %xor467 = xor i32 %120, %119
  %add469 = add i32 %xor467, %add435
  %add471 = add i32 %add469, %or457
  %xor474 = xor i32 %add471, %or444
  %shl475 = shl i32 %xor474, 24
  %shr479 = lshr i32 %xor474, 8
  %or480 = or i32 %shl475, %shr479
  %add484 = add i32 %or480, %add448
  %xor487 = xor i32 %add484, %or457
  %shl488 = shl i32 %xor487, 25
  %shr492 = lshr i32 %xor487, 7
  %or493 = or i32 %shl488, %shr492
  %arrayidx496 = getelementptr inbounds [14 x [16 x i8]], [14 x [16 x i8]]* @sigma, i32 0, i32 %i.2735, i32 8
  %121 = load i8, i8* %arrayidx496, align 8, !tbaa !2
  %idxprom497 = zext i8 %121 to i32
  %arrayidx498 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 %idxprom497
  %122 = load i32, i32* %arrayidx498, align 4, !tbaa !5
  %arrayidx500 = getelementptr inbounds [14 x [16 x i8]], [14 x [16 x i8]]* @sigma, i32 0, i32 %i.2735, i32 9
  %123 = load i8, i8* %arrayidx500, align 1, !tbaa !2
  %idxprom501 = zext i8 %123 to i32
  %arrayidx502 = getelementptr inbounds [16 x i32], [16 x i32]* @cst, i32 0, i32 %idxprom501
  %124 = load i32, i32* %arrayidx502, align 4, !tbaa !5
  %xor503 = xor i32 %124, %122
  %add505 = add i32 %or205, %add111
  %add507 = add i32 %add505, %xor503
  %xor510 = xor i32 %add507, %or336
  %shl511 = shl i32 %xor510, 16
  %shr515 = lshr i32 %xor510, 16
  %or516 = or i32 %shl511, %shr515
  %add520 = add i32 %or516, %add268
  %xor523 = xor i32 %add520, %or205
  %shl524 = shl i32 %xor523, 20
  %shr528 = lshr i32 %xor523, 12
  %or529 = or i32 %shl524, %shr528
  %arrayidx534 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 %idxprom501
  %125 = load i32, i32* %arrayidx534, align 4, !tbaa !5
  %arrayidx538 = getelementptr inbounds [16 x i32], [16 x i32]* @cst, i32 0, i32 %idxprom497
  %126 = load i32, i32* %arrayidx538, align 4, !tbaa !5
  %xor539 = xor i32 %126, %125
  %add541 = add i32 %xor539, %add507
  %add543 = add i32 %add541, %or529
  %xor546 = xor i32 %add543, %or516
  %shl547 = shl i32 %xor546, 24
  %shr551 = lshr i32 %xor546, 8
  %or552 = or i32 %shl547, %shr551
  %add556 = add i32 %or552, %add520
  %xor559 = xor i32 %add556, %or529
  %shl560 = shl i32 %xor559, 25
  %shr564 = lshr i32 %xor559, 7
  %or565 = or i32 %shl560, %shr564
  %arrayidx568 = getelementptr inbounds [14 x [16 x i8]], [14 x [16 x i8]]* @sigma, i32 0, i32 %i.2735, i32 10
  %127 = load i8, i8* %arrayidx568, align 2, !tbaa !2
  %idxprom569 = zext i8 %127 to i32
  %arrayidx570 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 %idxprom569
  %128 = load i32, i32* %arrayidx570, align 4, !tbaa !5
  %arrayidx572 = getelementptr inbounds [14 x [16 x i8]], [14 x [16 x i8]]* @sigma, i32 0, i32 %i.2735, i32 11
  %129 = load i8, i8* %arrayidx572, align 1, !tbaa !2
  %idxprom573 = zext i8 %129 to i32
  %arrayidx574 = getelementptr inbounds [16 x i32], [16 x i32]* @cst, i32 0, i32 %idxprom573
  %130 = load i32, i32* %arrayidx574, align 4, !tbaa !5
  %xor575 = xor i32 %130, %128
  %add577 = add i32 %or277, %add183
  %add579 = add i32 %add577, %xor575
  %xor582 = xor i32 %add579, %or120
  %shl583 = shl i32 %xor582, 16
  %shr587 = lshr i32 %xor582, 16
  %or588 = or i32 %shl583, %shr587
  %add592 = add i32 %or588, %add340
  %xor595 = xor i32 %add592, %or277
  %shl596 = shl i32 %xor595, 20
  %shr600 = lshr i32 %xor595, 12
  %or601 = or i32 %shl596, %shr600
  %arrayidx606 = getelementptr inbounds [16 x i32], [16 x i32]* %m, i32 0, i32 %idxprom573
  %131 = load i32, i32* %arrayidx606, align 4, !tbaa !5
  %arrayidx610 = getelementptr inbounds [16 x i32], [16 x i32]* @cst, i32 0, i32 %idxprom569
  %132 = load i32, i32* %arrayidx610, align 4, !tbaa !5
  %xor611 = xor i32 %132, %131
  %add613 = add i32 %xor611, %add579
  %add615 = add i32 %add613, %or601
  %xor618 = xor i32 %add615, %or588
  %shl619 = shl i32 %xor618, 24
  %shr623 = lshr i32 %xor618, 8
  %or624 = or i32 %shl619, %shr623
  %add628 = add i32 %or624, %add592
  %xor631 = xor i32 %add628, %or601
  %shl632 = shl i32 %xor631, 25
  %shr636 = lshr i32 %xor631, 7
  %or637 = or i32 %shl632, %shr636
  %inc640 = add nuw nsw i32 %i.2735, 1
  %exitcond = icmp eq i32 %inc640, 14
  br i1 %exitcond, label %for.cond642.preheader, label %for.body65
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree norecurse nounwind writeonly
define hidden void @blake256_init(%struct.state* nocapture %S) local_unnamed_addr #2 {
entry:
  %arrayidx = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 0
  store i32 1779033703, i32* %arrayidx, align 4, !tbaa !5
  %arrayidx2 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 1
  store i32 -1150833019, i32* %arrayidx2, align 4, !tbaa !5
  %arrayidx4 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 2
  store i32 1013904242, i32* %arrayidx4, align 4, !tbaa !5
  %arrayidx6 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 3
  store i32 -1521486534, i32* %arrayidx6, align 4, !tbaa !5
  %arrayidx8 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 4
  store i32 1359893119, i32* %arrayidx8, align 4, !tbaa !5
  %arrayidx10 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 5
  store i32 -1694144372, i32* %arrayidx10, align 4, !tbaa !5
  %arrayidx12 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 6
  store i32 528734635, i32* %arrayidx12, align 4, !tbaa !5
  %arrayidx14 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 7
  store i32 1541459225, i32* %arrayidx14, align 4, !tbaa !5
  %arrayidx24 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 1, i32 0
  %0 = bitcast i32* %arrayidx24 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(32) %0, i8 0, i64 32, i1 false)
  ret void
}

; Function Attrs: nofree norecurse nounwind writeonly
define hidden void @blake224_init(%struct.state* nocapture %S) local_unnamed_addr #2 {
entry:
  %arrayidx = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 0
  store i32 -1056596264, i32* %arrayidx, align 4, !tbaa !5
  %arrayidx2 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 1
  store i32 914150663, i32* %arrayidx2, align 4, !tbaa !5
  %arrayidx4 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 2
  store i32 812702999, i32* %arrayidx4, align 4, !tbaa !5
  %arrayidx6 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 3
  store i32 -150054599, i32* %arrayidx6, align 4, !tbaa !5
  %arrayidx8 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 4
  store i32 -4191439, i32* %arrayidx8, align 4, !tbaa !5
  %arrayidx10 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 5
  store i32 1750603025, i32* %arrayidx10, align 4, !tbaa !5
  %arrayidx12 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 6
  store i32 1694076839, i32* %arrayidx12, align 4, !tbaa !5
  %arrayidx14 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 7
  store i32 -1090891868, i32* %arrayidx14, align 4, !tbaa !5
  %arrayidx24 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 1, i32 0
  %0 = bitcast i32* %arrayidx24 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(32) %0, i8 0, i64 32, i1 false)
  ret void
}

; Function Attrs: nounwind
define hidden void @blake256_update(%struct.state* nocapture %S, i8* nocapture readonly %data, i64 %datalen) local_unnamed_addr #0 {
entry:
  %buflen = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 3
  %0 = load i32, i32* %buflen, align 4, !tbaa !9
  %shr = ashr i32 %0, 3
  %sub = sub nsw i32 64, %shr
  %tobool = icmp eq i32 %shr, 0
  br i1 %tobool, label %if.end15, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %shr1 = lshr i64 %datalen, 3
  %and = and i64 %shr1, 63
  %conv = zext i32 %sub to i64
  %cmp = icmp ult i64 %and, %conv
  br i1 %cmp, label %if.end15, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %arraydecay = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 5, i32 0
  %add.ptr = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 5, i32 %shr
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %add.ptr, i8* align 1 %data, i32 %sub, i1 false)
  %arrayidx = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 2, i32 0
  %1 = load i32, i32* %arrayidx, align 4, !tbaa !5
  %add = add i32 %1, 512
  store i32 %add, i32* %arrayidx, align 4, !tbaa !5
  %cmp5 = icmp eq i32 %add, 0
  br i1 %cmp5, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.then
  %arrayidx9 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 2, i32 1
  %2 = load i32, i32* %arrayidx9, align 4, !tbaa !5
  %inc = add i32 %2, 1
  store i32 %inc, i32* %arrayidx9, align 4, !tbaa !5
  br label %if.end

if.end:                                           ; preds = %if.then7, %if.then
  tail call void @blake256_compress(%struct.state* nonnull %S, i8* nonnull %arraydecay)
  %add.ptr12 = getelementptr inbounds i8, i8* %data, i32 %sub
  %shl = shl i32 %sub, 3
  %conv13 = sext i32 %shl to i64
  %sub14 = sub i64 %datalen, %conv13
  br label %if.end15

if.end15:                                         ; preds = %land.lhs.true, %entry, %if.end
  %datalen.addr.0 = phi i64 [ %sub14, %if.end ], [ %datalen, %land.lhs.true ], [ %datalen, %entry ]
  %left.0 = phi i32 [ 0, %if.end ], [ %shr, %land.lhs.true ], [ 0, %entry ]
  %data.addr.0 = phi i8* [ %add.ptr12, %if.end ], [ %data, %land.lhs.true ], [ %data, %entry ]
  %cmp1679 = icmp ugt i64 %datalen.addr.0, 511
  br i1 %cmp1679, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %if.end15
  %arrayidx19 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 2, i32 0
  %arrayidx27 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 2, i32 1
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %if.end29
  %data.addr.181 = phi i8* [ %data.addr.0, %while.body.lr.ph ], [ %add.ptr30, %if.end29 ]
  %datalen.addr.180 = phi i64 [ %datalen.addr.0, %while.body.lr.ph ], [ %sub31, %if.end29 ]
  %3 = load i32, i32* %arrayidx19, align 4, !tbaa !5
  %add20 = add i32 %3, 512
  store i32 %add20, i32* %arrayidx19, align 4, !tbaa !5
  %cmp23 = icmp eq i32 %add20, 0
  br i1 %cmp23, label %if.then25, label %if.end29

if.then25:                                        ; preds = %while.body
  %4 = load i32, i32* %arrayidx27, align 4, !tbaa !5
  %inc28 = add i32 %4, 1
  store i32 %inc28, i32* %arrayidx27, align 4, !tbaa !5
  br label %if.end29

if.end29:                                         ; preds = %if.then25, %while.body
  tail call void @blake256_compress(%struct.state* nonnull %S, i8* %data.addr.181)
  %add.ptr30 = getelementptr inbounds i8, i8* %data.addr.181, i32 64
  %sub31 = add i64 %datalen.addr.180, -512
  %cmp16 = icmp ugt i64 %sub31, 511
  br i1 %cmp16, label %while.body, label %while.end

while.end:                                        ; preds = %if.end29, %if.end15
  %datalen.addr.1.lcssa = phi i64 [ %datalen.addr.0, %if.end15 ], [ %sub31, %if.end29 ]
  %data.addr.1.lcssa = phi i8* [ %data.addr.0, %if.end15 ], [ %add.ptr30, %if.end29 ]
  %cmp32 = icmp eq i64 %datalen.addr.1.lcssa, 0
  br i1 %cmp32, label %if.end46, label %if.then34

if.then34:                                        ; preds = %while.end
  %add.ptr37 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 5, i32 %left.0
  %shr38 = lshr i64 %datalen.addr.1.lcssa, 3
  %conv39 = trunc i64 %shr38 to i32
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 %add.ptr37, i8* align 1 %data.addr.1.lcssa, i32 %conv39, i1 false)
  %shl40 = shl nsw i32 %left.0, 3
  %5 = trunc i64 %datalen.addr.1.lcssa to i32
  %conv43 = add i32 %shl40, %5
  br label %if.end46

if.end46:                                         ; preds = %while.end, %if.then34
  %storemerge = phi i32 [ %conv43, %if.then34 ], [ 0, %while.end ]
  store i32 %storemerge, i32* %buflen, align 4, !tbaa !9
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #1

; Function Attrs: nounwind
define hidden void @blake224_update(%struct.state* nocapture %S, i8* nocapture readonly %data, i64 %datalen) local_unnamed_addr #0 {
entry:
  tail call void @blake256_update(%struct.state* %S, i8* %data, i64 %datalen)
  ret void
}

; Function Attrs: nounwind
define hidden void @blake256_final_h(%struct.state* nocapture %S, i8* %digest, i8 zeroext %pa, i8 zeroext %pb) local_unnamed_addr #0 {
entry:
  %pa.addr = alloca i8, align 1
  %pb.addr = alloca i8, align 1
  %msglen = alloca [8 x i8], align 1
  store i8 %pa, i8* %pa.addr, align 1, !tbaa !2
  store i8 %pb, i8* %pb.addr, align 1, !tbaa !2
  %0 = getelementptr inbounds [8 x i8], [8 x i8]* %msglen, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #3
  %arrayidx = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 2, i32 0
  %1 = load i32, i32* %arrayidx, align 4, !tbaa !5
  %buflen = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 3
  %2 = load i32, i32* %buflen, align 4, !tbaa !9
  %add = add i32 %2, %1
  %arrayidx2 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 2, i32 1
  %3 = load i32, i32* %arrayidx2, align 4, !tbaa !5
  %cmp = icmp ult i32 %add, %2
  %inc = zext i1 %cmp to i32
  %spec.select = add i32 %3, %inc
  %shr = lshr i32 %spec.select, 24
  %conv = trunc i32 %shr to i8
  store i8 %conv, i8* %0, align 1, !tbaa !2
  %shr5 = lshr i32 %spec.select, 16
  %conv6 = trunc i32 %shr5 to i8
  %arrayidx9 = getelementptr inbounds [8 x i8], [8 x i8]* %msglen, i32 0, i32 1
  store i8 %conv6, i8* %arrayidx9, align 1, !tbaa !2
  %shr10 = lshr i32 %spec.select, 8
  %conv11 = trunc i32 %shr10 to i8
  %arrayidx14 = getelementptr inbounds [8 x i8], [8 x i8]* %msglen, i32 0, i32 2
  store i8 %conv11, i8* %arrayidx14, align 1, !tbaa !2
  %conv15 = trunc i32 %spec.select to i8
  %arrayidx18 = getelementptr inbounds [8 x i8], [8 x i8]* %msglen, i32 0, i32 3
  store i8 %conv15, i8* %arrayidx18, align 1, !tbaa !2
  %shr19 = lshr i32 %add, 24
  %conv20 = trunc i32 %shr19 to i8
  %add.ptr22 = getelementptr inbounds [8 x i8], [8 x i8]* %msglen, i32 0, i32 4
  store i8 %conv20, i8* %add.ptr22, align 1, !tbaa !2
  %shr24 = lshr i32 %add, 16
  %conv25 = trunc i32 %shr24 to i8
  %arrayidx28 = getelementptr inbounds [8 x i8], [8 x i8]* %msglen, i32 0, i32 5
  store i8 %conv25, i8* %arrayidx28, align 1, !tbaa !2
  %shr29 = lshr i32 %add, 8
  %conv30 = trunc i32 %shr29 to i8
  %arrayidx33 = getelementptr inbounds [8 x i8], [8 x i8]* %msglen, i32 0, i32 6
  store i8 %conv30, i8* %arrayidx33, align 1, !tbaa !2
  %conv34 = trunc i32 %add to i8
  %arrayidx37 = getelementptr inbounds [8 x i8], [8 x i8]* %msglen, i32 0, i32 7
  store i8 %conv34, i8* %arrayidx37, align 1, !tbaa !2
  %cmp39 = icmp eq i32 %2, 440
  br i1 %cmp39, label %if.then41, label %if.else

if.then41:                                        ; preds = %entry
  %sub = add i32 %1, -8
  store i32 %sub, i32* %arrayidx, align 4, !tbaa !5
  call void @blake256_update(%struct.state* nonnull %S, i8* nonnull %pa.addr, i64 8)
  %.pre = load i32, i32* %arrayidx, align 4, !tbaa !5
  br label %if.end78

if.else:                                          ; preds = %entry
  %cmp45 = icmp slt i32 %2, 440
  br i1 %cmp45, label %if.then47, label %if.else61

if.then47:                                        ; preds = %if.else
  %cmp49 = icmp eq i32 %2, 0
  br i1 %cmp49, label %if.then51, label %if.end52

if.then51:                                        ; preds = %if.then47
  %nullt = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 4
  store i32 1, i32* %nullt, align 4, !tbaa !7
  br label %if.end52

if.end52:                                         ; preds = %if.then51, %if.then47
  %sub57 = add i32 %add, -440
  store i32 %sub57, i32* %arrayidx, align 4, !tbaa !5
  %sub59 = sub nsw i32 440, %2
  %conv60 = sext i32 %sub59 to i64
  tail call void @blake256_update(%struct.state* nonnull %S, i8* getelementptr inbounds (<{ i8, [63 x i8] }>, <{ i8, [63 x i8] }>* @padding, i32 0, i32 0), i64 %conv60)
  br label %if.end74

if.else61:                                        ; preds = %if.else
  %sub66 = add i32 %add, -512
  store i32 %sub66, i32* %arrayidx, align 4, !tbaa !5
  %sub68 = sub nsw i32 512, %2
  %conv69 = sext i32 %sub68 to i64
  tail call void @blake256_update(%struct.state* nonnull %S, i8* getelementptr inbounds (<{ i8, [63 x i8] }>, <{ i8, [63 x i8] }>* @padding, i32 0, i32 0), i64 %conv69)
  %4 = load i32, i32* %arrayidx, align 4, !tbaa !5
  %sub72 = add i32 %4, -440
  store i32 %sub72, i32* %arrayidx, align 4, !tbaa !5
  tail call void @blake256_update(%struct.state* nonnull %S, i8* getelementptr inbounds (<{ i8, [63 x i8] }>, <{ i8, [63 x i8] }>* @padding, i32 0, i32 1, i32 0), i64 440)
  %nullt73 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 4
  store i32 1, i32* %nullt73, align 4, !tbaa !7
  br label %if.end74

if.end74:                                         ; preds = %if.else61, %if.end52
  call void @blake256_update(%struct.state* nonnull %S, i8* nonnull %pb.addr, i64 8)
  %5 = load i32, i32* %arrayidx, align 4, !tbaa !5
  %sub77 = add i32 %5, -8
  store i32 %sub77, i32* %arrayidx, align 4, !tbaa !5
  br label %if.end78

if.end78:                                         ; preds = %if.end74, %if.then41
  %6 = phi i32 [ %sub77, %if.end74 ], [ %.pre, %if.then41 ]
  %sub81 = add i32 %6, -64
  store i32 %sub81, i32* %arrayidx, align 4, !tbaa !5
  call void @blake256_update(%struct.state* nonnull %S, i8* nonnull %0, i64 64)
  %arrayidx83 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 0
  %7 = load i32, i32* %arrayidx83, align 4, !tbaa !5
  %shr84 = lshr i32 %7, 24
  %conv85 = trunc i32 %shr84 to i8
  store i8 %conv85, i8* %digest, align 1, !tbaa !2
  %8 = load i32, i32* %arrayidx83, align 4, !tbaa !5
  %shr90 = lshr i32 %8, 16
  %conv91 = trunc i32 %shr90 to i8
  %arrayidx93 = getelementptr inbounds i8, i8* %digest, i32 1
  store i8 %conv91, i8* %arrayidx93, align 1, !tbaa !2
  %9 = load i32, i32* %arrayidx83, align 4, !tbaa !5
  %shr96 = lshr i32 %9, 8
  %conv97 = trunc i32 %shr96 to i8
  %arrayidx99 = getelementptr inbounds i8, i8* %digest, i32 2
  store i8 %conv97, i8* %arrayidx99, align 1, !tbaa !2
  %10 = load i32, i32* %arrayidx83, align 4, !tbaa !5
  %conv102 = trunc i32 %10 to i8
  %arrayidx104 = getelementptr inbounds i8, i8* %digest, i32 3
  store i8 %conv102, i8* %arrayidx104, align 1, !tbaa !2
  %arrayidx106 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 1
  %11 = load i32, i32* %arrayidx106, align 4, !tbaa !5
  %shr107 = lshr i32 %11, 24
  %conv108 = trunc i32 %shr107 to i8
  %add.ptr109 = getelementptr inbounds i8, i8* %digest, i32 4
  store i8 %conv108, i8* %add.ptr109, align 1, !tbaa !2
  %12 = load i32, i32* %arrayidx106, align 4, !tbaa !5
  %shr113 = lshr i32 %12, 16
  %conv114 = trunc i32 %shr113 to i8
  %arrayidx116 = getelementptr inbounds i8, i8* %digest, i32 5
  store i8 %conv114, i8* %arrayidx116, align 1, !tbaa !2
  %13 = load i32, i32* %arrayidx106, align 4, !tbaa !5
  %shr119 = lshr i32 %13, 8
  %conv120 = trunc i32 %shr119 to i8
  %arrayidx122 = getelementptr inbounds i8, i8* %digest, i32 6
  store i8 %conv120, i8* %arrayidx122, align 1, !tbaa !2
  %14 = load i32, i32* %arrayidx106, align 4, !tbaa !5
  %conv125 = trunc i32 %14 to i8
  %arrayidx127 = getelementptr inbounds i8, i8* %digest, i32 7
  store i8 %conv125, i8* %arrayidx127, align 1, !tbaa !2
  %arrayidx129 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 2
  %15 = load i32, i32* %arrayidx129, align 4, !tbaa !5
  %shr130 = lshr i32 %15, 24
  %conv131 = trunc i32 %shr130 to i8
  %add.ptr132 = getelementptr inbounds i8, i8* %digest, i32 8
  store i8 %conv131, i8* %add.ptr132, align 1, !tbaa !2
  %16 = load i32, i32* %arrayidx129, align 4, !tbaa !5
  %shr136 = lshr i32 %16, 16
  %conv137 = trunc i32 %shr136 to i8
  %arrayidx139 = getelementptr inbounds i8, i8* %digest, i32 9
  store i8 %conv137, i8* %arrayidx139, align 1, !tbaa !2
  %17 = load i32, i32* %arrayidx129, align 4, !tbaa !5
  %shr142 = lshr i32 %17, 8
  %conv143 = trunc i32 %shr142 to i8
  %arrayidx145 = getelementptr inbounds i8, i8* %digest, i32 10
  store i8 %conv143, i8* %arrayidx145, align 1, !tbaa !2
  %18 = load i32, i32* %arrayidx129, align 4, !tbaa !5
  %conv148 = trunc i32 %18 to i8
  %arrayidx150 = getelementptr inbounds i8, i8* %digest, i32 11
  store i8 %conv148, i8* %arrayidx150, align 1, !tbaa !2
  %arrayidx152 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 3
  %19 = load i32, i32* %arrayidx152, align 4, !tbaa !5
  %shr153 = lshr i32 %19, 24
  %conv154 = trunc i32 %shr153 to i8
  %add.ptr155 = getelementptr inbounds i8, i8* %digest, i32 12
  store i8 %conv154, i8* %add.ptr155, align 1, !tbaa !2
  %20 = load i32, i32* %arrayidx152, align 4, !tbaa !5
  %shr159 = lshr i32 %20, 16
  %conv160 = trunc i32 %shr159 to i8
  %arrayidx162 = getelementptr inbounds i8, i8* %digest, i32 13
  store i8 %conv160, i8* %arrayidx162, align 1, !tbaa !2
  %21 = load i32, i32* %arrayidx152, align 4, !tbaa !5
  %shr165 = lshr i32 %21, 8
  %conv166 = trunc i32 %shr165 to i8
  %arrayidx168 = getelementptr inbounds i8, i8* %digest, i32 14
  store i8 %conv166, i8* %arrayidx168, align 1, !tbaa !2
  %22 = load i32, i32* %arrayidx152, align 4, !tbaa !5
  %conv171 = trunc i32 %22 to i8
  %arrayidx173 = getelementptr inbounds i8, i8* %digest, i32 15
  store i8 %conv171, i8* %arrayidx173, align 1, !tbaa !2
  %arrayidx175 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 4
  %23 = load i32, i32* %arrayidx175, align 4, !tbaa !5
  %shr176 = lshr i32 %23, 24
  %conv177 = trunc i32 %shr176 to i8
  %add.ptr178 = getelementptr inbounds i8, i8* %digest, i32 16
  store i8 %conv177, i8* %add.ptr178, align 1, !tbaa !2
  %24 = load i32, i32* %arrayidx175, align 4, !tbaa !5
  %shr182 = lshr i32 %24, 16
  %conv183 = trunc i32 %shr182 to i8
  %arrayidx185 = getelementptr inbounds i8, i8* %digest, i32 17
  store i8 %conv183, i8* %arrayidx185, align 1, !tbaa !2
  %25 = load i32, i32* %arrayidx175, align 4, !tbaa !5
  %shr188 = lshr i32 %25, 8
  %conv189 = trunc i32 %shr188 to i8
  %arrayidx191 = getelementptr inbounds i8, i8* %digest, i32 18
  store i8 %conv189, i8* %arrayidx191, align 1, !tbaa !2
  %26 = load i32, i32* %arrayidx175, align 4, !tbaa !5
  %conv194 = trunc i32 %26 to i8
  %arrayidx196 = getelementptr inbounds i8, i8* %digest, i32 19
  store i8 %conv194, i8* %arrayidx196, align 1, !tbaa !2
  %arrayidx198 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 5
  %27 = load i32, i32* %arrayidx198, align 4, !tbaa !5
  %shr199 = lshr i32 %27, 24
  %conv200 = trunc i32 %shr199 to i8
  %add.ptr201 = getelementptr inbounds i8, i8* %digest, i32 20
  store i8 %conv200, i8* %add.ptr201, align 1, !tbaa !2
  %28 = load i32, i32* %arrayidx198, align 4, !tbaa !5
  %shr205 = lshr i32 %28, 16
  %conv206 = trunc i32 %shr205 to i8
  %arrayidx208 = getelementptr inbounds i8, i8* %digest, i32 21
  store i8 %conv206, i8* %arrayidx208, align 1, !tbaa !2
  %29 = load i32, i32* %arrayidx198, align 4, !tbaa !5
  %shr211 = lshr i32 %29, 8
  %conv212 = trunc i32 %shr211 to i8
  %arrayidx214 = getelementptr inbounds i8, i8* %digest, i32 22
  store i8 %conv212, i8* %arrayidx214, align 1, !tbaa !2
  %30 = load i32, i32* %arrayidx198, align 4, !tbaa !5
  %conv217 = trunc i32 %30 to i8
  %arrayidx219 = getelementptr inbounds i8, i8* %digest, i32 23
  store i8 %conv217, i8* %arrayidx219, align 1, !tbaa !2
  %arrayidx221 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 6
  %31 = load i32, i32* %arrayidx221, align 4, !tbaa !5
  %shr222 = lshr i32 %31, 24
  %conv223 = trunc i32 %shr222 to i8
  %add.ptr224 = getelementptr inbounds i8, i8* %digest, i32 24
  store i8 %conv223, i8* %add.ptr224, align 1, !tbaa !2
  %32 = load i32, i32* %arrayidx221, align 4, !tbaa !5
  %shr228 = lshr i32 %32, 16
  %conv229 = trunc i32 %shr228 to i8
  %arrayidx231 = getelementptr inbounds i8, i8* %digest, i32 25
  store i8 %conv229, i8* %arrayidx231, align 1, !tbaa !2
  %33 = load i32, i32* %arrayidx221, align 4, !tbaa !5
  %shr234 = lshr i32 %33, 8
  %conv235 = trunc i32 %shr234 to i8
  %arrayidx237 = getelementptr inbounds i8, i8* %digest, i32 26
  store i8 %conv235, i8* %arrayidx237, align 1, !tbaa !2
  %34 = load i32, i32* %arrayidx221, align 4, !tbaa !5
  %conv240 = trunc i32 %34 to i8
  %arrayidx242 = getelementptr inbounds i8, i8* %digest, i32 27
  store i8 %conv240, i8* %arrayidx242, align 1, !tbaa !2
  %arrayidx244 = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 7
  %35 = load i32, i32* %arrayidx244, align 4, !tbaa !5
  %shr245 = lshr i32 %35, 24
  %conv246 = trunc i32 %shr245 to i8
  %add.ptr247 = getelementptr inbounds i8, i8* %digest, i32 28
  store i8 %conv246, i8* %add.ptr247, align 1, !tbaa !2
  %36 = load i32, i32* %arrayidx244, align 4, !tbaa !5
  %shr251 = lshr i32 %36, 16
  %conv252 = trunc i32 %shr251 to i8
  %arrayidx254 = getelementptr inbounds i8, i8* %digest, i32 29
  store i8 %conv252, i8* %arrayidx254, align 1, !tbaa !2
  %37 = load i32, i32* %arrayidx244, align 4, !tbaa !5
  %shr257 = lshr i32 %37, 8
  %conv258 = trunc i32 %shr257 to i8
  %arrayidx260 = getelementptr inbounds i8, i8* %digest, i32 30
  store i8 %conv258, i8* %arrayidx260, align 1, !tbaa !2
  %38 = load i32, i32* %arrayidx244, align 4, !tbaa !5
  %conv263 = trunc i32 %38 to i8
  %arrayidx265 = getelementptr inbounds i8, i8* %digest, i32 31
  store i8 %conv263, i8* %arrayidx265, align 1, !tbaa !2
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #3
  ret void
}

; Function Attrs: nounwind
define hidden void @blake256_final(%struct.state* nocapture %S, i8* %digest) local_unnamed_addr #0 {
entry:
  tail call void @blake256_final_h(%struct.state* %S, i8* %digest, i8 zeroext -127, i8 zeroext 1)
  ret void
}

; Function Attrs: nounwind
define hidden void @blake224_final(%struct.state* nocapture %S, i8* %digest) local_unnamed_addr #0 {
entry:
  tail call void @blake256_final_h(%struct.state* %S, i8* %digest, i8 zeroext -128, i8 zeroext 0)
  ret void
}

; Function Attrs: nounwind
define hidden void @blake256_hash(i8* %out, i8* nocapture readonly %in, i64 %inlen) local_unnamed_addr #0 {
entry:
  %S = alloca %struct.state, align 4
  %0 = bitcast %struct.state* %S to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %0) #3
  %arrayidx.i = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 0
  store i32 1779033703, i32* %arrayidx.i, align 4, !tbaa !5
  %arrayidx2.i = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 1
  store i32 -1150833019, i32* %arrayidx2.i, align 4, !tbaa !5
  %arrayidx4.i = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 2
  store i32 1013904242, i32* %arrayidx4.i, align 4, !tbaa !5
  %arrayidx6.i = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 3
  store i32 -1521486534, i32* %arrayidx6.i, align 4, !tbaa !5
  %arrayidx8.i = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 4
  store i32 1359893119, i32* %arrayidx8.i, align 4, !tbaa !5
  %arrayidx10.i = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 5
  store i32 -1694144372, i32* %arrayidx10.i, align 4, !tbaa !5
  %arrayidx12.i = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 6
  store i32 528734635, i32* %arrayidx12.i, align 4, !tbaa !5
  %arrayidx14.i = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 7
  store i32 1541459225, i32* %arrayidx14.i, align 4, !tbaa !5
  %arrayidx24.i = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 1, i32 0
  %1 = bitcast i32* %arrayidx24.i to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(32) %1, i8 0, i64 32, i1 false) #3
  %mul = shl i64 %inlen, 3
  call void @blake256_update(%struct.state* nonnull %S, i8* %in, i64 %mul)
  call void @blake256_final_h(%struct.state* nonnull %S, i8* %out, i8 zeroext -127, i8 zeroext 1) #3
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %0) #3
  ret void
}

; Function Attrs: nounwind
define hidden void @blake(i8* nocapture readonly %input, i64 %len, i8* %output) local_unnamed_addr #0 {
entry:
  %S.i = alloca %struct.state, align 4
  %0 = bitcast %struct.state* %S.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %0) #3
  %arrayidx.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 0
  store i32 1779033703, i32* %arrayidx.i.i, align 4, !tbaa !5
  %arrayidx2.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 1
  store i32 -1150833019, i32* %arrayidx2.i.i, align 4, !tbaa !5
  %arrayidx4.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 2
  store i32 1013904242, i32* %arrayidx4.i.i, align 4, !tbaa !5
  %arrayidx6.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 3
  store i32 -1521486534, i32* %arrayidx6.i.i, align 4, !tbaa !5
  %arrayidx8.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 4
  store i32 1359893119, i32* %arrayidx8.i.i, align 4, !tbaa !5
  %arrayidx10.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 5
  store i32 -1694144372, i32* %arrayidx10.i.i, align 4, !tbaa !5
  %arrayidx12.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 6
  store i32 528734635, i32* %arrayidx12.i.i, align 4, !tbaa !5
  %arrayidx14.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 7
  store i32 1541459225, i32* %arrayidx14.i.i, align 4, !tbaa !5
  %arrayidx24.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 1, i32 0
  %1 = bitcast i32* %arrayidx24.i.i to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(32) %1, i8 0, i64 32, i1 false) #3
  %mul.i = shl i64 %len, 3
  call void @blake256_update(%struct.state* nonnull %S.i, i8* %input, i64 %mul.i) #3
  call void @blake256_final_h(%struct.state* nonnull %S.i, i8* %output, i8 zeroext -127, i8 zeroext 1) #3
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %0) #3
  ret void
}

; Function Attrs: nounwind
define hidden void @blake224_hash(i8* %out, i8* nocapture readonly %in, i64 %inlen) local_unnamed_addr #0 {
entry:
  %S = alloca %struct.state, align 4
  %0 = bitcast %struct.state* %S to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %0) #3
  %arrayidx.i = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 0
  store i32 -1056596264, i32* %arrayidx.i, align 4, !tbaa !5
  %arrayidx2.i = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 1
  store i32 914150663, i32* %arrayidx2.i, align 4, !tbaa !5
  %arrayidx4.i = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 2
  store i32 812702999, i32* %arrayidx4.i, align 4, !tbaa !5
  %arrayidx6.i = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 3
  store i32 -150054599, i32* %arrayidx6.i, align 4, !tbaa !5
  %arrayidx8.i = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 4
  store i32 -4191439, i32* %arrayidx8.i, align 4, !tbaa !5
  %arrayidx10.i = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 5
  store i32 1750603025, i32* %arrayidx10.i, align 4, !tbaa !5
  %arrayidx12.i = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 6
  store i32 1694076839, i32* %arrayidx12.i, align 4, !tbaa !5
  %arrayidx14.i = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 0, i32 7
  store i32 -1090891868, i32* %arrayidx14.i, align 4, !tbaa !5
  %arrayidx24.i = getelementptr inbounds %struct.state, %struct.state* %S, i32 0, i32 1, i32 0
  %1 = bitcast i32* %arrayidx24.i to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(32) %1, i8 0, i64 32, i1 false) #3
  %mul = shl i64 %inlen, 3
  call void @blake256_update(%struct.state* nonnull %S, i8* %in, i64 %mul) #3
  call void @blake256_final_h(%struct.state* nonnull %S, i8* %out, i8 zeroext -128, i8 zeroext 0) #3
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %0) #3
  ret void
}

; Function Attrs: nounwind
define hidden void @hmac_blake256_init(%struct.hmac_state* nocapture %S, i8* nocapture readonly %_key, i64 %keylen) local_unnamed_addr #0 {
entry:
  %S.i = alloca %struct.state, align 4
  %keyhash = alloca [32 x i8], align 16
  %pad = alloca [64 x i8], align 16
  %0 = getelementptr inbounds [32 x i8], [32 x i8]* %keyhash, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %0) #3
  %1 = getelementptr inbounds [64 x i8], [64 x i8]* %pad, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %1) #3
  %cmp = icmp ugt i64 %keylen, 64
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = bitcast %struct.state* %S.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %2) #3
  %arrayidx.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 0
  store i32 1779033703, i32* %arrayidx.i.i, align 4, !tbaa !5
  %arrayidx2.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 1
  store i32 -1150833019, i32* %arrayidx2.i.i, align 4, !tbaa !5
  %arrayidx4.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 2
  store i32 1013904242, i32* %arrayidx4.i.i, align 4, !tbaa !5
  %arrayidx6.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 3
  store i32 -1521486534, i32* %arrayidx6.i.i, align 4, !tbaa !5
  %arrayidx8.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 4
  store i32 1359893119, i32* %arrayidx8.i.i, align 4, !tbaa !5
  %arrayidx10.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 5
  store i32 -1694144372, i32* %arrayidx10.i.i, align 4, !tbaa !5
  %arrayidx12.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 6
  store i32 528734635, i32* %arrayidx12.i.i, align 4, !tbaa !5
  %arrayidx14.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 7
  store i32 1541459225, i32* %arrayidx14.i.i, align 4, !tbaa !5
  %arrayidx24.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 1, i32 0
  %3 = bitcast i32* %arrayidx24.i.i to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(32) %3, i8 0, i64 32, i1 false) #3
  %mul.i = shl i64 %keylen, 3
  call void @blake256_update(%struct.state* nonnull %S.i, i8* %_key, i64 %mul.i) #3
  call void @blake256_final_h(%struct.state* nonnull %S.i, i8* nonnull %0, i8 zeroext -127, i8 zeroext 1) #3
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %2) #3
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %keylen.addr.0 = phi i64 [ 32, %if.then ], [ %keylen, %entry ]
  %key.0 = phi i8* [ %0, %if.then ], [ %_key, %entry ]
  %inner = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0
  %arrayidx.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0, i32 0, i32 0
  store i32 1779033703, i32* %arrayidx.i, align 4, !tbaa !5
  %arrayidx2.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0, i32 0, i32 1
  store i32 -1150833019, i32* %arrayidx2.i, align 4, !tbaa !5
  %arrayidx4.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0, i32 0, i32 2
  store i32 1013904242, i32* %arrayidx4.i, align 4, !tbaa !5
  %arrayidx6.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0, i32 0, i32 3
  store i32 -1521486534, i32* %arrayidx6.i, align 4, !tbaa !5
  %arrayidx8.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0, i32 0, i32 4
  store i32 1359893119, i32* %arrayidx8.i, align 4, !tbaa !5
  %arrayidx10.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0, i32 0, i32 5
  store i32 -1694144372, i32* %arrayidx10.i, align 4, !tbaa !5
  %arrayidx12.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0, i32 0, i32 6
  store i32 528734635, i32* %arrayidx12.i, align 4, !tbaa !5
  %arrayidx14.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0, i32 0, i32 7
  store i32 1541459225, i32* %arrayidx14.i, align 4, !tbaa !5
  %arrayidx24.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0, i32 1, i32 0
  %4 = bitcast i32* %arrayidx24.i to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(32) %4, i8 0, i64 32, i1 false) #3
  call void @llvm.memset.p0i8.i32(i8* nonnull align 16 dereferenceable(64) %1, i8 54, i32 64, i1 false)
  %cmp359 = icmp eq i64 %keylen.addr.0, 0
  br i1 %cmp359, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %if.end
  %5 = load i8, i8* %key.0, align 1, !tbaa !2
  %xor4768 = xor i8 %5, 54
  store i8 %xor4768, i8* %1, align 16, !tbaa !2
  %exitcond6169 = icmp eq i64 %keylen.addr.0, 1
  br i1 %exitcond6169, label %for.end, label %for.body.for.body_crit_edge

for.body.for.body_crit_edge:                      ; preds = %for.body.preheader, %for.body.for.body_crit_edge
  %inc70 = phi i64 [ %inc, %for.body.for.body_crit_edge ], [ 1, %for.body.preheader ]
  %idxprom.phi.trans.insert = trunc i64 %inc70 to i32
  %arrayidx5.phi.trans.insert = getelementptr inbounds [64 x i8], [64 x i8]* %pad, i32 0, i32 %idxprom.phi.trans.insert
  %.pre = load i8, i8* %arrayidx5.phi.trans.insert, align 1, !tbaa !2
  %arrayidx = getelementptr inbounds i8, i8* %key.0, i32 %idxprom.phi.trans.insert
  %6 = load i8, i8* %arrayidx, align 1, !tbaa !2
  %xor47 = xor i8 %.pre, %6
  store i8 %xor47, i8* %arrayidx5.phi.trans.insert, align 1, !tbaa !2
  %inc = add nuw i64 %inc70, 1
  %exitcond61 = icmp eq i64 %inc, %keylen.addr.0
  br i1 %exitcond61, label %for.end, label %for.body.for.body_crit_edge

for.end:                                          ; preds = %for.body.for.body_crit_edge, %for.body.preheader, %if.end
  call void @blake256_update(%struct.state* %inner, i8* nonnull %1, i64 512)
  %outer = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1
  %arrayidx.i48 = getelementptr inbounds %struct.state, %struct.state* %outer, i32 0, i32 0, i32 0
  store i32 1779033703, i32* %arrayidx.i48, align 4, !tbaa !5
  %arrayidx2.i49 = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1, i32 0, i32 1
  store i32 -1150833019, i32* %arrayidx2.i49, align 4, !tbaa !5
  %arrayidx4.i50 = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1, i32 0, i32 2
  store i32 1013904242, i32* %arrayidx4.i50, align 4, !tbaa !5
  %arrayidx6.i51 = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1, i32 0, i32 3
  store i32 -1521486534, i32* %arrayidx6.i51, align 4, !tbaa !5
  %arrayidx8.i52 = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1, i32 0, i32 4
  store i32 1359893119, i32* %arrayidx8.i52, align 4, !tbaa !5
  %arrayidx10.i53 = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1, i32 0, i32 5
  store i32 -1694144372, i32* %arrayidx10.i53, align 4, !tbaa !5
  %arrayidx12.i54 = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1, i32 0, i32 6
  store i32 528734635, i32* %arrayidx12.i54, align 4, !tbaa !5
  %arrayidx14.i55 = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1, i32 0, i32 7
  store i32 1541459225, i32* %arrayidx14.i55, align 4, !tbaa !5
  %arrayidx24.i56 = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1, i32 1, i32 0
  %7 = bitcast i32* %arrayidx24.i56 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(32) %7, i8 0, i64 32, i1 false) #3
  call void @llvm.memset.p0i8.i32(i8* nonnull align 16 dereferenceable(64) %1, i8 92, i32 64, i1 false)
  br i1 %cmp359, label %for.end25, label %for.body14.preheader

for.body14.preheader:                             ; preds = %for.end
  %8 = load i8, i8* %key.0, align 1, !tbaa !2
  %xor214664 = xor i8 %8, 92
  store i8 %xor214664, i8* %1, align 16, !tbaa !2
  %exitcond65 = icmp eq i64 %keylen.addr.0, 1
  br i1 %exitcond65, label %for.end25, label %for.body14.for.body14_crit_edge

for.body14.for.body14_crit_edge:                  ; preds = %for.body14.preheader, %for.body14.for.body14_crit_edge
  %inc2466 = phi i64 [ %inc24, %for.body14.for.body14_crit_edge ], [ 1, %for.body14.preheader ]
  %idxprom15.phi.trans.insert = trunc i64 %inc2466 to i32
  %arrayidx19.phi.trans.insert = getelementptr inbounds [64 x i8], [64 x i8]* %pad, i32 0, i32 %idxprom15.phi.trans.insert
  %.pre62 = load i8, i8* %arrayidx19.phi.trans.insert, align 1, !tbaa !2
  %arrayidx16 = getelementptr inbounds i8, i8* %key.0, i32 %idxprom15.phi.trans.insert
  %9 = load i8, i8* %arrayidx16, align 1, !tbaa !2
  %xor2146 = xor i8 %.pre62, %9
  store i8 %xor2146, i8* %arrayidx19.phi.trans.insert, align 1, !tbaa !2
  %inc24 = add nuw i64 %inc2466, 1
  %exitcond = icmp eq i64 %inc24, %keylen.addr.0
  br i1 %exitcond, label %for.end25, label %for.body14.for.body14_crit_edge

for.end25:                                        ; preds = %for.body14.for.body14_crit_edge, %for.body14.preheader, %for.end
  call void @blake256_update(%struct.state* nonnull %outer, i8* nonnull %1, i64 512)
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %1) #3
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %0) #3
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #1

; Function Attrs: nounwind
define hidden void @hmac_blake224_init(%struct.hmac_state* nocapture %S, i8* nocapture readonly %_key, i64 %keylen) local_unnamed_addr #0 {
entry:
  %S.i = alloca %struct.state, align 4
  %keyhash = alloca [32 x i8], align 16
  %pad = alloca [64 x i8], align 16
  %0 = getelementptr inbounds [32 x i8], [32 x i8]* %keyhash, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %0) #3
  %1 = getelementptr inbounds [64 x i8], [64 x i8]* %pad, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %1) #3
  %cmp = icmp ugt i64 %keylen, 64
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = bitcast %struct.state* %S.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %2) #3
  %arrayidx.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 0
  store i32 1779033703, i32* %arrayidx.i.i, align 4, !tbaa !5
  %arrayidx2.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 1
  store i32 -1150833019, i32* %arrayidx2.i.i, align 4, !tbaa !5
  %arrayidx4.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 2
  store i32 1013904242, i32* %arrayidx4.i.i, align 4, !tbaa !5
  %arrayidx6.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 3
  store i32 -1521486534, i32* %arrayidx6.i.i, align 4, !tbaa !5
  %arrayidx8.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 4
  store i32 1359893119, i32* %arrayidx8.i.i, align 4, !tbaa !5
  %arrayidx10.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 5
  store i32 -1694144372, i32* %arrayidx10.i.i, align 4, !tbaa !5
  %arrayidx12.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 6
  store i32 528734635, i32* %arrayidx12.i.i, align 4, !tbaa !5
  %arrayidx14.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 0, i32 7
  store i32 1541459225, i32* %arrayidx14.i.i, align 4, !tbaa !5
  %arrayidx24.i.i = getelementptr inbounds %struct.state, %struct.state* %S.i, i32 0, i32 1, i32 0
  %3 = bitcast i32* %arrayidx24.i.i to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(32) %3, i8 0, i64 32, i1 false) #3
  %mul.i = shl i64 %keylen, 3
  call void @blake256_update(%struct.state* nonnull %S.i, i8* %_key, i64 %mul.i) #3
  call void @blake256_final_h(%struct.state* nonnull %S.i, i8* nonnull %0, i8 zeroext -127, i8 zeroext 1) #3
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %2) #3
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %keylen.addr.0 = phi i64 [ 28, %if.then ], [ %keylen, %entry ]
  %key.0 = phi i8* [ %0, %if.then ], [ %_key, %entry ]
  %inner = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0
  %arrayidx.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0, i32 0, i32 0
  store i32 -1056596264, i32* %arrayidx.i, align 4, !tbaa !5
  %arrayidx2.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0, i32 0, i32 1
  store i32 914150663, i32* %arrayidx2.i, align 4, !tbaa !5
  %arrayidx4.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0, i32 0, i32 2
  store i32 812702999, i32* %arrayidx4.i, align 4, !tbaa !5
  %arrayidx6.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0, i32 0, i32 3
  store i32 -150054599, i32* %arrayidx6.i, align 4, !tbaa !5
  %arrayidx8.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0, i32 0, i32 4
  store i32 -4191439, i32* %arrayidx8.i, align 4, !tbaa !5
  %arrayidx10.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0, i32 0, i32 5
  store i32 1750603025, i32* %arrayidx10.i, align 4, !tbaa !5
  %arrayidx12.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0, i32 0, i32 6
  store i32 1694076839, i32* %arrayidx12.i, align 4, !tbaa !5
  %arrayidx14.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0, i32 0, i32 7
  store i32 -1090891868, i32* %arrayidx14.i, align 4, !tbaa !5
  %arrayidx24.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0, i32 1, i32 0
  %4 = bitcast i32* %arrayidx24.i to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(32) %4, i8 0, i64 32, i1 false) #3
  call void @llvm.memset.p0i8.i32(i8* nonnull align 16 dereferenceable(64) %1, i8 54, i32 64, i1 false)
  %cmp359 = icmp eq i64 %keylen.addr.0, 0
  br i1 %cmp359, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %if.end
  %5 = load i8, i8* %key.0, align 1, !tbaa !2
  %xor4768 = xor i8 %5, 54
  store i8 %xor4768, i8* %1, align 16, !tbaa !2
  %exitcond6169 = icmp eq i64 %keylen.addr.0, 1
  br i1 %exitcond6169, label %for.end, label %for.body.for.body_crit_edge

for.body.for.body_crit_edge:                      ; preds = %for.body.preheader, %for.body.for.body_crit_edge
  %inc70 = phi i64 [ %inc, %for.body.for.body_crit_edge ], [ 1, %for.body.preheader ]
  %idxprom.phi.trans.insert = trunc i64 %inc70 to i32
  %arrayidx5.phi.trans.insert = getelementptr inbounds [64 x i8], [64 x i8]* %pad, i32 0, i32 %idxprom.phi.trans.insert
  %.pre = load i8, i8* %arrayidx5.phi.trans.insert, align 1, !tbaa !2
  %arrayidx = getelementptr inbounds i8, i8* %key.0, i32 %idxprom.phi.trans.insert
  %6 = load i8, i8* %arrayidx, align 1, !tbaa !2
  %xor47 = xor i8 %.pre, %6
  store i8 %xor47, i8* %arrayidx5.phi.trans.insert, align 1, !tbaa !2
  %inc = add nuw i64 %inc70, 1
  %exitcond61 = icmp eq i64 %inc, %keylen.addr.0
  br i1 %exitcond61, label %for.end, label %for.body.for.body_crit_edge

for.end:                                          ; preds = %for.body.for.body_crit_edge, %for.body.preheader, %if.end
  call void @blake256_update(%struct.state* %inner, i8* nonnull %1, i64 512) #3
  %outer = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1
  %arrayidx.i48 = getelementptr inbounds %struct.state, %struct.state* %outer, i32 0, i32 0, i32 0
  store i32 -1056596264, i32* %arrayidx.i48, align 4, !tbaa !5
  %arrayidx2.i49 = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1, i32 0, i32 1
  store i32 914150663, i32* %arrayidx2.i49, align 4, !tbaa !5
  %arrayidx4.i50 = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1, i32 0, i32 2
  store i32 812702999, i32* %arrayidx4.i50, align 4, !tbaa !5
  %arrayidx6.i51 = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1, i32 0, i32 3
  store i32 -150054599, i32* %arrayidx6.i51, align 4, !tbaa !5
  %arrayidx8.i52 = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1, i32 0, i32 4
  store i32 -4191439, i32* %arrayidx8.i52, align 4, !tbaa !5
  %arrayidx10.i53 = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1, i32 0, i32 5
  store i32 1750603025, i32* %arrayidx10.i53, align 4, !tbaa !5
  %arrayidx12.i54 = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1, i32 0, i32 6
  store i32 1694076839, i32* %arrayidx12.i54, align 4, !tbaa !5
  %arrayidx14.i55 = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1, i32 0, i32 7
  store i32 -1090891868, i32* %arrayidx14.i55, align 4, !tbaa !5
  %arrayidx24.i56 = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1, i32 1, i32 0
  %7 = bitcast i32* %arrayidx24.i56 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(32) %7, i8 0, i64 32, i1 false) #3
  call void @llvm.memset.p0i8.i32(i8* nonnull align 16 dereferenceable(64) %1, i8 92, i32 64, i1 false)
  br i1 %cmp359, label %for.end25, label %for.body14.preheader

for.body14.preheader:                             ; preds = %for.end
  %8 = load i8, i8* %key.0, align 1, !tbaa !2
  %xor214664 = xor i8 %8, 92
  store i8 %xor214664, i8* %1, align 16, !tbaa !2
  %exitcond65 = icmp eq i64 %keylen.addr.0, 1
  br i1 %exitcond65, label %for.end25, label %for.body14.for.body14_crit_edge

for.body14.for.body14_crit_edge:                  ; preds = %for.body14.preheader, %for.body14.for.body14_crit_edge
  %inc2466 = phi i64 [ %inc24, %for.body14.for.body14_crit_edge ], [ 1, %for.body14.preheader ]
  %idxprom15.phi.trans.insert = trunc i64 %inc2466 to i32
  %arrayidx19.phi.trans.insert = getelementptr inbounds [64 x i8], [64 x i8]* %pad, i32 0, i32 %idxprom15.phi.trans.insert
  %.pre62 = load i8, i8* %arrayidx19.phi.trans.insert, align 1, !tbaa !2
  %arrayidx16 = getelementptr inbounds i8, i8* %key.0, i32 %idxprom15.phi.trans.insert
  %9 = load i8, i8* %arrayidx16, align 1, !tbaa !2
  %xor2146 = xor i8 %.pre62, %9
  store i8 %xor2146, i8* %arrayidx19.phi.trans.insert, align 1, !tbaa !2
  %inc24 = add nuw i64 %inc2466, 1
  %exitcond = icmp eq i64 %inc24, %keylen.addr.0
  br i1 %exitcond, label %for.end25, label %for.body14.for.body14_crit_edge

for.end25:                                        ; preds = %for.body14.for.body14_crit_edge, %for.body14.preheader, %for.end
  call void @blake256_update(%struct.state* nonnull %outer, i8* nonnull %1, i64 512) #3
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %1) #3
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %0) #3
  ret void
}

; Function Attrs: nounwind
define hidden void @hmac_blake256_update(%struct.hmac_state* nocapture %S, i8* nocapture readonly %data, i64 %datalen) local_unnamed_addr #0 {
entry:
  %inner = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0
  tail call void @blake256_update(%struct.state* %inner, i8* %data, i64 %datalen)
  ret void
}

; Function Attrs: nounwind
define hidden void @hmac_blake224_update(%struct.hmac_state* nocapture %S, i8* nocapture readonly %data, i64 %datalen) local_unnamed_addr #0 {
entry:
  %inner = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0
  tail call void @blake256_update(%struct.state* %inner, i8* %data, i64 %datalen) #3
  ret void
}

; Function Attrs: nounwind
define hidden void @hmac_blake256_final(%struct.hmac_state* nocapture %S, i8* %digest) local_unnamed_addr #0 {
entry:
  %ihash = alloca [32 x i8], align 16
  %0 = getelementptr inbounds [32 x i8], [32 x i8]* %ihash, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %0) #3
  %inner = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0
  call void @blake256_final_h(%struct.state* %inner, i8* nonnull %0, i8 zeroext -127, i8 zeroext 1) #3
  %outer = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1
  call void @blake256_update(%struct.state* nonnull %outer, i8* nonnull %0, i64 256)
  call void @blake256_final_h(%struct.state* nonnull %outer, i8* %digest, i8 zeroext -127, i8 zeroext 1) #3
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %0) #3
  ret void
}

; Function Attrs: nounwind
define hidden void @hmac_blake224_final(%struct.hmac_state* nocapture %S, i8* %digest) local_unnamed_addr #0 {
entry:
  %ihash = alloca [32 x i8], align 16
  %0 = getelementptr inbounds [32 x i8], [32 x i8]* %ihash, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %0) #3
  %inner = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0
  call void @blake256_final_h(%struct.state* %inner, i8* nonnull %0, i8 zeroext -128, i8 zeroext 0) #3
  %outer = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1
  call void @blake256_update(%struct.state* nonnull %outer, i8* nonnull %0, i64 224) #3
  call void @blake256_final_h(%struct.state* nonnull %outer, i8* %digest, i8 zeroext -128, i8 zeroext 0) #3
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %0) #3
  ret void
}

; Function Attrs: nounwind
define hidden void @hmac_blake256_hash(i8* %out, i8* nocapture readonly %key, i64 %keylen, i8* nocapture readonly %in, i64 %inlen) local_unnamed_addr #0 {
entry:
  %ihash.i = alloca [32 x i8], align 16
  %S = alloca %struct.hmac_state, align 4
  %0 = bitcast %struct.hmac_state* %S to i8*
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %0) #3
  call void @hmac_blake256_init(%struct.hmac_state* nonnull %S, i8* %key, i64 %keylen)
  %mul = shl i64 %inlen, 3
  %inner.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0
  call void @blake256_update(%struct.state* nonnull %inner.i, i8* %in, i64 %mul) #3
  %1 = getelementptr inbounds [32 x i8], [32 x i8]* %ihash.i, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %1) #3
  call void @blake256_final_h(%struct.state* nonnull %inner.i, i8* nonnull %1, i8 zeroext -127, i8 zeroext 1) #3
  %outer.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1
  call void @blake256_update(%struct.state* nonnull %outer.i, i8* nonnull %1, i64 256) #3
  call void @blake256_final_h(%struct.state* nonnull %outer.i, i8* %out, i8 zeroext -127, i8 zeroext 1) #3
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %1) #3
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %0) #3
  ret void
}

; Function Attrs: nounwind
define hidden void @hmac_blake224_hash(i8* %out, i8* nocapture readonly %key, i64 %keylen, i8* nocapture readonly %in, i64 %inlen) local_unnamed_addr #0 {
entry:
  %ihash.i = alloca [32 x i8], align 16
  %S = alloca %struct.hmac_state, align 4
  %0 = bitcast %struct.hmac_state* %S to i8*
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %0) #3
  call void @hmac_blake224_init(%struct.hmac_state* nonnull %S, i8* %key, i64 %keylen)
  %mul = shl i64 %inlen, 3
  %inner.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 0
  call void @blake256_update(%struct.state* nonnull %inner.i, i8* %in, i64 %mul) #3
  %1 = getelementptr inbounds [32 x i8], [32 x i8]* %ihash.i, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %1) #3
  call void @blake256_final_h(%struct.state* nonnull %inner.i, i8* nonnull %1, i8 zeroext -128, i8 zeroext 0) #3
  %outer.i = getelementptr inbounds %struct.hmac_state, %struct.hmac_state* %S, i32 0, i32 1
  call void @blake256_update(%struct.state* nonnull %outer.i, i8* nonnull %1, i64 224) #3
  call void @blake256_final_h(%struct.state* nonnull %outer.i, i8* %out, i8 zeroext -128, i8 zeroext 0) #3
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %1) #3
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %0) #3
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nofree norecurse nounwind writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (/b/s/w/ir/cache/git/chromium.googlesource.com-external-github.com-llvm-llvm--project 3774bcf9f84520a8c35bf765d9a528040d68a14b)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !3, i64 0}
!7 = !{!8, !6, i64 60}
!8 = !{!"", !3, i64 0, !3, i64 32, !3, i64 48, !6, i64 56, !6, i64 60, !3, i64 64}
!9 = !{!8, !6, i64 56}
