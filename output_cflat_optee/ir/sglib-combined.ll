; ModuleID = './output_cflat_optee/ir/sglib-combined.ll'
source_filename = "./embench-iot-benchmarks-backup/sglib-combined.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

%struct.dllist = type { i32, ptr, ptr }
%struct.sglib_dllist_iterator = type { ptr, ptr, ptr, ptr, ptr }
%struct.ilist = type { i32, ptr }
%struct.sglib_ilist_iterator = type { ptr, ptr, ptr, ptr }
%struct.sglib_hashed_ilist_iterator = type { %struct.sglib_ilist_iterator, ptr, i32, ptr, ptr }
%struct.iq = type { [101 x i32], i32, i32 }
%struct.rbtree = type { i32, i8, ptr, ptr }
%struct.sglib_rbtree_iterator = type { ptr, [128 x i8], [128 x ptr], i16, i16, ptr, ptr }

@seed = internal global i64 0, align 8
@heap_ptr = internal global ptr null, align 8
@heap_end = internal global ptr null, align 8
@heap_requested = internal global i64 0, align 8
@verify_benchmark.array_exp = internal constant [100 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71, i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79, i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87, i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95, i32 96, i32 97, i32 98, i32 99], align 4
@the_list = dso_local global ptr null, align 8
@array = internal constant [100 x i32] [i32 14, i32 66, i32 12, i32 41, i32 86, i32 69, i32 19, i32 77, i32 68, i32 38, i32 26, i32 42, i32 37, i32 23, i32 17, i32 29, i32 55, i32 13, i32 90, i32 92, i32 76, i32 99, i32 10, i32 54, i32 57, i32 83, i32 40, i32 44, i32 75, i32 33, i32 24, i32 28, i32 80, i32 18, i32 78, i32 32, i32 93, i32 89, i32 52, i32 11, i32 21, i32 96, i32 50, i32 15, i32 48, i32 63, i32 87, i32 20, i32 8, i32 85, i32 43, i32 16, i32 94, i32 88, i32 53, i32 84, i32 74, i32 91, i32 67, i32 36, i32 95, i32 61, i32 64, i32 5, i32 30, i32 82, i32 72, i32 46, i32 59, i32 9, i32 7, i32 3, i32 39, i32 31, i32 4, i32 73, i32 70, i32 60, i32 58, i32 81, i32 56, i32 51, i32 45, i32 1, i32 6, i32 49, i32 27, i32 47, i32 34, i32 35, i32 62, i32 97, i32 2, i32 79, i32 98, i32 25, i32 22, i32 65, i32 71, i32 0], align 4
@htab = dso_local global [20 x ptr] zeroinitializer, align 8
@heap = internal global [8192 x i8] zeroinitializer, align 16
@array2 = dso_local global [100 x i32] zeroinitializer, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@llvm.compiler.used = appending global [1 x ptr] [ptr @main], section "llvm.metadata"

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @rand_beebs() #0 {
  %1 = load i64, ptr @seed, align 8
  %2 = mul nsw i64 %1, 1103515245
  %3 = add nsw i64 %2, 12345
  %4 = and i64 %3, 2147483647
  store i64 %4, ptr @seed, align 8
  %5 = load i64, ptr @seed, align 8
  %6 = ashr i64 %5, 16
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @srand_beebs(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = zext i32 %3 to i64
  store i64 %4, ptr @seed, align 8
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @init_heap_beebs(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  store ptr %5, ptr @heap_ptr, align 8
  %6 = load ptr, ptr @heap_ptr, align 8
  %7 = load i64, ptr %4, align 8
  %8 = getelementptr inbounds i8, ptr %6, i64 %7
  store ptr %8, ptr @heap_end, align 8
  store i64 0, ptr @heap_requested, align 8
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @check_heap_beebs(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load i64, ptr @heap_requested, align 8
  %5 = getelementptr inbounds i8, ptr %3, i64 %4
  %6 = load ptr, ptr @heap_end, align 8
  %7 = icmp ule ptr %5, %6
  %8 = zext i1 %7 to i32
  ret i32 %8
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @malloc_beebs(i64 noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  store i64 %0, ptr %3, align 8
  %5 = load ptr, ptr @heap_ptr, align 8
  store ptr %5, ptr %4, align 8
  %6 = load i64, ptr %3, align 8
  %7 = load i64, ptr @heap_requested, align 8
  %8 = add i64 %7, %6
  store i64 %8, ptr @heap_requested, align 8
  %9 = load ptr, ptr @heap_ptr, align 8
  %10 = load i64, ptr %3, align 8
  %11 = getelementptr inbounds i8, ptr %9, i64 %10
  %12 = load ptr, ptr @heap_end, align 8
  %13 = icmp ugt ptr %11, %12
  br i1 %13, label %17, label %14

14:                                               ; preds = %1
  %15 = load i64, ptr %3, align 8
  %16 = icmp eq i64 0, %15
  br i1 %16, label %17, label %18

17:                                               ; preds = %14, %1
  store ptr null, ptr %2, align 8
  br label %23

18:                                               ; preds = %14
  %19 = load ptr, ptr @heap_ptr, align 8
  %20 = load i64, ptr %3, align 8
  %21 = getelementptr inbounds i8, ptr %19, i64 %20
  store ptr %21, ptr @heap_ptr, align 8
  %22 = load ptr, ptr %4, align 8
  store ptr %22, ptr %2, align 8
  br label %23

23:                                               ; preds = %18, %17
  %24 = load ptr, ptr %2, align 8
  ret ptr %24
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @calloc_beebs(i64 noundef %0, i64 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  store i64 %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %6 = load i64, ptr %3, align 8
  %7 = load i64, ptr %4, align 8
  %8 = mul i64 %6, %7
  %9 = call ptr @malloc_beebs(i64 noundef %8)
  store ptr %9, ptr %5, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = icmp ne ptr null, %10
  br i1 %11, label %12, label %17

12:                                               ; preds = %2
  %13 = load ptr, ptr %5, align 8
  %14 = load i64, ptr %3, align 8
  %15 = load i64, ptr %4, align 8
  %16 = mul i64 %14, %15
  call void @llvm.memset.p0.i64(ptr align 1 %13, i8 0, i64 %16, i1 false)
  br label %17

17:                                               ; preds = %12, %2
  %18 = load ptr, ptr %5, align 8
  ret ptr %18
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @realloc_beebs(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %8 = load ptr, ptr @heap_ptr, align 8
  store ptr %8, ptr %6, align 8
  %9 = load i64, ptr %5, align 8
  %10 = load i64, ptr @heap_requested, align 8
  %11 = add i64 %10, %9
  store i64 %11, ptr @heap_requested, align 8
  %12 = load ptr, ptr @heap_ptr, align 8
  %13 = load i64, ptr %5, align 8
  %14 = getelementptr inbounds i8, ptr %12, i64 %13
  %15 = load ptr, ptr @heap_end, align 8
  %16 = icmp ugt ptr %14, %15
  br i1 %16, label %20, label %17

17:                                               ; preds = %2
  %18 = load i64, ptr %5, align 8
  %19 = icmp eq i64 0, %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %17, %2
  store ptr null, ptr %3, align 8
  br label %46

21:                                               ; preds = %17
  %22 = load ptr, ptr @heap_ptr, align 8
  %23 = load i64, ptr %5, align 8
  %24 = getelementptr inbounds i8, ptr %22, i64 %23
  store ptr %24, ptr @heap_ptr, align 8
  %25 = load ptr, ptr %4, align 8
  %26 = icmp ne ptr null, %25
  br i1 %26, label %27, label %44

27:                                               ; preds = %21
  store i64 0, ptr %7, align 8
  br label %28

28:                                               ; preds = %40, %27
  %29 = load i64, ptr %7, align 8
  %30 = load i64, ptr %5, align 8
  %31 = icmp ult i64 %29, %30
  br i1 %31, label %32, label %43

32:                                               ; preds = %28
  %33 = load ptr, ptr %4, align 8
  %34 = load i64, ptr %7, align 8
  %35 = getelementptr inbounds i8, ptr %33, i64 %34
  %36 = load i8, ptr %35, align 1
  %37 = load ptr, ptr %6, align 8
  %38 = load i64, ptr %7, align 8
  %39 = getelementptr inbounds i8, ptr %37, i64 %38
  store i8 %36, ptr %39, align 1
  br label %40

40:                                               ; preds = %32
  %41 = load i64, ptr %7, align 8
  %42 = add i64 %41, 1
  store i64 %42, ptr %7, align 8
  br label %28, !llvm.loop !6

43:                                               ; preds = %28
  br label %44

44:                                               ; preds = %43, %21
  %45 = load ptr, ptr %6, align 8
  store ptr %45, ptr %3, align 8
  br label %46

46:                                               ; preds = %44, %20
  %47 = load ptr, ptr %3, align 8
  ret ptr %47
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @free_beebs(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_dllist_add(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %17

8:                                                ; preds = %2
  %9 = load ptr, ptr %4, align 8
  %10 = load ptr, ptr %3, align 8
  store ptr %9, ptr %10, align 8
  %11 = load ptr, ptr %3, align 8
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds %struct.dllist, ptr %12, i32 0, i32 2
  store ptr null, ptr %13, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.dllist, ptr %15, i32 0, i32 1
  store ptr null, ptr %16, align 8
  br label %43

17:                                               ; preds = %2
  %18 = load ptr, ptr %3, align 8
  %19 = load ptr, ptr %18, align 8
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds %struct.dllist, ptr %20, i32 0, i32 1
  store ptr %19, ptr %21, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = load ptr, ptr %22, align 8
  %24 = getelementptr inbounds %struct.dllist, ptr %23, i32 0, i32 2
  %25 = load ptr, ptr %24, align 8
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.dllist, ptr %26, i32 0, i32 2
  store ptr %25, ptr %27, align 8
  %28 = load ptr, ptr %4, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = load ptr, ptr %29, align 8
  %31 = getelementptr inbounds %struct.dllist, ptr %30, i32 0, i32 2
  store ptr %28, ptr %31, align 8
  %32 = load ptr, ptr %4, align 8
  %33 = getelementptr inbounds %struct.dllist, ptr %32, i32 0, i32 2
  %34 = load ptr, ptr %33, align 8
  %35 = icmp ne ptr %34, null
  br i1 %35, label %36, label %42

36:                                               ; preds = %17
  %37 = load ptr, ptr %4, align 8
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds %struct.dllist, ptr %38, i32 0, i32 2
  %40 = load ptr, ptr %39, align 8
  %41 = getelementptr inbounds %struct.dllist, ptr %40, i32 0, i32 1
  store ptr %37, ptr %41, align 8
  br label %42

42:                                               ; preds = %36, %17
  br label %43

43:                                               ; preds = %42, %8
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_dllist_add_after(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %17

8:                                                ; preds = %2
  %9 = load ptr, ptr %4, align 8
  %10 = load ptr, ptr %3, align 8
  store ptr %9, ptr %10, align 8
  %11 = load ptr, ptr %3, align 8
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds %struct.dllist, ptr %12, i32 0, i32 2
  store ptr null, ptr %13, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.dllist, ptr %15, i32 0, i32 1
  store ptr null, ptr %16, align 8
  br label %43

17:                                               ; preds = %2
  %18 = load ptr, ptr %3, align 8
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds %struct.dllist, ptr %19, i32 0, i32 1
  %21 = load ptr, ptr %20, align 8
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds %struct.dllist, ptr %22, i32 0, i32 1
  store ptr %21, ptr %23, align 8
  %24 = load ptr, ptr %3, align 8
  %25 = load ptr, ptr %24, align 8
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.dllist, ptr %26, i32 0, i32 2
  store ptr %25, ptr %27, align 8
  %28 = load ptr, ptr %4, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = load ptr, ptr %29, align 8
  %31 = getelementptr inbounds %struct.dllist, ptr %30, i32 0, i32 1
  store ptr %28, ptr %31, align 8
  %32 = load ptr, ptr %4, align 8
  %33 = getelementptr inbounds %struct.dllist, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  %35 = icmp ne ptr %34, null
  br i1 %35, label %36, label %42

36:                                               ; preds = %17
  %37 = load ptr, ptr %4, align 8
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds %struct.dllist, ptr %38, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8
  %41 = getelementptr inbounds %struct.dllist, ptr %40, i32 0, i32 2
  store ptr %37, ptr %41, align 8
  br label %42

42:                                               ; preds = %36, %17
  br label %43

43:                                               ; preds = %42, %8
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_dllist_add_before(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %17

8:                                                ; preds = %2
  %9 = load ptr, ptr %4, align 8
  %10 = load ptr, ptr %3, align 8
  store ptr %9, ptr %10, align 8
  %11 = load ptr, ptr %3, align 8
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds %struct.dllist, ptr %12, i32 0, i32 2
  store ptr null, ptr %13, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.dllist, ptr %15, i32 0, i32 1
  store ptr null, ptr %16, align 8
  br label %43

17:                                               ; preds = %2
  %18 = load ptr, ptr %3, align 8
  %19 = load ptr, ptr %18, align 8
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds %struct.dllist, ptr %20, i32 0, i32 1
  store ptr %19, ptr %21, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = load ptr, ptr %22, align 8
  %24 = getelementptr inbounds %struct.dllist, ptr %23, i32 0, i32 2
  %25 = load ptr, ptr %24, align 8
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.dllist, ptr %26, i32 0, i32 2
  store ptr %25, ptr %27, align 8
  %28 = load ptr, ptr %4, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = load ptr, ptr %29, align 8
  %31 = getelementptr inbounds %struct.dllist, ptr %30, i32 0, i32 2
  store ptr %28, ptr %31, align 8
  %32 = load ptr, ptr %4, align 8
  %33 = getelementptr inbounds %struct.dllist, ptr %32, i32 0, i32 2
  %34 = load ptr, ptr %33, align 8
  %35 = icmp ne ptr %34, null
  br i1 %35, label %36, label %42

36:                                               ; preds = %17
  %37 = load ptr, ptr %4, align 8
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds %struct.dllist, ptr %38, i32 0, i32 2
  %40 = load ptr, ptr %39, align 8
  %41 = getelementptr inbounds %struct.dllist, ptr %40, i32 0, i32 1
  store ptr %37, ptr %41, align 8
  br label %42

42:                                               ; preds = %36, %17
  br label %43

43:                                               ; preds = %42, %8
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_dllist_add_if_not_member(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %7, align 8
  br label %10

10:                                               ; preds = %25, %3
  %11 = load ptr, ptr %7, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %22

13:                                               ; preds = %10
  %14 = load ptr, ptr %7, align 8
  %15 = getelementptr inbounds %struct.dllist, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds %struct.dllist, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %18, align 8
  %20 = sub nsw i32 %16, %19
  %21 = icmp ne i32 %20, 0
  br label %22

22:                                               ; preds = %13, %10
  %23 = phi i1 [ false, %10 ], [ %21, %13 ]
  br i1 %23, label %24, label %29

24:                                               ; preds = %22
  br label %25

25:                                               ; preds = %24
  %26 = load ptr, ptr %7, align 8
  %27 = getelementptr inbounds %struct.dllist, ptr %26, i32 0, i32 2
  %28 = load ptr, ptr %27, align 8
  store ptr %28, ptr %7, align 8
  br label %10, !llvm.loop !8

29:                                               ; preds = %22
  %30 = load ptr, ptr %7, align 8
  %31 = icmp eq ptr %30, null
  br i1 %31, label %32, label %61

32:                                               ; preds = %29
  %33 = load ptr, ptr %4, align 8
  %34 = load ptr, ptr %33, align 8
  %35 = icmp ne ptr %34, null
  br i1 %35, label %36, label %61

36:                                               ; preds = %32
  %37 = load ptr, ptr %4, align 8
  %38 = load ptr, ptr %37, align 8
  %39 = getelementptr inbounds %struct.dllist, ptr %38, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8
  store ptr %40, ptr %7, align 8
  br label %41

41:                                               ; preds = %56, %36
  %42 = load ptr, ptr %7, align 8
  %43 = icmp ne ptr %42, null
  br i1 %43, label %44, label %53

44:                                               ; preds = %41
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr inbounds %struct.dllist, ptr %45, i32 0, i32 0
  %47 = load i32, ptr %46, align 8
  %48 = load ptr, ptr %5, align 8
  %49 = getelementptr inbounds %struct.dllist, ptr %48, i32 0, i32 0
  %50 = load i32, ptr %49, align 8
  %51 = sub nsw i32 %47, %50
  %52 = icmp ne i32 %51, 0
  br label %53

53:                                               ; preds = %44, %41
  %54 = phi i1 [ false, %41 ], [ %52, %44 ]
  br i1 %54, label %55, label %60

55:                                               ; preds = %53
  br label %56

56:                                               ; preds = %55
  %57 = load ptr, ptr %7, align 8
  %58 = getelementptr inbounds %struct.dllist, ptr %57, i32 0, i32 1
  %59 = load ptr, ptr %58, align 8
  store ptr %59, ptr %7, align 8
  br label %41, !llvm.loop !9

60:                                               ; preds = %53
  br label %61

61:                                               ; preds = %60, %32, %29
  %62 = load ptr, ptr %7, align 8
  %63 = load ptr, ptr %6, align 8
  store ptr %62, ptr %63, align 8
  %64 = load ptr, ptr %7, align 8
  %65 = icmp eq ptr %64, null
  br i1 %65, label %66, label %106

66:                                               ; preds = %61
  %67 = load ptr, ptr %4, align 8
  %68 = load ptr, ptr %67, align 8
  %69 = icmp eq ptr %68, null
  br i1 %69, label %70, label %79

70:                                               ; preds = %66
  %71 = load ptr, ptr %5, align 8
  %72 = load ptr, ptr %4, align 8
  store ptr %71, ptr %72, align 8
  %73 = load ptr, ptr %4, align 8
  %74 = load ptr, ptr %73, align 8
  %75 = getelementptr inbounds %struct.dllist, ptr %74, i32 0, i32 2
  store ptr null, ptr %75, align 8
  %76 = load ptr, ptr %4, align 8
  %77 = load ptr, ptr %76, align 8
  %78 = getelementptr inbounds %struct.dllist, ptr %77, i32 0, i32 1
  store ptr null, ptr %78, align 8
  br label %105

79:                                               ; preds = %66
  %80 = load ptr, ptr %4, align 8
  %81 = load ptr, ptr %80, align 8
  %82 = load ptr, ptr %5, align 8
  %83 = getelementptr inbounds %struct.dllist, ptr %82, i32 0, i32 1
  store ptr %81, ptr %83, align 8
  %84 = load ptr, ptr %4, align 8
  %85 = load ptr, ptr %84, align 8
  %86 = getelementptr inbounds %struct.dllist, ptr %85, i32 0, i32 2
  %87 = load ptr, ptr %86, align 8
  %88 = load ptr, ptr %5, align 8
  %89 = getelementptr inbounds %struct.dllist, ptr %88, i32 0, i32 2
  store ptr %87, ptr %89, align 8
  %90 = load ptr, ptr %5, align 8
  %91 = load ptr, ptr %4, align 8
  %92 = load ptr, ptr %91, align 8
  %93 = getelementptr inbounds %struct.dllist, ptr %92, i32 0, i32 2
  store ptr %90, ptr %93, align 8
  %94 = load ptr, ptr %5, align 8
  %95 = getelementptr inbounds %struct.dllist, ptr %94, i32 0, i32 2
  %96 = load ptr, ptr %95, align 8
  %97 = icmp ne ptr %96, null
  br i1 %97, label %98, label %104

98:                                               ; preds = %79
  %99 = load ptr, ptr %5, align 8
  %100 = load ptr, ptr %5, align 8
  %101 = getelementptr inbounds %struct.dllist, ptr %100, i32 0, i32 2
  %102 = load ptr, ptr %101, align 8
  %103 = getelementptr inbounds %struct.dllist, ptr %102, i32 0, i32 1
  store ptr %99, ptr %103, align 8
  br label %104

104:                                              ; preds = %98, %79
  br label %105

105:                                              ; preds = %104, %70
  br label %106

106:                                              ; preds = %105, %61
  %107 = load ptr, ptr %6, align 8
  %108 = load ptr, ptr %107, align 8
  %109 = icmp eq ptr %108, null
  %110 = zext i1 %109 to i32
  ret i32 %110
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_dllist_add_after_if_not_member(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %7, align 8
  br label %10

10:                                               ; preds = %25, %3
  %11 = load ptr, ptr %7, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %22

13:                                               ; preds = %10
  %14 = load ptr, ptr %7, align 8
  %15 = getelementptr inbounds %struct.dllist, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds %struct.dllist, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %18, align 8
  %20 = sub nsw i32 %16, %19
  %21 = icmp ne i32 %20, 0
  br label %22

22:                                               ; preds = %13, %10
  %23 = phi i1 [ false, %10 ], [ %21, %13 ]
  br i1 %23, label %24, label %29

24:                                               ; preds = %22
  br label %25

25:                                               ; preds = %24
  %26 = load ptr, ptr %7, align 8
  %27 = getelementptr inbounds %struct.dllist, ptr %26, i32 0, i32 2
  %28 = load ptr, ptr %27, align 8
  store ptr %28, ptr %7, align 8
  br label %10, !llvm.loop !10

29:                                               ; preds = %22
  %30 = load ptr, ptr %7, align 8
  %31 = icmp eq ptr %30, null
  br i1 %31, label %32, label %61

32:                                               ; preds = %29
  %33 = load ptr, ptr %4, align 8
  %34 = load ptr, ptr %33, align 8
  %35 = icmp ne ptr %34, null
  br i1 %35, label %36, label %61

36:                                               ; preds = %32
  %37 = load ptr, ptr %4, align 8
  %38 = load ptr, ptr %37, align 8
  %39 = getelementptr inbounds %struct.dllist, ptr %38, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8
  store ptr %40, ptr %7, align 8
  br label %41

41:                                               ; preds = %56, %36
  %42 = load ptr, ptr %7, align 8
  %43 = icmp ne ptr %42, null
  br i1 %43, label %44, label %53

44:                                               ; preds = %41
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr inbounds %struct.dllist, ptr %45, i32 0, i32 0
  %47 = load i32, ptr %46, align 8
  %48 = load ptr, ptr %5, align 8
  %49 = getelementptr inbounds %struct.dllist, ptr %48, i32 0, i32 0
  %50 = load i32, ptr %49, align 8
  %51 = sub nsw i32 %47, %50
  %52 = icmp ne i32 %51, 0
  br label %53

53:                                               ; preds = %44, %41
  %54 = phi i1 [ false, %41 ], [ %52, %44 ]
  br i1 %54, label %55, label %60

55:                                               ; preds = %53
  br label %56

56:                                               ; preds = %55
  %57 = load ptr, ptr %7, align 8
  %58 = getelementptr inbounds %struct.dllist, ptr %57, i32 0, i32 1
  %59 = load ptr, ptr %58, align 8
  store ptr %59, ptr %7, align 8
  br label %41, !llvm.loop !11

60:                                               ; preds = %53
  br label %61

61:                                               ; preds = %60, %32, %29
  %62 = load ptr, ptr %7, align 8
  %63 = load ptr, ptr %6, align 8
  store ptr %62, ptr %63, align 8
  %64 = load ptr, ptr %7, align 8
  %65 = icmp eq ptr %64, null
  br i1 %65, label %66, label %106

66:                                               ; preds = %61
  %67 = load ptr, ptr %4, align 8
  %68 = load ptr, ptr %67, align 8
  %69 = icmp eq ptr %68, null
  br i1 %69, label %70, label %79

70:                                               ; preds = %66
  %71 = load ptr, ptr %5, align 8
  %72 = load ptr, ptr %4, align 8
  store ptr %71, ptr %72, align 8
  %73 = load ptr, ptr %4, align 8
  %74 = load ptr, ptr %73, align 8
  %75 = getelementptr inbounds %struct.dllist, ptr %74, i32 0, i32 2
  store ptr null, ptr %75, align 8
  %76 = load ptr, ptr %4, align 8
  %77 = load ptr, ptr %76, align 8
  %78 = getelementptr inbounds %struct.dllist, ptr %77, i32 0, i32 1
  store ptr null, ptr %78, align 8
  br label %105

79:                                               ; preds = %66
  %80 = load ptr, ptr %4, align 8
  %81 = load ptr, ptr %80, align 8
  %82 = getelementptr inbounds %struct.dllist, ptr %81, i32 0, i32 1
  %83 = load ptr, ptr %82, align 8
  %84 = load ptr, ptr %5, align 8
  %85 = getelementptr inbounds %struct.dllist, ptr %84, i32 0, i32 1
  store ptr %83, ptr %85, align 8
  %86 = load ptr, ptr %4, align 8
  %87 = load ptr, ptr %86, align 8
  %88 = load ptr, ptr %5, align 8
  %89 = getelementptr inbounds %struct.dllist, ptr %88, i32 0, i32 2
  store ptr %87, ptr %89, align 8
  %90 = load ptr, ptr %5, align 8
  %91 = load ptr, ptr %4, align 8
  %92 = load ptr, ptr %91, align 8
  %93 = getelementptr inbounds %struct.dllist, ptr %92, i32 0, i32 1
  store ptr %90, ptr %93, align 8
  %94 = load ptr, ptr %5, align 8
  %95 = getelementptr inbounds %struct.dllist, ptr %94, i32 0, i32 1
  %96 = load ptr, ptr %95, align 8
  %97 = icmp ne ptr %96, null
  br i1 %97, label %98, label %104

98:                                               ; preds = %79
  %99 = load ptr, ptr %5, align 8
  %100 = load ptr, ptr %5, align 8
  %101 = getelementptr inbounds %struct.dllist, ptr %100, i32 0, i32 1
  %102 = load ptr, ptr %101, align 8
  %103 = getelementptr inbounds %struct.dllist, ptr %102, i32 0, i32 2
  store ptr %99, ptr %103, align 8
  br label %104

104:                                              ; preds = %98, %79
  br label %105

105:                                              ; preds = %104, %70
  br label %106

106:                                              ; preds = %105, %61
  %107 = load ptr, ptr %6, align 8
  %108 = load ptr, ptr %107, align 8
  %109 = icmp eq ptr %108, null
  %110 = zext i1 %109 to i32
  ret i32 %110
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_dllist_add_before_if_not_member(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %7, align 8
  br label %10

10:                                               ; preds = %25, %3
  %11 = load ptr, ptr %7, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %22

13:                                               ; preds = %10
  %14 = load ptr, ptr %7, align 8
  %15 = getelementptr inbounds %struct.dllist, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds %struct.dllist, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %18, align 8
  %20 = sub nsw i32 %16, %19
  %21 = icmp ne i32 %20, 0
  br label %22

22:                                               ; preds = %13, %10
  %23 = phi i1 [ false, %10 ], [ %21, %13 ]
  br i1 %23, label %24, label %29

24:                                               ; preds = %22
  br label %25

25:                                               ; preds = %24
  %26 = load ptr, ptr %7, align 8
  %27 = getelementptr inbounds %struct.dllist, ptr %26, i32 0, i32 2
  %28 = load ptr, ptr %27, align 8
  store ptr %28, ptr %7, align 8
  br label %10, !llvm.loop !12

29:                                               ; preds = %22
  %30 = load ptr, ptr %7, align 8
  %31 = icmp eq ptr %30, null
  br i1 %31, label %32, label %61

32:                                               ; preds = %29
  %33 = load ptr, ptr %4, align 8
  %34 = load ptr, ptr %33, align 8
  %35 = icmp ne ptr %34, null
  br i1 %35, label %36, label %61

36:                                               ; preds = %32
  %37 = load ptr, ptr %4, align 8
  %38 = load ptr, ptr %37, align 8
  %39 = getelementptr inbounds %struct.dllist, ptr %38, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8
  store ptr %40, ptr %7, align 8
  br label %41

41:                                               ; preds = %56, %36
  %42 = load ptr, ptr %7, align 8
  %43 = icmp ne ptr %42, null
  br i1 %43, label %44, label %53

44:                                               ; preds = %41
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr inbounds %struct.dllist, ptr %45, i32 0, i32 0
  %47 = load i32, ptr %46, align 8
  %48 = load ptr, ptr %5, align 8
  %49 = getelementptr inbounds %struct.dllist, ptr %48, i32 0, i32 0
  %50 = load i32, ptr %49, align 8
  %51 = sub nsw i32 %47, %50
  %52 = icmp ne i32 %51, 0
  br label %53

53:                                               ; preds = %44, %41
  %54 = phi i1 [ false, %41 ], [ %52, %44 ]
  br i1 %54, label %55, label %60

55:                                               ; preds = %53
  br label %56

56:                                               ; preds = %55
  %57 = load ptr, ptr %7, align 8
  %58 = getelementptr inbounds %struct.dllist, ptr %57, i32 0, i32 1
  %59 = load ptr, ptr %58, align 8
  store ptr %59, ptr %7, align 8
  br label %41, !llvm.loop !13

60:                                               ; preds = %53
  br label %61

61:                                               ; preds = %60, %32, %29
  %62 = load ptr, ptr %7, align 8
  %63 = load ptr, ptr %6, align 8
  store ptr %62, ptr %63, align 8
  %64 = load ptr, ptr %7, align 8
  %65 = icmp eq ptr %64, null
  br i1 %65, label %66, label %106

66:                                               ; preds = %61
  %67 = load ptr, ptr %4, align 8
  %68 = load ptr, ptr %67, align 8
  %69 = icmp eq ptr %68, null
  br i1 %69, label %70, label %79

70:                                               ; preds = %66
  %71 = load ptr, ptr %5, align 8
  %72 = load ptr, ptr %4, align 8
  store ptr %71, ptr %72, align 8
  %73 = load ptr, ptr %4, align 8
  %74 = load ptr, ptr %73, align 8
  %75 = getelementptr inbounds %struct.dllist, ptr %74, i32 0, i32 2
  store ptr null, ptr %75, align 8
  %76 = load ptr, ptr %4, align 8
  %77 = load ptr, ptr %76, align 8
  %78 = getelementptr inbounds %struct.dllist, ptr %77, i32 0, i32 1
  store ptr null, ptr %78, align 8
  br label %105

79:                                               ; preds = %66
  %80 = load ptr, ptr %4, align 8
  %81 = load ptr, ptr %80, align 8
  %82 = load ptr, ptr %5, align 8
  %83 = getelementptr inbounds %struct.dllist, ptr %82, i32 0, i32 1
  store ptr %81, ptr %83, align 8
  %84 = load ptr, ptr %4, align 8
  %85 = load ptr, ptr %84, align 8
  %86 = getelementptr inbounds %struct.dllist, ptr %85, i32 0, i32 2
  %87 = load ptr, ptr %86, align 8
  %88 = load ptr, ptr %5, align 8
  %89 = getelementptr inbounds %struct.dllist, ptr %88, i32 0, i32 2
  store ptr %87, ptr %89, align 8
  %90 = load ptr, ptr %5, align 8
  %91 = load ptr, ptr %4, align 8
  %92 = load ptr, ptr %91, align 8
  %93 = getelementptr inbounds %struct.dllist, ptr %92, i32 0, i32 2
  store ptr %90, ptr %93, align 8
  %94 = load ptr, ptr %5, align 8
  %95 = getelementptr inbounds %struct.dllist, ptr %94, i32 0, i32 2
  %96 = load ptr, ptr %95, align 8
  %97 = icmp ne ptr %96, null
  br i1 %97, label %98, label %104

98:                                               ; preds = %79
  %99 = load ptr, ptr %5, align 8
  %100 = load ptr, ptr %5, align 8
  %101 = getelementptr inbounds %struct.dllist, ptr %100, i32 0, i32 2
  %102 = load ptr, ptr %101, align 8
  %103 = getelementptr inbounds %struct.dllist, ptr %102, i32 0, i32 1
  store ptr %99, ptr %103, align 8
  br label %104

104:                                              ; preds = %98, %79
  br label %105

105:                                              ; preds = %104, %70
  br label %106

106:                                              ; preds = %105, %61
  %107 = load ptr, ptr %6, align 8
  %108 = load ptr, ptr %107, align 8
  %109 = icmp eq ptr %108, null
  %110 = zext i1 %109 to i32
  ret i32 %110
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_dllist_concat(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %6, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %12

9:                                                ; preds = %2
  %10 = load ptr, ptr %4, align 8
  %11 = load ptr, ptr %3, align 8
  store ptr %10, ptr %11, align 8
  br label %62

12:                                               ; preds = %2
  %13 = load ptr, ptr %4, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %61

15:                                               ; preds = %12
  %16 = load ptr, ptr %3, align 8
  %17 = load ptr, ptr %16, align 8
  store ptr %17, ptr %5, align 8
  br label %18

18:                                               ; preds = %24, %15
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds %struct.dllist, ptr %19, i32 0, i32 1
  %21 = load ptr, ptr %20, align 8
  %22 = icmp ne ptr %21, null
  br i1 %22, label %23, label %28

23:                                               ; preds = %18
  br label %24

24:                                               ; preds = %23
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds %struct.dllist, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  store ptr %27, ptr %5, align 8
  br label %18, !llvm.loop !14

28:                                               ; preds = %18
  %29 = load ptr, ptr %5, align 8
  %30 = icmp eq ptr %29, null
  br i1 %30, label %31, label %37

31:                                               ; preds = %28
  %32 = load ptr, ptr %4, align 8
  store ptr %32, ptr %5, align 8
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds %struct.dllist, ptr %33, i32 0, i32 2
  store ptr null, ptr %34, align 8
  %35 = load ptr, ptr %5, align 8
  %36 = getelementptr inbounds %struct.dllist, ptr %35, i32 0, i32 1
  store ptr null, ptr %36, align 8
  br label %60

37:                                               ; preds = %28
  %38 = load ptr, ptr %5, align 8
  %39 = getelementptr inbounds %struct.dllist, ptr %38, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8
  %41 = load ptr, ptr %4, align 8
  %42 = getelementptr inbounds %struct.dllist, ptr %41, i32 0, i32 1
  store ptr %40, ptr %42, align 8
  %43 = load ptr, ptr %5, align 8
  %44 = load ptr, ptr %4, align 8
  %45 = getelementptr inbounds %struct.dllist, ptr %44, i32 0, i32 2
  store ptr %43, ptr %45, align 8
  %46 = load ptr, ptr %4, align 8
  %47 = load ptr, ptr %5, align 8
  %48 = getelementptr inbounds %struct.dllist, ptr %47, i32 0, i32 1
  store ptr %46, ptr %48, align 8
  %49 = load ptr, ptr %4, align 8
  %50 = getelementptr inbounds %struct.dllist, ptr %49, i32 0, i32 1
  %51 = load ptr, ptr %50, align 8
  %52 = icmp ne ptr %51, null
  br i1 %52, label %53, label %59

53:                                               ; preds = %37
  %54 = load ptr, ptr %4, align 8
  %55 = load ptr, ptr %4, align 8
  %56 = getelementptr inbounds %struct.dllist, ptr %55, i32 0, i32 1
  %57 = load ptr, ptr %56, align 8
  %58 = getelementptr inbounds %struct.dllist, ptr %57, i32 0, i32 2
  store ptr %54, ptr %58, align 8
  br label %59

59:                                               ; preds = %53, %37
  br label %60

60:                                               ; preds = %59, %31
  br label %61

61:                                               ; preds = %60, %12
  br label %62

62:                                               ; preds = %61, %9
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_dllist_delete(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %5, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = icmp eq ptr %8, %9
  br i1 %10, label %11, label %25

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds %struct.dllist, ptr %12, i32 0, i32 2
  %14 = load ptr, ptr %13, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %20

16:                                               ; preds = %11
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.dllist, ptr %17, i32 0, i32 2
  %19 = load ptr, ptr %18, align 8
  store ptr %19, ptr %5, align 8
  br label %24

20:                                               ; preds = %11
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds %struct.dllist, ptr %21, i32 0, i32 1
  %23 = load ptr, ptr %22, align 8
  store ptr %23, ptr %5, align 8
  br label %24

24:                                               ; preds = %20, %16
  br label %25

25:                                               ; preds = %24, %2
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.dllist, ptr %26, i32 0, i32 1
  %28 = load ptr, ptr %27, align 8
  %29 = icmp ne ptr %28, null
  br i1 %29, label %30, label %38

30:                                               ; preds = %25
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds %struct.dllist, ptr %31, i32 0, i32 2
  %33 = load ptr, ptr %32, align 8
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds %struct.dllist, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  %37 = getelementptr inbounds %struct.dllist, ptr %36, i32 0, i32 2
  store ptr %33, ptr %37, align 8
  br label %38

38:                                               ; preds = %30, %25
  %39 = load ptr, ptr %4, align 8
  %40 = getelementptr inbounds %struct.dllist, ptr %39, i32 0, i32 2
  %41 = load ptr, ptr %40, align 8
  %42 = icmp ne ptr %41, null
  br i1 %42, label %43, label %51

43:                                               ; preds = %38
  %44 = load ptr, ptr %4, align 8
  %45 = getelementptr inbounds %struct.dllist, ptr %44, i32 0, i32 1
  %46 = load ptr, ptr %45, align 8
  %47 = load ptr, ptr %4, align 8
  %48 = getelementptr inbounds %struct.dllist, ptr %47, i32 0, i32 2
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr inbounds %struct.dllist, ptr %49, i32 0, i32 1
  store ptr %46, ptr %50, align 8
  br label %51

51:                                               ; preds = %43, %38
  %52 = load ptr, ptr %5, align 8
  %53 = load ptr, ptr %3, align 8
  store ptr %52, ptr %53, align 8
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_dllist_delete_if_member(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %7, align 8
  br label %11

11:                                               ; preds = %26, %3
  %12 = load ptr, ptr %7, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %23

14:                                               ; preds = %11
  %15 = load ptr, ptr %7, align 8
  %16 = getelementptr inbounds %struct.dllist, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds %struct.dllist, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = sub nsw i32 %17, %20
  %22 = icmp ne i32 %21, 0
  br label %23

23:                                               ; preds = %14, %11
  %24 = phi i1 [ false, %11 ], [ %22, %14 ]
  br i1 %24, label %25, label %30

25:                                               ; preds = %23
  br label %26

26:                                               ; preds = %25
  %27 = load ptr, ptr %7, align 8
  %28 = getelementptr inbounds %struct.dllist, ptr %27, i32 0, i32 2
  %29 = load ptr, ptr %28, align 8
  store ptr %29, ptr %7, align 8
  br label %11, !llvm.loop !15

30:                                               ; preds = %23
  %31 = load ptr, ptr %7, align 8
  %32 = icmp eq ptr %31, null
  br i1 %32, label %33, label %62

33:                                               ; preds = %30
  %34 = load ptr, ptr %4, align 8
  %35 = load ptr, ptr %34, align 8
  %36 = icmp ne ptr %35, null
  br i1 %36, label %37, label %62

37:                                               ; preds = %33
  %38 = load ptr, ptr %4, align 8
  %39 = load ptr, ptr %38, align 8
  %40 = getelementptr inbounds %struct.dllist, ptr %39, i32 0, i32 1
  %41 = load ptr, ptr %40, align 8
  store ptr %41, ptr %7, align 8
  br label %42

42:                                               ; preds = %57, %37
  %43 = load ptr, ptr %7, align 8
  %44 = icmp ne ptr %43, null
  br i1 %44, label %45, label %54

45:                                               ; preds = %42
  %46 = load ptr, ptr %7, align 8
  %47 = getelementptr inbounds %struct.dllist, ptr %46, i32 0, i32 0
  %48 = load i32, ptr %47, align 8
  %49 = load ptr, ptr %5, align 8
  %50 = getelementptr inbounds %struct.dllist, ptr %49, i32 0, i32 0
  %51 = load i32, ptr %50, align 8
  %52 = sub nsw i32 %48, %51
  %53 = icmp ne i32 %52, 0
  br label %54

54:                                               ; preds = %45, %42
  %55 = phi i1 [ false, %42 ], [ %53, %45 ]
  br i1 %55, label %56, label %61

56:                                               ; preds = %54
  br label %57

57:                                               ; preds = %56
  %58 = load ptr, ptr %7, align 8
  %59 = getelementptr inbounds %struct.dllist, ptr %58, i32 0, i32 1
  %60 = load ptr, ptr %59, align 8
  store ptr %60, ptr %7, align 8
  br label %42, !llvm.loop !16

61:                                               ; preds = %54
  br label %62

62:                                               ; preds = %61, %33, %30
  %63 = load ptr, ptr %7, align 8
  %64 = load ptr, ptr %6, align 8
  store ptr %63, ptr %64, align 8
  %65 = load ptr, ptr %7, align 8
  %66 = icmp ne ptr %65, null
  br i1 %66, label %67, label %116

67:                                               ; preds = %62
  %68 = load ptr, ptr %4, align 8
  %69 = load ptr, ptr %68, align 8
  store ptr %69, ptr %8, align 8
  %70 = load ptr, ptr %8, align 8
  %71 = load ptr, ptr %7, align 8
  %72 = icmp eq ptr %70, %71
  br i1 %72, label %73, label %87

73:                                               ; preds = %67
  %74 = load ptr, ptr %7, align 8
  %75 = getelementptr inbounds %struct.dllist, ptr %74, i32 0, i32 2
  %76 = load ptr, ptr %75, align 8
  %77 = icmp ne ptr %76, null
  br i1 %77, label %78, label %82

78:                                               ; preds = %73
  %79 = load ptr, ptr %7, align 8
  %80 = getelementptr inbounds %struct.dllist, ptr %79, i32 0, i32 2
  %81 = load ptr, ptr %80, align 8
  store ptr %81, ptr %8, align 8
  br label %86

82:                                               ; preds = %73
  %83 = load ptr, ptr %7, align 8
  %84 = getelementptr inbounds %struct.dllist, ptr %83, i32 0, i32 1
  %85 = load ptr, ptr %84, align 8
  store ptr %85, ptr %8, align 8
  br label %86

86:                                               ; preds = %82, %78
  br label %87

87:                                               ; preds = %86, %67
  %88 = load ptr, ptr %7, align 8
  %89 = getelementptr inbounds %struct.dllist, ptr %88, i32 0, i32 1
  %90 = load ptr, ptr %89, align 8
  %91 = icmp ne ptr %90, null
  br i1 %91, label %92, label %100

92:                                               ; preds = %87
  %93 = load ptr, ptr %7, align 8
  %94 = getelementptr inbounds %struct.dllist, ptr %93, i32 0, i32 2
  %95 = load ptr, ptr %94, align 8
  %96 = load ptr, ptr %7, align 8
  %97 = getelementptr inbounds %struct.dllist, ptr %96, i32 0, i32 1
  %98 = load ptr, ptr %97, align 8
  %99 = getelementptr inbounds %struct.dllist, ptr %98, i32 0, i32 2
  store ptr %95, ptr %99, align 8
  br label %100

100:                                              ; preds = %92, %87
  %101 = load ptr, ptr %7, align 8
  %102 = getelementptr inbounds %struct.dllist, ptr %101, i32 0, i32 2
  %103 = load ptr, ptr %102, align 8
  %104 = icmp ne ptr %103, null
  br i1 %104, label %105, label %113

105:                                              ; preds = %100
  %106 = load ptr, ptr %7, align 8
  %107 = getelementptr inbounds %struct.dllist, ptr %106, i32 0, i32 1
  %108 = load ptr, ptr %107, align 8
  %109 = load ptr, ptr %7, align 8
  %110 = getelementptr inbounds %struct.dllist, ptr %109, i32 0, i32 2
  %111 = load ptr, ptr %110, align 8
  %112 = getelementptr inbounds %struct.dllist, ptr %111, i32 0, i32 1
  store ptr %108, ptr %112, align 8
  br label %113

113:                                              ; preds = %105, %100
  %114 = load ptr, ptr %8, align 8
  %115 = load ptr, ptr %4, align 8
  store ptr %114, ptr %115, align 8
  br label %116

116:                                              ; preds = %113, %62
  %117 = load ptr, ptr %6, align 8
  %118 = load ptr, ptr %117, align 8
  %119 = icmp ne ptr %118, null
  %120 = zext i1 %119 to i32
  ret i32 %120
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_dllist_is_member(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %9 = load ptr, ptr %3, align 8
  store ptr %9, ptr %7, align 8
  br label %10

10:                                               ; preds = %20, %2
  %11 = load ptr, ptr %7, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %17

13:                                               ; preds = %10
  %14 = load ptr, ptr %7, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = icmp ne ptr %14, %15
  br label %17

17:                                               ; preds = %13, %10
  %18 = phi i1 [ false, %10 ], [ %16, %13 ]
  br i1 %18, label %19, label %24

19:                                               ; preds = %17
  br label %20

20:                                               ; preds = %19
  %21 = load ptr, ptr %7, align 8
  %22 = getelementptr inbounds %struct.dllist, ptr %21, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  store ptr %23, ptr %7, align 8
  br label %10, !llvm.loop !17

24:                                               ; preds = %17
  %25 = load ptr, ptr %7, align 8
  %26 = icmp ne ptr %25, null
  %27 = zext i1 %26 to i32
  store i32 %27, ptr %5, align 4
  %28 = load i32, ptr %5, align 4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %56

30:                                               ; preds = %24
  %31 = load ptr, ptr %3, align 8
  %32 = icmp ne ptr %31, null
  br i1 %32, label %33, label %56

33:                                               ; preds = %30
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds %struct.dllist, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  store ptr %36, ptr %6, align 8
  %37 = load ptr, ptr %6, align 8
  store ptr %37, ptr %8, align 8
  br label %38

38:                                               ; preds = %48, %33
  %39 = load ptr, ptr %8, align 8
  %40 = icmp ne ptr %39, null
  br i1 %40, label %41, label %45

41:                                               ; preds = %38
  %42 = load ptr, ptr %8, align 8
  %43 = load ptr, ptr %4, align 8
  %44 = icmp ne ptr %42, %43
  br label %45

45:                                               ; preds = %41, %38
  %46 = phi i1 [ false, %38 ], [ %44, %41 ]
  br i1 %46, label %47, label %52

47:                                               ; preds = %45
  br label %48

48:                                               ; preds = %47
  %49 = load ptr, ptr %8, align 8
  %50 = getelementptr inbounds %struct.dllist, ptr %49, i32 0, i32 1
  %51 = load ptr, ptr %50, align 8
  store ptr %51, ptr %8, align 8
  br label %38, !llvm.loop !18

52:                                               ; preds = %45
  %53 = load ptr, ptr %8, align 8
  %54 = icmp ne ptr %53, null
  %55 = zext i1 %54 to i32
  store i32 %55, ptr %5, align 4
  br label %56

56:                                               ; preds = %52, %30, %24
  %57 = load i32, ptr %5, align 4
  ret i32 %57
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_dllist_find_member(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %9 = load ptr, ptr %3, align 8
  store ptr %9, ptr %7, align 8
  br label %10

10:                                               ; preds = %25, %2
  %11 = load ptr, ptr %7, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %22

13:                                               ; preds = %10
  %14 = load ptr, ptr %7, align 8
  %15 = getelementptr inbounds %struct.dllist, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.dllist, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %18, align 8
  %20 = sub nsw i32 %16, %19
  %21 = icmp ne i32 %20, 0
  br label %22

22:                                               ; preds = %13, %10
  %23 = phi i1 [ false, %10 ], [ %21, %13 ]
  br i1 %23, label %24, label %29

24:                                               ; preds = %22
  br label %25

25:                                               ; preds = %24
  %26 = load ptr, ptr %7, align 8
  %27 = getelementptr inbounds %struct.dllist, ptr %26, i32 0, i32 2
  %28 = load ptr, ptr %27, align 8
  store ptr %28, ptr %7, align 8
  br label %10, !llvm.loop !19

29:                                               ; preds = %22
  %30 = load ptr, ptr %7, align 8
  store ptr %30, ptr %5, align 8
  %31 = load ptr, ptr %5, align 8
  %32 = icmp eq ptr %31, null
  br i1 %32, label %33, label %62

33:                                               ; preds = %29
  %34 = load ptr, ptr %3, align 8
  %35 = icmp ne ptr %34, null
  br i1 %35, label %36, label %62

36:                                               ; preds = %33
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds %struct.dllist, ptr %37, i32 0, i32 1
  %39 = load ptr, ptr %38, align 8
  store ptr %39, ptr %6, align 8
  %40 = load ptr, ptr %6, align 8
  store ptr %40, ptr %8, align 8
  br label %41

41:                                               ; preds = %56, %36
  %42 = load ptr, ptr %8, align 8
  %43 = icmp ne ptr %42, null
  br i1 %43, label %44, label %53

44:                                               ; preds = %41
  %45 = load ptr, ptr %8, align 8
  %46 = getelementptr inbounds %struct.dllist, ptr %45, i32 0, i32 0
  %47 = load i32, ptr %46, align 8
  %48 = load ptr, ptr %4, align 8
  %49 = getelementptr inbounds %struct.dllist, ptr %48, i32 0, i32 0
  %50 = load i32, ptr %49, align 8
  %51 = sub nsw i32 %47, %50
  %52 = icmp ne i32 %51, 0
  br label %53

53:                                               ; preds = %44, %41
  %54 = phi i1 [ false, %41 ], [ %52, %44 ]
  br i1 %54, label %55, label %60

55:                                               ; preds = %53
  br label %56

56:                                               ; preds = %55
  %57 = load ptr, ptr %8, align 8
  %58 = getelementptr inbounds %struct.dllist, ptr %57, i32 0, i32 1
  %59 = load ptr, ptr %58, align 8
  store ptr %59, ptr %8, align 8
  br label %41, !llvm.loop !20

60:                                               ; preds = %53
  %61 = load ptr, ptr %8, align 8
  store ptr %61, ptr %5, align 8
  br label %62

62:                                               ; preds = %60, %33, %29
  %63 = load ptr, ptr %5, align 8
  ret ptr %63
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_dllist_get_first(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  store ptr %5, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %20

8:                                                ; preds = %1
  br label %9

9:                                                ; preds = %15, %8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.dllist, ptr %10, i32 0, i32 2
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %19

14:                                               ; preds = %9
  br label %15

15:                                               ; preds = %14
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.dllist, ptr %16, i32 0, i32 2
  %18 = load ptr, ptr %17, align 8
  store ptr %18, ptr %4, align 8
  br label %9, !llvm.loop !21

19:                                               ; preds = %9
  br label %20

20:                                               ; preds = %19, %1
  %21 = load ptr, ptr %4, align 8
  store ptr %21, ptr %3, align 8
  %22 = load ptr, ptr %3, align 8
  ret ptr %22
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_dllist_get_last(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  store ptr %5, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %20

8:                                                ; preds = %1
  br label %9

9:                                                ; preds = %15, %8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.dllist, ptr %10, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %19

14:                                               ; preds = %9
  br label %15

15:                                               ; preds = %14
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.dllist, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  store ptr %18, ptr %4, align 8
  br label %9, !llvm.loop !22

19:                                               ; preds = %9
  br label %20

20:                                               ; preds = %19, %1
  %21 = load ptr, ptr %4, align 8
  store ptr %21, ptr %3, align 8
  %22 = load ptr, ptr %3, align 8
  ret ptr %22
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_dllist_sort(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %17 = load ptr, ptr %2, align 8
  %18 = load ptr, ptr %17, align 8
  store ptr %18, ptr %3, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %177

21:                                               ; preds = %1
  br label %22

22:                                               ; preds = %28, %21
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.dllist, ptr %23, i32 0, i32 2
  %25 = load ptr, ptr %24, align 8
  %26 = icmp ne ptr %25, null
  br i1 %26, label %27, label %32

27:                                               ; preds = %22
  br label %28

28:                                               ; preds = %27
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.dllist, ptr %29, i32 0, i32 2
  %31 = load ptr, ptr %30, align 8
  store ptr %31, ptr %3, align 8
  br label %22, !llvm.loop !23

32:                                               ; preds = %22
  %33 = load ptr, ptr %3, align 8
  store ptr %33, ptr %6, align 8
  store i32 1, ptr %14, align 4
  store i32 1, ptr %13, align 4
  br label %34

34:                                               ; preds = %155, %32
  %35 = load i32, ptr %14, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %159

37:                                               ; preds = %34
  %38 = load ptr, ptr %6, align 8
  store ptr %38, ptr %9, align 8
  store ptr null, ptr %6, align 8
  store ptr %6, ptr %11, align 8
  store i32 0, ptr %14, align 4
  br label %39

39:                                               ; preds = %153, %37
  %40 = load ptr, ptr %9, align 8
  %41 = icmp ne ptr %40, null
  br i1 %41, label %42, label %154

42:                                               ; preds = %39
  %43 = load ptr, ptr %9, align 8
  store ptr %43, ptr %7, align 8
  store i32 1, ptr %12, align 4
  %44 = load ptr, ptr %7, align 8
  store ptr %44, ptr %10, align 8
  br label %45

45:                                               ; preds = %55, %42
  %46 = load i32, ptr %12, align 4
  %47 = load i32, ptr %13, align 4
  %48 = icmp slt i32 %46, %47
  br i1 %48, label %49, label %52

49:                                               ; preds = %45
  %50 = load ptr, ptr %10, align 8
  %51 = icmp ne ptr %50, null
  br label %52

52:                                               ; preds = %49, %45
  %53 = phi i1 [ false, %45 ], [ %51, %49 ]
  br i1 %53, label %54, label %61

54:                                               ; preds = %52
  br label %55

55:                                               ; preds = %54
  %56 = load i32, ptr %12, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, ptr %12, align 4
  %58 = load ptr, ptr %10, align 8
  %59 = getelementptr inbounds %struct.dllist, ptr %58, i32 0, i32 1
  %60 = load ptr, ptr %59, align 8
  store ptr %60, ptr %10, align 8
  br label %45, !llvm.loop !24

61:                                               ; preds = %52
  %62 = load ptr, ptr %10, align 8
  %63 = icmp eq ptr %62, null
  br i1 %63, label %64, label %67

64:                                               ; preds = %61
  %65 = load ptr, ptr %7, align 8
  %66 = load ptr, ptr %11, align 8
  store ptr %65, ptr %66, align 8
  br label %154

67:                                               ; preds = %61
  %68 = load ptr, ptr %10, align 8
  %69 = getelementptr inbounds %struct.dllist, ptr %68, i32 0, i32 1
  %70 = load ptr, ptr %69, align 8
  store ptr %70, ptr %8, align 8
  %71 = load ptr, ptr %10, align 8
  %72 = getelementptr inbounds %struct.dllist, ptr %71, i32 0, i32 1
  store ptr null, ptr %72, align 8
  store i32 1, ptr %12, align 4
  %73 = load ptr, ptr %8, align 8
  store ptr %73, ptr %10, align 8
  br label %74

74:                                               ; preds = %84, %67
  %75 = load i32, ptr %12, align 4
  %76 = load i32, ptr %13, align 4
  %77 = icmp slt i32 %75, %76
  br i1 %77, label %78, label %81

78:                                               ; preds = %74
  %79 = load ptr, ptr %10, align 8
  %80 = icmp ne ptr %79, null
  br label %81

81:                                               ; preds = %78, %74
  %82 = phi i1 [ false, %74 ], [ %80, %78 ]
  br i1 %82, label %83, label %90

83:                                               ; preds = %81
  br label %84

84:                                               ; preds = %83
  %85 = load i32, ptr %12, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr %12, align 4
  %87 = load ptr, ptr %10, align 8
  %88 = getelementptr inbounds %struct.dllist, ptr %87, i32 0, i32 1
  %89 = load ptr, ptr %88, align 8
  store ptr %89, ptr %10, align 8
  br label %74, !llvm.loop !25

90:                                               ; preds = %81
  %91 = load ptr, ptr %10, align 8
  %92 = icmp eq ptr %91, null
  br i1 %92, label %93, label %94

93:                                               ; preds = %90
  store ptr null, ptr %9, align 8
  br label %100

94:                                               ; preds = %90
  %95 = load ptr, ptr %10, align 8
  %96 = getelementptr inbounds %struct.dllist, ptr %95, i32 0, i32 1
  %97 = load ptr, ptr %96, align 8
  store ptr %97, ptr %9, align 8
  %98 = load ptr, ptr %10, align 8
  %99 = getelementptr inbounds %struct.dllist, ptr %98, i32 0, i32 1
  store ptr null, ptr %99, align 8
  br label %100

100:                                              ; preds = %94, %93
  br label %101

101:                                              ; preds = %134, %100
  %102 = load ptr, ptr %7, align 8
  %103 = icmp ne ptr %102, null
  br i1 %103, label %104, label %107

104:                                              ; preds = %101
  %105 = load ptr, ptr %8, align 8
  %106 = icmp ne ptr %105, null
  br label %107

107:                                              ; preds = %104, %101
  %108 = phi i1 [ false, %101 ], [ %106, %104 ]
  br i1 %108, label %109, label %135

109:                                              ; preds = %107
  %110 = load ptr, ptr %7, align 8
  %111 = getelementptr inbounds %struct.dllist, ptr %110, i32 0, i32 0
  %112 = load i32, ptr %111, align 8
  %113 = load ptr, ptr %8, align 8
  %114 = getelementptr inbounds %struct.dllist, ptr %113, i32 0, i32 0
  %115 = load i32, ptr %114, align 8
  %116 = sub nsw i32 %112, %115
  %117 = icmp slt i32 %116, 0
  br i1 %117, label %118, label %126

118:                                              ; preds = %109
  %119 = load ptr, ptr %7, align 8
  %120 = load ptr, ptr %11, align 8
  store ptr %119, ptr %120, align 8
  %121 = load ptr, ptr %7, align 8
  %122 = getelementptr inbounds %struct.dllist, ptr %121, i32 0, i32 1
  store ptr %122, ptr %11, align 8
  %123 = load ptr, ptr %7, align 8
  %124 = getelementptr inbounds %struct.dllist, ptr %123, i32 0, i32 1
  %125 = load ptr, ptr %124, align 8
  store ptr %125, ptr %7, align 8
  br label %134

126:                                              ; preds = %109
  %127 = load ptr, ptr %8, align 8
  %128 = load ptr, ptr %11, align 8
  store ptr %127, ptr %128, align 8
  %129 = load ptr, ptr %8, align 8
  %130 = getelementptr inbounds %struct.dllist, ptr %129, i32 0, i32 1
  store ptr %130, ptr %11, align 8
  %131 = load ptr, ptr %8, align 8
  %132 = getelementptr inbounds %struct.dllist, ptr %131, i32 0, i32 1
  %133 = load ptr, ptr %132, align 8
  store ptr %133, ptr %8, align 8
  br label %134

134:                                              ; preds = %126, %118
  br label %101, !llvm.loop !26

135:                                              ; preds = %107
  %136 = load ptr, ptr %7, align 8
  %137 = icmp ne ptr %136, null
  br i1 %137, label %138, label %141

138:                                              ; preds = %135
  %139 = load ptr, ptr %7, align 8
  %140 = load ptr, ptr %11, align 8
  store ptr %139, ptr %140, align 8
  br label %144

141:                                              ; preds = %135
  %142 = load ptr, ptr %8, align 8
  %143 = load ptr, ptr %11, align 8
  store ptr %142, ptr %143, align 8
  br label %144

144:                                              ; preds = %141, %138
  br label %145

145:                                              ; preds = %149, %144
  %146 = load ptr, ptr %11, align 8
  %147 = load ptr, ptr %146, align 8
  %148 = icmp ne ptr %147, null
  br i1 %148, label %149, label %153

149:                                              ; preds = %145
  %150 = load ptr, ptr %11, align 8
  %151 = load ptr, ptr %150, align 8
  %152 = getelementptr inbounds %struct.dllist, ptr %151, i32 0, i32 1
  store ptr %152, ptr %11, align 8
  br label %145, !llvm.loop !27

153:                                              ; preds = %145
  store i32 1, ptr %14, align 4
  br label %39, !llvm.loop !28

154:                                              ; preds = %64, %39
  br label %155

155:                                              ; preds = %154
  %156 = load i32, ptr %13, align 4
  %157 = load i32, ptr %13, align 4
  %158 = add nsw i32 %156, %157
  store i32 %158, ptr %13, align 4
  br label %34, !llvm.loop !29

159:                                              ; preds = %34
  %160 = load ptr, ptr %6, align 8
  store ptr %160, ptr %3, align 8
  store ptr null, ptr %15, align 8
  %161 = load ptr, ptr %3, align 8
  store ptr %161, ptr %16, align 8
  br label %162

162:                                              ; preds = %170, %159
  %163 = load ptr, ptr %16, align 8
  %164 = icmp ne ptr %163, null
  br i1 %164, label %165, label %174

165:                                              ; preds = %162
  %166 = load ptr, ptr %15, align 8
  %167 = load ptr, ptr %16, align 8
  %168 = getelementptr inbounds %struct.dllist, ptr %167, i32 0, i32 2
  store ptr %166, ptr %168, align 8
  %169 = load ptr, ptr %16, align 8
  store ptr %169, ptr %15, align 8
  br label %170

170:                                              ; preds = %165
  %171 = load ptr, ptr %16, align 8
  %172 = getelementptr inbounds %struct.dllist, ptr %171, i32 0, i32 1
  %173 = load ptr, ptr %172, align 8
  store ptr %173, ptr %16, align 8
  br label %162, !llvm.loop !30

174:                                              ; preds = %162
  %175 = load ptr, ptr %3, align 8
  %176 = load ptr, ptr %2, align 8
  store ptr %175, ptr %176, align 8
  br label %177

177:                                              ; preds = %174, %1
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_dllist_len(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %1
  store i32 0, ptr %3, align 4
  br label %47

16:                                               ; preds = %1
  store i32 0, ptr %5, align 4
  %17 = load ptr, ptr %2, align 8
  store ptr %17, ptr %9, align 8
  br label %18

18:                                               ; preds = %21, %16
  %19 = load ptr, ptr %9, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %28

21:                                               ; preds = %18
  %22 = load ptr, ptr %9, align 8
  %23 = getelementptr inbounds %struct.dllist, ptr %22, i32 0, i32 2
  %24 = load ptr, ptr %23, align 8
  store ptr %24, ptr %8, align 8
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %5, align 4
  %27 = load ptr, ptr %8, align 8
  store ptr %27, ptr %9, align 8
  br label %18, !llvm.loop !31

28:                                               ; preds = %18
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds %struct.dllist, ptr %29, i32 0, i32 1
  %31 = load ptr, ptr %30, align 8
  store ptr %31, ptr %4, align 8
  store i32 0, ptr %6, align 4
  %32 = load ptr, ptr %4, align 8
  store ptr %32, ptr %12, align 8
  br label %33

33:                                               ; preds = %36, %28
  %34 = load ptr, ptr %12, align 8
  %35 = icmp ne ptr %34, null
  br i1 %35, label %36, label %43

36:                                               ; preds = %33
  %37 = load ptr, ptr %12, align 8
  %38 = getelementptr inbounds %struct.dllist, ptr %37, i32 0, i32 1
  %39 = load ptr, ptr %38, align 8
  store ptr %39, ptr %11, align 8
  %40 = load i32, ptr %6, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %6, align 4
  %42 = load ptr, ptr %11, align 8
  store ptr %42, ptr %12, align 8
  br label %33, !llvm.loop !32

43:                                               ; preds = %33
  %44 = load i32, ptr %5, align 4
  %45 = load i32, ptr %6, align 4
  %46 = add nsw i32 %44, %45
  store i32 %46, ptr %3, align 4
  br label %47

47:                                               ; preds = %43, %15
  %48 = load i32, ptr %3, align 4
  ret i32 %48
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_dllist_reverse(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %51

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.dllist, ptr %12, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %4, align 8
  br label %15

15:                                               ; preds = %18, %11
  %16 = load ptr, ptr %3, align 8
  %17 = icmp ne ptr %16, null
  br i1 %17, label %18, label %32

18:                                               ; preds = %15
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds %struct.dllist, ptr %19, i32 0, i32 1
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %6, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.dllist, ptr %22, i32 0, i32 2
  %24 = load ptr, ptr %23, align 8
  store ptr %24, ptr %5, align 8
  %25 = load ptr, ptr %5, align 8
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds %struct.dllist, ptr %26, i32 0, i32 1
  store ptr %25, ptr %27, align 8
  %28 = load ptr, ptr %6, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.dllist, ptr %29, i32 0, i32 2
  store ptr %28, ptr %30, align 8
  %31 = load ptr, ptr %5, align 8
  store ptr %31, ptr %3, align 8
  br label %15, !llvm.loop !33

32:                                               ; preds = %15
  br label %33

33:                                               ; preds = %36, %32
  %34 = load ptr, ptr %4, align 8
  %35 = icmp ne ptr %34, null
  br i1 %35, label %36, label %50

36:                                               ; preds = %33
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds %struct.dllist, ptr %37, i32 0, i32 1
  %39 = load ptr, ptr %38, align 8
  store ptr %39, ptr %6, align 8
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds %struct.dllist, ptr %40, i32 0, i32 2
  %42 = load ptr, ptr %41, align 8
  store ptr %42, ptr %5, align 8
  %43 = load ptr, ptr %5, align 8
  %44 = load ptr, ptr %4, align 8
  %45 = getelementptr inbounds %struct.dllist, ptr %44, i32 0, i32 1
  store ptr %43, ptr %45, align 8
  %46 = load ptr, ptr %6, align 8
  %47 = load ptr, ptr %4, align 8
  %48 = getelementptr inbounds %struct.dllist, ptr %47, i32 0, i32 2
  store ptr %46, ptr %48, align 8
  %49 = load ptr, ptr %6, align 8
  store ptr %49, ptr %4, align 8
  br label %33, !llvm.loop !34

50:                                               ; preds = %33
  br label %51

51:                                               ; preds = %50, %1
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_dllist_it_init_on_equal(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = load ptr, ptr %7, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %10, i32 0, i32 3
  store ptr %9, ptr %11, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %13, i32 0, i32 4
  store ptr %12, ptr %14, align 8
  %15 = load ptr, ptr %6, align 8
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %16, i32 0, i32 1
  store ptr %15, ptr %17, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %19, i32 0, i32 2
  store ptr %18, ptr %20, align 8
  %21 = load ptr, ptr %6, align 8
  %22 = icmp ne ptr %21, null
  br i1 %22, label %23, label %29

23:                                               ; preds = %4
  %24 = load ptr, ptr %6, align 8
  %25 = getelementptr inbounds %struct.dllist, ptr %24, i32 0, i32 1
  %26 = load ptr, ptr %25, align 8
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %27, i32 0, i32 2
  store ptr %26, ptr %28, align 8
  br label %29

29:                                               ; preds = %23, %4
  %30 = load ptr, ptr %5, align 8
  %31 = call ptr @sglib_dllist_it_next(ptr noundef %30)
  ret ptr %31
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_dllist_it_next(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %6, i32 0, i32 1
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %9, i32 0, i32 1
  store ptr null, ptr %10, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %11, i32 0, i32 3
  %13 = load ptr, ptr %12, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %38

15:                                               ; preds = %1
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %16, i32 0, i32 4
  %18 = load ptr, ptr %17, align 8
  store ptr %18, ptr %4, align 8
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %19, i32 0, i32 3
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %5, align 8
  br label %22

22:                                               ; preds = %33, %15
  %23 = load ptr, ptr %3, align 8
  %24 = icmp ne ptr %23, null
  br i1 %24, label %25, label %31

25:                                               ; preds = %22
  %26 = load ptr, ptr %5, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = load ptr, ptr %3, align 8
  %29 = call i32 %26(ptr noundef %27, ptr noundef %28)
  %30 = icmp ne i32 %29, 0
  br label %31

31:                                               ; preds = %25, %22
  %32 = phi i1 [ false, %22 ], [ %30, %25 ]
  br i1 %32, label %33, label %37

33:                                               ; preds = %31
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds %struct.dllist, ptr %34, i32 0, i32 2
  %36 = load ptr, ptr %35, align 8
  store ptr %36, ptr %3, align 8
  br label %22, !llvm.loop !35

37:                                               ; preds = %31
  br label %38

38:                                               ; preds = %37, %1
  %39 = load ptr, ptr %3, align 8
  %40 = icmp ne ptr %39, null
  br i1 %40, label %41, label %47

41:                                               ; preds = %38
  %42 = load ptr, ptr %3, align 8
  %43 = getelementptr inbounds %struct.dllist, ptr %42, i32 0, i32 2
  %44 = load ptr, ptr %43, align 8
  %45 = load ptr, ptr %2, align 8
  %46 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %45, i32 0, i32 1
  store ptr %44, ptr %46, align 8
  br label %90

47:                                               ; preds = %38
  %48 = load ptr, ptr %2, align 8
  %49 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %48, i32 0, i32 2
  %50 = load ptr, ptr %49, align 8
  store ptr %50, ptr %3, align 8
  %51 = load ptr, ptr %2, align 8
  %52 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %51, i32 0, i32 2
  store ptr null, ptr %52, align 8
  %53 = load ptr, ptr %2, align 8
  %54 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %53, i32 0, i32 3
  %55 = load ptr, ptr %54, align 8
  %56 = icmp ne ptr %55, null
  br i1 %56, label %57, label %80

57:                                               ; preds = %47
  %58 = load ptr, ptr %2, align 8
  %59 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %58, i32 0, i32 4
  %60 = load ptr, ptr %59, align 8
  store ptr %60, ptr %4, align 8
  %61 = load ptr, ptr %2, align 8
  %62 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %61, i32 0, i32 3
  %63 = load ptr, ptr %62, align 8
  store ptr %63, ptr %5, align 8
  br label %64

64:                                               ; preds = %75, %57
  %65 = load ptr, ptr %3, align 8
  %66 = icmp ne ptr %65, null
  br i1 %66, label %67, label %73

67:                                               ; preds = %64
  %68 = load ptr, ptr %5, align 8
  %69 = load ptr, ptr %3, align 8
  %70 = load ptr, ptr %4, align 8
  %71 = call i32 %68(ptr noundef %69, ptr noundef %70)
  %72 = icmp ne i32 %71, 0
  br label %73

73:                                               ; preds = %67, %64
  %74 = phi i1 [ false, %64 ], [ %72, %67 ]
  br i1 %74, label %75, label %79

75:                                               ; preds = %73
  %76 = load ptr, ptr %3, align 8
  %77 = getelementptr inbounds %struct.dllist, ptr %76, i32 0, i32 1
  %78 = load ptr, ptr %77, align 8
  store ptr %78, ptr %3, align 8
  br label %64, !llvm.loop !36

79:                                               ; preds = %73
  br label %80

80:                                               ; preds = %79, %47
  %81 = load ptr, ptr %3, align 8
  %82 = icmp ne ptr %81, null
  br i1 %82, label %83, label %89

83:                                               ; preds = %80
  %84 = load ptr, ptr %3, align 8
  %85 = getelementptr inbounds %struct.dllist, ptr %84, i32 0, i32 1
  %86 = load ptr, ptr %85, align 8
  %87 = load ptr, ptr %2, align 8
  %88 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %87, i32 0, i32 2
  store ptr %86, ptr %88, align 8
  br label %89

89:                                               ; preds = %83, %80
  br label %90

90:                                               ; preds = %89, %41
  %91 = load ptr, ptr %3, align 8
  %92 = load ptr, ptr %2, align 8
  %93 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %92, i32 0, i32 0
  store ptr %91, ptr %93, align 8
  %94 = load ptr, ptr %3, align 8
  ret ptr %94
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_dllist_it_init(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @sglib_dllist_it_init_on_equal(ptr noundef %5, ptr noundef %6, ptr noundef null, ptr noundef null)
  ret ptr %7
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_dllist_it_current(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.sglib_dllist_iterator, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @ilist_hash_function(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.ilist, ptr %3, i32 0, i32 0
  %5 = load i32, ptr %4, align 8
  ret i32 %5
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_ilist_is_member(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  store ptr %7, ptr %6, align 8
  br label %8

8:                                                ; preds = %18, %2
  %9 = load ptr, ptr %6, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %15

11:                                               ; preds = %8
  %12 = load ptr, ptr %6, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = icmp ne ptr %12, %13
  br label %15

15:                                               ; preds = %11, %8
  %16 = phi i1 [ false, %8 ], [ %14, %11 ]
  br i1 %16, label %17, label %22

17:                                               ; preds = %15
  br label %18

18:                                               ; preds = %17
  %19 = load ptr, ptr %6, align 8
  %20 = getelementptr inbounds %struct.ilist, ptr %19, i32 0, i32 1
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %6, align 8
  br label %8, !llvm.loop !37

22:                                               ; preds = %15
  %23 = load ptr, ptr %6, align 8
  %24 = icmp ne ptr %23, null
  %25 = zext i1 %24 to i32
  store i32 %25, ptr %5, align 4
  %26 = load i32, ptr %5, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_ilist_find_member(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  store ptr %7, ptr %6, align 8
  br label %8

8:                                                ; preds = %23, %2
  %9 = load ptr, ptr %6, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %20

11:                                               ; preds = %8
  %12 = load ptr, ptr %6, align 8
  %13 = getelementptr inbounds %struct.ilist, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %13, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.ilist, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = sub nsw i32 %14, %17
  %19 = icmp ne i32 %18, 0
  br label %20

20:                                               ; preds = %11, %8
  %21 = phi i1 [ false, %8 ], [ %19, %11 ]
  br i1 %21, label %22, label %27

22:                                               ; preds = %20
  br label %23

23:                                               ; preds = %22
  %24 = load ptr, ptr %6, align 8
  %25 = getelementptr inbounds %struct.ilist, ptr %24, i32 0, i32 1
  %26 = load ptr, ptr %25, align 8
  store ptr %26, ptr %6, align 8
  br label %8, !llvm.loop !38

27:                                               ; preds = %20
  %28 = load ptr, ptr %6, align 8
  store ptr %28, ptr %5, align 8
  %29 = load ptr, ptr %5, align 8
  ret ptr %29
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_ilist_add_if_not_member(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %7, align 8
  br label %10

10:                                               ; preds = %25, %3
  %11 = load ptr, ptr %7, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %22

13:                                               ; preds = %10
  %14 = load ptr, ptr %7, align 8
  %15 = getelementptr inbounds %struct.ilist, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds %struct.ilist, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %18, align 8
  %20 = sub nsw i32 %16, %19
  %21 = icmp ne i32 %20, 0
  br label %22

22:                                               ; preds = %13, %10
  %23 = phi i1 [ false, %10 ], [ %21, %13 ]
  br i1 %23, label %24, label %29

24:                                               ; preds = %22
  br label %25

25:                                               ; preds = %24
  %26 = load ptr, ptr %7, align 8
  %27 = getelementptr inbounds %struct.ilist, ptr %26, i32 0, i32 1
  %28 = load ptr, ptr %27, align 8
  store ptr %28, ptr %7, align 8
  br label %10, !llvm.loop !39

29:                                               ; preds = %22
  %30 = load ptr, ptr %7, align 8
  %31 = load ptr, ptr %6, align 8
  store ptr %30, ptr %31, align 8
  %32 = load ptr, ptr %7, align 8
  %33 = icmp eq ptr %32, null
  br i1 %33, label %34, label %41

34:                                               ; preds = %29
  %35 = load ptr, ptr %4, align 8
  %36 = load ptr, ptr %35, align 8
  %37 = load ptr, ptr %5, align 8
  %38 = getelementptr inbounds %struct.ilist, ptr %37, i32 0, i32 1
  store ptr %36, ptr %38, align 8
  %39 = load ptr, ptr %5, align 8
  %40 = load ptr, ptr %4, align 8
  store ptr %39, ptr %40, align 8
  br label %41

41:                                               ; preds = %34, %29
  %42 = load ptr, ptr %6, align 8
  %43 = load ptr, ptr %42, align 8
  %44 = icmp eq ptr %43, null
  %45 = zext i1 %44 to i32
  ret i32 %45
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_ilist_add(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %struct.ilist, ptr %7, i32 0, i32 1
  store ptr %6, ptr %8, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = load ptr, ptr %3, align 8
  store ptr %9, ptr %10, align 8
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_ilist_concat(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %6, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %12

9:                                                ; preds = %2
  %10 = load ptr, ptr %4, align 8
  %11 = load ptr, ptr %3, align 8
  store ptr %10, ptr %11, align 8
  br label %29

12:                                               ; preds = %2
  %13 = load ptr, ptr %3, align 8
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %5, align 8
  br label %15

15:                                               ; preds = %21, %12
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds %struct.ilist, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %25

20:                                               ; preds = %15
  br label %21

21:                                               ; preds = %20
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds %struct.ilist, ptr %22, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  store ptr %24, ptr %5, align 8
  br label %15, !llvm.loop !40

25:                                               ; preds = %15
  %26 = load ptr, ptr %4, align 8
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds %struct.ilist, ptr %27, i32 0, i32 1
  store ptr %26, ptr %28, align 8
  br label %29

29:                                               ; preds = %25, %9
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_ilist_delete(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  store ptr %6, ptr %5, align 8
  br label %7

7:                                                ; preds = %19, %2
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %16

11:                                               ; preds = %7
  %12 = load ptr, ptr %5, align 8
  %13 = load ptr, ptr %12, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = icmp ne ptr %13, %14
  br label %16

16:                                               ; preds = %11, %7
  %17 = phi i1 [ false, %7 ], [ %15, %11 ]
  br i1 %17, label %18, label %23

18:                                               ; preds = %16
  br label %19

19:                                               ; preds = %18
  %20 = load ptr, ptr %5, align 8
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds %struct.ilist, ptr %21, i32 0, i32 1
  store ptr %22, ptr %5, align 8
  br label %7, !llvm.loop !41

23:                                               ; preds = %16
  %24 = load ptr, ptr %5, align 8
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds %struct.ilist, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  %28 = load ptr, ptr %5, align 8
  store ptr %27, ptr %28, align 8
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_ilist_delete_if_member(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  store ptr %8, ptr %7, align 8
  br label %9

9:                                                ; preds = %26, %3
  %10 = load ptr, ptr %7, align 8
  %11 = load ptr, ptr %10, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %23

13:                                               ; preds = %9
  %14 = load ptr, ptr %7, align 8
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.ilist, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds %struct.ilist, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = sub nsw i32 %17, %20
  %22 = icmp ne i32 %21, 0
  br label %23

23:                                               ; preds = %13, %9
  %24 = phi i1 [ false, %9 ], [ %22, %13 ]
  br i1 %24, label %25, label %30

25:                                               ; preds = %23
  br label %26

26:                                               ; preds = %25
  %27 = load ptr, ptr %7, align 8
  %28 = load ptr, ptr %27, align 8
  %29 = getelementptr inbounds %struct.ilist, ptr %28, i32 0, i32 1
  store ptr %29, ptr %7, align 8
  br label %9, !llvm.loop !42

30:                                               ; preds = %23
  %31 = load ptr, ptr %7, align 8
  %32 = load ptr, ptr %31, align 8
  %33 = load ptr, ptr %6, align 8
  store ptr %32, ptr %33, align 8
  %34 = load ptr, ptr %7, align 8
  %35 = load ptr, ptr %34, align 8
  %36 = icmp ne ptr %35, null
  br i1 %36, label %37, label %43

37:                                               ; preds = %30
  %38 = load ptr, ptr %7, align 8
  %39 = load ptr, ptr %38, align 8
  %40 = getelementptr inbounds %struct.ilist, ptr %39, i32 0, i32 1
  %41 = load ptr, ptr %40, align 8
  %42 = load ptr, ptr %7, align 8
  store ptr %41, ptr %42, align 8
  br label %43

43:                                               ; preds = %37, %30
  %44 = load ptr, ptr %6, align 8
  %45 = load ptr, ptr %44, align 8
  %46 = icmp ne ptr %45, null
  %47 = zext i1 %46 to i32
  ret i32 %47
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_ilist_sort(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %12 = load ptr, ptr %2, align 8
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr %3, align 8
  store i32 1, ptr %11, align 4
  store i32 1, ptr %10, align 4
  br label %14

14:                                               ; preds = %135, %1
  %15 = load i32, ptr %11, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %139

17:                                               ; preds = %14
  %18 = load ptr, ptr %3, align 8
  store ptr %18, ptr %6, align 8
  store ptr null, ptr %3, align 8
  store ptr %3, ptr %8, align 8
  store i32 0, ptr %11, align 4
  br label %19

19:                                               ; preds = %133, %17
  %20 = load ptr, ptr %6, align 8
  %21 = icmp ne ptr %20, null
  br i1 %21, label %22, label %134

22:                                               ; preds = %19
  %23 = load ptr, ptr %6, align 8
  store ptr %23, ptr %4, align 8
  store i32 1, ptr %9, align 4
  %24 = load ptr, ptr %4, align 8
  store ptr %24, ptr %7, align 8
  br label %25

25:                                               ; preds = %35, %22
  %26 = load i32, ptr %9, align 4
  %27 = load i32, ptr %10, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %32

29:                                               ; preds = %25
  %30 = load ptr, ptr %7, align 8
  %31 = icmp ne ptr %30, null
  br label %32

32:                                               ; preds = %29, %25
  %33 = phi i1 [ false, %25 ], [ %31, %29 ]
  br i1 %33, label %34, label %41

34:                                               ; preds = %32
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %9, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %9, align 4
  %38 = load ptr, ptr %7, align 8
  %39 = getelementptr inbounds %struct.ilist, ptr %38, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8
  store ptr %40, ptr %7, align 8
  br label %25, !llvm.loop !43

41:                                               ; preds = %32
  %42 = load ptr, ptr %7, align 8
  %43 = icmp eq ptr %42, null
  br i1 %43, label %44, label %47

44:                                               ; preds = %41
  %45 = load ptr, ptr %4, align 8
  %46 = load ptr, ptr %8, align 8
  store ptr %45, ptr %46, align 8
  br label %134

47:                                               ; preds = %41
  %48 = load ptr, ptr %7, align 8
  %49 = getelementptr inbounds %struct.ilist, ptr %48, i32 0, i32 1
  %50 = load ptr, ptr %49, align 8
  store ptr %50, ptr %5, align 8
  %51 = load ptr, ptr %7, align 8
  %52 = getelementptr inbounds %struct.ilist, ptr %51, i32 0, i32 1
  store ptr null, ptr %52, align 8
  store i32 1, ptr %9, align 4
  %53 = load ptr, ptr %5, align 8
  store ptr %53, ptr %7, align 8
  br label %54

54:                                               ; preds = %64, %47
  %55 = load i32, ptr %9, align 4
  %56 = load i32, ptr %10, align 4
  %57 = icmp slt i32 %55, %56
  br i1 %57, label %58, label %61

58:                                               ; preds = %54
  %59 = load ptr, ptr %7, align 8
  %60 = icmp ne ptr %59, null
  br label %61

61:                                               ; preds = %58, %54
  %62 = phi i1 [ false, %54 ], [ %60, %58 ]
  br i1 %62, label %63, label %70

63:                                               ; preds = %61
  br label %64

64:                                               ; preds = %63
  %65 = load i32, ptr %9, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, ptr %9, align 4
  %67 = load ptr, ptr %7, align 8
  %68 = getelementptr inbounds %struct.ilist, ptr %67, i32 0, i32 1
  %69 = load ptr, ptr %68, align 8
  store ptr %69, ptr %7, align 8
  br label %54, !llvm.loop !44

70:                                               ; preds = %61
  %71 = load ptr, ptr %7, align 8
  %72 = icmp eq ptr %71, null
  br i1 %72, label %73, label %74

73:                                               ; preds = %70
  store ptr null, ptr %6, align 8
  br label %80

74:                                               ; preds = %70
  %75 = load ptr, ptr %7, align 8
  %76 = getelementptr inbounds %struct.ilist, ptr %75, i32 0, i32 1
  %77 = load ptr, ptr %76, align 8
  store ptr %77, ptr %6, align 8
  %78 = load ptr, ptr %7, align 8
  %79 = getelementptr inbounds %struct.ilist, ptr %78, i32 0, i32 1
  store ptr null, ptr %79, align 8
  br label %80

80:                                               ; preds = %74, %73
  br label %81

81:                                               ; preds = %114, %80
  %82 = load ptr, ptr %4, align 8
  %83 = icmp ne ptr %82, null
  br i1 %83, label %84, label %87

84:                                               ; preds = %81
  %85 = load ptr, ptr %5, align 8
  %86 = icmp ne ptr %85, null
  br label %87

87:                                               ; preds = %84, %81
  %88 = phi i1 [ false, %81 ], [ %86, %84 ]
  br i1 %88, label %89, label %115

89:                                               ; preds = %87
  %90 = load ptr, ptr %4, align 8
  %91 = getelementptr inbounds %struct.ilist, ptr %90, i32 0, i32 0
  %92 = load i32, ptr %91, align 8
  %93 = load ptr, ptr %5, align 8
  %94 = getelementptr inbounds %struct.ilist, ptr %93, i32 0, i32 0
  %95 = load i32, ptr %94, align 8
  %96 = sub nsw i32 %92, %95
  %97 = icmp slt i32 %96, 0
  br i1 %97, label %98, label %106

98:                                               ; preds = %89
  %99 = load ptr, ptr %4, align 8
  %100 = load ptr, ptr %8, align 8
  store ptr %99, ptr %100, align 8
  %101 = load ptr, ptr %4, align 8
  %102 = getelementptr inbounds %struct.ilist, ptr %101, i32 0, i32 1
  store ptr %102, ptr %8, align 8
  %103 = load ptr, ptr %4, align 8
  %104 = getelementptr inbounds %struct.ilist, ptr %103, i32 0, i32 1
  %105 = load ptr, ptr %104, align 8
  store ptr %105, ptr %4, align 8
  br label %114

106:                                              ; preds = %89
  %107 = load ptr, ptr %5, align 8
  %108 = load ptr, ptr %8, align 8
  store ptr %107, ptr %108, align 8
  %109 = load ptr, ptr %5, align 8
  %110 = getelementptr inbounds %struct.ilist, ptr %109, i32 0, i32 1
  store ptr %110, ptr %8, align 8
  %111 = load ptr, ptr %5, align 8
  %112 = getelementptr inbounds %struct.ilist, ptr %111, i32 0, i32 1
  %113 = load ptr, ptr %112, align 8
  store ptr %113, ptr %5, align 8
  br label %114

114:                                              ; preds = %106, %98
  br label %81, !llvm.loop !45

115:                                              ; preds = %87
  %116 = load ptr, ptr %4, align 8
  %117 = icmp ne ptr %116, null
  br i1 %117, label %118, label %121

118:                                              ; preds = %115
  %119 = load ptr, ptr %4, align 8
  %120 = load ptr, ptr %8, align 8
  store ptr %119, ptr %120, align 8
  br label %124

121:                                              ; preds = %115
  %122 = load ptr, ptr %5, align 8
  %123 = load ptr, ptr %8, align 8
  store ptr %122, ptr %123, align 8
  br label %124

124:                                              ; preds = %121, %118
  br label %125

125:                                              ; preds = %129, %124
  %126 = load ptr, ptr %8, align 8
  %127 = load ptr, ptr %126, align 8
  %128 = icmp ne ptr %127, null
  br i1 %128, label %129, label %133

129:                                              ; preds = %125
  %130 = load ptr, ptr %8, align 8
  %131 = load ptr, ptr %130, align 8
  %132 = getelementptr inbounds %struct.ilist, ptr %131, i32 0, i32 1
  store ptr %132, ptr %8, align 8
  br label %125, !llvm.loop !46

133:                                              ; preds = %125
  store i32 1, ptr %11, align 4
  br label %19, !llvm.loop !47

134:                                              ; preds = %44, %19
  br label %135

135:                                              ; preds = %134
  %136 = load i32, ptr %10, align 4
  %137 = load i32, ptr %10, align 4
  %138 = add nsw i32 %136, %137
  store i32 %138, ptr %10, align 4
  br label %14, !llvm.loop !48

139:                                              ; preds = %14
  %140 = load ptr, ptr %3, align 8
  %141 = load ptr, ptr %2, align 8
  store ptr %140, ptr %141, align 8
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_ilist_len(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  %7 = load ptr, ptr %2, align 8
  store ptr %7, ptr %6, align 8
  br label %8

8:                                                ; preds = %11, %1
  %9 = load ptr, ptr %6, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %18

11:                                               ; preds = %8
  %12 = load ptr, ptr %6, align 8
  %13 = getelementptr inbounds %struct.ilist, ptr %12, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %5, align 8
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %3, align 4
  %17 = load ptr, ptr %5, align 8
  store ptr %17, ptr %6, align 8
  br label %8, !llvm.loop !49

18:                                               ; preds = %8
  %19 = load i32, ptr %3, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_ilist_reverse(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  store ptr null, ptr %5, align 8
  br label %8

8:                                                ; preds = %11, %1
  %9 = load ptr, ptr %3, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %20

11:                                               ; preds = %8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.ilist, ptr %12, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %4, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.ilist, ptr %16, i32 0, i32 1
  store ptr %15, ptr %17, align 8
  %18 = load ptr, ptr %3, align 8
  store ptr %18, ptr %5, align 8
  %19 = load ptr, ptr %4, align 8
  store ptr %19, ptr %3, align 8
  br label %8, !llvm.loop !50

20:                                               ; preds = %8
  %21 = load ptr, ptr %5, align 8
  %22 = load ptr, ptr %2, align 8
  store ptr %21, ptr %22, align 8
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_ilist_it_init_on_equal(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = load ptr, ptr %7, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds %struct.sglib_ilist_iterator, ptr %10, i32 0, i32 2
  store ptr %9, ptr %11, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.sglib_ilist_iterator, ptr %13, i32 0, i32 3
  store ptr %12, ptr %14, align 8
  %15 = load ptr, ptr %6, align 8
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds %struct.sglib_ilist_iterator, ptr %16, i32 0, i32 1
  store ptr %15, ptr %17, align 8
  %18 = load ptr, ptr %5, align 8
  %19 = call ptr @sglib_ilist_it_next(ptr noundef %18)
  ret ptr %19
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_ilist_it_next(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.sglib_ilist_iterator, ptr %6, i32 0, i32 1
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.sglib_ilist_iterator, ptr %9, i32 0, i32 1
  store ptr null, ptr %10, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.sglib_ilist_iterator, ptr %11, i32 0, i32 2
  %13 = load ptr, ptr %12, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %38

15:                                               ; preds = %1
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.sglib_ilist_iterator, ptr %16, i32 0, i32 3
  %18 = load ptr, ptr %17, align 8
  store ptr %18, ptr %4, align 8
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.sglib_ilist_iterator, ptr %19, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %5, align 8
  br label %22

22:                                               ; preds = %33, %15
  %23 = load ptr, ptr %3, align 8
  %24 = icmp ne ptr %23, null
  br i1 %24, label %25, label %31

25:                                               ; preds = %22
  %26 = load ptr, ptr %5, align 8
  %27 = load ptr, ptr %3, align 8
  %28 = load ptr, ptr %4, align 8
  %29 = call i32 %26(ptr noundef %27, ptr noundef %28)
  %30 = icmp ne i32 %29, 0
  br label %31

31:                                               ; preds = %25, %22
  %32 = phi i1 [ false, %22 ], [ %30, %25 ]
  br i1 %32, label %33, label %37

33:                                               ; preds = %31
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds %struct.ilist, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  store ptr %36, ptr %3, align 8
  br label %22, !llvm.loop !51

37:                                               ; preds = %31
  br label %38

38:                                               ; preds = %37, %1
  %39 = load ptr, ptr %3, align 8
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr inbounds %struct.sglib_ilist_iterator, ptr %40, i32 0, i32 0
  store ptr %39, ptr %41, align 8
  %42 = load ptr, ptr %3, align 8
  %43 = icmp ne ptr %42, null
  br i1 %43, label %44, label %50

44:                                               ; preds = %38
  %45 = load ptr, ptr %3, align 8
  %46 = getelementptr inbounds %struct.ilist, ptr %45, i32 0, i32 1
  %47 = load ptr, ptr %46, align 8
  %48 = load ptr, ptr %2, align 8
  %49 = getelementptr inbounds %struct.sglib_ilist_iterator, ptr %48, i32 0, i32 1
  store ptr %47, ptr %49, align 8
  br label %50

50:                                               ; preds = %44, %38
  %51 = load ptr, ptr %3, align 8
  ret ptr %51
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_ilist_it_init(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @sglib_ilist_it_init_on_equal(ptr noundef %5, ptr noundef %6, ptr noundef null, ptr noundef null)
  ret ptr %7
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_ilist_it_current(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.sglib_ilist_iterator, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_hashed_ilist_init(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %12, %1
  %5 = load i32, ptr %3, align 4
  %6 = icmp ult i32 %5, 20
  br i1 %6, label %7, label %15

7:                                                ; preds = %4
  %8 = load ptr, ptr %2, align 8
  %9 = load i32, ptr %3, align 4
  %10 = zext i32 %9 to i64
  %11 = getelementptr inbounds ptr, ptr %8, i64 %10
  store ptr null, ptr %11, align 8
  br label %12

12:                                               ; preds = %7
  %13 = load i32, ptr %3, align 4
  %14 = add i32 %13, 1
  store i32 %14, ptr %3, align 4
  br label %4, !llvm.loop !52

15:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_hashed_ilist_add(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call i32 @ilist_hash_function(ptr noundef %6)
  %8 = urem i32 %7, 20
  store i32 %8, ptr %5, align 4
  %9 = load ptr, ptr %3, align 8
  %10 = load i32, ptr %5, align 4
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds ptr, ptr %9, i64 %11
  %13 = load ptr, ptr %4, align 8
  call void @sglib_ilist_add(ptr noundef %12, ptr noundef %13)
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_hashed_ilist_add_if_not_member(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = call i32 @ilist_hash_function(ptr noundef %8)
  %10 = urem i32 %9, 20
  store i32 %10, ptr %7, align 4
  %11 = load ptr, ptr %4, align 8
  %12 = load i32, ptr %7, align 4
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds ptr, ptr %11, i64 %13
  %15 = load ptr, ptr %5, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = call i32 @sglib_ilist_add_if_not_member(ptr noundef %14, ptr noundef %15, ptr noundef %16)
  ret i32 %17
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_hashed_ilist_delete(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call i32 @ilist_hash_function(ptr noundef %6)
  %8 = urem i32 %7, 20
  store i32 %8, ptr %5, align 4
  %9 = load ptr, ptr %3, align 8
  %10 = load i32, ptr %5, align 4
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds ptr, ptr %9, i64 %11
  %13 = load ptr, ptr %4, align 8
  call void @sglib_ilist_delete(ptr noundef %12, ptr noundef %13)
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_hashed_ilist_delete_if_member(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = call i32 @ilist_hash_function(ptr noundef %8)
  %10 = urem i32 %9, 20
  store i32 %10, ptr %7, align 4
  %11 = load ptr, ptr %4, align 8
  %12 = load i32, ptr %7, align 4
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds ptr, ptr %11, i64 %13
  %15 = load ptr, ptr %5, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = call i32 @sglib_ilist_delete_if_member(ptr noundef %14, ptr noundef %15, ptr noundef %16)
  ret i32 %17
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_hashed_ilist_is_member(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call i32 @ilist_hash_function(ptr noundef %6)
  %8 = urem i32 %7, 20
  store i32 %8, ptr %5, align 4
  %9 = load ptr, ptr %3, align 8
  %10 = load i32, ptr %5, align 4
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds ptr, ptr %9, i64 %11
  %13 = load ptr, ptr %12, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = call i32 @sglib_ilist_is_member(ptr noundef %13, ptr noundef %14)
  ret i32 %15
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_hashed_ilist_find_member(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call i32 @ilist_hash_function(ptr noundef %6)
  %8 = urem i32 %7, 20
  store i32 %8, ptr %5, align 4
  %9 = load ptr, ptr %3, align 8
  %10 = load i32, ptr %5, align 4
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds ptr, ptr %9, i64 %11
  %13 = load ptr, ptr %12, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = call ptr @sglib_ilist_find_member(ptr noundef %13, ptr noundef %14)
  ret ptr %15
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_hashed_ilist_it_init_on_equal(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.sglib_hashed_ilist_iterator, ptr %11, i32 0, i32 1
  store ptr %10, ptr %12, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.sglib_hashed_ilist_iterator, ptr %13, i32 0, i32 2
  store i32 0, ptr %14, align 8
  %15 = load ptr, ptr %7, align 8
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds %struct.sglib_hashed_ilist_iterator, ptr %16, i32 0, i32 3
  store ptr %15, ptr %17, align 8
  %18 = load ptr, ptr %8, align 8
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds %struct.sglib_hashed_ilist_iterator, ptr %19, i32 0, i32 4
  store ptr %18, ptr %20, align 8
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds %struct.sglib_hashed_ilist_iterator, ptr %21, i32 0, i32 0
  %23 = load ptr, ptr %6, align 8
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds %struct.sglib_hashed_ilist_iterator, ptr %24, i32 0, i32 2
  %26 = load i32, ptr %25, align 8
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds ptr, ptr %23, i64 %27
  %29 = load ptr, ptr %28, align 8
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds %struct.sglib_hashed_ilist_iterator, ptr %30, i32 0, i32 3
  %32 = load ptr, ptr %31, align 8
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds %struct.sglib_hashed_ilist_iterator, ptr %33, i32 0, i32 4
  %35 = load ptr, ptr %34, align 8
  %36 = call ptr @sglib_ilist_it_init_on_equal(ptr noundef %22, ptr noundef %29, ptr noundef %32, ptr noundef %35)
  store ptr %36, ptr %9, align 8
  %37 = load ptr, ptr %9, align 8
  %38 = icmp eq ptr %37, null
  br i1 %38, label %39, label %42

39:                                               ; preds = %4
  %40 = load ptr, ptr %5, align 8
  %41 = call ptr @sglib_hashed_ilist_it_next(ptr noundef %40)
  store ptr %41, ptr %9, align 8
  br label %42

42:                                               ; preds = %39, %4
  %43 = load ptr, ptr %9, align 8
  ret ptr %43
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_hashed_ilist_it_next(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.sglib_hashed_ilist_iterator, ptr %4, i32 0, i32 0
  %6 = call ptr @sglib_ilist_it_next(ptr noundef %5)
  store ptr %6, ptr %3, align 8
  br label %7

7:                                                ; preds = %18, %1
  %8 = load ptr, ptr %3, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %16

10:                                               ; preds = %7
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.sglib_hashed_ilist_iterator, ptr %11, i32 0, i32 2
  %13 = load i32, ptr %12, align 8
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %12, align 8
  %15 = icmp slt i32 %14, 20
  br label %16

16:                                               ; preds = %10, %7
  %17 = phi i1 [ false, %7 ], [ %15, %10 ]
  br i1 %17, label %18, label %37

18:                                               ; preds = %16
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.sglib_hashed_ilist_iterator, ptr %19, i32 0, i32 0
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds %struct.sglib_hashed_ilist_iterator, ptr %21, i32 0, i32 1
  %23 = load ptr, ptr %22, align 8
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds %struct.sglib_hashed_ilist_iterator, ptr %24, i32 0, i32 2
  %26 = load i32, ptr %25, align 8
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds ptr, ptr %23, i64 %27
  %29 = load ptr, ptr %28, align 8
  %30 = load ptr, ptr %2, align 8
  %31 = getelementptr inbounds %struct.sglib_hashed_ilist_iterator, ptr %30, i32 0, i32 3
  %32 = load ptr, ptr %31, align 8
  %33 = load ptr, ptr %2, align 8
  %34 = getelementptr inbounds %struct.sglib_hashed_ilist_iterator, ptr %33, i32 0, i32 4
  %35 = load ptr, ptr %34, align 8
  %36 = call ptr @sglib_ilist_it_init_on_equal(ptr noundef %20, ptr noundef %29, ptr noundef %32, ptr noundef %35)
  store ptr %36, ptr %3, align 8
  br label %7, !llvm.loop !53

37:                                               ; preds = %16
  %38 = load ptr, ptr %3, align 8
  ret ptr %38
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_hashed_ilist_it_init(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @sglib_hashed_ilist_it_init_on_equal(ptr noundef %5, ptr noundef %6, ptr noundef null, ptr noundef null)
  ret ptr %7
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_hashed_ilist_it_current(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.sglib_hashed_ilist_iterator, ptr %3, i32 0, i32 0
  %5 = call ptr @sglib_ilist_it_current(ptr noundef %4)
  ret ptr %5
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_iq_init(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.iq, ptr %3, i32 0, i32 2
  store i32 0, ptr %4, align 4
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.iq, ptr %5, i32 0, i32 1
  store i32 0, ptr %6, align 4
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_iq_is_empty(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.iq, ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.iq, ptr %6, i32 0, i32 2
  %8 = load i32, ptr %7, align 4
  %9 = icmp eq i32 %5, %8
  %10 = zext i1 %9 to i32
  ret i32 %10
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_iq_is_full(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.iq, ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.iq, ptr %6, i32 0, i32 2
  %8 = load i32, ptr %7, align 4
  %9 = add nsw i32 %8, 1
  %10 = srem i32 %9, 101
  %11 = icmp eq i32 %5, %10
  %12 = zext i1 %11 to i32
  ret i32 %12
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_iq_first_element(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.iq, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.iq, ptr %5, i32 0, i32 1
  %7 = load i32, ptr %6, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [101 x i32], ptr %4, i64 0, i64 %8
  %10 = load i32, ptr %9, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_iq_first_element_ptr(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.iq, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.iq, ptr %5, i32 0, i32 1
  %7 = load i32, ptr %6, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [101 x i32], ptr %4, i64 0, i64 %8
  ret ptr %9
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_iq_add_next(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.iq, ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.iq, ptr %6, i32 0, i32 2
  %8 = load i32, ptr %7, align 4
  %9 = add nsw i32 %8, 1
  %10 = srem i32 %9, 101
  %11 = icmp eq i32 %5, %10
  br i1 %11, label %12, label %13

12:                                               ; preds = %1
  br label %13

13:                                               ; preds = %12, %1
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.iq, ptr %14, i32 0, i32 2
  %16 = load i32, ptr %15, align 4
  %17 = add nsw i32 %16, 1
  %18 = srem i32 %17, 101
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.iq, ptr %19, i32 0, i32 2
  store i32 %18, ptr %20, align 4
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_iq_add(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.iq, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.iq, ptr %8, i32 0, i32 2
  %10 = load i32, ptr %9, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [101 x i32], ptr %7, i64 0, i64 %11
  store i32 %5, ptr %12, align 4
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.iq, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 4
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.iq, ptr %16, i32 0, i32 2
  %18 = load i32, ptr %17, align 4
  %19 = add nsw i32 %18, 1
  %20 = srem i32 %19, 101
  %21 = icmp eq i32 %15, %20
  br i1 %21, label %22, label %23

22:                                               ; preds = %2
  br label %23

23:                                               ; preds = %22, %2
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.iq, ptr %24, i32 0, i32 2
  %26 = load i32, ptr %25, align 4
  %27 = add nsw i32 %26, 1
  %28 = srem i32 %27, 101
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.iq, ptr %29, i32 0, i32 2
  store i32 %28, ptr %30, align 4
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_iq_delete_first(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.iq, ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.iq, ptr %6, i32 0, i32 2
  %8 = load i32, ptr %7, align 4
  %9 = icmp eq i32 %5, %8
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  br label %11

11:                                               ; preds = %10, %1
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.iq, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %14, 1
  %16 = srem i32 %15, 101
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.iq, ptr %17, i32 0, i32 1
  store i32 %16, ptr %18, align 4
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_iq_delete(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.iq, ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.iq, ptr %6, i32 0, i32 2
  %8 = load i32, ptr %7, align 4
  %9 = icmp eq i32 %5, %8
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  br label %11

11:                                               ; preds = %10, %1
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.iq, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %14, 1
  %16 = srem i32 %15, 101
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.iq, ptr %17, i32 0, i32 1
  store i32 %16, ptr %18, align 4
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib___rbtree_delete_recursive(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = load ptr, ptr %10, align 8
  store ptr %11, ptr %5, align 8
  store i32 0, ptr %8, align 4
  %12 = load ptr, ptr %5, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %15

14:                                               ; preds = %2
  br label %137

15:                                               ; preds = %2
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.rbtree, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %17, align 8
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds %struct.rbtree, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = sub nsw i32 %18, %21
  store i32 %22, ptr %7, align 4
  %23 = load i32, ptr %7, align 4
  %24 = icmp slt i32 %23, 0
  br i1 %24, label %32, label %25

25:                                               ; preds = %15
  %26 = load i32, ptr %7, align 4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %43

28:                                               ; preds = %25
  %29 = load ptr, ptr %4, align 8
  %30 = load ptr, ptr %5, align 8
  %31 = icmp ult ptr %29, %30
  br i1 %31, label %32, label %43

32:                                               ; preds = %28, %15
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds %struct.rbtree, ptr %33, i32 0, i32 2
  %35 = load ptr, ptr %4, align 8
  %36 = call i32 @sglib___rbtree_delete_recursive(ptr noundef %34, ptr noundef %35)
  store i32 %36, ptr %9, align 4
  %37 = load i32, ptr %9, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %42

39:                                               ; preds = %32
  %40 = load ptr, ptr %3, align 8
  %41 = call i32 @sglib___rbtree_fix_left_deletion_discrepancy(ptr noundef %40)
  store i32 %41, ptr %8, align 4
  br label %42

42:                                               ; preds = %39, %32
  br label %136

43:                                               ; preds = %28, %25
  %44 = load i32, ptr %7, align 4
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %53, label %46

46:                                               ; preds = %43
  %47 = load i32, ptr %7, align 4
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %64

49:                                               ; preds = %46
  %50 = load ptr, ptr %4, align 8
  %51 = load ptr, ptr %5, align 8
  %52 = icmp ugt ptr %50, %51
  br i1 %52, label %53, label %64

53:                                               ; preds = %49, %43
  %54 = load ptr, ptr %5, align 8
  %55 = getelementptr inbounds %struct.rbtree, ptr %54, i32 0, i32 3
  %56 = load ptr, ptr %4, align 8
  %57 = call i32 @sglib___rbtree_delete_recursive(ptr noundef %55, ptr noundef %56)
  store i32 %57, ptr %9, align 4
  %58 = load i32, ptr %9, align 4
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %63

60:                                               ; preds = %53
  %61 = load ptr, ptr %3, align 8
  %62 = call i32 @sglib___rbtree_fix_right_deletion_discrepancy(ptr noundef %61)
  store i32 %62, ptr %8, align 4
  br label %63

63:                                               ; preds = %60, %53
  br label %135

64:                                               ; preds = %49, %46
  %65 = load ptr, ptr %5, align 8
  %66 = getelementptr inbounds %struct.rbtree, ptr %65, i32 0, i32 2
  %67 = load ptr, ptr %66, align 8
  %68 = icmp eq ptr %67, null
  br i1 %68, label %69, label %107

69:                                               ; preds = %64
  %70 = load ptr, ptr %5, align 8
  %71 = getelementptr inbounds %struct.rbtree, ptr %70, i32 0, i32 3
  %72 = load ptr, ptr %71, align 8
  %73 = icmp eq ptr %72, null
  br i1 %73, label %74, label %82

74:                                               ; preds = %69
  %75 = load ptr, ptr %3, align 8
  store ptr null, ptr %75, align 8
  %76 = load ptr, ptr %5, align 8
  %77 = getelementptr inbounds %struct.rbtree, ptr %76, i32 0, i32 1
  %78 = load i8, ptr %77, align 4
  %79 = zext i8 %78 to i32
  %80 = icmp eq i32 %79, 0
  %81 = zext i1 %80 to i32
  store i32 %81, ptr %8, align 4
  br label %106

82:                                               ; preds = %69
  %83 = load ptr, ptr %5, align 8
  %84 = getelementptr inbounds %struct.rbtree, ptr %83, i32 0, i32 1
  %85 = load i8, ptr %84, align 4
  %86 = zext i8 %85 to i32
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %88, label %97

88:                                               ; preds = %82
  %89 = load ptr, ptr %5, align 8
  %90 = getelementptr inbounds %struct.rbtree, ptr %89, i32 0, i32 3
  %91 = load ptr, ptr %90, align 8
  %92 = getelementptr inbounds %struct.rbtree, ptr %91, i32 0, i32 1
  %93 = load i8, ptr %92, align 4
  %94 = zext i8 %93 to i32
  %95 = icmp eq i32 %94, 0
  br i1 %95, label %96, label %97

96:                                               ; preds = %88
  store i32 1, ptr %8, align 4
  br label %97

97:                                               ; preds = %96, %88, %82
  %98 = load ptr, ptr %5, align 8
  %99 = getelementptr inbounds %struct.rbtree, ptr %98, i32 0, i32 3
  %100 = load ptr, ptr %99, align 8
  %101 = getelementptr inbounds %struct.rbtree, ptr %100, i32 0, i32 1
  store i8 0, ptr %101, align 4
  %102 = load ptr, ptr %5, align 8
  %103 = getelementptr inbounds %struct.rbtree, ptr %102, i32 0, i32 3
  %104 = load ptr, ptr %103, align 8
  %105 = load ptr, ptr %3, align 8
  store ptr %104, ptr %105, align 8
  br label %106

106:                                              ; preds = %97, %74
  br label %134

107:                                              ; preds = %64
  %108 = load ptr, ptr %5, align 8
  %109 = getelementptr inbounds %struct.rbtree, ptr %108, i32 0, i32 2
  %110 = call i32 @sglib___rbtree_delete_rightmost_leaf(ptr noundef %109, ptr noundef %6)
  store i32 %110, ptr %9, align 4
  %111 = load ptr, ptr %5, align 8
  %112 = getelementptr inbounds %struct.rbtree, ptr %111, i32 0, i32 2
  %113 = load ptr, ptr %112, align 8
  %114 = load ptr, ptr %6, align 8
  %115 = getelementptr inbounds %struct.rbtree, ptr %114, i32 0, i32 2
  store ptr %113, ptr %115, align 8
  %116 = load ptr, ptr %5, align 8
  %117 = getelementptr inbounds %struct.rbtree, ptr %116, i32 0, i32 3
  %118 = load ptr, ptr %117, align 8
  %119 = load ptr, ptr %6, align 8
  %120 = getelementptr inbounds %struct.rbtree, ptr %119, i32 0, i32 3
  store ptr %118, ptr %120, align 8
  %121 = load ptr, ptr %5, align 8
  %122 = getelementptr inbounds %struct.rbtree, ptr %121, i32 0, i32 1
  %123 = load i8, ptr %122, align 4
  %124 = load ptr, ptr %6, align 8
  %125 = getelementptr inbounds %struct.rbtree, ptr %124, i32 0, i32 1
  store i8 %123, ptr %125, align 4
  %126 = load ptr, ptr %6, align 8
  %127 = load ptr, ptr %3, align 8
  store ptr %126, ptr %127, align 8
  %128 = load i32, ptr %9, align 4
  %129 = icmp ne i32 %128, 0
  br i1 %129, label %130, label %133

130:                                              ; preds = %107
  %131 = load ptr, ptr %3, align 8
  %132 = call i32 @sglib___rbtree_fix_left_deletion_discrepancy(ptr noundef %131)
  store i32 %132, ptr %8, align 4
  br label %133

133:                                              ; preds = %130, %107
  br label %134

134:                                              ; preds = %133, %106
  br label %135

135:                                              ; preds = %134, %63
  br label %136

136:                                              ; preds = %135, %42
  br label %137

137:                                              ; preds = %136, %14
  %138 = load i32, ptr %8, align 4
  ret i32 %138
}

; Function Attrs: noinline nounwind noinline uwtable
define internal i32 @sglib___rbtree_fix_left_deletion_discrepancy(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %16 = load ptr, ptr %2, align 8
  %17 = load ptr, ptr %16, align 8
  store ptr %17, ptr %5, align 8
  store ptr %17, ptr %4, align 8
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds %struct.rbtree, ptr %18, i32 0, i32 2
  %20 = load ptr, ptr %19, align 8
  store ptr %20, ptr %9, align 8
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds %struct.rbtree, ptr %21, i32 0, i32 3
  %23 = load ptr, ptr %22, align 8
  store ptr %23, ptr %6, align 8
  %24 = load ptr, ptr %6, align 8
  %25 = icmp eq ptr %24, null
  br i1 %25, label %26, label %29

26:                                               ; preds = %1
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.rbtree, ptr %27, i32 0, i32 1
  store i8 0, ptr %28, align 4
  store i32 0, ptr %3, align 4
  br label %321

29:                                               ; preds = %1
  %30 = load ptr, ptr %6, align 8
  %31 = getelementptr inbounds %struct.rbtree, ptr %30, i32 0, i32 3
  %32 = load ptr, ptr %31, align 8
  store ptr %32, ptr %10, align 8
  %33 = load ptr, ptr %6, align 8
  %34 = getelementptr inbounds %struct.rbtree, ptr %33, i32 0, i32 2
  %35 = load ptr, ptr %34, align 8
  store ptr %35, ptr %11, align 8
  %36 = load ptr, ptr %6, align 8
  %37 = getelementptr inbounds %struct.rbtree, ptr %36, i32 0, i32 1
  %38 = load i8, ptr %37, align 4
  %39 = zext i8 %38 to i32
  %40 = icmp eq i32 %39, 1
  br i1 %40, label %41, label %194

41:                                               ; preds = %29
  %42 = load ptr, ptr %11, align 8
  %43 = icmp eq ptr %42, null
  br i1 %43, label %44, label %55

44:                                               ; preds = %41
  %45 = load ptr, ptr %6, align 8
  %46 = load ptr, ptr %2, align 8
  store ptr %45, ptr %46, align 8
  %47 = load ptr, ptr %6, align 8
  %48 = getelementptr inbounds %struct.rbtree, ptr %47, i32 0, i32 1
  store i8 0, ptr %48, align 4
  %49 = load ptr, ptr %5, align 8
  %50 = load ptr, ptr %6, align 8
  %51 = getelementptr inbounds %struct.rbtree, ptr %50, i32 0, i32 2
  store ptr %49, ptr %51, align 8
  %52 = load ptr, ptr %11, align 8
  %53 = load ptr, ptr %5, align 8
  %54 = getelementptr inbounds %struct.rbtree, ptr %53, i32 0, i32 3
  store ptr %52, ptr %54, align 8
  store i32 0, ptr %3, align 4
  br label %193

55:                                               ; preds = %41
  %56 = load ptr, ptr %11, align 8
  store ptr %56, ptr %7, align 8
  %57 = load ptr, ptr %7, align 8
  %58 = getelementptr inbounds %struct.rbtree, ptr %57, i32 0, i32 3
  %59 = load ptr, ptr %58, align 8
  store ptr %59, ptr %12, align 8
  %60 = load ptr, ptr %7, align 8
  %61 = getelementptr inbounds %struct.rbtree, ptr %60, i32 0, i32 2
  %62 = load ptr, ptr %61, align 8
  store ptr %62, ptr %13, align 8
  %63 = load ptr, ptr %12, align 8
  %64 = icmp eq ptr %63, null
  br i1 %64, label %71, label %65

65:                                               ; preds = %55
  %66 = load ptr, ptr %12, align 8
  %67 = getelementptr inbounds %struct.rbtree, ptr %66, i32 0, i32 1
  %68 = load i8, ptr %67, align 4
  %69 = zext i8 %68 to i32
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %93

71:                                               ; preds = %65, %55
  %72 = load ptr, ptr %13, align 8
  %73 = icmp eq ptr %72, null
  br i1 %73, label %80, label %74

74:                                               ; preds = %71
  %75 = load ptr, ptr %13, align 8
  %76 = getelementptr inbounds %struct.rbtree, ptr %75, i32 0, i32 1
  %77 = load i8, ptr %76, align 4
  %78 = zext i8 %77 to i32
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %93

80:                                               ; preds = %74, %71
  %81 = load ptr, ptr %6, align 8
  %82 = load ptr, ptr %2, align 8
  store ptr %81, ptr %82, align 8
  %83 = load ptr, ptr %5, align 8
  %84 = load ptr, ptr %6, align 8
  %85 = getelementptr inbounds %struct.rbtree, ptr %84, i32 0, i32 2
  store ptr %83, ptr %85, align 8
  %86 = load ptr, ptr %6, align 8
  %87 = getelementptr inbounds %struct.rbtree, ptr %86, i32 0, i32 1
  store i8 0, ptr %87, align 4
  %88 = load ptr, ptr %7, align 8
  %89 = load ptr, ptr %5, align 8
  %90 = getelementptr inbounds %struct.rbtree, ptr %89, i32 0, i32 3
  store ptr %88, ptr %90, align 8
  %91 = load ptr, ptr %7, align 8
  %92 = getelementptr inbounds %struct.rbtree, ptr %91, i32 0, i32 1
  store i8 1, ptr %92, align 4
  store i32 0, ptr %3, align 4
  br label %192

93:                                               ; preds = %74, %65
  %94 = load ptr, ptr %12, align 8
  %95 = icmp ne ptr %94, null
  br i1 %95, label %96, label %156

96:                                               ; preds = %93
  %97 = load ptr, ptr %12, align 8
  %98 = getelementptr inbounds %struct.rbtree, ptr %97, i32 0, i32 1
  %99 = load i8, ptr %98, align 4
  %100 = zext i8 %99 to i32
  %101 = icmp eq i32 %100, 1
  br i1 %101, label %102, label %156

102:                                              ; preds = %96
  %103 = load ptr, ptr %13, align 8
  %104 = icmp ne ptr %103, null
  br i1 %104, label %105, label %135

105:                                              ; preds = %102
  %106 = load ptr, ptr %13, align 8
  %107 = getelementptr inbounds %struct.rbtree, ptr %106, i32 0, i32 1
  %108 = load i8, ptr %107, align 4
  %109 = zext i8 %108 to i32
  %110 = icmp eq i32 %109, 1
  br i1 %110, label %111, label %135

111:                                              ; preds = %105
  %112 = load ptr, ptr %13, align 8
  store ptr %112, ptr %8, align 8
  %113 = load ptr, ptr %8, align 8
  %114 = getelementptr inbounds %struct.rbtree, ptr %113, i32 0, i32 3
  %115 = load ptr, ptr %114, align 8
  store ptr %115, ptr %14, align 8
  %116 = load ptr, ptr %8, align 8
  %117 = getelementptr inbounds %struct.rbtree, ptr %116, i32 0, i32 2
  %118 = load ptr, ptr %117, align 8
  store ptr %118, ptr %15, align 8
  %119 = load ptr, ptr %8, align 8
  %120 = load ptr, ptr %2, align 8
  store ptr %119, ptr %120, align 8
  %121 = load ptr, ptr %8, align 8
  %122 = getelementptr inbounds %struct.rbtree, ptr %121, i32 0, i32 1
  store i8 0, ptr %122, align 4
  %123 = load ptr, ptr %6, align 8
  %124 = load ptr, ptr %8, align 8
  %125 = getelementptr inbounds %struct.rbtree, ptr %124, i32 0, i32 3
  store ptr %123, ptr %125, align 8
  %126 = load ptr, ptr %14, align 8
  %127 = load ptr, ptr %7, align 8
  %128 = getelementptr inbounds %struct.rbtree, ptr %127, i32 0, i32 2
  store ptr %126, ptr %128, align 8
  %129 = load ptr, ptr %5, align 8
  %130 = load ptr, ptr %8, align 8
  %131 = getelementptr inbounds %struct.rbtree, ptr %130, i32 0, i32 2
  store ptr %129, ptr %131, align 8
  %132 = load ptr, ptr %15, align 8
  %133 = load ptr, ptr %5, align 8
  %134 = getelementptr inbounds %struct.rbtree, ptr %133, i32 0, i32 3
  store ptr %132, ptr %134, align 8
  store i32 0, ptr %3, align 4
  br label %155

135:                                              ; preds = %105, %102
  %136 = load ptr, ptr %7, align 8
  %137 = load ptr, ptr %2, align 8
  store ptr %136, ptr %137, align 8
  %138 = load ptr, ptr %6, align 8
  %139 = load ptr, ptr %7, align 8
  %140 = getelementptr inbounds %struct.rbtree, ptr %139, i32 0, i32 3
  store ptr %138, ptr %140, align 8
  %141 = load ptr, ptr %5, align 8
  %142 = load ptr, ptr %7, align 8
  %143 = getelementptr inbounds %struct.rbtree, ptr %142, i32 0, i32 2
  store ptr %141, ptr %143, align 8
  %144 = load ptr, ptr %10, align 8
  %145 = load ptr, ptr %6, align 8
  %146 = getelementptr inbounds %struct.rbtree, ptr %145, i32 0, i32 3
  store ptr %144, ptr %146, align 8
  %147 = load ptr, ptr %12, align 8
  %148 = load ptr, ptr %6, align 8
  %149 = getelementptr inbounds %struct.rbtree, ptr %148, i32 0, i32 2
  store ptr %147, ptr %149, align 8
  %150 = load ptr, ptr %13, align 8
  %151 = load ptr, ptr %5, align 8
  %152 = getelementptr inbounds %struct.rbtree, ptr %151, i32 0, i32 3
  store ptr %150, ptr %152, align 8
  %153 = load ptr, ptr %12, align 8
  %154 = getelementptr inbounds %struct.rbtree, ptr %153, i32 0, i32 1
  store i8 0, ptr %154, align 4
  store i32 0, ptr %3, align 4
  br label %155

155:                                              ; preds = %135, %111
  br label %191

156:                                              ; preds = %96, %93
  %157 = load ptr, ptr %13, align 8
  %158 = icmp ne ptr %157, null
  br i1 %158, label %159, label %189

159:                                              ; preds = %156
  %160 = load ptr, ptr %13, align 8
  %161 = getelementptr inbounds %struct.rbtree, ptr %160, i32 0, i32 1
  %162 = load i8, ptr %161, align 4
  %163 = zext i8 %162 to i32
  %164 = icmp eq i32 %163, 1
  br i1 %164, label %165, label %189

165:                                              ; preds = %159
  %166 = load ptr, ptr %13, align 8
  store ptr %166, ptr %8, align 8
  %167 = load ptr, ptr %8, align 8
  %168 = getelementptr inbounds %struct.rbtree, ptr %167, i32 0, i32 3
  %169 = load ptr, ptr %168, align 8
  store ptr %169, ptr %14, align 8
  %170 = load ptr, ptr %8, align 8
  %171 = getelementptr inbounds %struct.rbtree, ptr %170, i32 0, i32 2
  %172 = load ptr, ptr %171, align 8
  store ptr %172, ptr %15, align 8
  %173 = load ptr, ptr %8, align 8
  %174 = load ptr, ptr %2, align 8
  store ptr %173, ptr %174, align 8
  %175 = load ptr, ptr %8, align 8
  %176 = getelementptr inbounds %struct.rbtree, ptr %175, i32 0, i32 1
  store i8 0, ptr %176, align 4
  %177 = load ptr, ptr %6, align 8
  %178 = load ptr, ptr %8, align 8
  %179 = getelementptr inbounds %struct.rbtree, ptr %178, i32 0, i32 3
  store ptr %177, ptr %179, align 8
  %180 = load ptr, ptr %14, align 8
  %181 = load ptr, ptr %7, align 8
  %182 = getelementptr inbounds %struct.rbtree, ptr %181, i32 0, i32 2
  store ptr %180, ptr %182, align 8
  %183 = load ptr, ptr %5, align 8
  %184 = load ptr, ptr %8, align 8
  %185 = getelementptr inbounds %struct.rbtree, ptr %184, i32 0, i32 2
  store ptr %183, ptr %185, align 8
  %186 = load ptr, ptr %15, align 8
  %187 = load ptr, ptr %5, align 8
  %188 = getelementptr inbounds %struct.rbtree, ptr %187, i32 0, i32 3
  store ptr %186, ptr %188, align 8
  store i32 0, ptr %3, align 4
  br label %190

189:                                              ; preds = %159, %156
  store i32 0, ptr %3, align 4
  br label %190

190:                                              ; preds = %189, %165
  br label %191

191:                                              ; preds = %190, %155
  br label %192

192:                                              ; preds = %191, %80
  br label %193

193:                                              ; preds = %192, %44
  br label %320

194:                                              ; preds = %29
  %195 = load ptr, ptr %10, align 8
  %196 = icmp eq ptr %195, null
  br i1 %196, label %203, label %197

197:                                              ; preds = %194
  %198 = load ptr, ptr %10, align 8
  %199 = getelementptr inbounds %struct.rbtree, ptr %198, i32 0, i32 1
  %200 = load i8, ptr %199, align 4
  %201 = zext i8 %200 to i32
  %202 = icmp eq i32 %201, 0
  br i1 %202, label %203, label %223

203:                                              ; preds = %197, %194
  %204 = load ptr, ptr %11, align 8
  %205 = icmp eq ptr %204, null
  br i1 %205, label %212, label %206

206:                                              ; preds = %203
  %207 = load ptr, ptr %11, align 8
  %208 = getelementptr inbounds %struct.rbtree, ptr %207, i32 0, i32 1
  %209 = load i8, ptr %208, align 4
  %210 = zext i8 %209 to i32
  %211 = icmp eq i32 %210, 0
  br i1 %211, label %212, label %223

212:                                              ; preds = %206, %203
  %213 = load ptr, ptr %5, align 8
  %214 = getelementptr inbounds %struct.rbtree, ptr %213, i32 0, i32 1
  %215 = load i8, ptr %214, align 4
  %216 = zext i8 %215 to i32
  %217 = icmp eq i32 %216, 0
  %218 = zext i1 %217 to i32
  store i32 %218, ptr %3, align 4
  %219 = load ptr, ptr %5, align 8
  %220 = getelementptr inbounds %struct.rbtree, ptr %219, i32 0, i32 1
  store i8 0, ptr %220, align 4
  %221 = load ptr, ptr %6, align 8
  %222 = getelementptr inbounds %struct.rbtree, ptr %221, i32 0, i32 1
  store i8 1, ptr %222, align 4
  br label %319

223:                                              ; preds = %206, %197
  %224 = load ptr, ptr %10, align 8
  %225 = icmp ne ptr %224, null
  br i1 %225, label %226, label %289

226:                                              ; preds = %223
  %227 = load ptr, ptr %10, align 8
  %228 = getelementptr inbounds %struct.rbtree, ptr %227, i32 0, i32 1
  %229 = load i8, ptr %228, align 4
  %230 = zext i8 %229 to i32
  %231 = icmp eq i32 %230, 1
  br i1 %231, label %232, label %289

232:                                              ; preds = %226
  %233 = load ptr, ptr %11, align 8
  %234 = icmp eq ptr %233, null
  br i1 %234, label %241, label %235

235:                                              ; preds = %232
  %236 = load ptr, ptr %11, align 8
  %237 = getelementptr inbounds %struct.rbtree, ptr %236, i32 0, i32 1
  %238 = load i8, ptr %237, align 4
  %239 = zext i8 %238 to i32
  %240 = icmp eq i32 %239, 0
  br i1 %240, label %241, label %259

241:                                              ; preds = %235, %232
  %242 = load ptr, ptr %6, align 8
  %243 = load ptr, ptr %2, align 8
  store ptr %242, ptr %243, align 8
  %244 = load ptr, ptr %5, align 8
  %245 = getelementptr inbounds %struct.rbtree, ptr %244, i32 0, i32 1
  %246 = load i8, ptr %245, align 4
  %247 = load ptr, ptr %6, align 8
  %248 = getelementptr inbounds %struct.rbtree, ptr %247, i32 0, i32 1
  store i8 %246, ptr %248, align 4
  %249 = load ptr, ptr %5, align 8
  %250 = getelementptr inbounds %struct.rbtree, ptr %249, i32 0, i32 1
  store i8 0, ptr %250, align 4
  %251 = load ptr, ptr %5, align 8
  %252 = load ptr, ptr %6, align 8
  %253 = getelementptr inbounds %struct.rbtree, ptr %252, i32 0, i32 2
  store ptr %251, ptr %253, align 8
  %254 = load ptr, ptr %11, align 8
  %255 = load ptr, ptr %5, align 8
  %256 = getelementptr inbounds %struct.rbtree, ptr %255, i32 0, i32 3
  store ptr %254, ptr %256, align 8
  %257 = load ptr, ptr %10, align 8
  %258 = getelementptr inbounds %struct.rbtree, ptr %257, i32 0, i32 1
  store i8 0, ptr %258, align 4
  store i32 0, ptr %3, align 4
  br label %288

259:                                              ; preds = %235
  %260 = load ptr, ptr %11, align 8
  store ptr %260, ptr %7, align 8
  %261 = load ptr, ptr %7, align 8
  %262 = getelementptr inbounds %struct.rbtree, ptr %261, i32 0, i32 3
  %263 = load ptr, ptr %262, align 8
  store ptr %263, ptr %12, align 8
  %264 = load ptr, ptr %7, align 8
  %265 = getelementptr inbounds %struct.rbtree, ptr %264, i32 0, i32 2
  %266 = load ptr, ptr %265, align 8
  store ptr %266, ptr %13, align 8
  %267 = load ptr, ptr %7, align 8
  %268 = load ptr, ptr %2, align 8
  store ptr %267, ptr %268, align 8
  %269 = load ptr, ptr %5, align 8
  %270 = getelementptr inbounds %struct.rbtree, ptr %269, i32 0, i32 1
  %271 = load i8, ptr %270, align 4
  %272 = load ptr, ptr %7, align 8
  %273 = getelementptr inbounds %struct.rbtree, ptr %272, i32 0, i32 1
  store i8 %271, ptr %273, align 4
  %274 = load ptr, ptr %5, align 8
  %275 = getelementptr inbounds %struct.rbtree, ptr %274, i32 0, i32 1
  store i8 0, ptr %275, align 4
  %276 = load ptr, ptr %6, align 8
  %277 = load ptr, ptr %7, align 8
  %278 = getelementptr inbounds %struct.rbtree, ptr %277, i32 0, i32 3
  store ptr %276, ptr %278, align 8
  %279 = load ptr, ptr %5, align 8
  %280 = load ptr, ptr %7, align 8
  %281 = getelementptr inbounds %struct.rbtree, ptr %280, i32 0, i32 2
  store ptr %279, ptr %281, align 8
  %282 = load ptr, ptr %12, align 8
  %283 = load ptr, ptr %6, align 8
  %284 = getelementptr inbounds %struct.rbtree, ptr %283, i32 0, i32 2
  store ptr %282, ptr %284, align 8
  %285 = load ptr, ptr %13, align 8
  %286 = load ptr, ptr %5, align 8
  %287 = getelementptr inbounds %struct.rbtree, ptr %286, i32 0, i32 3
  store ptr %285, ptr %287, align 8
  store i32 0, ptr %3, align 4
  br label %288

288:                                              ; preds = %259, %241
  br label %318

289:                                              ; preds = %226, %223
  %290 = load ptr, ptr %11, align 8
  store ptr %290, ptr %7, align 8
  %291 = load ptr, ptr %7, align 8
  %292 = getelementptr inbounds %struct.rbtree, ptr %291, i32 0, i32 3
  %293 = load ptr, ptr %292, align 8
  store ptr %293, ptr %12, align 8
  %294 = load ptr, ptr %7, align 8
  %295 = getelementptr inbounds %struct.rbtree, ptr %294, i32 0, i32 2
  %296 = load ptr, ptr %295, align 8
  store ptr %296, ptr %13, align 8
  %297 = load ptr, ptr %7, align 8
  %298 = load ptr, ptr %2, align 8
  store ptr %297, ptr %298, align 8
  %299 = load ptr, ptr %5, align 8
  %300 = getelementptr inbounds %struct.rbtree, ptr %299, i32 0, i32 1
  %301 = load i8, ptr %300, align 4
  %302 = load ptr, ptr %7, align 8
  %303 = getelementptr inbounds %struct.rbtree, ptr %302, i32 0, i32 1
  store i8 %301, ptr %303, align 4
  %304 = load ptr, ptr %5, align 8
  %305 = getelementptr inbounds %struct.rbtree, ptr %304, i32 0, i32 1
  store i8 0, ptr %305, align 4
  %306 = load ptr, ptr %6, align 8
  %307 = load ptr, ptr %7, align 8
  %308 = getelementptr inbounds %struct.rbtree, ptr %307, i32 0, i32 3
  store ptr %306, ptr %308, align 8
  %309 = load ptr, ptr %5, align 8
  %310 = load ptr, ptr %7, align 8
  %311 = getelementptr inbounds %struct.rbtree, ptr %310, i32 0, i32 2
  store ptr %309, ptr %311, align 8
  %312 = load ptr, ptr %12, align 8
  %313 = load ptr, ptr %6, align 8
  %314 = getelementptr inbounds %struct.rbtree, ptr %313, i32 0, i32 2
  store ptr %312, ptr %314, align 8
  %315 = load ptr, ptr %13, align 8
  %316 = load ptr, ptr %5, align 8
  %317 = getelementptr inbounds %struct.rbtree, ptr %316, i32 0, i32 3
  store ptr %315, ptr %317, align 8
  store i32 0, ptr %3, align 4
  br label %318

318:                                              ; preds = %289, %288
  br label %319

319:                                              ; preds = %318, %212
  br label %320

320:                                              ; preds = %319, %193
  br label %321

321:                                              ; preds = %320, %26
  %322 = load i32, ptr %3, align 4
  ret i32 %322
}

; Function Attrs: noinline nounwind noinline uwtable
define internal i32 @sglib___rbtree_fix_right_deletion_discrepancy(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %16 = load ptr, ptr %2, align 8
  %17 = load ptr, ptr %16, align 8
  store ptr %17, ptr %5, align 8
  store ptr %17, ptr %4, align 8
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds %struct.rbtree, ptr %18, i32 0, i32 3
  %20 = load ptr, ptr %19, align 8
  store ptr %20, ptr %9, align 8
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds %struct.rbtree, ptr %21, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  store ptr %23, ptr %6, align 8
  %24 = load ptr, ptr %6, align 8
  %25 = icmp eq ptr %24, null
  br i1 %25, label %26, label %29

26:                                               ; preds = %1
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.rbtree, ptr %27, i32 0, i32 1
  store i8 0, ptr %28, align 4
  store i32 0, ptr %3, align 4
  br label %321

29:                                               ; preds = %1
  %30 = load ptr, ptr %6, align 8
  %31 = getelementptr inbounds %struct.rbtree, ptr %30, i32 0, i32 2
  %32 = load ptr, ptr %31, align 8
  store ptr %32, ptr %10, align 8
  %33 = load ptr, ptr %6, align 8
  %34 = getelementptr inbounds %struct.rbtree, ptr %33, i32 0, i32 3
  %35 = load ptr, ptr %34, align 8
  store ptr %35, ptr %11, align 8
  %36 = load ptr, ptr %6, align 8
  %37 = getelementptr inbounds %struct.rbtree, ptr %36, i32 0, i32 1
  %38 = load i8, ptr %37, align 4
  %39 = zext i8 %38 to i32
  %40 = icmp eq i32 %39, 1
  br i1 %40, label %41, label %194

41:                                               ; preds = %29
  %42 = load ptr, ptr %11, align 8
  %43 = icmp eq ptr %42, null
  br i1 %43, label %44, label %55

44:                                               ; preds = %41
  %45 = load ptr, ptr %6, align 8
  %46 = load ptr, ptr %2, align 8
  store ptr %45, ptr %46, align 8
  %47 = load ptr, ptr %6, align 8
  %48 = getelementptr inbounds %struct.rbtree, ptr %47, i32 0, i32 1
  store i8 0, ptr %48, align 4
  %49 = load ptr, ptr %5, align 8
  %50 = load ptr, ptr %6, align 8
  %51 = getelementptr inbounds %struct.rbtree, ptr %50, i32 0, i32 3
  store ptr %49, ptr %51, align 8
  %52 = load ptr, ptr %11, align 8
  %53 = load ptr, ptr %5, align 8
  %54 = getelementptr inbounds %struct.rbtree, ptr %53, i32 0, i32 2
  store ptr %52, ptr %54, align 8
  store i32 0, ptr %3, align 4
  br label %193

55:                                               ; preds = %41
  %56 = load ptr, ptr %11, align 8
  store ptr %56, ptr %7, align 8
  %57 = load ptr, ptr %7, align 8
  %58 = getelementptr inbounds %struct.rbtree, ptr %57, i32 0, i32 2
  %59 = load ptr, ptr %58, align 8
  store ptr %59, ptr %12, align 8
  %60 = load ptr, ptr %7, align 8
  %61 = getelementptr inbounds %struct.rbtree, ptr %60, i32 0, i32 3
  %62 = load ptr, ptr %61, align 8
  store ptr %62, ptr %13, align 8
  %63 = load ptr, ptr %12, align 8
  %64 = icmp eq ptr %63, null
  br i1 %64, label %71, label %65

65:                                               ; preds = %55
  %66 = load ptr, ptr %12, align 8
  %67 = getelementptr inbounds %struct.rbtree, ptr %66, i32 0, i32 1
  %68 = load i8, ptr %67, align 4
  %69 = zext i8 %68 to i32
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %93

71:                                               ; preds = %65, %55
  %72 = load ptr, ptr %13, align 8
  %73 = icmp eq ptr %72, null
  br i1 %73, label %80, label %74

74:                                               ; preds = %71
  %75 = load ptr, ptr %13, align 8
  %76 = getelementptr inbounds %struct.rbtree, ptr %75, i32 0, i32 1
  %77 = load i8, ptr %76, align 4
  %78 = zext i8 %77 to i32
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %93

80:                                               ; preds = %74, %71
  %81 = load ptr, ptr %6, align 8
  %82 = load ptr, ptr %2, align 8
  store ptr %81, ptr %82, align 8
  %83 = load ptr, ptr %5, align 8
  %84 = load ptr, ptr %6, align 8
  %85 = getelementptr inbounds %struct.rbtree, ptr %84, i32 0, i32 3
  store ptr %83, ptr %85, align 8
  %86 = load ptr, ptr %6, align 8
  %87 = getelementptr inbounds %struct.rbtree, ptr %86, i32 0, i32 1
  store i8 0, ptr %87, align 4
  %88 = load ptr, ptr %7, align 8
  %89 = load ptr, ptr %5, align 8
  %90 = getelementptr inbounds %struct.rbtree, ptr %89, i32 0, i32 2
  store ptr %88, ptr %90, align 8
  %91 = load ptr, ptr %7, align 8
  %92 = getelementptr inbounds %struct.rbtree, ptr %91, i32 0, i32 1
  store i8 1, ptr %92, align 4
  store i32 0, ptr %3, align 4
  br label %192

93:                                               ; preds = %74, %65
  %94 = load ptr, ptr %12, align 8
  %95 = icmp ne ptr %94, null
  br i1 %95, label %96, label %156

96:                                               ; preds = %93
  %97 = load ptr, ptr %12, align 8
  %98 = getelementptr inbounds %struct.rbtree, ptr %97, i32 0, i32 1
  %99 = load i8, ptr %98, align 4
  %100 = zext i8 %99 to i32
  %101 = icmp eq i32 %100, 1
  br i1 %101, label %102, label %156

102:                                              ; preds = %96
  %103 = load ptr, ptr %13, align 8
  %104 = icmp ne ptr %103, null
  br i1 %104, label %105, label %135

105:                                              ; preds = %102
  %106 = load ptr, ptr %13, align 8
  %107 = getelementptr inbounds %struct.rbtree, ptr %106, i32 0, i32 1
  %108 = load i8, ptr %107, align 4
  %109 = zext i8 %108 to i32
  %110 = icmp eq i32 %109, 1
  br i1 %110, label %111, label %135

111:                                              ; preds = %105
  %112 = load ptr, ptr %13, align 8
  store ptr %112, ptr %8, align 8
  %113 = load ptr, ptr %8, align 8
  %114 = getelementptr inbounds %struct.rbtree, ptr %113, i32 0, i32 2
  %115 = load ptr, ptr %114, align 8
  store ptr %115, ptr %14, align 8
  %116 = load ptr, ptr %8, align 8
  %117 = getelementptr inbounds %struct.rbtree, ptr %116, i32 0, i32 3
  %118 = load ptr, ptr %117, align 8
  store ptr %118, ptr %15, align 8
  %119 = load ptr, ptr %8, align 8
  %120 = load ptr, ptr %2, align 8
  store ptr %119, ptr %120, align 8
  %121 = load ptr, ptr %8, align 8
  %122 = getelementptr inbounds %struct.rbtree, ptr %121, i32 0, i32 1
  store i8 0, ptr %122, align 4
  %123 = load ptr, ptr %6, align 8
  %124 = load ptr, ptr %8, align 8
  %125 = getelementptr inbounds %struct.rbtree, ptr %124, i32 0, i32 2
  store ptr %123, ptr %125, align 8
  %126 = load ptr, ptr %14, align 8
  %127 = load ptr, ptr %7, align 8
  %128 = getelementptr inbounds %struct.rbtree, ptr %127, i32 0, i32 3
  store ptr %126, ptr %128, align 8
  %129 = load ptr, ptr %5, align 8
  %130 = load ptr, ptr %8, align 8
  %131 = getelementptr inbounds %struct.rbtree, ptr %130, i32 0, i32 3
  store ptr %129, ptr %131, align 8
  %132 = load ptr, ptr %15, align 8
  %133 = load ptr, ptr %5, align 8
  %134 = getelementptr inbounds %struct.rbtree, ptr %133, i32 0, i32 2
  store ptr %132, ptr %134, align 8
  store i32 0, ptr %3, align 4
  br label %155

135:                                              ; preds = %105, %102
  %136 = load ptr, ptr %7, align 8
  %137 = load ptr, ptr %2, align 8
  store ptr %136, ptr %137, align 8
  %138 = load ptr, ptr %6, align 8
  %139 = load ptr, ptr %7, align 8
  %140 = getelementptr inbounds %struct.rbtree, ptr %139, i32 0, i32 2
  store ptr %138, ptr %140, align 8
  %141 = load ptr, ptr %5, align 8
  %142 = load ptr, ptr %7, align 8
  %143 = getelementptr inbounds %struct.rbtree, ptr %142, i32 0, i32 3
  store ptr %141, ptr %143, align 8
  %144 = load ptr, ptr %10, align 8
  %145 = load ptr, ptr %6, align 8
  %146 = getelementptr inbounds %struct.rbtree, ptr %145, i32 0, i32 2
  store ptr %144, ptr %146, align 8
  %147 = load ptr, ptr %12, align 8
  %148 = load ptr, ptr %6, align 8
  %149 = getelementptr inbounds %struct.rbtree, ptr %148, i32 0, i32 3
  store ptr %147, ptr %149, align 8
  %150 = load ptr, ptr %13, align 8
  %151 = load ptr, ptr %5, align 8
  %152 = getelementptr inbounds %struct.rbtree, ptr %151, i32 0, i32 2
  store ptr %150, ptr %152, align 8
  %153 = load ptr, ptr %12, align 8
  %154 = getelementptr inbounds %struct.rbtree, ptr %153, i32 0, i32 1
  store i8 0, ptr %154, align 4
  store i32 0, ptr %3, align 4
  br label %155

155:                                              ; preds = %135, %111
  br label %191

156:                                              ; preds = %96, %93
  %157 = load ptr, ptr %13, align 8
  %158 = icmp ne ptr %157, null
  br i1 %158, label %159, label %189

159:                                              ; preds = %156
  %160 = load ptr, ptr %13, align 8
  %161 = getelementptr inbounds %struct.rbtree, ptr %160, i32 0, i32 1
  %162 = load i8, ptr %161, align 4
  %163 = zext i8 %162 to i32
  %164 = icmp eq i32 %163, 1
  br i1 %164, label %165, label %189

165:                                              ; preds = %159
  %166 = load ptr, ptr %13, align 8
  store ptr %166, ptr %8, align 8
  %167 = load ptr, ptr %8, align 8
  %168 = getelementptr inbounds %struct.rbtree, ptr %167, i32 0, i32 2
  %169 = load ptr, ptr %168, align 8
  store ptr %169, ptr %14, align 8
  %170 = load ptr, ptr %8, align 8
  %171 = getelementptr inbounds %struct.rbtree, ptr %170, i32 0, i32 3
  %172 = load ptr, ptr %171, align 8
  store ptr %172, ptr %15, align 8
  %173 = load ptr, ptr %8, align 8
  %174 = load ptr, ptr %2, align 8
  store ptr %173, ptr %174, align 8
  %175 = load ptr, ptr %8, align 8
  %176 = getelementptr inbounds %struct.rbtree, ptr %175, i32 0, i32 1
  store i8 0, ptr %176, align 4
  %177 = load ptr, ptr %6, align 8
  %178 = load ptr, ptr %8, align 8
  %179 = getelementptr inbounds %struct.rbtree, ptr %178, i32 0, i32 2
  store ptr %177, ptr %179, align 8
  %180 = load ptr, ptr %14, align 8
  %181 = load ptr, ptr %7, align 8
  %182 = getelementptr inbounds %struct.rbtree, ptr %181, i32 0, i32 3
  store ptr %180, ptr %182, align 8
  %183 = load ptr, ptr %5, align 8
  %184 = load ptr, ptr %8, align 8
  %185 = getelementptr inbounds %struct.rbtree, ptr %184, i32 0, i32 3
  store ptr %183, ptr %185, align 8
  %186 = load ptr, ptr %15, align 8
  %187 = load ptr, ptr %5, align 8
  %188 = getelementptr inbounds %struct.rbtree, ptr %187, i32 0, i32 2
  store ptr %186, ptr %188, align 8
  store i32 0, ptr %3, align 4
  br label %190

189:                                              ; preds = %159, %156
  store i32 0, ptr %3, align 4
  br label %190

190:                                              ; preds = %189, %165
  br label %191

191:                                              ; preds = %190, %155
  br label %192

192:                                              ; preds = %191, %80
  br label %193

193:                                              ; preds = %192, %44
  br label %320

194:                                              ; preds = %29
  %195 = load ptr, ptr %10, align 8
  %196 = icmp eq ptr %195, null
  br i1 %196, label %203, label %197

197:                                              ; preds = %194
  %198 = load ptr, ptr %10, align 8
  %199 = getelementptr inbounds %struct.rbtree, ptr %198, i32 0, i32 1
  %200 = load i8, ptr %199, align 4
  %201 = zext i8 %200 to i32
  %202 = icmp eq i32 %201, 0
  br i1 %202, label %203, label %223

203:                                              ; preds = %197, %194
  %204 = load ptr, ptr %11, align 8
  %205 = icmp eq ptr %204, null
  br i1 %205, label %212, label %206

206:                                              ; preds = %203
  %207 = load ptr, ptr %11, align 8
  %208 = getelementptr inbounds %struct.rbtree, ptr %207, i32 0, i32 1
  %209 = load i8, ptr %208, align 4
  %210 = zext i8 %209 to i32
  %211 = icmp eq i32 %210, 0
  br i1 %211, label %212, label %223

212:                                              ; preds = %206, %203
  %213 = load ptr, ptr %5, align 8
  %214 = getelementptr inbounds %struct.rbtree, ptr %213, i32 0, i32 1
  %215 = load i8, ptr %214, align 4
  %216 = zext i8 %215 to i32
  %217 = icmp eq i32 %216, 0
  %218 = zext i1 %217 to i32
  store i32 %218, ptr %3, align 4
  %219 = load ptr, ptr %5, align 8
  %220 = getelementptr inbounds %struct.rbtree, ptr %219, i32 0, i32 1
  store i8 0, ptr %220, align 4
  %221 = load ptr, ptr %6, align 8
  %222 = getelementptr inbounds %struct.rbtree, ptr %221, i32 0, i32 1
  store i8 1, ptr %222, align 4
  br label %319

223:                                              ; preds = %206, %197
  %224 = load ptr, ptr %10, align 8
  %225 = icmp ne ptr %224, null
  br i1 %225, label %226, label %289

226:                                              ; preds = %223
  %227 = load ptr, ptr %10, align 8
  %228 = getelementptr inbounds %struct.rbtree, ptr %227, i32 0, i32 1
  %229 = load i8, ptr %228, align 4
  %230 = zext i8 %229 to i32
  %231 = icmp eq i32 %230, 1
  br i1 %231, label %232, label %289

232:                                              ; preds = %226
  %233 = load ptr, ptr %11, align 8
  %234 = icmp eq ptr %233, null
  br i1 %234, label %241, label %235

235:                                              ; preds = %232
  %236 = load ptr, ptr %11, align 8
  %237 = getelementptr inbounds %struct.rbtree, ptr %236, i32 0, i32 1
  %238 = load i8, ptr %237, align 4
  %239 = zext i8 %238 to i32
  %240 = icmp eq i32 %239, 0
  br i1 %240, label %241, label %259

241:                                              ; preds = %235, %232
  %242 = load ptr, ptr %6, align 8
  %243 = load ptr, ptr %2, align 8
  store ptr %242, ptr %243, align 8
  %244 = load ptr, ptr %5, align 8
  %245 = getelementptr inbounds %struct.rbtree, ptr %244, i32 0, i32 1
  %246 = load i8, ptr %245, align 4
  %247 = load ptr, ptr %6, align 8
  %248 = getelementptr inbounds %struct.rbtree, ptr %247, i32 0, i32 1
  store i8 %246, ptr %248, align 4
  %249 = load ptr, ptr %5, align 8
  %250 = getelementptr inbounds %struct.rbtree, ptr %249, i32 0, i32 1
  store i8 0, ptr %250, align 4
  %251 = load ptr, ptr %5, align 8
  %252 = load ptr, ptr %6, align 8
  %253 = getelementptr inbounds %struct.rbtree, ptr %252, i32 0, i32 3
  store ptr %251, ptr %253, align 8
  %254 = load ptr, ptr %11, align 8
  %255 = load ptr, ptr %5, align 8
  %256 = getelementptr inbounds %struct.rbtree, ptr %255, i32 0, i32 2
  store ptr %254, ptr %256, align 8
  %257 = load ptr, ptr %10, align 8
  %258 = getelementptr inbounds %struct.rbtree, ptr %257, i32 0, i32 1
  store i8 0, ptr %258, align 4
  store i32 0, ptr %3, align 4
  br label %288

259:                                              ; preds = %235
  %260 = load ptr, ptr %11, align 8
  store ptr %260, ptr %7, align 8
  %261 = load ptr, ptr %7, align 8
  %262 = getelementptr inbounds %struct.rbtree, ptr %261, i32 0, i32 2
  %263 = load ptr, ptr %262, align 8
  store ptr %263, ptr %12, align 8
  %264 = load ptr, ptr %7, align 8
  %265 = getelementptr inbounds %struct.rbtree, ptr %264, i32 0, i32 3
  %266 = load ptr, ptr %265, align 8
  store ptr %266, ptr %13, align 8
  %267 = load ptr, ptr %7, align 8
  %268 = load ptr, ptr %2, align 8
  store ptr %267, ptr %268, align 8
  %269 = load ptr, ptr %5, align 8
  %270 = getelementptr inbounds %struct.rbtree, ptr %269, i32 0, i32 1
  %271 = load i8, ptr %270, align 4
  %272 = load ptr, ptr %7, align 8
  %273 = getelementptr inbounds %struct.rbtree, ptr %272, i32 0, i32 1
  store i8 %271, ptr %273, align 4
  %274 = load ptr, ptr %5, align 8
  %275 = getelementptr inbounds %struct.rbtree, ptr %274, i32 0, i32 1
  store i8 0, ptr %275, align 4
  %276 = load ptr, ptr %6, align 8
  %277 = load ptr, ptr %7, align 8
  %278 = getelementptr inbounds %struct.rbtree, ptr %277, i32 0, i32 2
  store ptr %276, ptr %278, align 8
  %279 = load ptr, ptr %5, align 8
  %280 = load ptr, ptr %7, align 8
  %281 = getelementptr inbounds %struct.rbtree, ptr %280, i32 0, i32 3
  store ptr %279, ptr %281, align 8
  %282 = load ptr, ptr %12, align 8
  %283 = load ptr, ptr %6, align 8
  %284 = getelementptr inbounds %struct.rbtree, ptr %283, i32 0, i32 3
  store ptr %282, ptr %284, align 8
  %285 = load ptr, ptr %13, align 8
  %286 = load ptr, ptr %5, align 8
  %287 = getelementptr inbounds %struct.rbtree, ptr %286, i32 0, i32 2
  store ptr %285, ptr %287, align 8
  store i32 0, ptr %3, align 4
  br label %288

288:                                              ; preds = %259, %241
  br label %318

289:                                              ; preds = %226, %223
  %290 = load ptr, ptr %11, align 8
  store ptr %290, ptr %7, align 8
  %291 = load ptr, ptr %7, align 8
  %292 = getelementptr inbounds %struct.rbtree, ptr %291, i32 0, i32 2
  %293 = load ptr, ptr %292, align 8
  store ptr %293, ptr %12, align 8
  %294 = load ptr, ptr %7, align 8
  %295 = getelementptr inbounds %struct.rbtree, ptr %294, i32 0, i32 3
  %296 = load ptr, ptr %295, align 8
  store ptr %296, ptr %13, align 8
  %297 = load ptr, ptr %7, align 8
  %298 = load ptr, ptr %2, align 8
  store ptr %297, ptr %298, align 8
  %299 = load ptr, ptr %5, align 8
  %300 = getelementptr inbounds %struct.rbtree, ptr %299, i32 0, i32 1
  %301 = load i8, ptr %300, align 4
  %302 = load ptr, ptr %7, align 8
  %303 = getelementptr inbounds %struct.rbtree, ptr %302, i32 0, i32 1
  store i8 %301, ptr %303, align 4
  %304 = load ptr, ptr %5, align 8
  %305 = getelementptr inbounds %struct.rbtree, ptr %304, i32 0, i32 1
  store i8 0, ptr %305, align 4
  %306 = load ptr, ptr %6, align 8
  %307 = load ptr, ptr %7, align 8
  %308 = getelementptr inbounds %struct.rbtree, ptr %307, i32 0, i32 2
  store ptr %306, ptr %308, align 8
  %309 = load ptr, ptr %5, align 8
  %310 = load ptr, ptr %7, align 8
  %311 = getelementptr inbounds %struct.rbtree, ptr %310, i32 0, i32 3
  store ptr %309, ptr %311, align 8
  %312 = load ptr, ptr %12, align 8
  %313 = load ptr, ptr %6, align 8
  %314 = getelementptr inbounds %struct.rbtree, ptr %313, i32 0, i32 3
  store ptr %312, ptr %314, align 8
  %315 = load ptr, ptr %13, align 8
  %316 = load ptr, ptr %5, align 8
  %317 = getelementptr inbounds %struct.rbtree, ptr %316, i32 0, i32 2
  store ptr %315, ptr %317, align 8
  store i32 0, ptr %3, align 4
  br label %318

318:                                              ; preds = %289, %288
  br label %319

319:                                              ; preds = %318, %212
  br label %320

320:                                              ; preds = %319, %193
  br label %321

321:                                              ; preds = %320, %26
  %322 = load i32, ptr %3, align 4
  ret i32 %322
}

; Function Attrs: noinline nounwind noinline uwtable
define internal i32 @sglib___rbtree_delete_rightmost_leaf(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %5, align 8
  store i32 0, ptr %6, align 4
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds %struct.rbtree, ptr %10, i32 0, i32 3
  %12 = load ptr, ptr %11, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %54

14:                                               ; preds = %2
  %15 = load ptr, ptr %5, align 8
  %16 = load ptr, ptr %4, align 8
  store ptr %15, ptr %16, align 8
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds %struct.rbtree, ptr %17, i32 0, i32 2
  %19 = load ptr, ptr %18, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %45

21:                                               ; preds = %14
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds %struct.rbtree, ptr %22, i32 0, i32 1
  %24 = load i8, ptr %23, align 4
  %25 = zext i8 %24 to i32
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %36

27:                                               ; preds = %21
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds %struct.rbtree, ptr %28, i32 0, i32 2
  %30 = load ptr, ptr %29, align 8
  %31 = getelementptr inbounds %struct.rbtree, ptr %30, i32 0, i32 1
  %32 = load i8, ptr %31, align 4
  %33 = zext i8 %32 to i32
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %36

35:                                               ; preds = %27
  store i32 1, ptr %6, align 4
  br label %36

36:                                               ; preds = %35, %27, %21
  %37 = load ptr, ptr %5, align 8
  %38 = getelementptr inbounds %struct.rbtree, ptr %37, i32 0, i32 2
  %39 = load ptr, ptr %38, align 8
  %40 = getelementptr inbounds %struct.rbtree, ptr %39, i32 0, i32 1
  store i8 0, ptr %40, align 4
  %41 = load ptr, ptr %5, align 8
  %42 = getelementptr inbounds %struct.rbtree, ptr %41, i32 0, i32 2
  %43 = load ptr, ptr %42, align 8
  %44 = load ptr, ptr %3, align 8
  store ptr %43, ptr %44, align 8
  br label %53

45:                                               ; preds = %14
  %46 = load ptr, ptr %3, align 8
  store ptr null, ptr %46, align 8
  %47 = load ptr, ptr %5, align 8
  %48 = getelementptr inbounds %struct.rbtree, ptr %47, i32 0, i32 1
  %49 = load i8, ptr %48, align 4
  %50 = zext i8 %49 to i32
  %51 = icmp eq i32 %50, 0
  %52 = zext i1 %51 to i32
  store i32 %52, ptr %6, align 4
  br label %53

53:                                               ; preds = %45, %36
  br label %65

54:                                               ; preds = %2
  %55 = load ptr, ptr %5, align 8
  %56 = getelementptr inbounds %struct.rbtree, ptr %55, i32 0, i32 3
  %57 = load ptr, ptr %4, align 8
  %58 = call i32 @sglib___rbtree_delete_rightmost_leaf(ptr noundef %56, ptr noundef %57)
  store i32 %58, ptr %7, align 4
  %59 = load i32, ptr %7, align 4
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %64

61:                                               ; preds = %54
  %62 = load ptr, ptr %3, align 8
  %63 = call i32 @sglib___rbtree_fix_right_deletion_discrepancy(ptr noundef %62)
  store i32 %63, ptr %6, align 4
  br label %64

64:                                               ; preds = %61, %54
  br label %65

65:                                               ; preds = %64, %53
  %66 = load i32, ptr %6, align 4
  ret i32 %66
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_rbtree_add(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %struct.rbtree, ptr %5, i32 0, i32 3
  store ptr null, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %struct.rbtree, ptr %7, i32 0, i32 2
  store ptr null, ptr %8, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = load ptr, ptr %4, align 8
  call void @sglib___rbtree_add_recursive(ptr noundef %9, ptr noundef %10)
  %11 = load ptr, ptr %3, align 8
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds %struct.rbtree, ptr %12, i32 0, i32 1
  store i8 0, ptr %13, align 4
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define internal void @sglib___rbtree_add_recursive(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %6, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %16

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds %struct.rbtree, ptr %12, i32 0, i32 1
  store i8 1, ptr %13, align 4
  %14 = load ptr, ptr %4, align 8
  %15 = load ptr, ptr %3, align 8
  store ptr %14, ptr %15, align 8
  br label %58

16:                                               ; preds = %2
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.rbtree, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %18, align 8
  %20 = load ptr, ptr %6, align 8
  %21 = getelementptr inbounds %struct.rbtree, ptr %20, i32 0, i32 0
  %22 = load i32, ptr %21, align 8
  %23 = sub nsw i32 %19, %22
  store i32 %23, ptr %5, align 4
  %24 = load i32, ptr %5, align 4
  %25 = icmp slt i32 %24, 0
  br i1 %25, label %33, label %26

26:                                               ; preds = %16
  %27 = load i32, ptr %5, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %45

29:                                               ; preds = %26
  %30 = load ptr, ptr %4, align 8
  %31 = load ptr, ptr %6, align 8
  %32 = icmp ult ptr %30, %31
  br i1 %32, label %33, label %45

33:                                               ; preds = %29, %16
  %34 = load ptr, ptr %6, align 8
  %35 = getelementptr inbounds %struct.rbtree, ptr %34, i32 0, i32 2
  %36 = load ptr, ptr %4, align 8
  call void @sglib___rbtree_add_recursive(ptr noundef %35, ptr noundef %36)
  %37 = load ptr, ptr %6, align 8
  %38 = getelementptr inbounds %struct.rbtree, ptr %37, i32 0, i32 1
  %39 = load i8, ptr %38, align 4
  %40 = zext i8 %39 to i32
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %44

42:                                               ; preds = %33
  %43 = load ptr, ptr %3, align 8
  call void @sglib___rbtree_fix_left_insertion_discrepancy(ptr noundef %43)
  br label %44

44:                                               ; preds = %42, %33
  br label %57

45:                                               ; preds = %29, %26
  %46 = load ptr, ptr %6, align 8
  %47 = getelementptr inbounds %struct.rbtree, ptr %46, i32 0, i32 3
  %48 = load ptr, ptr %4, align 8
  call void @sglib___rbtree_add_recursive(ptr noundef %47, ptr noundef %48)
  %49 = load ptr, ptr %6, align 8
  %50 = getelementptr inbounds %struct.rbtree, ptr %49, i32 0, i32 1
  %51 = load i8, ptr %50, align 4
  %52 = zext i8 %51 to i32
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %56

54:                                               ; preds = %45
  %55 = load ptr, ptr %3, align 8
  call void @sglib___rbtree_fix_right_insertion_discrepancy(ptr noundef %55)
  br label %56

56:                                               ; preds = %54, %45
  br label %57

57:                                               ; preds = %56, %44
  br label %58

58:                                               ; preds = %57, %11
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib_rbtree_delete(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call i32 @sglib___rbtree_delete_recursive(ptr noundef %5, ptr noundef %6)
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %15

11:                                               ; preds = %2
  %12 = load ptr, ptr %3, align 8
  %13 = load ptr, ptr %12, align 8
  %14 = getelementptr inbounds %struct.rbtree, ptr %13, i32 0, i32 1
  store i8 0, ptr %14, align 4
  br label %15

15:                                               ; preds = %11, %2
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_rbtree_find_member(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  store ptr %8, ptr %6, align 8
  br label %9

9:                                                ; preds = %35, %2
  %10 = load ptr, ptr %6, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %36

12:                                               ; preds = %9
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.rbtree, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = getelementptr inbounds %struct.rbtree, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %17, align 8
  %19 = sub nsw i32 %15, %18
  store i32 %19, ptr %7, align 4
  %20 = load i32, ptr %7, align 4
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %22, label %26

22:                                               ; preds = %12
  %23 = load ptr, ptr %6, align 8
  %24 = getelementptr inbounds %struct.rbtree, ptr %23, i32 0, i32 2
  %25 = load ptr, ptr %24, align 8
  store ptr %25, ptr %6, align 8
  br label %35

26:                                               ; preds = %12
  %27 = load i32, ptr %7, align 4
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %29, label %33

29:                                               ; preds = %26
  %30 = load ptr, ptr %6, align 8
  %31 = getelementptr inbounds %struct.rbtree, ptr %30, i32 0, i32 3
  %32 = load ptr, ptr %31, align 8
  store ptr %32, ptr %6, align 8
  br label %34

33:                                               ; preds = %26
  br label %36

34:                                               ; preds = %29
  br label %35

35:                                               ; preds = %34, %22
  br label %9, !llvm.loop !54

36:                                               ; preds = %33, %9
  %37 = load ptr, ptr %6, align 8
  store ptr %37, ptr %5, align 8
  %38 = load ptr, ptr %5, align 8
  ret ptr %38
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_rbtree_is_member(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  br label %7

7:                                                ; preds = %47, %2
  %8 = load ptr, ptr %4, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %48

10:                                               ; preds = %7
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.rbtree, ptr %11, i32 0, i32 0
  %13 = load i32, ptr %12, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.rbtree, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = sub nsw i32 %13, %16
  store i32 %17, ptr %6, align 4
  %18 = load i32, ptr %6, align 4
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %27, label %20

20:                                               ; preds = %10
  %21 = load i32, ptr %6, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %31

23:                                               ; preds = %20
  %24 = load ptr, ptr %5, align 8
  %25 = load ptr, ptr %4, align 8
  %26 = icmp ult ptr %24, %25
  br i1 %26, label %27, label %31

27:                                               ; preds = %23, %10
  %28 = load ptr, ptr %4, align 8
  %29 = getelementptr inbounds %struct.rbtree, ptr %28, i32 0, i32 2
  %30 = load ptr, ptr %29, align 8
  store ptr %30, ptr %4, align 8
  br label %47

31:                                               ; preds = %23, %20
  %32 = load i32, ptr %6, align 4
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %41, label %34

34:                                               ; preds = %31
  %35 = load i32, ptr %6, align 4
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %45

37:                                               ; preds = %34
  %38 = load ptr, ptr %5, align 8
  %39 = load ptr, ptr %4, align 8
  %40 = icmp ugt ptr %38, %39
  br i1 %40, label %41, label %45

41:                                               ; preds = %37, %31
  %42 = load ptr, ptr %4, align 8
  %43 = getelementptr inbounds %struct.rbtree, ptr %42, i32 0, i32 3
  %44 = load ptr, ptr %43, align 8
  store ptr %44, ptr %4, align 8
  br label %46

45:                                               ; preds = %37, %34
  store i32 1, ptr %3, align 4
  br label %49

46:                                               ; preds = %41
  br label %47

47:                                               ; preds = %46, %27
  br label %7, !llvm.loop !55

48:                                               ; preds = %7
  store i32 0, ptr %3, align 4
  br label %49

49:                                               ; preds = %48, %45
  %50 = load i32, ptr %3, align 4
  ret i32 %50
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_rbtree_delete_if_member(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = call ptr @sglib_rbtree_find_member(ptr noundef %9, ptr noundef %10)
  %12 = load ptr, ptr %7, align 8
  store ptr %11, ptr %12, align 8
  %13 = icmp ne ptr %11, null
  br i1 %13, label %14, label %18

14:                                               ; preds = %3
  %15 = load ptr, ptr %5, align 8
  %16 = load ptr, ptr %7, align 8
  %17 = load ptr, ptr %16, align 8
  call void @sglib_rbtree_delete(ptr noundef %15, ptr noundef %17)
  store i32 1, ptr %4, align 4
  br label %19

18:                                               ; preds = %3
  store i32 0, ptr %4, align 4
  br label %19

19:                                               ; preds = %18, %14
  %20 = load i32, ptr %4, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_rbtree_add_if_not_member(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = call ptr @sglib_rbtree_find_member(ptr noundef %9, ptr noundef %10)
  %12 = load ptr, ptr %7, align 8
  store ptr %11, ptr %12, align 8
  %13 = icmp eq ptr %11, null
  br i1 %13, label %14, label %17

14:                                               ; preds = %3
  %15 = load ptr, ptr %5, align 8
  %16 = load ptr, ptr %6, align 8
  call void @sglib_rbtree_add(ptr noundef %15, ptr noundef %16)
  store i32 1, ptr %4, align 4
  br label %18

17:                                               ; preds = %3
  store i32 0, ptr %4, align 4
  br label %18

18:                                               ; preds = %17, %14
  %19 = load i32, ptr %4, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @sglib_rbtree_len(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca [128 x ptr], align 8
  %6 = alloca [128 x ptr], align 8
  %7 = alloca [128 x i8], align 1
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  %11 = load ptr, ptr %2, align 8
  store ptr %11, ptr %8, align 8
  store i32 0, ptr %9, align 4
  br label %12

12:                                               ; preds = %76, %1
  %13 = load ptr, ptr %8, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %86

15:                                               ; preds = %12
  br label %16

16:                                               ; preds = %41, %15
  %17 = load ptr, ptr %8, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %19, label %42

19:                                               ; preds = %16
  %20 = load ptr, ptr %8, align 8
  %21 = load i32, ptr %9, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [128 x ptr], ptr %5, i64 0, i64 %22
  store ptr %20, ptr %23, align 8
  %24 = load ptr, ptr %8, align 8
  %25 = getelementptr inbounds %struct.rbtree, ptr %24, i32 0, i32 3
  %26 = load ptr, ptr %25, align 8
  %27 = load i32, ptr %9, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [128 x ptr], ptr %6, i64 0, i64 %28
  store ptr %26, ptr %29, align 8
  %30 = load i32, ptr %9, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [128 x i8], ptr %7, i64 0, i64 %31
  store i8 0, ptr %32, align 1
  %33 = load ptr, ptr %8, align 8
  %34 = getelementptr inbounds %struct.rbtree, ptr %33, i32 0, i32 2
  %35 = load ptr, ptr %34, align 8
  store ptr %35, ptr %8, align 8
  %36 = load i32, ptr %9, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %9, align 4
  %38 = load i32, ptr %9, align 4
  %39 = icmp sge i32 %38, 128
  br i1 %39, label %40, label %41

40:                                               ; preds = %19
  br label %41

41:                                               ; preds = %40, %19
  br label %16, !llvm.loop !56

42:                                               ; preds = %16
  br label %43

43:                                               ; preds = %74, %42
  %44 = load i32, ptr %9, align 4
  %45 = add nsw i32 %44, -1
  store i32 %45, ptr %9, align 4
  %46 = load i32, ptr %9, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [128 x i8], ptr %7, i64 0, i64 %47
  %49 = load i8, ptr %48, align 1
  %50 = zext i8 %49 to i32
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %59

52:                                               ; preds = %43
  %53 = load i32, ptr %9, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [128 x ptr], ptr %5, i64 0, i64 %54
  %56 = load ptr, ptr %55, align 8
  store ptr %56, ptr %10, align 8
  %57 = load i32, ptr %3, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %3, align 4
  br label %59

59:                                               ; preds = %52, %43
  %60 = load i32, ptr %9, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [128 x i8], ptr %7, i64 0, i64 %61
  %63 = load i8, ptr %62, align 1
  %64 = add i8 %63, 1
  store i8 %64, ptr %62, align 1
  br label %65

65:                                               ; preds = %59
  %66 = load i32, ptr %9, align 4
  %67 = icmp sgt i32 %66, 0
  br i1 %67, label %68, label %74

68:                                               ; preds = %65
  %69 = load i32, ptr %9, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [128 x ptr], ptr %6, i64 0, i64 %70
  %72 = load ptr, ptr %71, align 8
  %73 = icmp eq ptr %72, null
  br label %74

74:                                               ; preds = %68, %65
  %75 = phi i1 [ false, %65 ], [ %73, %68 ]
  br i1 %75, label %43, label %76, !llvm.loop !57

76:                                               ; preds = %74
  %77 = load i32, ptr %9, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [128 x ptr], ptr %6, i64 0, i64 %78
  %80 = load ptr, ptr %79, align 8
  store ptr %80, ptr %8, align 8
  %81 = load i32, ptr %9, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [128 x ptr], ptr %6, i64 0, i64 %82
  store ptr null, ptr %83, align 8
  %84 = load i32, ptr %9, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, ptr %9, align 4
  br label %12, !llvm.loop !58

86:                                               ; preds = %12
  %87 = load i32, ptr %3, align 4
  ret i32 %87
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib__rbtree_it_compute_current_elem(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %13, i32 0, i32 5
  %15 = load ptr, ptr %14, align 8
  store ptr %15, ptr %7, align 8
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %16, i32 0, i32 6
  %18 = load ptr, ptr %17, align 8
  store ptr %18, ptr %8, align 8
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %19, i32 0, i32 0
  store ptr null, ptr %20, align 8
  br label %21

21:                                               ; preds = %215, %1
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %22, i32 0, i32 3
  %24 = load i16, ptr %23, align 8
  %25 = sext i16 %24 to i32
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %27, label %32

27:                                               ; preds = %21
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %28, i32 0, i32 0
  %30 = load ptr, ptr %29, align 8
  %31 = icmp eq ptr %30, null
  br label %32

32:                                               ; preds = %27, %21
  %33 = phi i1 [ false, %21 ], [ %31, %27 ]
  br i1 %33, label %34, label %216

34:                                               ; preds = %32
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %35, i32 0, i32 3
  %37 = load i16, ptr %36, align 8
  %38 = sext i16 %37 to i32
  %39 = sub nsw i32 %38, 1
  store i32 %39, ptr %3, align 4
  %40 = load i32, ptr %3, align 4
  %41 = icmp sge i32 %40, 0
  br i1 %41, label %42, label %179

42:                                               ; preds = %34
  %43 = load ptr, ptr %2, align 8
  %44 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %43, i32 0, i32 1
  %45 = load i32, ptr %3, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [128 x i8], ptr %44, i64 0, i64 %46
  %48 = load i8, ptr %47, align 1
  %49 = zext i8 %48 to i32
  %50 = icmp sge i32 %49, 2
  br i1 %50, label %51, label %56

51:                                               ; preds = %42
  %52 = load ptr, ptr %2, align 8
  %53 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %52, i32 0, i32 3
  %54 = load i16, ptr %53, align 8
  %55 = add i16 %54, -1
  store i16 %55, ptr %53, align 8
  br label %178

56:                                               ; preds = %42
  %57 = load ptr, ptr %2, align 8
  %58 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %57, i32 0, i32 1
  %59 = load i32, ptr %3, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [128 x i8], ptr %58, i64 0, i64 %60
  %62 = load i8, ptr %61, align 1
  %63 = zext i8 %62 to i32
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %65, label %74

65:                                               ; preds = %56
  %66 = load ptr, ptr %2, align 8
  %67 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %66, i32 0, i32 2
  %68 = load i32, ptr %3, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [128 x ptr], ptr %67, i64 0, i64 %69
  %71 = load ptr, ptr %70, align 8
  %72 = getelementptr inbounds %struct.rbtree, ptr %71, i32 0, i32 2
  %73 = load ptr, ptr %72, align 8
  store ptr %73, ptr %6, align 8
  br label %83

74:                                               ; preds = %56
  %75 = load ptr, ptr %2, align 8
  %76 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %75, i32 0, i32 2
  %77 = load i32, ptr %3, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [128 x ptr], ptr %76, i64 0, i64 %78
  %80 = load ptr, ptr %79, align 8
  %81 = getelementptr inbounds %struct.rbtree, ptr %80, i32 0, i32 3
  %82 = load ptr, ptr %81, align 8
  store ptr %82, ptr %6, align 8
  br label %83

83:                                               ; preds = %74, %65
  %84 = load ptr, ptr %7, align 8
  %85 = icmp ne ptr %84, null
  br i1 %85, label %86, label %149

86:                                               ; preds = %83
  %87 = load ptr, ptr %8, align 8
  %88 = icmp eq ptr %87, null
  br i1 %88, label %89, label %120

89:                                               ; preds = %86
  %90 = load ptr, ptr %6, align 8
  store ptr %90, ptr %9, align 8
  br label %91

91:                                               ; preds = %117, %89
  %92 = load ptr, ptr %9, align 8
  %93 = icmp ne ptr %92, null
  br i1 %93, label %94, label %118

94:                                               ; preds = %91
  %95 = load ptr, ptr %7, align 8
  %96 = getelementptr inbounds %struct.rbtree, ptr %95, i32 0, i32 0
  %97 = load i32, ptr %96, align 8
  %98 = load ptr, ptr %9, align 8
  %99 = getelementptr inbounds %struct.rbtree, ptr %98, i32 0, i32 0
  %100 = load i32, ptr %99, align 8
  %101 = sub nsw i32 %97, %100
  store i32 %101, ptr %10, align 4
  %102 = load i32, ptr %10, align 4
  %103 = icmp slt i32 %102, 0
  br i1 %103, label %104, label %108

104:                                              ; preds = %94
  %105 = load ptr, ptr %9, align 8
  %106 = getelementptr inbounds %struct.rbtree, ptr %105, i32 0, i32 2
  %107 = load ptr, ptr %106, align 8
  store ptr %107, ptr %9, align 8
  br label %117

108:                                              ; preds = %94
  %109 = load i32, ptr %10, align 4
  %110 = icmp sgt i32 %109, 0
  br i1 %110, label %111, label %115

111:                                              ; preds = %108
  %112 = load ptr, ptr %9, align 8
  %113 = getelementptr inbounds %struct.rbtree, ptr %112, i32 0, i32 3
  %114 = load ptr, ptr %113, align 8
  store ptr %114, ptr %9, align 8
  br label %116

115:                                              ; preds = %108
  br label %118

116:                                              ; preds = %111
  br label %117

117:                                              ; preds = %116, %104
  br label %91, !llvm.loop !59

118:                                              ; preds = %115, %91
  %119 = load ptr, ptr %9, align 8
  store ptr %119, ptr %6, align 8
  br label %148

120:                                              ; preds = %86
  %121 = load ptr, ptr %6, align 8
  store ptr %121, ptr %11, align 8
  br label %122

122:                                              ; preds = %145, %120
  %123 = load ptr, ptr %11, align 8
  %124 = icmp ne ptr %123, null
  br i1 %124, label %125, label %146

125:                                              ; preds = %122
  %126 = load ptr, ptr %8, align 8
  %127 = load ptr, ptr %7, align 8
  %128 = load ptr, ptr %11, align 8
  %129 = call i32 %126(ptr noundef %127, ptr noundef %128)
  store i32 %129, ptr %12, align 4
  %130 = load i32, ptr %12, align 4
  %131 = icmp slt i32 %130, 0
  br i1 %131, label %132, label %136

132:                                              ; preds = %125
  %133 = load ptr, ptr %11, align 8
  %134 = getelementptr inbounds %struct.rbtree, ptr %133, i32 0, i32 2
  %135 = load ptr, ptr %134, align 8
  store ptr %135, ptr %11, align 8
  br label %145

136:                                              ; preds = %125
  %137 = load i32, ptr %12, align 4
  %138 = icmp sgt i32 %137, 0
  br i1 %138, label %139, label %143

139:                                              ; preds = %136
  %140 = load ptr, ptr %11, align 8
  %141 = getelementptr inbounds %struct.rbtree, ptr %140, i32 0, i32 3
  %142 = load ptr, ptr %141, align 8
  store ptr %142, ptr %11, align 8
  br label %144

143:                                              ; preds = %136
  br label %146

144:                                              ; preds = %139
  br label %145

145:                                              ; preds = %144, %132
  br label %122, !llvm.loop !60

146:                                              ; preds = %143, %122
  %147 = load ptr, ptr %11, align 8
  store ptr %147, ptr %6, align 8
  br label %148

148:                                              ; preds = %146, %118
  br label %149

149:                                              ; preds = %148, %83
  %150 = load ptr, ptr %6, align 8
  %151 = icmp ne ptr %150, null
  br i1 %151, label %152, label %170

152:                                              ; preds = %149
  %153 = load i32, ptr %3, align 4
  %154 = add nsw i32 %153, 1
  store i32 %154, ptr %4, align 4
  %155 = load ptr, ptr %6, align 8
  %156 = load ptr, ptr %2, align 8
  %157 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %156, i32 0, i32 2
  %158 = load i32, ptr %4, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [128 x ptr], ptr %157, i64 0, i64 %159
  store ptr %155, ptr %160, align 8
  %161 = load ptr, ptr %2, align 8
  %162 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %161, i32 0, i32 1
  %163 = load i32, ptr %4, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [128 x i8], ptr %162, i64 0, i64 %164
  store i8 0, ptr %165, align 1
  %166 = load ptr, ptr %2, align 8
  %167 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %166, i32 0, i32 3
  %168 = load i16, ptr %167, align 8
  %169 = add i16 %168, 1
  store i16 %169, ptr %167, align 8
  br label %170

170:                                              ; preds = %152, %149
  %171 = load ptr, ptr %2, align 8
  %172 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %171, i32 0, i32 1
  %173 = load i32, ptr %3, align 4
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [128 x i8], ptr %172, i64 0, i64 %174
  %176 = load i8, ptr %175, align 1
  %177 = add i8 %176, 1
  store i8 %177, ptr %175, align 1
  br label %178

178:                                              ; preds = %170, %51
  br label %179

179:                                              ; preds = %178, %34
  %180 = load ptr, ptr %2, align 8
  %181 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %180, i32 0, i32 3
  %182 = load i16, ptr %181, align 8
  %183 = sext i16 %182 to i32
  %184 = icmp sgt i32 %183, 0
  br i1 %184, label %185, label %215

185:                                              ; preds = %179
  %186 = load ptr, ptr %2, align 8
  %187 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %186, i32 0, i32 4
  %188 = load i16, ptr %187, align 2
  %189 = sext i16 %188 to i32
  %190 = load ptr, ptr %2, align 8
  %191 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %190, i32 0, i32 1
  %192 = load ptr, ptr %2, align 8
  %193 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %192, i32 0, i32 3
  %194 = load i16, ptr %193, align 8
  %195 = sext i16 %194 to i32
  %196 = sub nsw i32 %195, 1
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds [128 x i8], ptr %191, i64 0, i64 %197
  %199 = load i8, ptr %198, align 1
  %200 = zext i8 %199 to i32
  %201 = icmp eq i32 %189, %200
  br i1 %201, label %202, label %215

202:                                              ; preds = %185
  %203 = load ptr, ptr %2, align 8
  %204 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %203, i32 0, i32 2
  %205 = load ptr, ptr %2, align 8
  %206 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %205, i32 0, i32 3
  %207 = load i16, ptr %206, align 8
  %208 = sext i16 %207 to i32
  %209 = sub nsw i32 %208, 1
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [128 x ptr], ptr %204, i64 0, i64 %210
  %212 = load ptr, ptr %211, align 8
  %213 = load ptr, ptr %2, align 8
  %214 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %213, i32 0, i32 0
  store ptr %212, ptr %214, align 8
  br label %215

215:                                              ; preds = %202, %185, %179
  br label %21, !llvm.loop !61

216:                                              ; preds = %32
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib__rbtree_it_init(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store i32 %2, ptr %8, align 4
  store ptr %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  %16 = load i32, ptr %8, align 4
  %17 = trunc i32 %16 to i16
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %18, i32 0, i32 4
  store i16 %17, ptr %19, align 2
  %20 = load ptr, ptr %10, align 8
  %21 = load ptr, ptr %6, align 8
  %22 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %21, i32 0, i32 5
  store ptr %20, ptr %22, align 8
  %23 = load ptr, ptr %9, align 8
  %24 = load ptr, ptr %6, align 8
  %25 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %24, i32 0, i32 6
  store ptr %23, ptr %25, align 8
  %26 = load ptr, ptr %10, align 8
  %27 = icmp eq ptr %26, null
  br i1 %27, label %28, label %30

28:                                               ; preds = %5
  %29 = load ptr, ptr %7, align 8
  store ptr %29, ptr %11, align 8
  br label %93

30:                                               ; preds = %5
  %31 = load ptr, ptr %9, align 8
  %32 = icmp eq ptr %31, null
  br i1 %32, label %33, label %64

33:                                               ; preds = %30
  %34 = load ptr, ptr %7, align 8
  store ptr %34, ptr %12, align 8
  br label %35

35:                                               ; preds = %61, %33
  %36 = load ptr, ptr %12, align 8
  %37 = icmp ne ptr %36, null
  br i1 %37, label %38, label %62

38:                                               ; preds = %35
  %39 = load ptr, ptr %10, align 8
  %40 = getelementptr inbounds %struct.rbtree, ptr %39, i32 0, i32 0
  %41 = load i32, ptr %40, align 8
  %42 = load ptr, ptr %12, align 8
  %43 = getelementptr inbounds %struct.rbtree, ptr %42, i32 0, i32 0
  %44 = load i32, ptr %43, align 8
  %45 = sub nsw i32 %41, %44
  store i32 %45, ptr %13, align 4
  %46 = load i32, ptr %13, align 4
  %47 = icmp slt i32 %46, 0
  br i1 %47, label %48, label %52

48:                                               ; preds = %38
  %49 = load ptr, ptr %12, align 8
  %50 = getelementptr inbounds %struct.rbtree, ptr %49, i32 0, i32 2
  %51 = load ptr, ptr %50, align 8
  store ptr %51, ptr %12, align 8
  br label %61

52:                                               ; preds = %38
  %53 = load i32, ptr %13, align 4
  %54 = icmp sgt i32 %53, 0
  br i1 %54, label %55, label %59

55:                                               ; preds = %52
  %56 = load ptr, ptr %12, align 8
  %57 = getelementptr inbounds %struct.rbtree, ptr %56, i32 0, i32 3
  %58 = load ptr, ptr %57, align 8
  store ptr %58, ptr %12, align 8
  br label %60

59:                                               ; preds = %52
  br label %62

60:                                               ; preds = %55
  br label %61

61:                                               ; preds = %60, %48
  br label %35, !llvm.loop !62

62:                                               ; preds = %59, %35
  %63 = load ptr, ptr %12, align 8
  store ptr %63, ptr %11, align 8
  br label %92

64:                                               ; preds = %30
  %65 = load ptr, ptr %7, align 8
  store ptr %65, ptr %14, align 8
  br label %66

66:                                               ; preds = %89, %64
  %67 = load ptr, ptr %14, align 8
  %68 = icmp ne ptr %67, null
  br i1 %68, label %69, label %90

69:                                               ; preds = %66
  %70 = load ptr, ptr %9, align 8
  %71 = load ptr, ptr %10, align 8
  %72 = load ptr, ptr %14, align 8
  %73 = call i32 %70(ptr noundef %71, ptr noundef %72)
  store i32 %73, ptr %15, align 4
  %74 = load i32, ptr %15, align 4
  %75 = icmp slt i32 %74, 0
  br i1 %75, label %76, label %80

76:                                               ; preds = %69
  %77 = load ptr, ptr %14, align 8
  %78 = getelementptr inbounds %struct.rbtree, ptr %77, i32 0, i32 2
  %79 = load ptr, ptr %78, align 8
  store ptr %79, ptr %14, align 8
  br label %89

80:                                               ; preds = %69
  %81 = load i32, ptr %15, align 4
  %82 = icmp sgt i32 %81, 0
  br i1 %82, label %83, label %87

83:                                               ; preds = %80
  %84 = load ptr, ptr %14, align 8
  %85 = getelementptr inbounds %struct.rbtree, ptr %84, i32 0, i32 3
  %86 = load ptr, ptr %85, align 8
  store ptr %86, ptr %14, align 8
  br label %88

87:                                               ; preds = %80
  br label %90

88:                                               ; preds = %83
  br label %89

89:                                               ; preds = %88, %76
  br label %66, !llvm.loop !63

90:                                               ; preds = %87, %66
  %91 = load ptr, ptr %14, align 8
  store ptr %91, ptr %11, align 8
  br label %92

92:                                               ; preds = %90, %62
  br label %93

93:                                               ; preds = %92, %28
  %94 = load ptr, ptr %11, align 8
  %95 = icmp eq ptr %94, null
  br i1 %95, label %96, label %101

96:                                               ; preds = %93
  %97 = load ptr, ptr %6, align 8
  %98 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %97, i32 0, i32 3
  store i16 0, ptr %98, align 8
  %99 = load ptr, ptr %6, align 8
  %100 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %99, i32 0, i32 0
  store ptr null, ptr %100, align 8
  br label %120

101:                                              ; preds = %93
  %102 = load ptr, ptr %6, align 8
  %103 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %102, i32 0, i32 3
  store i16 1, ptr %103, align 8
  %104 = load ptr, ptr %6, align 8
  %105 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %104, i32 0, i32 1
  %106 = getelementptr inbounds [128 x i8], ptr %105, i64 0, i64 0
  store i8 0, ptr %106, align 8
  %107 = load ptr, ptr %11, align 8
  %108 = load ptr, ptr %6, align 8
  %109 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %108, i32 0, i32 2
  %110 = getelementptr inbounds [128 x ptr], ptr %109, i64 0, i64 0
  store ptr %107, ptr %110, align 8
  %111 = load i32, ptr %8, align 4
  %112 = icmp eq i32 %111, 0
  br i1 %112, label %113, label %117

113:                                              ; preds = %101
  %114 = load ptr, ptr %11, align 8
  %115 = load ptr, ptr %6, align 8
  %116 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %115, i32 0, i32 0
  store ptr %114, ptr %116, align 8
  br label %119

117:                                              ; preds = %101
  %118 = load ptr, ptr %6, align 8
  call void @sglib__rbtree_it_compute_current_elem(ptr noundef %118)
  br label %119

119:                                              ; preds = %117, %113
  br label %120

120:                                              ; preds = %119, %96
  %121 = load ptr, ptr %6, align 8
  %122 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %121, i32 0, i32 0
  %123 = load ptr, ptr %122, align 8
  ret ptr %123
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_rbtree_it_init(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @sglib__rbtree_it_init(ptr noundef %5, ptr noundef %6, i32 noundef 2, ptr noundef null, ptr noundef null)
  ret ptr %7
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_rbtree_it_init_preorder(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @sglib__rbtree_it_init(ptr noundef %5, ptr noundef %6, i32 noundef 0, ptr noundef null, ptr noundef null)
  ret ptr %7
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_rbtree_it_init_inorder(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @sglib__rbtree_it_init(ptr noundef %5, ptr noundef %6, i32 noundef 1, ptr noundef null, ptr noundef null)
  ret ptr %7
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_rbtree_it_init_postorder(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call ptr @sglib__rbtree_it_init(ptr noundef %5, ptr noundef %6, i32 noundef 2, ptr noundef null, ptr noundef null)
  ret ptr %7
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_rbtree_it_init_on_equal(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = load ptr, ptr %7, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = call ptr @sglib__rbtree_it_init(ptr noundef %9, ptr noundef %10, i32 noundef 1, ptr noundef %11, ptr noundef %12)
  ret ptr %13
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_rbtree_it_current(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local ptr @sglib_rbtree_it_next(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @sglib__rbtree_it_compute_current_elem(ptr noundef %3)
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.sglib_rbtree_iterator, ptr %4, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  ret ptr %6
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sglib___rbtree_consistency_check(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 -1, ptr %3, align 4
  %4 = load ptr, ptr %2, align 8
  call void @sglib___rbtree_consistency_check_recursive(ptr noundef %4, ptr noundef %3, i32 noundef 0)
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define internal void @sglib___rbtree_consistency_check_recursive(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %7 = load ptr, ptr %4, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %18

9:                                                ; preds = %3
  %10 = load ptr, ptr %5, align 8
  %11 = load i32, ptr %10, align 4
  %12 = icmp slt i32 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %9
  %14 = load i32, ptr %6, align 4
  %15 = load ptr, ptr %5, align 8
  store i32 %14, ptr %15, align 4
  br label %17

16:                                               ; preds = %9
  br label %17

17:                                               ; preds = %16, %13
  br label %61

18:                                               ; preds = %3
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.rbtree, ptr %19, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  %22 = icmp ne ptr %21, null
  br i1 %22, label %23, label %24

23:                                               ; preds = %18
  br label %24

24:                                               ; preds = %23, %18
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds %struct.rbtree, ptr %25, i32 0, i32 3
  %27 = load ptr, ptr %26, align 8
  %28 = icmp ne ptr %27, null
  br i1 %28, label %29, label %30

29:                                               ; preds = %24
  br label %30

30:                                               ; preds = %29, %24
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds %struct.rbtree, ptr %31, i32 0, i32 1
  %33 = load i8, ptr %32, align 4
  %34 = zext i8 %33 to i32
  %35 = icmp eq i32 %34, 1
  br i1 %35, label %36, label %47

36:                                               ; preds = %30
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds %struct.rbtree, ptr %37, i32 0, i32 2
  %39 = load ptr, ptr %38, align 8
  %40 = load ptr, ptr %5, align 8
  %41 = load i32, ptr %6, align 4
  call void @sglib___rbtree_consistency_check_recursive(ptr noundef %39, ptr noundef %40, i32 noundef %41)
  %42 = load ptr, ptr %4, align 8
  %43 = getelementptr inbounds %struct.rbtree, ptr %42, i32 0, i32 3
  %44 = load ptr, ptr %43, align 8
  %45 = load ptr, ptr %5, align 8
  %46 = load i32, ptr %6, align 4
  call void @sglib___rbtree_consistency_check_recursive(ptr noundef %44, ptr noundef %45, i32 noundef %46)
  br label %60

47:                                               ; preds = %30
  %48 = load ptr, ptr %4, align 8
  %49 = getelementptr inbounds %struct.rbtree, ptr %48, i32 0, i32 2
  %50 = load ptr, ptr %49, align 8
  %51 = load ptr, ptr %5, align 8
  %52 = load i32, ptr %6, align 4
  %53 = add nsw i32 %52, 1
  call void @sglib___rbtree_consistency_check_recursive(ptr noundef %50, ptr noundef %51, i32 noundef %53)
  %54 = load ptr, ptr %4, align 8
  %55 = getelementptr inbounds %struct.rbtree, ptr %54, i32 0, i32 3
  %56 = load ptr, ptr %55, align 8
  %57 = load ptr, ptr %5, align 8
  %58 = load i32, ptr %6, align 4
  %59 = add nsw i32 %58, 1
  call void @sglib___rbtree_consistency_check_recursive(ptr noundef %56, ptr noundef %57, i32 noundef %59)
  br label %60

60:                                               ; preds = %47, %36
  br label %61

61:                                               ; preds = %60, %17
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @verify_benchmark(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca %struct.ilist, align 8
  %7 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  %8 = load ptr, ptr @the_list, align 8
  %9 = call ptr @sglib_dllist_get_first(ptr noundef %8)
  store ptr %9, ptr %5, align 8
  br label %10

10:                                               ; preds = %23, %1
  %11 = load ptr, ptr %5, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %27

13:                                               ; preds = %10
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds %struct.dllist, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = load i32, ptr %4, align 4
  %18 = icmp ne i32 %16, %17
  br i1 %18, label %19, label %20

19:                                               ; preds = %13
  store i32 0, ptr %2, align 4
  br label %66

20:                                               ; preds = %13
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %4, align 4
  br label %23

23:                                               ; preds = %20
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds %struct.dllist, ptr %24, i32 0, i32 1
  %26 = load ptr, ptr %25, align 8
  store ptr %26, ptr %5, align 8
  br label %10, !llvm.loop !64

27:                                               ; preds = %10
  store i32 0, ptr %4, align 4
  br label %28

28:                                               ; preds = %51, %27
  %29 = load i32, ptr %4, align 4
  %30 = icmp slt i32 %29, 100
  br i1 %30, label %31, label %54

31:                                               ; preds = %28
  %32 = load i32, ptr %4, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [100 x i32], ptr @array, i64 0, i64 %33
  %35 = load i32, ptr %34, align 4
  %36 = getelementptr inbounds %struct.ilist, ptr %6, i32 0, i32 0
  store i32 %35, ptr %36, align 8
  %37 = call ptr @sglib_hashed_ilist_find_member(ptr noundef @htab, ptr noundef %6)
  store ptr %37, ptr %7, align 8
  %38 = load ptr, ptr %7, align 8
  %39 = icmp eq ptr %38, null
  br i1 %39, label %49, label %40

40:                                               ; preds = %31
  %41 = load ptr, ptr %7, align 8
  %42 = getelementptr inbounds %struct.ilist, ptr %41, i32 0, i32 0
  %43 = load i32, ptr %42, align 8
  %44 = load i32, ptr %4, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [100 x i32], ptr @array, i64 0, i64 %45
  %47 = load i32, ptr %46, align 4
  %48 = icmp ne i32 %43, %47
  br i1 %48, label %49, label %50

49:                                               ; preds = %40, %31
  store i32 0, ptr %2, align 4
  br label %66

50:                                               ; preds = %40
  br label %51

51:                                               ; preds = %50
  %52 = load i32, ptr %4, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr %4, align 4
  br label %28, !llvm.loop !65

54:                                               ; preds = %28
  %55 = load i32, ptr %3, align 4
  %56 = icmp eq i32 15050, %55
  br i1 %56, label %57, label %63

57:                                               ; preds = %54
  %58 = call i32 @check_heap_beebs(ptr noundef @heap)
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %63

60:                                               ; preds = %57
  %61 = call i32 @memcmp(ptr noundef @array2, ptr noundef @verify_benchmark.array_exp, i64 noundef 400) #5
  %62 = icmp eq i32 0, %61
  br label %63

63:                                               ; preds = %60, %57, %54
  %64 = phi i1 [ false, %57 ], [ false, %54 ], [ %62, %60 ]
  %65 = zext i1 %64 to i32
  store i32 %65, ptr %2, align 4
  br label %66

66:                                               ; preds = %63, %49, %19
  %67 = load i32, ptr %2, align 4
  ret i32 %67
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef) #2

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
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca %struct.ilist, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca %struct.sglib_hashed_ilist_iterator, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca [101 x i32], align 4
  %15 = alloca %struct.rbtree, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca %struct.sglib_rbtree_iterator, align 8
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca [64 x i32], align 4
  %27 = alloca [64 x i32], align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %4, align 4
  br label %40

40:                                               ; preds = %697, %1
  %41 = load i32, ptr %4, align 4
  %42 = load i32, ptr %2, align 4
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %700

44:                                               ; preds = %40
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 @array2, ptr align 4 @array, i64 400, i1 false)
  %45 = getelementptr inbounds [64 x i32], ptr %26, i64 0, i64 0
  store i32 0, ptr %45, align 4
  %46 = getelementptr inbounds [64 x i32], ptr %27, i64 0, i64 0
  store i32 100, ptr %46, align 4
  store i32 1, ptr %23, align 4
  br label %47

47:                                               ; preds = %344, %44
  %48 = load i32, ptr %23, align 4
  %49 = icmp sgt i32 %48, 0
  br i1 %49, label %50, label %345

50:                                               ; preds = %47
  %51 = load i32, ptr %23, align 4
  %52 = add nsw i32 %51, -1
  store i32 %52, ptr %23, align 4
  %53 = load i32, ptr %23, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [64 x i32], ptr %26, i64 0, i64 %54
  %56 = load i32, ptr %55, align 4
  store i32 %56, ptr %24, align 4
  %57 = load i32, ptr %23, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [64 x i32], ptr %27, i64 0, i64 %58
  %60 = load i32, ptr %59, align 4
  store i32 %60, ptr %25, align 4
  br label %61

61:                                               ; preds = %291, %50
  %62 = load i32, ptr %25, align 4
  %63 = load i32, ptr %24, align 4
  %64 = sub nsw i32 %62, %63
  %65 = icmp sgt i32 %64, 2
  br i1 %65, label %66, label %292

66:                                               ; preds = %61
  %67 = load i32, ptr %24, align 4
  store i32 %67, ptr %22, align 4
  %68 = load i32, ptr %24, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr %20, align 4
  %70 = load i32, ptr %25, align 4
  %71 = sub nsw i32 %70, 1
  store i32 %71, ptr %21, align 4
  br label %72

72:                                               ; preds = %233, %66
  %73 = load i32, ptr %20, align 4
  %74 = load i32, ptr %21, align 4
  %75 = icmp slt i32 %73, %74
  br i1 %75, label %76, label %234

76:                                               ; preds = %72
  br label %77

77:                                               ; preds = %110, %76
  %78 = load i32, ptr %20, align 4
  %79 = load i32, ptr %21, align 4
  %80 = icmp sle i32 %78, %79
  br i1 %80, label %81, label %107

81:                                               ; preds = %77
  %82 = load i32, ptr %20, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %83
  %85 = load i32, ptr %84, align 4
  %86 = load i32, ptr %22, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %87
  %89 = load i32, ptr %88, align 4
  %90 = icmp sgt i32 %85, %89
  br i1 %90, label %91, label %92

91:                                               ; preds = %81
  br label %104

92:                                               ; preds = %81
  %93 = load i32, ptr %20, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %94
  %96 = load i32, ptr %95, align 4
  %97 = load i32, ptr %22, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %98
  %100 = load i32, ptr %99, align 4
  %101 = icmp slt i32 %96, %100
  %102 = zext i1 %101 to i64
  %103 = select i1 %101, i32 -1, i32 0
  br label %104

104:                                              ; preds = %92, %91
  %105 = phi i32 [ 1, %91 ], [ %103, %92 ]
  %106 = icmp sle i32 %105, 0
  br label %107

107:                                              ; preds = %104, %77
  %108 = phi i1 [ false, %77 ], [ %106, %104 ]
  br i1 %108, label %109, label %113

109:                                              ; preds = %107
  br label %110

110:                                              ; preds = %109
  %111 = load i32, ptr %20, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, ptr %20, align 4
  br label %77, !llvm.loop !66

113:                                              ; preds = %107
  %114 = load i32, ptr %20, align 4
  %115 = load i32, ptr %21, align 4
  %116 = icmp sgt i32 %114, %115
  br i1 %116, label %117, label %134

117:                                              ; preds = %113
  %118 = load i32, ptr %21, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %119
  %121 = load i32, ptr %120, align 4
  store i32 %121, ptr %29, align 4
  %122 = load i32, ptr %22, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %123
  %125 = load i32, ptr %124, align 4
  %126 = load i32, ptr %21, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %127
  store i32 %125, ptr %128, align 4
  %129 = load i32, ptr %29, align 4
  %130 = load i32, ptr %22, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %131
  store i32 %129, ptr %132, align 4
  %133 = load i32, ptr %21, align 4
  store i32 %133, ptr %20, align 4
  br label %233

134:                                              ; preds = %113
  br label %135

135:                                              ; preds = %168, %134
  %136 = load i32, ptr %20, align 4
  %137 = load i32, ptr %21, align 4
  %138 = icmp sle i32 %136, %137
  br i1 %138, label %139, label %165

139:                                              ; preds = %135
  %140 = load i32, ptr %21, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %141
  %143 = load i32, ptr %142, align 4
  %144 = load i32, ptr %22, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %145
  %147 = load i32, ptr %146, align 4
  %148 = icmp sgt i32 %143, %147
  br i1 %148, label %149, label %150

149:                                              ; preds = %139
  br label %162

150:                                              ; preds = %139
  %151 = load i32, ptr %21, align 4
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %152
  %154 = load i32, ptr %153, align 4
  %155 = load i32, ptr %22, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %156
  %158 = load i32, ptr %157, align 4
  %159 = icmp slt i32 %154, %158
  %160 = zext i1 %159 to i64
  %161 = select i1 %159, i32 -1, i32 0
  br label %162

162:                                              ; preds = %150, %149
  %163 = phi i32 [ 1, %149 ], [ %161, %150 ]
  %164 = icmp sge i32 %163, 0
  br label %165

165:                                              ; preds = %162, %135
  %166 = phi i1 [ false, %135 ], [ %164, %162 ]
  br i1 %166, label %167, label %171

167:                                              ; preds = %165
  br label %168

168:                                              ; preds = %167
  %169 = load i32, ptr %21, align 4
  %170 = add nsw i32 %169, -1
  store i32 %170, ptr %21, align 4
  br label %135, !llvm.loop !67

171:                                              ; preds = %165
  %172 = load i32, ptr %20, align 4
  %173 = load i32, ptr %21, align 4
  %174 = icmp sgt i32 %172, %173
  br i1 %174, label %175, label %192

175:                                              ; preds = %171
  %176 = load i32, ptr %21, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %177
  %179 = load i32, ptr %178, align 4
  store i32 %179, ptr %30, align 4
  %180 = load i32, ptr %22, align 4
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %181
  %183 = load i32, ptr %182, align 4
  %184 = load i32, ptr %21, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %185
  store i32 %183, ptr %186, align 4
  %187 = load i32, ptr %30, align 4
  %188 = load i32, ptr %22, align 4
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %189
  store i32 %187, ptr %190, align 4
  %191 = load i32, ptr %21, align 4
  store i32 %191, ptr %20, align 4
  br label %232

192:                                              ; preds = %171
  %193 = load i32, ptr %20, align 4
  %194 = load i32, ptr %21, align 4
  %195 = icmp slt i32 %193, %194
  br i1 %195, label %196, label %231

196:                                              ; preds = %192
  %197 = load i32, ptr %20, align 4
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %198
  %200 = load i32, ptr %199, align 4
  store i32 %200, ptr %31, align 4
  %201 = load i32, ptr %21, align 4
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %202
  %204 = load i32, ptr %203, align 4
  %205 = load i32, ptr %20, align 4
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %206
  store i32 %204, ptr %207, align 4
  %208 = load i32, ptr %31, align 4
  %209 = load i32, ptr %21, align 4
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %210
  store i32 %208, ptr %211, align 4
  %212 = load i32, ptr %20, align 4
  %213 = add nsw i32 %212, 2
  %214 = load i32, ptr %21, align 4
  %215 = icmp slt i32 %213, %214
  br i1 %215, label %216, label %221

216:                                              ; preds = %196
  %217 = load i32, ptr %20, align 4
  %218 = add nsw i32 %217, 1
  store i32 %218, ptr %20, align 4
  %219 = load i32, ptr %21, align 4
  %220 = add nsw i32 %219, -1
  store i32 %220, ptr %21, align 4
  br label %230

221:                                              ; preds = %196
  %222 = load i32, ptr %20, align 4
  %223 = add nsw i32 %222, 1
  %224 = load i32, ptr %21, align 4
  %225 = icmp slt i32 %223, %224
  br i1 %225, label %226, label %229

226:                                              ; preds = %221
  %227 = load i32, ptr %20, align 4
  %228 = add nsw i32 %227, 1
  store i32 %228, ptr %20, align 4
  br label %229

229:                                              ; preds = %226, %221
  br label %230

230:                                              ; preds = %229, %216
  br label %231

231:                                              ; preds = %230, %192
  br label %232

232:                                              ; preds = %231, %175
  br label %233

233:                                              ; preds = %232, %117
  br label %72, !llvm.loop !68

234:                                              ; preds = %72
  %235 = load i32, ptr %20, align 4
  %236 = load i32, ptr %24, align 4
  %237 = sub nsw i32 %235, %236
  %238 = icmp sgt i32 %237, 1
  br i1 %238, label %239, label %280

239:                                              ; preds = %234
  %240 = load i32, ptr %25, align 4
  %241 = load i32, ptr %21, align 4
  %242 = sub nsw i32 %240, %241
  %243 = icmp sgt i32 %242, 1
  br i1 %243, label %244, label %280

244:                                              ; preds = %239
  %245 = load i32, ptr %20, align 4
  %246 = load i32, ptr %24, align 4
  %247 = sub nsw i32 %245, %246
  %248 = load i32, ptr %25, align 4
  %249 = load i32, ptr %21, align 4
  %250 = sub nsw i32 %248, %249
  %251 = sub nsw i32 %250, 1
  %252 = icmp slt i32 %247, %251
  br i1 %252, label %253, label %266

253:                                              ; preds = %244
  %254 = load i32, ptr %21, align 4
  %255 = add nsw i32 %254, 1
  %256 = load i32, ptr %23, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds [64 x i32], ptr %26, i64 0, i64 %257
  store i32 %255, ptr %258, align 4
  %259 = load i32, ptr %25, align 4
  %260 = load i32, ptr %23, align 4
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds [64 x i32], ptr %27, i64 0, i64 %261
  store i32 %259, ptr %262, align 4
  %263 = load i32, ptr %23, align 4
  %264 = add nsw i32 %263, 1
  store i32 %264, ptr %23, align 4
  %265 = load i32, ptr %20, align 4
  store i32 %265, ptr %25, align 4
  br label %279

266:                                              ; preds = %244
  %267 = load i32, ptr %24, align 4
  %268 = load i32, ptr %23, align 4
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds [64 x i32], ptr %26, i64 0, i64 %269
  store i32 %267, ptr %270, align 4
  %271 = load i32, ptr %20, align 4
  %272 = load i32, ptr %23, align 4
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds [64 x i32], ptr %27, i64 0, i64 %273
  store i32 %271, ptr %274, align 4
  %275 = load i32, ptr %23, align 4
  %276 = add nsw i32 %275, 1
  store i32 %276, ptr %23, align 4
  %277 = load i32, ptr %21, align 4
  %278 = add nsw i32 %277, 1
  store i32 %278, ptr %24, align 4
  br label %279

279:                                              ; preds = %266, %253
  br label %291

280:                                              ; preds = %239, %234
  %281 = load i32, ptr %20, align 4
  %282 = load i32, ptr %24, align 4
  %283 = sub nsw i32 %281, %282
  %284 = icmp sgt i32 %283, 1
  br i1 %284, label %285, label %287

285:                                              ; preds = %280
  %286 = load i32, ptr %20, align 4
  store i32 %286, ptr %25, align 4
  br label %290

287:                                              ; preds = %280
  %288 = load i32, ptr %21, align 4
  %289 = add nsw i32 %288, 1
  store i32 %289, ptr %24, align 4
  br label %290

290:                                              ; preds = %287, %285
  br label %291

291:                                              ; preds = %290, %279
  br label %61, !llvm.loop !69

292:                                              ; preds = %61
  %293 = load i32, ptr %25, align 4
  %294 = load i32, ptr %24, align 4
  %295 = sub nsw i32 %293, %294
  %296 = icmp eq i32 %295, 2
  br i1 %296, label %297, label %344

297:                                              ; preds = %292
  %298 = load i32, ptr %24, align 4
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %299
  %301 = load i32, ptr %300, align 4
  %302 = load i32, ptr %25, align 4
  %303 = sub nsw i32 %302, 1
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %304
  %306 = load i32, ptr %305, align 4
  %307 = icmp sgt i32 %301, %306
  br i1 %307, label %308, label %309

308:                                              ; preds = %297
  br label %322

309:                                              ; preds = %297
  %310 = load i32, ptr %24, align 4
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %311
  %313 = load i32, ptr %312, align 4
  %314 = load i32, ptr %25, align 4
  %315 = sub nsw i32 %314, 1
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %316
  %318 = load i32, ptr %317, align 4
  %319 = icmp slt i32 %313, %318
  %320 = zext i1 %319 to i64
  %321 = select i1 %319, i32 -1, i32 0
  br label %322

322:                                              ; preds = %309, %308
  %323 = phi i32 [ 1, %308 ], [ %321, %309 ]
  %324 = icmp sgt i32 %323, 0
  br i1 %324, label %325, label %343

325:                                              ; preds = %322
  %326 = load i32, ptr %24, align 4
  %327 = sext i32 %326 to i64
  %328 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %327
  %329 = load i32, ptr %328, align 4
  store i32 %329, ptr %32, align 4
  %330 = load i32, ptr %25, align 4
  %331 = sub nsw i32 %330, 1
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %332
  %334 = load i32, ptr %333, align 4
  %335 = load i32, ptr %24, align 4
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %336
  store i32 %334, ptr %337, align 4
  %338 = load i32, ptr %32, align 4
  %339 = load i32, ptr %25, align 4
  %340 = sub nsw i32 %339, 1
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds [100 x i32], ptr @array2, i64 0, i64 %341
  store i32 %338, ptr %342, align 4
  br label %343

343:                                              ; preds = %325, %322
  br label %344

344:                                              ; preds = %343, %292
  br label %47, !llvm.loop !70

345:                                              ; preds = %47
  call void @init_heap_beebs(ptr noundef @heap, i64 noundef 8192)
  store ptr null, ptr @the_list, align 8
  store i32 0, ptr %5, align 4
  br label %346

346:                                              ; preds = %358, %345
  %347 = load i32, ptr %5, align 4
  %348 = icmp slt i32 %347, 100
  br i1 %348, label %349, label %361

349:                                              ; preds = %346
  %350 = call ptr @malloc_beebs(i64 noundef 24)
  store ptr %350, ptr %6, align 8
  %351 = load i32, ptr %5, align 4
  %352 = sext i32 %351 to i64
  %353 = getelementptr inbounds [100 x i32], ptr @array, i64 0, i64 %352
  %354 = load i32, ptr %353, align 4
  %355 = load ptr, ptr %6, align 8
  %356 = getelementptr inbounds %struct.dllist, ptr %355, i32 0, i32 0
  store i32 %354, ptr %356, align 8
  %357 = load ptr, ptr %6, align 8
  call void @sglib_dllist_add(ptr noundef @the_list, ptr noundef %357)
  br label %358

358:                                              ; preds = %349
  %359 = load i32, ptr %5, align 4
  %360 = add nsw i32 %359, 1
  store i32 %360, ptr %5, align 4
  br label %346, !llvm.loop !71

361:                                              ; preds = %346
  call void @sglib_dllist_sort(ptr noundef @the_list)
  store volatile i32 0, ptr %3, align 4
  %362 = load ptr, ptr @the_list, align 8
  %363 = call ptr @sglib_dllist_get_first(ptr noundef %362)
  store ptr %363, ptr %6, align 8
  br label %364

364:                                              ; preds = %370, %361
  %365 = load ptr, ptr %6, align 8
  %366 = icmp ne ptr %365, null
  br i1 %366, label %367, label %374

367:                                              ; preds = %364
  %368 = load volatile i32, ptr %3, align 4
  %369 = add nsw i32 %368, 1
  store volatile i32 %369, ptr %3, align 4
  br label %370

370:                                              ; preds = %367
  %371 = load ptr, ptr %6, align 8
  %372 = getelementptr inbounds %struct.dllist, ptr %371, i32 0, i32 1
  %373 = load ptr, ptr %372, align 8
  store ptr %373, ptr %6, align 8
  br label %364, !llvm.loop !72

374:                                              ; preds = %364
  call void @sglib_hashed_ilist_init(ptr noundef @htab)
  store i32 0, ptr %5, align 4
  br label %375

375:                                              ; preds = %396, %374
  %376 = load i32, ptr %5, align 4
  %377 = icmp slt i32 %376, 100
  br i1 %377, label %378, label %399

378:                                              ; preds = %375
  %379 = load i32, ptr %5, align 4
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds [100 x i32], ptr @array, i64 0, i64 %380
  %382 = load i32, ptr %381, align 4
  %383 = getelementptr inbounds %struct.ilist, ptr %7, i32 0, i32 0
  store i32 %382, ptr %383, align 8
  %384 = call ptr @sglib_hashed_ilist_find_member(ptr noundef @htab, ptr noundef %7)
  %385 = icmp eq ptr %384, null
  br i1 %385, label %386, label %395

386:                                              ; preds = %378
  %387 = call ptr @malloc_beebs(i64 noundef 16)
  store ptr %387, ptr %8, align 8
  %388 = load i32, ptr %5, align 4
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds [100 x i32], ptr @array, i64 0, i64 %389
  %391 = load i32, ptr %390, align 4
  %392 = load ptr, ptr %8, align 8
  %393 = getelementptr inbounds %struct.ilist, ptr %392, i32 0, i32 0
  store i32 %391, ptr %393, align 8
  %394 = load ptr, ptr %8, align 8
  call void @sglib_hashed_ilist_add(ptr noundef @htab, ptr noundef %394)
  br label %395

395:                                              ; preds = %386, %378
  br label %396

396:                                              ; preds = %395
  %397 = load i32, ptr %5, align 4
  %398 = add nsw i32 %397, 1
  store i32 %398, ptr %5, align 4
  br label %375, !llvm.loop !73

399:                                              ; preds = %375
  %400 = call ptr @sglib_hashed_ilist_it_init(ptr noundef %10, ptr noundef @htab)
  store ptr %400, ptr %9, align 8
  br label %401

401:                                              ; preds = %407, %399
  %402 = load ptr, ptr %9, align 8
  %403 = icmp ne ptr %402, null
  br i1 %403, label %404, label %409

404:                                              ; preds = %401
  %405 = load volatile i32, ptr %3, align 4
  %406 = add nsw i32 %405, 1
  store volatile i32 %406, ptr %3, align 4
  br label %407

407:                                              ; preds = %404
  %408 = call ptr @sglib_hashed_ilist_it_next(ptr noundef %10)
  store ptr %408, ptr %9, align 8
  br label %401, !llvm.loop !74

409:                                              ; preds = %401
  store i32 0, ptr %12, align 4
  store i32 0, ptr %11, align 4
  store i32 0, ptr %5, align 4
  br label %410

410:                                              ; preds = %432, %409
  %411 = load i32, ptr %5, align 4
  %412 = icmp slt i32 %411, 100
  br i1 %412, label %413, label %435

413:                                              ; preds = %410
  %414 = load i32, ptr %5, align 4
  %415 = sext i32 %414 to i64
  %416 = getelementptr inbounds [100 x i32], ptr @array, i64 0, i64 %415
  %417 = load i32, ptr %416, align 4
  store i32 %417, ptr %13, align 4
  %418 = load i32, ptr %13, align 4
  %419 = load i32, ptr %12, align 4
  %420 = sext i32 %419 to i64
  %421 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %420
  store i32 %418, ptr %421, align 4
  %422 = load i32, ptr %11, align 4
  %423 = load i32, ptr %12, align 4
  %424 = add nsw i32 %423, 1
  %425 = srem i32 %424, 101
  %426 = icmp eq i32 %422, %425
  br i1 %426, label %427, label %428

427:                                              ; preds = %413
  br label %428

428:                                              ; preds = %427, %413
  %429 = load i32, ptr %12, align 4
  %430 = add nsw i32 %429, 1
  %431 = srem i32 %430, 101
  store i32 %431, ptr %12, align 4
  br label %432

432:                                              ; preds = %428
  %433 = load i32, ptr %5, align 4
  %434 = add nsw i32 %433, 1
  store i32 %434, ptr %5, align 4
  br label %410, !llvm.loop !75

435:                                              ; preds = %410
  br label %436

436:                                              ; preds = %452, %435
  %437 = load i32, ptr %11, align 4
  %438 = load i32, ptr %12, align 4
  %439 = icmp eq i32 %437, %438
  %440 = xor i1 %439, true
  br i1 %440, label %441, label %456

441:                                              ; preds = %436
  %442 = load i32, ptr %11, align 4
  %443 = sext i32 %442 to i64
  %444 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %443
  %445 = load i32, ptr %444, align 4
  %446 = load volatile i32, ptr %3, align 4
  %447 = add nsw i32 %446, %445
  store volatile i32 %447, ptr %3, align 4
  %448 = load i32, ptr %11, align 4
  %449 = load i32, ptr %12, align 4
  %450 = icmp eq i32 %448, %449
  br i1 %450, label %451, label %452

451:                                              ; preds = %441
  br label %452

452:                                              ; preds = %451, %441
  %453 = load i32, ptr %11, align 4
  %454 = add nsw i32 %453, 1
  %455 = srem i32 %454, 101
  store i32 %455, ptr %11, align 4
  br label %436, !llvm.loop !76

456:                                              ; preds = %436
  store i32 0, ptr %11, align 4
  store i32 0, ptr %5, align 4
  br label %457

457:                                              ; preds = %533, %456
  %458 = load i32, ptr %5, align 4
  %459 = icmp slt i32 %458, 100
  br i1 %459, label %460, label %536

460:                                              ; preds = %457
  %461 = load i32, ptr %5, align 4
  %462 = sext i32 %461 to i64
  %463 = getelementptr inbounds [100 x i32], ptr @array, i64 0, i64 %462
  %464 = load i32, ptr %463, align 4
  store i32 %464, ptr %13, align 4
  %465 = load i32, ptr %11, align 4
  %466 = icmp eq i32 %465, 101
  br i1 %466, label %467, label %468

467:                                              ; preds = %460
  br label %468

468:                                              ; preds = %467, %460
  %469 = load i32, ptr %13, align 4
  %470 = load i32, ptr %11, align 4
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %471
  store i32 %469, ptr %472, align 4
  %473 = load i32, ptr %11, align 4
  %474 = icmp eq i32 %473, 101
  br i1 %474, label %475, label %476

475:                                              ; preds = %468
  br label %476

476:                                              ; preds = %475, %468
  %477 = load i32, ptr %11, align 4
  %478 = add nsw i32 %477, 1
  store i32 %478, ptr %11, align 4
  store i32 %477, ptr %33, align 4
  br label %479

479:                                              ; preds = %512, %476
  %480 = load i32, ptr %33, align 4
  %481 = icmp sgt i32 %480, 0
  br i1 %481, label %482, label %510

482:                                              ; preds = %479
  %483 = load i32, ptr %33, align 4
  %484 = sdiv i32 %483, 2
  %485 = sext i32 %484 to i64
  %486 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %485
  %487 = load i32, ptr %486, align 4
  %488 = load i32, ptr %33, align 4
  %489 = sext i32 %488 to i64
  %490 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %489
  %491 = load i32, ptr %490, align 4
  %492 = icmp sgt i32 %487, %491
  br i1 %492, label %493, label %494

493:                                              ; preds = %482
  br label %507

494:                                              ; preds = %482
  %495 = load i32, ptr %33, align 4
  %496 = sdiv i32 %495, 2
  %497 = sext i32 %496 to i64
  %498 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %497
  %499 = load i32, ptr %498, align 4
  %500 = load i32, ptr %33, align 4
  %501 = sext i32 %500 to i64
  %502 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %501
  %503 = load i32, ptr %502, align 4
  %504 = icmp slt i32 %499, %503
  %505 = zext i1 %504 to i64
  %506 = select i1 %504, i32 -1, i32 0
  br label %507

507:                                              ; preds = %494, %493
  %508 = phi i32 [ 1, %493 ], [ %506, %494 ]
  %509 = icmp slt i32 %508, 0
  br label %510

510:                                              ; preds = %507, %479
  %511 = phi i1 [ false, %479 ], [ %509, %507 ]
  br i1 %511, label %512, label %532

512:                                              ; preds = %510
  %513 = load i32, ptr %33, align 4
  %514 = sdiv i32 %513, 2
  %515 = sext i32 %514 to i64
  %516 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %515
  %517 = load i32, ptr %516, align 4
  store i32 %517, ptr %34, align 4
  %518 = load i32, ptr %33, align 4
  %519 = sext i32 %518 to i64
  %520 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %519
  %521 = load i32, ptr %520, align 4
  %522 = load i32, ptr %33, align 4
  %523 = sdiv i32 %522, 2
  %524 = sext i32 %523 to i64
  %525 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %524
  store i32 %521, ptr %525, align 4
  %526 = load i32, ptr %34, align 4
  %527 = load i32, ptr %33, align 4
  %528 = sext i32 %527 to i64
  %529 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %528
  store i32 %526, ptr %529, align 4
  %530 = load i32, ptr %33, align 4
  %531 = sdiv i32 %530, 2
  store i32 %531, ptr %33, align 4
  br label %479, !llvm.loop !77

532:                                              ; preds = %510
  br label %533

533:                                              ; preds = %532
  %534 = load i32, ptr %5, align 4
  %535 = add nsw i32 %534, 1
  store i32 %535, ptr %5, align 4
  br label %457, !llvm.loop !78

536:                                              ; preds = %457
  br label %537

537:                                              ; preds = %655, %536
  %538 = load i32, ptr %11, align 4
  %539 = icmp eq i32 %538, 0
  %540 = xor i1 %539, true
  br i1 %540, label %541, label %656

541:                                              ; preds = %537
  %542 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 0
  %543 = load i32, ptr %542, align 4
  %544 = load volatile i32, ptr %3, align 4
  %545 = add nsw i32 %544, %543
  store volatile i32 %545, ptr %3, align 4
  %546 = load i32, ptr %11, align 4
  %547 = icmp eq i32 %546, 0
  br i1 %547, label %548, label %549

548:                                              ; preds = %541
  br label %549

549:                                              ; preds = %548, %541
  %550 = load i32, ptr %11, align 4
  %551 = add nsw i32 %550, -1
  store i32 %551, ptr %11, align 4
  %552 = load i32, ptr %11, align 4
  %553 = sext i32 %552 to i64
  %554 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %553
  %555 = load i32, ptr %554, align 4
  %556 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 0
  store i32 %555, ptr %556, align 4
  store i32 0, ptr %38, align 4
  %557 = load i32, ptr %38, align 4
  store i32 %557, ptr %35, align 4
  br label %558

558:                                              ; preds = %651, %549
  %559 = load i32, ptr %35, align 4
  store i32 %559, ptr %38, align 4
  %560 = load i32, ptr %38, align 4
  %561 = mul nsw i32 2, %560
  %562 = add nsw i32 %561, 1
  store i32 %562, ptr %36, align 4
  %563 = load i32, ptr %36, align 4
  %564 = add nsw i32 %563, 1
  store i32 %564, ptr %37, align 4
  %565 = load i32, ptr %36, align 4
  %566 = load i32, ptr %11, align 4
  %567 = icmp slt i32 %565, %566
  br i1 %567, label %568, label %630

568:                                              ; preds = %558
  %569 = load i32, ptr %35, align 4
  %570 = sext i32 %569 to i64
  %571 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %570
  %572 = load i32, ptr %571, align 4
  %573 = load i32, ptr %36, align 4
  %574 = sext i32 %573 to i64
  %575 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %574
  %576 = load i32, ptr %575, align 4
  %577 = icmp sgt i32 %572, %576
  br i1 %577, label %578, label %579

578:                                              ; preds = %568
  br label %591

579:                                              ; preds = %568
  %580 = load i32, ptr %35, align 4
  %581 = sext i32 %580 to i64
  %582 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %581
  %583 = load i32, ptr %582, align 4
  %584 = load i32, ptr %36, align 4
  %585 = sext i32 %584 to i64
  %586 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %585
  %587 = load i32, ptr %586, align 4
  %588 = icmp slt i32 %583, %587
  %589 = zext i1 %588 to i64
  %590 = select i1 %588, i32 -1, i32 0
  br label %591

591:                                              ; preds = %579, %578
  %592 = phi i32 [ 1, %578 ], [ %590, %579 ]
  %593 = icmp slt i32 %592, 0
  br i1 %593, label %594, label %596

594:                                              ; preds = %591
  %595 = load i32, ptr %36, align 4
  store i32 %595, ptr %35, align 4
  br label %596

596:                                              ; preds = %594, %591
  %597 = load i32, ptr %37, align 4
  %598 = load i32, ptr %11, align 4
  %599 = icmp slt i32 %597, %598
  br i1 %599, label %600, label %629

600:                                              ; preds = %596
  %601 = load i32, ptr %35, align 4
  %602 = sext i32 %601 to i64
  %603 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %602
  %604 = load i32, ptr %603, align 4
  %605 = load i32, ptr %37, align 4
  %606 = sext i32 %605 to i64
  %607 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %606
  %608 = load i32, ptr %607, align 4
  %609 = icmp sgt i32 %604, %608
  br i1 %609, label %610, label %611

610:                                              ; preds = %600
  br label %623

611:                                              ; preds = %600
  %612 = load i32, ptr %35, align 4
  %613 = sext i32 %612 to i64
  %614 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %613
  %615 = load i32, ptr %614, align 4
  %616 = load i32, ptr %37, align 4
  %617 = sext i32 %616 to i64
  %618 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %617
  %619 = load i32, ptr %618, align 4
  %620 = icmp slt i32 %615, %619
  %621 = zext i1 %620 to i64
  %622 = select i1 %620, i32 -1, i32 0
  br label %623

623:                                              ; preds = %611, %610
  %624 = phi i32 [ 1, %610 ], [ %622, %611 ]
  %625 = icmp slt i32 %624, 0
  br i1 %625, label %626, label %628

626:                                              ; preds = %623
  %627 = load i32, ptr %37, align 4
  store i32 %627, ptr %35, align 4
  br label %628

628:                                              ; preds = %626, %623
  br label %629

629:                                              ; preds = %628, %596
  br label %630

630:                                              ; preds = %629, %558
  %631 = load i32, ptr %35, align 4
  %632 = load i32, ptr %38, align 4
  %633 = icmp ne i32 %631, %632
  br i1 %633, label %634, label %650

634:                                              ; preds = %630
  %635 = load i32, ptr %38, align 4
  %636 = sext i32 %635 to i64
  %637 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %636
  %638 = load i32, ptr %637, align 4
  store i32 %638, ptr %39, align 4
  %639 = load i32, ptr %35, align 4
  %640 = sext i32 %639 to i64
  %641 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %640
  %642 = load i32, ptr %641, align 4
  %643 = load i32, ptr %38, align 4
  %644 = sext i32 %643 to i64
  %645 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %644
  store i32 %642, ptr %645, align 4
  %646 = load i32, ptr %39, align 4
  %647 = load i32, ptr %35, align 4
  %648 = sext i32 %647 to i64
  %649 = getelementptr inbounds [101 x i32], ptr %14, i64 0, i64 %648
  store i32 %646, ptr %649, align 4
  br label %650

650:                                              ; preds = %634, %630
  br label %651

651:                                              ; preds = %650
  %652 = load i32, ptr %35, align 4
  %653 = load i32, ptr %38, align 4
  %654 = icmp ne i32 %652, %653
  br i1 %654, label %558, label %655, !llvm.loop !79

655:                                              ; preds = %651
  br label %537, !llvm.loop !80

656:                                              ; preds = %537
  store ptr null, ptr %17, align 8
  store i32 0, ptr %5, align 4
  br label %657

657:                                              ; preds = %679, %656
  %658 = load i32, ptr %5, align 4
  %659 = icmp slt i32 %658, 100
  br i1 %659, label %660, label %682

660:                                              ; preds = %657
  %661 = load i32, ptr %5, align 4
  %662 = sext i32 %661 to i64
  %663 = getelementptr inbounds [100 x i32], ptr @array, i64 0, i64 %662
  %664 = load i32, ptr %663, align 4
  %665 = getelementptr inbounds %struct.rbtree, ptr %15, i32 0, i32 0
  store i32 %664, ptr %665, align 8
  %666 = load ptr, ptr %17, align 8
  %667 = call ptr @sglib_rbtree_find_member(ptr noundef %666, ptr noundef %15)
  %668 = icmp eq ptr %667, null
  br i1 %668, label %669, label %678

669:                                              ; preds = %660
  %670 = call ptr @malloc_beebs(i64 noundef 24)
  store ptr %670, ptr %16, align 8
  %671 = load i32, ptr %5, align 4
  %672 = sext i32 %671 to i64
  %673 = getelementptr inbounds [100 x i32], ptr @array, i64 0, i64 %672
  %674 = load i32, ptr %673, align 4
  %675 = load ptr, ptr %16, align 8
  %676 = getelementptr inbounds %struct.rbtree, ptr %675, i32 0, i32 0
  store i32 %674, ptr %676, align 8
  %677 = load ptr, ptr %16, align 8
  call void @sglib_rbtree_add(ptr noundef %17, ptr noundef %677)
  br label %678

678:                                              ; preds = %669, %660
  br label %679

679:                                              ; preds = %678
  %680 = load i32, ptr %5, align 4
  %681 = add nsw i32 %680, 1
  store i32 %681, ptr %5, align 4
  br label %657, !llvm.loop !81

682:                                              ; preds = %657
  %683 = load ptr, ptr %17, align 8
  %684 = call ptr @sglib_rbtree_it_init_inorder(ptr noundef %19, ptr noundef %683)
  store ptr %684, ptr %18, align 8
  br label %685

685:                                              ; preds = %694, %682
  %686 = load ptr, ptr %18, align 8
  %687 = icmp ne ptr %686, null
  br i1 %687, label %688, label %696

688:                                              ; preds = %685
  %689 = load ptr, ptr %18, align 8
  %690 = getelementptr inbounds %struct.rbtree, ptr %689, i32 0, i32 0
  %691 = load i32, ptr %690, align 8
  %692 = load volatile i32, ptr %3, align 4
  %693 = add nsw i32 %692, %691
  store volatile i32 %693, ptr %3, align 4
  br label %694

694:                                              ; preds = %688
  %695 = call ptr @sglib_rbtree_it_next(ptr noundef %19)
  store ptr %695, ptr %18, align 8
  br label %685, !llvm.loop !82

696:                                              ; preds = %685
  br label %697

697:                                              ; preds = %696
  %698 = load i32, ptr %4, align 4
  %699 = add nsw i32 %698, 1
  store i32 %699, ptr %4, align 4
  br label %40, !llvm.loop !83

700:                                              ; preds = %40
  %701 = load volatile i32, ptr %3, align 4
  ret i32 %701
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @benchmark() #0 {
  %1 = call i32 @benchmark_body(i32 noundef 29000)
  ret i32 %1
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

; Function Attrs: noinline nounwind noinline uwtable
define internal void @sglib___rbtree_fix_left_insertion_discrepancy(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %3, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.rbtree, ptr %15, i32 0, i32 2
  %17 = load ptr, ptr %16, align 8
  store ptr %17, ptr %4, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.rbtree, ptr %18, i32 0, i32 3
  %20 = load ptr, ptr %19, align 8
  %21 = icmp ne ptr %20, null
  br i1 %21, label %22, label %75

22:                                               ; preds = %1
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.rbtree, ptr %23, i32 0, i32 3
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds %struct.rbtree, ptr %25, i32 0, i32 1
  %27 = load i8, ptr %26, align 4
  %28 = zext i8 %27 to i32
  %29 = icmp eq i32 %28, 1
  br i1 %29, label %30, label %75

30:                                               ; preds = %22
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds %struct.rbtree, ptr %31, i32 0, i32 1
  %33 = load i8, ptr %32, align 4
  %34 = zext i8 %33 to i32
  %35 = icmp eq i32 %34, 1
  br i1 %35, label %36, label %74

36:                                               ; preds = %30
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds %struct.rbtree, ptr %37, i32 0, i32 2
  %39 = load ptr, ptr %38, align 8
  %40 = icmp ne ptr %39, null
  br i1 %40, label %41, label %49

41:                                               ; preds = %36
  %42 = load ptr, ptr %4, align 8
  %43 = getelementptr inbounds %struct.rbtree, ptr %42, i32 0, i32 2
  %44 = load ptr, ptr %43, align 8
  %45 = getelementptr inbounds %struct.rbtree, ptr %44, i32 0, i32 1
  %46 = load i8, ptr %45, align 4
  %47 = zext i8 %46 to i32
  %48 = icmp eq i32 %47, 1
  br i1 %48, label %62, label %49

49:                                               ; preds = %41, %36
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds %struct.rbtree, ptr %50, i32 0, i32 3
  %52 = load ptr, ptr %51, align 8
  %53 = icmp ne ptr %52, null
  br i1 %53, label %54, label %73

54:                                               ; preds = %49
  %55 = load ptr, ptr %4, align 8
  %56 = getelementptr inbounds %struct.rbtree, ptr %55, i32 0, i32 3
  %57 = load ptr, ptr %56, align 8
  %58 = getelementptr inbounds %struct.rbtree, ptr %57, i32 0, i32 1
  %59 = load i8, ptr %58, align 4
  %60 = zext i8 %59 to i32
  %61 = icmp eq i32 %60, 1
  br i1 %61, label %62, label %73

62:                                               ; preds = %54, %41
  %63 = load ptr, ptr %3, align 8
  %64 = getelementptr inbounds %struct.rbtree, ptr %63, i32 0, i32 2
  %65 = load ptr, ptr %64, align 8
  %66 = getelementptr inbounds %struct.rbtree, ptr %65, i32 0, i32 1
  store i8 0, ptr %66, align 4
  %67 = load ptr, ptr %3, align 8
  %68 = getelementptr inbounds %struct.rbtree, ptr %67, i32 0, i32 3
  %69 = load ptr, ptr %68, align 8
  %70 = getelementptr inbounds %struct.rbtree, ptr %69, i32 0, i32 1
  store i8 0, ptr %70, align 4
  %71 = load ptr, ptr %3, align 8
  %72 = getelementptr inbounds %struct.rbtree, ptr %71, i32 0, i32 1
  store i8 1, ptr %72, align 4
  br label %73

73:                                               ; preds = %62, %54, %49
  br label %74

74:                                               ; preds = %73, %30
  br label %170

75:                                               ; preds = %22, %1
  %76 = load ptr, ptr %4, align 8
  %77 = getelementptr inbounds %struct.rbtree, ptr %76, i32 0, i32 1
  %78 = load i8, ptr %77, align 4
  %79 = zext i8 %78 to i32
  %80 = icmp eq i32 %79, 1
  br i1 %80, label %81, label %169

81:                                               ; preds = %75
  %82 = load ptr, ptr %4, align 8
  %83 = getelementptr inbounds %struct.rbtree, ptr %82, i32 0, i32 2
  %84 = load ptr, ptr %83, align 8
  %85 = icmp ne ptr %84, null
  br i1 %85, label %86, label %118

86:                                               ; preds = %81
  %87 = load ptr, ptr %4, align 8
  %88 = getelementptr inbounds %struct.rbtree, ptr %87, i32 0, i32 2
  %89 = load ptr, ptr %88, align 8
  %90 = getelementptr inbounds %struct.rbtree, ptr %89, i32 0, i32 1
  %91 = load i8, ptr %90, align 4
  %92 = zext i8 %91 to i32
  %93 = icmp eq i32 %92, 1
  br i1 %93, label %94, label %118

94:                                               ; preds = %86
  %95 = load ptr, ptr %3, align 8
  store ptr %95, ptr %5, align 8
  %96 = load ptr, ptr %4, align 8
  store ptr %96, ptr %6, align 8
  %97 = load ptr, ptr %4, align 8
  %98 = getelementptr inbounds %struct.rbtree, ptr %97, i32 0, i32 2
  %99 = load ptr, ptr %98, align 8
  store ptr %99, ptr %7, align 8
  %100 = load ptr, ptr %6, align 8
  %101 = getelementptr inbounds %struct.rbtree, ptr %100, i32 0, i32 3
  %102 = load ptr, ptr %101, align 8
  store ptr %102, ptr %10, align 8
  %103 = load ptr, ptr %10, align 8
  %104 = load ptr, ptr %5, align 8
  %105 = getelementptr inbounds %struct.rbtree, ptr %104, i32 0, i32 2
  store ptr %103, ptr %105, align 8
  %106 = load ptr, ptr %7, align 8
  %107 = load ptr, ptr %6, align 8
  %108 = getelementptr inbounds %struct.rbtree, ptr %107, i32 0, i32 2
  store ptr %106, ptr %108, align 8
  %109 = load ptr, ptr %5, align 8
  %110 = load ptr, ptr %6, align 8
  %111 = getelementptr inbounds %struct.rbtree, ptr %110, i32 0, i32 3
  store ptr %109, ptr %111, align 8
  %112 = load ptr, ptr %5, align 8
  %113 = getelementptr inbounds %struct.rbtree, ptr %112, i32 0, i32 1
  store i8 1, ptr %113, align 4
  %114 = load ptr, ptr %6, align 8
  %115 = getelementptr inbounds %struct.rbtree, ptr %114, i32 0, i32 1
  store i8 0, ptr %115, align 4
  %116 = load ptr, ptr %6, align 8
  %117 = load ptr, ptr %2, align 8
  store ptr %116, ptr %117, align 8
  br label %168

118:                                              ; preds = %86, %81
  %119 = load ptr, ptr %4, align 8
  %120 = getelementptr inbounds %struct.rbtree, ptr %119, i32 0, i32 3
  %121 = load ptr, ptr %120, align 8
  %122 = icmp ne ptr %121, null
  br i1 %122, label %123, label %167

123:                                              ; preds = %118
  %124 = load ptr, ptr %4, align 8
  %125 = getelementptr inbounds %struct.rbtree, ptr %124, i32 0, i32 3
  %126 = load ptr, ptr %125, align 8
  %127 = getelementptr inbounds %struct.rbtree, ptr %126, i32 0, i32 1
  %128 = load i8, ptr %127, align 4
  %129 = zext i8 %128 to i32
  %130 = icmp eq i32 %129, 1
  br i1 %130, label %131, label %167

131:                                              ; preds = %123
  %132 = load ptr, ptr %3, align 8
  store ptr %132, ptr %5, align 8
  %133 = load ptr, ptr %4, align 8
  store ptr %133, ptr %6, align 8
  %134 = load ptr, ptr %5, align 8
  %135 = getelementptr inbounds %struct.rbtree, ptr %134, i32 0, i32 3
  %136 = load ptr, ptr %135, align 8
  store ptr %136, ptr %8, align 8
  %137 = load ptr, ptr %6, align 8
  %138 = getelementptr inbounds %struct.rbtree, ptr %137, i32 0, i32 2
  %139 = load ptr, ptr %138, align 8
  store ptr %139, ptr %9, align 8
  %140 = load ptr, ptr %6, align 8
  %141 = getelementptr inbounds %struct.rbtree, ptr %140, i32 0, i32 3
  %142 = load ptr, ptr %141, align 8
  store ptr %142, ptr %7, align 8
  %143 = load ptr, ptr %7, align 8
  %144 = getelementptr inbounds %struct.rbtree, ptr %143, i32 0, i32 2
  %145 = load ptr, ptr %144, align 8
  store ptr %145, ptr %11, align 8
  %146 = load ptr, ptr %7, align 8
  %147 = getelementptr inbounds %struct.rbtree, ptr %146, i32 0, i32 3
  %148 = load ptr, ptr %147, align 8
  store ptr %148, ptr %12, align 8
  %149 = load ptr, ptr %11, align 8
  %150 = load ptr, ptr %6, align 8
  %151 = getelementptr inbounds %struct.rbtree, ptr %150, i32 0, i32 3
  store ptr %149, ptr %151, align 8
  %152 = load ptr, ptr %12, align 8
  %153 = load ptr, ptr %5, align 8
  %154 = getelementptr inbounds %struct.rbtree, ptr %153, i32 0, i32 2
  store ptr %152, ptr %154, align 8
  %155 = load ptr, ptr %6, align 8
  %156 = load ptr, ptr %7, align 8
  %157 = getelementptr inbounds %struct.rbtree, ptr %156, i32 0, i32 2
  store ptr %155, ptr %157, align 8
  %158 = load ptr, ptr %5, align 8
  %159 = load ptr, ptr %7, align 8
  %160 = getelementptr inbounds %struct.rbtree, ptr %159, i32 0, i32 3
  store ptr %158, ptr %160, align 8
  %161 = load ptr, ptr %7, align 8
  %162 = getelementptr inbounds %struct.rbtree, ptr %161, i32 0, i32 1
  store i8 0, ptr %162, align 4
  %163 = load ptr, ptr %5, align 8
  %164 = getelementptr inbounds %struct.rbtree, ptr %163, i32 0, i32 1
  store i8 1, ptr %164, align 4
  %165 = load ptr, ptr %7, align 8
  %166 = load ptr, ptr %2, align 8
  store ptr %165, ptr %166, align 8
  br label %167

167:                                              ; preds = %131, %123, %118
  br label %168

168:                                              ; preds = %167, %94
  br label %169

169:                                              ; preds = %168, %75
  br label %170

170:                                              ; preds = %169, %74
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define internal void @sglib___rbtree_fix_right_insertion_discrepancy(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %3, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.rbtree, ptr %15, i32 0, i32 3
  %17 = load ptr, ptr %16, align 8
  store ptr %17, ptr %4, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.rbtree, ptr %18, i32 0, i32 2
  %20 = load ptr, ptr %19, align 8
  %21 = icmp ne ptr %20, null
  br i1 %21, label %22, label %75

22:                                               ; preds = %1
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.rbtree, ptr %23, i32 0, i32 2
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds %struct.rbtree, ptr %25, i32 0, i32 1
  %27 = load i8, ptr %26, align 4
  %28 = zext i8 %27 to i32
  %29 = icmp eq i32 %28, 1
  br i1 %29, label %30, label %75

30:                                               ; preds = %22
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds %struct.rbtree, ptr %31, i32 0, i32 1
  %33 = load i8, ptr %32, align 4
  %34 = zext i8 %33 to i32
  %35 = icmp eq i32 %34, 1
  br i1 %35, label %36, label %74

36:                                               ; preds = %30
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds %struct.rbtree, ptr %37, i32 0, i32 3
  %39 = load ptr, ptr %38, align 8
  %40 = icmp ne ptr %39, null
  br i1 %40, label %41, label %49

41:                                               ; preds = %36
  %42 = load ptr, ptr %4, align 8
  %43 = getelementptr inbounds %struct.rbtree, ptr %42, i32 0, i32 3
  %44 = load ptr, ptr %43, align 8
  %45 = getelementptr inbounds %struct.rbtree, ptr %44, i32 0, i32 1
  %46 = load i8, ptr %45, align 4
  %47 = zext i8 %46 to i32
  %48 = icmp eq i32 %47, 1
  br i1 %48, label %62, label %49

49:                                               ; preds = %41, %36
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds %struct.rbtree, ptr %50, i32 0, i32 2
  %52 = load ptr, ptr %51, align 8
  %53 = icmp ne ptr %52, null
  br i1 %53, label %54, label %73

54:                                               ; preds = %49
  %55 = load ptr, ptr %4, align 8
  %56 = getelementptr inbounds %struct.rbtree, ptr %55, i32 0, i32 2
  %57 = load ptr, ptr %56, align 8
  %58 = getelementptr inbounds %struct.rbtree, ptr %57, i32 0, i32 1
  %59 = load i8, ptr %58, align 4
  %60 = zext i8 %59 to i32
  %61 = icmp eq i32 %60, 1
  br i1 %61, label %62, label %73

62:                                               ; preds = %54, %41
  %63 = load ptr, ptr %3, align 8
  %64 = getelementptr inbounds %struct.rbtree, ptr %63, i32 0, i32 3
  %65 = load ptr, ptr %64, align 8
  %66 = getelementptr inbounds %struct.rbtree, ptr %65, i32 0, i32 1
  store i8 0, ptr %66, align 4
  %67 = load ptr, ptr %3, align 8
  %68 = getelementptr inbounds %struct.rbtree, ptr %67, i32 0, i32 2
  %69 = load ptr, ptr %68, align 8
  %70 = getelementptr inbounds %struct.rbtree, ptr %69, i32 0, i32 1
  store i8 0, ptr %70, align 4
  %71 = load ptr, ptr %3, align 8
  %72 = getelementptr inbounds %struct.rbtree, ptr %71, i32 0, i32 1
  store i8 1, ptr %72, align 4
  br label %73

73:                                               ; preds = %62, %54, %49
  br label %74

74:                                               ; preds = %73, %30
  br label %170

75:                                               ; preds = %22, %1
  %76 = load ptr, ptr %4, align 8
  %77 = getelementptr inbounds %struct.rbtree, ptr %76, i32 0, i32 1
  %78 = load i8, ptr %77, align 4
  %79 = zext i8 %78 to i32
  %80 = icmp eq i32 %79, 1
  br i1 %80, label %81, label %169

81:                                               ; preds = %75
  %82 = load ptr, ptr %4, align 8
  %83 = getelementptr inbounds %struct.rbtree, ptr %82, i32 0, i32 3
  %84 = load ptr, ptr %83, align 8
  %85 = icmp ne ptr %84, null
  br i1 %85, label %86, label %118

86:                                               ; preds = %81
  %87 = load ptr, ptr %4, align 8
  %88 = getelementptr inbounds %struct.rbtree, ptr %87, i32 0, i32 3
  %89 = load ptr, ptr %88, align 8
  %90 = getelementptr inbounds %struct.rbtree, ptr %89, i32 0, i32 1
  %91 = load i8, ptr %90, align 4
  %92 = zext i8 %91 to i32
  %93 = icmp eq i32 %92, 1
  br i1 %93, label %94, label %118

94:                                               ; preds = %86
  %95 = load ptr, ptr %3, align 8
  store ptr %95, ptr %5, align 8
  %96 = load ptr, ptr %4, align 8
  store ptr %96, ptr %6, align 8
  %97 = load ptr, ptr %4, align 8
  %98 = getelementptr inbounds %struct.rbtree, ptr %97, i32 0, i32 3
  %99 = load ptr, ptr %98, align 8
  store ptr %99, ptr %7, align 8
  %100 = load ptr, ptr %6, align 8
  %101 = getelementptr inbounds %struct.rbtree, ptr %100, i32 0, i32 2
  %102 = load ptr, ptr %101, align 8
  store ptr %102, ptr %10, align 8
  %103 = load ptr, ptr %10, align 8
  %104 = load ptr, ptr %5, align 8
  %105 = getelementptr inbounds %struct.rbtree, ptr %104, i32 0, i32 3
  store ptr %103, ptr %105, align 8
  %106 = load ptr, ptr %7, align 8
  %107 = load ptr, ptr %6, align 8
  %108 = getelementptr inbounds %struct.rbtree, ptr %107, i32 0, i32 3
  store ptr %106, ptr %108, align 8
  %109 = load ptr, ptr %5, align 8
  %110 = load ptr, ptr %6, align 8
  %111 = getelementptr inbounds %struct.rbtree, ptr %110, i32 0, i32 2
  store ptr %109, ptr %111, align 8
  %112 = load ptr, ptr %5, align 8
  %113 = getelementptr inbounds %struct.rbtree, ptr %112, i32 0, i32 1
  store i8 1, ptr %113, align 4
  %114 = load ptr, ptr %6, align 8
  %115 = getelementptr inbounds %struct.rbtree, ptr %114, i32 0, i32 1
  store i8 0, ptr %115, align 4
  %116 = load ptr, ptr %6, align 8
  %117 = load ptr, ptr %2, align 8
  store ptr %116, ptr %117, align 8
  br label %168

118:                                              ; preds = %86, %81
  %119 = load ptr, ptr %4, align 8
  %120 = getelementptr inbounds %struct.rbtree, ptr %119, i32 0, i32 2
  %121 = load ptr, ptr %120, align 8
  %122 = icmp ne ptr %121, null
  br i1 %122, label %123, label %167

123:                                              ; preds = %118
  %124 = load ptr, ptr %4, align 8
  %125 = getelementptr inbounds %struct.rbtree, ptr %124, i32 0, i32 2
  %126 = load ptr, ptr %125, align 8
  %127 = getelementptr inbounds %struct.rbtree, ptr %126, i32 0, i32 1
  %128 = load i8, ptr %127, align 4
  %129 = zext i8 %128 to i32
  %130 = icmp eq i32 %129, 1
  br i1 %130, label %131, label %167

131:                                              ; preds = %123
  %132 = load ptr, ptr %3, align 8
  store ptr %132, ptr %5, align 8
  %133 = load ptr, ptr %4, align 8
  store ptr %133, ptr %6, align 8
  %134 = load ptr, ptr %5, align 8
  %135 = getelementptr inbounds %struct.rbtree, ptr %134, i32 0, i32 2
  %136 = load ptr, ptr %135, align 8
  store ptr %136, ptr %8, align 8
  %137 = load ptr, ptr %6, align 8
  %138 = getelementptr inbounds %struct.rbtree, ptr %137, i32 0, i32 3
  %139 = load ptr, ptr %138, align 8
  store ptr %139, ptr %9, align 8
  %140 = load ptr, ptr %6, align 8
  %141 = getelementptr inbounds %struct.rbtree, ptr %140, i32 0, i32 2
  %142 = load ptr, ptr %141, align 8
  store ptr %142, ptr %7, align 8
  %143 = load ptr, ptr %7, align 8
  %144 = getelementptr inbounds %struct.rbtree, ptr %143, i32 0, i32 3
  %145 = load ptr, ptr %144, align 8
  store ptr %145, ptr %11, align 8
  %146 = load ptr, ptr %7, align 8
  %147 = getelementptr inbounds %struct.rbtree, ptr %146, i32 0, i32 2
  %148 = load ptr, ptr %147, align 8
  store ptr %148, ptr %12, align 8
  %149 = load ptr, ptr %11, align 8
  %150 = load ptr, ptr %6, align 8
  %151 = getelementptr inbounds %struct.rbtree, ptr %150, i32 0, i32 2
  store ptr %149, ptr %151, align 8
  %152 = load ptr, ptr %12, align 8
  %153 = load ptr, ptr %5, align 8
  %154 = getelementptr inbounds %struct.rbtree, ptr %153, i32 0, i32 3
  store ptr %152, ptr %154, align 8
  %155 = load ptr, ptr %6, align 8
  %156 = load ptr, ptr %7, align 8
  %157 = getelementptr inbounds %struct.rbtree, ptr %156, i32 0, i32 3
  store ptr %155, ptr %157, align 8
  %158 = load ptr, ptr %5, align 8
  %159 = load ptr, ptr %7, align 8
  %160 = getelementptr inbounds %struct.rbtree, ptr %159, i32 0, i32 2
  store ptr %158, ptr %160, align 8
  %161 = load ptr, ptr %7, align 8
  %162 = getelementptr inbounds %struct.rbtree, ptr %161, i32 0, i32 1
  store i8 0, ptr %162, align 4
  %163 = load ptr, ptr %5, align 8
  %164 = getelementptr inbounds %struct.rbtree, ptr %163, i32 0, i32 1
  store i8 1, ptr %164, align 4
  %165 = load ptr, ptr %7, align 8
  %166 = load ptr, ptr %2, align 8
  store ptr %165, ptr %166, align 8
  br label %167

167:                                              ; preds = %131, %123, %118
  br label %168

168:                                              ; preds = %167, %94
  br label %169

169:                                              ; preds = %168, %75
  br label %170

170:                                              ; preds = %169, %74
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

attributes #0 = { noinline nounwind noinline uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nounwind willreturn memory(read) }

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
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
!26 = distinct !{!26, !7}
!27 = distinct !{!27, !7}
!28 = distinct !{!28, !7}
!29 = distinct !{!29, !7}
!30 = distinct !{!30, !7}
!31 = distinct !{!31, !7}
!32 = distinct !{!32, !7}
!33 = distinct !{!33, !7}
!34 = distinct !{!34, !7}
!35 = distinct !{!35, !7}
!36 = distinct !{!36, !7}
!37 = distinct !{!37, !7}
!38 = distinct !{!38, !7}
!39 = distinct !{!39, !7}
!40 = distinct !{!40, !7}
!41 = distinct !{!41, !7}
!42 = distinct !{!42, !7}
!43 = distinct !{!43, !7}
!44 = distinct !{!44, !7}
!45 = distinct !{!45, !7}
!46 = distinct !{!46, !7}
!47 = distinct !{!47, !7}
!48 = distinct !{!48, !7}
!49 = distinct !{!49, !7}
!50 = distinct !{!50, !7}
!51 = distinct !{!51, !7}
!52 = distinct !{!52, !7}
!53 = distinct !{!53, !7}
!54 = distinct !{!54, !7}
!55 = distinct !{!55, !7}
!56 = distinct !{!56, !7}
!57 = distinct !{!57, !7}
!58 = distinct !{!58, !7}
!59 = distinct !{!59, !7}
!60 = distinct !{!60, !7}
!61 = distinct !{!61, !7}
!62 = distinct !{!62, !7}
!63 = distinct !{!63, !7}
!64 = distinct !{!64, !7}
!65 = distinct !{!65, !7}
!66 = distinct !{!66, !7}
!67 = distinct !{!67, !7}
!68 = distinct !{!68, !7}
!69 = distinct !{!69, !7}
!70 = distinct !{!70, !7}
!71 = distinct !{!71, !7}
!72 = distinct !{!72, !7}
!73 = distinct !{!73, !7}
!74 = distinct !{!74, !7}
!75 = distinct !{!75, !7}
!76 = distinct !{!76, !7}
!77 = distinct !{!77, !7}
!78 = distinct !{!78, !7}
!79 = distinct !{!79, !7}
!80 = distinct !{!80, !7}
!81 = distinct !{!81, !7}
!82 = distinct !{!82, !7}
!83 = distinct !{!83, !7}
