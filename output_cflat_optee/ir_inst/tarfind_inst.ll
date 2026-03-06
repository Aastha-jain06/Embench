; ModuleID = './output_cflat_optee/ir/tarfind.ll'
source_filename = "./embench-iot-benchmarks-backup/tarfind.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

%struct.tar_header_t = type { [100 x i8], [8 x i8], [8 x i8], [8 x i8], [12 x i8], [12 x i8], [8 x i8], i8, [100 x i8] }

@seed = internal global i64 0, align 8
@heap_ptr = internal global ptr null, align 8
@heap_end = internal global ptr null, align 8
@heap_requested = internal global i64 0, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@heap = internal global [9000 x i8] zeroinitializer, align 1
@llvm.compiler.used = appending global [1 x ptr] [ptr @main], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @rand_beebs() #0 {
  %1 = load i64, ptr @seed, align 8
  %2 = mul nsw i64 %1, 1103515245
  %3 = add nsw i64 %2, 12345
  %4 = and i64 %3, 2147483647
  store i64 %4, ptr @seed, align 8
  %5 = load i64, ptr @seed, align 8
  %6 = ashr i64 %5, 16
  %7 = trunc i64 %6 to i32
  call void @__cflat_call_return(i64 95066441343696)
  ret i32 %7
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @srand_beebs(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = zext i32 %3 to i64
  store i64 %4, ptr @seed, align 8
  call void @__cflat_call_return(i64 95066441346512)
  ret void
}

; Function Attrs: noinline nounwind uwtable
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
  call void @__cflat_call_return(i64 95066441348752)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @check_heap_beebs(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load i64, ptr @heap_requested, align 8
  %5 = getelementptr inbounds i8, ptr %3, i64 %4
  %6 = load ptr, ptr @heap_end, align 8
  %7 = icmp ule ptr %5, %6
  %8 = zext i1 %7 to i32
  call void @__cflat_call_return(i64 95066441350960)
  ret i32 %8
}

; Function Attrs: noinline nounwind uwtable
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
  call void @__cflat_record_node(i64 95066441352592)
  br i1 %13, label %17, label %14

14:                                               ; preds = %1
  %15 = load i64, ptr %3, align 8
  %16 = icmp eq i64 0, %15
  call void @__cflat_record_node(i64 95066441355072)
  br i1 %16, label %17, label %18

17:                                               ; preds = %14, %1
  store ptr null, ptr %2, align 8
  call void @__cflat_record_node(i64 95066441355632)
  br label %23

18:                                               ; preds = %14
  %19 = load ptr, ptr @heap_ptr, align 8
  %20 = load i64, ptr %3, align 8
  %21 = getelementptr inbounds i8, ptr %19, i64 %20
  store ptr %21, ptr @heap_ptr, align 8
  %22 = load ptr, ptr %4, align 8
  store ptr %22, ptr %2, align 8
  call void @__cflat_record_node(i64 95066441355952)
  br label %23

23:                                               ; preds = %18, %17
  %24 = load ptr, ptr %2, align 8
  call void @__cflat_call_return(i64 95066441352592)
  ret ptr %24
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @calloc_beebs(i64 noundef %0, i64 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  store i64 %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %6 = load i64, ptr %3, align 8
  %7 = load i64, ptr %4, align 8
  %8 = mul i64 %6, %7
  call void @__cflat_call_enter(i64 95066441352592, i64 95066441358112)
  %9 = call ptr @malloc_beebs(i64 noundef %8)
  store ptr %9, ptr %5, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = icmp ne ptr null, %10
  call void @__cflat_record_node(i64 95066441358112)
  br i1 %11, label %12, label %17

12:                                               ; preds = %2
  %13 = load ptr, ptr %5, align 8
  %14 = load i64, ptr %3, align 8
  %15 = load i64, ptr %4, align 8
  %16 = mul i64 %14, %15
  call void @llvm.memset.p0.i64(ptr align 1 %13, i8 0, i64 %16, i1 false)
  call void @__cflat_record_node(i64 95066441360224)
  br label %17

17:                                               ; preds = %12, %2
  %18 = load ptr, ptr %5, align 8
  call void @__cflat_call_return(i64 95066441358112)
  ret ptr %18
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind uwtable
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
  call void @__cflat_record_node(i64 95066441360944)
  br i1 %16, label %20, label %17

17:                                               ; preds = %2
  %18 = load i64, ptr %5, align 8
  %19 = icmp eq i64 0, %18
  call void @__cflat_record_node(i64 95066441365776)
  br i1 %19, label %20, label %21

20:                                               ; preds = %17, %2
  store ptr null, ptr %3, align 8
  call void @__cflat_record_node(i64 95066441366336)
  br label %46

21:                                               ; preds = %17
  %22 = load ptr, ptr @heap_ptr, align 8
  %23 = load i64, ptr %5, align 8
  %24 = getelementptr inbounds i8, ptr %22, i64 %23
  store ptr %24, ptr @heap_ptr, align 8
  %25 = load ptr, ptr %4, align 8
  %26 = icmp ne ptr null, %25
  call void @__cflat_record_node(i64 95066441366656)
  br i1 %26, label %27, label %44

27:                                               ; preds = %21
  store i64 0, ptr %7, align 8
  call void @__cflat_record_node(i64 95066441367936)
  br label %28

28:                                               ; preds = %40, %27
  %29 = load i64, ptr %7, align 8
  %30 = load i64, ptr %5, align 8
  %31 = icmp ult i64 %29, %30
  call void @__cflat_record_node(i64 95066441368256)
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
  call void @__cflat_record_node(i64 95066441369056)
  br label %40

40:                                               ; preds = %32
  %41 = load i64, ptr %7, align 8
  %42 = add i64 %41, 1
  store i64 %42, ptr %7, align 8
  call void @__cflat_record_node(i64 95066441370368)
  br label %28, !llvm.loop !6

43:                                               ; preds = %28
  call void @__cflat_record_node(i64 95066441373744)
  br label %44

44:                                               ; preds = %43, %21
  %45 = load ptr, ptr %6, align 8
  store ptr %45, ptr %3, align 8
  call void @__cflat_record_node(i64 95066441373856)
  br label %46

46:                                               ; preds = %44, %20
  %47 = load ptr, ptr %3, align 8
  call void @__cflat_call_return(i64 95066441360944)
  ret ptr %47
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @free_beebs(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @__cflat_call_return(i64 95066441374864)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @initialise_benchmark() #0 {
  call void @__cflat_call_return(i64 95066441375648)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @warm_caches(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  call void @__cflat_call_enter(i64 95066441376848, i64 95066441376224)
  %4 = call i32 @benchmark_body(i32 noundef %3)
  call void @__cflat_call_return(i64 95066441376224)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @benchmark_body(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %4, align 4
  call void @__cflat_record_node(i64 95066441376848)
  br label %15

15:                                               ; preds = %141, %1
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %2, align 4
  %18 = icmp slt i32 %16, %17
  call void @__cflat_record_node(i64 95066441379872)
  br i1 %18, label %19, label %144

19:                                               ; preds = %15
  call void @__cflat_call_enter(i64 95066441348752, i64 95066441380768)
  call void @init_heap_beebs(ptr noundef @heap, i64 noundef 9000)
  store i32 35, ptr %8, align 4
  %20 = load i32, ptr %8, align 4
  %21 = sext i32 %20 to i64
  %22 = mul i64 257, %21
  call void @__cflat_call_enter(i64 95066441352592, i64 95066441380768)
  %23 = call ptr @malloc_beebs(i64 noundef %22)
  store ptr %23, ptr %6, align 8
  store i32 0, ptr %3, align 4
  call void @__cflat_record_node(i64 95066441380768)
  br label %24

24:                                               ; preds = %60, %19
  %25 = load i32, ptr %3, align 4
  %26 = load i32, ptr %8, align 4
  %27 = icmp slt i32 %25, %26
  call void @__cflat_record_node(i64 95066441382320)
  br i1 %27, label %28, label %63

28:                                               ; preds = %24
  %29 = load ptr, ptr %6, align 8
  %30 = load i32, ptr %3, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds %struct.tar_header_t, ptr %29, i64 %31
  store ptr %32, ptr %9, align 8
  %33 = load ptr, ptr %9, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %33, i8 0, i64 257, i1 false)
  %34 = load i32, ptr %3, align 4
  %35 = srem i32 %34, 94
  %36 = add nsw i32 5, %35
  store i32 %36, ptr %10, align 4
  %37 = load ptr, ptr %9, align 8
  %38 = getelementptr inbounds %struct.tar_header_t, ptr %37, i32 0, i32 7
  store i8 48, ptr %38, align 1
  store i32 0, ptr %5, align 4
  call void @__cflat_record_node(i64 95066441383056)
  br label %39

39:                                               ; preds = %53, %28
  %40 = load i32, ptr %5, align 4
  %41 = load i32, ptr %10, align 4
  %42 = icmp slt i32 %40, %41
  call void @__cflat_record_node(i64 95066441385808)
  br i1 %42, label %43, label %56

43:                                               ; preds = %39
  call void @__cflat_call_enter(i64 95066441343696, i64 95066441386608)
  %44 = call i32 @rand_beebs()
  %45 = srem i32 %44, 26
  %46 = add nsw i32 %45, 65
  %47 = trunc i32 %46 to i8
  %48 = load ptr, ptr %9, align 8
  %49 = getelementptr inbounds %struct.tar_header_t, ptr %48, i32 0, i32 0
  %50 = load i32, ptr %5, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [100 x i8], ptr %49, i64 0, i64 %51
  store i8 %47, ptr %52, align 1
  call void @__cflat_record_node(i64 95066441386608)
  br label %53

53:                                               ; preds = %43
  %54 = load i32, ptr %5, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %5, align 4
  call void @__cflat_record_node(i64 95066441390480)
  br label %39, !llvm.loop !8

56:                                               ; preds = %39
  %57 = load ptr, ptr %9, align 8
  %58 = getelementptr inbounds %struct.tar_header_t, ptr %57, i32 0, i32 4
  %59 = getelementptr inbounds [12 x i8], ptr %58, i64 0, i64 0
  store i8 48, ptr %59, align 1
  call void @__cflat_record_node(i64 95066441391280)
  br label %60

60:                                               ; preds = %56
  %61 = load i32, ptr %3, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %3, align 4
  call void @__cflat_record_node(i64 95066441392192)
  br label %24, !llvm.loop !9

63:                                               ; preds = %24
  store i32 0, ptr %7, align 4
  store i32 0, ptr %5, align 4
  call void @__cflat_record_node(i64 95066441393024)
  br label %64

64:                                               ; preds = %136, %63
  %65 = load i32, ptr %5, align 4
  %66 = icmp slt i32 %65, 5
  call void @__cflat_record_node(i64 95066441393504)
  br i1 %66, label %67, label %139

67:                                               ; preds = %64
  %68 = load ptr, ptr %6, align 8
  %69 = load i32, ptr %5, align 4
  %70 = add nsw i32 %69, 17
  %71 = srem i32 %70, 35
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds %struct.tar_header_t, ptr %68, i64 %72
  %74 = getelementptr inbounds %struct.tar_header_t, ptr %73, i32 0, i32 0
  %75 = getelementptr inbounds [100 x i8], ptr %74, i64 0, i64 0
  store ptr %75, ptr %11, align 8
  store i32 0, ptr %3, align 4
  call void @__cflat_record_node(i64 95066441394176)
  br label %76

76:                                               ; preds = %132, %67
  %77 = load i32, ptr %3, align 4
  %78 = load i32, ptr %8, align 4
  %79 = icmp slt i32 %77, %78
  call void @__cflat_record_node(i64 95066441395936)
  br i1 %79, label %80, label %135

80:                                               ; preds = %76
  %81 = load ptr, ptr %6, align 8
  %82 = load i32, ptr %3, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds %struct.tar_header_t, ptr %81, i64 %83
  store ptr %84, ptr %12, align 8
  %85 = load ptr, ptr %6, align 8
  %86 = load i32, ptr %3, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds %struct.tar_header_t, ptr %85, i64 %87
  %89 = getelementptr inbounds %struct.tar_header_t, ptr %88, i32 0, i32 0
  %90 = getelementptr inbounds [100 x i8], ptr %89, i64 0, i64 0
  store ptr %90, ptr %13, align 8
  %91 = load ptr, ptr %11, align 8
  store ptr %91, ptr %14, align 8
  call void @__cflat_record_node(i64 95066441396736)
  br label %92

92:                                               ; preds = %113, %80
  %93 = load ptr, ptr %13, align 8
  %94 = load i8, ptr %93, align 1
  %95 = zext i8 %94 to i32
  %96 = icmp ne i32 %95, 0
  call void @__cflat_record_node(i64 95066441398976)
  br i1 %96, label %97, label %110

97:                                               ; preds = %92
  %98 = load ptr, ptr %14, align 8
  %99 = load i8, ptr %98, align 1
  %100 = zext i8 %99 to i32
  %101 = icmp ne i32 %100, 0
  call void @__cflat_record_node(i64 95066441387856)
  br i1 %101, label %102, label %110

102:                                              ; preds = %97
  %103 = load ptr, ptr %13, align 8
  %104 = load i8, ptr %103, align 1
  %105 = zext i8 %104 to i32
  %106 = load ptr, ptr %14, align 8
  %107 = load i8, ptr %106, align 1
  %108 = zext i8 %107 to i32
  %109 = icmp eq i32 %105, %108
  call void @__cflat_record_node(i64 95066441388624)
  br label %110

110:                                              ; preds = %102, %97, %92
  %111 = phi i1 [ false, %97 ], [ false, %92 ], [ %109, %102 ]
  call void @__cflat_record_node(i64 95066441376328)
  br i1 %111, label %112, label %118

112:                                              ; preds = %110
  call void @__cflat_record_node(i64 95066441404256)
  br label %113

113:                                              ; preds = %112
  %114 = load ptr, ptr %13, align 8
  %115 = getelementptr inbounds i8, ptr %114, i32 1
  store ptr %115, ptr %13, align 8
  %116 = load ptr, ptr %14, align 8
  %117 = getelementptr inbounds i8, ptr %116, i32 1
  store ptr %117, ptr %14, align 8
  call void @__cflat_record_node(i64 95066441404368)
  br label %92, !llvm.loop !10

118:                                              ; preds = %110
  %119 = load ptr, ptr %13, align 8
  %120 = load i8, ptr %119, align 1
  %121 = zext i8 %120 to i32
  %122 = icmp eq i32 %121, 0
  call void @__cflat_record_node(i64 95066441405632)
  br i1 %122, label %123, label %131

123:                                              ; preds = %118
  %124 = load ptr, ptr %14, align 8
  %125 = load i8, ptr %124, align 1
  %126 = zext i8 %125 to i32
  %127 = icmp eq i32 %126, 0
  call void @__cflat_record_node(i64 95066441406544)
  br i1 %127, label %128, label %131

128:                                              ; preds = %123
  %129 = load i32, ptr %7, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, ptr %7, align 4
  call void @__cflat_record_node(i64 95066441407312)
  br label %135

131:                                              ; preds = %123, %118
  call void @__cflat_record_node(i64 95066441407936)
  br label %132

132:                                              ; preds = %131
  %133 = load i32, ptr %3, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, ptr %3, align 4
  call void @__cflat_record_node(i64 95066441408048)
  br label %76, !llvm.loop !11

135:                                              ; preds = %128, %76
  call void @__cflat_record_node(i64 95066441408864)
  br label %136

136:                                              ; preds = %135
  %137 = load i32, ptr %5, align 4
  %138 = add nsw i32 %137, 1
  store i32 %138, ptr %5, align 4
  call void @__cflat_record_node(i64 95066441408976)
  br label %64, !llvm.loop !12

139:                                              ; preds = %64
  %140 = load ptr, ptr %6, align 8
  call void @__cflat_call_enter(i64 95066441374864, i64 95066441409776)
  call void @free_beebs(ptr noundef %140)
  call void @__cflat_record_node(i64 95066441409776)
  br label %141

141:                                              ; preds = %139
  %142 = load i32, ptr %4, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, ptr %4, align 4
  call void @__cflat_record_node(i64 95066441410336)
  br label %15, !llvm.loop !13

144:                                              ; preds = %15
  %145 = load i32, ptr %7, align 4
  %146 = icmp eq i32 %145, 5
  %147 = zext i1 %146 to i32
  call void @__cflat_call_return(i64 95066441376848)
  ret i32 %147
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @benchmark() #0 {
  call void @__cflat_call_enter(i64 95066441376848, i64 95066441399824)
  %1 = call i32 @benchmark_body(i32 noundef 47000)
  call void @__cflat_call_return(i64 95066441399824)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @verify_benchmark(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp eq i32 %3, 1
  %5 = zext i1 %4 to i32
  call void @__cflat_call_return(i64 95066441400704)
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
  call void @__cflat_call_enter(i64 95066441456992, i64 95066441338944)
  call void @initialise_benchmark()
  call void @__cflat_call_enter(i64 95066441376224, i64 95066441338944)
  call void @warm_caches(i32 noundef 0)
  call void @__cflat_call_enter(i64 95066441466752, i64 95066441338944)
  %8 = call i32 @benchmark()
  store volatile i32 %8, ptr %6, align 4
  call void @cflat_finalize_and_print()
  %9 = load volatile i32, ptr %6, align 4
  call void @__cflat_call_enter(i64 95066441400704, i64 95066441338944)
  %10 = call i32 @verify_benchmark(i32 noundef %9)
  store i32 %10, ptr %7, align 4
  %11 = load i32, ptr %7, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %11)
  call void @__cflat_call_return(i64 95066441338944)
  ret i32 0
}

declare void @cflat_finalize_and_print() #2

declare i32 @printf(ptr noundef, ...) #2

declare void @__cflat_call_return(i64)

declare void @__cflat_record_node(i64)

declare void @__cflat_call_enter(i64, i64)

attributes #0 = { noinline nounwind uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }

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
