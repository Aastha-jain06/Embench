; ModuleID = './output_oat_countonly/ir/primecount.ll'
source_filename = "./embench-iot-benchmarks-backup-cflat-next/primecount.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@llvm.compiler.used = appending global [1 x ptr] [ptr @main], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @countPrimes() #0 {
  %1 = alloca [42 x i32], align 4
  %2 = alloca [42 x i32], align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  %8 = getelementptr inbounds [42 x i32], ptr %1, i64 0, i64 0
  store i32 2, ptr %8, align 4
  %9 = getelementptr inbounds [42 x i32], ptr %2, i64 0, i64 0
  store i32 4, ptr %9, align 4
  %10 = load i32, ptr %3, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %3, align 4
  store i32 1, ptr %4, align 4
  store i32 3, ptr %5, align 4
  store i32 2, ptr %6, align 4
  br label %12

12:                                               ; preds = %87, %0
  br label %13

13:                                               ; preds = %19, %12
  %14 = load i32, ptr %6, align 4
  %15 = load i32, ptr %6, align 4
  %16 = mul nsw i32 %14, %15
  %17 = load i32, ptr %5, align 4
  %18 = icmp sle i32 %16, %17
  br i1 %18, label %19, label %22

19:                                               ; preds = %13
  call void @__oat_log(i32 1)
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %6, align 4
  br label %13, !llvm.loop !6

22:                                               ; preds = %13
  call void @__oat_log(i32 0)
  %23 = load i32, ptr %6, align 4
  %24 = add nsw i32 %23, -1
  store i32 %24, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %25

25:                                               ; preds = %64, %22
  %26 = load i32, ptr %7, align 4
  %27 = load i32, ptr %3, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %67

29:                                               ; preds = %25
  call void @__oat_log(i32 1)
  %30 = load i32, ptr %7, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [42 x i32], ptr %1, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = load i32, ptr %6, align 4
  %35 = icmp sgt i32 %33, %34
  br i1 %35, label %36, label %37

36:                                               ; preds = %29
  call void @__oat_log(i32 1)
  br label %68

37:                                               ; preds = %29
  call void @__oat_log(i32 0)
  br label %38

38:                                               ; preds = %45, %37
  %39 = load i32, ptr %7, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [42 x i32], ptr %2, i64 0, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = load i32, ptr %5, align 4
  %44 = icmp slt i32 %42, %43
  br i1 %44, label %45, label %55

45:                                               ; preds = %38
  call void @__oat_log(i32 1)
  %46 = load i32, ptr %7, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [42 x i32], ptr %1, i64 0, i64 %47
  %49 = load i32, ptr %48, align 4
  %50 = load i32, ptr %7, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [42 x i32], ptr %2, i64 0, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = add nsw i32 %53, %49
  store i32 %54, ptr %52, align 4
  br label %38, !llvm.loop !8

55:                                               ; preds = %38
  call void @__oat_log(i32 0)
  %56 = load i32, ptr %7, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [42 x i32], ptr %2, i64 0, i64 %57
  %59 = load i32, ptr %58, align 4
  %60 = load i32, ptr %5, align 4
  %61 = icmp eq i32 %59, %60
  br i1 %61, label %62, label %63

62:                                               ; preds = %55
  call void @__oat_log(i32 1)
  br label %87

63:                                               ; preds = %55
  call void @__oat_log(i32 0)
  br label %64

64:                                               ; preds = %63
  %65 = load i32, ptr %7, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, ptr %7, align 4
  br label %25, !llvm.loop !9

67:                                               ; preds = %25
  call void @__oat_log(i32 0)
  br label %90

68:                                               ; preds = %36
  %69 = load i32, ptr %3, align 4
  %70 = icmp slt i32 %69, 42
  br i1 %70, label %71, label %84

71:                                               ; preds = %68
  call void @__oat_log(i32 1)
  %72 = load i32, ptr %5, align 4
  %73 = load i32, ptr %3, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [42 x i32], ptr %1, i64 0, i64 %74
  store i32 %72, ptr %75, align 4
  %76 = load i32, ptr %5, align 4
  %77 = load i32, ptr %5, align 4
  %78 = mul nsw i32 %76, %77
  %79 = load i32, ptr %3, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [42 x i32], ptr %2, i64 0, i64 %80
  store i32 %78, ptr %81, align 4
  %82 = load i32, ptr %3, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, ptr %3, align 4
  br label %84

84:                                               ; preds = %71, %68
  call void @__oat_log(i32 0)
  %85 = load i32, ptr %4, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr %4, align 4
  br label %87

87:                                               ; preds = %84, %62
  %88 = load i32, ptr %5, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, ptr %5, align 4
  br label %12

90:                                               ; preds = %67
  %91 = load i32, ptr %4, align 4
  call void @__oat_func_exit(i32 1177)
  ret i32 %91
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
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %11, %1
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %14

9:                                                ; preds = %5
  call void @__oat_log(i32 1)
  %10 = call i32 @countPrimes()
  store i32 %10, ptr %4, align 4
  br label %11

11:                                               ; preds = %9
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %3, align 4
  br label %5, !llvm.loop !10

14:                                               ; preds = %5
  call void @__oat_log(i32 0)
  %15 = load i32, ptr %4, align 4
  call void @__oat_func_exit(i32 1464)
  ret i32 %15
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @benchmark() #0 {
  %1 = call i32 @benchmark_body(i32 noundef 1000)
  call void @__oat_func_exit(i32 939)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @initialise_benchmark() #0 {
  call void @__oat_func_exit(i32 2101)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @verify_benchmark(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp eq i32 3512, %3
  %5 = zext i1 %4 to i32
  call void @__oat_func_exit(i32 1695)
  ret i32 %5
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

declare void @__oat_init() #1

declare void @__oat_print_proof() #1

declare i32 @printf(ptr noundef, ...) #1

declare void @__oat_log(i32)

declare void @__oat_log_indirect(i64)

declare void @__oat_func_exit(i32)

attributes #0 = { noinline nounwind uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }

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
