; ModuleID = './output_oat_countonly/ir/nbody.ll'
source_filename = "./embench-iot-benchmarks-backup-cflat-next/nbody.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

%struct.body = type { [3 x double], double, [3 x double], double }

@verify_benchmark.expected = internal global [5 x %struct.body] [%struct.body { [3 x double] zeroinitializer, double 0.000000e+00, [3 x double] [double 0xBF3967E9A7E0D6F3, double 0xBF6AD4ECFE5089FB, double 0x3EF919331F0B8A72], double 0x4043BD3CC9BE45DE }, %struct.body { [3 x double] [double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0], double 0.000000e+00, [3 x double] [double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715], double 0x3FA34C95D9AB33D8 }, %struct.body { [3 x double] [double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C], double 0.000000e+00, [3 x double] [double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4], double 0x3F871D490D07C637 }, %struct.body { [3 x double] [double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0], double 0.000000e+00, [3 x double] [double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C], double 0x3F5C3DD29CF41EB3 }, %struct.body { [3 x double] [double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540], double 0.000000e+00, [3 x double] [double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6], double 0x3F60A8F3531799AC }], align 8
@solar_bodies = internal global [5 x %struct.body] [%struct.body { [3 x double] zeroinitializer, double 0.000000e+00, [3 x double] zeroinitializer, double 0x4043BD3CC9BE45DE }, %struct.body { [3 x double] [double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0], double 0.000000e+00, [3 x double] [double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715], double 0x3FA34C95D9AB33D8 }, %struct.body { [3 x double] [double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C], double 0.000000e+00, [3 x double] [double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4], double 0x3F871D490D07C637 }, %struct.body { [3 x double] [double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0], double 0.000000e+00, [3 x double] [double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C], double 0x3F5C3DD29CF41EB3 }, %struct.body { [3 x double] [double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540], double 0.000000e+00, [3 x double] [double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6], double 0x3F60A8F3531799AC }], align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@llvm.compiler.used = appending global [1 x ptr] [ptr @main], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define dso_local void @offset_momentum(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %45, %2
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp ult i32 %8, %9
  br i1 %10, label %11, label %48

11:                                               ; preds = %7
  call void @__oat_log(i32 1)
  store i32 0, ptr %6, align 4
  br label %12

12:                                               ; preds = %41, %11
  %13 = load i32, ptr %6, align 4
  %14 = icmp ult i32 %13, 3
  br i1 %14, label %15, label %44

15:                                               ; preds = %12
  call void @__oat_log(i32 1)
  %16 = load ptr, ptr %3, align 8
  %17 = load i32, ptr %5, align 4
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds %struct.body, ptr %16, i64 %18
  %20 = getelementptr inbounds %struct.body, ptr %19, i32 0, i32 2
  %21 = load i32, ptr %6, align 4
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds [3 x double], ptr %20, i64 0, i64 %22
  %24 = load double, ptr %23, align 8
  %25 = load ptr, ptr %3, align 8
  %26 = load i32, ptr %5, align 4
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds %struct.body, ptr %25, i64 %27
  %29 = getelementptr inbounds %struct.body, ptr %28, i32 0, i32 3
  %30 = load double, ptr %29, align 8
  %31 = fmul double %24, %30
  %32 = fdiv double %31, 0x4043BD3CC9BE45DE
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds %struct.body, ptr %33, i64 0
  %35 = getelementptr inbounds %struct.body, ptr %34, i32 0, i32 2
  %36 = load i32, ptr %6, align 4
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds [3 x double], ptr %35, i64 0, i64 %37
  %39 = load double, ptr %38, align 8
  %40 = fsub double %39, %32
  store double %40, ptr %38, align 8
  br label %41

41:                                               ; preds = %15
  %42 = load i32, ptr %6, align 4
  %43 = add i32 %42, 1
  store i32 %43, ptr %6, align 4
  br label %12, !llvm.loop !6

44:                                               ; preds = %12
  call void @__oat_log(i32 0)
  br label %45

45:                                               ; preds = %44
  %46 = load i32, ptr %5, align 4
  %47 = add i32 %46, 1
  store i32 %47, ptr %5, align 4
  br label %7, !llvm.loop !8

48:                                               ; preds = %7
  call void @__oat_log(i32 0)
  call void @__oat_func_exit(i32 1624)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @bodies_energy(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca [3 x double], align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store double 0.000000e+00, ptr %7, align 8
  store i32 0, ptr %8, align 4
  br label %11

11:                                               ; preds = %145, %2
  %12 = load i32, ptr %8, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp ult i32 %12, %13
  br i1 %14, label %15, label %148

15:                                               ; preds = %11
  call void @__oat_log(i32 1)
  %16 = load ptr, ptr %3, align 8
  %17 = load i32, ptr %8, align 4
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds %struct.body, ptr %16, i64 %18
  %20 = getelementptr inbounds %struct.body, ptr %19, i32 0, i32 3
  %21 = load double, ptr %20, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = load i32, ptr %8, align 4
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds %struct.body, ptr %22, i64 %24
  %26 = getelementptr inbounds %struct.body, ptr %25, i32 0, i32 2
  %27 = getelementptr inbounds [3 x double], ptr %26, i64 0, i64 0
  %28 = load double, ptr %27, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = load i32, ptr %8, align 4
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds %struct.body, ptr %29, i64 %31
  %33 = getelementptr inbounds %struct.body, ptr %32, i32 0, i32 2
  %34 = getelementptr inbounds [3 x double], ptr %33, i64 0, i64 0
  %35 = load double, ptr %34, align 8
  %36 = load ptr, ptr %3, align 8
  %37 = load i32, ptr %8, align 4
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds %struct.body, ptr %36, i64 %38
  %40 = getelementptr inbounds %struct.body, ptr %39, i32 0, i32 2
  %41 = getelementptr inbounds [3 x double], ptr %40, i64 0, i64 1
  %42 = load double, ptr %41, align 8
  %43 = load ptr, ptr %3, align 8
  %44 = load i32, ptr %8, align 4
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds %struct.body, ptr %43, i64 %45
  %47 = getelementptr inbounds %struct.body, ptr %46, i32 0, i32 2
  %48 = getelementptr inbounds [3 x double], ptr %47, i64 0, i64 1
  %49 = load double, ptr %48, align 8
  %50 = fmul double %42, %49
  %51 = call double @llvm.fmuladd.f64(double %28, double %35, double %50)
  %52 = load ptr, ptr %3, align 8
  %53 = load i32, ptr %8, align 4
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds %struct.body, ptr %52, i64 %54
  %56 = getelementptr inbounds %struct.body, ptr %55, i32 0, i32 2
  %57 = getelementptr inbounds [3 x double], ptr %56, i64 0, i64 2
  %58 = load double, ptr %57, align 8
  %59 = load ptr, ptr %3, align 8
  %60 = load i32, ptr %8, align 4
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds %struct.body, ptr %59, i64 %61
  %63 = getelementptr inbounds %struct.body, ptr %62, i32 0, i32 2
  %64 = getelementptr inbounds [3 x double], ptr %63, i64 0, i64 2
  %65 = load double, ptr %64, align 8
  %66 = call double @llvm.fmuladd.f64(double %58, double %65, double %51)
  %67 = fmul double %21, %66
  %68 = fdiv double %67, 2.000000e+00
  %69 = load double, ptr %7, align 8
  %70 = fadd double %69, %68
  store double %70, ptr %7, align 8
  %71 = load i32, ptr %8, align 4
  %72 = add i32 %71, 1
  store i32 %72, ptr %9, align 4
  br label %73

73:                                               ; preds = %141, %15
  %74 = load i32, ptr %9, align 4
  %75 = load i32, ptr %4, align 4
  %76 = icmp ult i32 %74, %75
  br i1 %76, label %77, label %144

77:                                               ; preds = %73
  call void @__oat_log(i32 1)
  store i32 0, ptr %10, align 4
  br label %78

78:                                               ; preds = %104, %77
  %79 = load i32, ptr %10, align 4
  %80 = icmp ult i32 %79, 3
  br i1 %80, label %81, label %107

81:                                               ; preds = %78
  call void @__oat_log(i32 1)
  %82 = load ptr, ptr %3, align 8
  %83 = load i32, ptr %8, align 4
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds %struct.body, ptr %82, i64 %84
  %86 = getelementptr inbounds %struct.body, ptr %85, i32 0, i32 0
  %87 = load i32, ptr %10, align 4
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds [3 x double], ptr %86, i64 0, i64 %88
  %90 = load double, ptr %89, align 8
  %91 = load ptr, ptr %3, align 8
  %92 = load i32, ptr %9, align 4
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds %struct.body, ptr %91, i64 %93
  %95 = getelementptr inbounds %struct.body, ptr %94, i32 0, i32 0
  %96 = load i32, ptr %10, align 4
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds [3 x double], ptr %95, i64 0, i64 %97
  %99 = load double, ptr %98, align 8
  %100 = fsub double %90, %99
  %101 = load i32, ptr %10, align 4
  %102 = zext i32 %101 to i64
  %103 = getelementptr inbounds [3 x double], ptr %5, i64 0, i64 %102
  store double %100, ptr %103, align 8
  br label %104

104:                                              ; preds = %81
  %105 = load i32, ptr %10, align 4
  %106 = add i32 %105, 1
  store i32 %106, ptr %10, align 4
  br label %78, !llvm.loop !9

107:                                              ; preds = %78
  call void @__oat_log(i32 0)
  %108 = getelementptr inbounds [3 x double], ptr %5, i64 0, i64 0
  %109 = load double, ptr %108, align 8
  %110 = getelementptr inbounds [3 x double], ptr %5, i64 0, i64 0
  %111 = load double, ptr %110, align 8
  %112 = getelementptr inbounds [3 x double], ptr %5, i64 0, i64 1
  %113 = load double, ptr %112, align 8
  %114 = getelementptr inbounds [3 x double], ptr %5, i64 0, i64 1
  %115 = load double, ptr %114, align 8
  %116 = fmul double %113, %115
  %117 = call double @llvm.fmuladd.f64(double %109, double %111, double %116)
  %118 = getelementptr inbounds [3 x double], ptr %5, i64 0, i64 2
  %119 = load double, ptr %118, align 8
  %120 = getelementptr inbounds [3 x double], ptr %5, i64 0, i64 2
  %121 = load double, ptr %120, align 8
  %122 = call double @llvm.fmuladd.f64(double %119, double %121, double %117)
  %123 = call double @sqrt(double noundef %122) #4
  store double %123, ptr %6, align 8
  %124 = load ptr, ptr %3, align 8
  %125 = load i32, ptr %8, align 4
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds %struct.body, ptr %124, i64 %126
  %128 = getelementptr inbounds %struct.body, ptr %127, i32 0, i32 3
  %129 = load double, ptr %128, align 8
  %130 = load ptr, ptr %3, align 8
  %131 = load i32, ptr %9, align 4
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds %struct.body, ptr %130, i64 %132
  %134 = getelementptr inbounds %struct.body, ptr %133, i32 0, i32 3
  %135 = load double, ptr %134, align 8
  %136 = fmul double %129, %135
  %137 = load double, ptr %6, align 8
  %138 = fdiv double %136, %137
  %139 = load double, ptr %7, align 8
  %140 = fsub double %139, %138
  store double %140, ptr %7, align 8
  br label %141

141:                                              ; preds = %107
  %142 = load i32, ptr %9, align 4
  %143 = add i32 %142, 1
  store i32 %143, ptr %9, align 4
  br label %73, !llvm.loop !10

144:                                              ; preds = %73
  call void @__oat_log(i32 0)
  br label %145

145:                                              ; preds = %144
  %146 = load i32, ptr %8, align 4
  %147 = add i32 %146, 1
  store i32 %147, ptr %8, align 4
  br label %11, !llvm.loop !11

148:                                              ; preds = %11
  call void @__oat_log(i32 0)
  %149 = load double, ptr %7, align 8
  call void @__oat_func_exit(i32 1375)
  ret double %149
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: nounwind
declare double @sqrt(double noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @initialise_benchmark() #0 {
  call void @__oat_func_exit(i32 2101)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @warm_caches(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = call i32 @benchmark_body(i32 noundef %4)
  store i32 %5, ptr %3, align 4
  call void @__oat_func_exit(i32 1149)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @benchmark_body(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca double, align 8
  %5 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store double 0.000000e+00, ptr %4, align 8
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %22, %1
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %25

10:                                               ; preds = %6
  call void @__oat_log(i32 1)
  call void @offset_momentum(ptr noundef @solar_bodies, i32 noundef 5)
  store double 0.000000e+00, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %11

11:                                               ; preds = %18, %10
  %12 = load i32, ptr %5, align 4
  %13 = icmp slt i32 %12, 100
  br i1 %13, label %14, label %21

14:                                               ; preds = %11
  call void @__oat_log(i32 1)
  %15 = call double @bodies_energy(ptr noundef @solar_bodies, i32 noundef 5)
  %16 = load double, ptr %4, align 8
  %17 = fadd double %16, %15
  store double %17, ptr %4, align 8
  br label %18

18:                                               ; preds = %14
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %5, align 4
  br label %11, !llvm.loop !12

21:                                               ; preds = %11
  call void @__oat_log(i32 0)
  br label %22

22:                                               ; preds = %21
  %23 = load i32, ptr %3, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %3, align 4
  br label %6, !llvm.loop !13

25:                                               ; preds = %6
  call void @__oat_log(i32 0)
  %26 = load double, ptr %4, align 8
  %27 = fsub double %26, 0xC030E852FE60EF84
  %28 = call double @llvm.fabs.f64(double %27)
  %29 = fcmp olt double %28, 1.000000e-13
  %30 = zext i1 %29 to i32
  call void @__oat_func_exit(i32 1464)
  ret i32 %30
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @benchmark() #0 {
  %1 = call i32 @benchmark_body(i32 noundef 1000)
  call void @__oat_func_exit(i32 939)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @verify_benchmark(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %6 = load i32, ptr %3, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %82

8:                                                ; preds = %1
  call void @__oat_log(i32 1)
  store i32 0, ptr %4, align 4
  br label %9

9:                                                ; preds = %78, %8
  %10 = load i32, ptr %4, align 4
  %11 = icmp slt i32 %10, 5
  br i1 %11, label %12, label %81

12:                                               ; preds = %9
  call void @__oat_log(i32 1)
  store i32 0, ptr %5, align 4
  br label %13

13:                                               ; preds = %59, %12
  %14 = load i32, ptr %5, align 4
  %15 = icmp slt i32 %14, 3
  br i1 %15, label %16, label %62

16:                                               ; preds = %13
  call void @__oat_log(i32 1)
  %17 = load i32, ptr %4, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [5 x %struct.body], ptr @solar_bodies, i64 0, i64 %18
  %20 = getelementptr inbounds %struct.body, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %5, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [3 x double], ptr %20, i64 0, i64 %22
  %24 = load double, ptr %23, align 8
  %25 = load i32, ptr %4, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [5 x %struct.body], ptr @verify_benchmark.expected, i64 0, i64 %26
  %28 = getelementptr inbounds %struct.body, ptr %27, i32 0, i32 0
  %29 = load i32, ptr %5, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [3 x double], ptr %28, i64 0, i64 %30
  %32 = load double, ptr %31, align 8
  %33 = fsub double %24, %32
  %34 = call double @llvm.fabs.f64(double %33)
  %35 = fcmp olt double %34, 1.000000e-13
  br i1 %35, label %37, label %36

36:                                               ; preds = %16
  call void @__oat_log(i32 0)
  store i32 0, ptr %2, align 4
  br label %84

37:                                               ; preds = %16
  call void @__oat_log(i32 1)
  %38 = load i32, ptr %4, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [5 x %struct.body], ptr @solar_bodies, i64 0, i64 %39
  %41 = getelementptr inbounds %struct.body, ptr %40, i32 0, i32 2
  %42 = load i32, ptr %5, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [3 x double], ptr %41, i64 0, i64 %43
  %45 = load double, ptr %44, align 8
  %46 = load i32, ptr %4, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [5 x %struct.body], ptr @verify_benchmark.expected, i64 0, i64 %47
  %49 = getelementptr inbounds %struct.body, ptr %48, i32 0, i32 2
  %50 = load i32, ptr %5, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [3 x double], ptr %49, i64 0, i64 %51
  %53 = load double, ptr %52, align 8
  %54 = fsub double %45, %53
  %55 = call double @llvm.fabs.f64(double %54)
  %56 = fcmp olt double %55, 1.000000e-13
  br i1 %56, label %58, label %57

57:                                               ; preds = %37
  call void @__oat_log(i32 0)
  store i32 0, ptr %2, align 4
  br label %84

58:                                               ; preds = %37
  call void @__oat_log(i32 1)
  br label %59

59:                                               ; preds = %58
  %60 = load i32, ptr %5, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %5, align 4
  br label %13, !llvm.loop !14

62:                                               ; preds = %13
  call void @__oat_log(i32 0)
  %63 = load i32, ptr %4, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [5 x %struct.body], ptr @solar_bodies, i64 0, i64 %64
  %66 = getelementptr inbounds %struct.body, ptr %65, i32 0, i32 3
  %67 = load double, ptr %66, align 8
  %68 = load i32, ptr %4, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [5 x %struct.body], ptr @verify_benchmark.expected, i64 0, i64 %69
  %71 = getelementptr inbounds %struct.body, ptr %70, i32 0, i32 3
  %72 = load double, ptr %71, align 8
  %73 = fsub double %67, %72
  %74 = call double @llvm.fabs.f64(double %73)
  %75 = fcmp olt double %74, 1.000000e-13
  br i1 %75, label %77, label %76

76:                                               ; preds = %62
  call void @__oat_log(i32 0)
  store i32 0, ptr %2, align 4
  br label %84

77:                                               ; preds = %62
  call void @__oat_log(i32 1)
  br label %78

78:                                               ; preds = %77
  %79 = load i32, ptr %4, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, ptr %4, align 4
  br label %9, !llvm.loop !15

81:                                               ; preds = %9
  call void @__oat_log(i32 0)
  br label %83

82:                                               ; preds = %1
  call void @__oat_log(i32 0)
  store i32 0, ptr %2, align 4
  br label %84

83:                                               ; preds = %81
  store i32 1, ptr %2, align 4
  br label %84

84:                                               ; preds = %83, %82, %76, %57, %36
  %85 = load i32, ptr %2, align 4
  call void @__oat_func_exit(i32 1695)
  ret i32 %85
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  call void @initialise_benchmark()
  call void @warm_caches(i32 noundef 0)
  call void @__oat_init()
  %8 = call i32 @benchmark()
  store volatile i32 %8, ptr %6, align 4
  call void @__oat_print_proof()
  %9 = load volatile i32, ptr %6, align 4
  %10 = call i32 @verify_benchmark(i32 noundef %9)
  store i32 %10, ptr %7, align 4
  %11 = load i32, ptr %7, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %11)
  call void @__oat_func_exit(i32 421)
  ret i32 0
}

declare void @__oat_init() #3

declare void @__oat_print_proof() #3

declare i32 @printf(ptr noundef, ...) #3

declare void @__oat_log(i32)

declare void @__oat_log_indirect(i64)

declare void @__oat_func_exit(i32)

attributes #0 = { noinline nounwind uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
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
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
