; ModuleID = './output_optee/ir/cubic.ll'
source_filename = "./embench-iot-benchmarks/basicmath_small.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@verify_benchmark.exp_res0 = internal constant [3 x double] [double 2.000000e+00, double 6.000000e+00, double 2.500000e+00], align 8
@soln_cnt0 = internal global i32 0, align 4
@res0 = internal global [3 x double] zeroinitializer, align 8
@soln_cnt1 = internal global i32 0, align 4
@res1 = internal global double 0.000000e+00, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@llvm.compiler.used = appending global [1 x ptr] [ptr @main], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define dso_local void @SolveCubic(double noundef %0, double noundef %1, double noundef %2, double noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca fp128, align 16
  %14 = alloca fp128, align 16
  %15 = alloca fp128, align 16
  %16 = alloca fp128, align 16
  %17 = alloca fp128, align 16
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  store double %0, ptr %7, align 8
  store double %1, ptr %8, align 8
  store double %2, ptr %9, align 8
  store double %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  %20 = load double, ptr %8, align 8
  %21 = load double, ptr %7, align 8
  %22 = fdiv double %20, %21
  %23 = fpext double %22 to fp128
  store fp128 %23, ptr %13, align 16
  %24 = load double, ptr %9, align 8
  %25 = load double, ptr %7, align 8
  %26 = fdiv double %24, %25
  %27 = fpext double %26 to fp128
  store fp128 %27, ptr %14, align 16
  %28 = load double, ptr %10, align 8
  %29 = load double, ptr %7, align 8
  %30 = fdiv double %28, %29
  %31 = fpext double %30 to fp128
  store fp128 %31, ptr %15, align 16
  %32 = load fp128, ptr %13, align 16
  %33 = load fp128, ptr %13, align 16
  %34 = load fp128, ptr %14, align 16
  %35 = fmul fp128 0xL00000000000000004000800000000000, %34
  %36 = fneg fp128 %35
  %37 = call fp128 @llvm.fmuladd.f128(fp128 %32, fp128 %33, fp128 %36)
  %38 = fdiv fp128 %37, 0xL00000000000000004002200000000000
  store fp128 %38, ptr %16, align 16
  %39 = load fp128, ptr %13, align 16
  %40 = fmul fp128 0xL00000000000000004000000000000000, %39
  %41 = load fp128, ptr %13, align 16
  %42 = fmul fp128 %40, %41
  %43 = load fp128, ptr %13, align 16
  %44 = load fp128, ptr %13, align 16
  %45 = fmul fp128 0xL00000000000000004002200000000000, %44
  %46 = load fp128, ptr %14, align 16
  %47 = fmul fp128 %45, %46
  %48 = fneg fp128 %47
  %49 = call fp128 @llvm.fmuladd.f128(fp128 %42, fp128 %43, fp128 %48)
  %50 = load fp128, ptr %15, align 16
  %51 = call fp128 @llvm.fmuladd.f128(fp128 0xL00000000000000004003B00000000000, fp128 %50, fp128 %49)
  %52 = fdiv fp128 %51, 0xL00000000000000004004B00000000000
  store fp128 %52, ptr %17, align 16
  %53 = load fp128, ptr %17, align 16
  %54 = load fp128, ptr %17, align 16
  %55 = load fp128, ptr %16, align 16
  %56 = load fp128, ptr %16, align 16
  %57 = fmul fp128 %55, %56
  %58 = load fp128, ptr %16, align 16
  %59 = fmul fp128 %57, %58
  %60 = fneg fp128 %59
  %61 = call fp128 @llvm.fmuladd.f128(fp128 %53, fp128 %54, fp128 %60)
  %62 = fptrunc fp128 %61 to double
  store double %62, ptr %18, align 8
  %63 = load double, ptr %18, align 8
  %64 = fcmp ole double %63, 0.000000e+00
  call void @increment_cond_branch()
  br i1 %64, label %65, label %129

65:                                               ; preds = %6
  %66 = load ptr, ptr %11, align 8
  store i32 3, ptr %66, align 4
  %67 = load fp128, ptr %17, align 16
  %68 = fptrunc fp128 %67 to double
  %69 = load fp128, ptr %16, align 16
  %70 = load fp128, ptr %16, align 16
  %71 = fmul fp128 %69, %70
  %72 = load fp128, ptr %16, align 16
  %73 = fmul fp128 %71, %72
  %74 = fptrunc fp128 %73 to double
  call void @increment_direct_call()
  %75 = call double @sqrt(double noundef %74) #6
  %76 = fdiv double %68, %75
  call void @increment_direct_call()
  %77 = call double @acos(double noundef %76) #6
  store double %77, ptr %19, align 8
  %78 = load fp128, ptr %16, align 16
  %79 = fptrunc fp128 %78 to double
  call void @increment_direct_call()
  %80 = call double @sqrt(double noundef %79) #6
  %81 = fmul double -2.000000e+00, %80
  %82 = load double, ptr %19, align 8
  %83 = fdiv double %82, 3.000000e+00
  call void @increment_direct_call()
  %84 = call double @cos(double noundef %83) #6
  %85 = fmul double %81, %84
  %86 = fpext double %85 to fp128
  %87 = load fp128, ptr %13, align 16
  %88 = fdiv fp128 %87, 0xL00000000000000004000800000000000
  %89 = fsub fp128 %86, %88
  %90 = fptrunc fp128 %89 to double
  %91 = load ptr, ptr %12, align 8
  %92 = getelementptr inbounds double, ptr %91, i64 0
  store double %90, ptr %92, align 8
  %93 = load fp128, ptr %16, align 16
  %94 = fptrunc fp128 %93 to double
  call void @increment_direct_call()
  %95 = call double @sqrt(double noundef %94) #6
  %96 = fmul double -2.000000e+00, %95
  %97 = load double, ptr %19, align 8
  call void @increment_direct_call()
  %98 = call double @atan(double noundef 1.000000e+00) #6
  %99 = fmul double 4.000000e+00, %98
  %100 = call double @llvm.fmuladd.f64(double 2.000000e+00, double %99, double %97)
  %101 = fdiv double %100, 3.000000e+00
  call void @increment_direct_call()
  %102 = call double @cos(double noundef %101) #6
  %103 = fmul double %96, %102
  %104 = fpext double %103 to fp128
  %105 = load fp128, ptr %13, align 16
  %106 = fdiv fp128 %105, 0xL00000000000000004000800000000000
  %107 = fsub fp128 %104, %106
  %108 = fptrunc fp128 %107 to double
  %109 = load ptr, ptr %12, align 8
  %110 = getelementptr inbounds double, ptr %109, i64 1
  store double %108, ptr %110, align 8
  %111 = load fp128, ptr %16, align 16
  %112 = fptrunc fp128 %111 to double
  call void @increment_direct_call()
  %113 = call double @sqrt(double noundef %112) #6
  %114 = fmul double -2.000000e+00, %113
  %115 = load double, ptr %19, align 8
  call void @increment_direct_call()
  %116 = call double @atan(double noundef 1.000000e+00) #6
  %117 = fmul double 4.000000e+00, %116
  %118 = call double @llvm.fmuladd.f64(double 4.000000e+00, double %117, double %115)
  %119 = fdiv double %118, 3.000000e+00
  call void @increment_direct_call()
  %120 = call double @cos(double noundef %119) #6
  %121 = fmul double %114, %120
  %122 = fpext double %121 to fp128
  %123 = load fp128, ptr %13, align 16
  %124 = fdiv fp128 %123, 0xL00000000000000004000800000000000
  %125 = fsub fp128 %122, %124
  %126 = fptrunc fp128 %125 to double
  %127 = load ptr, ptr %12, align 8
  %128 = getelementptr inbounds double, ptr %127, i64 2
  store double %126, ptr %128, align 8
  call void @increment_uncond_branch()
  br label %166

129:                                              ; preds = %6
  %130 = load ptr, ptr %11, align 8
  store i32 1, ptr %130, align 4
  %131 = load double, ptr %18, align 8
  call void @increment_direct_call()
  %132 = call double @sqrt(double noundef %131) #6
  %133 = load fp128, ptr %17, align 16
  %134 = fptrunc fp128 %133 to double
  %135 = call double @llvm.fabs.f64(double %134)
  %136 = fadd double %132, %135
  call void @increment_direct_call()
  %137 = call double @pow(double noundef %136, double noundef 0x3FD5555555555555) #6
  %138 = load ptr, ptr %12, align 8
  %139 = getelementptr inbounds double, ptr %138, i64 0
  store double %137, ptr %139, align 8
  %140 = load fp128, ptr %16, align 16
  %141 = fptrunc fp128 %140 to double
  %142 = load ptr, ptr %12, align 8
  %143 = getelementptr inbounds double, ptr %142, i64 0
  %144 = load double, ptr %143, align 8
  %145 = fdiv double %141, %144
  %146 = load ptr, ptr %12, align 8
  %147 = getelementptr inbounds double, ptr %146, i64 0
  %148 = load double, ptr %147, align 8
  %149 = fadd double %148, %145
  store double %149, ptr %147, align 8
  %150 = load fp128, ptr %17, align 16
  %151 = fcmp olt fp128 %150, 0xL00000000000000000000000000000000
  %152 = zext i1 %151 to i64
  %153 = select i1 %151, i32 1, i32 -1
  %154 = sitofp i32 %153 to double
  %155 = load ptr, ptr %12, align 8
  %156 = getelementptr inbounds double, ptr %155, i64 0
  %157 = load double, ptr %156, align 8
  %158 = fmul double %157, %154
  store double %158, ptr %156, align 8
  %159 = load fp128, ptr %13, align 16
  %160 = fdiv fp128 %159, 0xL00000000000000004000800000000000
  %161 = fptrunc fp128 %160 to double
  %162 = load ptr, ptr %12, align 8
  %163 = getelementptr inbounds double, ptr %162, i64 0
  %164 = load double, ptr %163, align 8
  %165 = fsub double %164, %161
  store double %165, ptr %163, align 8
  call void @increment_uncond_branch()
  br label %166

166:                                              ; preds = %129, %65
  call void @increment_return()
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare fp128 @llvm.fmuladd.f128(fp128, fp128, fp128) #1

; Function Attrs: nounwind
declare double @acos(double noundef) #2

; Function Attrs: nounwind
declare double @sqrt(double noundef) #2

; Function Attrs: nounwind
declare double @cos(double noundef) #2

; Function Attrs: nounwind
declare double @atan(double noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @verify_benchmark(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca double, align 8
  store i32 %0, ptr %2, align 4
  store double 2.500000e+00, ptr %3, align 8
  %4 = load i32, ptr @soln_cnt0, align 4
  %5 = icmp eq i32 3, %4
  call void @increment_cond_branch()
  br i1 %5, label %6, label %32

6:                                                ; preds = %1
  %7 = load double, ptr @verify_benchmark.exp_res0, align 8
  %8 = load double, ptr @res0, align 8
  %9 = fsub double %7, %8
  %10 = call double @llvm.fabs.f64(double %9)
  %11 = fcmp olt double %10, 1.000000e-13
  call void @increment_cond_branch()
  br i1 %11, label %12, label %32

12:                                               ; preds = %6
  %13 = load double, ptr getelementptr inbounds ([3 x double], ptr @verify_benchmark.exp_res0, i64 0, i64 1), align 8
  %14 = load double, ptr getelementptr inbounds ([3 x double], ptr @res0, i64 0, i64 1), align 8
  %15 = fsub double %13, %14
  %16 = call double @llvm.fabs.f64(double %15)
  %17 = fcmp olt double %16, 1.000000e-13
  call void @increment_cond_branch()
  br i1 %17, label %18, label %32

18:                                               ; preds = %12
  %19 = load double, ptr getelementptr inbounds ([3 x double], ptr @verify_benchmark.exp_res0, i64 0, i64 2), align 8
  %20 = load double, ptr getelementptr inbounds ([3 x double], ptr @res0, i64 0, i64 2), align 8
  %21 = fsub double %19, %20
  %22 = call double @llvm.fabs.f64(double %21)
  %23 = fcmp olt double %22, 1.000000e-13
  call void @increment_cond_branch()
  br i1 %23, label %24, label %32

24:                                               ; preds = %18
  %25 = load i32, ptr @soln_cnt1, align 4
  %26 = icmp eq i32 1, %25
  call void @increment_cond_branch()
  br i1 %26, label %27, label %32

27:                                               ; preds = %24
  %28 = load double, ptr @res1, align 8
  %29 = fsub double 2.500000e+00, %28
  %30 = call double @llvm.fabs.f64(double %29)
  %31 = fcmp olt double %30, 1.000000e-13
  call void @increment_uncond_branch()
  br label %32

32:                                               ; preds = %27, %24, %18, %12, %6, %1
  %33 = phi i1 [ false, %24 ], [ false, %18 ], [ false, %12 ], [ false, %6 ], [ false, %1 ], [ %31, %27 ]
  %34 = zext i1 %33 to i32
  call void @increment_return()
  ret i32 %34
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @initialise_benchmark() #0 {
  call void @increment_return()
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @warm_caches(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  call void @increment_direct_call()
  %5 = call i32 @benchmark_body(i32 noundef %4)
  store i32 %5, ptr %3, align 4
  call void @increment_return()
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
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca double, align 8
  %17 = alloca double, align 8
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  %20 = alloca i32, align 4
  %21 = alloca [48 x double], align 8
  %22 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  call void @increment_uncond_branch()
  br label %23

23:                                               ; preds = %91, %1
  %24 = load i32, ptr %3, align 4
  %25 = load i32, ptr %2, align 4
  %26 = icmp slt i32 %24, %25
  call void @increment_cond_branch()
  br i1 %26, label %27, label %94

27:                                               ; preds = %23
  store double 1.000000e+00, ptr %4, align 8
  store double -1.050000e+01, ptr %5, align 8
  store double 3.200000e+01, ptr %6, align 8
  store double -3.000000e+01, ptr %7, align 8
  store double 1.000000e+00, ptr %8, align 8
  store double -4.500000e+00, ptr %9, align 8
  store double 1.700000e+01, ptr %10, align 8
  store double -3.000000e+01, ptr %11, align 8
  store double 1.000000e+00, ptr %12, align 8
  store double -3.500000e+00, ptr %13, align 8
  store double 2.200000e+01, ptr %14, align 8
  store double -3.100000e+01, ptr %15, align 8
  store double 1.000000e+00, ptr %16, align 8
  store double -1.370000e+01, ptr %17, align 8
  store double 1.000000e+00, ptr %18, align 8
  store double -3.500000e+01, ptr %19, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %21, i8 0, i64 384, i1 false)
  %28 = getelementptr inbounds [48 x double], ptr %21, i64 0, i64 0
  store ptr %28, ptr %22, align 8
  %29 = load double, ptr %4, align 8
  %30 = load double, ptr %5, align 8
  %31 = load double, ptr %6, align 8
  %32 = load double, ptr %7, align 8
  %33 = getelementptr inbounds [48 x double], ptr %21, i64 0, i64 0
  call void @increment_direct_call()
  call void @SolveCubic(double noundef %29, double noundef %30, double noundef %31, double noundef %32, ptr noundef %20, ptr noundef %33)
  %34 = load i32, ptr %20, align 4
  store i32 %34, ptr @soln_cnt0, align 4
  %35 = getelementptr inbounds [48 x double], ptr %21, i64 0, i64 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 @res0, ptr align 8 %35, i64 24, i1 false)
  %36 = load double, ptr %8, align 8
  %37 = load double, ptr %9, align 8
  %38 = load double, ptr %10, align 8
  %39 = load double, ptr %11, align 8
  %40 = getelementptr inbounds [48 x double], ptr %21, i64 0, i64 0
  call void @increment_direct_call()
  call void @SolveCubic(double noundef %36, double noundef %37, double noundef %38, double noundef %39, ptr noundef %20, ptr noundef %40)
  %41 = load i32, ptr %20, align 4
  store i32 %41, ptr @soln_cnt1, align 4
  %42 = getelementptr inbounds [48 x double], ptr %21, i64 0, i64 0
  %43 = load double, ptr %42, align 8
  store double %43, ptr @res1, align 8
  %44 = load double, ptr %12, align 8
  %45 = load double, ptr %13, align 8
  %46 = load double, ptr %14, align 8
  %47 = load double, ptr %15, align 8
  %48 = getelementptr inbounds [48 x double], ptr %21, i64 0, i64 0
  call void @increment_direct_call()
  call void @SolveCubic(double noundef %44, double noundef %45, double noundef %46, double noundef %47, ptr noundef %20, ptr noundef %48)
  %49 = load double, ptr %16, align 8
  %50 = load double, ptr %17, align 8
  %51 = load double, ptr %18, align 8
  %52 = load double, ptr %19, align 8
  %53 = getelementptr inbounds [48 x double], ptr %21, i64 0, i64 0
  call void @increment_direct_call()
  call void @SolveCubic(double noundef %49, double noundef %50, double noundef %51, double noundef %52, ptr noundef %20, ptr noundef %53)
  store double 1.000000e+00, ptr %4, align 8
  call void @increment_uncond_branch()
  br label %54

54:                                               ; preds = %87, %27
  %55 = load double, ptr %4, align 8
  %56 = fcmp olt double %55, 3.000000e+00
  call void @increment_cond_branch()
  br i1 %56, label %57, label %90

57:                                               ; preds = %54
  store double 1.000000e+01, ptr %5, align 8
  call void @increment_uncond_branch()
  br label %58

58:                                               ; preds = %83, %57
  %59 = load double, ptr %5, align 8
  %60 = fcmp ogt double %59, 8.000000e+00
  call void @increment_cond_branch()
  br i1 %60, label %61, label %86

61:                                               ; preds = %58
  store double 5.000000e+00, ptr %6, align 8
  call void @increment_uncond_branch()
  br label %62

62:                                               ; preds = %79, %61
  %63 = load double, ptr %6, align 8
  %64 = fcmp olt double %63, 6.000000e+00
  call void @increment_cond_branch()
  br i1 %64, label %65, label %82

65:                                               ; preds = %62
  store double -1.000000e+00, ptr %7, align 8
  call void @increment_uncond_branch()
  br label %66

66:                                               ; preds = %75, %65
  %67 = load double, ptr %7, align 8
  %68 = fcmp ogt double %67, -3.000000e+00
  call void @increment_cond_branch()
  br i1 %68, label %69, label %78

69:                                               ; preds = %66
  %70 = load double, ptr %4, align 8
  %71 = load double, ptr %5, align 8
  %72 = load double, ptr %6, align 8
  %73 = load double, ptr %7, align 8
  %74 = load ptr, ptr %22, align 8
  call void @increment_direct_call()
  call void @SolveCubic(double noundef %70, double noundef %71, double noundef %72, double noundef %73, ptr noundef %20, ptr noundef %74)
  call void @increment_uncond_branch()
  br label %75

75:                                               ; preds = %69
  %76 = load double, ptr %7, align 8
  %77 = fadd double %76, -1.000000e+00
  store double %77, ptr %7, align 8
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %66, !llvm.loop !6

78:                                               ; preds = %66
  call void @increment_uncond_branch()
  br label %79

79:                                               ; preds = %78
  %80 = load double, ptr %6, align 8
  %81 = fadd double %80, 5.000000e-01
  store double %81, ptr %6, align 8
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %62, !llvm.loop !8

82:                                               ; preds = %62
  call void @increment_uncond_branch()
  br label %83

83:                                               ; preds = %82
  %84 = load double, ptr %5, align 8
  %85 = fadd double %84, -1.000000e+00
  store double %85, ptr %5, align 8
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %58, !llvm.loop !9

86:                                               ; preds = %58
  call void @increment_uncond_branch()
  br label %87

87:                                               ; preds = %86
  %88 = load double, ptr %4, align 8
  %89 = fadd double %88, 1.000000e+00
  store double %89, ptr %4, align 8
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %54, !llvm.loop !10

90:                                               ; preds = %54
  call void @increment_uncond_branch()
  br label %91

91:                                               ; preds = %90
  %92 = load i32, ptr %3, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, ptr %3, align 4
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %23, !llvm.loop !11

94:                                               ; preds = %23
  call void @increment_return()
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @benchmark() #0 {
  call void @increment_direct_call()
  %1 = call i32 @benchmark_body(i32 noundef 10000)
  call void @increment_return()
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  call void @increment_direct_call()
  call void @initialise_benchmark()
  call void @increment_direct_call()
  call void @warm_caches(i32 noundef 0)
  call void @init_branch_stats()
  call void @increment_direct_call()
  %8 = call i32 @benchmark()
  store volatile i32 %8, ptr %6, align 4
  call void @print_branch_stats()
  %9 = load volatile i32, ptr %6, align 4
  call void @increment_direct_call()
  %10 = call i32 @verify_benchmark(i32 noundef %9)
  store i32 %10, ptr %7, align 4
  %11 = load i32, ptr %7, align 4
  call void @increment_direct_call()
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %11)
  call void @increment_return()
  ret i32 0
}

declare void @init_branch_stats() #3

declare void @print_branch_stats() #3

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

declare void @increment_cond_branch()

declare void @increment_direct_call()

declare void @increment_uncond_branch()

declare void @increment_return()

declare void @increment_loop_header()

attributes #0 = { noinline nounwind uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nounwind }

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
