; ModuleID = 'main/[7]main[1].bc'
source_filename = "main.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-emscripten"

@.str = private unnamed_addr constant [6 x i8] c"%2hhx\00", align 1
@output = hidden global [65 x i8] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [5 x i8] c"%02x\00", align 1

; Function Attrs: nounwind
define hidden i8* @hash_cn(i8* nocapture readonly %hex, i32 %lite, i32 %variant, i32 %height) local_unnamed_addr #0 {
entry:
  %hash = alloca [32 x i8], align 16
  %call = tail call i32 @strlen(i8* nonnull dereferenceable(1) %hex)
  %div = lshr i32 %call, 1
  %vla = alloca i8, i32 %div, align 16
  %cmp38 = icmp eq i32 %div, 0
  br i1 %cmp38, label %for.cond.cleanup, label %for.body

for.cond.cleanup:                                 ; preds = %for.body, %entry
  %0 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %0) #5
  %cmp2 = icmp eq i32 %variant, -1
  br i1 %cmp2, label %if.then, label %if.end

for.body:                                         ; preds = %entry, %for.body
  %i.040 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %pos.039 = phi i8* [ %add.ptr, %for.body ], [ %hex, %entry ]
  %arrayidx = getelementptr inbounds i8, i8* %vla, i32 %i.040
  %call1 = call i32 (i8*, i8*, ...) @sscanf(i8* %pos.039, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i8* nonnull %arrayidx)
  %add.ptr = getelementptr inbounds i8, i8* %pos.039, i32 2
  %inc = add nuw nsw i32 %i.040, 1
  %exitcond = icmp eq i32 %inc, %div
  br i1 %exitcond, label %for.cond.cleanup, label %for.body

if.then:                                          ; preds = %for.cond.cleanup
  %1 = load i8, i8* %vla, align 16, !tbaa !2
  %cmp4 = icmp ugt i8 %1, 6
  %conv = zext i8 %1 to i32
  %sub = add nsw i32 %conv, -6
  %2 = sub i32 %conv, 6
  %3 = icmp sle i32 6, %conv
  %4 = zext i1 %3 to i32
  %5 = mul i32 %2, %4
  %cond = select i1 %cmp4, i32 %sub, i32 0
  br label %if.end

if.end:                                           ; preds = %if.then, %for.cond.cleanup
  %variant.addr.0 = phi i32 [ %variant, %for.cond.cleanup ], [ %cond, %if.then ]
  call void @cryptonight(i8* nonnull %0, i8* nonnull %vla, i32 %div, i32 %lite, i32 %variant.addr.0, i32 %height) #5
  %6 = load i8, i8* %0, align 16, !tbaa !2
  %conv15 = zext i8 %6 to i32
  %7 = call i32 (i8*, i8*, ...) @siprintf(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @output, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15)
  %add.ptr17 = getelementptr inbounds [65 x i8], [65 x i8]* @output, i32 0, i32 %7
  %arrayidx14.1 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 1
  %8 = load i8, i8* %arrayidx14.1, align 1, !tbaa !2
  %conv15.1 = zext i8 %8 to i32
  %9 = call i32 (i8*, i8*, ...) @siprintf(i8* nonnull %add.ptr17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.1)
  %add.ptr17.1 = getelementptr inbounds i8, i8* %add.ptr17, i32 %9
  %arrayidx14.2 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 2
  %10 = load i8, i8* %arrayidx14.2, align 2, !tbaa !2
  %conv15.2 = zext i8 %10 to i32
  %11 = call i32 (i8*, i8*, ...) @siprintf(i8* nonnull %add.ptr17.1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.2)
  %add.ptr17.2 = getelementptr inbounds i8, i8* %add.ptr17.1, i32 %11
  %arrayidx14.3 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 3
  %12 = load i8, i8* %arrayidx14.3, align 1, !tbaa !2
  %conv15.3 = zext i8 %12 to i32
  %13 = call i32 (i8*, i8*, ...) @siprintf(i8* nonnull %add.ptr17.2, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.3)
  %add.ptr17.3 = getelementptr inbounds i8, i8* %add.ptr17.2, i32 %13
  %arrayidx14.4 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 4
  %14 = load i8, i8* %arrayidx14.4, align 4, !tbaa !2
  %conv15.4 = zext i8 %14 to i32
  %15 = call i32 (i8*, i8*, ...) @siprintf(i8* nonnull %add.ptr17.3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.4)
  %add.ptr17.4 = getelementptr inbounds i8, i8* %add.ptr17.3, i32 %15
  %arrayidx14.5 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 5
  %16 = load i8, i8* %arrayidx14.5, align 1, !tbaa !2
  %conv15.5 = zext i8 %16 to i32
  %17 = call i32 (i8*, i8*, ...) @siprintf(i8* nonnull %add.ptr17.4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.5)
  %add.ptr17.5 = getelementptr inbounds i8, i8* %add.ptr17.4, i32 %17
  %arrayidx14.6 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 6
  %18 = load i8, i8* %arrayidx14.6, align 2, !tbaa !2
  %conv15.6 = zext i8 %18 to i32
  %19 = call i32 (i8*, i8*, ...) @siprintf(i8* nonnull %add.ptr17.5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.6)
  %add.ptr17.6 = getelementptr inbounds i8, i8* %add.ptr17.5, i32 %19
  %arrayidx14.7 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 7
  %20 = load i8, i8* %arrayidx14.7, align 1, !tbaa !2
  %conv15.7 = zext i8 %20 to i32
  %21 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.7)
  %add.ptr17.7 = getelementptr inbounds i8, i8* %add.ptr17.6, i32 %21
  %arrayidx14.8 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 8
  %22 = load i8, i8* %arrayidx14.8, align 8, !tbaa !2
  %conv15.8 = zext i8 %22 to i32
  %23 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.7, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.8)
  %add.ptr17.8 = getelementptr inbounds i8, i8* %add.ptr17.7, i32 %23
  %arrayidx14.9 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 9
  %24 = load i8, i8* %arrayidx14.9, align 1, !tbaa !2
  %conv15.9 = zext i8 %24 to i32
  %25 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.9)
  %add.ptr17.9 = getelementptr inbounds i8, i8* %add.ptr17.8, i32 %25
  %arrayidx14.10 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 10
  %26 = load i8, i8* %arrayidx14.10, align 2, !tbaa !2
  %conv15.10 = zext i8 %26 to i32
  %27 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.9, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.10)
  %add.ptr17.10 = getelementptr inbounds i8, i8* %add.ptr17.9, i32 %27
  %arrayidx14.11 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 11
  %28 = load i8, i8* %arrayidx14.11, align 1, !tbaa !2
  %conv15.11 = zext i8 %28 to i32
  %29 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.10, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.11)
  %add.ptr17.11 = getelementptr inbounds i8, i8* %add.ptr17.10, i32 %29
  %arrayidx14.12 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 12
  %30 = load i8, i8* %arrayidx14.12, align 4, !tbaa !2
  %conv15.12 = zext i8 %30 to i32
  %31 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.11, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.12)
  %add.ptr17.12 = getelementptr inbounds i8, i8* %add.ptr17.11, i32 %31
  %arrayidx14.13 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 13
  %32 = load i8, i8* %arrayidx14.13, align 1, !tbaa !2
  %conv15.13 = zext i8 %32 to i32
  %33 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.12, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.13)
  %add.ptr17.13 = getelementptr inbounds i8, i8* %add.ptr17.12, i32 %33
  %arrayidx14.14 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 14
  %34 = load i8, i8* %arrayidx14.14, align 2, !tbaa !2
  %conv15.14 = zext i8 %34 to i32
  %35 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.13, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.14)
  %add.ptr17.14 = getelementptr inbounds i8, i8* %add.ptr17.13, i32 %35
  %arrayidx14.15 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 15
  %36 = load i8, i8* %arrayidx14.15, align 1, !tbaa !2
  %conv15.15 = zext i8 %36 to i32
  %37 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.14, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.15)
  %add.ptr17.15 = getelementptr inbounds i8, i8* %add.ptr17.14, i32 %37
  %arrayidx14.16 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 16
  %38 = load i8, i8* %arrayidx14.16, align 16, !tbaa !2
  %conv15.16 = zext i8 %38 to i32
  %39 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.15, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.16)
  %add.ptr17.16 = getelementptr inbounds i8, i8* %add.ptr17.15, i32 %39
  %arrayidx14.17 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 17
  %40 = load i8, i8* %arrayidx14.17, align 1, !tbaa !2
  %conv15.17 = zext i8 %40 to i32
  %41 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.16, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.17)
  %add.ptr17.17 = getelementptr inbounds i8, i8* %add.ptr17.16, i32 %41
  %arrayidx14.18 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 18
  %42 = load i8, i8* %arrayidx14.18, align 2, !tbaa !2
  %conv15.18 = zext i8 %42 to i32
  %43 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.18)
  %add.ptr17.18 = getelementptr inbounds i8, i8* %add.ptr17.17, i32 %43
  %arrayidx14.19 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 19
  %44 = load i8, i8* %arrayidx14.19, align 1, !tbaa !2
  %conv15.19 = zext i8 %44 to i32
  %45 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.18, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.19)
  %add.ptr17.19 = getelementptr inbounds i8, i8* %add.ptr17.18, i32 %45
  %arrayidx14.20 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 20
  %46 = load i8, i8* %arrayidx14.20, align 4, !tbaa !2
  %conv15.20 = zext i8 %46 to i32
  %47 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.19, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.20)
  %add.ptr17.20 = getelementptr inbounds i8, i8* %add.ptr17.19, i32 %47
  %arrayidx14.21 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 21
  %48 = load i8, i8* %arrayidx14.21, align 1, !tbaa !2
  %conv15.21 = zext i8 %48 to i32
  %49 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.20, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.21)
  %add.ptr17.21 = getelementptr inbounds i8, i8* %add.ptr17.20, i32 %49
  %arrayidx14.22 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 22
  %50 = load i8, i8* %arrayidx14.22, align 2, !tbaa !2
  %conv15.22 = zext i8 %50 to i32
  %51 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.21, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.22)
  %add.ptr17.22 = getelementptr inbounds i8, i8* %add.ptr17.21, i32 %51
  %arrayidx14.23 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 23
  %52 = load i8, i8* %arrayidx14.23, align 1, !tbaa !2
  %conv15.23 = zext i8 %52 to i32
  %53 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.22, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.23)
  %add.ptr17.23 = getelementptr inbounds i8, i8* %add.ptr17.22, i32 %53
  %arrayidx14.24 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 24
  %54 = load i8, i8* %arrayidx14.24, align 8, !tbaa !2
  %conv15.24 = zext i8 %54 to i32
  %55 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.23, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.24)
  %add.ptr17.24 = getelementptr inbounds i8, i8* %add.ptr17.23, i32 %55
  %arrayidx14.25 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 25
  %56 = load i8, i8* %arrayidx14.25, align 1, !tbaa !2
  %conv15.25 = zext i8 %56 to i32
  %57 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.24, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.25)
  %add.ptr17.25 = getelementptr inbounds i8, i8* %add.ptr17.24, i32 %57
  %arrayidx14.26 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 26
  %58 = load i8, i8* %arrayidx14.26, align 2, !tbaa !2
  %conv15.26 = zext i8 %58 to i32
  %59 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.25, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.26)
  %add.ptr17.26 = getelementptr inbounds i8, i8* %add.ptr17.25, i32 %59
  %arrayidx14.27 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 27
  %60 = load i8, i8* %arrayidx14.27, align 1, !tbaa !2
  %conv15.27 = zext i8 %60 to i32
  %61 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.26, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.27)
  %add.ptr17.27 = getelementptr inbounds i8, i8* %add.ptr17.26, i32 %61
  %arrayidx14.28 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 28
  %62 = load i8, i8* %arrayidx14.28, align 4, !tbaa !2
  %conv15.28 = zext i8 %62 to i32
  %63 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.27, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.28)
  %add.ptr17.28 = getelementptr inbounds i8, i8* %add.ptr17.27, i32 %63
  %arrayidx14.29 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 29
  %64 = load i8, i8* %arrayidx14.29, align 1, !tbaa !2
  %conv15.29 = zext i8 %64 to i32
  %65 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.28, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.29)
  %add.ptr17.29 = getelementptr inbounds i8, i8* %add.ptr17.28, i32 %65
  %arrayidx14.30 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 30
  %66 = load i8, i8* %arrayidx14.30, align 2, !tbaa !2
  %conv15.30 = zext i8 %66 to i32
  %67 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.29, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.30)
  %add.ptr17.30 = getelementptr inbounds i8, i8* %add.ptr17.29, i32 %67
  %arrayidx14.31 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 31
  %68 = load i8, i8* %arrayidx14.31, align 1, !tbaa !2
  %conv15.31 = zext i8 %68 to i32
  %69 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.30, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.31)
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %0) #5
  ret i8* getelementptr inbounds ([65 x i8], [65 x i8]* @output, i32 0, i32 0)
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nofree nounwind readonly
declare i32 @strlen(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare i32 @sscanf(i8* nocapture readonly, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

declare void @cryptonight(i8*, i8*, i32, i32, i32, i32) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare i32 @siprintf(i8* noalias nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { argmemonly nofree nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (/b/s/w/ir/cache/git/chromium.googlesource.com-external-github.com-llvm-llvm--project 3774bcf9f84520a8c35bf765d9a528040d68a14b)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
