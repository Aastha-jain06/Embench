; ModuleID = './output/ir/huffbench.ll'
source_filename = "./embench-iot-benchmarks/libhuffbench.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@seed = internal global i64 0, align 8
@heap_ptr = internal global ptr null, align 8
@heap_end = internal global ptr null, align 8
@heap_requested = internal global i64 0, align 8
@test_data = internal global [500 x i8] zeroinitializer, align 16
@orig_data = internal constant [500 x i8] c"J2OZF50FYLD5UTVYYRMT0VXO01VC5FNIB1CG12MTIPT2CIV00BOUWFDRAYTA3AI42KFXHRKPA3LCGA3ABLUYQXJRQ2RN2ZMYERPLC00CXFE3GB3HMS53JIOZE5HBYTZ2EJHGDBI0HMYNOVU0HUXR2FKBERC3E1ZIEBOHCWCJD0WRPLLX5DI1IS2NE4KI0DR4E5GHWIQZCHKRSVIRYQMBDJOHHYPB1AAAAGHWOXPQ4ZBQOKBH0OI3XWE4OUAJUAJUGQKUIZEGSFXBPYIKGQH3GM2UA23U2HJCXTW5N0G553APVIZ2YAZ4MVSMRQBNXKPO3FOK5UK5RKOGTHCLH2KUR2ADMBQDLASJFATFU3EFISL1ZOGAKQU1NV4ZWP3CPPLUP4ZD23IEPT5IBFJLW3HDSF2JUZLDIWYXUR0QPCU4WTHXZQDPNKSAPOJEIUHQK5I4RCPAFD41XFSQVV5D5RDP5MTHA0YK0AILCXLH1JCSPVCEKBHKSKZR", align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@heap = internal global [8192 x i8] zeroinitializer, align 16
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
  call void @increment_return()
  ret i32 %7
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @srand_beebs(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = zext i32 %3 to i64
  store i64 %4, ptr @seed, align 8
  call void @increment_return()
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
  call void @increment_return()
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
  call void @increment_cond_branch()
  br i1 %13, label %17, label %14

14:                                               ; preds = %1
  %15 = load i64, ptr %3, align 8
  %16 = icmp eq i64 0, %15
  call void @increment_cond_branch()
  br i1 %16, label %17, label %18

17:                                               ; preds = %14, %1
  store ptr null, ptr %2, align 8
  call void @increment_uncond_branch()
  br label %23

18:                                               ; preds = %14
  %19 = load ptr, ptr @heap_ptr, align 8
  %20 = load i64, ptr %3, align 8
  %21 = getelementptr inbounds i8, ptr %19, i64 %20
  store ptr %21, ptr @heap_ptr, align 8
  %22 = load ptr, ptr %4, align 8
  store ptr %22, ptr %2, align 8
  call void @increment_uncond_branch()
  br label %23

23:                                               ; preds = %18, %17
  %24 = load ptr, ptr %2, align 8
  call void @increment_return()
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
  call void @increment_direct_call()
  %9 = call ptr @malloc_beebs(i64 noundef %8)
  store ptr %9, ptr %5, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = icmp ne ptr null, %10
  call void @increment_cond_branch()
  br i1 %11, label %12, label %17

12:                                               ; preds = %2
  %13 = load ptr, ptr %5, align 8
  %14 = load i64, ptr %3, align 8
  %15 = load i64, ptr %4, align 8
  %16 = mul i64 %14, %15
  call void @llvm.memset.p0.i64(ptr align 1 %13, i8 0, i64 %16, i1 false)
  call void @increment_uncond_branch()
  br label %17

17:                                               ; preds = %12, %2
  %18 = load ptr, ptr %5, align 8
  call void @increment_return()
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
  call void @increment_cond_branch()
  br i1 %16, label %20, label %17

17:                                               ; preds = %2
  %18 = load i64, ptr %5, align 8
  %19 = icmp eq i64 0, %18
  call void @increment_cond_branch()
  br i1 %19, label %20, label %21

20:                                               ; preds = %17, %2
  store ptr null, ptr %3, align 8
  call void @increment_uncond_branch()
  br label %46

21:                                               ; preds = %17
  %22 = load ptr, ptr @heap_ptr, align 8
  %23 = load i64, ptr %5, align 8
  %24 = getelementptr inbounds i8, ptr %22, i64 %23
  store ptr %24, ptr @heap_ptr, align 8
  %25 = load ptr, ptr %4, align 8
  %26 = icmp ne ptr null, %25
  call void @increment_cond_branch()
  br i1 %26, label %27, label %44

27:                                               ; preds = %21
  store i64 0, ptr %7, align 8
  call void @increment_uncond_branch()
  br label %28

28:                                               ; preds = %40, %27
  %29 = load i64, ptr %7, align 8
  %30 = load i64, ptr %5, align 8
  %31 = icmp ult i64 %29, %30
  call void @increment_cond_branch()
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
  call void @increment_uncond_branch()
  br label %40

40:                                               ; preds = %32
  %41 = load i64, ptr %7, align 8
  %42 = add i64 %41, 1
  store i64 %42, ptr %7, align 8
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %28, !llvm.loop !6

43:                                               ; preds = %28
  call void @increment_uncond_branch()
  br label %44

44:                                               ; preds = %43, %21
  %45 = load ptr, ptr %6, align 8
  store ptr %45, ptr %3, align 8
  call void @increment_uncond_branch()
  br label %46

46:                                               ; preds = %44, %20
  %47 = load ptr, ptr %3, align 8
  call void @increment_return()
  ret ptr %47
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @free_beebs(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @increment_return()
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @compdecomp(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i8, align 1
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca [512 x i64], align 16
  %16 = alloca [256 x i64], align 16
  %17 = alloca [512 x i32], align 16
  %18 = alloca [256 x i64], align 16
  %19 = alloca [256 x i8], align 16
  %20 = alloca i64, align 8
  %21 = alloca i64, align 8
  %22 = alloca i64, align 8
  %23 = alloca i64, align 8
  %24 = alloca i64, align 8
  %25 = alloca i32, align 4
  %26 = alloca i64, align 8
  %27 = alloca i8, align 1
  %28 = alloca i32, align 4
  %29 = alloca [256 x i64], align 16
  %30 = alloca [256 x i8], align 16
  %31 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %32 = load ptr, ptr %3, align 8
  store ptr %32, ptr %13, align 8
  %33 = load i64, ptr %4, align 8
  %34 = add i64 %33, 1
  call void @increment_direct_call()
  %35 = call ptr @malloc_beebs(i64 noundef %34)
  store ptr %35, ptr %14, align 8
  %36 = load ptr, ptr %14, align 8
  %37 = load i64, ptr %4, align 8
  %38 = add i64 %37, 1
  %39 = mul i64 1, %38
  call void @llvm.memset.p0.i64(ptr align 1 %36, i8 0, i64 %39, i1 false)
  %40 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %40, i8 0, i64 4096, i1 false)
  %41 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %41, i8 0, i64 2048, i1 false)
  %42 = getelementptr inbounds [512 x i32], ptr %17, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %42, i8 0, i64 2048, i1 false)
  %43 = getelementptr inbounds [256 x i64], ptr %18, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %43, i8 0, i64 2048, i1 false)
  %44 = getelementptr inbounds [256 x i8], ptr %19, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %44, i8 0, i64 256, i1 false)
  store i64 0, ptr %5, align 8
  call void @increment_uncond_branch()
  br label %45

45:                                               ; preds = %58, %2
  %46 = load i64, ptr %5, align 8
  %47 = load i64, ptr %4, align 8
  %48 = icmp ult i64 %46, %47
  call void @increment_cond_branch()
  br i1 %48, label %49, label %61

49:                                               ; preds = %45
  %50 = load ptr, ptr %13, align 8
  %51 = load i8, ptr %50, align 1
  %52 = zext i8 %51 to i64
  %53 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 %52
  %54 = load i64, ptr %53, align 8
  %55 = add i64 %54, 1
  store i64 %55, ptr %53, align 8
  %56 = load ptr, ptr %13, align 8
  %57 = getelementptr inbounds i8, ptr %56, i32 1
  store ptr %57, ptr %13, align 8
  call void @increment_uncond_branch()
  br label %58

58:                                               ; preds = %49
  %59 = load i64, ptr %5, align 8
  %60 = add i64 %59, 1
  store i64 %60, ptr %5, align 8
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %45, !llvm.loop !8

61:                                               ; preds = %45
  store i64 0, ptr %7, align 8
  store i64 0, ptr %5, align 8
  call void @increment_uncond_branch()
  br label %62

62:                                               ; preds = %77, %61
  %63 = load i64, ptr %5, align 8
  %64 = icmp ult i64 %63, 256
  call void @increment_cond_branch()
  br i1 %64, label %65, label %80

65:                                               ; preds = %62
  %66 = load i64, ptr %5, align 8
  %67 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 %66
  %68 = load i64, ptr %67, align 8
  %69 = icmp ne i64 %68, 0
  call void @increment_cond_branch()
  br i1 %69, label %70, label %76

70:                                               ; preds = %65
  %71 = load i64, ptr %5, align 8
  %72 = load i64, ptr %7, align 8
  %73 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 %72
  store i64 %71, ptr %73, align 8
  %74 = load i64, ptr %7, align 8
  %75 = add i64 %74, 1
  store i64 %75, ptr %7, align 8
  call void @increment_uncond_branch()
  br label %76

76:                                               ; preds = %70, %65
  call void @increment_uncond_branch()
  br label %77

77:                                               ; preds = %76
  %78 = load i64, ptr %5, align 8
  %79 = add i64 %78, 1
  store i64 %79, ptr %5, align 8
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %62, !llvm.loop !9

80:                                               ; preds = %62
  %81 = load i64, ptr %7, align 8
  store i64 %81, ptr %5, align 8
  call void @increment_uncond_branch()
  br label %82

82:                                               ; preds = %92, %80
  %83 = load i64, ptr %5, align 8
  %84 = icmp ugt i64 %83, 0
  call void @increment_cond_branch()
  br i1 %84, label %85, label %95

85:                                               ; preds = %82
  %86 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 0
  %87 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 0
  %88 = load i64, ptr %7, align 8
  %89 = trunc i64 %88 to i32
  %90 = load i64, ptr %5, align 8
  %91 = trunc i64 %90 to i32
  call void @increment_direct_call()
  call void @heap_adjust(ptr noundef %86, ptr noundef %87, i32 noundef %89, i32 noundef %91)
  call void @increment_uncond_branch()
  br label %92

92:                                               ; preds = %85
  %93 = load i64, ptr %5, align 8
  %94 = add i64 %93, -1
  store i64 %94, ptr %5, align 8
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %82, !llvm.loop !10

95:                                               ; preds = %82
  call void @increment_uncond_branch()
  br label %96

96:                                               ; preds = %99, %95
  %97 = load i64, ptr %7, align 8
  %98 = icmp ugt i64 %97, 1
  call void @increment_cond_branch()
  br i1 %98, label %99, label %141

99:                                               ; preds = %96
  %100 = load i64, ptr %7, align 8
  %101 = add i64 %100, -1
  store i64 %101, ptr %7, align 8
  %102 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 0
  %103 = load i64, ptr %102, align 16
  store i64 %103, ptr %20, align 8
  %104 = load i64, ptr %7, align 8
  %105 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 %104
  %106 = load i64, ptr %105, align 8
  %107 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 0
  store i64 %106, ptr %107, align 16
  %108 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 0
  %109 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 0
  %110 = load i64, ptr %7, align 8
  %111 = trunc i64 %110 to i32
  call void @increment_direct_call()
  call void @heap_adjust(ptr noundef %108, ptr noundef %109, i32 noundef %111, i32 noundef 1)
  %112 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 0
  %113 = load i64, ptr %112, align 16
  %114 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 %113
  %115 = load i64, ptr %114, align 8
  %116 = load i64, ptr %20, align 8
  %117 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 %116
  %118 = load i64, ptr %117, align 8
  %119 = add i64 %115, %118
  %120 = load i64, ptr %7, align 8
  %121 = add i64 256, %120
  %122 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 %121
  store i64 %119, ptr %122, align 8
  %123 = load i64, ptr %7, align 8
  %124 = add i64 256, %123
  %125 = trunc i64 %124 to i32
  %126 = load i64, ptr %20, align 8
  %127 = getelementptr inbounds [512 x i32], ptr %17, i64 0, i64 %126
  store i32 %125, ptr %127, align 4
  %128 = load i64, ptr %7, align 8
  %129 = sub i64 -256, %128
  %130 = trunc i64 %129 to i32
  %131 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 0
  %132 = load i64, ptr %131, align 16
  %133 = getelementptr inbounds [512 x i32], ptr %17, i64 0, i64 %132
  store i32 %130, ptr %133, align 4
  %134 = load i64, ptr %7, align 8
  %135 = add i64 256, %134
  %136 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 0
  store i64 %135, ptr %136, align 16
  %137 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 0
  %138 = getelementptr inbounds [256 x i64], ptr %16, i64 0, i64 0
  %139 = load i64, ptr %7, align 8
  %140 = trunc i64 %139 to i32
  call void @increment_direct_call()
  call void @heap_adjust(ptr noundef %137, ptr noundef %138, i32 noundef %140, i32 noundef 1)
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %96, !llvm.loop !11

141:                                              ; preds = %96
  %142 = load i64, ptr %7, align 8
  %143 = add i64 256, %142
  %144 = getelementptr inbounds [512 x i32], ptr %17, i64 0, i64 %143
  store i32 0, ptr %144, align 4
  store i64 0, ptr %23, align 8
  store i64 0, ptr %24, align 8
  store i64 0, ptr %21, align 8
  call void @increment_uncond_branch()
  br label %145

145:                                              ; preds = %204, %141
  %146 = load i64, ptr %21, align 8
  %147 = icmp ult i64 %146, 256
  call void @increment_cond_branch()
  br i1 %147, label %148, label %207

148:                                              ; preds = %145
  %149 = load i64, ptr %21, align 8
  %150 = getelementptr inbounds [512 x i64], ptr %15, i64 0, i64 %149
  %151 = load i64, ptr %150, align 8
  %152 = icmp ne i64 %151, 0
  call void @increment_cond_branch()
  br i1 %152, label %158, label %153

153:                                              ; preds = %148
  %154 = load i64, ptr %21, align 8
  %155 = getelementptr inbounds [256 x i64], ptr %18, i64 0, i64 %154
  store i64 0, ptr %155, align 8
  %156 = load i64, ptr %21, align 8
  %157 = getelementptr inbounds [256 x i8], ptr %19, i64 0, i64 %156
  store i8 0, ptr %157, align 1
  call void @increment_uncond_branch()
  br label %203

158:                                              ; preds = %148
  store i64 0, ptr %5, align 8
  store i64 1, ptr %6, align 8
  store i64 0, ptr %22, align 8
  %159 = load i64, ptr %21, align 8
  %160 = getelementptr inbounds [512 x i32], ptr %17, i64 0, i64 %159
  %161 = load i32, ptr %160, align 4
  store i32 %161, ptr %25, align 4
  call void @increment_uncond_branch()
  br label %162

162:                                              ; preds = %174, %158
  %163 = load i32, ptr %25, align 4
  %164 = icmp ne i32 %163, 0
  call void @increment_cond_branch()
  br i1 %164, label %165, label %183

165:                                              ; preds = %162
  %166 = load i32, ptr %25, align 4
  %167 = icmp slt i32 %166, 0
  call void @increment_cond_branch()
  br i1 %167, label %168, label %174

168:                                              ; preds = %165
  %169 = load i64, ptr %6, align 8
  %170 = load i64, ptr %22, align 8
  %171 = add i64 %170, %169
  store i64 %171, ptr %22, align 8
  %172 = load i32, ptr %25, align 4
  %173 = sub nsw i32 0, %172
  store i32 %173, ptr %25, align 4
  call void @increment_uncond_branch()
  br label %174

174:                                              ; preds = %168, %165
  %175 = load i32, ptr %25, align 4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [512 x i32], ptr %17, i64 0, i64 %176
  %178 = load i32, ptr %177, align 4
  store i32 %178, ptr %25, align 4
  %179 = load i64, ptr %6, align 8
  %180 = shl i64 %179, 1
  store i64 %180, ptr %6, align 8
  %181 = load i64, ptr %5, align 8
  %182 = add i64 %181, 1
  store i64 %182, ptr %5, align 8
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %162, !llvm.loop !12

183:                                              ; preds = %162
  %184 = load i64, ptr %22, align 8
  %185 = load i64, ptr %21, align 8
  %186 = getelementptr inbounds [256 x i64], ptr %18, i64 0, i64 %185
  store i64 %184, ptr %186, align 8
  %187 = load i64, ptr %5, align 8
  %188 = trunc i64 %187 to i8
  %189 = load i64, ptr %21, align 8
  %190 = getelementptr inbounds [256 x i8], ptr %19, i64 0, i64 %189
  store i8 %188, ptr %190, align 1
  %191 = load i64, ptr %22, align 8
  %192 = load i64, ptr %23, align 8
  %193 = icmp ugt i64 %191, %192
  call void @increment_cond_branch()
  br i1 %193, label %194, label %196

194:                                              ; preds = %183
  %195 = load i64, ptr %22, align 8
  store i64 %195, ptr %23, align 8
  call void @increment_uncond_branch()
  br label %196

196:                                              ; preds = %194, %183
  %197 = load i64, ptr %5, align 8
  %198 = load i64, ptr %24, align 8
  %199 = icmp ugt i64 %197, %198
  call void @increment_cond_branch()
  br i1 %199, label %200, label %202

200:                                              ; preds = %196
  %201 = load i64, ptr %5, align 8
  store i64 %201, ptr %24, align 8
  call void @increment_uncond_branch()
  br label %202

202:                                              ; preds = %200, %196
  call void @increment_uncond_branch()
  br label %203

203:                                              ; preds = %202, %153
  call void @increment_uncond_branch()
  br label %204

204:                                              ; preds = %203
  %205 = load i64, ptr %21, align 8
  %206 = add i64 %205, 1
  store i64 %206, ptr %21, align 8
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %145, !llvm.loop !13

207:                                              ; preds = %145
  %208 = load i64, ptr %24, align 8
  %209 = icmp ugt i64 %208, 64
  call void @increment_cond_branch()
  br i1 %209, label %210, label %211

210:                                              ; preds = %207
  call void @increment_uncond_branch()
  br label %481

211:                                              ; preds = %207
  store i64 0, ptr %26, align 8
  store i8 0, ptr %27, align 1
  store i32 -1, ptr %28, align 4
  %212 = load ptr, ptr %3, align 8
  store ptr %212, ptr %13, align 8
  %213 = load i64, ptr %23, align 8
  %214 = icmp eq i64 %213, 0
  call void @increment_cond_branch()
  br i1 %214, label %215, label %216

215:                                              ; preds = %211
  call void @increment_uncond_branch()
  br label %481

216:                                              ; preds = %211
  store i64 0, ptr %6, align 8
  call void @increment_uncond_branch()
  br label %217

217:                                              ; preds = %285, %216
  %218 = load i64, ptr %6, align 8
  %219 = load i64, ptr %4, align 8
  %220 = icmp ult i64 %218, %219
  call void @increment_cond_branch()
  br i1 %220, label %221, label %288

221:                                              ; preds = %217
  %222 = load ptr, ptr %13, align 8
  %223 = load i8, ptr %222, align 1
  %224 = zext i8 %223 to i64
  %225 = getelementptr inbounds [256 x i8], ptr %19, i64 0, i64 %224
  %226 = load i8, ptr %225, align 1
  %227 = zext i8 %226 to i32
  %228 = sub nsw i32 %227, 1
  %229 = shl i32 1, %228
  %230 = sext i32 %229 to i64
  store i64 %230, ptr %8, align 8
  store i64 0, ptr %5, align 8
  call void @increment_uncond_branch()
  br label %231

231:                                              ; preds = %279, %221
  %232 = load i64, ptr %5, align 8
  %233 = load ptr, ptr %13, align 8
  %234 = load i8, ptr %233, align 1
  %235 = zext i8 %234 to i64
  %236 = getelementptr inbounds [256 x i8], ptr %19, i64 0, i64 %235
  %237 = load i8, ptr %236, align 1
  %238 = zext i8 %237 to i64
  %239 = icmp ult i64 %232, %238
  call void @increment_cond_branch()
  br i1 %239, label %240, label %282

240:                                              ; preds = %231
  %241 = load i32, ptr %28, align 4
  %242 = icmp eq i32 %241, 7
  call void @increment_cond_branch()
  br i1 %242, label %243, label %255

243:                                              ; preds = %240
  %244 = load i8, ptr %27, align 1
  %245 = load ptr, ptr %14, align 8
  %246 = load i64, ptr %26, align 8
  %247 = getelementptr inbounds i8, ptr %245, i64 %246
  store i8 %244, ptr %247, align 1
  %248 = load i64, ptr %26, align 8
  %249 = add i64 %248, 1
  store i64 %249, ptr %26, align 8
  %250 = load i64, ptr %26, align 8
  %251 = load i64, ptr %4, align 8
  %252 = icmp eq i64 %250, %251
  call void @increment_cond_branch()
  br i1 %252, label %253, label %254

253:                                              ; preds = %243
  call void @increment_uncond_branch()
  br label %481

254:                                              ; preds = %243
  store i32 0, ptr %28, align 4
  store i8 0, ptr %27, align 1
  call void @increment_uncond_branch()
  br label %262

255:                                              ; preds = %240
  %256 = load i32, ptr %28, align 4
  %257 = add nsw i32 %256, 1
  store i32 %257, ptr %28, align 4
  %258 = load i8, ptr %27, align 1
  %259 = sext i8 %258 to i32
  %260 = shl i32 %259, 1
  %261 = trunc i32 %260 to i8
  store i8 %261, ptr %27, align 1
  call void @increment_uncond_branch()
  br label %262

262:                                              ; preds = %255, %254
  %263 = load ptr, ptr %13, align 8
  %264 = load i8, ptr %263, align 1
  %265 = zext i8 %264 to i64
  %266 = getelementptr inbounds [256 x i64], ptr %18, i64 0, i64 %265
  %267 = load i64, ptr %266, align 8
  %268 = load i64, ptr %8, align 8
  %269 = and i64 %267, %268
  %270 = icmp ne i64 %269, 0
  call void @increment_cond_branch()
  br i1 %270, label %271, label %276

271:                                              ; preds = %262
  %272 = load i8, ptr %27, align 1
  %273 = sext i8 %272 to i32
  %274 = or i32 %273, 1
  %275 = trunc i32 %274 to i8
  store i8 %275, ptr %27, align 1
  call void @increment_uncond_branch()
  br label %276

276:                                              ; preds = %271, %262
  %277 = load i64, ptr %8, align 8
  %278 = lshr i64 %277, 1
  store i64 %278, ptr %8, align 8
  call void @increment_uncond_branch()
  br label %279

279:                                              ; preds = %276
  %280 = load i64, ptr %5, align 8
  %281 = add i64 %280, 1
  store i64 %281, ptr %5, align 8
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %231, !llvm.loop !14

282:                                              ; preds = %231
  %283 = load ptr, ptr %13, align 8
  %284 = getelementptr inbounds i8, ptr %283, i32 1
  store ptr %284, ptr %13, align 8
  call void @increment_uncond_branch()
  br label %285

285:                                              ; preds = %282
  %286 = load i64, ptr %6, align 8
  %287 = add i64 %286, 1
  store i64 %287, ptr %6, align 8
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %217, !llvm.loop !15

288:                                              ; preds = %217
  %289 = load i32, ptr %28, align 4
  %290 = sub nsw i32 7, %289
  %291 = load i8, ptr %27, align 1
  %292 = sext i8 %291 to i32
  %293 = shl i32 %292, %290
  %294 = trunc i32 %293 to i8
  store i8 %294, ptr %27, align 1
  %295 = load i8, ptr %27, align 1
  %296 = load ptr, ptr %14, align 8
  %297 = load i64, ptr %26, align 8
  %298 = getelementptr inbounds i8, ptr %296, i64 %297
  store i8 %295, ptr %298, align 1
  %299 = load i64, ptr %26, align 8
  %300 = add i64 %299, 1
  store i64 %300, ptr %26, align 8
  %301 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %301, i8 0, i64 2048, i1 false)
  %302 = getelementptr inbounds [256 x i8], ptr %30, i64 0, i64 0
  store ptr %302, ptr %31, align 8
  store i64 0, ptr %6, align 8
  call void @increment_uncond_branch()
  br label %303

303:                                              ; preds = %360, %288
  %304 = load i64, ptr %6, align 8
  %305 = icmp ult i64 %304, 256
  call void @increment_cond_branch()
  br i1 %305, label %306, label %363

306:                                              ; preds = %303
  %307 = load i64, ptr %6, align 8
  %308 = trunc i64 %307 to i8
  %309 = load ptr, ptr %31, align 8
  store i8 %308, ptr %309, align 1
  %310 = load ptr, ptr %31, align 8
  %311 = getelementptr inbounds i8, ptr %310, i32 1
  store ptr %311, ptr %31, align 8
  %312 = load i64, ptr %6, align 8
  %313 = getelementptr inbounds [256 x i64], ptr %18, i64 0, i64 %312
  %314 = load i64, ptr %313, align 8
  %315 = load i64, ptr %6, align 8
  %316 = getelementptr inbounds [256 x i8], ptr %19, i64 0, i64 %315
  %317 = load i8, ptr %316, align 1
  %318 = zext i8 %317 to i64
  %319 = or i64 %314, %318
  %320 = icmp ne i64 %319, 0
  call void @increment_cond_branch()
  br i1 %320, label %321, label %359

321:                                              ; preds = %306
  store i64 0, ptr %9, align 8
  %322 = load i64, ptr %6, align 8
  %323 = getelementptr inbounds [256 x i8], ptr %19, i64 0, i64 %322
  %324 = load i8, ptr %323, align 1
  %325 = zext i8 %324 to i32
  %326 = sub nsw i32 %325, 1
  %327 = shl i32 1, %326
  %328 = sext i32 %327 to i64
  store i64 %328, ptr %8, align 8
  store i64 0, ptr %5, align 8
  call void @increment_uncond_branch()
  br label %329

329:                                              ; preds = %352, %321
  %330 = load i64, ptr %5, align 8
  %331 = load i64, ptr %6, align 8
  %332 = getelementptr inbounds [256 x i8], ptr %19, i64 0, i64 %331
  %333 = load i8, ptr %332, align 1
  %334 = zext i8 %333 to i64
  %335 = icmp ult i64 %330, %334
  call void @increment_cond_branch()
  br i1 %335, label %336, label %355

336:                                              ; preds = %329
  %337 = load i64, ptr %9, align 8
  %338 = mul i64 %337, 2
  %339 = add i64 %338, 1
  store i64 %339, ptr %9, align 8
  %340 = load i64, ptr %6, align 8
  %341 = getelementptr inbounds [256 x i64], ptr %18, i64 0, i64 %340
  %342 = load i64, ptr %341, align 8
  %343 = load i64, ptr %8, align 8
  %344 = and i64 %342, %343
  %345 = icmp ne i64 %344, 0
  call void @increment_cond_branch()
  br i1 %345, label %346, label %349

346:                                              ; preds = %336
  %347 = load i64, ptr %9, align 8
  %348 = add i64 %347, 1
  store i64 %348, ptr %9, align 8
  call void @increment_uncond_branch()
  br label %349

349:                                              ; preds = %346, %336
  %350 = load i64, ptr %8, align 8
  %351 = lshr i64 %350, 1
  store i64 %351, ptr %8, align 8
  call void @increment_uncond_branch()
  br label %352

352:                                              ; preds = %349
  %353 = load i64, ptr %5, align 8
  %354 = add i64 %353, 1
  store i64 %354, ptr %5, align 8
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %329, !llvm.loop !16

355:                                              ; preds = %329
  %356 = load i64, ptr %9, align 8
  %357 = load i64, ptr %6, align 8
  %358 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 %357
  store i64 %356, ptr %358, align 8
  call void @increment_uncond_branch()
  br label %359

359:                                              ; preds = %355, %306
  call void @increment_uncond_branch()
  br label %360

360:                                              ; preds = %359
  %361 = load i64, ptr %6, align 8
  %362 = add i64 %361, 1
  store i64 %362, ptr %6, align 8
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %303, !llvm.loop !17

363:                                              ; preds = %303
  store i64 1, ptr %5, align 8
  call void @increment_uncond_branch()
  br label %364

364:                                              ; preds = %409, %363
  %365 = load i64, ptr %5, align 8
  %366 = icmp ult i64 %365, 256
  call void @increment_cond_branch()
  br i1 %366, label %367, label %412

367:                                              ; preds = %364
  %368 = load i64, ptr %5, align 8
  %369 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 %368
  %370 = load i64, ptr %369, align 8
  store i64 %370, ptr %10, align 8
  %371 = load i64, ptr %5, align 8
  %372 = getelementptr inbounds [256 x i8], ptr %30, i64 0, i64 %371
  %373 = load i8, ptr %372, align 1
  store i8 %373, ptr %11, align 1
  %374 = load i64, ptr %5, align 8
  store i64 %374, ptr %6, align 8
  call void @increment_uncond_branch()
  br label %375

375:                                              ; preds = %387, %367
  %376 = load i64, ptr %6, align 8
  %377 = icmp ne i64 %376, 0
  call void @increment_cond_branch()
  br i1 %377, label %378, label %385

378:                                              ; preds = %375
  %379 = load i64, ptr %6, align 8
  %380 = sub i64 %379, 1
  %381 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 %380
  %382 = load i64, ptr %381, align 8
  %383 = load i64, ptr %10, align 8
  %384 = icmp ugt i64 %382, %383
  call void @increment_uncond_branch()
  br label %385

385:                                              ; preds = %378, %375
  %386 = phi i1 [ false, %375 ], [ %384, %378 ]
  call void @increment_cond_branch()
  br i1 %386, label %387, label %402

387:                                              ; preds = %385
  %388 = load i64, ptr %6, align 8
  %389 = sub i64 %388, 1
  %390 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 %389
  %391 = load i64, ptr %390, align 8
  %392 = load i64, ptr %6, align 8
  %393 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 %392
  store i64 %391, ptr %393, align 8
  %394 = load i64, ptr %6, align 8
  %395 = sub i64 %394, 1
  %396 = getelementptr inbounds [256 x i8], ptr %30, i64 0, i64 %395
  %397 = load i8, ptr %396, align 1
  %398 = load i64, ptr %6, align 8
  %399 = getelementptr inbounds [256 x i8], ptr %30, i64 0, i64 %398
  store i8 %397, ptr %399, align 1
  %400 = load i64, ptr %6, align 8
  %401 = add i64 %400, -1
  store i64 %401, ptr %6, align 8
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %375, !llvm.loop !18

402:                                              ; preds = %385
  %403 = load i64, ptr %10, align 8
  %404 = load i64, ptr %6, align 8
  %405 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 %404
  store i64 %403, ptr %405, align 8
  %406 = load i8, ptr %11, align 1
  %407 = load i64, ptr %6, align 8
  %408 = getelementptr inbounds [256 x i8], ptr %30, i64 0, i64 %407
  store i8 %406, ptr %408, align 1
  call void @increment_uncond_branch()
  br label %409

409:                                              ; preds = %402
  %410 = load i64, ptr %5, align 8
  %411 = add i64 %410, 1
  store i64 %411, ptr %5, align 8
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %364, !llvm.loop !19

412:                                              ; preds = %364
  store i64 0, ptr %6, align 8
  call void @increment_uncond_branch()
  br label %413

413:                                              ; preds = %419, %412
  %414 = load i64, ptr %6, align 8
  %415 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 %414
  %416 = load i64, ptr %415, align 8
  %417 = icmp eq i64 %416, 0
  call void @increment_cond_branch()
  br i1 %417, label %418, label %422

418:                                              ; preds = %413
  call void @increment_uncond_branch()
  br label %419

419:                                              ; preds = %418
  %420 = load i64, ptr %6, align 8
  %421 = add i64 %420, 1
  store i64 %421, ptr %6, align 8
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %413, !llvm.loop !20

422:                                              ; preds = %413
  store i64 0, ptr %9, align 8
  %423 = load i64, ptr %6, align 8
  store i64 %423, ptr %5, align 8
  store i64 128, ptr %8, align 8
  store i64 0, ptr %7, align 8
  %424 = load ptr, ptr %14, align 8
  store ptr %424, ptr %12, align 8
  %425 = load ptr, ptr %3, align 8
  store ptr %425, ptr %13, align 8
  call void @increment_uncond_branch()
  br label %426

426:                                              ; preds = %478, %422
  %427 = load i64, ptr %7, align 8
  %428 = load i64, ptr %4, align 8
  %429 = icmp ult i64 %427, %428
  call void @increment_cond_branch()
  br i1 %429, label %430, label %479

430:                                              ; preds = %426
  %431 = load i64, ptr %9, align 8
  %432 = mul i64 %431, 2
  %433 = add i64 %432, 1
  store i64 %433, ptr %9, align 8
  %434 = load ptr, ptr %12, align 8
  %435 = load i8, ptr %434, align 1
  %436 = zext i8 %435 to i64
  %437 = load i64, ptr %8, align 8
  %438 = and i64 %436, %437
  %439 = icmp ne i64 %438, 0
  call void @increment_cond_branch()
  br i1 %439, label %440, label %443

440:                                              ; preds = %430
  %441 = load i64, ptr %9, align 8
  %442 = add i64 %441, 1
  store i64 %442, ptr %9, align 8
  call void @increment_uncond_branch()
  br label %443

443:                                              ; preds = %440, %430
  call void @increment_uncond_branch()
  br label %444

444:                                              ; preds = %450, %443
  %445 = load i64, ptr %5, align 8
  %446 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 %445
  %447 = load i64, ptr %446, align 8
  %448 = load i64, ptr %9, align 8
  %449 = icmp ult i64 %447, %448
  call void @increment_cond_branch()
  br i1 %449, label %450, label %453

450:                                              ; preds = %444
  %451 = load i64, ptr %5, align 8
  %452 = add i64 %451, 1
  store i64 %452, ptr %5, align 8
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %444, !llvm.loop !21

453:                                              ; preds = %444
  %454 = load i64, ptr %9, align 8
  %455 = load i64, ptr %5, align 8
  %456 = getelementptr inbounds [256 x i64], ptr %29, i64 0, i64 %455
  %457 = load i64, ptr %456, align 8
  %458 = icmp eq i64 %454, %457
  call void @increment_cond_branch()
  br i1 %458, label %459, label %469

459:                                              ; preds = %453
  %460 = load i64, ptr %5, align 8
  %461 = getelementptr inbounds [256 x i8], ptr %30, i64 0, i64 %460
  %462 = load i8, ptr %461, align 1
  %463 = load ptr, ptr %13, align 8
  store i8 %462, ptr %463, align 1
  %464 = load ptr, ptr %13, align 8
  %465 = getelementptr inbounds i8, ptr %464, i32 1
  store ptr %465, ptr %13, align 8
  %466 = load i64, ptr %7, align 8
  %467 = add i64 %466, 1
  store i64 %467, ptr %7, align 8
  store i64 0, ptr %9, align 8
  %468 = load i64, ptr %6, align 8
  store i64 %468, ptr %5, align 8
  call void @increment_uncond_branch()
  br label %469

469:                                              ; preds = %459, %453
  %470 = load i64, ptr %8, align 8
  %471 = icmp ugt i64 %470, 1
  call void @increment_cond_branch()
  br i1 %471, label %472, label %475

472:                                              ; preds = %469
  %473 = load i64, ptr %8, align 8
  %474 = lshr i64 %473, 1
  store i64 %474, ptr %8, align 8
  call void @increment_uncond_branch()
  br label %478

475:                                              ; preds = %469
  store i64 128, ptr %8, align 8
  %476 = load ptr, ptr %12, align 8
  %477 = getelementptr inbounds i8, ptr %476, i32 1
  store ptr %477, ptr %12, align 8
  call void @increment_uncond_branch()
  br label %478

478:                                              ; preds = %475, %472
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %426, !llvm.loop !22

479:                                              ; preds = %426
  %480 = load ptr, ptr %14, align 8
  call void @increment_direct_call()
  call void @free_beebs(ptr noundef %480)
  call void @increment_uncond_branch()
  br label %481

481:                                              ; preds = %479, %253, %215, %210
  call void @increment_return()
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @heap_adjust(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %11 = load ptr, ptr %6, align 8
  %12 = getelementptr inbounds i64, ptr %11, i32 -1
  store ptr %12, ptr %6, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = load i32, ptr %8, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i64, ptr %13, i64 %15
  %17 = load i64, ptr %16, align 8
  %18 = trunc i64 %17 to i32
  store i32 %18, ptr %10, align 4
  call void @increment_uncond_branch()
  br label %19

19:                                               ; preds = %69, %4
  %20 = load i32, ptr %8, align 4
  %21 = load i32, ptr %7, align 4
  %22 = sdiv i32 %21, 2
  %23 = icmp sle i32 %20, %22
  call void @increment_cond_branch()
  br i1 %23, label %24, label %80

24:                                               ; preds = %19
  %25 = load i32, ptr %8, align 4
  %26 = load i32, ptr %8, align 4
  %27 = add nsw i32 %25, %26
  store i32 %27, ptr %9, align 4
  %28 = load i32, ptr %9, align 4
  %29 = load i32, ptr %7, align 4
  %30 = icmp slt i32 %28, %29
  call void @increment_cond_branch()
  br i1 %30, label %31, label %53

31:                                               ; preds = %24
  %32 = load ptr, ptr %5, align 8
  %33 = load ptr, ptr %6, align 8
  %34 = load i32, ptr %9, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i64, ptr %33, i64 %35
  %37 = load i64, ptr %36, align 8
  %38 = getelementptr inbounds i64, ptr %32, i64 %37
  %39 = load i64, ptr %38, align 8
  %40 = load ptr, ptr %5, align 8
  %41 = load ptr, ptr %6, align 8
  %42 = load i32, ptr %9, align 4
  %43 = add nsw i32 %42, 1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i64, ptr %41, i64 %44
  %46 = load i64, ptr %45, align 8
  %47 = getelementptr inbounds i64, ptr %40, i64 %46
  %48 = load i64, ptr %47, align 8
  %49 = icmp ugt i64 %39, %48
  call void @increment_cond_branch()
  br i1 %49, label %50, label %53

50:                                               ; preds = %31
  %51 = load i32, ptr %9, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %9, align 4
  call void @increment_uncond_branch()
  br label %53

53:                                               ; preds = %50, %31, %24
  %54 = load ptr, ptr %5, align 8
  %55 = load i32, ptr %10, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i64, ptr %54, i64 %56
  %58 = load i64, ptr %57, align 8
  %59 = load ptr, ptr %5, align 8
  %60 = load ptr, ptr %6, align 8
  %61 = load i32, ptr %9, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i64, ptr %60, i64 %62
  %64 = load i64, ptr %63, align 8
  %65 = getelementptr inbounds i64, ptr %59, i64 %64
  %66 = load i64, ptr %65, align 8
  %67 = icmp ult i64 %58, %66
  call void @increment_cond_branch()
  br i1 %67, label %68, label %69

68:                                               ; preds = %53
  call void @increment_uncond_branch()
  br label %80

69:                                               ; preds = %53
  %70 = load ptr, ptr %6, align 8
  %71 = load i32, ptr %9, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i64, ptr %70, i64 %72
  %74 = load i64, ptr %73, align 8
  %75 = load ptr, ptr %6, align 8
  %76 = load i32, ptr %8, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i64, ptr %75, i64 %77
  store i64 %74, ptr %78, align 8
  %79 = load i32, ptr %9, align 4
  store i32 %79, ptr %8, align 4
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %19, !llvm.loop !23

80:                                               ; preds = %68, %19
  %81 = load i32, ptr %10, align 4
  %82 = sext i32 %81 to i64
  %83 = load ptr, ptr %6, align 8
  %84 = load i32, ptr %8, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i64, ptr %83, i64 %85
  store i64 %82, ptr %86, align 8
  call void @increment_return()
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @verify_benchmark(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @increment_direct_call()
  %3 = call i32 @memcmp(ptr noundef @test_data, ptr noundef @orig_data, i64 noundef 500) #5
  %4 = icmp eq i32 0, %3
  %5 = zext i1 %4 to i32
  call void @increment_return()
  ret i32 %5
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef) #2

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
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  call void @increment_uncond_branch()
  br label %4

4:                                                ; preds = %9, %1
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %2, align 4
  %7 = icmp slt i32 %5, %6
  call void @increment_cond_branch()
  br i1 %7, label %8, label %12

8:                                                ; preds = %4
  call void @init_heap_beebs(ptr noundef @heap, i64 noundef 8192)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 @test_data, ptr align 16 @orig_data, i64 500, i1 false)
  call void @increment_direct_call()
  call void @compdecomp(ptr noundef @test_data, i64 noundef 500)
  call void @increment_uncond_branch()
  br label %9

9:                                                ; preds = %8
  %10 = load i32, ptr %3, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %3, align 4
  call void @increment_uncond_branch()
  call void @increment_loop_header()
  br label %4, !llvm.loop !24

12:                                               ; preds = %4
  call void @increment_return()
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @benchmark() #0 {
  call void @increment_direct_call()
  %1 = call i32 @benchmark_body(i32 noundef 11000)
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

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

declare void @increment_return()

declare void @increment_cond_branch()

declare void @increment_uncond_branch()

declare void @increment_direct_call()

declare void @increment_loop_header()

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
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
