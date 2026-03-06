; ModuleID = './output_cflat_optee/ir/st.ll'
source_filename = "./embench-iot-benchmarks-backup/libst.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@Seed = dso_local global i32 0, align 4
@Coef = dso_local global double 0.000000e+00, align 8
@SumA = dso_local global double 0.000000e+00, align 8
@SumB = dso_local global double 0.000000e+00, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@ArrayA = dso_local global [100 x double] zeroinitializer, align 8
@ArrayB = dso_local global [100 x double] zeroinitializer, align 8
@llvm.compiler.used = appending global [1 x ptr] [ptr @main], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define dso_local void @initialise_benchmark() #0 {
  call void @__cflat_call_return(i64 105672226824528)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @warm_caches(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  call void @__cflat_call_enter(i64 105672226826656, i64 105672226825024)
  %5 = call i32 @benchmark_body(i32 noundef %4)
  store i32 %5, ptr %3, align 4
  call void @__cflat_call_return(i64 105672226825024)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @benchmark_body(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  call void @__cflat_record_node(i64 105672226826656)
  br label %10

10:                                               ; preds = %19, %1
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %2, align 4
  %13 = icmp slt i32 %11, %12
  call void @__cflat_record_node(i64 105672226829104)
  br i1 %13, label %14, label %22

14:                                               ; preds = %10
  call void @__cflat_call_enter(i64 105672226839664, i64 105672226829888)
  call void @InitSeed()
  call void @__cflat_call_enter(i64 105672226830096, i64 105672226829888)
  call void @Initialize(ptr noundef @ArrayA)
  call void @__cflat_call_enter(i64 105672226830608, i64 105672226829888)
  call void @Calc_Sum_Mean(ptr noundef @ArrayA, ptr noundef @SumA, ptr noundef %4)
  %15 = load double, ptr %4, align 8
  call void @__cflat_call_enter(i64 105672226831040, i64 105672226829888)
  call void @Calc_Var_Stddev(ptr noundef @ArrayA, double noundef %15, ptr noundef %6, ptr noundef %8)
  call void @__cflat_call_enter(i64 105672226830096, i64 105672226829888)
  call void @Initialize(ptr noundef @ArrayB)
  call void @__cflat_call_enter(i64 105672226830608, i64 105672226829888)
  call void @Calc_Sum_Mean(ptr noundef @ArrayB, ptr noundef @SumB, ptr noundef %5)
  %16 = load double, ptr %5, align 8
  call void @__cflat_call_enter(i64 105672226831040, i64 105672226829888)
  call void @Calc_Var_Stddev(ptr noundef @ArrayB, double noundef %16, ptr noundef %7, ptr noundef %9)
  %17 = load double, ptr %4, align 8
  %18 = load double, ptr %5, align 8
  call void @__cflat_call_enter(i64 105672226832688, i64 105672226829888)
  call void @Calc_LinCorrCoef(ptr noundef @ArrayA, ptr noundef @ArrayB, double noundef %17, double noundef %18)
  call void @__cflat_record_node(i64 105672226829888)
  br label %19

19:                                               ; preds = %14
  %20 = load i32, ptr %3, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %3, align 4
  call void @__cflat_record_node(i64 105672226833440)
  br label %10, !llvm.loop !6

22:                                               ; preds = %10
  call void @__cflat_call_return(i64 105672226826656)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @benchmark() #0 {
  call void @__cflat_call_enter(i64 105672226826656, i64 105672226838608)
  %1 = call i32 @benchmark_body(i32 noundef 13000)
  call void @__cflat_call_return(i64 105672226838608)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @InitSeed() #0 {
  store i32 0, ptr @Seed, align 4
  call void @__cflat_call_return(i64 105672226839664)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Calc_Sum_Mean(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %5, align 8
  store double 0.000000e+00, ptr %8, align 8
  store i32 0, ptr %7, align 4
  call void @__cflat_record_node(i64 105672226830608)
  br label %9

9:                                                ; preds = %21, %3
  %10 = load i32, ptr %7, align 4
  %11 = icmp slt i32 %10, 100
  call void @__cflat_record_node(i64 105672226841888)
  br i1 %11, label %12, label %24

12:                                               ; preds = %9
  %13 = load ptr, ptr %4, align 8
  %14 = load i32, ptr %7, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds double, ptr %13, i64 %15
  %17 = load double, ptr %16, align 8
  %18 = load ptr, ptr %5, align 8
  %19 = load double, ptr %18, align 8
  %20 = fadd double %19, %17
  store double %20, ptr %18, align 8
  call void @__cflat_record_node(i64 105672226842560)
  br label %21

21:                                               ; preds = %12
  %22 = load i32, ptr %7, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %7, align 4
  call void @__cflat_record_node(i64 105672226843968)
  br label %9, !llvm.loop !8

24:                                               ; preds = %9
  %25 = load ptr, ptr %5, align 8
  %26 = load double, ptr %25, align 8
  %27 = fdiv double %26, 1.000000e+02
  %28 = load ptr, ptr %6, align 8
  store double %27, ptr %28, align 8
  call void @__cflat_call_return(i64 105672226830608)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @Square(double noundef %0) #0 {
  %2 = alloca double, align 8
  store double %0, ptr %2, align 8
  %3 = load double, ptr %2, align 8
  %4 = load double, ptr %2, align 8
  %5 = fmul double %3, %4
  call void @__cflat_call_return(i64 105672226846064)
  ret double %5
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Calc_Var_Stddev(ptr noundef %0, double noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca double, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  store ptr %0, ptr %5, align 8
  store double %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  store double 0.000000e+00, ptr %10, align 8
  store i32 0, ptr %9, align 4
  call void @__cflat_record_node(i64 105672226831040)
  br label %11

11:                                               ; preds = %25, %4
  %12 = load i32, ptr %9, align 4
  %13 = icmp slt i32 %12, 100
  call void @__cflat_record_node(i64 105672226849312)
  br i1 %13, label %14, label %28

14:                                               ; preds = %11
  %15 = load ptr, ptr %5, align 8
  %16 = load i32, ptr %9, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds double, ptr %15, i64 %17
  %19 = load double, ptr %18, align 8
  %20 = load double, ptr %6, align 8
  %21 = fsub double %19, %20
  call void @__cflat_call_enter(i64 105672226846064, i64 105672226849984)
  %22 = call double @Square(double noundef %21)
  %23 = load double, ptr %10, align 8
  %24 = fadd double %23, %22
  store double %24, ptr %10, align 8
  call void @__cflat_record_node(i64 105672226849984)
  br label %25

25:                                               ; preds = %14
  %26 = load i32, ptr %9, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %9, align 4
  call void @__cflat_record_node(i64 105672226851776)
  br label %11, !llvm.loop !9

28:                                               ; preds = %11
  %29 = load double, ptr %10, align 8
  %30 = fdiv double %29, 1.000000e+02
  %31 = load ptr, ptr %7, align 8
  store double %30, ptr %31, align 8
  %32 = load ptr, ptr %7, align 8
  %33 = load double, ptr %32, align 8
  %34 = call double @sqrt(double noundef %33) #4
  %35 = load ptr, ptr %8, align 8
  store double %34, ptr %35, align 8
  call void @__cflat_call_return(i64 105672226831040)
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @Calc_LinCorrCoef(ptr noundef %0, ptr noundef %1, double noundef %2, double noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store double %2, ptr %7, align 8
  store double %3, ptr %8, align 8
  store double 0.000000e+00, ptr %10, align 8
  store double 0.000000e+00, ptr %12, align 8
  store double 0.000000e+00, ptr %11, align 8
  store i32 0, ptr %9, align 4
  call void @__cflat_record_node(i64 105672226832688)
  br label %13

13:                                               ; preds = %53, %4
  %14 = load i32, ptr %9, align 4
  %15 = icmp slt i32 %14, 100
  call void @__cflat_record_node(i64 105672226857440)
  br i1 %15, label %16, label %56

16:                                               ; preds = %13
  %17 = load ptr, ptr %5, align 8
  %18 = load i32, ptr %9, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds double, ptr %17, i64 %19
  %21 = load double, ptr %20, align 8
  %22 = load double, ptr %7, align 8
  %23 = fsub double %21, %22
  %24 = load ptr, ptr %6, align 8
  %25 = load i32, ptr %9, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double, ptr %24, i64 %26
  %28 = load double, ptr %27, align 8
  %29 = load double, ptr %8, align 8
  %30 = fsub double %28, %29
  %31 = load double, ptr %10, align 8
  %32 = call double @llvm.fmuladd.f64(double %23, double %30, double %31)
  store double %32, ptr %10, align 8
  %33 = load ptr, ptr %5, align 8
  %34 = load i32, ptr %9, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, ptr %33, i64 %35
  %37 = load double, ptr %36, align 8
  %38 = load double, ptr %7, align 8
  %39 = fsub double %37, %38
  call void @__cflat_call_enter(i64 105672226846064, i64 105672226858112)
  %40 = call double @Square(double noundef %39)
  %41 = load double, ptr %11, align 8
  %42 = fadd double %41, %40
  store double %42, ptr %11, align 8
  %43 = load ptr, ptr %6, align 8
  %44 = load i32, ptr %9, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds double, ptr %43, i64 %45
  %47 = load double, ptr %46, align 8
  %48 = load double, ptr %8, align 8
  %49 = fsub double %47, %48
  call void @__cflat_call_enter(i64 105672226846064, i64 105672226858112)
  %50 = call double @Square(double noundef %49)
  %51 = load double, ptr %12, align 8
  %52 = fadd double %51, %50
  store double %52, ptr %12, align 8
  call void @__cflat_record_node(i64 105672226858112)
  br label %53

53:                                               ; preds = %16
  %54 = load i32, ptr %9, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %9, align 4
  call void @__cflat_record_node(i64 105672226865920)
  br label %13, !llvm.loop !10

56:                                               ; preds = %13
  %57 = load double, ptr %10, align 8
  %58 = load double, ptr %11, align 8
  %59 = call double @sqrt(double noundef %58) #4
  %60 = load double, ptr %12, align 8
  %61 = call double @sqrt(double noundef %60) #4
  %62 = fmul double %59, %61
  %63 = fdiv double %57, %62
  store double %63, ptr @Coef, align 8
  call void @__cflat_call_return(i64 105672226832688)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @Initialize(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  call void @__cflat_record_node(i64 105672226830096)
  br label %4

4:                                                ; preds = %18, %1
  %5 = load i32, ptr %3, align 4
  %6 = icmp slt i32 %5, 100
  call void @__cflat_record_node(i64 105672226864208)
  br i1 %6, label %7, label %21

7:                                                ; preds = %4
  %8 = load i32, ptr %3, align 4
  %9 = sitofp i32 %8 to double
  call void @__cflat_call_enter(i64 105672226868560, i64 105672226868320)
  %10 = call i32 @RandomInteger()
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 8.095000e+03
  %13 = fadd double %9, %12
  %14 = load ptr, ptr %2, align 8
  %15 = load i32, ptr %3, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds double, ptr %14, i64 %16
  store double %13, ptr %17, align 8
  call void @__cflat_record_node(i64 105672226868320)
  br label %18

18:                                               ; preds = %7
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %3, align 4
  call void @__cflat_record_node(i64 105672226870160)
  br label %4, !llvm.loop !11

21:                                               ; preds = %4
  call void @__cflat_call_return(i64 105672226830096)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @RandomInteger() #0 {
  %1 = load i32, ptr @Seed, align 4
  %2 = mul nsw i32 %1, 133
  %3 = add nsw i32 %2, 81
  %4 = srem i32 %3, 8095
  store i32 %4, ptr @Seed, align 4
  %5 = load i32, ptr @Seed, align 4
  call void @__cflat_call_return(i64 105672226868560)
  ret i32 %5
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @verify_benchmark(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  store i32 %0, ptr %2, align 4
  store double 0x40B38700A1EACFC6, ptr %3, align 8
  store double 0x40B384D7D641766E, ptr %4, align 8
  store double 0x3FEFFF2E665BAD45, ptr %5, align 8
  %6 = load double, ptr %3, align 8
  %7 = load double, ptr @SumA, align 8
  %8 = fsub double %6, %7
  %9 = call double @llvm.fabs.f64(double %8)
  %10 = fcmp olt double %9, 1.000000e-13
  call void @__cflat_record_node(i64 105672226872976)
  br i1 %10, label %11, label %23

11:                                               ; preds = %1
  %12 = load double, ptr %4, align 8
  %13 = load double, ptr @SumB, align 8
  %14 = fsub double %12, %13
  %15 = call double @llvm.fabs.f64(double %14)
  %16 = fcmp olt double %15, 1.000000e-13
  call void @__cflat_record_node(i64 105672226875696)
  br i1 %16, label %17, label %23

17:                                               ; preds = %11
  %18 = load double, ptr %5, align 8
  %19 = load double, ptr @Coef, align 8
  %20 = fsub double %18, %19
  %21 = call double @llvm.fabs.f64(double %20)
  %22 = fcmp olt double %21, 1.000000e-13
  call void @__cflat_record_node(i64 105672226876736)
  br label %23

23:                                               ; preds = %17, %11, %1
  %24 = phi i1 [ false, %11 ], [ false, %1 ], [ %22, %17 ]
  %25 = zext i1 %24 to i32
  call void @__cflat_call_return(i64 105672226872976)
  ret i32 %25
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  call void @__cflat_call_enter(i64 105672226906768, i64 105672226819760)
  call void @initialise_benchmark()
  call void @__cflat_call_enter(i64 105672226825024, i64 105672226819760)
  call void @warm_caches(i32 noundef 0)
  call void @__cflat_call_enter(i64 105672226909808, i64 105672226819760)
  %8 = call i32 @benchmark()
  store volatile i32 %8, ptr %6, align 4
  call void @cflat_finalize_and_print()
  %9 = load volatile i32, ptr %6, align 4
  call void @__cflat_call_enter(i64 105672226872976, i64 105672226819760)
  %10 = call i32 @verify_benchmark(i32 noundef %9)
  store i32 %10, ptr %7, align 4
  %11 = load i32, ptr %7, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %11)
  call void @__cflat_call_return(i64 105672226819760)
  ret i32 0
}

declare void @cflat_finalize_and_print() #3

declare i32 @printf(ptr noundef, ...) #3

declare void @__cflat_call_return(i64)

declare void @__cflat_call_enter(i64, i64)

declare void @__cflat_record_node(i64)

attributes #0 = { noinline nounwind uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #1 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
