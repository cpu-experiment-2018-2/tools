; ModuleID = 'lib.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

; Function Attrs: norecurse nounwind readnone
declare float @llvm.sqrt.f32(float)
define void @print_char(i32 %x)  {
  call void asm sideeffect "outll %$0", "r" (i32 %x)
  ret void
}
declare float @llvm.floor.f32(float)
define float @sqrt(float %x)  {
    %1 = call float @llvm.sqrt.f32(float %x)
    ret float %1
}
define float @floor(float %x)  {
    %1 = call float @llvm.floor.f32(float %x)
    ret float %1
}
define float @float_of_int(i32 %x)  {
  %1 = sitofp i32 %x to float
  ret float %1
}

; Function Attrs: norecurse nounwind readnone
define i32 @int_of_float(float %y)  {
  %1 = fptosi float %y to i32
  ret i32 %1
}

; Function Attrs: norecurse nounwind readnone
define float @kernel_cos(float %x)  {
  %1 = fmul float %x, 5.000000e-01
  %2 = fmul float %1, %x
  %3 = fmul float %x, 0x3FB55554C0000000
  %4 = fmul float %3, %x
  %5 = fmul float %x, 0x3FA1111000000000
  %6 = fmul float %5, %x
  %7 = fmul float %x, 0x3F924921C0000000
  %8 = fmul float %7, %x
  %9 = fsub float 1.000000e+00, %8
  %10 = fmul float %6, %9
  %11 = fsub float 1.000000e+00, %10
  %12 = fmul float %4, %11
  %13 = fsub float 1.000000e+00, %12
  %14 = fmul float %2, %13
  %15 = fsub float 1.000000e+00, %14
  ret float %15
}

; Function Attrs: norecurse nounwind readnone
define float @kernel_sin(float %x)  {
  %1 = fmul float %x, 0x3FC55555A0000000
  %2 = fmul float %1, %x
  %3 = fmul float %x, 0x3FA99999A0000000
  %4 = fmul float %3, %x
  %5 = fmul float %x, 0x3F98618480000000
  %6 = fmul float %5, %x
  %7 = fmul float %x, 0x3F8C71BB20000000
  %8 = fmul float %7, %x
  %9 = fsub float 1.000000e+00, %8
  %10 = fmul float %6, %9
  %11 = fsub float 1.000000e+00, %10
  %12 = fmul float %4, %11
  %13 = fsub float 1.000000e+00, %12
  %14 = fmul float %2, %13
  %15 = fsub float 1.000000e+00, %14
  %16 = fmul float %15, %x
  ret float %16
}

; Function Attrs: norecurse nounwind
define i32* @mymalloc(i32 %x)  {
  %1 = load i32, i32* inttoptr (i32 1 to i32*), align 4, !tbaa !1
  %2 = add nsw i32 %1, %x
  store i32 %2, i32* inttoptr (i32 1 to i32*), align 4, !tbaa !1
  %3 = inttoptr i32 %1 to i32*
  ret i32* %3
}
declare i32* @create_array_sub(i32 %a, i32 %b)

; Function Attrs: norecurse nounwind
define i32* @create_tuple(i32 %x)  {
  %1 = tail call i32* @mymalloc(i32 %x)
  ret i32* %1
}
define i32* @create_array(i32 %a, i32 %b)  {
  %1 = icmp eq i32 %b, 0
  br i1 %1, label %2, label %4

; <label>:2                                       ; preds = %0
  %3 = tail call i32* @mymalloc(i32 %a)
  br label %6

; <label>:4                                       ; preds = %0
  %5 = tail call i32* @create_array_sub(i32 %a, i32 %b)
  br label %6

; <label>:6                                       ; preds = %4, %2
  %.0 = phi i32* [ %3, %2 ], [ %5, %4 ]
  ret i32* %.0
}

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
