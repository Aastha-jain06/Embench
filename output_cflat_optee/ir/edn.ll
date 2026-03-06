; ModuleID = './output_cflat_optee/ir/edn.ll'
source_filename = "./embench-iot-benchmarks-backup/libedn.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@__const.verify_benchmark.exp_output = private unnamed_addr constant <{ [101 x i64], [99 x i64] }> <{ [101 x i64] [i64 3760, i64 4269, i64 3126, i64 1030, i64 2453, i64 -4601, i64 1981, i64 -1056, i64 2621, i64 4269, i64 3058, i64 1030, i64 2378, i64 -4601, i64 1902, i64 -1056, i64 2548, i64 4269, i64 2988, i64 1030, i64 2300, i64 -4601, i64 1822, i64 -1056, i64 2474, i64 4269, i64 2917, i64 1030, i64 2220, i64 -4601, i64 1738, i64 -1056, i64 2398, i64 4269, i64 2844, i64 1030, i64 2140, i64 -4601, i64 1655, i64 -1056, i64 2321, i64 4269, i64 2770, i64 1030, i64 2058, i64 -4601, i64 1569, i64 -1056, i64 2242, i64 4269, i64 2152, i64 1030, i64 1683, i64 -4601, i64 1627, i64 -1056, i64 2030, i64 4269, i64 2080, i64 1030, i64 1611, i64 -4601, i64 1555, i64 -1056, i64 1958, i64 4269, i64 2008, i64 1030, i64 1539, i64 -4601, i64 1483, i64 -1056, i64 1886, i64 4269, i64 1935, i64 1030, i64 1466, i64 -4601, i64 1410, i64 -1056, i64 1813, i64 4269, i64 1862, i64 1030, i64 1393, i64 -4601, i64 1337, i64 -1056, i64 1740, i64 4269, i64 1789, i64 1030, i64 1320, i64 -4601, i64 1264, i64 -1056, i64 1667, i64 4269, i64 1716, i64 1030, i64 1968], [99 x i64] zeroinitializer }>, align 8
@output = internal global [200 x i64] zeroinitializer, align 8
@c = internal global i16 0, align 2
@d = internal global i64 0, align 8
@e = internal global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@__const.benchmark_body.in_a = private unnamed_addr constant [200 x i16] [i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024, i16 0, i16 2047, i16 3072, i16 2048, i16 512, i16 -2048, i16 -3328, i16 1024], align 2
@__const.benchmark_body.in_b = private unnamed_addr constant [200 x i16] [i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096, i16 3168, i16 3136, i16 3104, i16 3072, i16 -2560, i16 -3072, i16 -3584, i16 -4096], align 2
@a = internal global [200 x i16] zeroinitializer, align 2
@b = internal global [200 x i16] zeroinitializer, align 2
@llvm.compiler.used = appending global [1 x ptr] [ptr @main], section "llvm.metadata"

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @vec_mpy1(ptr noundef %0, ptr noundef %1, i16 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i16, align 2
  %7 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i16 %2, ptr %6, align 2
  store i64 0, ptr %7, align 8
  br label %8

8:                                                ; preds = %28, %3
  %9 = load i64, ptr %7, align 8
  %10 = icmp slt i64 %9, 150
  br i1 %10, label %11, label %31

11:                                               ; preds = %8
  %12 = load i16, ptr %6, align 2
  %13 = sext i16 %12 to i32
  %14 = load ptr, ptr %5, align 8
  %15 = load i64, ptr %7, align 8
  %16 = getelementptr inbounds i16, ptr %14, i64 %15
  %17 = load i16, ptr %16, align 2
  %18 = sext i16 %17 to i32
  %19 = mul nsw i32 %13, %18
  %20 = ashr i32 %19, 15
  %21 = load ptr, ptr %4, align 8
  %22 = load i64, ptr %7, align 8
  %23 = getelementptr inbounds i16, ptr %21, i64 %22
  %24 = load i16, ptr %23, align 2
  %25 = sext i16 %24 to i32
  %26 = add nsw i32 %25, %20
  %27 = trunc i32 %26 to i16
  store i16 %27, ptr %23, align 2
  br label %28

28:                                               ; preds = %11
  %29 = load i64, ptr %7, align 8
  %30 = add nsw i64 %29, 1
  store i64 %30, ptr %7, align 8
  br label %8, !llvm.loop !6

31:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i64 @mac(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %11 = load ptr, ptr %8, align 8
  %12 = load i64, ptr %11, align 8
  store i64 %12, ptr %10, align 8
  store i64 0, ptr %9, align 8
  br label %13

13:                                               ; preds = %45, %4
  %14 = load i64, ptr %9, align 8
  %15 = icmp slt i64 %14, 150
  br i1 %15, label %16, label %48

16:                                               ; preds = %13
  %17 = load ptr, ptr %6, align 8
  %18 = load i64, ptr %9, align 8
  %19 = getelementptr inbounds i16, ptr %17, i64 %18
  %20 = load i16, ptr %19, align 2
  %21 = sext i16 %20 to i32
  %22 = load ptr, ptr %5, align 8
  %23 = load i64, ptr %9, align 8
  %24 = getelementptr inbounds i16, ptr %22, i64 %23
  %25 = load i16, ptr %24, align 2
  %26 = sext i16 %25 to i32
  %27 = mul nsw i32 %21, %26
  %28 = sext i32 %27 to i64
  %29 = load i64, ptr %10, align 8
  %30 = add nsw i64 %29, %28
  store i64 %30, ptr %10, align 8
  %31 = load ptr, ptr %6, align 8
  %32 = load i64, ptr %9, align 8
  %33 = getelementptr inbounds i16, ptr %31, i64 %32
  %34 = load i16, ptr %33, align 2
  %35 = sext i16 %34 to i32
  %36 = load ptr, ptr %6, align 8
  %37 = load i64, ptr %9, align 8
  %38 = getelementptr inbounds i16, ptr %36, i64 %37
  %39 = load i16, ptr %38, align 2
  %40 = sext i16 %39 to i32
  %41 = mul nsw i32 %35, %40
  %42 = sext i32 %41 to i64
  %43 = load i64, ptr %7, align 8
  %44 = add nsw i64 %43, %42
  store i64 %44, ptr %7, align 8
  br label %45

45:                                               ; preds = %16
  %46 = load i64, ptr %9, align 8
  %47 = add nsw i64 %46, 1
  store i64 %47, ptr %9, align 8
  br label %13, !llvm.loop !8

48:                                               ; preds = %13
  %49 = load i64, ptr %10, align 8
  %50 = load ptr, ptr %8, align 8
  store i64 %49, ptr %50, align 8
  %51 = load i64, ptr %7, align 8
  ret i64 %51
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @fir(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i64 0, ptr %7, align 8
  br label %10

10:                                               ; preds = %43, %3
  %11 = load i64, ptr %7, align 8
  %12 = icmp slt i64 %11, 50
  br i1 %12, label %13, label %46

13:                                               ; preds = %10
  store i64 0, ptr %9, align 8
  store i64 0, ptr %8, align 8
  br label %14

14:                                               ; preds = %34, %13
  %15 = load i64, ptr %8, align 8
  %16 = icmp slt i64 %15, 50
  br i1 %16, label %17, label %37

17:                                               ; preds = %14
  %18 = load ptr, ptr %4, align 8
  %19 = load i64, ptr %7, align 8
  %20 = load i64, ptr %8, align 8
  %21 = add nsw i64 %19, %20
  %22 = getelementptr inbounds i16, ptr %18, i64 %21
  %23 = load i16, ptr %22, align 2
  %24 = sext i16 %23 to i32
  %25 = load ptr, ptr %5, align 8
  %26 = load i64, ptr %8, align 8
  %27 = getelementptr inbounds i16, ptr %25, i64 %26
  %28 = load i16, ptr %27, align 2
  %29 = sext i16 %28 to i32
  %30 = mul nsw i32 %24, %29
  %31 = sext i32 %30 to i64
  %32 = load i64, ptr %9, align 8
  %33 = add nsw i64 %32, %31
  store i64 %33, ptr %9, align 8
  br label %34

34:                                               ; preds = %17
  %35 = load i64, ptr %8, align 8
  %36 = add nsw i64 %35, 1
  store i64 %36, ptr %8, align 8
  br label %14, !llvm.loop !9

37:                                               ; preds = %14
  %38 = load i64, ptr %9, align 8
  %39 = ashr i64 %38, 15
  %40 = load ptr, ptr %6, align 8
  %41 = load i64, ptr %7, align 8
  %42 = getelementptr inbounds i64, ptr %40, i64 %41
  store i64 %39, ptr %42, align 8
  br label %43

43:                                               ; preds = %37
  %44 = load i64, ptr %7, align 8
  %45 = add nsw i64 %44, 1
  store i64 %45, ptr %7, align 8
  br label %10, !llvm.loop !10

46:                                               ; preds = %10
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @fir_no_red_ld(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i16, align 2
  %12 = alloca i16, align 2
  %13 = alloca i16, align 2
  %14 = alloca i16, align 2
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i64 0, ptr %8, align 8
  br label %15

15:                                               ; preds = %97, %3
  %16 = load i64, ptr %8, align 8
  %17 = icmp slt i64 %16, 100
  br i1 %17, label %18, label %100

18:                                               ; preds = %15
  store i64 0, ptr %9, align 8
  store i64 0, ptr %10, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = load i64, ptr %8, align 8
  %21 = getelementptr inbounds i16, ptr %19, i64 %20
  %22 = load i16, ptr %21, align 2
  store i16 %22, ptr %11, align 2
  store i64 0, ptr %7, align 8
  br label %23

23:                                               ; preds = %82, %18
  %24 = load i64, ptr %7, align 8
  %25 = icmp slt i64 %24, 32
  br i1 %25, label %26, label %85

26:                                               ; preds = %23
  %27 = load ptr, ptr %4, align 8
  %28 = load i64, ptr %8, align 8
  %29 = load i64, ptr %7, align 8
  %30 = add nsw i64 %28, %29
  %31 = add nsw i64 %30, 1
  %32 = getelementptr inbounds i16, ptr %27, i64 %31
  %33 = load i16, ptr %32, align 2
  store i16 %33, ptr %12, align 2
  %34 = load ptr, ptr %5, align 8
  %35 = load i64, ptr %7, align 8
  %36 = getelementptr inbounds i16, ptr %34, i64 %35
  %37 = load i16, ptr %36, align 2
  store i16 %37, ptr %13, align 2
  %38 = load i16, ptr %11, align 2
  %39 = sext i16 %38 to i32
  %40 = load i16, ptr %13, align 2
  %41 = sext i16 %40 to i32
  %42 = mul nsw i32 %39, %41
  %43 = sext i32 %42 to i64
  %44 = load i64, ptr %9, align 8
  %45 = add nsw i64 %44, %43
  store i64 %45, ptr %9, align 8
  %46 = load i16, ptr %12, align 2
  %47 = sext i16 %46 to i32
  %48 = load i16, ptr %13, align 2
  %49 = sext i16 %48 to i32
  %50 = mul nsw i32 %47, %49
  %51 = sext i32 %50 to i64
  %52 = load i64, ptr %10, align 8
  %53 = add nsw i64 %52, %51
  store i64 %53, ptr %10, align 8
  %54 = load ptr, ptr %4, align 8
  %55 = load i64, ptr %8, align 8
  %56 = load i64, ptr %7, align 8
  %57 = add nsw i64 %55, %56
  %58 = add nsw i64 %57, 2
  %59 = getelementptr inbounds i16, ptr %54, i64 %58
  %60 = load i16, ptr %59, align 2
  store i16 %60, ptr %11, align 2
  %61 = load ptr, ptr %5, align 8
  %62 = load i64, ptr %7, align 8
  %63 = add nsw i64 %62, 1
  %64 = getelementptr inbounds i16, ptr %61, i64 %63
  %65 = load i16, ptr %64, align 2
  store i16 %65, ptr %14, align 2
  %66 = load i16, ptr %12, align 2
  %67 = sext i16 %66 to i32
  %68 = load i16, ptr %14, align 2
  %69 = sext i16 %68 to i32
  %70 = mul nsw i32 %67, %69
  %71 = sext i32 %70 to i64
  %72 = load i64, ptr %9, align 8
  %73 = add nsw i64 %72, %71
  store i64 %73, ptr %9, align 8
  %74 = load i16, ptr %11, align 2
  %75 = sext i16 %74 to i32
  %76 = load i16, ptr %14, align 2
  %77 = sext i16 %76 to i32
  %78 = mul nsw i32 %75, %77
  %79 = sext i32 %78 to i64
  %80 = load i64, ptr %10, align 8
  %81 = add nsw i64 %80, %79
  store i64 %81, ptr %10, align 8
  br label %82

82:                                               ; preds = %26
  %83 = load i64, ptr %7, align 8
  %84 = add nsw i64 %83, 2
  store i64 %84, ptr %7, align 8
  br label %23, !llvm.loop !11

85:                                               ; preds = %23
  %86 = load i64, ptr %9, align 8
  %87 = ashr i64 %86, 15
  %88 = load ptr, ptr %6, align 8
  %89 = load i64, ptr %8, align 8
  %90 = getelementptr inbounds i64, ptr %88, i64 %89
  store i64 %87, ptr %90, align 8
  %91 = load i64, ptr %10, align 8
  %92 = ashr i64 %91, 15
  %93 = load ptr, ptr %6, align 8
  %94 = load i64, ptr %8, align 8
  %95 = add nsw i64 %94, 1
  %96 = getelementptr inbounds i64, ptr %93, i64 %95
  store i64 %92, ptr %96, align 8
  br label %97

97:                                               ; preds = %85
  %98 = load i64, ptr %8, align 8
  %99 = add nsw i64 %98, 2
  store i64 %99, ptr %8, align 8
  br label %15, !llvm.loop !12

100:                                              ; preds = %15
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i64 @latsynth(ptr noundef %0, ptr noundef %1, i64 noundef %2, i64 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  store i64 %3, ptr %8, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = load i64, ptr %7, align 8
  %12 = sub nsw i64 %11, 1
  %13 = getelementptr inbounds i16, ptr %10, i64 %12
  %14 = load i16, ptr %13, align 2
  %15 = sext i16 %14 to i32
  %16 = load ptr, ptr %6, align 8
  %17 = load i64, ptr %7, align 8
  %18 = sub nsw i64 %17, 1
  %19 = getelementptr inbounds i16, ptr %16, i64 %18
  %20 = load i16, ptr %19, align 2
  %21 = sext i16 %20 to i32
  %22 = mul nsw i32 %15, %21
  %23 = sext i32 %22 to i64
  %24 = load i64, ptr %8, align 8
  %25 = sub nsw i64 %24, %23
  store i64 %25, ptr %8, align 8
  %26 = load i64, ptr %7, align 8
  %27 = sub nsw i64 %26, 2
  store i64 %27, ptr %9, align 8
  br label %28

28:                                               ; preds = %66, %4
  %29 = load i64, ptr %9, align 8
  %30 = icmp sge i64 %29, 0
  br i1 %30, label %31, label %69

31:                                               ; preds = %28
  %32 = load ptr, ptr %5, align 8
  %33 = load i64, ptr %9, align 8
  %34 = getelementptr inbounds i16, ptr %32, i64 %33
  %35 = load i16, ptr %34, align 2
  %36 = sext i16 %35 to i32
  %37 = load ptr, ptr %6, align 8
  %38 = load i64, ptr %9, align 8
  %39 = getelementptr inbounds i16, ptr %37, i64 %38
  %40 = load i16, ptr %39, align 2
  %41 = sext i16 %40 to i32
  %42 = mul nsw i32 %36, %41
  %43 = sext i32 %42 to i64
  %44 = load i64, ptr %8, align 8
  %45 = sub nsw i64 %44, %43
  store i64 %45, ptr %8, align 8
  %46 = load ptr, ptr %5, align 8
  %47 = load i64, ptr %9, align 8
  %48 = getelementptr inbounds i16, ptr %46, i64 %47
  %49 = load i16, ptr %48, align 2
  %50 = sext i16 %49 to i64
  %51 = load ptr, ptr %6, align 8
  %52 = load i64, ptr %9, align 8
  %53 = getelementptr inbounds i16, ptr %51, i64 %52
  %54 = load i16, ptr %53, align 2
  %55 = sext i16 %54 to i64
  %56 = load i64, ptr %8, align 8
  %57 = ashr i64 %56, 16
  %58 = mul nsw i64 %55, %57
  %59 = ashr i64 %58, 16
  %60 = add nsw i64 %50, %59
  %61 = trunc i64 %60 to i16
  %62 = load ptr, ptr %5, align 8
  %63 = load i64, ptr %9, align 8
  %64 = add nsw i64 %63, 1
  %65 = getelementptr inbounds i16, ptr %62, i64 %64
  store i16 %61, ptr %65, align 2
  br label %66

66:                                               ; preds = %31
  %67 = load i64, ptr %9, align 8
  %68 = add nsw i64 %67, -1
  store i64 %68, ptr %9, align 8
  br label %28, !llvm.loop !13

69:                                               ; preds = %28
  %70 = load i64, ptr %8, align 8
  %71 = ashr i64 %70, 16
  %72 = trunc i64 %71 to i16
  %73 = load ptr, ptr %5, align 8
  %74 = getelementptr inbounds i16, ptr %73, i64 0
  store i16 %72, ptr %74, align 2
  %75 = load i64, ptr %8, align 8
  ret i64 %75
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @iir1(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %12 = load ptr, ptr %6, align 8
  %13 = getelementptr inbounds i16, ptr %12, i64 0
  %14 = load i16, ptr %13, align 2
  %15 = sext i16 %14 to i64
  store i64 %15, ptr %9, align 8
  store i64 0, ptr %11, align 8
  br label %16

16:                                               ; preds = %72, %4
  %17 = load i64, ptr %11, align 8
  %18 = icmp slt i64 %17, 50
  br i1 %18, label %19, label %75

19:                                               ; preds = %16
  %20 = load i64, ptr %9, align 8
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds i16, ptr %21, i64 2
  %23 = load i16, ptr %22, align 2
  %24 = sext i16 %23 to i64
  %25 = load ptr, ptr %8, align 8
  %26 = getelementptr inbounds i64, ptr %25, i64 0
  %27 = load i64, ptr %26, align 8
  %28 = mul nsw i64 %24, %27
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds i16, ptr %29, i64 3
  %31 = load i16, ptr %30, align 2
  %32 = sext i16 %31 to i64
  %33 = load ptr, ptr %8, align 8
  %34 = getelementptr inbounds i64, ptr %33, i64 1
  %35 = load i64, ptr %34, align 8
  %36 = mul nsw i64 %32, %35
  %37 = add nsw i64 %28, %36
  %38 = ashr i64 %37, 15
  %39 = add nsw i64 %20, %38
  store i64 %39, ptr %10, align 8
  %40 = load i64, ptr %10, align 8
  %41 = load ptr, ptr %5, align 8
  %42 = getelementptr inbounds i16, ptr %41, i64 0
  %43 = load i16, ptr %42, align 2
  %44 = sext i16 %43 to i64
  %45 = load ptr, ptr %8, align 8
  %46 = getelementptr inbounds i64, ptr %45, i64 0
  %47 = load i64, ptr %46, align 8
  %48 = mul nsw i64 %44, %47
  %49 = load ptr, ptr %5, align 8
  %50 = getelementptr inbounds i16, ptr %49, i64 1
  %51 = load i16, ptr %50, align 2
  %52 = sext i16 %51 to i64
  %53 = load ptr, ptr %8, align 8
  %54 = getelementptr inbounds i64, ptr %53, i64 1
  %55 = load i64, ptr %54, align 8
  %56 = mul nsw i64 %52, %55
  %57 = add nsw i64 %48, %56
  %58 = ashr i64 %57, 15
  %59 = add nsw i64 %40, %58
  store i64 %59, ptr %9, align 8
  %60 = load ptr, ptr %8, align 8
  %61 = getelementptr inbounds i64, ptr %60, i64 0
  %62 = load i64, ptr %61, align 8
  %63 = load ptr, ptr %8, align 8
  %64 = getelementptr inbounds i64, ptr %63, i64 1
  store i64 %62, ptr %64, align 8
  %65 = load i64, ptr %10, align 8
  %66 = load ptr, ptr %8, align 8
  %67 = getelementptr inbounds i64, ptr %66, i64 0
  store i64 %65, ptr %67, align 8
  %68 = load ptr, ptr %5, align 8
  %69 = getelementptr inbounds i16, ptr %68, i64 4
  store ptr %69, ptr %5, align 8
  %70 = load ptr, ptr %8, align 8
  %71 = getelementptr inbounds i64, ptr %70, i64 2
  store ptr %71, ptr %8, align 8
  br label %72

72:                                               ; preds = %19
  %73 = load i64, ptr %11, align 8
  %74 = add nsw i64 %73, 1
  store i64 %74, ptr %11, align 8
  br label %16, !llvm.loop !14

75:                                               ; preds = %16
  %76 = load i64, ptr %9, align 8
  %77 = load ptr, ptr %7, align 8
  %78 = getelementptr inbounds i64, ptr %77, i32 1
  store ptr %78, ptr %7, align 8
  store i64 %76, ptr %77, align 8
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i64 @codebook(i64 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4, ptr noundef %5, i16 noundef %6, i16 noundef %7) #0 {
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i16, align 2
  %16 = alloca i16, align 2
  %17 = alloca i64, align 8
  store i64 %0, ptr %9, align 8
  store i64 %1, ptr %10, align 8
  store i64 %2, ptr %11, align 8
  store i64 %3, ptr %12, align 8
  store i64 %4, ptr %13, align 8
  store ptr %5, ptr %14, align 8
  store i16 %6, ptr %15, align 2
  store i16 %7, ptr %16, align 2
  %18 = load i64, ptr %10, align 8
  %19 = add nsw i64 %18, 1
  store i64 %19, ptr %17, align 8
  br label %20

20:                                               ; preds = %25, %8
  %21 = load i64, ptr %17, align 8
  %22 = load i64, ptr %11, align 8
  %23 = icmp sle i64 %21, %22
  br i1 %23, label %24, label %28

24:                                               ; preds = %20
  br label %25

25:                                               ; preds = %24
  %26 = load i64, ptr %17, align 8
  %27 = add nsw i64 %26, 1
  store i64 %27, ptr %17, align 8
  br label %20, !llvm.loop !15

28:                                               ; preds = %20
  %29 = load i64, ptr %13, align 8
  ret i64 %29
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @jpegdct(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca [12 x i64], align 8
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  %10 = alloca i16, align 2
  %11 = alloca i16, align 2
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i16 1, ptr %8, align 2
  store i16 0, ptr %9, align 2
  store i16 13, ptr %10, align 2
  store i16 8, ptr %11, align 2
  br label %12

12:                                               ; preds = %388, %2
  %13 = load i16, ptr %8, align 2
  %14 = sext i16 %13 to i32
  %15 = icmp sle i32 %14, 8
  br i1 %15, label %16, label %407

16:                                               ; preds = %12
  store i16 0, ptr %6, align 2
  br label %17

17:                                               ; preds = %379, %16
  %18 = load i16, ptr %6, align 2
  %19 = sext i16 %18 to i32
  %20 = icmp slt i32 %19, 8
  br i1 %20, label %21, label %387

21:                                               ; preds = %17
  store i16 0, ptr %7, align 2
  br label %22

22:                                               ; preds = %81, %21
  %23 = load i16, ptr %7, align 2
  %24 = sext i16 %23 to i32
  %25 = icmp slt i32 %24, 4
  br i1 %25, label %26, label %84

26:                                               ; preds = %22
  %27 = load ptr, ptr %3, align 8
  %28 = load i16, ptr %8, align 2
  %29 = sext i16 %28 to i32
  %30 = load i16, ptr %7, align 2
  %31 = sext i16 %30 to i32
  %32 = mul nsw i32 %29, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i16, ptr %27, i64 %33
  %35 = load i16, ptr %34, align 2
  %36 = sext i16 %35 to i32
  %37 = load ptr, ptr %3, align 8
  %38 = load i16, ptr %8, align 2
  %39 = sext i16 %38 to i32
  %40 = load i16, ptr %7, align 2
  %41 = sext i16 %40 to i32
  %42 = sub nsw i32 7, %41
  %43 = mul nsw i32 %39, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i16, ptr %37, i64 %44
  %46 = load i16, ptr %45, align 2
  %47 = sext i16 %46 to i32
  %48 = add nsw i32 %36, %47
  %49 = sext i32 %48 to i64
  %50 = load i16, ptr %7, align 2
  %51 = sext i16 %50 to i64
  %52 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 %51
  store i64 %49, ptr %52, align 8
  %53 = load ptr, ptr %3, align 8
  %54 = load i16, ptr %8, align 2
  %55 = sext i16 %54 to i32
  %56 = load i16, ptr %7, align 2
  %57 = sext i16 %56 to i32
  %58 = mul nsw i32 %55, %57
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i16, ptr %53, i64 %59
  %61 = load i16, ptr %60, align 2
  %62 = sext i16 %61 to i32
  %63 = load ptr, ptr %3, align 8
  %64 = load i16, ptr %8, align 2
  %65 = sext i16 %64 to i32
  %66 = load i16, ptr %7, align 2
  %67 = sext i16 %66 to i32
  %68 = sub nsw i32 7, %67
  %69 = mul nsw i32 %65, %68
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i16, ptr %63, i64 %70
  %72 = load i16, ptr %71, align 2
  %73 = sext i16 %72 to i32
  %74 = sub nsw i32 %62, %73
  %75 = sext i32 %74 to i64
  %76 = load i16, ptr %7, align 2
  %77 = sext i16 %76 to i32
  %78 = sub nsw i32 7, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 %79
  store i64 %75, ptr %80, align 8
  br label %81

81:                                               ; preds = %26
  %82 = load i16, ptr %7, align 2
  %83 = add i16 %82, 1
  store i16 %83, ptr %7, align 2
  br label %22, !llvm.loop !16

84:                                               ; preds = %22
  %85 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 0
  %86 = load i64, ptr %85, align 8
  %87 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 3
  %88 = load i64, ptr %87, align 8
  %89 = add nsw i64 %86, %88
  %90 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 8
  store i64 %89, ptr %90, align 8
  %91 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 0
  %92 = load i64, ptr %91, align 8
  %93 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 3
  %94 = load i64, ptr %93, align 8
  %95 = sub nsw i64 %92, %94
  %96 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 9
  store i64 %95, ptr %96, align 8
  %97 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 1
  %98 = load i64, ptr %97, align 8
  %99 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 2
  %100 = load i64, ptr %99, align 8
  %101 = add nsw i64 %98, %100
  %102 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 10
  store i64 %101, ptr %102, align 8
  %103 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 1
  %104 = load i64, ptr %103, align 8
  %105 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 2
  %106 = load i64, ptr %105, align 8
  %107 = sub nsw i64 %104, %106
  %108 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 11
  store i64 %107, ptr %108, align 8
  %109 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 8
  %110 = load i64, ptr %109, align 8
  %111 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 10
  %112 = load i64, ptr %111, align 8
  %113 = add nsw i64 %110, %112
  %114 = load i16, ptr %9, align 2
  %115 = sext i16 %114 to i32
  %116 = zext i32 %115 to i64
  %117 = ashr i64 %113, %116
  %118 = trunc i64 %117 to i16
  %119 = load ptr, ptr %3, align 8
  %120 = getelementptr inbounds i16, ptr %119, i64 0
  store i16 %118, ptr %120, align 2
  %121 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 8
  %122 = load i64, ptr %121, align 8
  %123 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 10
  %124 = load i64, ptr %123, align 8
  %125 = sub nsw i64 %122, %124
  %126 = load i16, ptr %9, align 2
  %127 = sext i16 %126 to i32
  %128 = zext i32 %127 to i64
  %129 = ashr i64 %125, %128
  %130 = trunc i64 %129 to i16
  %131 = load ptr, ptr %3, align 8
  %132 = load i16, ptr %8, align 2
  %133 = sext i16 %132 to i32
  %134 = mul nsw i32 4, %133
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i16, ptr %131, i64 %135
  store i16 %130, ptr %136, align 2
  %137 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 11
  %138 = load i64, ptr %137, align 8
  %139 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 9
  %140 = load i64, ptr %139, align 8
  %141 = add nsw i64 %138, %140
  %142 = trunc i64 %141 to i16
  %143 = sext i16 %142 to i32
  %144 = load ptr, ptr %4, align 8
  %145 = getelementptr inbounds i16, ptr %144, i64 10
  %146 = load i16, ptr %145, align 2
  %147 = sext i16 %146 to i32
  %148 = mul nsw i32 %143, %147
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 8
  store i64 %149, ptr %150, align 8
  %151 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 8
  %152 = load i64, ptr %151, align 8
  %153 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 9
  %154 = load i64, ptr %153, align 8
  %155 = load ptr, ptr %4, align 8
  %156 = getelementptr inbounds i16, ptr %155, i64 9
  %157 = load i16, ptr %156, align 2
  %158 = sext i16 %157 to i64
  %159 = mul nsw i64 %154, %158
  %160 = load i16, ptr %10, align 2
  %161 = sext i16 %160 to i32
  %162 = zext i32 %161 to i64
  %163 = ashr i64 %159, %162
  %164 = trunc i64 %163 to i16
  %165 = sext i16 %164 to i64
  %166 = add nsw i64 %152, %165
  %167 = trunc i64 %166 to i16
  %168 = load ptr, ptr %3, align 8
  %169 = load i16, ptr %8, align 2
  %170 = sext i16 %169 to i32
  %171 = mul nsw i32 2, %170
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds i16, ptr %168, i64 %172
  store i16 %167, ptr %173, align 2
  %174 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 8
  %175 = load i64, ptr %174, align 8
  %176 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 11
  %177 = load i64, ptr %176, align 8
  %178 = load ptr, ptr %4, align 8
  %179 = getelementptr inbounds i16, ptr %178, i64 11
  %180 = load i16, ptr %179, align 2
  %181 = sext i16 %180 to i64
  %182 = mul nsw i64 %177, %181
  %183 = load i16, ptr %10, align 2
  %184 = sext i16 %183 to i32
  %185 = zext i32 %184 to i64
  %186 = ashr i64 %182, %185
  %187 = trunc i64 %186 to i16
  %188 = sext i16 %187 to i64
  %189 = add nsw i64 %175, %188
  %190 = trunc i64 %189 to i16
  %191 = load ptr, ptr %3, align 8
  %192 = load i16, ptr %8, align 2
  %193 = sext i16 %192 to i32
  %194 = mul nsw i32 6, %193
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds i16, ptr %191, i64 %195
  store i16 %190, ptr %196, align 2
  %197 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 4
  %198 = load i64, ptr %197, align 8
  %199 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 7
  %200 = load i64, ptr %199, align 8
  %201 = add nsw i64 %198, %200
  %202 = trunc i64 %201 to i16
  %203 = sext i16 %202 to i32
  %204 = load ptr, ptr %4, align 8
  %205 = getelementptr inbounds i16, ptr %204, i64 2
  %206 = load i16, ptr %205, align 2
  %207 = sext i16 %206 to i32
  %208 = mul nsw i32 %203, %207
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 0
  store i64 %209, ptr %210, align 8
  %211 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 5
  %212 = load i64, ptr %211, align 8
  %213 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 6
  %214 = load i64, ptr %213, align 8
  %215 = add nsw i64 %212, %214
  %216 = trunc i64 %215 to i16
  %217 = sext i16 %216 to i32
  %218 = load ptr, ptr %4, align 8
  %219 = getelementptr inbounds i16, ptr %218, i64 0
  %220 = load i16, ptr %219, align 2
  %221 = sext i16 %220 to i32
  %222 = mul nsw i32 %217, %221
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 1
  store i64 %223, ptr %224, align 8
  %225 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 4
  %226 = load i64, ptr %225, align 8
  %227 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 6
  %228 = load i64, ptr %227, align 8
  %229 = add nsw i64 %226, %228
  %230 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 2
  store i64 %229, ptr %230, align 8
  %231 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 5
  %232 = load i64, ptr %231, align 8
  %233 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 7
  %234 = load i64, ptr %233, align 8
  %235 = add nsw i64 %232, %234
  %236 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 3
  store i64 %235, ptr %236, align 8
  %237 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 2
  %238 = load i64, ptr %237, align 8
  %239 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 3
  %240 = load i64, ptr %239, align 8
  %241 = add nsw i64 %238, %240
  %242 = trunc i64 %241 to i16
  %243 = sext i16 %242 to i32
  %244 = load ptr, ptr %4, align 8
  %245 = getelementptr inbounds i16, ptr %244, i64 8
  %246 = load i16, ptr %245, align 2
  %247 = sext i16 %246 to i32
  %248 = mul nsw i32 %243, %247
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 8
  store i64 %249, ptr %250, align 8
  %251 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 2
  %252 = load i64, ptr %251, align 8
  %253 = trunc i64 %252 to i16
  %254 = sext i16 %253 to i32
  %255 = load ptr, ptr %4, align 8
  %256 = getelementptr inbounds i16, ptr %255, i64 1
  %257 = load i16, ptr %256, align 2
  %258 = sext i16 %257 to i32
  %259 = mul nsw i32 %254, %258
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 8
  %262 = load i64, ptr %261, align 8
  %263 = add nsw i64 %260, %262
  %264 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 2
  store i64 %263, ptr %264, align 8
  %265 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 3
  %266 = load i64, ptr %265, align 8
  %267 = trunc i64 %266 to i16
  %268 = sext i16 %267 to i32
  %269 = load ptr, ptr %4, align 8
  %270 = getelementptr inbounds i16, ptr %269, i64 3
  %271 = load i16, ptr %270, align 2
  %272 = sext i16 %271 to i32
  %273 = mul nsw i32 %268, %272
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 8
  %276 = load i64, ptr %275, align 8
  %277 = add nsw i64 %274, %276
  %278 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 3
  store i64 %277, ptr %278, align 8
  %279 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 4
  %280 = load i64, ptr %279, align 8
  %281 = load ptr, ptr %4, align 8
  %282 = getelementptr inbounds i16, ptr %281, i64 4
  %283 = load i16, ptr %282, align 2
  %284 = sext i16 %283 to i64
  %285 = mul nsw i64 %280, %284
  %286 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 0
  %287 = load i64, ptr %286, align 8
  %288 = add nsw i64 %285, %287
  %289 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 2
  %290 = load i64, ptr %289, align 8
  %291 = add nsw i64 %288, %290
  %292 = trunc i64 %291 to i16
  %293 = sext i16 %292 to i32
  %294 = load i16, ptr %10, align 2
  %295 = sext i16 %294 to i32
  %296 = ashr i32 %293, %295
  %297 = trunc i32 %296 to i16
  %298 = load ptr, ptr %3, align 8
  %299 = load i16, ptr %8, align 2
  %300 = sext i16 %299 to i32
  %301 = mul nsw i32 7, %300
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds i16, ptr %298, i64 %302
  store i16 %297, ptr %303, align 2
  %304 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 5
  %305 = load i64, ptr %304, align 8
  %306 = load ptr, ptr %4, align 8
  %307 = getelementptr inbounds i16, ptr %306, i64 6
  %308 = load i16, ptr %307, align 2
  %309 = sext i16 %308 to i64
  %310 = mul nsw i64 %305, %309
  %311 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 1
  %312 = load i64, ptr %311, align 8
  %313 = add nsw i64 %310, %312
  %314 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 3
  %315 = load i64, ptr %314, align 8
  %316 = add nsw i64 %313, %315
  %317 = trunc i64 %316 to i16
  %318 = sext i16 %317 to i32
  %319 = load i16, ptr %10, align 2
  %320 = sext i16 %319 to i32
  %321 = ashr i32 %318, %320
  %322 = trunc i32 %321 to i16
  %323 = load ptr, ptr %3, align 8
  %324 = load i16, ptr %8, align 2
  %325 = sext i16 %324 to i32
  %326 = mul nsw i32 5, %325
  %327 = sext i32 %326 to i64
  %328 = getelementptr inbounds i16, ptr %323, i64 %327
  store i16 %322, ptr %328, align 2
  %329 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 6
  %330 = load i64, ptr %329, align 8
  %331 = load ptr, ptr %4, align 8
  %332 = getelementptr inbounds i16, ptr %331, i64 5
  %333 = load i16, ptr %332, align 2
  %334 = sext i16 %333 to i64
  %335 = mul nsw i64 %330, %334
  %336 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 1
  %337 = load i64, ptr %336, align 8
  %338 = add nsw i64 %335, %337
  %339 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 2
  %340 = load i64, ptr %339, align 8
  %341 = add nsw i64 %338, %340
  %342 = trunc i64 %341 to i16
  %343 = sext i16 %342 to i32
  %344 = load i16, ptr %10, align 2
  %345 = sext i16 %344 to i32
  %346 = ashr i32 %343, %345
  %347 = trunc i32 %346 to i16
  %348 = load ptr, ptr %3, align 8
  %349 = load i16, ptr %8, align 2
  %350 = sext i16 %349 to i32
  %351 = mul nsw i32 3, %350
  %352 = sext i32 %351 to i64
  %353 = getelementptr inbounds i16, ptr %348, i64 %352
  store i16 %347, ptr %353, align 2
  %354 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 7
  %355 = load i64, ptr %354, align 8
  %356 = load ptr, ptr %4, align 8
  %357 = getelementptr inbounds i16, ptr %356, i64 7
  %358 = load i16, ptr %357, align 2
  %359 = sext i16 %358 to i64
  %360 = mul nsw i64 %355, %359
  %361 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 0
  %362 = load i64, ptr %361, align 8
  %363 = add nsw i64 %360, %362
  %364 = getelementptr inbounds [12 x i64], ptr %5, i64 0, i64 3
  %365 = load i64, ptr %364, align 8
  %366 = add nsw i64 %363, %365
  %367 = trunc i64 %366 to i16
  %368 = sext i16 %367 to i32
  %369 = load i16, ptr %10, align 2
  %370 = sext i16 %369 to i32
  %371 = ashr i32 %368, %370
  %372 = trunc i32 %371 to i16
  %373 = load ptr, ptr %3, align 8
  %374 = load i16, ptr %8, align 2
  %375 = sext i16 %374 to i32
  %376 = mul nsw i32 1, %375
  %377 = sext i32 %376 to i64
  %378 = getelementptr inbounds i16, ptr %373, i64 %377
  store i16 %372, ptr %378, align 2
  br label %379

379:                                              ; preds = %84
  %380 = load i16, ptr %6, align 2
  %381 = add i16 %380, 1
  store i16 %381, ptr %6, align 2
  %382 = load i16, ptr %11, align 2
  %383 = sext i16 %382 to i32
  %384 = load ptr, ptr %3, align 8
  %385 = sext i32 %383 to i64
  %386 = getelementptr inbounds i16, ptr %384, i64 %385
  store ptr %386, ptr %3, align 8
  br label %17, !llvm.loop !17

387:                                              ; preds = %17
  br label %388

388:                                              ; preds = %387
  %389 = load i16, ptr %8, align 2
  %390 = sext i16 %389 to i32
  %391 = add nsw i32 %390, 7
  %392 = trunc i32 %391 to i16
  store i16 %392, ptr %8, align 2
  %393 = load i16, ptr %9, align 2
  %394 = sext i16 %393 to i32
  %395 = add nsw i32 %394, 3
  %396 = trunc i32 %395 to i16
  store i16 %396, ptr %9, align 2
  %397 = load i16, ptr %10, align 2
  %398 = sext i16 %397 to i32
  %399 = add nsw i32 %398, 3
  %400 = trunc i32 %399 to i16
  store i16 %400, ptr %10, align 2
  %401 = load i16, ptr %11, align 2
  %402 = sext i16 %401 to i32
  %403 = sub nsw i32 %402, 7
  %404 = trunc i32 %403 to i16
  store i16 %404, ptr %11, align 2
  %405 = load ptr, ptr %3, align 8
  %406 = getelementptr inbounds i16, ptr %405, i64 -64
  store ptr %406, ptr %3, align 8
  br label %12, !llvm.loop !18

407:                                              ; preds = %12
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @initialise_benchmark() #0 {
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
  %4 = alloca [200 x i16], align 2
  %5 = alloca [200 x i16], align 2
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %48, %1
  %8 = load i32, ptr %3, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %51

11:                                               ; preds = %7
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %4, ptr align 2 @__const.benchmark_body.in_a, i64 400, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %5, ptr align 2 @__const.benchmark_body.in_b, i64 400, i1 false)
  store i16 3, ptr @c, align 2
  store i64 43690, ptr @d, align 8
  store i32 61166, ptr @e, align 4
  store i32 0, ptr %6, align 4
  br label %12

12:                                               ; preds = %30, %11
  %13 = load i32, ptr %6, align 4
  %14 = icmp slt i32 %13, 200
  br i1 %14, label %15, label %33

15:                                               ; preds = %12
  %16 = load i32, ptr %6, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [200 x i16], ptr %4, i64 0, i64 %17
  %19 = load i16, ptr %18, align 2
  %20 = load i32, ptr %6, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [200 x i16], ptr @a, i64 0, i64 %21
  store i16 %19, ptr %22, align 2
  %23 = load i32, ptr %6, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [200 x i16], ptr %5, i64 0, i64 %24
  %26 = load i16, ptr %25, align 2
  %27 = load i32, ptr %6, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [200 x i16], ptr @b, i64 0, i64 %28
  store i16 %26, ptr %29, align 2
  br label %30

30:                                               ; preds = %15
  %31 = load i32, ptr %6, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %6, align 4
  br label %12, !llvm.loop !19

33:                                               ; preds = %12
  %34 = load i16, ptr @c, align 2
  call void @vec_mpy1(ptr noundef @a, ptr noundef @b, i16 noundef %34)
  %35 = load i16, ptr @c, align 2
  %36 = sext i16 %35 to i64
  %37 = call i64 @mac(ptr noundef @a, ptr noundef @b, i64 noundef %36, ptr noundef @output)
  %38 = trunc i64 %37 to i16
  store i16 %38, ptr @c, align 2
  call void @fir(ptr noundef @a, ptr noundef @b, ptr noundef @output)
  call void @fir_no_red_ld(ptr noundef @a, ptr noundef @b, ptr noundef @output)
  %39 = load i64, ptr @d, align 8
  %40 = call i64 @latsynth(ptr noundef @a, ptr noundef @b, i64 noundef 100, i64 noundef %39)
  store i64 %40, ptr @d, align 8
  call void @iir1(ptr noundef @a, ptr noundef @b, ptr noundef getelementptr inbounds ([200 x i64], ptr @output, i64 0, i64 100), ptr noundef @output)
  %41 = load i64, ptr @d, align 8
  %42 = load i32, ptr @e, align 4
  %43 = sext i32 %42 to i64
  %44 = load i64, ptr @d, align 8
  %45 = load i16, ptr @c, align 2
  %46 = call i64 @codebook(i64 noundef %41, i64 noundef 1, i64 noundef 17, i64 noundef %43, i64 noundef %44, ptr noundef @a, i16 noundef %45, i16 noundef 1)
  %47 = trunc i64 %46 to i32
  store i32 %47, ptr @e, align 4
  call void @jpegdct(ptr noundef @a, ptr noundef @b)
  br label %48

48:                                               ; preds = %33
  %49 = load i32, ptr %3, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, ptr %3, align 4
  br label %7, !llvm.loop !20

51:                                               ; preds = %7
  ret i32 0
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @benchmark() #0 {
  %1 = call i32 @benchmark_body(i32 noundef 87000)
  ret i32 %1
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @verify_benchmark(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca [200 x i64], align 8
  store i32 %0, ptr %2, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 @__const.verify_benchmark.exp_output, i64 1600, i1 false)
  %4 = getelementptr inbounds [200 x i64], ptr %3, i64 0, i64 0
  %5 = call i32 @memcmp(ptr noundef @output, ptr noundef %4, i64 noundef 1600) #4
  %6 = icmp eq i32 0, %5
  br i1 %6, label %7, label %17

7:                                                ; preds = %1
  %8 = load i16, ptr @c, align 2
  %9 = sext i16 %8 to i32
  %10 = icmp eq i32 10243, %9
  br i1 %10, label %11, label %17

11:                                               ; preds = %7
  %12 = load i64, ptr @d, align 8
  %13 = icmp eq i64 -441886230, %12
  br i1 %13, label %14, label %17

14:                                               ; preds = %11
  %15 = load i32, ptr @e, align 4
  %16 = icmp eq i32 -441886230, %15
  br label %17

17:                                               ; preds = %14, %11, %7, %1
  %18 = phi i1 [ false, %11 ], [ false, %7 ], [ false, %1 ], [ %16, %14 ]
  %19 = zext i1 %18 to i32
  ret i32 %19
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef) #2

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
  %8 = call i32 @benchmark()
  store volatile i32 %8, ptr %6, align 4
  call void @cflat_finalize_and_print()
  %9 = load volatile i32, ptr %6, align 4
  %10 = call i32 @verify_benchmark(i32 noundef %9)
  store i32 %10, ptr %7, align 4
  %11 = load i32, ptr %7, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %11)
  ret i32 0
}

declare void @cflat_finalize_and_print() #3

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind noinline uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #4 = { nounwind willreturn memory(read) }

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
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
