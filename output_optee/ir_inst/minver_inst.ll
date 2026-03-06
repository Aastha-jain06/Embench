; ModuleID = './output_optee/ir/minver.ll'
source_filename = "./embench-iot-benchmarks/libminver.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@a = internal global [3 x [3 x float]] zeroinitializer, align 4
@b = internal global [3 x [3 x float]] [[3 x float] [float -3.000000e+00, float 0.000000e+00, float 2.000000e+00], [3 x float] [float 3.000000e+00, float -2.000000e+00, float 0.000000e+00], [3 x float] [float 0.000000e+00, float 2.000000e+00, float -3.000000e+00]], align 4
@c = internal global [3 x [3 x float]] zeroinitializer, align 4
@det = internal global float 0.000000e+00, align 4
@verify_benchmark.c_exp = internal global [3 x [3 x float]] [[3 x float] [float -2.700000e+01, float 2.600000e+01, float -1.500000e+01], [3 x float] [float -2.700000e+01, float -1.000000e+01, float 3.300000e+01], [3 x float] [float -3.900000e+01, float 2.800000e+01, float -8.000000e+00]], align 4
@verify_benchmark.d_exp = internal global [3 x [3 x float]] [[3 x float] [float 0x3FC1111100000000, float 0xBFC9999940000000, float 0x3FD11110C0000000], [3 x float] [float 0xBFE0A3D6C0000000, float 0x3FBD0369C0000000, float 0x3FE0DA73C0000000], [3 x float] [float 0x3FDEB85140000000, float 0xBFD70A3D00000000, float 0x3FA47AE100000000]], align 4
@d = internal global [3 x [3 x float]] zeroinitializer, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@a_ref = internal global [3 x [3 x float]] [[3 x float] [float 3.000000e+00, float -6.000000e+00, float 7.000000e+00], [3 x float] [float 9.000000e+00, float 0.000000e+00, float -5.000000e+00], [3 x float] [float 5.000000e+00, float -8.000000e+00, float 6.000000e+00]], align 4
@llvm.compiler.used = appending global [1 x ptr] [ptr @main], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @mmul(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca float, align 4
  store i32 %0, ptr %6, align 4
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  %16 = load i32, ptr %6, align 4
  store i32 %16, ptr %13, align 4
  %17 = load i32, ptr %9, align 4
  store i32 %17, ptr %14, align 4
  %18 = load i32, ptr %13, align 4
  %19 = icmp slt i32 %18, 1
  call void @__cflat_record_node(i64 104736275592192)
  br i1 %19, label %30, label %20

20:                                               ; preds = %4
  %21 = load i32, ptr %8, align 4
  %22 = icmp slt i32 %21, 1
  call void @__cflat_record_node(i64 104736275596384)
  br i1 %22, label %30, label %23

23:                                               ; preds = %20
  %24 = load i32, ptr %14, align 4
  %25 = icmp slt i32 %24, 1
  call void @__cflat_record_node(i64 104736275596768)
  br i1 %25, label %30, label %26

26:                                               ; preds = %23
  %27 = load i32, ptr %7, align 4
  %28 = load i32, ptr %8, align 4
  %29 = icmp ne i32 %27, %28
  call void @__cflat_record_node(i64 104736275597152)
  br i1 %29, label %30, label %31

30:                                               ; preds = %26, %23, %20, %4
  store i32 999, ptr %5, align 4
  call void @__cflat_record_node(i64 104736275599296)
  br label %82

31:                                               ; preds = %26
  store i32 0, ptr %10, align 4
  call void @__cflat_record_node(i64 104736275600736)
  br label %32

32:                                               ; preds = %78, %31
  %33 = load i32, ptr %10, align 4
  %34 = load i32, ptr %13, align 4
  %35 = icmp slt i32 %33, %34
  call void @__cflat_record_node(i64 104736275601056)
  br i1 %35, label %36, label %81

36:                                               ; preds = %32
  store i32 0, ptr %11, align 4
  call void @__cflat_record_node(i64 104736275601744)
  br label %37

37:                                               ; preds = %74, %36
  %38 = load i32, ptr %11, align 4
  %39 = load i32, ptr %14, align 4
  %40 = icmp slt i32 %38, %39
  call void @__cflat_record_node(i64 104736275602064)
  br i1 %40, label %41, label %77

41:                                               ; preds = %37
  store float 0.000000e+00, ptr %15, align 4
  store i32 0, ptr %12, align 4
  call void @__cflat_record_node(i64 104736275602752)
  br label %42

42:                                               ; preds = %63, %41
  %43 = load i32, ptr %12, align 4
  %44 = load i32, ptr %8, align 4
  %45 = icmp slt i32 %43, %44
  call void @__cflat_record_node(i64 104736275603232)
  br i1 %45, label %46, label %66

46:                                               ; preds = %42
  %47 = load i32, ptr %10, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [3 x [3 x float]], ptr @a, i64 0, i64 %48
  %50 = load i32, ptr %12, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [3 x float], ptr %49, i64 0, i64 %51
  %53 = load float, ptr %52, align 4
  %54 = load i32, ptr %12, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [3 x [3 x float]], ptr @b, i64 0, i64 %55
  %57 = load i32, ptr %11, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [3 x float], ptr %56, i64 0, i64 %58
  %60 = load float, ptr %59, align 4
  %61 = load float, ptr %15, align 4
  %62 = call float @llvm.fmuladd.f32(float %53, float %60, float %61)
  store float %62, ptr %15, align 4
  call void @__cflat_record_node(i64 104736275604032)
  br label %63

63:                                               ; preds = %46
  %64 = load i32, ptr %12, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %12, align 4
  call void @__cflat_record_node(i64 104736275609040)
  br label %42, !llvm.loop !6

66:                                               ; preds = %42
  %67 = load float, ptr %15, align 4
  %68 = load i32, ptr %10, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [3 x [3 x float]], ptr @c, i64 0, i64 %69
  %71 = load i32, ptr %11, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [3 x float], ptr %70, i64 0, i64 %72
  store float %67, ptr %73, align 4
  call void @__cflat_record_node(i64 104736275612416)
  br label %74

74:                                               ; preds = %66
  %75 = load i32, ptr %11, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, ptr %11, align 4
  call void @__cflat_record_node(i64 104736275613760)
  br label %37, !llvm.loop !8

77:                                               ; preds = %37
  call void @__cflat_record_node(i64 104736275614640)
  br label %78

78:                                               ; preds = %77
  %79 = load i32, ptr %10, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, ptr %10, align 4
  call void @__cflat_record_node(i64 104736275614752)
  br label %32, !llvm.loop !9

81:                                               ; preds = %32
  store i32 0, ptr %5, align 4
  call void @__cflat_record_node(i64 104736275615584)
  br label %82

82:                                               ; preds = %81, %30
  %83 = load i32, ptr %5, align 4
  call void @__cflat_call_return(i64 104736275592192)
  ret i32 %83
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minver(i32 noundef %0, i32 noundef %1, float noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca float, align 4
  %8 = alloca [500 x i32], align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca float, align 4
  %17 = alloca float, align 4
  %18 = alloca float, align 4
  %19 = alloca float, align 4
  %20 = alloca float, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store float %2, ptr %7, align 4
  store float 0.000000e+00, ptr %16, align 4
  store i32 0, ptr %12, align 4
  %21 = load i32, ptr %5, align 4
  %22 = icmp slt i32 %21, 2
  call void @__cflat_record_node(i64 104736275605552)
  br i1 %22, label %30, label %23

23:                                               ; preds = %3
  %24 = load i32, ptr %5, align 4
  %25 = icmp sgt i32 %24, 500
  call void @__cflat_record_node(i64 104736275619008)
  br i1 %25, label %30, label %26

26:                                               ; preds = %23
  %27 = load float, ptr %7, align 4
  %28 = fpext float %27 to double
  %29 = fcmp ole double %28, 0.000000e+00
  call void @__cflat_record_node(i64 104736275619536)
  br i1 %29, label %30, label %31

30:                                               ; preds = %26, %23, %3
  store i32 999, ptr %4, align 4
  call void @__cflat_record_node(i64 104736275620272)
  br label %334

31:                                               ; preds = %26
  store float 1.000000e+00, ptr %20, align 4
  store i32 0, ptr %9, align 4
  call void @__cflat_record_node(i64 104736275620624)
  br label %32

32:                                               ; preds = %41, %31
  %33 = load i32, ptr %9, align 4
  %34 = load i32, ptr %5, align 4
  %35 = icmp slt i32 %33, %34
  call void @__cflat_record_node(i64 104736275621168)
  br i1 %35, label %36, label %44

36:                                               ; preds = %32
  %37 = load i32, ptr %9, align 4
  %38 = load i32, ptr %9, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [500 x i32], ptr %8, i64 0, i64 %39
  store i32 %37, ptr %40, align 4
  call void @__cflat_record_node(i64 104736275621968)
  br label %41

41:                                               ; preds = %36
  %42 = load i32, ptr %9, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %9, align 4
  call void @__cflat_record_node(i64 104736275622880)
  br label %32, !llvm.loop !10

44:                                               ; preds = %32
  store i32 0, ptr %11, align 4
  call void @__cflat_record_node(i64 104736275623712)
  br label %45

45:                                               ; preds = %255, %44
  %46 = load i32, ptr %11, align 4
  %47 = load i32, ptr %5, align 4
  %48 = icmp slt i32 %46, %47
  call void @__cflat_record_node(i64 104736275624032)
  br i1 %48, label %49, label %258

49:                                               ; preds = %45
  store float 0.000000e+00, ptr %17, align 4
  %50 = load i32, ptr %11, align 4
  store i32 %50, ptr %9, align 4
  call void @__cflat_record_node(i64 104736275626928)
  br label %51

51:                                               ; preds = %71, %49
  %52 = load i32, ptr %9, align 4
  %53 = load i32, ptr %5, align 4
  %54 = icmp slt i32 %52, %53
  call void @__cflat_record_node(i64 104736275627536)
  br i1 %54, label %55, label %74

55:                                               ; preds = %51
  %56 = load i32, ptr %9, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [3 x [3 x float]], ptr @a, i64 0, i64 %57
  %59 = load i32, ptr %11, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [3 x float], ptr %58, i64 0, i64 %60
  %62 = load float, ptr %61, align 4
  call void @__cflat_call_enter(i64 104736275629328, i64 104736275628336)
  %63 = call float @minver_fabs(float noundef %62)
  store float %63, ptr %16, align 4
  %64 = load float, ptr %16, align 4
  %65 = load float, ptr %17, align 4
  %66 = fcmp ogt float %64, %65
  call void @__cflat_record_node(i64 104736275628336)
  br i1 %66, label %67, label %70

67:                                               ; preds = %55
  %68 = load float, ptr %16, align 4
  store float %68, ptr %17, align 4
  %69 = load i32, ptr %9, align 4
  store i32 %69, ptr %12, align 4
  call void @__cflat_record_node(i64 104736275630656)
  br label %70

70:                                               ; preds = %67, %55
  call void @__cflat_record_node(i64 104736275631424)
  br label %71

71:                                               ; preds = %70
  %72 = load i32, ptr %9, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, ptr %9, align 4
  call void @__cflat_record_node(i64 104736275631536)
  br label %51, !llvm.loop !11

74:                                               ; preds = %51
  %75 = load i32, ptr %12, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [3 x [3 x float]], ptr @a, i64 0, i64 %76
  %78 = load i32, ptr %11, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [3 x float], ptr %77, i64 0, i64 %79
  %81 = load float, ptr %80, align 4
  store float %81, ptr %18, align 4
  %82 = load float, ptr %18, align 4
  call void @__cflat_call_enter(i64 104736275629328, i64 104736275632272)
  %83 = call float @minver_fabs(float noundef %82)
  store float %83, ptr %19, align 4
  %84 = load float, ptr %19, align 4
  %85 = load float, ptr %7, align 4
  %86 = fcmp ole float %84, %85
  call void @__cflat_record_node(i64 104736275632272)
  br i1 %86, label %87, label %89

87:                                               ; preds = %74
  %88 = load float, ptr %20, align 4
  store float %88, ptr @det, align 4
  store i32 1, ptr %4, align 4
  call void @__cflat_record_node(i64 104736275634752)
  br label %334

89:                                               ; preds = %74
  %90 = load float, ptr %18, align 4
  %91 = load float, ptr %20, align 4
  %92 = fmul float %91, %90
  store float %92, ptr %20, align 4
  %93 = load i32, ptr %11, align 4
  %94 = load i32, ptr %6, align 4
  %95 = mul nsw i32 %93, %94
  store i32 %95, ptr %14, align 4
  %96 = load i32, ptr %12, align 4
  %97 = load i32, ptr %6, align 4
  %98 = mul nsw i32 %96, %97
  store i32 %98, ptr %15, align 4
  %99 = load i32, ptr %12, align 4
  %100 = load i32, ptr %11, align 4
  %101 = icmp ne i32 %99, %100
  call void @__cflat_record_node(i64 104736275635312)
  br i1 %101, label %102, label %156

102:                                              ; preds = %89
  %103 = load float, ptr %16, align 4
  %104 = fneg float %103
  store float %104, ptr %20, align 4
  %105 = load i32, ptr %11, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [500 x i32], ptr %8, i64 0, i64 %106
  %108 = load i32, ptr %107, align 4
  store i32 %108, ptr %13, align 4
  %109 = load i32, ptr %12, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [500 x i32], ptr %8, i64 0, i64 %110
  %112 = load i32, ptr %111, align 4
  %113 = load i32, ptr %11, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [500 x i32], ptr %8, i64 0, i64 %114
  store i32 %112, ptr %115, align 4
  %116 = load i32, ptr %13, align 4
  %117 = load i32, ptr %12, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [500 x i32], ptr %8, i64 0, i64 %118
  store i32 %116, ptr %119, align 4
  store i32 0, ptr %10, align 4
  call void @__cflat_record_node(i64 104736275625744)
  br label %120

120:                                              ; preds = %152, %102
  %121 = load i32, ptr %10, align 4
  %122 = load i32, ptr %5, align 4
  %123 = icmp slt i32 %121, %122
  call void @__cflat_record_node(i64 104736275643120)
  br i1 %123, label %124, label %155

124:                                              ; preds = %120
  %125 = load i32, ptr %11, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [3 x [3 x float]], ptr @a, i64 0, i64 %126
  %128 = load i32, ptr %10, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [3 x float], ptr %127, i64 0, i64 %129
  %131 = load float, ptr %130, align 4
  store float %131, ptr %16, align 4
  %132 = load i32, ptr %12, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [3 x [3 x float]], ptr @a, i64 0, i64 %133
  %135 = load i32, ptr %10, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [3 x float], ptr %134, i64 0, i64 %136
  %138 = load float, ptr %137, align 4
  %139 = load i32, ptr %11, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [3 x [3 x float]], ptr @a, i64 0, i64 %140
  %142 = load i32, ptr %10, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [3 x float], ptr %141, i64 0, i64 %143
  store float %138, ptr %144, align 4
  %145 = load float, ptr %16, align 4
  %146 = load i32, ptr %12, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [3 x [3 x float]], ptr @a, i64 0, i64 %147
  %149 = load i32, ptr %10, align 4
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [3 x float], ptr %148, i64 0, i64 %150
  store float %145, ptr %151, align 4
  call void @__cflat_record_node(i64 104736275643920)
  br label %152

152:                                              ; preds = %124
  %153 = load i32, ptr %10, align 4
  %154 = add nsw i32 %153, 1
  store i32 %154, ptr %10, align 4
  call void @__cflat_record_node(i64 104736275648432)
  br label %120, !llvm.loop !12

155:                                              ; preds = %120
  call void @__cflat_record_node(i64 104736275649232)
  br label %156

156:                                              ; preds = %155, %89
  store i32 0, ptr %9, align 4
  call void @__cflat_record_node(i64 104736275649376)
  br label %157

157:                                              ; preds = %171, %156
  %158 = load i32, ptr %9, align 4
  %159 = load i32, ptr %5, align 4
  %160 = icmp slt i32 %158, %159
  call void @__cflat_record_node(i64 104736275649696)
  br i1 %160, label %161, label %174

161:                                              ; preds = %157
  %162 = load float, ptr %18, align 4
  %163 = load i32, ptr %11, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [3 x [3 x float]], ptr @a, i64 0, i64 %164
  %166 = load i32, ptr %9, align 4
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds [3 x float], ptr %165, i64 0, i64 %167
  %169 = load float, ptr %168, align 4
  %170 = fdiv float %169, %162
  store float %170, ptr %168, align 4
  call void @__cflat_record_node(i64 104736275650432)
  br label %171

171:                                              ; preds = %161
  %172 = load i32, ptr %9, align 4
  %173 = add nsw i32 %172, 1
  store i32 %173, ptr %9, align 4
  call void @__cflat_record_node(i64 104736275652048)
  br label %157, !llvm.loop !13

174:                                              ; preds = %157
  store i32 0, ptr %9, align 4
  call void @__cflat_record_node(i64 104736275652880)
  br label %175

175:                                              ; preds = %241, %174
  %176 = load i32, ptr %9, align 4
  %177 = load i32, ptr %5, align 4
  %178 = icmp slt i32 %176, %177
  call void @__cflat_record_node(i64 104736275653200)
  br i1 %178, label %179, label %244

179:                                              ; preds = %175
  %180 = load i32, ptr %9, align 4
  %181 = load i32, ptr %11, align 4
  %182 = icmp ne i32 %180, %181
  call void @__cflat_record_node(i64 104736275654000)
  br i1 %182, label %183, label %240

183:                                              ; preds = %179
  %184 = load i32, ptr %9, align 4
  %185 = load i32, ptr %6, align 4
  %186 = mul nsw i32 %184, %185
  store i32 %186, ptr %15, align 4
  %187 = load i32, ptr %9, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [3 x [3 x float]], ptr @a, i64 0, i64 %188
  %190 = load i32, ptr %11, align 4
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds [3 x float], ptr %189, i64 0, i64 %191
  %193 = load float, ptr %192, align 4
  store float %193, ptr %16, align 4
  %194 = load float, ptr %16, align 4
  %195 = fpext float %194 to double
  %196 = fcmp une double %195, 0.000000e+00
  call void @__cflat_record_node(i64 104736275654800)
  br i1 %196, label %197, label %239

197:                                              ; preds = %183
  store i32 0, ptr %10, align 4
  call void @__cflat_record_node(i64 104736275637568)
  br label %198

198:                                              ; preds = %225, %197
  %199 = load i32, ptr %10, align 4
  %200 = load i32, ptr %5, align 4
  %201 = icmp slt i32 %199, %200
  call void @__cflat_record_node(i64 104736275637888)
  br i1 %201, label %202, label %228

202:                                              ; preds = %198
  %203 = load i32, ptr %10, align 4
  %204 = load i32, ptr %11, align 4
  %205 = icmp ne i32 %203, %204
  call void @__cflat_record_node(i64 104736275638688)
  br i1 %205, label %206, label %224

206:                                              ; preds = %202
  %207 = load float, ptr %16, align 4
  %208 = load i32, ptr %11, align 4
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [3 x [3 x float]], ptr @a, i64 0, i64 %209
  %211 = load i32, ptr %10, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds [3 x float], ptr %210, i64 0, i64 %212
  %214 = load float, ptr %213, align 4
  %215 = load i32, ptr %9, align 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds [3 x [3 x float]], ptr @a, i64 0, i64 %216
  %218 = load i32, ptr %10, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [3 x float], ptr %217, i64 0, i64 %219
  %221 = load float, ptr %220, align 4
  %222 = fneg float %207
  %223 = call float @llvm.fmuladd.f32(float %222, float %214, float %221)
  store float %223, ptr %220, align 4
  call void @__cflat_record_node(i64 104736275639488)
  br label %224

224:                                              ; preds = %206, %202
  call void @__cflat_record_node(i64 104736275666096)
  br label %225

225:                                              ; preds = %224
  %226 = load i32, ptr %10, align 4
  %227 = add nsw i32 %226, 1
  store i32 %227, ptr %10, align 4
  call void @__cflat_record_node(i64 104736275666208)
  br label %198, !llvm.loop !14

228:                                              ; preds = %198
  %229 = load float, ptr %16, align 4
  %230 = fneg float %229
  %231 = load float, ptr %18, align 4
  %232 = fdiv float %230, %231
  %233 = load i32, ptr %9, align 4
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds [3 x [3 x float]], ptr @a, i64 0, i64 %234
  %236 = load i32, ptr %11, align 4
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds [3 x float], ptr %235, i64 0, i64 %237
  store float %232, ptr %238, align 4
  call void @__cflat_record_node(i64 104736275666944)
  br label %239

239:                                              ; preds = %228, %183
  call void @__cflat_record_node(i64 104736275668592)
  br label %240

240:                                              ; preds = %239, %179
  call void @__cflat_record_node(i64 104736275668784)
  br label %241

241:                                              ; preds = %240
  %242 = load i32, ptr %9, align 4
  %243 = add nsw i32 %242, 1
  store i32 %243, ptr %9, align 4
  call void @__cflat_record_node(i64 104736275668896)
  br label %175, !llvm.loop !15

244:                                              ; preds = %175
  %245 = load float, ptr %18, align 4
  %246 = fpext float %245 to double
  %247 = fdiv double 1.000000e+00, %246
  %248 = fptrunc double %247 to float
  %249 = load i32, ptr %11, align 4
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds [3 x [3 x float]], ptr @a, i64 0, i64 %250
  %252 = load i32, ptr %11, align 4
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds [3 x float], ptr %251, i64 0, i64 %253
  store float %248, ptr %254, align 4
  call void @__cflat_record_node(i64 104736275669568)
  br label %255

255:                                              ; preds = %244
  %256 = load i32, ptr %11, align 4
  %257 = add nsw i32 %256, 1
  store i32 %257, ptr %11, align 4
  call void @__cflat_record_node(i64 104736275671344)
  br label %45, !llvm.loop !16

258:                                              ; preds = %45
  store i32 0, ptr %9, align 4
  call void @__cflat_record_node(i64 104736275672176)
  br label %259

259:                                              ; preds = %329, %258
  %260 = load i32, ptr %9, align 4
  %261 = load i32, ptr %5, align 4
  %262 = icmp slt i32 %260, %261
  call void @__cflat_record_node(i64 104736275672496)
  br i1 %262, label %263, label %332

263:                                              ; preds = %259
  call void @__cflat_record_node(i64 104736275673376)
  br label %264

264:                                              ; preds = %327, %263
  %265 = load i32, ptr %9, align 4
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds [500 x i32], ptr %8, i64 0, i64 %266
  %268 = load i32, ptr %267, align 4
  store i32 %268, ptr %11, align 4
  %269 = load i32, ptr %11, align 4
  %270 = load i32, ptr %9, align 4
  %271 = icmp eq i32 %269, %270
  call void @__cflat_record_node(i64 104736275673488)
  br i1 %271, label %272, label %273

272:                                              ; preds = %264
  call void @__cflat_record_node(i64 104736275675088)
  br label %328

273:                                              ; preds = %264
  %274 = load i32, ptr %11, align 4
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds [500 x i32], ptr %8, i64 0, i64 %275
  %277 = load i32, ptr %276, align 4
  store i32 %277, ptr %13, align 4
  %278 = load i32, ptr %9, align 4
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds [500 x i32], ptr %8, i64 0, i64 %279
  %281 = load i32, ptr %280, align 4
  %282 = load i32, ptr %11, align 4
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds [500 x i32], ptr %8, i64 0, i64 %283
  store i32 %281, ptr %284, align 4
  %285 = load i32, ptr %13, align 4
  %286 = load i32, ptr %9, align 4
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds [500 x i32], ptr %8, i64 0, i64 %287
  store i32 %285, ptr %288, align 4
  store i32 0, ptr %10, align 4
  call void @__cflat_record_node(i64 104736275675200)
  br label %289

289:                                              ; preds = %324, %273
  %290 = load i32, ptr %10, align 4
  %291 = load i32, ptr %5, align 4
  %292 = icmp slt i32 %290, %291
  call void @__cflat_record_node(i64 104736275678144)
  br i1 %292, label %293, label %327

293:                                              ; preds = %289
  %294 = load i32, ptr %10, align 4
  %295 = load i32, ptr %6, align 4
  %296 = mul nsw i32 %294, %295
  store i32 %296, ptr %14, align 4
  %297 = load i32, ptr %11, align 4
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds [3 x [3 x float]], ptr @a, i64 0, i64 %298
  %300 = load i32, ptr %9, align 4
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds [3 x float], ptr %299, i64 0, i64 %301
  %303 = load float, ptr %302, align 4
  store float %303, ptr %16, align 4
  %304 = load i32, ptr %11, align 4
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds [3 x [3 x float]], ptr @a, i64 0, i64 %305
  %307 = load i32, ptr %11, align 4
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds [3 x float], ptr %306, i64 0, i64 %308
  %310 = load float, ptr %309, align 4
  %311 = load i32, ptr %11, align 4
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds [3 x [3 x float]], ptr @a, i64 0, i64 %312
  %314 = load i32, ptr %9, align 4
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds [3 x float], ptr %313, i64 0, i64 %315
  store float %310, ptr %316, align 4
  %317 = load float, ptr %16, align 4
  %318 = load i32, ptr %11, align 4
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds [3 x [3 x float]], ptr @a, i64 0, i64 %319
  %321 = load i32, ptr %11, align 4
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds [3 x float], ptr %320, i64 0, i64 %322
  store float %317, ptr %323, align 4
  call void @__cflat_record_node(i64 104736275678944)
  br label %324

324:                                              ; preds = %293
  %325 = load i32, ptr %10, align 4
  %326 = add nsw i32 %325, 1
  store i32 %326, ptr %10, align 4
  call void @__cflat_record_node(i64 104736275684016)
  br label %289, !llvm.loop !17

327:                                              ; preds = %289
  call void @__cflat_record_node(i64 104736275684816)
  br label %264

328:                                              ; preds = %272
  call void @__cflat_record_node(i64 104736275685008)
  br label %329

329:                                              ; preds = %328
  %330 = load i32, ptr %9, align 4
  %331 = add nsw i32 %330, 1
  store i32 %331, ptr %9, align 4
  call void @__cflat_record_node(i64 104736275685120)
  br label %259, !llvm.loop !18

332:                                              ; preds = %259
  %333 = load float, ptr %20, align 4
  store float %333, ptr @det, align 4
  store i32 0, ptr %4, align 4
  call void @__cflat_record_node(i64 104736275685856)
  br label %334

334:                                              ; preds = %332, %87, %30
  %335 = load i32, ptr %4, align 4
  call void @__cflat_call_return(i64 104736275605552)
  ret i32 %335
}

; Function Attrs: noinline nounwind uwtable
define internal float @minver_fabs(float noundef %0) #0 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  store float %0, ptr %2, align 4
  %4 = load float, ptr %2, align 4
  %5 = fcmp oge float %4, 0.000000e+00
  call void @__cflat_record_node(i64 104736275629328)
  br i1 %5, label %6, label %8

6:                                                ; preds = %1
  %7 = load float, ptr %2, align 4
  store float %7, ptr %3, align 4
  call void @__cflat_record_node(i64 104736275657312)
  br label %11

8:                                                ; preds = %1
  %9 = load float, ptr %2, align 4
  %10 = fneg float %9
  store float %10, ptr %3, align 4
  call void @__cflat_record_node(i64 104736275657792)
  br label %11

11:                                               ; preds = %8, %6
  %12 = load float, ptr %3, align 4
  call void @__cflat_call_return(i64 104736275629328)
  ret float %12
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @verify_benchmark(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca float, align 4
  store i32 %0, ptr %3, align 4
  store float 0x3EB0C6F7A0000000, ptr %6, align 4
  store i32 0, ptr %4, align 4
  call void @__cflat_record_node(i64 104736275659072)
  br label %7

7:                                                ; preds = %58, %1
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %8, 3
  call void @__cflat_record_node(i64 104736275660384)
  br i1 %9, label %10, label %61

10:                                               ; preds = %7
  store i32 0, ptr %5, align 4
  call void @__cflat_record_node(i64 104736275661088)
  br label %11

11:                                               ; preds = %54, %10
  %12 = load i32, ptr %5, align 4
  %13 = icmp slt i32 %12, 3
  call void @__cflat_record_node(i64 104736275661408)
  br i1 %13, label %14, label %57

14:                                               ; preds = %11
  %15 = load i32, ptr %4, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [3 x [3 x float]], ptr @c, i64 0, i64 %16
  %18 = load i32, ptr %5, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [3 x float], ptr %17, i64 0, i64 %19
  %21 = load float, ptr %20, align 4
  %22 = load i32, ptr %4, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [3 x [3 x float]], ptr @verify_benchmark.c_exp, i64 0, i64 %23
  %25 = load i32, ptr %5, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [3 x float], ptr %24, i64 0, i64 %26
  %28 = load float, ptr %27, align 4
  %29 = fsub float %21, %28
  %30 = call float @llvm.fabs.f32(float %29)
  %31 = fpext float %30 to double
  %32 = fcmp olt double %31, 1.000000e-05
  call void @__cflat_record_node(i64 104736275662080)
  br i1 %32, label %33, label %52

33:                                               ; preds = %14
  %34 = load i32, ptr %4, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [3 x [3 x float]], ptr @d, i64 0, i64 %35
  %37 = load i32, ptr %5, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [3 x float], ptr %36, i64 0, i64 %38
  %40 = load float, ptr %39, align 4
  %41 = load i32, ptr %4, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [3 x [3 x float]], ptr @verify_benchmark.d_exp, i64 0, i64 %42
  %44 = load i32, ptr %5, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [3 x float], ptr %43, i64 0, i64 %45
  %47 = load float, ptr %46, align 4
  %48 = fsub float %40, %47
  %49 = call float @llvm.fabs.f32(float %48)
  %50 = fpext float %49 to double
  %51 = fcmp olt double %50, 1.000000e-05
  call void @__cflat_record_node(i64 104736275687808)
  br i1 %51, label %53, label %52

52:                                               ; preds = %33, %14
  store i32 0, ptr %2, align 4
  call void @__cflat_record_node(i64 104736275692784)
  br label %70

53:                                               ; preds = %33
  call void @__cflat_record_node(i64 104736275693184)
  br label %54

54:                                               ; preds = %53
  %55 = load i32, ptr %5, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, ptr %5, align 4
  call void @__cflat_record_node(i64 104736275693296)
  br label %11, !llvm.loop !19

57:                                               ; preds = %11
  call void @__cflat_record_node(i64 104736275694176)
  br label %58

58:                                               ; preds = %57
  %59 = load i32, ptr %4, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %4, align 4
  call void @__cflat_record_node(i64 104736275694288)
  br label %7, !llvm.loop !20

61:                                               ; preds = %7
  %62 = load float, ptr @det, align 4
  %63 = fpext float %62 to double
  %64 = fsub double %63, 0xC030AAAB00CA2A5B
  %65 = fptrunc double %64 to float
  %66 = call float @llvm.fabs.f32(float %65)
  %67 = fpext float %66 to double
  %68 = fcmp olt double %67, 1.000000e-05
  %69 = zext i1 %68 to i32
  store i32 %69, ptr %2, align 4
  call void @__cflat_record_node(i64 104736275695088)
  br label %70

70:                                               ; preds = %61, %52
  %71 = load i32, ptr %2, align 4
  call void @__cflat_call_return(i64 104736275659072)
  ret i32 %71
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @initialise_benchmark() #0 {
  call void @__cflat_call_return(i64 104736275690512)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @warm_caches(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  call void @__cflat_call_enter(i64 104736275691504, i64 104736275686800)
  %5 = call i32 @benchmark_body(i32 noundef %4)
  store i32 %5, ptr %3, align 4
  call void @__cflat_call_return(i64 104736275686800)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @benchmark_body(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca float, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  call void @__cflat_record_node(i64 104736275691504)
  br label %5

5:                                                ; preds = %13, %1
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %6, %7
  call void @__cflat_record_node(i64 104736275698224)
  br i1 %8, label %9, label %16

9:                                                ; preds = %5
  store float 0x3EB0C6F7A0000000, ptr %4, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 @a, ptr align 4 @a_ref, i64 36, i1 false)
  %10 = load float, ptr %4, align 4
  call void @__cflat_call_enter(i64 104736275605552, i64 104736275699056)
  %11 = call i32 @minver(i32 noundef 3, i32 noundef 3, float noundef %10)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 @d, ptr align 4 @a, i64 36, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 @a, ptr align 4 @a_ref, i64 36, i1 false)
  call void @__cflat_call_enter(i64 104736275592192, i64 104736275699056)
  %12 = call i32 @mmul(i32 noundef 3, i32 noundef 3, i32 noundef 3, i32 noundef 3)
  call void @__cflat_record_node(i64 104736275699056)
  br label %13

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %3, align 4
  call void @__cflat_record_node(i64 104736275701344)
  br label %5, !llvm.loop !21

16:                                               ; preds = %5
  call void @__cflat_call_return(i64 104736275691504)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @benchmark() #0 {
  call void @__cflat_call_enter(i64 104736275691504, i64 104736275702640)
  %1 = call i32 @benchmark_body(i32 noundef 555000)
  call void @__cflat_call_return(i64 104736275702640)
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
  call void @__cflat_call_enter(i64 104736275753968, i64 104736275587104)
  call void @initialise_benchmark()
  call void @__cflat_call_enter(i64 104736275686800, i64 104736275587104)
  call void @warm_caches(i32 noundef 0)
  call void @init_branch_stats()
  call void @__cflat_call_enter(i64 104736275771488, i64 104736275587104)
  %8 = call i32 @benchmark()
  store volatile i32 %8, ptr %6, align 4
  call void @print_branch_stats()
  %9 = load volatile i32, ptr %6, align 4
  call void @__cflat_call_enter(i64 104736275659072, i64 104736275587104)
  %10 = call i32 @verify_benchmark(i32 noundef %9)
  store i32 %10, ptr %7, align 4
  %11 = load i32, ptr %7, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %11)
  call void @__cflat_call_return(i64 104736275587104)
  ret i32 0
}

declare void @init_branch_stats() #2

declare void @print_branch_stats() #2

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

declare void @__cflat_record_node(i64)

declare void @__cflat_call_return(i64)

declare void @__cflat_call_enter(i64, i64)

attributes #0 = { noinline nounwind uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

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
