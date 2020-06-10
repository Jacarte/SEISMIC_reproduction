; ModuleID = 'keccak/keccak.bc'
source_filename = "keccak.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-emscripten"

@keccakf_rndc = hidden local_unnamed_addr constant [24 x i64] [i64 1, i64 32898, i64 -9223372036854742902, i64 -9223372034707259392, i64 32907, i64 2147483649, i64 -9223372034707259263, i64 -9223372036854743031, i64 138, i64 136, i64 2147516425, i64 2147483658, i64 2147516555, i64 -9223372036854775669, i64 -9223372036854742903, i64 -9223372036854743037, i64 -9223372036854743038, i64 -9223372036854775680, i64 32778, i64 -9223372034707292150, i64 -9223372034707259263, i64 -9223372036854742912, i64 2147483649, i64 -9223372034707259384], align 16
@keccakf_rotc = hidden local_unnamed_addr constant [24 x i32] [i32 1, i32 3, i32 6, i32 10, i32 15, i32 21, i32 28, i32 36, i32 45, i32 55, i32 2, i32 14, i32 27, i32 41, i32 56, i32 8, i32 25, i32 43, i32 62, i32 18, i32 39, i32 61, i32 20, i32 44], align 16
@keccakf_piln = hidden local_unnamed_addr constant [24 x i32] [i32 10, i32 7, i32 11, i32 17, i32 18, i32 3, i32 5, i32 16, i32 8, i32 21, i32 24, i32 4, i32 15, i32 23, i32 19, i32 13, i32 12, i32 2, i32 20, i32 14, i32 22, i32 9, i32 6, i32 1], align 16

; Function Attrs: nounwind
define hidden void @keccakf(i64* %st, i32 %rounds) local_unnamed_addr #0 {
entry:
  %cmp238 = icmp sgt i32 %rounds, 0
  br i1 %cmp238, label %for.body.lr.ph, label %for.end150

for.body.lr.ph:                                   ; preds = %entry
  %arrayidx1 = getelementptr inbounds i64, i64* %st, i32 5
  %arrayidx2 = getelementptr inbounds i64, i64* %st, i32 10
  %arrayidx4 = getelementptr inbounds i64, i64* %st, i32 15
  %arrayidx6 = getelementptr inbounds i64, i64* %st, i32 20
  %arrayidx9 = getelementptr inbounds i64, i64* %st, i32 1
  %arrayidx10 = getelementptr inbounds i64, i64* %st, i32 6
  %arrayidx12 = getelementptr inbounds i64, i64* %st, i32 11
  %arrayidx14 = getelementptr inbounds i64, i64* %st, i32 16
  %arrayidx16 = getelementptr inbounds i64, i64* %st, i32 21
  %arrayidx19 = getelementptr inbounds i64, i64* %st, i32 2
  %arrayidx20 = getelementptr inbounds i64, i64* %st, i32 7
  %arrayidx22 = getelementptr inbounds i64, i64* %st, i32 12
  %arrayidx24 = getelementptr inbounds i64, i64* %st, i32 17
  %arrayidx26 = getelementptr inbounds i64, i64* %st, i32 22
  %arrayidx29 = getelementptr inbounds i64, i64* %st, i32 3
  %arrayidx30 = getelementptr inbounds i64, i64* %st, i32 8
  %arrayidx32 = getelementptr inbounds i64, i64* %st, i32 13
  %arrayidx34 = getelementptr inbounds i64, i64* %st, i32 18
  %arrayidx36 = getelementptr inbounds i64, i64* %st, i32 23
  %arrayidx39 = getelementptr inbounds i64, i64* %st, i32 4
  %arrayidx40 = getelementptr inbounds i64, i64* %st, i32 9
  %arrayidx42 = getelementptr inbounds i64, i64* %st, i32 14
  %arrayidx44 = getelementptr inbounds i64, i64* %st, i32 19
  %arrayidx46 = getelementptr inbounds i64, i64* %st, i32 24
  %.pre = load i64, i64* %st, align 8, !tbaa !2
  %.pre251 = load i64, i64* %arrayidx2, align 8, !tbaa !2
  %.pre252 = load i64, i64* %arrayidx4, align 8, !tbaa !2
  %.pre253 = load i64, i64* %arrayidx6, align 8, !tbaa !2
  %.pre254 = load i64, i64* %arrayidx12, align 8, !tbaa !2
  %.pre255 = load i64, i64* %arrayidx14, align 8, !tbaa !2
  %.pre256 = load i64, i64* %arrayidx16, align 8, !tbaa !2
  %.pre257 = load i64, i64* %arrayidx22, align 8, !tbaa !2
  %.pre258 = load i64, i64* %arrayidx24, align 8, !tbaa !2
  %.pre259 = load i64, i64* %arrayidx26, align 8, !tbaa !2
  %.pre260 = load i64, i64* %arrayidx32, align 8, !tbaa !2
  %.pre261 = load i64, i64* %arrayidx34, align 8, !tbaa !2
  %.pre262 = load i64, i64* %arrayidx36, align 8, !tbaa !2
  %.pre263 = load i64, i64* %arrayidx42, align 8, !tbaa !2
  %.pre264 = load i64, i64* %arrayidx44, align 8, !tbaa !2
  %.pre265 = load i64, i64* %arrayidx46, align 8, !tbaa !2
  %.pre266 = load i64, i64* %arrayidx20, align 8, !tbaa !2
  %.pre267 = load i64, i64* %arrayidx30, align 8, !tbaa !2
  %.pre268 = load i64, i64* %arrayidx40, align 8, !tbaa !2
  br label %for.body

for.body:                                         ; preds = %for.cond93.preheader, %for.body.lr.ph
  %0 = phi i64 [ %.pre268, %for.body.lr.ph ], [ %xor141.1, %for.cond93.preheader ]
  %1 = phi i64 [ %.pre267, %for.body.lr.ph ], [ %xor134.1, %for.cond93.preheader ]
  %2 = phi i64 [ %.pre266, %for.body.lr.ph ], [ %xor127.1, %for.cond93.preheader ]
  %3 = phi i64 [ %.pre265, %for.body.lr.ph ], [ %xor141.4, %for.cond93.preheader ]
  %4 = phi i64 [ %.pre264, %for.body.lr.ph ], [ %xor141.3, %for.cond93.preheader ]
  %5 = phi i64 [ %.pre263, %for.body.lr.ph ], [ %xor141.2, %for.cond93.preheader ]
  %6 = phi i64 [ %.pre262, %for.body.lr.ph ], [ %xor134.4, %for.cond93.preheader ]
  %7 = phi i64 [ %.pre261, %for.body.lr.ph ], [ %xor134.3, %for.cond93.preheader ]
  %8 = phi i64 [ %.pre260, %for.body.lr.ph ], [ %xor134.2, %for.cond93.preheader ]
  %9 = phi i64 [ %.pre259, %for.body.lr.ph ], [ %xor127.4, %for.cond93.preheader ]
  %10 = phi i64 [ %.pre258, %for.body.lr.ph ], [ %xor127.3, %for.cond93.preheader ]
  %11 = phi i64 [ %.pre257, %for.body.lr.ph ], [ %xor127.2, %for.cond93.preheader ]
  %12 = phi i64 [ %.pre256, %for.body.lr.ph ], [ %xor120.4, %for.cond93.preheader ]
  %13 = phi i64 [ %.pre255, %for.body.lr.ph ], [ %xor120.3, %for.cond93.preheader ]
  %14 = phi i64 [ %.pre254, %for.body.lr.ph ], [ %xor120.2, %for.cond93.preheader ]
  %15 = phi i64 [ %.pre253, %for.body.lr.ph ], [ %xor113.4, %for.cond93.preheader ]
  %16 = phi i64 [ %.pre252, %for.body.lr.ph ], [ %xor113.3, %for.cond93.preheader ]
  %17 = phi i64 [ %.pre251, %for.body.lr.ph ], [ %xor113.2, %for.cond93.preheader ]
  %18 = phi i64 [ %.pre, %for.body.lr.ph ], [ %xor147, %for.cond93.preheader ]
  %round.0239 = phi i32 [ 0, %for.body.lr.ph ], [ %inc149, %for.cond93.preheader ]
  %19 = load i64, i64* %arrayidx1, align 8, !tbaa !2
  %xor = xor i64 %19, %18
  %xor3 = xor i64 %xor, %17
  %xor5 = xor i64 %xor3, %16
  %xor7 = xor i64 %xor5, %15
  %20 = load i64, i64* %arrayidx9, align 8, !tbaa !2
  %21 = load i64, i64* %arrayidx10, align 8, !tbaa !2
  %xor11 = xor i64 %21, %20
  %xor13 = xor i64 %xor11, %14
  %xor15 = xor i64 %xor13, %13
  %xor17 = xor i64 %xor15, %12
  %22 = load i64, i64* %arrayidx19, align 8, !tbaa !2
  %xor21 = xor i64 %2, %22
  %xor23 = xor i64 %xor21, %11
  %xor25 = xor i64 %xor23, %10
  %xor27 = xor i64 %xor25, %9
  %23 = load i64, i64* %arrayidx29, align 8, !tbaa !2
  %xor31 = xor i64 %1, %23
  %xor33 = xor i64 %xor31, %8
  %xor35 = xor i64 %xor33, %7
  %xor37 = xor i64 %xor35, %6
  %24 = load i64, i64* %arrayidx39, align 8, !tbaa !2
  %xor41 = xor i64 %0, %24
  %xor43 = xor i64 %xor41, %5
  %xor45 = xor i64 %xor43, %4
  %xor47 = xor i64 %xor45, %3
  %shl = shl i64 %xor17, 1
  %shr = lshr i64 %xor17, 63
  %or = or i64 %shl, %shr
  %xor59 = xor i64 %or, %xor47
  %xor61 = xor i64 %xor59, %18
  store i64 %xor61, i64* %st, align 8, !tbaa !2
  %xor64 = xor i64 %19, %xor59
  store i64 %xor64, i64* %arrayidx1, align 8, !tbaa !2
  %xor67 = xor i64 %17, %xor59
  store i64 %xor67, i64* %arrayidx2, align 8, !tbaa !2
  %xor70 = xor i64 %16, %xor59
  store i64 %xor70, i64* %arrayidx4, align 8, !tbaa !2
  %xor73 = xor i64 %15, %xor59
  store i64 %xor73, i64* %arrayidx6, align 8, !tbaa !2
  %shl.1 = shl i64 %xor27, 1
  %shr.1 = lshr i64 %xor27, 63
  %or.1 = or i64 %shl.1, %shr.1
  %xor59.1 = xor i64 %or.1, %xor7
  %xor61.1 = xor i64 %xor59.1, %20
  store i64 %xor61.1, i64* %arrayidx9, align 8, !tbaa !2
  %xor64.1 = xor i64 %21, %xor59.1
  store i64 %xor64.1, i64* %arrayidx10, align 8, !tbaa !2
  %xor67.1 = xor i64 %14, %xor59.1
  store i64 %xor67.1, i64* %arrayidx12, align 8, !tbaa !2
  %xor70.1 = xor i64 %13, %xor59.1
  store i64 %xor70.1, i64* %arrayidx14, align 8, !tbaa !2
  %xor73.1 = xor i64 %12, %xor59.1
  store i64 %xor73.1, i64* %arrayidx16, align 8, !tbaa !2
  %shl.2 = shl i64 %xor37, 1
  %shr.2 = lshr i64 %xor37, 63
  %or.2 = or i64 %shl.2, %shr.2
  %xor59.2 = xor i64 %or.2, %xor17
  %xor61.2 = xor i64 %xor59.2, %22
  store i64 %xor61.2, i64* %arrayidx19, align 8, !tbaa !2
  %xor64.2 = xor i64 %2, %xor59.2
  store i64 %xor64.2, i64* %arrayidx20, align 8, !tbaa !2
  %xor67.2 = xor i64 %11, %xor59.2
  store i64 %xor67.2, i64* %arrayidx22, align 8, !tbaa !2
  %xor70.2 = xor i64 %10, %xor59.2
  store i64 %xor70.2, i64* %arrayidx24, align 8, !tbaa !2
  %xor73.2 = xor i64 %9, %xor59.2
  store i64 %xor73.2, i64* %arrayidx26, align 8, !tbaa !2
  %shl.3 = shl i64 %xor47, 1
  %shr.3 = lshr i64 %xor47, 63
  %or.3 = or i64 %shl.3, %shr.3
  %xor59.3 = xor i64 %or.3, %xor27
  %xor61.3 = xor i64 %xor59.3, %23
  store i64 %xor61.3, i64* %arrayidx29, align 8, !tbaa !2
  %xor64.3 = xor i64 %1, %xor59.3
  store i64 %xor64.3, i64* %arrayidx30, align 8, !tbaa !2
  %25 = load i64, i64* %arrayidx32, align 8, !tbaa !2
  %xor67.3 = xor i64 %25, %xor59.3
  store i64 %xor67.3, i64* %arrayidx32, align 8, !tbaa !2
  %26 = load i64, i64* %arrayidx34, align 8, !tbaa !2
  %xor70.3 = xor i64 %26, %xor59.3
  store i64 %xor70.3, i64* %arrayidx34, align 8, !tbaa !2
  %27 = load i64, i64* %arrayidx36, align 8, !tbaa !2
  %xor73.3 = xor i64 %27, %xor59.3
  store i64 %xor73.3, i64* %arrayidx36, align 8, !tbaa !2
  %shl.4 = shl i64 %xor7, 1
  %shr.4 = lshr i64 %xor7, 63
  %or.4 = or i64 %shl.4, %shr.4
  %xor59.4 = xor i64 %or.4, %xor37
  %xor61.4 = xor i64 %xor59.4, %24
  store i64 %xor61.4, i64* %arrayidx39, align 8, !tbaa !2
  %xor64.4 = xor i64 %0, %xor59.4
  store i64 %xor64.4, i64* %arrayidx40, align 8, !tbaa !2
  %28 = load i64, i64* %arrayidx42, align 8, !tbaa !2
  %xor67.4 = xor i64 %28, %xor59.4
  store i64 %xor67.4, i64* %arrayidx42, align 8, !tbaa !2
  %29 = load i64, i64* %arrayidx44, align 8, !tbaa !2
  %xor70.4 = xor i64 %29, %xor59.4
  store i64 %xor70.4, i64* %arrayidx44, align 8, !tbaa !2
  %30 = load i64, i64* %arrayidx46, align 8, !tbaa !2
  %xor73.4 = xor i64 %30, %xor59.4
  store i64 %xor73.4, i64* %arrayidx46, align 8, !tbaa !2
  br label %for.body77

for.cond93.preheader:                             ; preds = %for.body77
  %31 = load i64, i64* %st, align 8, !tbaa !2
  %32 = load i64, i64* %arrayidx9, align 8, !tbaa !2
  %33 = load i64, i64* %arrayidx19, align 8, !tbaa !2
  %34 = load i64, i64* %arrayidx29, align 8, !tbaa !2
  %35 = load i64, i64* %arrayidx39, align 8, !tbaa !2
  %neg = xor i64 %32, -1
  %and = and i64 %33, %neg
  %xor113 = xor i64 %and, %31
  store i64 %xor113, i64* %st, align 8, !tbaa !2
  %neg115 = xor i64 %33, -1
  %and117 = and i64 %34, %neg115
  %xor120 = xor i64 %and117, %32
  store i64 %xor120, i64* %arrayidx9, align 8, !tbaa !2
  %neg122 = xor i64 %34, -1
  %and124 = and i64 %35, %neg122
  %xor127 = xor i64 %and124, %33
  store i64 %xor127, i64* %arrayidx19, align 8, !tbaa !2
  %neg129 = xor i64 %35, -1
  %and131 = and i64 %31, %neg129
  %xor134 = xor i64 %and131, %34
  store i64 %xor134, i64* %arrayidx29, align 8, !tbaa !2
  %neg136 = xor i64 %31, -1
  %and138 = and i64 %32, %neg136
  %xor141 = xor i64 %35, %and138
  store i64 %xor141, i64* %arrayidx39, align 8, !tbaa !2
  %36 = load i64, i64* %arrayidx1, align 8, !tbaa !2
  %37 = load i64, i64* %arrayidx10, align 8, !tbaa !2
  %38 = load i64, i64* %arrayidx20, align 8, !tbaa !2
  %39 = load i64, i64* %arrayidx30, align 8, !tbaa !2
  %40 = load i64, i64* %arrayidx40, align 8, !tbaa !2
  %neg.1 = xor i64 %37, -1
  %and.1 = and i64 %38, %neg.1
  %xor113.1 = xor i64 %and.1, %36
  store i64 %xor113.1, i64* %arrayidx1, align 8, !tbaa !2
  %neg115.1 = xor i64 %38, -1
  %and117.1 = and i64 %39, %neg115.1
  %xor120.1 = xor i64 %and117.1, %37
  store i64 %xor120.1, i64* %arrayidx10, align 8, !tbaa !2
  %neg122.1 = xor i64 %39, -1
  %and124.1 = and i64 %40, %neg122.1
  %xor127.1 = xor i64 %and124.1, %38
  store i64 %xor127.1, i64* %arrayidx20, align 8, !tbaa !2
  %neg129.1 = xor i64 %40, -1
  %and131.1 = and i64 %36, %neg129.1
  %xor134.1 = xor i64 %and131.1, %39
  store i64 %xor134.1, i64* %arrayidx30, align 8, !tbaa !2
  %neg136.1 = xor i64 %36, -1
  %and138.1 = and i64 %37, %neg136.1
  %xor141.1 = xor i64 %40, %and138.1
  store i64 %xor141.1, i64* %arrayidx40, align 8, !tbaa !2
  %41 = load i64, i64* %arrayidx2, align 8, !tbaa !2
  %42 = load i64, i64* %arrayidx12, align 8, !tbaa !2
  %43 = load i64, i64* %arrayidx22, align 8, !tbaa !2
  %44 = load i64, i64* %arrayidx32, align 8, !tbaa !2
  %45 = load i64, i64* %arrayidx42, align 8, !tbaa !2
  %neg.2 = xor i64 %42, -1
  %and.2 = and i64 %43, %neg.2
  %xor113.2 = xor i64 %and.2, %41
  store i64 %xor113.2, i64* %arrayidx2, align 8, !tbaa !2
  %neg115.2 = xor i64 %43, -1
  %and117.2 = and i64 %44, %neg115.2
  %xor120.2 = xor i64 %and117.2, %42
  store i64 %xor120.2, i64* %arrayidx12, align 8, !tbaa !2
  %neg122.2 = xor i64 %44, -1
  %and124.2 = and i64 %45, %neg122.2
  %xor127.2 = xor i64 %and124.2, %43
  store i64 %xor127.2, i64* %arrayidx22, align 8, !tbaa !2
  %neg129.2 = xor i64 %45, -1
  %and131.2 = and i64 %41, %neg129.2
  %xor134.2 = xor i64 %and131.2, %44
  store i64 %xor134.2, i64* %arrayidx32, align 8, !tbaa !2
  %neg136.2 = xor i64 %41, -1
  %and138.2 = and i64 %42, %neg136.2
  %xor141.2 = xor i64 %45, %and138.2
  store i64 %xor141.2, i64* %arrayidx42, align 8, !tbaa !2
  %46 = load i64, i64* %arrayidx4, align 8, !tbaa !2
  %47 = load i64, i64* %arrayidx14, align 8, !tbaa !2
  %48 = load i64, i64* %arrayidx24, align 8, !tbaa !2
  %49 = load i64, i64* %arrayidx34, align 8, !tbaa !2
  %50 = load i64, i64* %arrayidx44, align 8, !tbaa !2
  %neg.3 = xor i64 %47, -1
  %and.3 = and i64 %48, %neg.3
  %xor113.3 = xor i64 %and.3, %46
  store i64 %xor113.3, i64* %arrayidx4, align 8, !tbaa !2
  %neg115.3 = xor i64 %48, -1
  %and117.3 = and i64 %49, %neg115.3
  %xor120.3 = xor i64 %and117.3, %47
  store i64 %xor120.3, i64* %arrayidx14, align 8, !tbaa !2
  %neg122.3 = xor i64 %49, -1
  %and124.3 = and i64 %50, %neg122.3
  %xor127.3 = xor i64 %and124.3, %48
  store i64 %xor127.3, i64* %arrayidx24, align 8, !tbaa !2
  %neg129.3 = xor i64 %50, -1
  %and131.3 = and i64 %46, %neg129.3
  %xor134.3 = xor i64 %and131.3, %49
  store i64 %xor134.3, i64* %arrayidx34, align 8, !tbaa !2
  %neg136.3 = xor i64 %46, -1
  %and138.3 = and i64 %47, %neg136.3
  %xor141.3 = xor i64 %50, %and138.3
  store i64 %xor141.3, i64* %arrayidx44, align 8, !tbaa !2
  %51 = load i64, i64* %arrayidx6, align 8, !tbaa !2
  %52 = load i64, i64* %arrayidx16, align 8, !tbaa !2
  %53 = load i64, i64* %arrayidx26, align 8, !tbaa !2
  %54 = load i64, i64* %arrayidx36, align 8, !tbaa !2
  %55 = load i64, i64* %arrayidx46, align 8, !tbaa !2
  %neg.4 = xor i64 %52, -1
  %and.4 = and i64 %53, %neg.4
  %xor113.4 = xor i64 %and.4, %51
  store i64 %xor113.4, i64* %arrayidx6, align 8, !tbaa !2
  %neg115.4 = xor i64 %53, -1
  %and117.4 = and i64 %54, %neg115.4
  %xor120.4 = xor i64 %and117.4, %52
  store i64 %xor120.4, i64* %arrayidx16, align 8, !tbaa !2
  %neg122.4 = xor i64 %54, -1
  %and124.4 = and i64 %55, %neg122.4
  %xor127.4 = xor i64 %and124.4, %53
  store i64 %xor127.4, i64* %arrayidx26, align 8, !tbaa !2
  %neg129.4 = xor i64 %55, -1
  %and131.4 = and i64 %51, %neg129.4
  %xor134.4 = xor i64 %and131.4, %54
  store i64 %xor134.4, i64* %arrayidx36, align 8, !tbaa !2
  %neg136.4 = xor i64 %51, -1
  %and138.4 = and i64 %52, %neg136.4
  %xor141.4 = xor i64 %55, %and138.4
  store i64 %xor141.4, i64* %arrayidx46, align 8, !tbaa !2
  %arrayidx145 = getelementptr inbounds [24 x i64], [24 x i64]* @keccakf_rndc, i32 0, i32 %round.0239
  %56 = load i64, i64* %arrayidx145, align 8, !tbaa !2
  %57 = load i64, i64* %st, align 8, !tbaa !2
  %xor147 = xor i64 %57, %56
  store i64 %xor147, i64* %st, align 8, !tbaa !2
  %inc149 = add nuw nsw i32 %round.0239, 1
  %exitcond250 = icmp eq i32 %inc149, %rounds
  br i1 %exitcond250, label %for.end150, label %for.body

for.body77:                                       ; preds = %for.body77, %for.body
  %t.0236 = phi i64 [ %xor61.1, %for.body ], [ %59, %for.body77 ]
  %i.1235 = phi i32 [ 0, %for.body ], [ %inc91, %for.body77 ]
  %arrayidx78 = getelementptr inbounds [24 x i32], [24 x i32]* @keccakf_piln, i32 0, i32 %i.1235
  %58 = load i32, i32* %arrayidx78, align 4, !tbaa !6
  %arrayidx79 = getelementptr inbounds i64, i64* %st, i32 %58
  %59 = load i64, i64* %arrayidx79, align 8, !tbaa !2
  %arrayidx81 = getelementptr inbounds [24 x i32], [24 x i32]* @keccakf_rotc, i32 0, i32 %i.1235
  %60 = load i32, i32* %arrayidx81, align 4, !tbaa !6
  %sh_prom = zext i32 %60 to i64
  %shl82 = shl i64 %t.0236, %sh_prom
  %sub = sub nsw i32 64, %60
  %sh_prom84 = zext i32 %sub to i64
  %shr85 = lshr i64 %t.0236, %sh_prom84
  %or86 = or i64 %shr85, %shl82
  store i64 %or86, i64* %arrayidx79, align 8, !tbaa !2
  %inc91 = add nuw nsw i32 %i.1235, 1
  %exitcond = icmp eq i32 %inc91, 24
  br i1 %exitcond, label %for.cond93.preheader, label %for.body77

for.end150:                                       ; preds = %for.cond93.preheader, %entry
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind
define hidden void @keccak(i8* nocapture readonly %in, i32 %inlen, i8* nocapture %md, i32 %mdlen) local_unnamed_addr #0 {
entry:
  %st = alloca [25 x i64], align 16
  %temp = alloca [144 x i8], align 16
  %0 = bitcast [25 x i64]* %st to i8*
  call void @llvm.lifetime.start.p0i8(i64 200, i8* nonnull %0) #2
  %1 = getelementptr inbounds [144 x i8], [144 x i8]* %temp, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %1) #2
  %cmp = icmp eq i32 %mdlen, 200
  %mul = shl nsw i32 %mdlen, 1
  %sub = sub nsw i32 200, %mul
  %cond = select i1 %cmp, i32 136, i32 %sub
  %div = sdiv i32 %cond, 8
  %arraydecay = getelementptr inbounds [25 x i64], [25 x i64]* %st, i32 0, i32 0
  call void @llvm.memset.p0i8.i32(i8* nonnull align 16 dereferenceable(200) %0, i8 0, i32 200, i1 false)
  %cmp161 = icmp sgt i32 %cond, %inlen
  br i1 %cmp161, label %for.end9, label %for.cond2.preheader.lr.ph

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %cmp359 = icmp sgt i32 %cond, 7
  br i1 %cmp359, label %for.cond2.preheader.us, label %for.cond2.preheader

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.lr.ph, %for.cond2.for.end_crit_edge.us
  %in.addr.063.us = phi i8* [ %add.ptr.us, %for.cond2.for.end_crit_edge.us ], [ %in, %for.cond2.preheader.lr.ph ]
  %inlen.addr.062.us = phi i32 [ %sub8.us, %for.cond2.for.end_crit_edge.us ], [ %inlen, %for.cond2.preheader.lr.ph ]
  %2 = bitcast i8* %in.addr.063.us to i64*
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.body4.us, %for.cond2.preheader.us
  %i.060.us = phi i32 [ 0, %for.cond2.preheader.us ], [ %inc.us, %for.body4.us ]
  %arrayidx.us = getelementptr inbounds i64, i64* %2, i32 %i.060.us
  %3 = load i64, i64* %arrayidx.us, align 8, !tbaa !2
  %arrayidx5.us = getelementptr inbounds [25 x i64], [25 x i64]* %st, i32 0, i32 %i.060.us
  %4 = load i64, i64* %arrayidx5.us, align 8, !tbaa !2
  %xor.us = xor i64 %4, %3
  store i64 %xor.us, i64* %arrayidx5.us, align 8, !tbaa !2
  %inc.us = add nuw nsw i32 %i.060.us, 1
  %exitcond66 = icmp eq i32 %inc.us, %div
  br i1 %exitcond66, label %for.cond2.for.end_crit_edge.us, label %for.body4.us

for.cond2.for.end_crit_edge.us:                   ; preds = %for.body4.us
  call void @keccakf(i64* nonnull %arraydecay, i32 24)
  %sub8.us = sub nsw i32 %inlen.addr.062.us, %cond
  %add.ptr.us = getelementptr inbounds i8, i8* %in.addr.063.us, i32 %cond
  %cmp1.us = icmp slt i32 %sub8.us, %cond
  br i1 %cmp1.us, label %for.end9, label %for.cond2.preheader.us

for.cond2.preheader:                              ; preds = %for.cond2.preheader.lr.ph, %for.cond2.preheader
  %in.addr.063 = phi i8* [ %add.ptr, %for.cond2.preheader ], [ %in, %for.cond2.preheader.lr.ph ]
  %inlen.addr.062 = phi i32 [ %sub8, %for.cond2.preheader ], [ %inlen, %for.cond2.preheader.lr.ph ]
  call void @keccakf(i64* nonnull %arraydecay, i32 24)
  %sub8 = sub nsw i32 %inlen.addr.062, %cond
  %add.ptr = getelementptr inbounds i8, i8* %in.addr.063, i32 %cond
  %cmp1 = icmp slt i32 %sub8, %cond
  br i1 %cmp1, label %for.end9, label %for.cond2.preheader

for.end9:                                         ; preds = %for.cond2.preheader, %for.cond2.for.end_crit_edge.us, %entry
  %inlen.addr.0.lcssa = phi i32 [ %inlen, %entry ], [ %sub8.us, %for.cond2.for.end_crit_edge.us ], [ %sub8, %for.cond2.preheader ]
  %in.addr.0.lcssa = phi i8* [ %in, %entry ], [ %add.ptr.us, %for.cond2.for.end_crit_edge.us ], [ %add.ptr, %for.cond2.preheader ]
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 %1, i8* align 1 %in.addr.0.lcssa, i32 %inlen.addr.0.lcssa, i1 false)
  %inc11 = add nsw i32 %inlen.addr.0.lcssa, 1
  %arrayidx12 = getelementptr inbounds [144 x i8], [144 x i8]* %temp, i32 0, i32 %inlen.addr.0.lcssa
  store i8 1, i8* %arrayidx12, align 1, !tbaa !8
  %add.ptr14 = getelementptr inbounds [144 x i8], [144 x i8]* %temp, i32 0, i32 %inc11
  %sub15 = sub nsw i32 %cond, %inc11
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 %add.ptr14, i8 0, i32 %sub15, i1 false)
  %sub16 = add nsw i32 %cond, -1
  %arrayidx17 = getelementptr inbounds [144 x i8], [144 x i8]* %temp, i32 0, i32 %sub16
  %5 = load i8, i8* %arrayidx17, align 1, !tbaa !8
  %6 = or i8 %5, -128
  store i8 %6, i8* %arrayidx17, align 1, !tbaa !8
  %cmp2057 = icmp sgt i32 %cond, 7
  br i1 %cmp2057, label %for.body22.lr.ph, label %for.end29

for.body22.lr.ph:                                 ; preds = %for.end9
  %7 = bitcast [144 x i8]* %temp to i64*
  br label %for.body22

for.body22:                                       ; preds = %for.body22, %for.body22.lr.ph
  %i.158 = phi i32 [ 0, %for.body22.lr.ph ], [ %inc28, %for.body22 ]
  %arrayidx24 = getelementptr inbounds i64, i64* %7, i32 %i.158
  %8 = load i64, i64* %arrayidx24, align 8, !tbaa !2
  %arrayidx25 = getelementptr inbounds [25 x i64], [25 x i64]* %st, i32 0, i32 %i.158
  %9 = load i64, i64* %arrayidx25, align 8, !tbaa !2
  %xor26 = xor i64 %9, %8
  store i64 %xor26, i64* %arrayidx25, align 8, !tbaa !2
  %inc28 = add nuw nsw i32 %i.158, 1
  %exitcond = icmp eq i32 %inc28, %div
  br i1 %exitcond, label %for.end29, label %for.body22

for.end29:                                        ; preds = %for.body22, %for.end9
  call void @keccakf(i64* nonnull %arraydecay, i32 24)
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 1 %md, i8* nonnull align 16 %0, i32 %mdlen, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %1) #2
  call void @llvm.lifetime.end.p0i8(i64 200, i8* nonnull %0) #2
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #1

; Function Attrs: nounwind
define hidden void @keccak1600(i8* nocapture readonly %in, i32 %inlen, i8* nocapture %md) local_unnamed_addr #0 {
entry:
  %st.i = alloca [25 x i64], align 16
  %temp.i = alloca [144 x i8], align 16
  %0 = bitcast [25 x i64]* %st.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 200, i8* nonnull %0) #2
  %1 = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %1) #2
  %arraydecay.i = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 0
  call void @llvm.memset.p0i8.i32(i8* nonnull align 16 dereferenceable(200) %0, i8 0, i32 200, i1 false) #2
  %cmp161.i = icmp slt i32 %inlen, 136
  br i1 %cmp161.i, label %for.end9.i, label %for.cond2.preheader.us.i.preheader

for.cond2.preheader.us.i.preheader:               ; preds = %entry
  %arrayidx5.us.i.1 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 1
  %arrayidx5.us.i.2 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 2
  %arrayidx5.us.i.3 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 3
  %arrayidx5.us.i.4 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 4
  %arrayidx5.us.i.5 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 5
  %arrayidx5.us.i.6 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 6
  %arrayidx5.us.i.7 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 7
  %arrayidx5.us.i.8 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 8
  %arrayidx5.us.i.9 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 9
  %arrayidx5.us.i.10 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 10
  %arrayidx5.us.i.11 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 11
  %arrayidx5.us.i.12 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 12
  %arrayidx5.us.i.13 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 13
  %arrayidx5.us.i.14 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 14
  %arrayidx5.us.i.15 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 15
  %arrayidx5.us.i.16 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 16
  br label %for.cond2.preheader.us.i

for.cond2.preheader.us.i:                         ; preds = %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge, %for.cond2.preheader.us.i.preheader
  %2 = phi i64 [ %.pre15, %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge ], [ 0, %for.cond2.preheader.us.i.preheader ]
  %3 = phi i64 [ %.pre30, %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge ], [ 0, %for.cond2.preheader.us.i.preheader ]
  %4 = phi i64 [ %.pre29, %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge ], [ 0, %for.cond2.preheader.us.i.preheader ]
  %5 = phi i64 [ %.pre28, %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge ], [ 0, %for.cond2.preheader.us.i.preheader ]
  %6 = phi i64 [ %.pre27, %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge ], [ 0, %for.cond2.preheader.us.i.preheader ]
  %7 = phi i64 [ %.pre26, %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge ], [ 0, %for.cond2.preheader.us.i.preheader ]
  %8 = phi i64 [ %.pre25, %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge ], [ 0, %for.cond2.preheader.us.i.preheader ]
  %9 = phi i64 [ %.pre24, %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge ], [ 0, %for.cond2.preheader.us.i.preheader ]
  %10 = phi i64 [ %.pre23, %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge ], [ 0, %for.cond2.preheader.us.i.preheader ]
  %11 = phi i64 [ %.pre22, %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge ], [ 0, %for.cond2.preheader.us.i.preheader ]
  %12 = phi i64 [ %.pre21, %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge ], [ 0, %for.cond2.preheader.us.i.preheader ]
  %13 = phi i64 [ %.pre20, %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge ], [ 0, %for.cond2.preheader.us.i.preheader ]
  %14 = phi i64 [ %.pre19, %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge ], [ 0, %for.cond2.preheader.us.i.preheader ]
  %15 = phi i64 [ %.pre18, %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge ], [ 0, %for.cond2.preheader.us.i.preheader ]
  %16 = phi i64 [ %.pre17, %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge ], [ 0, %for.cond2.preheader.us.i.preheader ]
  %17 = phi i64 [ %.pre16, %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge ], [ 0, %for.cond2.preheader.us.i.preheader ]
  %in.addr.063.us.i = phi i8* [ %add.ptr.us.i, %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge ], [ %in, %for.cond2.preheader.us.i.preheader ]
  %inlen.addr.062.us.i = phi i32 [ %sub8.us.i, %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge ], [ %inlen, %for.cond2.preheader.us.i.preheader ]
  %18 = bitcast i8* %in.addr.063.us.i to i64*
  %19 = load i64, i64* %18, align 8, !tbaa !2
  %xor.us.i = xor i64 %17, %19
  store i64 %xor.us.i, i64* %arraydecay.i, align 16, !tbaa !2
  %arrayidx.us.i.1 = getelementptr inbounds i8, i8* %in.addr.063.us.i, i32 8
  %20 = bitcast i8* %arrayidx.us.i.1 to i64*
  %21 = load i64, i64* %20, align 8, !tbaa !2
  %xor.us.i.1 = xor i64 %16, %21
  store i64 %xor.us.i.1, i64* %arrayidx5.us.i.1, align 8, !tbaa !2
  %arrayidx.us.i.2 = getelementptr inbounds i8, i8* %in.addr.063.us.i, i32 16
  %22 = bitcast i8* %arrayidx.us.i.2 to i64*
  %23 = load i64, i64* %22, align 8, !tbaa !2
  %xor.us.i.2 = xor i64 %15, %23
  store i64 %xor.us.i.2, i64* %arrayidx5.us.i.2, align 16, !tbaa !2
  %arrayidx.us.i.3 = getelementptr inbounds i8, i8* %in.addr.063.us.i, i32 24
  %24 = bitcast i8* %arrayidx.us.i.3 to i64*
  %25 = load i64, i64* %24, align 8, !tbaa !2
  %xor.us.i.3 = xor i64 %14, %25
  store i64 %xor.us.i.3, i64* %arrayidx5.us.i.3, align 8, !tbaa !2
  %arrayidx.us.i.4 = getelementptr inbounds i8, i8* %in.addr.063.us.i, i32 32
  %26 = bitcast i8* %arrayidx.us.i.4 to i64*
  %27 = load i64, i64* %26, align 8, !tbaa !2
  %xor.us.i.4 = xor i64 %13, %27
  store i64 %xor.us.i.4, i64* %arrayidx5.us.i.4, align 16, !tbaa !2
  %arrayidx.us.i.5 = getelementptr inbounds i8, i8* %in.addr.063.us.i, i32 40
  %28 = bitcast i8* %arrayidx.us.i.5 to i64*
  %29 = load i64, i64* %28, align 8, !tbaa !2
  %xor.us.i.5 = xor i64 %12, %29
  store i64 %xor.us.i.5, i64* %arrayidx5.us.i.5, align 8, !tbaa !2
  %arrayidx.us.i.6 = getelementptr inbounds i8, i8* %in.addr.063.us.i, i32 48
  %30 = bitcast i8* %arrayidx.us.i.6 to i64*
  %31 = load i64, i64* %30, align 8, !tbaa !2
  %xor.us.i.6 = xor i64 %11, %31
  store i64 %xor.us.i.6, i64* %arrayidx5.us.i.6, align 16, !tbaa !2
  %arrayidx.us.i.7 = getelementptr inbounds i8, i8* %in.addr.063.us.i, i32 56
  %32 = bitcast i8* %arrayidx.us.i.7 to i64*
  %33 = load i64, i64* %32, align 8, !tbaa !2
  %xor.us.i.7 = xor i64 %10, %33
  store i64 %xor.us.i.7, i64* %arrayidx5.us.i.7, align 8, !tbaa !2
  %arrayidx.us.i.8 = getelementptr inbounds i8, i8* %in.addr.063.us.i, i32 64
  %34 = bitcast i8* %arrayidx.us.i.8 to i64*
  %35 = load i64, i64* %34, align 8, !tbaa !2
  %xor.us.i.8 = xor i64 %9, %35
  store i64 %xor.us.i.8, i64* %arrayidx5.us.i.8, align 16, !tbaa !2
  %arrayidx.us.i.9 = getelementptr inbounds i8, i8* %in.addr.063.us.i, i32 72
  %36 = bitcast i8* %arrayidx.us.i.9 to i64*
  %37 = load i64, i64* %36, align 8, !tbaa !2
  %xor.us.i.9 = xor i64 %8, %37
  store i64 %xor.us.i.9, i64* %arrayidx5.us.i.9, align 8, !tbaa !2
  %arrayidx.us.i.10 = getelementptr inbounds i8, i8* %in.addr.063.us.i, i32 80
  %38 = bitcast i8* %arrayidx.us.i.10 to i64*
  %39 = load i64, i64* %38, align 8, !tbaa !2
  %xor.us.i.10 = xor i64 %7, %39
  store i64 %xor.us.i.10, i64* %arrayidx5.us.i.10, align 16, !tbaa !2
  %arrayidx.us.i.11 = getelementptr inbounds i8, i8* %in.addr.063.us.i, i32 88
  %40 = bitcast i8* %arrayidx.us.i.11 to i64*
  %41 = load i64, i64* %40, align 8, !tbaa !2
  %xor.us.i.11 = xor i64 %6, %41
  store i64 %xor.us.i.11, i64* %arrayidx5.us.i.11, align 8, !tbaa !2
  %arrayidx.us.i.12 = getelementptr inbounds i8, i8* %in.addr.063.us.i, i32 96
  %42 = bitcast i8* %arrayidx.us.i.12 to i64*
  %43 = load i64, i64* %42, align 8, !tbaa !2
  %xor.us.i.12 = xor i64 %5, %43
  store i64 %xor.us.i.12, i64* %arrayidx5.us.i.12, align 16, !tbaa !2
  %arrayidx.us.i.13 = getelementptr inbounds i8, i8* %in.addr.063.us.i, i32 104
  %44 = bitcast i8* %arrayidx.us.i.13 to i64*
  %45 = load i64, i64* %44, align 8, !tbaa !2
  %xor.us.i.13 = xor i64 %4, %45
  store i64 %xor.us.i.13, i64* %arrayidx5.us.i.13, align 8, !tbaa !2
  %arrayidx.us.i.14 = getelementptr inbounds i8, i8* %in.addr.063.us.i, i32 112
  %46 = bitcast i8* %arrayidx.us.i.14 to i64*
  %47 = load i64, i64* %46, align 8, !tbaa !2
  %xor.us.i.14 = xor i64 %3, %47
  store i64 %xor.us.i.14, i64* %arrayidx5.us.i.14, align 16, !tbaa !2
  %arrayidx.us.i.15 = getelementptr inbounds i8, i8* %in.addr.063.us.i, i32 120
  %48 = bitcast i8* %arrayidx.us.i.15 to i64*
  %49 = load i64, i64* %48, align 8, !tbaa !2
  %xor.us.i.15 = xor i64 %2, %49
  store i64 %xor.us.i.15, i64* %arrayidx5.us.i.15, align 8, !tbaa !2
  %arrayidx.us.i.16 = getelementptr inbounds i8, i8* %in.addr.063.us.i, i32 128
  %50 = bitcast i8* %arrayidx.us.i.16 to i64*
  %51 = load i64, i64* %50, align 8, !tbaa !2
  %52 = load i64, i64* %arrayidx5.us.i.16, align 16, !tbaa !2
  %xor.us.i.16 = xor i64 %52, %51
  store i64 %xor.us.i.16, i64* %arrayidx5.us.i.16, align 16, !tbaa !2
  call void @keccakf(i64* nonnull %arraydecay.i, i32 24) #2
  %sub8.us.i = add nsw i32 %inlen.addr.062.us.i, -136
  %add.ptr.us.i = getelementptr inbounds i8, i8* %in.addr.063.us.i, i32 136
  %cmp1.us.i = icmp slt i32 %inlen.addr.062.us.i, 272
  %.pre16 = load i64, i64* %arraydecay.i, align 16, !tbaa !2
  %.pre17 = load i64, i64* %arrayidx5.us.i.1, align 8, !tbaa !2
  %.pre18 = load i64, i64* %arrayidx5.us.i.2, align 16, !tbaa !2
  %.pre19 = load i64, i64* %arrayidx5.us.i.3, align 8, !tbaa !2
  %.pre20 = load i64, i64* %arrayidx5.us.i.4, align 16, !tbaa !2
  %.pre21 = load i64, i64* %arrayidx5.us.i.5, align 8, !tbaa !2
  %.pre22 = load i64, i64* %arrayidx5.us.i.6, align 16, !tbaa !2
  %.pre23 = load i64, i64* %arrayidx5.us.i.7, align 8, !tbaa !2
  %.pre24 = load i64, i64* %arrayidx5.us.i.8, align 16, !tbaa !2
  %.pre25 = load i64, i64* %arrayidx5.us.i.9, align 8, !tbaa !2
  %.pre26 = load i64, i64* %arrayidx5.us.i.10, align 16, !tbaa !2
  %.pre27 = load i64, i64* %arrayidx5.us.i.11, align 8, !tbaa !2
  %.pre28 = load i64, i64* %arrayidx5.us.i.12, align 16, !tbaa !2
  %.pre29 = load i64, i64* %arrayidx5.us.i.13, align 8, !tbaa !2
  %.pre30 = load i64, i64* %arrayidx5.us.i.14, align 16, !tbaa !2
  br i1 %cmp1.us.i, label %for.end9.i, label %for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge

for.cond2.preheader.us.i.for.cond2.preheader.us.i_crit_edge: ; preds = %for.cond2.preheader.us.i
  %.pre15 = load i64, i64* %arrayidx5.us.i.15, align 8, !tbaa !2
  br label %for.cond2.preheader.us.i

for.end9.i:                                       ; preds = %for.cond2.preheader.us.i, %entry
  %53 = phi i64 [ 0, %entry ], [ %.pre30, %for.cond2.preheader.us.i ]
  %54 = phi i64 [ 0, %entry ], [ %.pre29, %for.cond2.preheader.us.i ]
  %55 = phi i64 [ 0, %entry ], [ %.pre28, %for.cond2.preheader.us.i ]
  %56 = phi i64 [ 0, %entry ], [ %.pre27, %for.cond2.preheader.us.i ]
  %57 = phi i64 [ 0, %entry ], [ %.pre26, %for.cond2.preheader.us.i ]
  %58 = phi i64 [ 0, %entry ], [ %.pre25, %for.cond2.preheader.us.i ]
  %59 = phi i64 [ 0, %entry ], [ %.pre24, %for.cond2.preheader.us.i ]
  %60 = phi i64 [ 0, %entry ], [ %.pre23, %for.cond2.preheader.us.i ]
  %61 = phi i64 [ 0, %entry ], [ %.pre22, %for.cond2.preheader.us.i ]
  %62 = phi i64 [ 0, %entry ], [ %.pre21, %for.cond2.preheader.us.i ]
  %63 = phi i64 [ 0, %entry ], [ %.pre20, %for.cond2.preheader.us.i ]
  %64 = phi i64 [ 0, %entry ], [ %.pre19, %for.cond2.preheader.us.i ]
  %65 = phi i64 [ 0, %entry ], [ %.pre18, %for.cond2.preheader.us.i ]
  %66 = phi i64 [ 0, %entry ], [ %.pre17, %for.cond2.preheader.us.i ]
  %67 = phi i64 [ 0, %entry ], [ %.pre16, %for.cond2.preheader.us.i ]
  %inlen.addr.0.lcssa.i = phi i32 [ %inlen, %entry ], [ %sub8.us.i, %for.cond2.preheader.us.i ]
  %in.addr.0.lcssa.i = phi i8* [ %in, %entry ], [ %add.ptr.us.i, %for.cond2.preheader.us.i ]
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 %1, i8* align 1 %in.addr.0.lcssa.i, i32 %inlen.addr.0.lcssa.i, i1 false) #2
  %inc11.i = add nsw i32 %inlen.addr.0.lcssa.i, 1
  %arrayidx12.i = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 %inlen.addr.0.lcssa.i
  store i8 1, i8* %arrayidx12.i, align 1, !tbaa !8
  %add.ptr14.i = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 %inc11.i
  %sub15.i = sub i32 135, %inlen.addr.0.lcssa.i
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 %add.ptr14.i, i8 0, i32 %sub15.i, i1 false) #2
  %arrayidx17.i = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 135
  %68 = load i8, i8* %arrayidx17.i, align 1, !tbaa !8
  %69 = or i8 %68, -128
  store i8 %69, i8* %arrayidx17.i, align 1, !tbaa !8
  %70 = bitcast [144 x i8]* %temp.i to i64*
  %71 = load i64, i64* %70, align 16, !tbaa !2
  %xor26.i = xor i64 %67, %71
  store i64 %xor26.i, i64* %arraydecay.i, align 16, !tbaa !2
  %arrayidx24.i.1 = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 8
  %72 = bitcast i8* %arrayidx24.i.1 to i64*
  %73 = load i64, i64* %72, align 8, !tbaa !2
  %arrayidx25.i.1 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 1
  %xor26.i.1 = xor i64 %66, %73
  store i64 %xor26.i.1, i64* %arrayidx25.i.1, align 8, !tbaa !2
  %arrayidx24.i.2 = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 16
  %74 = bitcast i8* %arrayidx24.i.2 to i64*
  %75 = load i64, i64* %74, align 16, !tbaa !2
  %arrayidx25.i.2 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 2
  %xor26.i.2 = xor i64 %65, %75
  store i64 %xor26.i.2, i64* %arrayidx25.i.2, align 16, !tbaa !2
  %arrayidx24.i.3 = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 24
  %76 = bitcast i8* %arrayidx24.i.3 to i64*
  %77 = load i64, i64* %76, align 8, !tbaa !2
  %arrayidx25.i.3 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 3
  %xor26.i.3 = xor i64 %64, %77
  store i64 %xor26.i.3, i64* %arrayidx25.i.3, align 8, !tbaa !2
  %arrayidx24.i.4 = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 32
  %78 = bitcast i8* %arrayidx24.i.4 to i64*
  %79 = load i64, i64* %78, align 16, !tbaa !2
  %arrayidx25.i.4 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 4
  %xor26.i.4 = xor i64 %63, %79
  store i64 %xor26.i.4, i64* %arrayidx25.i.4, align 16, !tbaa !2
  %arrayidx24.i.5 = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 40
  %80 = bitcast i8* %arrayidx24.i.5 to i64*
  %81 = load i64, i64* %80, align 8, !tbaa !2
  %arrayidx25.i.5 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 5
  %xor26.i.5 = xor i64 %62, %81
  store i64 %xor26.i.5, i64* %arrayidx25.i.5, align 8, !tbaa !2
  %arrayidx24.i.6 = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 48
  %82 = bitcast i8* %arrayidx24.i.6 to i64*
  %83 = load i64, i64* %82, align 16, !tbaa !2
  %arrayidx25.i.6 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 6
  %xor26.i.6 = xor i64 %61, %83
  store i64 %xor26.i.6, i64* %arrayidx25.i.6, align 16, !tbaa !2
  %arrayidx24.i.7 = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 56
  %84 = bitcast i8* %arrayidx24.i.7 to i64*
  %85 = load i64, i64* %84, align 8, !tbaa !2
  %arrayidx25.i.7 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 7
  %xor26.i.7 = xor i64 %60, %85
  store i64 %xor26.i.7, i64* %arrayidx25.i.7, align 8, !tbaa !2
  %arrayidx24.i.8 = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 64
  %86 = bitcast i8* %arrayidx24.i.8 to i64*
  %87 = load i64, i64* %86, align 16, !tbaa !2
  %arrayidx25.i.8 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 8
  %xor26.i.8 = xor i64 %59, %87
  store i64 %xor26.i.8, i64* %arrayidx25.i.8, align 16, !tbaa !2
  %arrayidx24.i.9 = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 72
  %88 = bitcast i8* %arrayidx24.i.9 to i64*
  %89 = load i64, i64* %88, align 8, !tbaa !2
  %arrayidx25.i.9 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 9
  %xor26.i.9 = xor i64 %58, %89
  store i64 %xor26.i.9, i64* %arrayidx25.i.9, align 8, !tbaa !2
  %arrayidx24.i.10 = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 80
  %90 = bitcast i8* %arrayidx24.i.10 to i64*
  %91 = load i64, i64* %90, align 16, !tbaa !2
  %arrayidx25.i.10 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 10
  %xor26.i.10 = xor i64 %57, %91
  store i64 %xor26.i.10, i64* %arrayidx25.i.10, align 16, !tbaa !2
  %arrayidx24.i.11 = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 88
  %92 = bitcast i8* %arrayidx24.i.11 to i64*
  %93 = load i64, i64* %92, align 8, !tbaa !2
  %arrayidx25.i.11 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 11
  %xor26.i.11 = xor i64 %56, %93
  store i64 %xor26.i.11, i64* %arrayidx25.i.11, align 8, !tbaa !2
  %arrayidx24.i.12 = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 96
  %94 = bitcast i8* %arrayidx24.i.12 to i64*
  %95 = load i64, i64* %94, align 16, !tbaa !2
  %arrayidx25.i.12 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 12
  %xor26.i.12 = xor i64 %55, %95
  store i64 %xor26.i.12, i64* %arrayidx25.i.12, align 16, !tbaa !2
  %arrayidx24.i.13 = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 104
  %96 = bitcast i8* %arrayidx24.i.13 to i64*
  %97 = load i64, i64* %96, align 8, !tbaa !2
  %arrayidx25.i.13 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 13
  %xor26.i.13 = xor i64 %54, %97
  store i64 %xor26.i.13, i64* %arrayidx25.i.13, align 8, !tbaa !2
  %arrayidx24.i.14 = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 112
  %98 = bitcast i8* %arrayidx24.i.14 to i64*
  %99 = load i64, i64* %98, align 16, !tbaa !2
  %arrayidx25.i.14 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 14
  %xor26.i.14 = xor i64 %53, %99
  store i64 %xor26.i.14, i64* %arrayidx25.i.14, align 16, !tbaa !2
  %arrayidx24.i.15 = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 120
  %100 = bitcast i8* %arrayidx24.i.15 to i64*
  %101 = load i64, i64* %100, align 8, !tbaa !2
  %arrayidx25.i.15 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 15
  %102 = load i64, i64* %arrayidx25.i.15, align 8, !tbaa !2
  %xor26.i.15 = xor i64 %102, %101
  store i64 %xor26.i.15, i64* %arrayidx25.i.15, align 8, !tbaa !2
  %arrayidx24.i.16 = getelementptr inbounds [144 x i8], [144 x i8]* %temp.i, i32 0, i32 128
  %103 = bitcast i8* %arrayidx24.i.16 to i64*
  %104 = load i64, i64* %103, align 16, !tbaa !2
  %arrayidx25.i.16 = getelementptr inbounds [25 x i64], [25 x i64]* %st.i, i32 0, i32 16
  %105 = load i64, i64* %arrayidx25.i.16, align 16, !tbaa !2
  %xor26.i.16 = xor i64 %105, %104
  store i64 %xor26.i.16, i64* %arrayidx25.i.16, align 16, !tbaa !2
  call void @keccakf(i64* nonnull %arraydecay.i, i32 24) #2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(200) %md, i8* nonnull align 16 dereferenceable(200) %0, i32 200, i1 false) #2
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %1) #2
  call void @llvm.lifetime.end.p0i8(i64 200, i8* nonnull %0) #2
  ret void
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (/b/s/w/ir/cache/git/chromium.googlesource.com-external-github.com-llvm-llvm--project 3774bcf9f84520a8c35bf765d9a528040d68a14b)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"long long", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
!8 = !{!4, !4, i64 0}
