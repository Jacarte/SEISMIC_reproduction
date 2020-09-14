; ModuleID = 'main/[2]main[1].bc'
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
  %2 = add i32 -6, %conv
  %3 = add i32 -6, %conv
  %4 = icmp ult i32 %3, %conv
  %5 = zext i1 %4 to i32
  %6 = mul i32 %2, %5
  %cond = select i1 %cmp4, i32 %sub, i32 0
  br label %if.end

if.end:                                           ; preds = %if.then, %for.cond.cleanup
  %variant.addr.0 = phi i32 [ %variant, %for.cond.cleanup ], [ %cond, %if.then ]
  call void @cryptonight(i8* nonnull %0, i8* nonnull %vla, i32 %div, i32 %lite, i32 %variant.addr.0, i32 %height) #5
  %7 = load i8, i8* %0, align 16, !tbaa !2
  %conv15 = zext i8 %7 to i32
  %8 = call i32 (i8*, i8*, ...) @siprintf(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @output, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15)
  %add.ptr17 = getelementptr inbounds [65 x i8], [65 x i8]* @output, i32 0, i32 %8
  %arrayidx14.1 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 1
  %9 = load i8, i8* %arrayidx14.1, align 1, !tbaa !2
  %conv15.1 = zext i8 %9 to i32
  %10 = call i32 (i8*, i8*, ...) @siprintf(i8* nonnull %add.ptr17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.1)
  %add.ptr17.1 = getelementptr inbounds i8, i8* %add.ptr17, i32 %10
  %arrayidx14.2 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 2
  %11 = load i8, i8* %arrayidx14.2, align 2, !tbaa !2
  %conv15.2 = zext i8 %11 to i32
  %12 = call i32 (i8*, i8*, ...) @siprintf(i8* nonnull %add.ptr17.1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.2)
  %add.ptr17.2 = getelementptr inbounds i8, i8* %add.ptr17.1, i32 %12
  %arrayidx14.3 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 3
  %13 = load i8, i8* %arrayidx14.3, align 1, !tbaa !2
  %conv15.3 = zext i8 %13 to i32
  %14 = call i32 (i8*, i8*, ...) @siprintf(i8* nonnull %add.ptr17.2, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.3)
  %add.ptr17.3 = getelementptr inbounds i8, i8* %add.ptr17.2, i32 %14
  %arrayidx14.4 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 4
  %15 = load i8, i8* %arrayidx14.4, align 4, !tbaa !2
  %conv15.4 = zext i8 %15 to i32
  %16 = call i32 (i8*, i8*, ...) @siprintf(i8* nonnull %add.ptr17.3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.4)
  %add.ptr17.4 = getelementptr inbounds i8, i8* %add.ptr17.3, i32 %16
  %arrayidx14.5 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 5
  %17 = load i8, i8* %arrayidx14.5, align 1, !tbaa !2
  %conv15.5 = zext i8 %17 to i32
  %18 = call i32 (i8*, i8*, ...) @siprintf(i8* nonnull %add.ptr17.4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.5)
  %add.ptr17.5 = getelementptr inbounds i8, i8* %add.ptr17.4, i32 %18
  %arrayidx14.6 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 6
  %19 = load i8, i8* %arrayidx14.6, align 2, !tbaa !2
  %conv15.6 = zext i8 %19 to i32
  %20 = call i32 (i8*, i8*, ...) @siprintf(i8* nonnull %add.ptr17.5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.6)
  %add.ptr17.6 = getelementptr inbounds i8, i8* %add.ptr17.5, i32 %20
  %arrayidx14.7 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 7
  %21 = load i8, i8* %arrayidx14.7, align 1, !tbaa !2
  %conv15.7 = zext i8 %21 to i32
  %22 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.7)
  %add.ptr17.7 = getelementptr inbounds i8, i8* %add.ptr17.6, i32 %22
  %arrayidx14.8 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 8
  %23 = load i8, i8* %arrayidx14.8, align 8, !tbaa !2
  %conv15.8 = zext i8 %23 to i32
  %24 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.7, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.8)
  %add.ptr17.8 = getelementptr inbounds i8, i8* %add.ptr17.7, i32 %24
  %arrayidx14.9 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 9
  %25 = load i8, i8* %arrayidx14.9, align 1, !tbaa !2
  %conv15.9 = zext i8 %25 to i32
  %26 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.9)
  %add.ptr17.9 = getelementptr inbounds i8, i8* %add.ptr17.8, i32 %26
  %arrayidx14.10 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 10
  %27 = load i8, i8* %arrayidx14.10, align 2, !tbaa !2
  %conv15.10 = zext i8 %27 to i32
  %28 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.9, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.10)
  %add.ptr17.10 = getelementptr inbounds i8, i8* %add.ptr17.9, i32 %28
  %arrayidx14.11 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 11
  %29 = load i8, i8* %arrayidx14.11, align 1, !tbaa !2
  %conv15.11 = zext i8 %29 to i32
  %30 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.10, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.11)
  %add.ptr17.11 = getelementptr inbounds i8, i8* %add.ptr17.10, i32 %30
  %arrayidx14.12 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 12
  %31 = load i8, i8* %arrayidx14.12, align 4, !tbaa !2
  %conv15.12 = zext i8 %31 to i32
  %32 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.11, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.12)
  %add.ptr17.12 = getelementptr inbounds i8, i8* %add.ptr17.11, i32 %32
  %arrayidx14.13 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 13
  %33 = load i8, i8* %arrayidx14.13, align 1, !tbaa !2
  %conv15.13 = zext i8 %33 to i32
  %34 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.12, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.13)
  %add.ptr17.13 = getelementptr inbounds i8, i8* %add.ptr17.12, i32 %34
  %arrayidx14.14 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 14
  %35 = load i8, i8* %arrayidx14.14, align 2, !tbaa !2
  %conv15.14 = zext i8 %35 to i32
  %36 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.13, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.14)
  %add.ptr17.14 = getelementptr inbounds i8, i8* %add.ptr17.13, i32 %36
  %arrayidx14.15 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 15
  %37 = load i8, i8* %arrayidx14.15, align 1, !tbaa !2
  %conv15.15 = zext i8 %37 to i32
  %38 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.14, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.15)
  %add.ptr17.15 = getelementptr inbounds i8, i8* %add.ptr17.14, i32 %38
  %arrayidx14.16 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 16
  %39 = load i8, i8* %arrayidx14.16, align 16, !tbaa !2
  %conv15.16 = zext i8 %39 to i32
  %40 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.15, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.16)
  %add.ptr17.16 = getelementptr inbounds i8, i8* %add.ptr17.15, i32 %40
  %arrayidx14.17 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 17
  %41 = load i8, i8* %arrayidx14.17, align 1, !tbaa !2
  %conv15.17 = zext i8 %41 to i32
  %42 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.16, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.17)
  %add.ptr17.17 = getelementptr inbounds i8, i8* %add.ptr17.16, i32 %42
  %arrayidx14.18 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 18
  %43 = load i8, i8* %arrayidx14.18, align 2, !tbaa !2
  %conv15.18 = zext i8 %43 to i32
  %44 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.18)
  %add.ptr17.18 = getelementptr inbounds i8, i8* %add.ptr17.17, i32 %44
  %arrayidx14.19 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 19
  %45 = load i8, i8* %arrayidx14.19, align 1, !tbaa !2
  %conv15.19 = zext i8 %45 to i32
  %46 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.18, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.19)
  %add.ptr17.19 = getelementptr inbounds i8, i8* %add.ptr17.18, i32 %46
  %arrayidx14.20 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 20
  %47 = load i8, i8* %arrayidx14.20, align 4, !tbaa !2
  %conv15.20 = zext i8 %47 to i32
  %48 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.19, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.20)
  %add.ptr17.20 = getelementptr inbounds i8, i8* %add.ptr17.19, i32 %48
  %arrayidx14.21 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 21
  %49 = load i8, i8* %arrayidx14.21, align 1, !tbaa !2
  %conv15.21 = zext i8 %49 to i32
  %50 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.20, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.21)
  %add.ptr17.21 = getelementptr inbounds i8, i8* %add.ptr17.20, i32 %50
  %arrayidx14.22 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 22
  %51 = load i8, i8* %arrayidx14.22, align 2, !tbaa !2
  %conv15.22 = zext i8 %51 to i32
  %52 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.21, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.22)
  %add.ptr17.22 = getelementptr inbounds i8, i8* %add.ptr17.21, i32 %52
  %arrayidx14.23 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 23
  %53 = load i8, i8* %arrayidx14.23, align 1, !tbaa !2
  %conv15.23 = zext i8 %53 to i32
  %54 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.22, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.23)
  %add.ptr17.23 = getelementptr inbounds i8, i8* %add.ptr17.22, i32 %54
  %arrayidx14.24 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 24
  %55 = load i8, i8* %arrayidx14.24, align 8, !tbaa !2
  %conv15.24 = zext i8 %55 to i32
  %56 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.23, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.24)
  %add.ptr17.24 = getelementptr inbounds i8, i8* %add.ptr17.23, i32 %56
  %arrayidx14.25 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 25
  %57 = load i8, i8* %arrayidx14.25, align 1, !tbaa !2
  %conv15.25 = zext i8 %57 to i32
  %58 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.24, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.25)
  %add.ptr17.25 = getelementptr inbounds i8, i8* %add.ptr17.24, i32 %58
  %arrayidx14.26 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 26
  %59 = load i8, i8* %arrayidx14.26, align 2, !tbaa !2
  %conv15.26 = zext i8 %59 to i32
  %60 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.25, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.26)
  %add.ptr17.26 = getelementptr inbounds i8, i8* %add.ptr17.25, i32 %60
  %arrayidx14.27 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 27
  %61 = load i8, i8* %arrayidx14.27, align 1, !tbaa !2
  %conv15.27 = zext i8 %61 to i32
  %62 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.26, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.27)
  %add.ptr17.27 = getelementptr inbounds i8, i8* %add.ptr17.26, i32 %62
  %arrayidx14.28 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 28
  %63 = load i8, i8* %arrayidx14.28, align 4, !tbaa !2
  %conv15.28 = zext i8 %63 to i32
  %64 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.27, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.28)
  %add.ptr17.28 = getelementptr inbounds i8, i8* %add.ptr17.27, i32 %64
  %arrayidx14.29 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 29
  %65 = load i8, i8* %arrayidx14.29, align 1, !tbaa !2
  %conv15.29 = zext i8 %65 to i32
  %66 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.28, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.29)
  %add.ptr17.29 = getelementptr inbounds i8, i8* %add.ptr17.28, i32 %66
  %arrayidx14.30 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 30
  %67 = load i8, i8* %arrayidx14.30, align 2, !tbaa !2
  %conv15.30 = zext i8 %67 to i32
  %68 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.29, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.30)
  %add.ptr17.30 = getelementptr inbounds i8, i8* %add.ptr17.29, i32 %68
  %arrayidx14.31 = getelementptr inbounds [32 x i8], [32 x i8]* %hash, i32 0, i32 31
  %69 = load i8, i8* %arrayidx14.31, align 1, !tbaa !2
  %conv15.31 = zext i8 %69 to i32
  %70 = call i32 (i8*, i8*, ...) @siprintf(i8* %add.ptr17.30, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 %conv15.31)
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
