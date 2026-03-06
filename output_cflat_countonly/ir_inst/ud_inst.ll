; ModuleID = './output_cflat_countonly/ir/ud.ll'
source_filename = "./embench-iot-benchmarks-backup-cflat/libud.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@x = dso_local global [20 x i64] zeroinitializer, align 8
@a = dso_local global [20 x [20 x i64]] zeroinitializer, align 8
@b = dso_local global [20 x i64] zeroinitializer, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@chkerr = dso_local global i32 0, align 4
@llvm.compiler.used = appending global [1 x ptr] [ptr @main], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @verify_benchmark(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca [20 x i64], align 8
  store i32 %0, ptr %2, align 4
  call void @llvm.memset.p0.i64(ptr align 8 %3, i8 0, i64 160, i1 false)
  %4 = getelementptr inbounds <{ i64, i64, i64, i64, i64, i64, [14 x i64] }>, ptr %3, i32 0, i32 2
  store i64 1, ptr %4, align 8
  %5 = getelementptr inbounds <{ i64, i64, i64, i64, i64, i64, [14 x i64] }>, ptr %3, i32 0, i32 3
  store i64 1, ptr %5, align 8
  %6 = getelementptr inbounds <{ i64, i64, i64, i64, i64, i64, [14 x i64] }>, ptr %3, i32 0, i32 4
  store i64 1, ptr %6, align 8
  %7 = getelementptr inbounds <{ i64, i64, i64, i64, i64, i64, [14 x i64] }>, ptr %3, i32 0, i32 5
  store i64 2, ptr %7, align 8
  %8 = getelementptr inbounds [20 x i64], ptr %3, i64 0, i64 0
  %9 = call i32 @memcmp(ptr noundef @x, ptr noundef %8, i64 noundef 160) #4
  %10 = icmp eq i32 0, %9
  call void @__cflat_record_node(i64 99248985009296)
  br i1 %10, label %11, label %14

11:                                               ; preds = %1
  %12 = load i32, ptr %2, align 4
  %13 = icmp eq i32 0, %12
  call void @__cflat_record_node(i64 99248985016352)
  br label %14

14:                                               ; preds = %11, %1
  %15 = phi i1 [ false, %1 ], [ %13, %11 ]
  %16 = zext i1 %15 to i32
  call void @__cflat_call_return(i64 99248985009296)
  ret i32 %16
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @initialise_benchmark() #0 {
  call void @__cflat_call_return(i64 99248985017856)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @warm_caches(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  call void @__cflat_call_enter(i64 99248985018704, i64 99248985015584)
  %5 = call i32 @benchmark_body(i32 noundef %4)
  store i32 %5, ptr %3, align 4
  call void @__cflat_call_return(i64 99248985015584)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @benchmark_body(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  call void @__cflat_record_node(i64 99248985018704)
  br label %9

9:                                                ; preds = %75, %1
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %2, align 4
  %12 = icmp slt i32 %10, %11
  call void @__cflat_record_node(i64 99248985021072)
  br i1 %12, label %13, label %78

13:                                               ; preds = %9
  store i32 20, ptr %6, align 4
  store i32 5, ptr %7, align 4
  store i32 0, ptr %4, align 4
  call void @__cflat_record_node(i64 99248985021952)
  br label %14

14:                                               ; preds = %68, %13
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %7, align 4
  %17 = icmp sle i32 %15, %16
  call void @__cflat_record_node(i64 99248985022592)
  br i1 %17, label %18, label %71

18:                                               ; preds = %14
  store i64 0, ptr %8, align 8
  store i32 0, ptr %5, align 4
  call void @__cflat_record_node(i64 99248985023424)
  br label %19

19:                                               ; preds = %60, %18
  %20 = load i32, ptr %5, align 4
  %21 = load i32, ptr %7, align 4
  %22 = icmp sle i32 %20, %21
  call void @__cflat_record_node(i64 99248985023904)
  br i1 %22, label %23, label %63

23:                                               ; preds = %19
  %24 = load i32, ptr %4, align 4
  %25 = add nsw i32 %24, 1
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %26, 1
  %28 = add nsw i32 %25, %27
  %29 = sext i32 %28 to i64
  %30 = load i32, ptr %4, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [20 x [20 x i64]], ptr @a, i64 0, i64 %31
  %33 = load i32, ptr %5, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [20 x i64], ptr %32, i64 0, i64 %34
  store i64 %29, ptr %35, align 8
  %36 = load i32, ptr %4, align 4
  %37 = load i32, ptr %5, align 4
  %38 = icmp eq i32 %36, %37
  call void @__cflat_record_node(i64 99248985024704)
  br i1 %38, label %39, label %50

39:                                               ; preds = %23
  %40 = load i32, ptr %4, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [20 x [20 x i64]], ptr @a, i64 0, i64 %41
  %43 = load i32, ptr %5, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [20 x i64], ptr %42, i64 0, i64 %44
  %46 = load i64, ptr %45, align 8
  %47 = sitofp i64 %46 to double
  %48 = fmul double %47, 2.000000e+00
  %49 = fptosi double %48 to i64
  store i64 %49, ptr %45, align 8
  call void @__cflat_record_node(i64 99248985027328)
  br label %50

50:                                               ; preds = %39, %23
  %51 = load i32, ptr %4, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [20 x [20 x i64]], ptr @a, i64 0, i64 %52
  %54 = load i32, ptr %5, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [20 x i64], ptr %53, i64 0, i64 %55
  %57 = load i64, ptr %56, align 8
  %58 = load i64, ptr %8, align 8
  %59 = add nsw i64 %58, %57
  store i64 %59, ptr %8, align 8
  call void @__cflat_record_node(i64 99248985033600)
  br label %60

60:                                               ; preds = %50
  %61 = load i32, ptr %5, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %5, align 4
  call void @__cflat_record_node(i64 99248985035216)
  br label %19, !llvm.loop !6

63:                                               ; preds = %19
  %64 = load i64, ptr %8, align 8
  %65 = load i32, ptr %4, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [20 x i64], ptr @b, i64 0, i64 %66
  store i64 %64, ptr %67, align 8
  call void @__cflat_record_node(i64 99248985038592)
  br label %68

68:                                               ; preds = %63
  %69 = load i32, ptr %4, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, ptr %4, align 4
  call void @__cflat_record_node(i64 99248985039504)
  br label %14, !llvm.loop !8

71:                                               ; preds = %14
  %72 = load i32, ptr %6, align 4
  %73 = load i32, ptr %7, align 4
  call void @__cflat_call_enter(i64 99248985040560, i64 99248985040304)
  %74 = call i32 @ludcmp(i32 noundef %72, i32 noundef %73)
  store volatile i32 %74, ptr @chkerr, align 4
  call void @__cflat_record_node(i64 99248985040304)
  br label %75

75:                                               ; preds = %71
  %76 = load i32, ptr %3, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, ptr %3, align 4
  call void @__cflat_record_node(i64 99248985041312)
  br label %9, !llvm.loop !9

78:                                               ; preds = %9
  %79 = load volatile i32, ptr @chkerr, align 4
  call void @__cflat_call_return(i64 99248985018704)
  ret i32 %79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @benchmark() #0 {
  call void @__cflat_call_enter(i64 99248985018704, i64 99248985029328)
  %1 = call i32 @benchmark_body(i32 noundef 1478000)
  call void @__cflat_call_return(i64 99248985029328)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ludcmp(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca [100 x i64], align 8
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  call void @__cflat_record_node(i64 99248985040560)
  br label %10

10:                                               ; preds = %132, %2
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %4, align 4
  %13 = icmp slt i32 %11, %12
  call void @__cflat_record_node(i64 99248985043408)
  br i1 %13, label %14, label %135

14:                                               ; preds = %10
  %15 = load i32, ptr %5, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %6, align 4
  call void @__cflat_record_node(i64 99248985044208)
  br label %17

17:                                               ; preds = %74, %14
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %4, align 4
  %20 = icmp sle i32 %18, %19
  call void @__cflat_record_node(i64 99248985044832)
  br i1 %20, label %21, label %77

21:                                               ; preds = %17
  %22 = load i32, ptr %6, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [20 x [20 x i64]], ptr @a, i64 0, i64 %23
  %25 = load i32, ptr %5, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [20 x i64], ptr %24, i64 0, i64 %26
  %28 = load i64, ptr %27, align 8
  store i64 %28, ptr %8, align 8
  %29 = load i32, ptr %5, align 4
  %30 = icmp ne i32 %29, 0
  call void @__cflat_record_node(i64 99248985045632)
  br i1 %30, label %31, label %58

31:                                               ; preds = %21
  store i32 0, ptr %7, align 4
  call void @__cflat_record_node(i64 99248985047488)
  br label %32

32:                                               ; preds = %54, %31
  %33 = load i32, ptr %7, align 4
  %34 = load i32, ptr %5, align 4
  %35 = icmp slt i32 %33, %34
  call void @__cflat_record_node(i64 99248985047808)
  br i1 %35, label %36, label %57

36:                                               ; preds = %32
  %37 = load i32, ptr %6, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [20 x [20 x i64]], ptr @a, i64 0, i64 %38
  %40 = load i32, ptr %7, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [20 x i64], ptr %39, i64 0, i64 %41
  %43 = load i64, ptr %42, align 8
  %44 = load i32, ptr %7, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [20 x [20 x i64]], ptr @a, i64 0, i64 %45
  %47 = load i32, ptr %5, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [20 x i64], ptr %46, i64 0, i64 %48
  %50 = load i64, ptr %49, align 8
  %51 = mul nsw i64 %43, %50
  %52 = load i64, ptr %8, align 8
  %53 = sub nsw i64 %52, %51
  store i64 %53, ptr %8, align 8
  call void @__cflat_record_node(i64 99248985048608)
  br label %54

54:                                               ; preds = %36
  %55 = load i32, ptr %7, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, ptr %7, align 4
  call void @__cflat_record_node(i64 99248985053424)
  br label %32, !llvm.loop !10

57:                                               ; preds = %32
  call void @__cflat_record_node(i64 99248985054224)
  br label %58

58:                                               ; preds = %57, %21
  %59 = load i64, ptr %8, align 8
  %60 = load i32, ptr %5, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [20 x [20 x i64]], ptr @a, i64 0, i64 %61
  %63 = load i32, ptr %5, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [20 x i64], ptr %62, i64 0, i64 %64
  %66 = load i64, ptr %65, align 8
  %67 = sdiv i64 %59, %66
  %68 = load i32, ptr %6, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [20 x [20 x i64]], ptr @a, i64 0, i64 %69
  %71 = load i32, ptr %5, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [20 x i64], ptr %70, i64 0, i64 %72
  store i64 %67, ptr %73, align 8
  call void @__cflat_record_node(i64 99248985054336)
  br label %74

74:                                               ; preds = %58
  %75 = load i32, ptr %6, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, ptr %6, align 4
  call void @__cflat_record_node(i64 99248985056816)
  br label %17, !llvm.loop !11

77:                                               ; preds = %17
  %78 = load i32, ptr %5, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, ptr %6, align 4
  call void @__cflat_record_node(i64 99248985057552)
  br label %80

80:                                               ; preds = %128, %77
  %81 = load i32, ptr %6, align 4
  %82 = load i32, ptr %4, align 4
  %83 = icmp sle i32 %81, %82
  call void @__cflat_record_node(i64 99248985058176)
  br i1 %83, label %84, label %131

84:                                               ; preds = %80
  %85 = load i32, ptr %5, align 4
  %86 = add nsw i32 %85, 1
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [20 x [20 x i64]], ptr @a, i64 0, i64 %87
  %89 = load i32, ptr %6, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [20 x i64], ptr %88, i64 0, i64 %90
  %92 = load i64, ptr %91, align 8
  store i64 %92, ptr %8, align 8
  store i32 0, ptr %7, align 4
  call void @__cflat_record_node(i64 99248985058976)
  br label %93

93:                                               ; preds = %116, %84
  %94 = load i32, ptr %7, align 4
  %95 = load i32, ptr %5, align 4
  %96 = icmp sle i32 %94, %95
  call void @__cflat_record_node(i64 99248985060624)
  br i1 %96, label %97, label %119

97:                                               ; preds = %93
  %98 = load i32, ptr %5, align 4
  %99 = add nsw i32 %98, 1
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [20 x [20 x i64]], ptr @a, i64 0, i64 %100
  %102 = load i32, ptr %7, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [20 x i64], ptr %101, i64 0, i64 %103
  %105 = load i64, ptr %104, align 8
  %106 = load i32, ptr %7, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [20 x [20 x i64]], ptr @a, i64 0, i64 %107
  %109 = load i32, ptr %6, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [20 x i64], ptr %108, i64 0, i64 %110
  %112 = load i64, ptr %111, align 8
  %113 = mul nsw i64 %105, %112
  %114 = load i64, ptr %8, align 8
  %115 = sub nsw i64 %114, %113
  store i64 %115, ptr %8, align 8
  call void @__cflat_record_node(i64 99248985050704)
  br label %116

116:                                              ; preds = %97
  %117 = load i32, ptr %7, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, ptr %7, align 4
  call void @__cflat_record_node(i64 99248985066384)
  br label %93, !llvm.loop !12

119:                                              ; preds = %93
  %120 = load i64, ptr %8, align 8
  %121 = load i32, ptr %5, align 4
  %122 = add nsw i32 %121, 1
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [20 x [20 x i64]], ptr @a, i64 0, i64 %123
  %125 = load i32, ptr %6, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [20 x i64], ptr %124, i64 0, i64 %126
  store i64 %120, ptr %127, align 8
  call void @__cflat_record_node(i64 99248985067184)
  br label %128

128:                                              ; preds = %119
  %129 = load i32, ptr %6, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, ptr %6, align 4
  call void @__cflat_record_node(i64 99248985068672)
  br label %80, !llvm.loop !13

131:                                              ; preds = %80
  call void @__cflat_record_node(i64 99248985069552)
  br label %132

132:                                              ; preds = %131
  %133 = load i32, ptr %5, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, ptr %5, align 4
  call void @__cflat_record_node(i64 99248985069664)
  br label %10, !llvm.loop !14

135:                                              ; preds = %10
  %136 = load i64, ptr @b, align 8
  %137 = getelementptr inbounds [100 x i64], ptr %9, i64 0, i64 0
  store i64 %136, ptr %137, align 8
  store i32 1, ptr %5, align 4
  call void @__cflat_record_node(i64 99248985070464)
  br label %138

138:                                              ; preds = %174, %135
  %139 = load i32, ptr %5, align 4
  %140 = load i32, ptr %4, align 4
  %141 = icmp sle i32 %139, %140
  call void @__cflat_record_node(i64 99248985071296)
  br i1 %141, label %142, label %177

142:                                              ; preds = %138
  %143 = load i32, ptr %5, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [20 x i64], ptr @b, i64 0, i64 %144
  %146 = load i64, ptr %145, align 8
  store i64 %146, ptr %8, align 8
  store i32 0, ptr %6, align 4
  call void @__cflat_record_node(i64 99248985072096)
  br label %147

147:                                              ; preds = %166, %142
  %148 = load i32, ptr %6, align 4
  %149 = load i32, ptr %5, align 4
  %150 = icmp slt i32 %148, %149
  call void @__cflat_record_node(i64 99248985073168)
  br i1 %150, label %151, label %169

151:                                              ; preds = %147
  %152 = load i32, ptr %5, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [20 x [20 x i64]], ptr @a, i64 0, i64 %153
  %155 = load i32, ptr %6, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds [20 x i64], ptr %154, i64 0, i64 %156
  %158 = load i64, ptr %157, align 8
  %159 = load i32, ptr %6, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [100 x i64], ptr %9, i64 0, i64 %160
  %162 = load i64, ptr %161, align 8
  %163 = mul nsw i64 %158, %162
  %164 = load i64, ptr %8, align 8
  %165 = sub nsw i64 %164, %163
  store i64 %165, ptr %8, align 8
  call void @__cflat_record_node(i64 99248985073968)
  br label %166

166:                                              ; preds = %151
  %167 = load i32, ptr %6, align 4
  %168 = add nsw i32 %167, 1
  store i32 %168, ptr %6, align 4
  call void @__cflat_record_node(i64 99248985076288)
  br label %147, !llvm.loop !15

169:                                              ; preds = %147
  %170 = load i64, ptr %8, align 8
  %171 = load i32, ptr %5, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds [100 x i64], ptr %9, i64 0, i64 %172
  store i64 %170, ptr %173, align 8
  call void @__cflat_record_node(i64 99248985077088)
  br label %174

174:                                              ; preds = %169
  %175 = load i32, ptr %5, align 4
  %176 = add nsw i32 %175, 1
  store i32 %176, ptr %5, align 4
  call void @__cflat_record_node(i64 99248985078000)
  br label %138, !llvm.loop !16

177:                                              ; preds = %138
  %178 = load i32, ptr %4, align 4
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds [100 x i64], ptr %9, i64 0, i64 %179
  %181 = load i64, ptr %180, align 8
  %182 = load i32, ptr %4, align 4
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds [20 x [20 x i64]], ptr @a, i64 0, i64 %183
  %185 = load i32, ptr %4, align 4
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [20 x i64], ptr %184, i64 0, i64 %186
  %188 = load i64, ptr %187, align 8
  %189 = sdiv i64 %181, %188
  %190 = load i32, ptr %4, align 4
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds [20 x i64], ptr @x, i64 0, i64 %191
  store i64 %189, ptr %192, align 8
  %193 = load i32, ptr %4, align 4
  %194 = sub nsw i32 %193, 1
  store i32 %194, ptr %5, align 4
  call void @__cflat_record_node(i64 99248985078800)
  br label %195

195:                                              ; preds = %240, %177
  %196 = load i32, ptr %5, align 4
  %197 = icmp sge i32 %196, 0
  call void @__cflat_record_node(i64 99248985061856)
  br i1 %197, label %198, label %243

198:                                              ; preds = %195
  %199 = load i32, ptr %5, align 4
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds [100 x i64], ptr %9, i64 0, i64 %200
  %202 = load i64, ptr %201, align 8
  store i64 %202, ptr %8, align 8
  %203 = load i32, ptr %5, align 4
  %204 = add nsw i32 %203, 1
  store i32 %204, ptr %6, align 4
  call void @__cflat_record_node(i64 99248985062528)
  br label %205

205:                                              ; preds = %224, %198
  %206 = load i32, ptr %6, align 4
  %207 = load i32, ptr %4, align 4
  %208 = icmp sle i32 %206, %207
  call void @__cflat_record_node(i64 99248985063872)
  br i1 %208, label %209, label %227

209:                                              ; preds = %205
  %210 = load i32, ptr %5, align 4
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds [20 x [20 x i64]], ptr @a, i64 0, i64 %211
  %213 = load i32, ptr %6, align 4
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [20 x i64], ptr %212, i64 0, i64 %214
  %216 = load i64, ptr %215, align 8
  %217 = load i32, ptr %6, align 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds [20 x i64], ptr @x, i64 0, i64 %218
  %220 = load i64, ptr %219, align 8
  %221 = mul nsw i64 %216, %220
  %222 = load i64, ptr %8, align 8
  %223 = sub nsw i64 %222, %221
  store i64 %223, ptr %8, align 8
  call void @__cflat_record_node(i64 99248985064672)
  br label %224

224:                                              ; preds = %209
  %225 = load i32, ptr %6, align 4
  %226 = add nsw i32 %225, 1
  store i32 %226, ptr %6, align 4
  call void @__cflat_record_node(i64 99248985090944)
  br label %205, !llvm.loop !17

227:                                              ; preds = %205
  %228 = load i64, ptr %8, align 8
  %229 = load i32, ptr %5, align 4
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds [20 x [20 x i64]], ptr @a, i64 0, i64 %230
  %232 = load i32, ptr %5, align 4
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds [20 x i64], ptr %231, i64 0, i64 %233
  %235 = load i64, ptr %234, align 8
  %236 = sdiv i64 %228, %235
  %237 = load i32, ptr %5, align 4
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds [20 x i64], ptr @x, i64 0, i64 %238
  store i64 %236, ptr %239, align 8
  call void @__cflat_record_node(i64 99248985091744)
  br label %240

240:                                              ; preds = %227
  %241 = load i32, ptr %5, align 4
  %242 = add nsw i32 %241, -1
  store i32 %242, ptr %5, align 4
  call void @__cflat_record_node(i64 99248985093792)
  br label %195, !llvm.loop !18

243:                                              ; preds = %195
  call void @__cflat_call_return(i64 99248985040560)
  ret i32 0
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
  call void @__cflat_call_enter(i64 99248985054064, i64 99248985004416)
  call void @initialise_benchmark()
  call void @__cflat_call_enter(i64 99248985015584, i64 99248985004416)
  call void @warm_caches(i32 noundef 0)
  call void @__cflat_call_enter(i64 99248985133920, i64 99248985004416)
  %8 = call i32 @benchmark()
  store volatile i32 %8, ptr %6, align 4
  call void @cflat_finalize_and_print()
  %9 = load volatile i32, ptr %6, align 4
  call void @__cflat_call_enter(i64 99248985009296, i64 99248985004416)
  %10 = call i32 @verify_benchmark(i32 noundef %9)
  store i32 %10, ptr %7, align 4
  %11 = load i32, ptr %7, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %11)
  call void @__cflat_call_return(i64 99248985004416)
  ret i32 0
}

declare void @cflat_finalize_and_print() #3

declare i32 @printf(ptr noundef, ...) #3

declare void @__cflat_record_node(i64)

declare void @__cflat_call_return(i64)

declare void @__cflat_call_enter(i64, i64)

attributes #0 = { noinline nounwind uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
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
