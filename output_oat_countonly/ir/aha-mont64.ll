; ModuleID = './output_oat_countonly/ir/aha-mont64.ll'
source_filename = "./embench-iot-benchmarks-backup-cflat-next/mont64.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@in_m = internal global i64 0, align 8
@in_b = internal global i64 0, align 8
@in_a = internal global i64 0, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@llvm.compiler.used = appending global [1 x ptr] [ptr @main], section "llvm.metadata"

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @mulul64(i64 noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i128, align 16
  store i64 %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %10 = load i64, ptr %5, align 8
  %11 = zext i64 %10 to i128
  %12 = load i64, ptr %6, align 8
  %13 = zext i64 %12 to i128
  %14 = mul i128 %11, %13
  store i128 %14, ptr %9, align 16
  %15 = load i128, ptr %9, align 16
  %16 = trunc i128 %15 to i64
  %17 = load ptr, ptr %8, align 8
  store i64 %16, ptr %17, align 8
  %18 = load i128, ptr %9, align 16
  %19 = lshr i128 %18, 64
  %20 = trunc i128 %19 to i64
  %21 = load ptr, ptr %7, align 8
  store i64 %20, ptr %21, align 8
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i64 @modul64(i64 noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store i64 %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  store i64 1, ptr %7, align 8
  br label %9

9:                                                ; preds = %34, %3
  %10 = load i64, ptr %7, align 8
  %11 = icmp sle i64 %10, 64
  br i1 %11, label %12, label %37

12:                                               ; preds = %9
  %13 = load i64, ptr %4, align 8
  %14 = ashr i64 %13, 63
  store i64 %14, ptr %8, align 8
  %15 = load i64, ptr %4, align 8
  %16 = shl i64 %15, 1
  %17 = load i64, ptr %5, align 8
  %18 = lshr i64 %17, 63
  %19 = or i64 %16, %18
  store i64 %19, ptr %4, align 8
  %20 = load i64, ptr %5, align 8
  %21 = shl i64 %20, 1
  store i64 %21, ptr %5, align 8
  %22 = load i64, ptr %4, align 8
  %23 = load i64, ptr %8, align 8
  %24 = or i64 %22, %23
  %25 = load i64, ptr %6, align 8
  %26 = icmp uge i64 %24, %25
  br i1 %26, label %27, label %33

27:                                               ; preds = %12
  %28 = load i64, ptr %4, align 8
  %29 = load i64, ptr %6, align 8
  %30 = sub i64 %28, %29
  store i64 %30, ptr %4, align 8
  %31 = load i64, ptr %5, align 8
  %32 = add i64 %31, 1
  store i64 %32, ptr %5, align 8
  br label %33

33:                                               ; preds = %27, %12
  br label %34

34:                                               ; preds = %33
  %35 = load i64, ptr %7, align 8
  %36 = add nsw i64 %35, 1
  store i64 %36, ptr %7, align 8
  br label %9, !llvm.loop !6

37:                                               ; preds = %9
  %38 = load i64, ptr %4, align 8
  ret i64 %38
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i64 @montmul(i64 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  store i64 %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  store i64 %3, ptr %8, align 8
  %17 = load i64, ptr %5, align 8
  %18 = load i64, ptr %6, align 8
  call void @mulul64(i64 noundef %17, i64 noundef %18, ptr noundef %9, ptr noundef %10)
  %19 = load i64, ptr %10, align 8
  %20 = load i64, ptr %8, align 8
  %21 = mul i64 %19, %20
  store i64 %21, ptr %11, align 8
  %22 = load i64, ptr %11, align 8
  %23 = load i64, ptr %7, align 8
  call void @mulul64(i64 noundef %22, i64 noundef %23, ptr noundef %12, ptr noundef %13)
  %24 = load i64, ptr %10, align 8
  %25 = load i64, ptr %13, align 8
  %26 = add i64 %24, %25
  store i64 %26, ptr %15, align 8
  %27 = load i64, ptr %9, align 8
  %28 = load i64, ptr %12, align 8
  %29 = add i64 %27, %28
  store i64 %29, ptr %14, align 8
  %30 = load i64, ptr %15, align 8
  %31 = load i64, ptr %10, align 8
  %32 = icmp ult i64 %30, %31
  br i1 %32, label %33, label %36

33:                                               ; preds = %4
  %34 = load i64, ptr %14, align 8
  %35 = add i64 %34, 1
  store i64 %35, ptr %14, align 8
  br label %36

36:                                               ; preds = %33, %4
  %37 = load i64, ptr %14, align 8
  %38 = load i64, ptr %9, align 8
  %39 = icmp ult i64 %37, %38
  %40 = zext i1 %39 to i32
  %41 = load i64, ptr %14, align 8
  %42 = load i64, ptr %9, align 8
  %43 = icmp eq i64 %41, %42
  %44 = zext i1 %43 to i32
  %45 = load i64, ptr %15, align 8
  %46 = load i64, ptr %10, align 8
  %47 = icmp ult i64 %45, %46
  %48 = zext i1 %47 to i32
  %49 = and i32 %44, %48
  %50 = or i32 %40, %49
  %51 = sext i32 %50 to i64
  store i64 %51, ptr %16, align 8
  %52 = load i64, ptr %14, align 8
  store i64 %52, ptr %15, align 8
  store i64 0, ptr %14, align 8
  %53 = load i64, ptr %15, align 8
  %54 = load i64, ptr %7, align 8
  %55 = load i64, ptr %16, align 8
  %56 = load i64, ptr %15, align 8
  %57 = load i64, ptr %7, align 8
  %58 = icmp uge i64 %56, %57
  %59 = zext i1 %58 to i32
  %60 = sext i32 %59 to i64
  %61 = or i64 %55, %60
  %62 = sub i64 0, %61
  %63 = and i64 %54, %62
  %64 = sub i64 %53, %63
  store i64 %64, ptr %15, align 8
  %65 = load i64, ptr %15, align 8
  ret i64 %65
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @xbinGCD(i64 noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  store i64 %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  store i64 1, ptr %11, align 8
  store i64 0, ptr %12, align 8
  %13 = load i64, ptr %5, align 8
  store i64 %13, ptr %9, align 8
  %14 = load i64, ptr %6, align 8
  store i64 %14, ptr %10, align 8
  br label %15

15:                                               ; preds = %42, %4
  %16 = load i64, ptr %5, align 8
  %17 = icmp ugt i64 %16, 0
  br i1 %17, label %18, label %43

18:                                               ; preds = %15
  %19 = load i64, ptr %5, align 8
  %20 = lshr i64 %19, 1
  store i64 %20, ptr %5, align 8
  %21 = load i64, ptr %11, align 8
  %22 = and i64 %21, 1
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %24, label %29

24:                                               ; preds = %18
  %25 = load i64, ptr %11, align 8
  %26 = lshr i64 %25, 1
  store i64 %26, ptr %11, align 8
  %27 = load i64, ptr %12, align 8
  %28 = lshr i64 %27, 1
  store i64 %28, ptr %12, align 8
  br label %42

29:                                               ; preds = %18
  %30 = load i64, ptr %11, align 8
  %31 = load i64, ptr %10, align 8
  %32 = xor i64 %30, %31
  %33 = lshr i64 %32, 1
  %34 = load i64, ptr %11, align 8
  %35 = load i64, ptr %10, align 8
  %36 = and i64 %34, %35
  %37 = add i64 %33, %36
  store i64 %37, ptr %11, align 8
  %38 = load i64, ptr %12, align 8
  %39 = lshr i64 %38, 1
  %40 = load i64, ptr %9, align 8
  %41 = add i64 %39, %40
  store i64 %41, ptr %12, align 8
  br label %42

42:                                               ; preds = %29, %24
  br label %15, !llvm.loop !8

43:                                               ; preds = %15
  %44 = load i64, ptr %11, align 8
  %45 = load ptr, ptr %7, align 8
  store volatile i64 %44, ptr %45, align 8
  %46 = load i64, ptr %12, align 8
  %47 = load ptr, ptr %8, align 8
  store volatile i64 %46, ptr %47, align 8
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @warm_caches(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = call i32 @benchmark_body(i32 noundef %4)
  store i32 %5, ptr %3, align 4
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define internal i32 @benchmark_body(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %19

19:                                               ; preds = %90, %1
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %2, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %93

23:                                               ; preds = %19
  store i32 0, ptr %4, align 4
  %24 = load i64, ptr @in_m, align 8
  store i64 %24, ptr %7, align 8
  %25 = load i64, ptr @in_b, align 8
  store i64 %25, ptr %6, align 8
  %26 = load i64, ptr @in_a, align 8
  store i64 %26, ptr %5, align 8
  %27 = load i64, ptr %5, align 8
  %28 = load i64, ptr %6, align 8
  call void @mulul64(i64 noundef %27, i64 noundef %28, ptr noundef %9, ptr noundef %10)
  %29 = load i64, ptr %9, align 8
  %30 = load i64, ptr %10, align 8
  %31 = load i64, ptr %7, align 8
  %32 = call i64 @modul64(i64 noundef %29, i64 noundef %30, i64 noundef %31)
  store i64 %32, ptr %11, align 8
  %33 = load i64, ptr %11, align 8
  %34 = load i64, ptr %11, align 8
  call void @mulul64(i64 noundef %33, i64 noundef %34, ptr noundef %9, ptr noundef %10)
  %35 = load i64, ptr %9, align 8
  %36 = load i64, ptr %10, align 8
  %37 = load i64, ptr %7, align 8
  %38 = call i64 @modul64(i64 noundef %35, i64 noundef %36, i64 noundef %37)
  store i64 %38, ptr %11, align 8
  %39 = load i64, ptr %11, align 8
  %40 = load i64, ptr %11, align 8
  call void @mulul64(i64 noundef %39, i64 noundef %40, ptr noundef %9, ptr noundef %10)
  %41 = load i64, ptr %9, align 8
  %42 = load i64, ptr %10, align 8
  %43 = load i64, ptr %7, align 8
  %44 = call i64 @modul64(i64 noundef %41, i64 noundef %42, i64 noundef %43)
  store i64 %44, ptr %11, align 8
  store i64 -9223372036854775808, ptr %8, align 8
  %45 = load i64, ptr %8, align 8
  %46 = load i64, ptr %7, align 8
  call void @xbinGCD(i64 noundef %45, i64 noundef %46, ptr noundef %17, ptr noundef %18)
  %47 = load i64, ptr %8, align 8
  %48 = mul i64 2, %47
  %49 = load volatile i64, ptr %17, align 8
  %50 = mul i64 %48, %49
  %51 = load i64, ptr %7, align 8
  %52 = load volatile i64, ptr %18, align 8
  %53 = mul i64 %51, %52
  %54 = sub i64 %50, %53
  %55 = icmp ne i64 %54, 1
  br i1 %55, label %56, label %57

56:                                               ; preds = %23
  store i32 1, ptr %4, align 4
  br label %57

57:                                               ; preds = %56, %23
  %58 = load i64, ptr %5, align 8
  %59 = load i64, ptr %7, align 8
  %60 = call i64 @modul64(i64 noundef %58, i64 noundef 0, i64 noundef %59)
  store i64 %60, ptr %13, align 8
  %61 = load i64, ptr %6, align 8
  %62 = load i64, ptr %7, align 8
  %63 = call i64 @modul64(i64 noundef %61, i64 noundef 0, i64 noundef %62)
  store i64 %63, ptr %14, align 8
  %64 = load i64, ptr %13, align 8
  %65 = load i64, ptr %14, align 8
  %66 = load i64, ptr %7, align 8
  %67 = load volatile i64, ptr %18, align 8
  %68 = call i64 @montmul(i64 noundef %64, i64 noundef %65, i64 noundef %66, i64 noundef %67)
  store i64 %68, ptr %12, align 8
  %69 = load i64, ptr %12, align 8
  %70 = load i64, ptr %12, align 8
  %71 = load i64, ptr %7, align 8
  %72 = load volatile i64, ptr %18, align 8
  %73 = call i64 @montmul(i64 noundef %69, i64 noundef %70, i64 noundef %71, i64 noundef %72)
  store i64 %73, ptr %12, align 8
  %74 = load i64, ptr %12, align 8
  %75 = load i64, ptr %12, align 8
  %76 = load i64, ptr %7, align 8
  %77 = load volatile i64, ptr %18, align 8
  %78 = call i64 @montmul(i64 noundef %74, i64 noundef %75, i64 noundef %76, i64 noundef %77)
  store i64 %78, ptr %12, align 8
  %79 = load i64, ptr %12, align 8
  %80 = load volatile i64, ptr %17, align 8
  call void @mulul64(i64 noundef %79, i64 noundef %80, ptr noundef %15, ptr noundef %16)
  %81 = load i64, ptr %15, align 8
  %82 = load i64, ptr %16, align 8
  %83 = load i64, ptr %7, align 8
  %84 = call i64 @modul64(i64 noundef %81, i64 noundef %82, i64 noundef %83)
  store i64 %84, ptr %12, align 8
  %85 = load i64, ptr %12, align 8
  %86 = load i64, ptr %11, align 8
  %87 = icmp ne i64 %85, %86
  br i1 %87, label %88, label %89

88:                                               ; preds = %57
  store i32 1, ptr %4, align 4
  br label %89

89:                                               ; preds = %88, %57
  br label %90

90:                                               ; preds = %89
  %91 = load i32, ptr %3, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, ptr %3, align 4
  br label %19, !llvm.loop !9

93:                                               ; preds = %19
  %94 = load i32, ptr %4, align 4
  ret i32 %94
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @benchmark() #0 {
  %1 = call i32 @benchmark_body(i32 noundef 423000)
  ret i32 %1
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @initialise_benchmark() #0 {
  store i64 -366962936819156833, ptr @in_m, align 8
  store i64 1473642379452024179, ptr @in_b, align 8
  store i64 380896260630216687, ptr @in_a, align 8
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @verify_benchmark(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp eq i32 0, %3
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: noinline nounwind noinline uwtable
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
  ret i32 0
}

declare void @__oat_init() #1

declare void @__oat_print_proof() #1

declare i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind noinline uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
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
