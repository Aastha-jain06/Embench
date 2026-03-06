; ModuleID = './output_cflat_optee/ir/nettle-sha256.ll'
source_filename = "./embench-iot-benchmarks-backup/nettle-sha256.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

%struct.nettle_hash = type { ptr, i32, i32, i32, ptr, ptr, ptr }
%struct.sha256_ctx = type { [8 x i32], i64, [64 x i8], i32 }

@sha256_init.H0 = internal constant [8 x i32] [i32 1779033703, i32 -1150833019, i32 1013904242, i32 -1521486534, i32 1359893119, i32 -1694144372, i32 528734635, i32 1541459225], align 4
@K = internal constant [64 x i32] [i32 1116352408, i32 1899447441, i32 -1245643825, i32 -373957723, i32 961987163, i32 1508970993, i32 -1841331548, i32 -1424204075, i32 -670586216, i32 310598401, i32 607225278, i32 1426881987, i32 1925078388, i32 -2132889090, i32 -1680079193, i32 -1046744716, i32 -459576895, i32 -272742522, i32 264347078, i32 604807628, i32 770255983, i32 1249150122, i32 1555081692, i32 1996064986, i32 -1740746414, i32 -1473132947, i32 -1341970488, i32 -1084653625, i32 -958395405, i32 -710438585, i32 113926993, i32 338241895, i32 666307205, i32 773529912, i32 1294757372, i32 1396182291, i32 1695183700, i32 1986661051, i32 -2117940946, i32 -1838011259, i32 -1564481375, i32 -1474664885, i32 -1035236496, i32 -949202525, i32 -778901479, i32 -694614492, i32 -200395387, i32 275423344, i32 430227734, i32 506948616, i32 659060556, i32 883997877, i32 958139571, i32 1322822218, i32 1537002063, i32 1747873779, i32 1955562222, i32 2024104815, i32 -2067236844, i32 -1933114872, i32 -1866530822, i32 -1538233109, i32 -1090935817, i32 -965641998], align 4
@.str = private unnamed_addr constant [7 x i8] c"sha256\00", align 1
@nettle_sha256 = dso_local constant %struct.nettle_hash { ptr @.str, i32 112, i32 32, i32 64, ptr @sha256_init, ptr @sha256_update, ptr @sha256_digest }, align 8
@msg = dso_local global [56 x i8] c"abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq", align 1
@hash = dso_local global [32 x i8] c"$\8Dja\D2\068\B8\E5\C0&\93\0C>`9\A3<\E4Yd\FF!g\F6\EC\ED\D4\19\DB\06\C1", align 1
@buffer = dso_local global [32 x i8] zeroinitializer, align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@llvm.compiler.used = appending global [1 x ptr] [ptr @main], section "llvm.metadata"

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @_nettle_write_be32(i64 noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i64 %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %12 = load i64, ptr %4, align 8
  %13 = udiv i64 %12, 4
  store i64 %13, ptr %8, align 8
  %14 = load i64, ptr %4, align 8
  %15 = urem i64 %14, 4
  %16 = trunc i64 %15 to i32
  store i32 %16, ptr %9, align 4
  store i64 0, ptr %7, align 8
  br label %17

17:                                               ; preds = %59, %3
  %18 = load i64, ptr %7, align 8
  %19 = load i64, ptr %8, align 8
  %20 = icmp ult i64 %18, %19
  br i1 %20, label %21, label %64

21:                                               ; preds = %17
  br label %22

22:                                               ; preds = %21
  %23 = load ptr, ptr %6, align 8
  %24 = load i64, ptr %7, align 8
  %25 = getelementptr inbounds i32, ptr %23, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = lshr i32 %26, 24
  %28 = and i32 %27, 255
  %29 = trunc i32 %28 to i8
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds i8, ptr %30, i64 0
  store i8 %29, ptr %31, align 1
  %32 = load ptr, ptr %6, align 8
  %33 = load i64, ptr %7, align 8
  %34 = getelementptr inbounds i32, ptr %32, i64 %33
  %35 = load i32, ptr %34, align 4
  %36 = lshr i32 %35, 16
  %37 = and i32 %36, 255
  %38 = trunc i32 %37 to i8
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds i8, ptr %39, i64 1
  store i8 %38, ptr %40, align 1
  %41 = load ptr, ptr %6, align 8
  %42 = load i64, ptr %7, align 8
  %43 = getelementptr inbounds i32, ptr %41, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = lshr i32 %44, 8
  %46 = and i32 %45, 255
  %47 = trunc i32 %46 to i8
  %48 = load ptr, ptr %5, align 8
  %49 = getelementptr inbounds i8, ptr %48, i64 2
  store i8 %47, ptr %49, align 1
  %50 = load ptr, ptr %6, align 8
  %51 = load i64, ptr %7, align 8
  %52 = getelementptr inbounds i32, ptr %50, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = and i32 %53, 255
  %55 = trunc i32 %54 to i8
  %56 = load ptr, ptr %5, align 8
  %57 = getelementptr inbounds i8, ptr %56, i64 3
  store i8 %55, ptr %57, align 1
  br label %58

58:                                               ; preds = %22
  br label %59

59:                                               ; preds = %58
  %60 = load i64, ptr %7, align 8
  %61 = add i64 %60, 1
  store i64 %61, ptr %7, align 8
  %62 = load ptr, ptr %5, align 8
  %63 = getelementptr inbounds i8, ptr %62, i64 4
  store ptr %63, ptr %5, align 8
  br label %17, !llvm.loop !6

64:                                               ; preds = %17
  %65 = load i32, ptr %9, align 4
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %106

67:                                               ; preds = %64
  %68 = load i32, ptr %9, align 4
  store i32 %68, ptr %11, align 4
  %69 = load ptr, ptr %6, align 8
  %70 = load i64, ptr %7, align 8
  %71 = getelementptr inbounds i32, ptr %69, i64 %70
  %72 = load i32, ptr %71, align 4
  store i32 %72, ptr %10, align 4
  %73 = load i32, ptr %9, align 4
  switch i32 %73, label %74 [
    i32 3, label %75
    i32 2, label %85
    i32 1, label %95
  ]

74:                                               ; preds = %67
  call void @abort() #5
  unreachable

75:                                               ; preds = %67
  %76 = load i32, ptr %10, align 4
  %77 = lshr i32 %76, 8
  %78 = and i32 %77, 255
  %79 = trunc i32 %78 to i8
  %80 = load ptr, ptr %5, align 8
  %81 = load i32, ptr %11, align 4
  %82 = add i32 %81, -1
  store i32 %82, ptr %11, align 4
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i8, ptr %80, i64 %83
  store i8 %79, ptr %84, align 1
  br label %85

85:                                               ; preds = %75, %67
  %86 = load i32, ptr %10, align 4
  %87 = lshr i32 %86, 16
  %88 = and i32 %87, 255
  %89 = trunc i32 %88 to i8
  %90 = load ptr, ptr %5, align 8
  %91 = load i32, ptr %11, align 4
  %92 = add i32 %91, -1
  store i32 %92, ptr %11, align 4
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds i8, ptr %90, i64 %93
  store i8 %89, ptr %94, align 1
  br label %95

95:                                               ; preds = %85, %67
  %96 = load i32, ptr %10, align 4
  %97 = lshr i32 %96, 24
  %98 = and i32 %97, 255
  %99 = trunc i32 %98 to i8
  %100 = load ptr, ptr %5, align 8
  %101 = load i32, ptr %11, align 4
  %102 = add i32 %101, -1
  store i32 %102, ptr %11, align 4
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds i8, ptr %100, i64 %103
  store i8 %99, ptr %104, align 1
  br label %105

105:                                              ; preds = %95
  br label %106

106:                                              ; preds = %105, %64
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @_nettle_sha256_compress(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca [16 x i32], align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %16, align 4
  br label %18

18:                                               ; preds = %47, %3
  %19 = load i32, ptr %16, align 4
  %20 = icmp ult i32 %19, 16
  br i1 %20, label %21, label %52

21:                                               ; preds = %18
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds i8, ptr %22, i64 0
  %24 = load i8, ptr %23, align 1
  %25 = zext i8 %24 to i32
  %26 = shl i32 %25, 24
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds i8, ptr %27, i64 1
  %29 = load i8, ptr %28, align 1
  %30 = zext i8 %29 to i32
  %31 = shl i32 %30, 16
  %32 = or i32 %26, %31
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds i8, ptr %33, i64 2
  %35 = load i8, ptr %34, align 1
  %36 = zext i8 %35 to i32
  %37 = shl i32 %36, 8
  %38 = or i32 %32, %37
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds i8, ptr %39, i64 3
  %41 = load i8, ptr %40, align 1
  %42 = zext i8 %41 to i32
  %43 = or i32 %38, %42
  %44 = load i32, ptr %16, align 4
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 %45
  store i32 %43, ptr %46, align 4
  br label %47

47:                                               ; preds = %21
  %48 = load i32, ptr %16, align 4
  %49 = add i32 %48, 1
  store i32 %49, ptr %16, align 4
  %50 = load ptr, ptr %5, align 8
  %51 = getelementptr inbounds i8, ptr %50, i64 4
  store ptr %51, ptr %5, align 8
  br label %18, !llvm.loop !8

52:                                               ; preds = %18
  %53 = load ptr, ptr %4, align 8
  %54 = getelementptr inbounds i32, ptr %53, i64 0
  %55 = load i32, ptr %54, align 4
  store i32 %55, ptr %8, align 4
  %56 = load ptr, ptr %4, align 8
  %57 = getelementptr inbounds i32, ptr %56, i64 1
  %58 = load i32, ptr %57, align 4
  store i32 %58, ptr %9, align 4
  %59 = load ptr, ptr %4, align 8
  %60 = getelementptr inbounds i32, ptr %59, i64 2
  %61 = load i32, ptr %60, align 4
  store i32 %61, ptr %10, align 4
  %62 = load ptr, ptr %4, align 8
  %63 = getelementptr inbounds i32, ptr %62, i64 3
  %64 = load i32, ptr %63, align 4
  store i32 %64, ptr %11, align 4
  %65 = load ptr, ptr %4, align 8
  %66 = getelementptr inbounds i32, ptr %65, i64 4
  %67 = load i32, ptr %66, align 4
  store i32 %67, ptr %12, align 4
  %68 = load ptr, ptr %4, align 8
  %69 = getelementptr inbounds i32, ptr %68, i64 5
  %70 = load i32, ptr %69, align 4
  store i32 %70, ptr %13, align 4
  %71 = load ptr, ptr %4, align 8
  %72 = getelementptr inbounds i32, ptr %71, i64 6
  %73 = load i32, ptr %72, align 4
  store i32 %73, ptr %14, align 4
  %74 = load ptr, ptr %4, align 8
  %75 = getelementptr inbounds i32, ptr %74, i64 7
  %76 = load i32, ptr %75, align 4
  store i32 %76, ptr %15, align 4
  store i32 0, ptr %16, align 4
  %77 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 0
  store ptr %77, ptr %17, align 8
  br label %78

78:                                               ; preds = %634, %52
  %79 = load i32, ptr %16, align 4
  %80 = icmp ult i32 %79, 16
  br i1 %80, label %81, label %641

81:                                               ; preds = %78
  br label %82

82:                                               ; preds = %81
  %83 = load i32, ptr %12, align 4
  %84 = shl i32 %83, 26
  %85 = load i32, ptr %12, align 4
  %86 = lshr i32 %85, 6
  %87 = or i32 %84, %86
  %88 = load i32, ptr %12, align 4
  %89 = shl i32 %88, 21
  %90 = load i32, ptr %12, align 4
  %91 = lshr i32 %90, 11
  %92 = or i32 %89, %91
  %93 = xor i32 %87, %92
  %94 = load i32, ptr %12, align 4
  %95 = shl i32 %94, 7
  %96 = load i32, ptr %12, align 4
  %97 = lshr i32 %96, 25
  %98 = or i32 %95, %97
  %99 = xor i32 %93, %98
  %100 = load i32, ptr %14, align 4
  %101 = load i32, ptr %12, align 4
  %102 = load i32, ptr %13, align 4
  %103 = load i32, ptr %14, align 4
  %104 = xor i32 %102, %103
  %105 = and i32 %101, %104
  %106 = xor i32 %100, %105
  %107 = add i32 %99, %106
  %108 = load ptr, ptr %6, align 8
  %109 = getelementptr inbounds i32, ptr %108, i64 0
  %110 = load i32, ptr %109, align 4
  %111 = add i32 %107, %110
  %112 = load ptr, ptr %17, align 8
  %113 = getelementptr inbounds i32, ptr %112, i64 0
  %114 = load i32, ptr %113, align 4
  %115 = add i32 %111, %114
  %116 = load i32, ptr %15, align 4
  %117 = add i32 %116, %115
  store i32 %117, ptr %15, align 4
  %118 = load i32, ptr %15, align 4
  %119 = load i32, ptr %11, align 4
  %120 = add i32 %119, %118
  store i32 %120, ptr %11, align 4
  %121 = load i32, ptr %8, align 4
  %122 = shl i32 %121, 30
  %123 = load i32, ptr %8, align 4
  %124 = lshr i32 %123, 2
  %125 = or i32 %122, %124
  %126 = load i32, ptr %8, align 4
  %127 = shl i32 %126, 19
  %128 = load i32, ptr %8, align 4
  %129 = lshr i32 %128, 13
  %130 = or i32 %127, %129
  %131 = xor i32 %125, %130
  %132 = load i32, ptr %8, align 4
  %133 = shl i32 %132, 10
  %134 = load i32, ptr %8, align 4
  %135 = lshr i32 %134, 22
  %136 = or i32 %133, %135
  %137 = xor i32 %131, %136
  %138 = load i32, ptr %8, align 4
  %139 = load i32, ptr %9, align 4
  %140 = and i32 %138, %139
  %141 = load i32, ptr %10, align 4
  %142 = load i32, ptr %8, align 4
  %143 = load i32, ptr %9, align 4
  %144 = xor i32 %142, %143
  %145 = and i32 %141, %144
  %146 = xor i32 %140, %145
  %147 = add i32 %137, %146
  %148 = load i32, ptr %15, align 4
  %149 = add i32 %148, %147
  store i32 %149, ptr %15, align 4
  br label %150

150:                                              ; preds = %82
  br label %151

151:                                              ; preds = %150
  %152 = load i32, ptr %11, align 4
  %153 = shl i32 %152, 26
  %154 = load i32, ptr %11, align 4
  %155 = lshr i32 %154, 6
  %156 = or i32 %153, %155
  %157 = load i32, ptr %11, align 4
  %158 = shl i32 %157, 21
  %159 = load i32, ptr %11, align 4
  %160 = lshr i32 %159, 11
  %161 = or i32 %158, %160
  %162 = xor i32 %156, %161
  %163 = load i32, ptr %11, align 4
  %164 = shl i32 %163, 7
  %165 = load i32, ptr %11, align 4
  %166 = lshr i32 %165, 25
  %167 = or i32 %164, %166
  %168 = xor i32 %162, %167
  %169 = load i32, ptr %13, align 4
  %170 = load i32, ptr %11, align 4
  %171 = load i32, ptr %12, align 4
  %172 = load i32, ptr %13, align 4
  %173 = xor i32 %171, %172
  %174 = and i32 %170, %173
  %175 = xor i32 %169, %174
  %176 = add i32 %168, %175
  %177 = load ptr, ptr %6, align 8
  %178 = getelementptr inbounds i32, ptr %177, i64 1
  %179 = load i32, ptr %178, align 4
  %180 = add i32 %176, %179
  %181 = load ptr, ptr %17, align 8
  %182 = getelementptr inbounds i32, ptr %181, i64 1
  %183 = load i32, ptr %182, align 4
  %184 = add i32 %180, %183
  %185 = load i32, ptr %14, align 4
  %186 = add i32 %185, %184
  store i32 %186, ptr %14, align 4
  %187 = load i32, ptr %14, align 4
  %188 = load i32, ptr %10, align 4
  %189 = add i32 %188, %187
  store i32 %189, ptr %10, align 4
  %190 = load i32, ptr %15, align 4
  %191 = shl i32 %190, 30
  %192 = load i32, ptr %15, align 4
  %193 = lshr i32 %192, 2
  %194 = or i32 %191, %193
  %195 = load i32, ptr %15, align 4
  %196 = shl i32 %195, 19
  %197 = load i32, ptr %15, align 4
  %198 = lshr i32 %197, 13
  %199 = or i32 %196, %198
  %200 = xor i32 %194, %199
  %201 = load i32, ptr %15, align 4
  %202 = shl i32 %201, 10
  %203 = load i32, ptr %15, align 4
  %204 = lshr i32 %203, 22
  %205 = or i32 %202, %204
  %206 = xor i32 %200, %205
  %207 = load i32, ptr %15, align 4
  %208 = load i32, ptr %8, align 4
  %209 = and i32 %207, %208
  %210 = load i32, ptr %9, align 4
  %211 = load i32, ptr %15, align 4
  %212 = load i32, ptr %8, align 4
  %213 = xor i32 %211, %212
  %214 = and i32 %210, %213
  %215 = xor i32 %209, %214
  %216 = add i32 %206, %215
  %217 = load i32, ptr %14, align 4
  %218 = add i32 %217, %216
  store i32 %218, ptr %14, align 4
  br label %219

219:                                              ; preds = %151
  br label %220

220:                                              ; preds = %219
  %221 = load i32, ptr %10, align 4
  %222 = shl i32 %221, 26
  %223 = load i32, ptr %10, align 4
  %224 = lshr i32 %223, 6
  %225 = or i32 %222, %224
  %226 = load i32, ptr %10, align 4
  %227 = shl i32 %226, 21
  %228 = load i32, ptr %10, align 4
  %229 = lshr i32 %228, 11
  %230 = or i32 %227, %229
  %231 = xor i32 %225, %230
  %232 = load i32, ptr %10, align 4
  %233 = shl i32 %232, 7
  %234 = load i32, ptr %10, align 4
  %235 = lshr i32 %234, 25
  %236 = or i32 %233, %235
  %237 = xor i32 %231, %236
  %238 = load i32, ptr %12, align 4
  %239 = load i32, ptr %10, align 4
  %240 = load i32, ptr %11, align 4
  %241 = load i32, ptr %12, align 4
  %242 = xor i32 %240, %241
  %243 = and i32 %239, %242
  %244 = xor i32 %238, %243
  %245 = add i32 %237, %244
  %246 = load ptr, ptr %6, align 8
  %247 = getelementptr inbounds i32, ptr %246, i64 2
  %248 = load i32, ptr %247, align 4
  %249 = add i32 %245, %248
  %250 = load ptr, ptr %17, align 8
  %251 = getelementptr inbounds i32, ptr %250, i64 2
  %252 = load i32, ptr %251, align 4
  %253 = add i32 %249, %252
  %254 = load i32, ptr %13, align 4
  %255 = add i32 %254, %253
  store i32 %255, ptr %13, align 4
  %256 = load i32, ptr %13, align 4
  %257 = load i32, ptr %9, align 4
  %258 = add i32 %257, %256
  store i32 %258, ptr %9, align 4
  %259 = load i32, ptr %14, align 4
  %260 = shl i32 %259, 30
  %261 = load i32, ptr %14, align 4
  %262 = lshr i32 %261, 2
  %263 = or i32 %260, %262
  %264 = load i32, ptr %14, align 4
  %265 = shl i32 %264, 19
  %266 = load i32, ptr %14, align 4
  %267 = lshr i32 %266, 13
  %268 = or i32 %265, %267
  %269 = xor i32 %263, %268
  %270 = load i32, ptr %14, align 4
  %271 = shl i32 %270, 10
  %272 = load i32, ptr %14, align 4
  %273 = lshr i32 %272, 22
  %274 = or i32 %271, %273
  %275 = xor i32 %269, %274
  %276 = load i32, ptr %14, align 4
  %277 = load i32, ptr %15, align 4
  %278 = and i32 %276, %277
  %279 = load i32, ptr %8, align 4
  %280 = load i32, ptr %14, align 4
  %281 = load i32, ptr %15, align 4
  %282 = xor i32 %280, %281
  %283 = and i32 %279, %282
  %284 = xor i32 %278, %283
  %285 = add i32 %275, %284
  %286 = load i32, ptr %13, align 4
  %287 = add i32 %286, %285
  store i32 %287, ptr %13, align 4
  br label %288

288:                                              ; preds = %220
  br label %289

289:                                              ; preds = %288
  %290 = load i32, ptr %9, align 4
  %291 = shl i32 %290, 26
  %292 = load i32, ptr %9, align 4
  %293 = lshr i32 %292, 6
  %294 = or i32 %291, %293
  %295 = load i32, ptr %9, align 4
  %296 = shl i32 %295, 21
  %297 = load i32, ptr %9, align 4
  %298 = lshr i32 %297, 11
  %299 = or i32 %296, %298
  %300 = xor i32 %294, %299
  %301 = load i32, ptr %9, align 4
  %302 = shl i32 %301, 7
  %303 = load i32, ptr %9, align 4
  %304 = lshr i32 %303, 25
  %305 = or i32 %302, %304
  %306 = xor i32 %300, %305
  %307 = load i32, ptr %11, align 4
  %308 = load i32, ptr %9, align 4
  %309 = load i32, ptr %10, align 4
  %310 = load i32, ptr %11, align 4
  %311 = xor i32 %309, %310
  %312 = and i32 %308, %311
  %313 = xor i32 %307, %312
  %314 = add i32 %306, %313
  %315 = load ptr, ptr %6, align 8
  %316 = getelementptr inbounds i32, ptr %315, i64 3
  %317 = load i32, ptr %316, align 4
  %318 = add i32 %314, %317
  %319 = load ptr, ptr %17, align 8
  %320 = getelementptr inbounds i32, ptr %319, i64 3
  %321 = load i32, ptr %320, align 4
  %322 = add i32 %318, %321
  %323 = load i32, ptr %12, align 4
  %324 = add i32 %323, %322
  store i32 %324, ptr %12, align 4
  %325 = load i32, ptr %12, align 4
  %326 = load i32, ptr %8, align 4
  %327 = add i32 %326, %325
  store i32 %327, ptr %8, align 4
  %328 = load i32, ptr %13, align 4
  %329 = shl i32 %328, 30
  %330 = load i32, ptr %13, align 4
  %331 = lshr i32 %330, 2
  %332 = or i32 %329, %331
  %333 = load i32, ptr %13, align 4
  %334 = shl i32 %333, 19
  %335 = load i32, ptr %13, align 4
  %336 = lshr i32 %335, 13
  %337 = or i32 %334, %336
  %338 = xor i32 %332, %337
  %339 = load i32, ptr %13, align 4
  %340 = shl i32 %339, 10
  %341 = load i32, ptr %13, align 4
  %342 = lshr i32 %341, 22
  %343 = or i32 %340, %342
  %344 = xor i32 %338, %343
  %345 = load i32, ptr %13, align 4
  %346 = load i32, ptr %14, align 4
  %347 = and i32 %345, %346
  %348 = load i32, ptr %15, align 4
  %349 = load i32, ptr %13, align 4
  %350 = load i32, ptr %14, align 4
  %351 = xor i32 %349, %350
  %352 = and i32 %348, %351
  %353 = xor i32 %347, %352
  %354 = add i32 %344, %353
  %355 = load i32, ptr %12, align 4
  %356 = add i32 %355, %354
  store i32 %356, ptr %12, align 4
  br label %357

357:                                              ; preds = %289
  br label %358

358:                                              ; preds = %357
  %359 = load i32, ptr %8, align 4
  %360 = shl i32 %359, 26
  %361 = load i32, ptr %8, align 4
  %362 = lshr i32 %361, 6
  %363 = or i32 %360, %362
  %364 = load i32, ptr %8, align 4
  %365 = shl i32 %364, 21
  %366 = load i32, ptr %8, align 4
  %367 = lshr i32 %366, 11
  %368 = or i32 %365, %367
  %369 = xor i32 %363, %368
  %370 = load i32, ptr %8, align 4
  %371 = shl i32 %370, 7
  %372 = load i32, ptr %8, align 4
  %373 = lshr i32 %372, 25
  %374 = or i32 %371, %373
  %375 = xor i32 %369, %374
  %376 = load i32, ptr %10, align 4
  %377 = load i32, ptr %8, align 4
  %378 = load i32, ptr %9, align 4
  %379 = load i32, ptr %10, align 4
  %380 = xor i32 %378, %379
  %381 = and i32 %377, %380
  %382 = xor i32 %376, %381
  %383 = add i32 %375, %382
  %384 = load ptr, ptr %6, align 8
  %385 = getelementptr inbounds i32, ptr %384, i64 4
  %386 = load i32, ptr %385, align 4
  %387 = add i32 %383, %386
  %388 = load ptr, ptr %17, align 8
  %389 = getelementptr inbounds i32, ptr %388, i64 4
  %390 = load i32, ptr %389, align 4
  %391 = add i32 %387, %390
  %392 = load i32, ptr %11, align 4
  %393 = add i32 %392, %391
  store i32 %393, ptr %11, align 4
  %394 = load i32, ptr %11, align 4
  %395 = load i32, ptr %15, align 4
  %396 = add i32 %395, %394
  store i32 %396, ptr %15, align 4
  %397 = load i32, ptr %12, align 4
  %398 = shl i32 %397, 30
  %399 = load i32, ptr %12, align 4
  %400 = lshr i32 %399, 2
  %401 = or i32 %398, %400
  %402 = load i32, ptr %12, align 4
  %403 = shl i32 %402, 19
  %404 = load i32, ptr %12, align 4
  %405 = lshr i32 %404, 13
  %406 = or i32 %403, %405
  %407 = xor i32 %401, %406
  %408 = load i32, ptr %12, align 4
  %409 = shl i32 %408, 10
  %410 = load i32, ptr %12, align 4
  %411 = lshr i32 %410, 22
  %412 = or i32 %409, %411
  %413 = xor i32 %407, %412
  %414 = load i32, ptr %12, align 4
  %415 = load i32, ptr %13, align 4
  %416 = and i32 %414, %415
  %417 = load i32, ptr %14, align 4
  %418 = load i32, ptr %12, align 4
  %419 = load i32, ptr %13, align 4
  %420 = xor i32 %418, %419
  %421 = and i32 %417, %420
  %422 = xor i32 %416, %421
  %423 = add i32 %413, %422
  %424 = load i32, ptr %11, align 4
  %425 = add i32 %424, %423
  store i32 %425, ptr %11, align 4
  br label %426

426:                                              ; preds = %358
  br label %427

427:                                              ; preds = %426
  %428 = load i32, ptr %15, align 4
  %429 = shl i32 %428, 26
  %430 = load i32, ptr %15, align 4
  %431 = lshr i32 %430, 6
  %432 = or i32 %429, %431
  %433 = load i32, ptr %15, align 4
  %434 = shl i32 %433, 21
  %435 = load i32, ptr %15, align 4
  %436 = lshr i32 %435, 11
  %437 = or i32 %434, %436
  %438 = xor i32 %432, %437
  %439 = load i32, ptr %15, align 4
  %440 = shl i32 %439, 7
  %441 = load i32, ptr %15, align 4
  %442 = lshr i32 %441, 25
  %443 = or i32 %440, %442
  %444 = xor i32 %438, %443
  %445 = load i32, ptr %9, align 4
  %446 = load i32, ptr %15, align 4
  %447 = load i32, ptr %8, align 4
  %448 = load i32, ptr %9, align 4
  %449 = xor i32 %447, %448
  %450 = and i32 %446, %449
  %451 = xor i32 %445, %450
  %452 = add i32 %444, %451
  %453 = load ptr, ptr %6, align 8
  %454 = getelementptr inbounds i32, ptr %453, i64 5
  %455 = load i32, ptr %454, align 4
  %456 = add i32 %452, %455
  %457 = load ptr, ptr %17, align 8
  %458 = getelementptr inbounds i32, ptr %457, i64 5
  %459 = load i32, ptr %458, align 4
  %460 = add i32 %456, %459
  %461 = load i32, ptr %10, align 4
  %462 = add i32 %461, %460
  store i32 %462, ptr %10, align 4
  %463 = load i32, ptr %10, align 4
  %464 = load i32, ptr %14, align 4
  %465 = add i32 %464, %463
  store i32 %465, ptr %14, align 4
  %466 = load i32, ptr %11, align 4
  %467 = shl i32 %466, 30
  %468 = load i32, ptr %11, align 4
  %469 = lshr i32 %468, 2
  %470 = or i32 %467, %469
  %471 = load i32, ptr %11, align 4
  %472 = shl i32 %471, 19
  %473 = load i32, ptr %11, align 4
  %474 = lshr i32 %473, 13
  %475 = or i32 %472, %474
  %476 = xor i32 %470, %475
  %477 = load i32, ptr %11, align 4
  %478 = shl i32 %477, 10
  %479 = load i32, ptr %11, align 4
  %480 = lshr i32 %479, 22
  %481 = or i32 %478, %480
  %482 = xor i32 %476, %481
  %483 = load i32, ptr %11, align 4
  %484 = load i32, ptr %12, align 4
  %485 = and i32 %483, %484
  %486 = load i32, ptr %13, align 4
  %487 = load i32, ptr %11, align 4
  %488 = load i32, ptr %12, align 4
  %489 = xor i32 %487, %488
  %490 = and i32 %486, %489
  %491 = xor i32 %485, %490
  %492 = add i32 %482, %491
  %493 = load i32, ptr %10, align 4
  %494 = add i32 %493, %492
  store i32 %494, ptr %10, align 4
  br label %495

495:                                              ; preds = %427
  br label %496

496:                                              ; preds = %495
  %497 = load i32, ptr %14, align 4
  %498 = shl i32 %497, 26
  %499 = load i32, ptr %14, align 4
  %500 = lshr i32 %499, 6
  %501 = or i32 %498, %500
  %502 = load i32, ptr %14, align 4
  %503 = shl i32 %502, 21
  %504 = load i32, ptr %14, align 4
  %505 = lshr i32 %504, 11
  %506 = or i32 %503, %505
  %507 = xor i32 %501, %506
  %508 = load i32, ptr %14, align 4
  %509 = shl i32 %508, 7
  %510 = load i32, ptr %14, align 4
  %511 = lshr i32 %510, 25
  %512 = or i32 %509, %511
  %513 = xor i32 %507, %512
  %514 = load i32, ptr %8, align 4
  %515 = load i32, ptr %14, align 4
  %516 = load i32, ptr %15, align 4
  %517 = load i32, ptr %8, align 4
  %518 = xor i32 %516, %517
  %519 = and i32 %515, %518
  %520 = xor i32 %514, %519
  %521 = add i32 %513, %520
  %522 = load ptr, ptr %6, align 8
  %523 = getelementptr inbounds i32, ptr %522, i64 6
  %524 = load i32, ptr %523, align 4
  %525 = add i32 %521, %524
  %526 = load ptr, ptr %17, align 8
  %527 = getelementptr inbounds i32, ptr %526, i64 6
  %528 = load i32, ptr %527, align 4
  %529 = add i32 %525, %528
  %530 = load i32, ptr %9, align 4
  %531 = add i32 %530, %529
  store i32 %531, ptr %9, align 4
  %532 = load i32, ptr %9, align 4
  %533 = load i32, ptr %13, align 4
  %534 = add i32 %533, %532
  store i32 %534, ptr %13, align 4
  %535 = load i32, ptr %10, align 4
  %536 = shl i32 %535, 30
  %537 = load i32, ptr %10, align 4
  %538 = lshr i32 %537, 2
  %539 = or i32 %536, %538
  %540 = load i32, ptr %10, align 4
  %541 = shl i32 %540, 19
  %542 = load i32, ptr %10, align 4
  %543 = lshr i32 %542, 13
  %544 = or i32 %541, %543
  %545 = xor i32 %539, %544
  %546 = load i32, ptr %10, align 4
  %547 = shl i32 %546, 10
  %548 = load i32, ptr %10, align 4
  %549 = lshr i32 %548, 22
  %550 = or i32 %547, %549
  %551 = xor i32 %545, %550
  %552 = load i32, ptr %10, align 4
  %553 = load i32, ptr %11, align 4
  %554 = and i32 %552, %553
  %555 = load i32, ptr %12, align 4
  %556 = load i32, ptr %10, align 4
  %557 = load i32, ptr %11, align 4
  %558 = xor i32 %556, %557
  %559 = and i32 %555, %558
  %560 = xor i32 %554, %559
  %561 = add i32 %551, %560
  %562 = load i32, ptr %9, align 4
  %563 = add i32 %562, %561
  store i32 %563, ptr %9, align 4
  br label %564

564:                                              ; preds = %496
  br label %565

565:                                              ; preds = %564
  %566 = load i32, ptr %13, align 4
  %567 = shl i32 %566, 26
  %568 = load i32, ptr %13, align 4
  %569 = lshr i32 %568, 6
  %570 = or i32 %567, %569
  %571 = load i32, ptr %13, align 4
  %572 = shl i32 %571, 21
  %573 = load i32, ptr %13, align 4
  %574 = lshr i32 %573, 11
  %575 = or i32 %572, %574
  %576 = xor i32 %570, %575
  %577 = load i32, ptr %13, align 4
  %578 = shl i32 %577, 7
  %579 = load i32, ptr %13, align 4
  %580 = lshr i32 %579, 25
  %581 = or i32 %578, %580
  %582 = xor i32 %576, %581
  %583 = load i32, ptr %15, align 4
  %584 = load i32, ptr %13, align 4
  %585 = load i32, ptr %14, align 4
  %586 = load i32, ptr %15, align 4
  %587 = xor i32 %585, %586
  %588 = and i32 %584, %587
  %589 = xor i32 %583, %588
  %590 = add i32 %582, %589
  %591 = load ptr, ptr %6, align 8
  %592 = getelementptr inbounds i32, ptr %591, i64 7
  %593 = load i32, ptr %592, align 4
  %594 = add i32 %590, %593
  %595 = load ptr, ptr %17, align 8
  %596 = getelementptr inbounds i32, ptr %595, i64 7
  %597 = load i32, ptr %596, align 4
  %598 = add i32 %594, %597
  %599 = load i32, ptr %8, align 4
  %600 = add i32 %599, %598
  store i32 %600, ptr %8, align 4
  %601 = load i32, ptr %8, align 4
  %602 = load i32, ptr %12, align 4
  %603 = add i32 %602, %601
  store i32 %603, ptr %12, align 4
  %604 = load i32, ptr %9, align 4
  %605 = shl i32 %604, 30
  %606 = load i32, ptr %9, align 4
  %607 = lshr i32 %606, 2
  %608 = or i32 %605, %607
  %609 = load i32, ptr %9, align 4
  %610 = shl i32 %609, 19
  %611 = load i32, ptr %9, align 4
  %612 = lshr i32 %611, 13
  %613 = or i32 %610, %612
  %614 = xor i32 %608, %613
  %615 = load i32, ptr %9, align 4
  %616 = shl i32 %615, 10
  %617 = load i32, ptr %9, align 4
  %618 = lshr i32 %617, 22
  %619 = or i32 %616, %618
  %620 = xor i32 %614, %619
  %621 = load i32, ptr %9, align 4
  %622 = load i32, ptr %10, align 4
  %623 = and i32 %621, %622
  %624 = load i32, ptr %11, align 4
  %625 = load i32, ptr %9, align 4
  %626 = load i32, ptr %10, align 4
  %627 = xor i32 %625, %626
  %628 = and i32 %624, %627
  %629 = xor i32 %623, %628
  %630 = add i32 %620, %629
  %631 = load i32, ptr %8, align 4
  %632 = add i32 %631, %630
  store i32 %632, ptr %8, align 4
  br label %633

633:                                              ; preds = %565
  br label %634

634:                                              ; preds = %633
  %635 = load i32, ptr %16, align 4
  %636 = add i32 %635, 8
  store i32 %636, ptr %16, align 4
  %637 = load ptr, ptr %6, align 8
  %638 = getelementptr inbounds i32, ptr %637, i64 8
  store ptr %638, ptr %6, align 8
  %639 = load ptr, ptr %17, align 8
  %640 = getelementptr inbounds i32, ptr %639, i64 8
  store ptr %640, ptr %17, align 8
  br label %78, !llvm.loop !9

641:                                              ; preds = %78
  br label %642

642:                                              ; preds = %2422, %641
  %643 = load i32, ptr %16, align 4
  %644 = icmp ult i32 %643, 64
  br i1 %644, label %645, label %2427

645:                                              ; preds = %642
  br label %646

646:                                              ; preds = %645
  %647 = load i32, ptr %12, align 4
  %648 = shl i32 %647, 26
  %649 = load i32, ptr %12, align 4
  %650 = lshr i32 %649, 6
  %651 = or i32 %648, %650
  %652 = load i32, ptr %12, align 4
  %653 = shl i32 %652, 21
  %654 = load i32, ptr %12, align 4
  %655 = lshr i32 %654, 11
  %656 = or i32 %653, %655
  %657 = xor i32 %651, %656
  %658 = load i32, ptr %12, align 4
  %659 = shl i32 %658, 7
  %660 = load i32, ptr %12, align 4
  %661 = lshr i32 %660, 25
  %662 = or i32 %659, %661
  %663 = xor i32 %657, %662
  %664 = load i32, ptr %14, align 4
  %665 = load i32, ptr %12, align 4
  %666 = load i32, ptr %13, align 4
  %667 = load i32, ptr %14, align 4
  %668 = xor i32 %666, %667
  %669 = and i32 %665, %668
  %670 = xor i32 %664, %669
  %671 = add i32 %663, %670
  %672 = load ptr, ptr %6, align 8
  %673 = getelementptr inbounds i32, ptr %672, i64 0
  %674 = load i32, ptr %673, align 4
  %675 = add i32 %671, %674
  %676 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 14
  %677 = load i32, ptr %676, align 4
  %678 = shl i32 %677, 15
  %679 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 14
  %680 = load i32, ptr %679, align 4
  %681 = lshr i32 %680, 17
  %682 = or i32 %678, %681
  %683 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 14
  %684 = load i32, ptr %683, align 4
  %685 = shl i32 %684, 13
  %686 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 14
  %687 = load i32, ptr %686, align 4
  %688 = lshr i32 %687, 19
  %689 = or i32 %685, %688
  %690 = xor i32 %682, %689
  %691 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 14
  %692 = load i32, ptr %691, align 4
  %693 = lshr i32 %692, 10
  %694 = xor i32 %690, %693
  %695 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 9
  %696 = load i32, ptr %695, align 4
  %697 = add i32 %694, %696
  %698 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 1
  %699 = load i32, ptr %698, align 4
  %700 = shl i32 %699, 25
  %701 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 1
  %702 = load i32, ptr %701, align 4
  %703 = lshr i32 %702, 7
  %704 = or i32 %700, %703
  %705 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 1
  %706 = load i32, ptr %705, align 4
  %707 = shl i32 %706, 14
  %708 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 1
  %709 = load i32, ptr %708, align 4
  %710 = lshr i32 %709, 18
  %711 = or i32 %707, %710
  %712 = xor i32 %704, %711
  %713 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 1
  %714 = load i32, ptr %713, align 4
  %715 = lshr i32 %714, 3
  %716 = xor i32 %712, %715
  %717 = add i32 %697, %716
  %718 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 0
  %719 = load i32, ptr %718, align 4
  %720 = add i32 %719, %717
  store i32 %720, ptr %718, align 4
  %721 = add i32 %675, %720
  %722 = load i32, ptr %15, align 4
  %723 = add i32 %722, %721
  store i32 %723, ptr %15, align 4
  %724 = load i32, ptr %15, align 4
  %725 = load i32, ptr %11, align 4
  %726 = add i32 %725, %724
  store i32 %726, ptr %11, align 4
  %727 = load i32, ptr %8, align 4
  %728 = shl i32 %727, 30
  %729 = load i32, ptr %8, align 4
  %730 = lshr i32 %729, 2
  %731 = or i32 %728, %730
  %732 = load i32, ptr %8, align 4
  %733 = shl i32 %732, 19
  %734 = load i32, ptr %8, align 4
  %735 = lshr i32 %734, 13
  %736 = or i32 %733, %735
  %737 = xor i32 %731, %736
  %738 = load i32, ptr %8, align 4
  %739 = shl i32 %738, 10
  %740 = load i32, ptr %8, align 4
  %741 = lshr i32 %740, 22
  %742 = or i32 %739, %741
  %743 = xor i32 %737, %742
  %744 = load i32, ptr %8, align 4
  %745 = load i32, ptr %9, align 4
  %746 = and i32 %744, %745
  %747 = load i32, ptr %10, align 4
  %748 = load i32, ptr %8, align 4
  %749 = load i32, ptr %9, align 4
  %750 = xor i32 %748, %749
  %751 = and i32 %747, %750
  %752 = xor i32 %746, %751
  %753 = add i32 %743, %752
  %754 = load i32, ptr %15, align 4
  %755 = add i32 %754, %753
  store i32 %755, ptr %15, align 4
  br label %756

756:                                              ; preds = %646
  br label %757

757:                                              ; preds = %756
  %758 = load i32, ptr %11, align 4
  %759 = shl i32 %758, 26
  %760 = load i32, ptr %11, align 4
  %761 = lshr i32 %760, 6
  %762 = or i32 %759, %761
  %763 = load i32, ptr %11, align 4
  %764 = shl i32 %763, 21
  %765 = load i32, ptr %11, align 4
  %766 = lshr i32 %765, 11
  %767 = or i32 %764, %766
  %768 = xor i32 %762, %767
  %769 = load i32, ptr %11, align 4
  %770 = shl i32 %769, 7
  %771 = load i32, ptr %11, align 4
  %772 = lshr i32 %771, 25
  %773 = or i32 %770, %772
  %774 = xor i32 %768, %773
  %775 = load i32, ptr %13, align 4
  %776 = load i32, ptr %11, align 4
  %777 = load i32, ptr %12, align 4
  %778 = load i32, ptr %13, align 4
  %779 = xor i32 %777, %778
  %780 = and i32 %776, %779
  %781 = xor i32 %775, %780
  %782 = add i32 %774, %781
  %783 = load ptr, ptr %6, align 8
  %784 = getelementptr inbounds i32, ptr %783, i64 1
  %785 = load i32, ptr %784, align 4
  %786 = add i32 %782, %785
  %787 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 15
  %788 = load i32, ptr %787, align 4
  %789 = shl i32 %788, 15
  %790 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 15
  %791 = load i32, ptr %790, align 4
  %792 = lshr i32 %791, 17
  %793 = or i32 %789, %792
  %794 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 15
  %795 = load i32, ptr %794, align 4
  %796 = shl i32 %795, 13
  %797 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 15
  %798 = load i32, ptr %797, align 4
  %799 = lshr i32 %798, 19
  %800 = or i32 %796, %799
  %801 = xor i32 %793, %800
  %802 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 15
  %803 = load i32, ptr %802, align 4
  %804 = lshr i32 %803, 10
  %805 = xor i32 %801, %804
  %806 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 10
  %807 = load i32, ptr %806, align 4
  %808 = add i32 %805, %807
  %809 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 2
  %810 = load i32, ptr %809, align 4
  %811 = shl i32 %810, 25
  %812 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 2
  %813 = load i32, ptr %812, align 4
  %814 = lshr i32 %813, 7
  %815 = or i32 %811, %814
  %816 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 2
  %817 = load i32, ptr %816, align 4
  %818 = shl i32 %817, 14
  %819 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 2
  %820 = load i32, ptr %819, align 4
  %821 = lshr i32 %820, 18
  %822 = or i32 %818, %821
  %823 = xor i32 %815, %822
  %824 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 2
  %825 = load i32, ptr %824, align 4
  %826 = lshr i32 %825, 3
  %827 = xor i32 %823, %826
  %828 = add i32 %808, %827
  %829 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 1
  %830 = load i32, ptr %829, align 4
  %831 = add i32 %830, %828
  store i32 %831, ptr %829, align 4
  %832 = add i32 %786, %831
  %833 = load i32, ptr %14, align 4
  %834 = add i32 %833, %832
  store i32 %834, ptr %14, align 4
  %835 = load i32, ptr %14, align 4
  %836 = load i32, ptr %10, align 4
  %837 = add i32 %836, %835
  store i32 %837, ptr %10, align 4
  %838 = load i32, ptr %15, align 4
  %839 = shl i32 %838, 30
  %840 = load i32, ptr %15, align 4
  %841 = lshr i32 %840, 2
  %842 = or i32 %839, %841
  %843 = load i32, ptr %15, align 4
  %844 = shl i32 %843, 19
  %845 = load i32, ptr %15, align 4
  %846 = lshr i32 %845, 13
  %847 = or i32 %844, %846
  %848 = xor i32 %842, %847
  %849 = load i32, ptr %15, align 4
  %850 = shl i32 %849, 10
  %851 = load i32, ptr %15, align 4
  %852 = lshr i32 %851, 22
  %853 = or i32 %850, %852
  %854 = xor i32 %848, %853
  %855 = load i32, ptr %15, align 4
  %856 = load i32, ptr %8, align 4
  %857 = and i32 %855, %856
  %858 = load i32, ptr %9, align 4
  %859 = load i32, ptr %15, align 4
  %860 = load i32, ptr %8, align 4
  %861 = xor i32 %859, %860
  %862 = and i32 %858, %861
  %863 = xor i32 %857, %862
  %864 = add i32 %854, %863
  %865 = load i32, ptr %14, align 4
  %866 = add i32 %865, %864
  store i32 %866, ptr %14, align 4
  br label %867

867:                                              ; preds = %757
  br label %868

868:                                              ; preds = %867
  %869 = load i32, ptr %10, align 4
  %870 = shl i32 %869, 26
  %871 = load i32, ptr %10, align 4
  %872 = lshr i32 %871, 6
  %873 = or i32 %870, %872
  %874 = load i32, ptr %10, align 4
  %875 = shl i32 %874, 21
  %876 = load i32, ptr %10, align 4
  %877 = lshr i32 %876, 11
  %878 = or i32 %875, %877
  %879 = xor i32 %873, %878
  %880 = load i32, ptr %10, align 4
  %881 = shl i32 %880, 7
  %882 = load i32, ptr %10, align 4
  %883 = lshr i32 %882, 25
  %884 = or i32 %881, %883
  %885 = xor i32 %879, %884
  %886 = load i32, ptr %12, align 4
  %887 = load i32, ptr %10, align 4
  %888 = load i32, ptr %11, align 4
  %889 = load i32, ptr %12, align 4
  %890 = xor i32 %888, %889
  %891 = and i32 %887, %890
  %892 = xor i32 %886, %891
  %893 = add i32 %885, %892
  %894 = load ptr, ptr %6, align 8
  %895 = getelementptr inbounds i32, ptr %894, i64 2
  %896 = load i32, ptr %895, align 4
  %897 = add i32 %893, %896
  %898 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 0
  %899 = load i32, ptr %898, align 4
  %900 = shl i32 %899, 15
  %901 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 0
  %902 = load i32, ptr %901, align 4
  %903 = lshr i32 %902, 17
  %904 = or i32 %900, %903
  %905 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 0
  %906 = load i32, ptr %905, align 4
  %907 = shl i32 %906, 13
  %908 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 0
  %909 = load i32, ptr %908, align 4
  %910 = lshr i32 %909, 19
  %911 = or i32 %907, %910
  %912 = xor i32 %904, %911
  %913 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 0
  %914 = load i32, ptr %913, align 4
  %915 = lshr i32 %914, 10
  %916 = xor i32 %912, %915
  %917 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 11
  %918 = load i32, ptr %917, align 4
  %919 = add i32 %916, %918
  %920 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 3
  %921 = load i32, ptr %920, align 4
  %922 = shl i32 %921, 25
  %923 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 3
  %924 = load i32, ptr %923, align 4
  %925 = lshr i32 %924, 7
  %926 = or i32 %922, %925
  %927 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 3
  %928 = load i32, ptr %927, align 4
  %929 = shl i32 %928, 14
  %930 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 3
  %931 = load i32, ptr %930, align 4
  %932 = lshr i32 %931, 18
  %933 = or i32 %929, %932
  %934 = xor i32 %926, %933
  %935 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 3
  %936 = load i32, ptr %935, align 4
  %937 = lshr i32 %936, 3
  %938 = xor i32 %934, %937
  %939 = add i32 %919, %938
  %940 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 2
  %941 = load i32, ptr %940, align 4
  %942 = add i32 %941, %939
  store i32 %942, ptr %940, align 4
  %943 = add i32 %897, %942
  %944 = load i32, ptr %13, align 4
  %945 = add i32 %944, %943
  store i32 %945, ptr %13, align 4
  %946 = load i32, ptr %13, align 4
  %947 = load i32, ptr %9, align 4
  %948 = add i32 %947, %946
  store i32 %948, ptr %9, align 4
  %949 = load i32, ptr %14, align 4
  %950 = shl i32 %949, 30
  %951 = load i32, ptr %14, align 4
  %952 = lshr i32 %951, 2
  %953 = or i32 %950, %952
  %954 = load i32, ptr %14, align 4
  %955 = shl i32 %954, 19
  %956 = load i32, ptr %14, align 4
  %957 = lshr i32 %956, 13
  %958 = or i32 %955, %957
  %959 = xor i32 %953, %958
  %960 = load i32, ptr %14, align 4
  %961 = shl i32 %960, 10
  %962 = load i32, ptr %14, align 4
  %963 = lshr i32 %962, 22
  %964 = or i32 %961, %963
  %965 = xor i32 %959, %964
  %966 = load i32, ptr %14, align 4
  %967 = load i32, ptr %15, align 4
  %968 = and i32 %966, %967
  %969 = load i32, ptr %8, align 4
  %970 = load i32, ptr %14, align 4
  %971 = load i32, ptr %15, align 4
  %972 = xor i32 %970, %971
  %973 = and i32 %969, %972
  %974 = xor i32 %968, %973
  %975 = add i32 %965, %974
  %976 = load i32, ptr %13, align 4
  %977 = add i32 %976, %975
  store i32 %977, ptr %13, align 4
  br label %978

978:                                              ; preds = %868
  br label %979

979:                                              ; preds = %978
  %980 = load i32, ptr %9, align 4
  %981 = shl i32 %980, 26
  %982 = load i32, ptr %9, align 4
  %983 = lshr i32 %982, 6
  %984 = or i32 %981, %983
  %985 = load i32, ptr %9, align 4
  %986 = shl i32 %985, 21
  %987 = load i32, ptr %9, align 4
  %988 = lshr i32 %987, 11
  %989 = or i32 %986, %988
  %990 = xor i32 %984, %989
  %991 = load i32, ptr %9, align 4
  %992 = shl i32 %991, 7
  %993 = load i32, ptr %9, align 4
  %994 = lshr i32 %993, 25
  %995 = or i32 %992, %994
  %996 = xor i32 %990, %995
  %997 = load i32, ptr %11, align 4
  %998 = load i32, ptr %9, align 4
  %999 = load i32, ptr %10, align 4
  %1000 = load i32, ptr %11, align 4
  %1001 = xor i32 %999, %1000
  %1002 = and i32 %998, %1001
  %1003 = xor i32 %997, %1002
  %1004 = add i32 %996, %1003
  %1005 = load ptr, ptr %6, align 8
  %1006 = getelementptr inbounds i32, ptr %1005, i64 3
  %1007 = load i32, ptr %1006, align 4
  %1008 = add i32 %1004, %1007
  %1009 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 1
  %1010 = load i32, ptr %1009, align 4
  %1011 = shl i32 %1010, 15
  %1012 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 1
  %1013 = load i32, ptr %1012, align 4
  %1014 = lshr i32 %1013, 17
  %1015 = or i32 %1011, %1014
  %1016 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 1
  %1017 = load i32, ptr %1016, align 4
  %1018 = shl i32 %1017, 13
  %1019 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 1
  %1020 = load i32, ptr %1019, align 4
  %1021 = lshr i32 %1020, 19
  %1022 = or i32 %1018, %1021
  %1023 = xor i32 %1015, %1022
  %1024 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 1
  %1025 = load i32, ptr %1024, align 4
  %1026 = lshr i32 %1025, 10
  %1027 = xor i32 %1023, %1026
  %1028 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 12
  %1029 = load i32, ptr %1028, align 4
  %1030 = add i32 %1027, %1029
  %1031 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 4
  %1032 = load i32, ptr %1031, align 4
  %1033 = shl i32 %1032, 25
  %1034 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 4
  %1035 = load i32, ptr %1034, align 4
  %1036 = lshr i32 %1035, 7
  %1037 = or i32 %1033, %1036
  %1038 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 4
  %1039 = load i32, ptr %1038, align 4
  %1040 = shl i32 %1039, 14
  %1041 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 4
  %1042 = load i32, ptr %1041, align 4
  %1043 = lshr i32 %1042, 18
  %1044 = or i32 %1040, %1043
  %1045 = xor i32 %1037, %1044
  %1046 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 4
  %1047 = load i32, ptr %1046, align 4
  %1048 = lshr i32 %1047, 3
  %1049 = xor i32 %1045, %1048
  %1050 = add i32 %1030, %1049
  %1051 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 3
  %1052 = load i32, ptr %1051, align 4
  %1053 = add i32 %1052, %1050
  store i32 %1053, ptr %1051, align 4
  %1054 = add i32 %1008, %1053
  %1055 = load i32, ptr %12, align 4
  %1056 = add i32 %1055, %1054
  store i32 %1056, ptr %12, align 4
  %1057 = load i32, ptr %12, align 4
  %1058 = load i32, ptr %8, align 4
  %1059 = add i32 %1058, %1057
  store i32 %1059, ptr %8, align 4
  %1060 = load i32, ptr %13, align 4
  %1061 = shl i32 %1060, 30
  %1062 = load i32, ptr %13, align 4
  %1063 = lshr i32 %1062, 2
  %1064 = or i32 %1061, %1063
  %1065 = load i32, ptr %13, align 4
  %1066 = shl i32 %1065, 19
  %1067 = load i32, ptr %13, align 4
  %1068 = lshr i32 %1067, 13
  %1069 = or i32 %1066, %1068
  %1070 = xor i32 %1064, %1069
  %1071 = load i32, ptr %13, align 4
  %1072 = shl i32 %1071, 10
  %1073 = load i32, ptr %13, align 4
  %1074 = lshr i32 %1073, 22
  %1075 = or i32 %1072, %1074
  %1076 = xor i32 %1070, %1075
  %1077 = load i32, ptr %13, align 4
  %1078 = load i32, ptr %14, align 4
  %1079 = and i32 %1077, %1078
  %1080 = load i32, ptr %15, align 4
  %1081 = load i32, ptr %13, align 4
  %1082 = load i32, ptr %14, align 4
  %1083 = xor i32 %1081, %1082
  %1084 = and i32 %1080, %1083
  %1085 = xor i32 %1079, %1084
  %1086 = add i32 %1076, %1085
  %1087 = load i32, ptr %12, align 4
  %1088 = add i32 %1087, %1086
  store i32 %1088, ptr %12, align 4
  br label %1089

1089:                                             ; preds = %979
  br label %1090

1090:                                             ; preds = %1089
  %1091 = load i32, ptr %8, align 4
  %1092 = shl i32 %1091, 26
  %1093 = load i32, ptr %8, align 4
  %1094 = lshr i32 %1093, 6
  %1095 = or i32 %1092, %1094
  %1096 = load i32, ptr %8, align 4
  %1097 = shl i32 %1096, 21
  %1098 = load i32, ptr %8, align 4
  %1099 = lshr i32 %1098, 11
  %1100 = or i32 %1097, %1099
  %1101 = xor i32 %1095, %1100
  %1102 = load i32, ptr %8, align 4
  %1103 = shl i32 %1102, 7
  %1104 = load i32, ptr %8, align 4
  %1105 = lshr i32 %1104, 25
  %1106 = or i32 %1103, %1105
  %1107 = xor i32 %1101, %1106
  %1108 = load i32, ptr %10, align 4
  %1109 = load i32, ptr %8, align 4
  %1110 = load i32, ptr %9, align 4
  %1111 = load i32, ptr %10, align 4
  %1112 = xor i32 %1110, %1111
  %1113 = and i32 %1109, %1112
  %1114 = xor i32 %1108, %1113
  %1115 = add i32 %1107, %1114
  %1116 = load ptr, ptr %6, align 8
  %1117 = getelementptr inbounds i32, ptr %1116, i64 4
  %1118 = load i32, ptr %1117, align 4
  %1119 = add i32 %1115, %1118
  %1120 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 2
  %1121 = load i32, ptr %1120, align 4
  %1122 = shl i32 %1121, 15
  %1123 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 2
  %1124 = load i32, ptr %1123, align 4
  %1125 = lshr i32 %1124, 17
  %1126 = or i32 %1122, %1125
  %1127 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 2
  %1128 = load i32, ptr %1127, align 4
  %1129 = shl i32 %1128, 13
  %1130 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 2
  %1131 = load i32, ptr %1130, align 4
  %1132 = lshr i32 %1131, 19
  %1133 = or i32 %1129, %1132
  %1134 = xor i32 %1126, %1133
  %1135 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 2
  %1136 = load i32, ptr %1135, align 4
  %1137 = lshr i32 %1136, 10
  %1138 = xor i32 %1134, %1137
  %1139 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 13
  %1140 = load i32, ptr %1139, align 4
  %1141 = add i32 %1138, %1140
  %1142 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 5
  %1143 = load i32, ptr %1142, align 4
  %1144 = shl i32 %1143, 25
  %1145 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 5
  %1146 = load i32, ptr %1145, align 4
  %1147 = lshr i32 %1146, 7
  %1148 = or i32 %1144, %1147
  %1149 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 5
  %1150 = load i32, ptr %1149, align 4
  %1151 = shl i32 %1150, 14
  %1152 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 5
  %1153 = load i32, ptr %1152, align 4
  %1154 = lshr i32 %1153, 18
  %1155 = or i32 %1151, %1154
  %1156 = xor i32 %1148, %1155
  %1157 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 5
  %1158 = load i32, ptr %1157, align 4
  %1159 = lshr i32 %1158, 3
  %1160 = xor i32 %1156, %1159
  %1161 = add i32 %1141, %1160
  %1162 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 4
  %1163 = load i32, ptr %1162, align 4
  %1164 = add i32 %1163, %1161
  store i32 %1164, ptr %1162, align 4
  %1165 = add i32 %1119, %1164
  %1166 = load i32, ptr %11, align 4
  %1167 = add i32 %1166, %1165
  store i32 %1167, ptr %11, align 4
  %1168 = load i32, ptr %11, align 4
  %1169 = load i32, ptr %15, align 4
  %1170 = add i32 %1169, %1168
  store i32 %1170, ptr %15, align 4
  %1171 = load i32, ptr %12, align 4
  %1172 = shl i32 %1171, 30
  %1173 = load i32, ptr %12, align 4
  %1174 = lshr i32 %1173, 2
  %1175 = or i32 %1172, %1174
  %1176 = load i32, ptr %12, align 4
  %1177 = shl i32 %1176, 19
  %1178 = load i32, ptr %12, align 4
  %1179 = lshr i32 %1178, 13
  %1180 = or i32 %1177, %1179
  %1181 = xor i32 %1175, %1180
  %1182 = load i32, ptr %12, align 4
  %1183 = shl i32 %1182, 10
  %1184 = load i32, ptr %12, align 4
  %1185 = lshr i32 %1184, 22
  %1186 = or i32 %1183, %1185
  %1187 = xor i32 %1181, %1186
  %1188 = load i32, ptr %12, align 4
  %1189 = load i32, ptr %13, align 4
  %1190 = and i32 %1188, %1189
  %1191 = load i32, ptr %14, align 4
  %1192 = load i32, ptr %12, align 4
  %1193 = load i32, ptr %13, align 4
  %1194 = xor i32 %1192, %1193
  %1195 = and i32 %1191, %1194
  %1196 = xor i32 %1190, %1195
  %1197 = add i32 %1187, %1196
  %1198 = load i32, ptr %11, align 4
  %1199 = add i32 %1198, %1197
  store i32 %1199, ptr %11, align 4
  br label %1200

1200:                                             ; preds = %1090
  br label %1201

1201:                                             ; preds = %1200
  %1202 = load i32, ptr %15, align 4
  %1203 = shl i32 %1202, 26
  %1204 = load i32, ptr %15, align 4
  %1205 = lshr i32 %1204, 6
  %1206 = or i32 %1203, %1205
  %1207 = load i32, ptr %15, align 4
  %1208 = shl i32 %1207, 21
  %1209 = load i32, ptr %15, align 4
  %1210 = lshr i32 %1209, 11
  %1211 = or i32 %1208, %1210
  %1212 = xor i32 %1206, %1211
  %1213 = load i32, ptr %15, align 4
  %1214 = shl i32 %1213, 7
  %1215 = load i32, ptr %15, align 4
  %1216 = lshr i32 %1215, 25
  %1217 = or i32 %1214, %1216
  %1218 = xor i32 %1212, %1217
  %1219 = load i32, ptr %9, align 4
  %1220 = load i32, ptr %15, align 4
  %1221 = load i32, ptr %8, align 4
  %1222 = load i32, ptr %9, align 4
  %1223 = xor i32 %1221, %1222
  %1224 = and i32 %1220, %1223
  %1225 = xor i32 %1219, %1224
  %1226 = add i32 %1218, %1225
  %1227 = load ptr, ptr %6, align 8
  %1228 = getelementptr inbounds i32, ptr %1227, i64 5
  %1229 = load i32, ptr %1228, align 4
  %1230 = add i32 %1226, %1229
  %1231 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 3
  %1232 = load i32, ptr %1231, align 4
  %1233 = shl i32 %1232, 15
  %1234 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 3
  %1235 = load i32, ptr %1234, align 4
  %1236 = lshr i32 %1235, 17
  %1237 = or i32 %1233, %1236
  %1238 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 3
  %1239 = load i32, ptr %1238, align 4
  %1240 = shl i32 %1239, 13
  %1241 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 3
  %1242 = load i32, ptr %1241, align 4
  %1243 = lshr i32 %1242, 19
  %1244 = or i32 %1240, %1243
  %1245 = xor i32 %1237, %1244
  %1246 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 3
  %1247 = load i32, ptr %1246, align 4
  %1248 = lshr i32 %1247, 10
  %1249 = xor i32 %1245, %1248
  %1250 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 14
  %1251 = load i32, ptr %1250, align 4
  %1252 = add i32 %1249, %1251
  %1253 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 6
  %1254 = load i32, ptr %1253, align 4
  %1255 = shl i32 %1254, 25
  %1256 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 6
  %1257 = load i32, ptr %1256, align 4
  %1258 = lshr i32 %1257, 7
  %1259 = or i32 %1255, %1258
  %1260 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 6
  %1261 = load i32, ptr %1260, align 4
  %1262 = shl i32 %1261, 14
  %1263 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 6
  %1264 = load i32, ptr %1263, align 4
  %1265 = lshr i32 %1264, 18
  %1266 = or i32 %1262, %1265
  %1267 = xor i32 %1259, %1266
  %1268 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 6
  %1269 = load i32, ptr %1268, align 4
  %1270 = lshr i32 %1269, 3
  %1271 = xor i32 %1267, %1270
  %1272 = add i32 %1252, %1271
  %1273 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 5
  %1274 = load i32, ptr %1273, align 4
  %1275 = add i32 %1274, %1272
  store i32 %1275, ptr %1273, align 4
  %1276 = add i32 %1230, %1275
  %1277 = load i32, ptr %10, align 4
  %1278 = add i32 %1277, %1276
  store i32 %1278, ptr %10, align 4
  %1279 = load i32, ptr %10, align 4
  %1280 = load i32, ptr %14, align 4
  %1281 = add i32 %1280, %1279
  store i32 %1281, ptr %14, align 4
  %1282 = load i32, ptr %11, align 4
  %1283 = shl i32 %1282, 30
  %1284 = load i32, ptr %11, align 4
  %1285 = lshr i32 %1284, 2
  %1286 = or i32 %1283, %1285
  %1287 = load i32, ptr %11, align 4
  %1288 = shl i32 %1287, 19
  %1289 = load i32, ptr %11, align 4
  %1290 = lshr i32 %1289, 13
  %1291 = or i32 %1288, %1290
  %1292 = xor i32 %1286, %1291
  %1293 = load i32, ptr %11, align 4
  %1294 = shl i32 %1293, 10
  %1295 = load i32, ptr %11, align 4
  %1296 = lshr i32 %1295, 22
  %1297 = or i32 %1294, %1296
  %1298 = xor i32 %1292, %1297
  %1299 = load i32, ptr %11, align 4
  %1300 = load i32, ptr %12, align 4
  %1301 = and i32 %1299, %1300
  %1302 = load i32, ptr %13, align 4
  %1303 = load i32, ptr %11, align 4
  %1304 = load i32, ptr %12, align 4
  %1305 = xor i32 %1303, %1304
  %1306 = and i32 %1302, %1305
  %1307 = xor i32 %1301, %1306
  %1308 = add i32 %1298, %1307
  %1309 = load i32, ptr %10, align 4
  %1310 = add i32 %1309, %1308
  store i32 %1310, ptr %10, align 4
  br label %1311

1311:                                             ; preds = %1201
  br label %1312

1312:                                             ; preds = %1311
  %1313 = load i32, ptr %14, align 4
  %1314 = shl i32 %1313, 26
  %1315 = load i32, ptr %14, align 4
  %1316 = lshr i32 %1315, 6
  %1317 = or i32 %1314, %1316
  %1318 = load i32, ptr %14, align 4
  %1319 = shl i32 %1318, 21
  %1320 = load i32, ptr %14, align 4
  %1321 = lshr i32 %1320, 11
  %1322 = or i32 %1319, %1321
  %1323 = xor i32 %1317, %1322
  %1324 = load i32, ptr %14, align 4
  %1325 = shl i32 %1324, 7
  %1326 = load i32, ptr %14, align 4
  %1327 = lshr i32 %1326, 25
  %1328 = or i32 %1325, %1327
  %1329 = xor i32 %1323, %1328
  %1330 = load i32, ptr %8, align 4
  %1331 = load i32, ptr %14, align 4
  %1332 = load i32, ptr %15, align 4
  %1333 = load i32, ptr %8, align 4
  %1334 = xor i32 %1332, %1333
  %1335 = and i32 %1331, %1334
  %1336 = xor i32 %1330, %1335
  %1337 = add i32 %1329, %1336
  %1338 = load ptr, ptr %6, align 8
  %1339 = getelementptr inbounds i32, ptr %1338, i64 6
  %1340 = load i32, ptr %1339, align 4
  %1341 = add i32 %1337, %1340
  %1342 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 4
  %1343 = load i32, ptr %1342, align 4
  %1344 = shl i32 %1343, 15
  %1345 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 4
  %1346 = load i32, ptr %1345, align 4
  %1347 = lshr i32 %1346, 17
  %1348 = or i32 %1344, %1347
  %1349 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 4
  %1350 = load i32, ptr %1349, align 4
  %1351 = shl i32 %1350, 13
  %1352 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 4
  %1353 = load i32, ptr %1352, align 4
  %1354 = lshr i32 %1353, 19
  %1355 = or i32 %1351, %1354
  %1356 = xor i32 %1348, %1355
  %1357 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 4
  %1358 = load i32, ptr %1357, align 4
  %1359 = lshr i32 %1358, 10
  %1360 = xor i32 %1356, %1359
  %1361 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 15
  %1362 = load i32, ptr %1361, align 4
  %1363 = add i32 %1360, %1362
  %1364 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 7
  %1365 = load i32, ptr %1364, align 4
  %1366 = shl i32 %1365, 25
  %1367 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 7
  %1368 = load i32, ptr %1367, align 4
  %1369 = lshr i32 %1368, 7
  %1370 = or i32 %1366, %1369
  %1371 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 7
  %1372 = load i32, ptr %1371, align 4
  %1373 = shl i32 %1372, 14
  %1374 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 7
  %1375 = load i32, ptr %1374, align 4
  %1376 = lshr i32 %1375, 18
  %1377 = or i32 %1373, %1376
  %1378 = xor i32 %1370, %1377
  %1379 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 7
  %1380 = load i32, ptr %1379, align 4
  %1381 = lshr i32 %1380, 3
  %1382 = xor i32 %1378, %1381
  %1383 = add i32 %1363, %1382
  %1384 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 6
  %1385 = load i32, ptr %1384, align 4
  %1386 = add i32 %1385, %1383
  store i32 %1386, ptr %1384, align 4
  %1387 = add i32 %1341, %1386
  %1388 = load i32, ptr %9, align 4
  %1389 = add i32 %1388, %1387
  store i32 %1389, ptr %9, align 4
  %1390 = load i32, ptr %9, align 4
  %1391 = load i32, ptr %13, align 4
  %1392 = add i32 %1391, %1390
  store i32 %1392, ptr %13, align 4
  %1393 = load i32, ptr %10, align 4
  %1394 = shl i32 %1393, 30
  %1395 = load i32, ptr %10, align 4
  %1396 = lshr i32 %1395, 2
  %1397 = or i32 %1394, %1396
  %1398 = load i32, ptr %10, align 4
  %1399 = shl i32 %1398, 19
  %1400 = load i32, ptr %10, align 4
  %1401 = lshr i32 %1400, 13
  %1402 = or i32 %1399, %1401
  %1403 = xor i32 %1397, %1402
  %1404 = load i32, ptr %10, align 4
  %1405 = shl i32 %1404, 10
  %1406 = load i32, ptr %10, align 4
  %1407 = lshr i32 %1406, 22
  %1408 = or i32 %1405, %1407
  %1409 = xor i32 %1403, %1408
  %1410 = load i32, ptr %10, align 4
  %1411 = load i32, ptr %11, align 4
  %1412 = and i32 %1410, %1411
  %1413 = load i32, ptr %12, align 4
  %1414 = load i32, ptr %10, align 4
  %1415 = load i32, ptr %11, align 4
  %1416 = xor i32 %1414, %1415
  %1417 = and i32 %1413, %1416
  %1418 = xor i32 %1412, %1417
  %1419 = add i32 %1409, %1418
  %1420 = load i32, ptr %9, align 4
  %1421 = add i32 %1420, %1419
  store i32 %1421, ptr %9, align 4
  br label %1422

1422:                                             ; preds = %1312
  br label %1423

1423:                                             ; preds = %1422
  %1424 = load i32, ptr %13, align 4
  %1425 = shl i32 %1424, 26
  %1426 = load i32, ptr %13, align 4
  %1427 = lshr i32 %1426, 6
  %1428 = or i32 %1425, %1427
  %1429 = load i32, ptr %13, align 4
  %1430 = shl i32 %1429, 21
  %1431 = load i32, ptr %13, align 4
  %1432 = lshr i32 %1431, 11
  %1433 = or i32 %1430, %1432
  %1434 = xor i32 %1428, %1433
  %1435 = load i32, ptr %13, align 4
  %1436 = shl i32 %1435, 7
  %1437 = load i32, ptr %13, align 4
  %1438 = lshr i32 %1437, 25
  %1439 = or i32 %1436, %1438
  %1440 = xor i32 %1434, %1439
  %1441 = load i32, ptr %15, align 4
  %1442 = load i32, ptr %13, align 4
  %1443 = load i32, ptr %14, align 4
  %1444 = load i32, ptr %15, align 4
  %1445 = xor i32 %1443, %1444
  %1446 = and i32 %1442, %1445
  %1447 = xor i32 %1441, %1446
  %1448 = add i32 %1440, %1447
  %1449 = load ptr, ptr %6, align 8
  %1450 = getelementptr inbounds i32, ptr %1449, i64 7
  %1451 = load i32, ptr %1450, align 4
  %1452 = add i32 %1448, %1451
  %1453 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 5
  %1454 = load i32, ptr %1453, align 4
  %1455 = shl i32 %1454, 15
  %1456 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 5
  %1457 = load i32, ptr %1456, align 4
  %1458 = lshr i32 %1457, 17
  %1459 = or i32 %1455, %1458
  %1460 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 5
  %1461 = load i32, ptr %1460, align 4
  %1462 = shl i32 %1461, 13
  %1463 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 5
  %1464 = load i32, ptr %1463, align 4
  %1465 = lshr i32 %1464, 19
  %1466 = or i32 %1462, %1465
  %1467 = xor i32 %1459, %1466
  %1468 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 5
  %1469 = load i32, ptr %1468, align 4
  %1470 = lshr i32 %1469, 10
  %1471 = xor i32 %1467, %1470
  %1472 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 0
  %1473 = load i32, ptr %1472, align 4
  %1474 = add i32 %1471, %1473
  %1475 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 8
  %1476 = load i32, ptr %1475, align 4
  %1477 = shl i32 %1476, 25
  %1478 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 8
  %1479 = load i32, ptr %1478, align 4
  %1480 = lshr i32 %1479, 7
  %1481 = or i32 %1477, %1480
  %1482 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 8
  %1483 = load i32, ptr %1482, align 4
  %1484 = shl i32 %1483, 14
  %1485 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 8
  %1486 = load i32, ptr %1485, align 4
  %1487 = lshr i32 %1486, 18
  %1488 = or i32 %1484, %1487
  %1489 = xor i32 %1481, %1488
  %1490 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 8
  %1491 = load i32, ptr %1490, align 4
  %1492 = lshr i32 %1491, 3
  %1493 = xor i32 %1489, %1492
  %1494 = add i32 %1474, %1493
  %1495 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 7
  %1496 = load i32, ptr %1495, align 4
  %1497 = add i32 %1496, %1494
  store i32 %1497, ptr %1495, align 4
  %1498 = add i32 %1452, %1497
  %1499 = load i32, ptr %8, align 4
  %1500 = add i32 %1499, %1498
  store i32 %1500, ptr %8, align 4
  %1501 = load i32, ptr %8, align 4
  %1502 = load i32, ptr %12, align 4
  %1503 = add i32 %1502, %1501
  store i32 %1503, ptr %12, align 4
  %1504 = load i32, ptr %9, align 4
  %1505 = shl i32 %1504, 30
  %1506 = load i32, ptr %9, align 4
  %1507 = lshr i32 %1506, 2
  %1508 = or i32 %1505, %1507
  %1509 = load i32, ptr %9, align 4
  %1510 = shl i32 %1509, 19
  %1511 = load i32, ptr %9, align 4
  %1512 = lshr i32 %1511, 13
  %1513 = or i32 %1510, %1512
  %1514 = xor i32 %1508, %1513
  %1515 = load i32, ptr %9, align 4
  %1516 = shl i32 %1515, 10
  %1517 = load i32, ptr %9, align 4
  %1518 = lshr i32 %1517, 22
  %1519 = or i32 %1516, %1518
  %1520 = xor i32 %1514, %1519
  %1521 = load i32, ptr %9, align 4
  %1522 = load i32, ptr %10, align 4
  %1523 = and i32 %1521, %1522
  %1524 = load i32, ptr %11, align 4
  %1525 = load i32, ptr %9, align 4
  %1526 = load i32, ptr %10, align 4
  %1527 = xor i32 %1525, %1526
  %1528 = and i32 %1524, %1527
  %1529 = xor i32 %1523, %1528
  %1530 = add i32 %1520, %1529
  %1531 = load i32, ptr %8, align 4
  %1532 = add i32 %1531, %1530
  store i32 %1532, ptr %8, align 4
  br label %1533

1533:                                             ; preds = %1423
  br label %1534

1534:                                             ; preds = %1533
  %1535 = load i32, ptr %12, align 4
  %1536 = shl i32 %1535, 26
  %1537 = load i32, ptr %12, align 4
  %1538 = lshr i32 %1537, 6
  %1539 = or i32 %1536, %1538
  %1540 = load i32, ptr %12, align 4
  %1541 = shl i32 %1540, 21
  %1542 = load i32, ptr %12, align 4
  %1543 = lshr i32 %1542, 11
  %1544 = or i32 %1541, %1543
  %1545 = xor i32 %1539, %1544
  %1546 = load i32, ptr %12, align 4
  %1547 = shl i32 %1546, 7
  %1548 = load i32, ptr %12, align 4
  %1549 = lshr i32 %1548, 25
  %1550 = or i32 %1547, %1549
  %1551 = xor i32 %1545, %1550
  %1552 = load i32, ptr %14, align 4
  %1553 = load i32, ptr %12, align 4
  %1554 = load i32, ptr %13, align 4
  %1555 = load i32, ptr %14, align 4
  %1556 = xor i32 %1554, %1555
  %1557 = and i32 %1553, %1556
  %1558 = xor i32 %1552, %1557
  %1559 = add i32 %1551, %1558
  %1560 = load ptr, ptr %6, align 8
  %1561 = getelementptr inbounds i32, ptr %1560, i64 8
  %1562 = load i32, ptr %1561, align 4
  %1563 = add i32 %1559, %1562
  %1564 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 6
  %1565 = load i32, ptr %1564, align 4
  %1566 = shl i32 %1565, 15
  %1567 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 6
  %1568 = load i32, ptr %1567, align 4
  %1569 = lshr i32 %1568, 17
  %1570 = or i32 %1566, %1569
  %1571 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 6
  %1572 = load i32, ptr %1571, align 4
  %1573 = shl i32 %1572, 13
  %1574 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 6
  %1575 = load i32, ptr %1574, align 4
  %1576 = lshr i32 %1575, 19
  %1577 = or i32 %1573, %1576
  %1578 = xor i32 %1570, %1577
  %1579 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 6
  %1580 = load i32, ptr %1579, align 4
  %1581 = lshr i32 %1580, 10
  %1582 = xor i32 %1578, %1581
  %1583 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 1
  %1584 = load i32, ptr %1583, align 4
  %1585 = add i32 %1582, %1584
  %1586 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 9
  %1587 = load i32, ptr %1586, align 4
  %1588 = shl i32 %1587, 25
  %1589 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 9
  %1590 = load i32, ptr %1589, align 4
  %1591 = lshr i32 %1590, 7
  %1592 = or i32 %1588, %1591
  %1593 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 9
  %1594 = load i32, ptr %1593, align 4
  %1595 = shl i32 %1594, 14
  %1596 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 9
  %1597 = load i32, ptr %1596, align 4
  %1598 = lshr i32 %1597, 18
  %1599 = or i32 %1595, %1598
  %1600 = xor i32 %1592, %1599
  %1601 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 9
  %1602 = load i32, ptr %1601, align 4
  %1603 = lshr i32 %1602, 3
  %1604 = xor i32 %1600, %1603
  %1605 = add i32 %1585, %1604
  %1606 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 8
  %1607 = load i32, ptr %1606, align 4
  %1608 = add i32 %1607, %1605
  store i32 %1608, ptr %1606, align 4
  %1609 = add i32 %1563, %1608
  %1610 = load i32, ptr %15, align 4
  %1611 = add i32 %1610, %1609
  store i32 %1611, ptr %15, align 4
  %1612 = load i32, ptr %15, align 4
  %1613 = load i32, ptr %11, align 4
  %1614 = add i32 %1613, %1612
  store i32 %1614, ptr %11, align 4
  %1615 = load i32, ptr %8, align 4
  %1616 = shl i32 %1615, 30
  %1617 = load i32, ptr %8, align 4
  %1618 = lshr i32 %1617, 2
  %1619 = or i32 %1616, %1618
  %1620 = load i32, ptr %8, align 4
  %1621 = shl i32 %1620, 19
  %1622 = load i32, ptr %8, align 4
  %1623 = lshr i32 %1622, 13
  %1624 = or i32 %1621, %1623
  %1625 = xor i32 %1619, %1624
  %1626 = load i32, ptr %8, align 4
  %1627 = shl i32 %1626, 10
  %1628 = load i32, ptr %8, align 4
  %1629 = lshr i32 %1628, 22
  %1630 = or i32 %1627, %1629
  %1631 = xor i32 %1625, %1630
  %1632 = load i32, ptr %8, align 4
  %1633 = load i32, ptr %9, align 4
  %1634 = and i32 %1632, %1633
  %1635 = load i32, ptr %10, align 4
  %1636 = load i32, ptr %8, align 4
  %1637 = load i32, ptr %9, align 4
  %1638 = xor i32 %1636, %1637
  %1639 = and i32 %1635, %1638
  %1640 = xor i32 %1634, %1639
  %1641 = add i32 %1631, %1640
  %1642 = load i32, ptr %15, align 4
  %1643 = add i32 %1642, %1641
  store i32 %1643, ptr %15, align 4
  br label %1644

1644:                                             ; preds = %1534
  br label %1645

1645:                                             ; preds = %1644
  %1646 = load i32, ptr %11, align 4
  %1647 = shl i32 %1646, 26
  %1648 = load i32, ptr %11, align 4
  %1649 = lshr i32 %1648, 6
  %1650 = or i32 %1647, %1649
  %1651 = load i32, ptr %11, align 4
  %1652 = shl i32 %1651, 21
  %1653 = load i32, ptr %11, align 4
  %1654 = lshr i32 %1653, 11
  %1655 = or i32 %1652, %1654
  %1656 = xor i32 %1650, %1655
  %1657 = load i32, ptr %11, align 4
  %1658 = shl i32 %1657, 7
  %1659 = load i32, ptr %11, align 4
  %1660 = lshr i32 %1659, 25
  %1661 = or i32 %1658, %1660
  %1662 = xor i32 %1656, %1661
  %1663 = load i32, ptr %13, align 4
  %1664 = load i32, ptr %11, align 4
  %1665 = load i32, ptr %12, align 4
  %1666 = load i32, ptr %13, align 4
  %1667 = xor i32 %1665, %1666
  %1668 = and i32 %1664, %1667
  %1669 = xor i32 %1663, %1668
  %1670 = add i32 %1662, %1669
  %1671 = load ptr, ptr %6, align 8
  %1672 = getelementptr inbounds i32, ptr %1671, i64 9
  %1673 = load i32, ptr %1672, align 4
  %1674 = add i32 %1670, %1673
  %1675 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 7
  %1676 = load i32, ptr %1675, align 4
  %1677 = shl i32 %1676, 15
  %1678 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 7
  %1679 = load i32, ptr %1678, align 4
  %1680 = lshr i32 %1679, 17
  %1681 = or i32 %1677, %1680
  %1682 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 7
  %1683 = load i32, ptr %1682, align 4
  %1684 = shl i32 %1683, 13
  %1685 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 7
  %1686 = load i32, ptr %1685, align 4
  %1687 = lshr i32 %1686, 19
  %1688 = or i32 %1684, %1687
  %1689 = xor i32 %1681, %1688
  %1690 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 7
  %1691 = load i32, ptr %1690, align 4
  %1692 = lshr i32 %1691, 10
  %1693 = xor i32 %1689, %1692
  %1694 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 2
  %1695 = load i32, ptr %1694, align 4
  %1696 = add i32 %1693, %1695
  %1697 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 10
  %1698 = load i32, ptr %1697, align 4
  %1699 = shl i32 %1698, 25
  %1700 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 10
  %1701 = load i32, ptr %1700, align 4
  %1702 = lshr i32 %1701, 7
  %1703 = or i32 %1699, %1702
  %1704 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 10
  %1705 = load i32, ptr %1704, align 4
  %1706 = shl i32 %1705, 14
  %1707 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 10
  %1708 = load i32, ptr %1707, align 4
  %1709 = lshr i32 %1708, 18
  %1710 = or i32 %1706, %1709
  %1711 = xor i32 %1703, %1710
  %1712 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 10
  %1713 = load i32, ptr %1712, align 4
  %1714 = lshr i32 %1713, 3
  %1715 = xor i32 %1711, %1714
  %1716 = add i32 %1696, %1715
  %1717 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 9
  %1718 = load i32, ptr %1717, align 4
  %1719 = add i32 %1718, %1716
  store i32 %1719, ptr %1717, align 4
  %1720 = add i32 %1674, %1719
  %1721 = load i32, ptr %14, align 4
  %1722 = add i32 %1721, %1720
  store i32 %1722, ptr %14, align 4
  %1723 = load i32, ptr %14, align 4
  %1724 = load i32, ptr %10, align 4
  %1725 = add i32 %1724, %1723
  store i32 %1725, ptr %10, align 4
  %1726 = load i32, ptr %15, align 4
  %1727 = shl i32 %1726, 30
  %1728 = load i32, ptr %15, align 4
  %1729 = lshr i32 %1728, 2
  %1730 = or i32 %1727, %1729
  %1731 = load i32, ptr %15, align 4
  %1732 = shl i32 %1731, 19
  %1733 = load i32, ptr %15, align 4
  %1734 = lshr i32 %1733, 13
  %1735 = or i32 %1732, %1734
  %1736 = xor i32 %1730, %1735
  %1737 = load i32, ptr %15, align 4
  %1738 = shl i32 %1737, 10
  %1739 = load i32, ptr %15, align 4
  %1740 = lshr i32 %1739, 22
  %1741 = or i32 %1738, %1740
  %1742 = xor i32 %1736, %1741
  %1743 = load i32, ptr %15, align 4
  %1744 = load i32, ptr %8, align 4
  %1745 = and i32 %1743, %1744
  %1746 = load i32, ptr %9, align 4
  %1747 = load i32, ptr %15, align 4
  %1748 = load i32, ptr %8, align 4
  %1749 = xor i32 %1747, %1748
  %1750 = and i32 %1746, %1749
  %1751 = xor i32 %1745, %1750
  %1752 = add i32 %1742, %1751
  %1753 = load i32, ptr %14, align 4
  %1754 = add i32 %1753, %1752
  store i32 %1754, ptr %14, align 4
  br label %1755

1755:                                             ; preds = %1645
  br label %1756

1756:                                             ; preds = %1755
  %1757 = load i32, ptr %10, align 4
  %1758 = shl i32 %1757, 26
  %1759 = load i32, ptr %10, align 4
  %1760 = lshr i32 %1759, 6
  %1761 = or i32 %1758, %1760
  %1762 = load i32, ptr %10, align 4
  %1763 = shl i32 %1762, 21
  %1764 = load i32, ptr %10, align 4
  %1765 = lshr i32 %1764, 11
  %1766 = or i32 %1763, %1765
  %1767 = xor i32 %1761, %1766
  %1768 = load i32, ptr %10, align 4
  %1769 = shl i32 %1768, 7
  %1770 = load i32, ptr %10, align 4
  %1771 = lshr i32 %1770, 25
  %1772 = or i32 %1769, %1771
  %1773 = xor i32 %1767, %1772
  %1774 = load i32, ptr %12, align 4
  %1775 = load i32, ptr %10, align 4
  %1776 = load i32, ptr %11, align 4
  %1777 = load i32, ptr %12, align 4
  %1778 = xor i32 %1776, %1777
  %1779 = and i32 %1775, %1778
  %1780 = xor i32 %1774, %1779
  %1781 = add i32 %1773, %1780
  %1782 = load ptr, ptr %6, align 8
  %1783 = getelementptr inbounds i32, ptr %1782, i64 10
  %1784 = load i32, ptr %1783, align 4
  %1785 = add i32 %1781, %1784
  %1786 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 8
  %1787 = load i32, ptr %1786, align 4
  %1788 = shl i32 %1787, 15
  %1789 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 8
  %1790 = load i32, ptr %1789, align 4
  %1791 = lshr i32 %1790, 17
  %1792 = or i32 %1788, %1791
  %1793 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 8
  %1794 = load i32, ptr %1793, align 4
  %1795 = shl i32 %1794, 13
  %1796 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 8
  %1797 = load i32, ptr %1796, align 4
  %1798 = lshr i32 %1797, 19
  %1799 = or i32 %1795, %1798
  %1800 = xor i32 %1792, %1799
  %1801 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 8
  %1802 = load i32, ptr %1801, align 4
  %1803 = lshr i32 %1802, 10
  %1804 = xor i32 %1800, %1803
  %1805 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 3
  %1806 = load i32, ptr %1805, align 4
  %1807 = add i32 %1804, %1806
  %1808 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 11
  %1809 = load i32, ptr %1808, align 4
  %1810 = shl i32 %1809, 25
  %1811 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 11
  %1812 = load i32, ptr %1811, align 4
  %1813 = lshr i32 %1812, 7
  %1814 = or i32 %1810, %1813
  %1815 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 11
  %1816 = load i32, ptr %1815, align 4
  %1817 = shl i32 %1816, 14
  %1818 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 11
  %1819 = load i32, ptr %1818, align 4
  %1820 = lshr i32 %1819, 18
  %1821 = or i32 %1817, %1820
  %1822 = xor i32 %1814, %1821
  %1823 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 11
  %1824 = load i32, ptr %1823, align 4
  %1825 = lshr i32 %1824, 3
  %1826 = xor i32 %1822, %1825
  %1827 = add i32 %1807, %1826
  %1828 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 10
  %1829 = load i32, ptr %1828, align 4
  %1830 = add i32 %1829, %1827
  store i32 %1830, ptr %1828, align 4
  %1831 = add i32 %1785, %1830
  %1832 = load i32, ptr %13, align 4
  %1833 = add i32 %1832, %1831
  store i32 %1833, ptr %13, align 4
  %1834 = load i32, ptr %13, align 4
  %1835 = load i32, ptr %9, align 4
  %1836 = add i32 %1835, %1834
  store i32 %1836, ptr %9, align 4
  %1837 = load i32, ptr %14, align 4
  %1838 = shl i32 %1837, 30
  %1839 = load i32, ptr %14, align 4
  %1840 = lshr i32 %1839, 2
  %1841 = or i32 %1838, %1840
  %1842 = load i32, ptr %14, align 4
  %1843 = shl i32 %1842, 19
  %1844 = load i32, ptr %14, align 4
  %1845 = lshr i32 %1844, 13
  %1846 = or i32 %1843, %1845
  %1847 = xor i32 %1841, %1846
  %1848 = load i32, ptr %14, align 4
  %1849 = shl i32 %1848, 10
  %1850 = load i32, ptr %14, align 4
  %1851 = lshr i32 %1850, 22
  %1852 = or i32 %1849, %1851
  %1853 = xor i32 %1847, %1852
  %1854 = load i32, ptr %14, align 4
  %1855 = load i32, ptr %15, align 4
  %1856 = and i32 %1854, %1855
  %1857 = load i32, ptr %8, align 4
  %1858 = load i32, ptr %14, align 4
  %1859 = load i32, ptr %15, align 4
  %1860 = xor i32 %1858, %1859
  %1861 = and i32 %1857, %1860
  %1862 = xor i32 %1856, %1861
  %1863 = add i32 %1853, %1862
  %1864 = load i32, ptr %13, align 4
  %1865 = add i32 %1864, %1863
  store i32 %1865, ptr %13, align 4
  br label %1866

1866:                                             ; preds = %1756
  br label %1867

1867:                                             ; preds = %1866
  %1868 = load i32, ptr %9, align 4
  %1869 = shl i32 %1868, 26
  %1870 = load i32, ptr %9, align 4
  %1871 = lshr i32 %1870, 6
  %1872 = or i32 %1869, %1871
  %1873 = load i32, ptr %9, align 4
  %1874 = shl i32 %1873, 21
  %1875 = load i32, ptr %9, align 4
  %1876 = lshr i32 %1875, 11
  %1877 = or i32 %1874, %1876
  %1878 = xor i32 %1872, %1877
  %1879 = load i32, ptr %9, align 4
  %1880 = shl i32 %1879, 7
  %1881 = load i32, ptr %9, align 4
  %1882 = lshr i32 %1881, 25
  %1883 = or i32 %1880, %1882
  %1884 = xor i32 %1878, %1883
  %1885 = load i32, ptr %11, align 4
  %1886 = load i32, ptr %9, align 4
  %1887 = load i32, ptr %10, align 4
  %1888 = load i32, ptr %11, align 4
  %1889 = xor i32 %1887, %1888
  %1890 = and i32 %1886, %1889
  %1891 = xor i32 %1885, %1890
  %1892 = add i32 %1884, %1891
  %1893 = load ptr, ptr %6, align 8
  %1894 = getelementptr inbounds i32, ptr %1893, i64 11
  %1895 = load i32, ptr %1894, align 4
  %1896 = add i32 %1892, %1895
  %1897 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 9
  %1898 = load i32, ptr %1897, align 4
  %1899 = shl i32 %1898, 15
  %1900 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 9
  %1901 = load i32, ptr %1900, align 4
  %1902 = lshr i32 %1901, 17
  %1903 = or i32 %1899, %1902
  %1904 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 9
  %1905 = load i32, ptr %1904, align 4
  %1906 = shl i32 %1905, 13
  %1907 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 9
  %1908 = load i32, ptr %1907, align 4
  %1909 = lshr i32 %1908, 19
  %1910 = or i32 %1906, %1909
  %1911 = xor i32 %1903, %1910
  %1912 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 9
  %1913 = load i32, ptr %1912, align 4
  %1914 = lshr i32 %1913, 10
  %1915 = xor i32 %1911, %1914
  %1916 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 4
  %1917 = load i32, ptr %1916, align 4
  %1918 = add i32 %1915, %1917
  %1919 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 12
  %1920 = load i32, ptr %1919, align 4
  %1921 = shl i32 %1920, 25
  %1922 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 12
  %1923 = load i32, ptr %1922, align 4
  %1924 = lshr i32 %1923, 7
  %1925 = or i32 %1921, %1924
  %1926 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 12
  %1927 = load i32, ptr %1926, align 4
  %1928 = shl i32 %1927, 14
  %1929 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 12
  %1930 = load i32, ptr %1929, align 4
  %1931 = lshr i32 %1930, 18
  %1932 = or i32 %1928, %1931
  %1933 = xor i32 %1925, %1932
  %1934 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 12
  %1935 = load i32, ptr %1934, align 4
  %1936 = lshr i32 %1935, 3
  %1937 = xor i32 %1933, %1936
  %1938 = add i32 %1918, %1937
  %1939 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 11
  %1940 = load i32, ptr %1939, align 4
  %1941 = add i32 %1940, %1938
  store i32 %1941, ptr %1939, align 4
  %1942 = add i32 %1896, %1941
  %1943 = load i32, ptr %12, align 4
  %1944 = add i32 %1943, %1942
  store i32 %1944, ptr %12, align 4
  %1945 = load i32, ptr %12, align 4
  %1946 = load i32, ptr %8, align 4
  %1947 = add i32 %1946, %1945
  store i32 %1947, ptr %8, align 4
  %1948 = load i32, ptr %13, align 4
  %1949 = shl i32 %1948, 30
  %1950 = load i32, ptr %13, align 4
  %1951 = lshr i32 %1950, 2
  %1952 = or i32 %1949, %1951
  %1953 = load i32, ptr %13, align 4
  %1954 = shl i32 %1953, 19
  %1955 = load i32, ptr %13, align 4
  %1956 = lshr i32 %1955, 13
  %1957 = or i32 %1954, %1956
  %1958 = xor i32 %1952, %1957
  %1959 = load i32, ptr %13, align 4
  %1960 = shl i32 %1959, 10
  %1961 = load i32, ptr %13, align 4
  %1962 = lshr i32 %1961, 22
  %1963 = or i32 %1960, %1962
  %1964 = xor i32 %1958, %1963
  %1965 = load i32, ptr %13, align 4
  %1966 = load i32, ptr %14, align 4
  %1967 = and i32 %1965, %1966
  %1968 = load i32, ptr %15, align 4
  %1969 = load i32, ptr %13, align 4
  %1970 = load i32, ptr %14, align 4
  %1971 = xor i32 %1969, %1970
  %1972 = and i32 %1968, %1971
  %1973 = xor i32 %1967, %1972
  %1974 = add i32 %1964, %1973
  %1975 = load i32, ptr %12, align 4
  %1976 = add i32 %1975, %1974
  store i32 %1976, ptr %12, align 4
  br label %1977

1977:                                             ; preds = %1867
  br label %1978

1978:                                             ; preds = %1977
  %1979 = load i32, ptr %8, align 4
  %1980 = shl i32 %1979, 26
  %1981 = load i32, ptr %8, align 4
  %1982 = lshr i32 %1981, 6
  %1983 = or i32 %1980, %1982
  %1984 = load i32, ptr %8, align 4
  %1985 = shl i32 %1984, 21
  %1986 = load i32, ptr %8, align 4
  %1987 = lshr i32 %1986, 11
  %1988 = or i32 %1985, %1987
  %1989 = xor i32 %1983, %1988
  %1990 = load i32, ptr %8, align 4
  %1991 = shl i32 %1990, 7
  %1992 = load i32, ptr %8, align 4
  %1993 = lshr i32 %1992, 25
  %1994 = or i32 %1991, %1993
  %1995 = xor i32 %1989, %1994
  %1996 = load i32, ptr %10, align 4
  %1997 = load i32, ptr %8, align 4
  %1998 = load i32, ptr %9, align 4
  %1999 = load i32, ptr %10, align 4
  %2000 = xor i32 %1998, %1999
  %2001 = and i32 %1997, %2000
  %2002 = xor i32 %1996, %2001
  %2003 = add i32 %1995, %2002
  %2004 = load ptr, ptr %6, align 8
  %2005 = getelementptr inbounds i32, ptr %2004, i64 12
  %2006 = load i32, ptr %2005, align 4
  %2007 = add i32 %2003, %2006
  %2008 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 10
  %2009 = load i32, ptr %2008, align 4
  %2010 = shl i32 %2009, 15
  %2011 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 10
  %2012 = load i32, ptr %2011, align 4
  %2013 = lshr i32 %2012, 17
  %2014 = or i32 %2010, %2013
  %2015 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 10
  %2016 = load i32, ptr %2015, align 4
  %2017 = shl i32 %2016, 13
  %2018 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 10
  %2019 = load i32, ptr %2018, align 4
  %2020 = lshr i32 %2019, 19
  %2021 = or i32 %2017, %2020
  %2022 = xor i32 %2014, %2021
  %2023 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 10
  %2024 = load i32, ptr %2023, align 4
  %2025 = lshr i32 %2024, 10
  %2026 = xor i32 %2022, %2025
  %2027 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 5
  %2028 = load i32, ptr %2027, align 4
  %2029 = add i32 %2026, %2028
  %2030 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 13
  %2031 = load i32, ptr %2030, align 4
  %2032 = shl i32 %2031, 25
  %2033 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 13
  %2034 = load i32, ptr %2033, align 4
  %2035 = lshr i32 %2034, 7
  %2036 = or i32 %2032, %2035
  %2037 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 13
  %2038 = load i32, ptr %2037, align 4
  %2039 = shl i32 %2038, 14
  %2040 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 13
  %2041 = load i32, ptr %2040, align 4
  %2042 = lshr i32 %2041, 18
  %2043 = or i32 %2039, %2042
  %2044 = xor i32 %2036, %2043
  %2045 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 13
  %2046 = load i32, ptr %2045, align 4
  %2047 = lshr i32 %2046, 3
  %2048 = xor i32 %2044, %2047
  %2049 = add i32 %2029, %2048
  %2050 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 12
  %2051 = load i32, ptr %2050, align 4
  %2052 = add i32 %2051, %2049
  store i32 %2052, ptr %2050, align 4
  %2053 = add i32 %2007, %2052
  %2054 = load i32, ptr %11, align 4
  %2055 = add i32 %2054, %2053
  store i32 %2055, ptr %11, align 4
  %2056 = load i32, ptr %11, align 4
  %2057 = load i32, ptr %15, align 4
  %2058 = add i32 %2057, %2056
  store i32 %2058, ptr %15, align 4
  %2059 = load i32, ptr %12, align 4
  %2060 = shl i32 %2059, 30
  %2061 = load i32, ptr %12, align 4
  %2062 = lshr i32 %2061, 2
  %2063 = or i32 %2060, %2062
  %2064 = load i32, ptr %12, align 4
  %2065 = shl i32 %2064, 19
  %2066 = load i32, ptr %12, align 4
  %2067 = lshr i32 %2066, 13
  %2068 = or i32 %2065, %2067
  %2069 = xor i32 %2063, %2068
  %2070 = load i32, ptr %12, align 4
  %2071 = shl i32 %2070, 10
  %2072 = load i32, ptr %12, align 4
  %2073 = lshr i32 %2072, 22
  %2074 = or i32 %2071, %2073
  %2075 = xor i32 %2069, %2074
  %2076 = load i32, ptr %12, align 4
  %2077 = load i32, ptr %13, align 4
  %2078 = and i32 %2076, %2077
  %2079 = load i32, ptr %14, align 4
  %2080 = load i32, ptr %12, align 4
  %2081 = load i32, ptr %13, align 4
  %2082 = xor i32 %2080, %2081
  %2083 = and i32 %2079, %2082
  %2084 = xor i32 %2078, %2083
  %2085 = add i32 %2075, %2084
  %2086 = load i32, ptr %11, align 4
  %2087 = add i32 %2086, %2085
  store i32 %2087, ptr %11, align 4
  br label %2088

2088:                                             ; preds = %1978
  br label %2089

2089:                                             ; preds = %2088
  %2090 = load i32, ptr %15, align 4
  %2091 = shl i32 %2090, 26
  %2092 = load i32, ptr %15, align 4
  %2093 = lshr i32 %2092, 6
  %2094 = or i32 %2091, %2093
  %2095 = load i32, ptr %15, align 4
  %2096 = shl i32 %2095, 21
  %2097 = load i32, ptr %15, align 4
  %2098 = lshr i32 %2097, 11
  %2099 = or i32 %2096, %2098
  %2100 = xor i32 %2094, %2099
  %2101 = load i32, ptr %15, align 4
  %2102 = shl i32 %2101, 7
  %2103 = load i32, ptr %15, align 4
  %2104 = lshr i32 %2103, 25
  %2105 = or i32 %2102, %2104
  %2106 = xor i32 %2100, %2105
  %2107 = load i32, ptr %9, align 4
  %2108 = load i32, ptr %15, align 4
  %2109 = load i32, ptr %8, align 4
  %2110 = load i32, ptr %9, align 4
  %2111 = xor i32 %2109, %2110
  %2112 = and i32 %2108, %2111
  %2113 = xor i32 %2107, %2112
  %2114 = add i32 %2106, %2113
  %2115 = load ptr, ptr %6, align 8
  %2116 = getelementptr inbounds i32, ptr %2115, i64 13
  %2117 = load i32, ptr %2116, align 4
  %2118 = add i32 %2114, %2117
  %2119 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 11
  %2120 = load i32, ptr %2119, align 4
  %2121 = shl i32 %2120, 15
  %2122 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 11
  %2123 = load i32, ptr %2122, align 4
  %2124 = lshr i32 %2123, 17
  %2125 = or i32 %2121, %2124
  %2126 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 11
  %2127 = load i32, ptr %2126, align 4
  %2128 = shl i32 %2127, 13
  %2129 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 11
  %2130 = load i32, ptr %2129, align 4
  %2131 = lshr i32 %2130, 19
  %2132 = or i32 %2128, %2131
  %2133 = xor i32 %2125, %2132
  %2134 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 11
  %2135 = load i32, ptr %2134, align 4
  %2136 = lshr i32 %2135, 10
  %2137 = xor i32 %2133, %2136
  %2138 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 6
  %2139 = load i32, ptr %2138, align 4
  %2140 = add i32 %2137, %2139
  %2141 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 14
  %2142 = load i32, ptr %2141, align 4
  %2143 = shl i32 %2142, 25
  %2144 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 14
  %2145 = load i32, ptr %2144, align 4
  %2146 = lshr i32 %2145, 7
  %2147 = or i32 %2143, %2146
  %2148 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 14
  %2149 = load i32, ptr %2148, align 4
  %2150 = shl i32 %2149, 14
  %2151 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 14
  %2152 = load i32, ptr %2151, align 4
  %2153 = lshr i32 %2152, 18
  %2154 = or i32 %2150, %2153
  %2155 = xor i32 %2147, %2154
  %2156 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 14
  %2157 = load i32, ptr %2156, align 4
  %2158 = lshr i32 %2157, 3
  %2159 = xor i32 %2155, %2158
  %2160 = add i32 %2140, %2159
  %2161 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 13
  %2162 = load i32, ptr %2161, align 4
  %2163 = add i32 %2162, %2160
  store i32 %2163, ptr %2161, align 4
  %2164 = add i32 %2118, %2163
  %2165 = load i32, ptr %10, align 4
  %2166 = add i32 %2165, %2164
  store i32 %2166, ptr %10, align 4
  %2167 = load i32, ptr %10, align 4
  %2168 = load i32, ptr %14, align 4
  %2169 = add i32 %2168, %2167
  store i32 %2169, ptr %14, align 4
  %2170 = load i32, ptr %11, align 4
  %2171 = shl i32 %2170, 30
  %2172 = load i32, ptr %11, align 4
  %2173 = lshr i32 %2172, 2
  %2174 = or i32 %2171, %2173
  %2175 = load i32, ptr %11, align 4
  %2176 = shl i32 %2175, 19
  %2177 = load i32, ptr %11, align 4
  %2178 = lshr i32 %2177, 13
  %2179 = or i32 %2176, %2178
  %2180 = xor i32 %2174, %2179
  %2181 = load i32, ptr %11, align 4
  %2182 = shl i32 %2181, 10
  %2183 = load i32, ptr %11, align 4
  %2184 = lshr i32 %2183, 22
  %2185 = or i32 %2182, %2184
  %2186 = xor i32 %2180, %2185
  %2187 = load i32, ptr %11, align 4
  %2188 = load i32, ptr %12, align 4
  %2189 = and i32 %2187, %2188
  %2190 = load i32, ptr %13, align 4
  %2191 = load i32, ptr %11, align 4
  %2192 = load i32, ptr %12, align 4
  %2193 = xor i32 %2191, %2192
  %2194 = and i32 %2190, %2193
  %2195 = xor i32 %2189, %2194
  %2196 = add i32 %2186, %2195
  %2197 = load i32, ptr %10, align 4
  %2198 = add i32 %2197, %2196
  store i32 %2198, ptr %10, align 4
  br label %2199

2199:                                             ; preds = %2089
  br label %2200

2200:                                             ; preds = %2199
  %2201 = load i32, ptr %14, align 4
  %2202 = shl i32 %2201, 26
  %2203 = load i32, ptr %14, align 4
  %2204 = lshr i32 %2203, 6
  %2205 = or i32 %2202, %2204
  %2206 = load i32, ptr %14, align 4
  %2207 = shl i32 %2206, 21
  %2208 = load i32, ptr %14, align 4
  %2209 = lshr i32 %2208, 11
  %2210 = or i32 %2207, %2209
  %2211 = xor i32 %2205, %2210
  %2212 = load i32, ptr %14, align 4
  %2213 = shl i32 %2212, 7
  %2214 = load i32, ptr %14, align 4
  %2215 = lshr i32 %2214, 25
  %2216 = or i32 %2213, %2215
  %2217 = xor i32 %2211, %2216
  %2218 = load i32, ptr %8, align 4
  %2219 = load i32, ptr %14, align 4
  %2220 = load i32, ptr %15, align 4
  %2221 = load i32, ptr %8, align 4
  %2222 = xor i32 %2220, %2221
  %2223 = and i32 %2219, %2222
  %2224 = xor i32 %2218, %2223
  %2225 = add i32 %2217, %2224
  %2226 = load ptr, ptr %6, align 8
  %2227 = getelementptr inbounds i32, ptr %2226, i64 14
  %2228 = load i32, ptr %2227, align 4
  %2229 = add i32 %2225, %2228
  %2230 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 12
  %2231 = load i32, ptr %2230, align 4
  %2232 = shl i32 %2231, 15
  %2233 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 12
  %2234 = load i32, ptr %2233, align 4
  %2235 = lshr i32 %2234, 17
  %2236 = or i32 %2232, %2235
  %2237 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 12
  %2238 = load i32, ptr %2237, align 4
  %2239 = shl i32 %2238, 13
  %2240 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 12
  %2241 = load i32, ptr %2240, align 4
  %2242 = lshr i32 %2241, 19
  %2243 = or i32 %2239, %2242
  %2244 = xor i32 %2236, %2243
  %2245 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 12
  %2246 = load i32, ptr %2245, align 4
  %2247 = lshr i32 %2246, 10
  %2248 = xor i32 %2244, %2247
  %2249 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 7
  %2250 = load i32, ptr %2249, align 4
  %2251 = add i32 %2248, %2250
  %2252 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 15
  %2253 = load i32, ptr %2252, align 4
  %2254 = shl i32 %2253, 25
  %2255 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 15
  %2256 = load i32, ptr %2255, align 4
  %2257 = lshr i32 %2256, 7
  %2258 = or i32 %2254, %2257
  %2259 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 15
  %2260 = load i32, ptr %2259, align 4
  %2261 = shl i32 %2260, 14
  %2262 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 15
  %2263 = load i32, ptr %2262, align 4
  %2264 = lshr i32 %2263, 18
  %2265 = or i32 %2261, %2264
  %2266 = xor i32 %2258, %2265
  %2267 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 15
  %2268 = load i32, ptr %2267, align 4
  %2269 = lshr i32 %2268, 3
  %2270 = xor i32 %2266, %2269
  %2271 = add i32 %2251, %2270
  %2272 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 14
  %2273 = load i32, ptr %2272, align 4
  %2274 = add i32 %2273, %2271
  store i32 %2274, ptr %2272, align 4
  %2275 = add i32 %2229, %2274
  %2276 = load i32, ptr %9, align 4
  %2277 = add i32 %2276, %2275
  store i32 %2277, ptr %9, align 4
  %2278 = load i32, ptr %9, align 4
  %2279 = load i32, ptr %13, align 4
  %2280 = add i32 %2279, %2278
  store i32 %2280, ptr %13, align 4
  %2281 = load i32, ptr %10, align 4
  %2282 = shl i32 %2281, 30
  %2283 = load i32, ptr %10, align 4
  %2284 = lshr i32 %2283, 2
  %2285 = or i32 %2282, %2284
  %2286 = load i32, ptr %10, align 4
  %2287 = shl i32 %2286, 19
  %2288 = load i32, ptr %10, align 4
  %2289 = lshr i32 %2288, 13
  %2290 = or i32 %2287, %2289
  %2291 = xor i32 %2285, %2290
  %2292 = load i32, ptr %10, align 4
  %2293 = shl i32 %2292, 10
  %2294 = load i32, ptr %10, align 4
  %2295 = lshr i32 %2294, 22
  %2296 = or i32 %2293, %2295
  %2297 = xor i32 %2291, %2296
  %2298 = load i32, ptr %10, align 4
  %2299 = load i32, ptr %11, align 4
  %2300 = and i32 %2298, %2299
  %2301 = load i32, ptr %12, align 4
  %2302 = load i32, ptr %10, align 4
  %2303 = load i32, ptr %11, align 4
  %2304 = xor i32 %2302, %2303
  %2305 = and i32 %2301, %2304
  %2306 = xor i32 %2300, %2305
  %2307 = add i32 %2297, %2306
  %2308 = load i32, ptr %9, align 4
  %2309 = add i32 %2308, %2307
  store i32 %2309, ptr %9, align 4
  br label %2310

2310:                                             ; preds = %2200
  br label %2311

2311:                                             ; preds = %2310
  %2312 = load i32, ptr %13, align 4
  %2313 = shl i32 %2312, 26
  %2314 = load i32, ptr %13, align 4
  %2315 = lshr i32 %2314, 6
  %2316 = or i32 %2313, %2315
  %2317 = load i32, ptr %13, align 4
  %2318 = shl i32 %2317, 21
  %2319 = load i32, ptr %13, align 4
  %2320 = lshr i32 %2319, 11
  %2321 = or i32 %2318, %2320
  %2322 = xor i32 %2316, %2321
  %2323 = load i32, ptr %13, align 4
  %2324 = shl i32 %2323, 7
  %2325 = load i32, ptr %13, align 4
  %2326 = lshr i32 %2325, 25
  %2327 = or i32 %2324, %2326
  %2328 = xor i32 %2322, %2327
  %2329 = load i32, ptr %15, align 4
  %2330 = load i32, ptr %13, align 4
  %2331 = load i32, ptr %14, align 4
  %2332 = load i32, ptr %15, align 4
  %2333 = xor i32 %2331, %2332
  %2334 = and i32 %2330, %2333
  %2335 = xor i32 %2329, %2334
  %2336 = add i32 %2328, %2335
  %2337 = load ptr, ptr %6, align 8
  %2338 = getelementptr inbounds i32, ptr %2337, i64 15
  %2339 = load i32, ptr %2338, align 4
  %2340 = add i32 %2336, %2339
  %2341 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 13
  %2342 = load i32, ptr %2341, align 4
  %2343 = shl i32 %2342, 15
  %2344 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 13
  %2345 = load i32, ptr %2344, align 4
  %2346 = lshr i32 %2345, 17
  %2347 = or i32 %2343, %2346
  %2348 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 13
  %2349 = load i32, ptr %2348, align 4
  %2350 = shl i32 %2349, 13
  %2351 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 13
  %2352 = load i32, ptr %2351, align 4
  %2353 = lshr i32 %2352, 19
  %2354 = or i32 %2350, %2353
  %2355 = xor i32 %2347, %2354
  %2356 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 13
  %2357 = load i32, ptr %2356, align 4
  %2358 = lshr i32 %2357, 10
  %2359 = xor i32 %2355, %2358
  %2360 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 8
  %2361 = load i32, ptr %2360, align 4
  %2362 = add i32 %2359, %2361
  %2363 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 0
  %2364 = load i32, ptr %2363, align 4
  %2365 = shl i32 %2364, 25
  %2366 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 0
  %2367 = load i32, ptr %2366, align 4
  %2368 = lshr i32 %2367, 7
  %2369 = or i32 %2365, %2368
  %2370 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 0
  %2371 = load i32, ptr %2370, align 4
  %2372 = shl i32 %2371, 14
  %2373 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 0
  %2374 = load i32, ptr %2373, align 4
  %2375 = lshr i32 %2374, 18
  %2376 = or i32 %2372, %2375
  %2377 = xor i32 %2369, %2376
  %2378 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 0
  %2379 = load i32, ptr %2378, align 4
  %2380 = lshr i32 %2379, 3
  %2381 = xor i32 %2377, %2380
  %2382 = add i32 %2362, %2381
  %2383 = getelementptr inbounds [16 x i32], ptr %7, i64 0, i64 15
  %2384 = load i32, ptr %2383, align 4
  %2385 = add i32 %2384, %2382
  store i32 %2385, ptr %2383, align 4
  %2386 = add i32 %2340, %2385
  %2387 = load i32, ptr %8, align 4
  %2388 = add i32 %2387, %2386
  store i32 %2388, ptr %8, align 4
  %2389 = load i32, ptr %8, align 4
  %2390 = load i32, ptr %12, align 4
  %2391 = add i32 %2390, %2389
  store i32 %2391, ptr %12, align 4
  %2392 = load i32, ptr %9, align 4
  %2393 = shl i32 %2392, 30
  %2394 = load i32, ptr %9, align 4
  %2395 = lshr i32 %2394, 2
  %2396 = or i32 %2393, %2395
  %2397 = load i32, ptr %9, align 4
  %2398 = shl i32 %2397, 19
  %2399 = load i32, ptr %9, align 4
  %2400 = lshr i32 %2399, 13
  %2401 = or i32 %2398, %2400
  %2402 = xor i32 %2396, %2401
  %2403 = load i32, ptr %9, align 4
  %2404 = shl i32 %2403, 10
  %2405 = load i32, ptr %9, align 4
  %2406 = lshr i32 %2405, 22
  %2407 = or i32 %2404, %2406
  %2408 = xor i32 %2402, %2407
  %2409 = load i32, ptr %9, align 4
  %2410 = load i32, ptr %10, align 4
  %2411 = and i32 %2409, %2410
  %2412 = load i32, ptr %11, align 4
  %2413 = load i32, ptr %9, align 4
  %2414 = load i32, ptr %10, align 4
  %2415 = xor i32 %2413, %2414
  %2416 = and i32 %2412, %2415
  %2417 = xor i32 %2411, %2416
  %2418 = add i32 %2408, %2417
  %2419 = load i32, ptr %8, align 4
  %2420 = add i32 %2419, %2418
  store i32 %2420, ptr %8, align 4
  br label %2421

2421:                                             ; preds = %2311
  br label %2422

2422:                                             ; preds = %2421
  %2423 = load i32, ptr %16, align 4
  %2424 = add i32 %2423, 16
  store i32 %2424, ptr %16, align 4
  %2425 = load ptr, ptr %6, align 8
  %2426 = getelementptr inbounds i32, ptr %2425, i64 16
  store ptr %2426, ptr %6, align 8
  br label %642, !llvm.loop !10

2427:                                             ; preds = %642
  %2428 = load i32, ptr %8, align 4
  %2429 = load ptr, ptr %4, align 8
  %2430 = getelementptr inbounds i32, ptr %2429, i64 0
  %2431 = load i32, ptr %2430, align 4
  %2432 = add i32 %2431, %2428
  store i32 %2432, ptr %2430, align 4
  %2433 = load i32, ptr %9, align 4
  %2434 = load ptr, ptr %4, align 8
  %2435 = getelementptr inbounds i32, ptr %2434, i64 1
  %2436 = load i32, ptr %2435, align 4
  %2437 = add i32 %2436, %2433
  store i32 %2437, ptr %2435, align 4
  %2438 = load i32, ptr %10, align 4
  %2439 = load ptr, ptr %4, align 8
  %2440 = getelementptr inbounds i32, ptr %2439, i64 2
  %2441 = load i32, ptr %2440, align 4
  %2442 = add i32 %2441, %2438
  store i32 %2442, ptr %2440, align 4
  %2443 = load i32, ptr %11, align 4
  %2444 = load ptr, ptr %4, align 8
  %2445 = getelementptr inbounds i32, ptr %2444, i64 3
  %2446 = load i32, ptr %2445, align 4
  %2447 = add i32 %2446, %2443
  store i32 %2447, ptr %2445, align 4
  %2448 = load i32, ptr %12, align 4
  %2449 = load ptr, ptr %4, align 8
  %2450 = getelementptr inbounds i32, ptr %2449, i64 4
  %2451 = load i32, ptr %2450, align 4
  %2452 = add i32 %2451, %2448
  store i32 %2452, ptr %2450, align 4
  %2453 = load i32, ptr %13, align 4
  %2454 = load ptr, ptr %4, align 8
  %2455 = getelementptr inbounds i32, ptr %2454, i64 5
  %2456 = load i32, ptr %2455, align 4
  %2457 = add i32 %2456, %2453
  store i32 %2457, ptr %2455, align 4
  %2458 = load i32, ptr %14, align 4
  %2459 = load ptr, ptr %4, align 8
  %2460 = getelementptr inbounds i32, ptr %2459, i64 6
  %2461 = load i32, ptr %2460, align 4
  %2462 = add i32 %2461, %2458
  store i32 %2462, ptr %2460, align 4
  %2463 = load i32, ptr %15, align 4
  %2464 = load ptr, ptr %4, align 8
  %2465 = getelementptr inbounds i32, ptr %2464, i64 7
  %2466 = load i32, ptr %2465, align 4
  %2467 = add i32 %2466, %2463
  store i32 %2467, ptr %2465, align 4
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sha256_init(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.sha256_ctx, ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds [8 x i32], ptr %4, i64 0, i64 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 4 @sha256_init.H0, i64 32, i1 false)
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.sha256_ctx, ptr %6, i32 0, i32 1
  store i64 0, ptr %7, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.sha256_ctx, ptr %8, i32 0, i32 3
  store i32 0, ptr %9, align 8
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sha256_update(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  br label %8

8:                                                ; preds = %3
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %struct.sha256_ctx, ptr %9, i32 0, i32 3
  %11 = load i32, ptr %10, align 8
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %73

13:                                               ; preds = %8
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.sha256_ctx, ptr %14, i32 0, i32 3
  %16 = load i32, ptr %15, align 8
  %17 = zext i32 %16 to i64
  %18 = sub i64 64, %17
  %19 = trunc i64 %18 to i32
  store i32 %19, ptr %7, align 4
  %20 = load i64, ptr %5, align 8
  %21 = load i32, ptr %7, align 4
  %22 = zext i32 %21 to i64
  %23 = icmp ult i64 %20, %22
  br i1 %23, label %24, label %42

24:                                               ; preds = %13
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds %struct.sha256_ctx, ptr %25, i32 0, i32 2
  %27 = getelementptr inbounds [64 x i8], ptr %26, i64 0, i64 0
  %28 = load ptr, ptr %4, align 8
  %29 = getelementptr inbounds %struct.sha256_ctx, ptr %28, i32 0, i32 3
  %30 = load i32, ptr %29, align 8
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i8, ptr %27, i64 %31
  %33 = load ptr, ptr %6, align 8
  %34 = load i64, ptr %5, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %32, ptr align 1 %33, i64 %34, i1 false)
  %35 = load i64, ptr %5, align 8
  %36 = load ptr, ptr %4, align 8
  %37 = getelementptr inbounds %struct.sha256_ctx, ptr %36, i32 0, i32 3
  %38 = load i32, ptr %37, align 8
  %39 = zext i32 %38 to i64
  %40 = add i64 %39, %35
  %41 = trunc i64 %40 to i32
  store i32 %41, ptr %37, align 8
  br label %100

42:                                               ; preds = %13
  %43 = load ptr, ptr %4, align 8
  %44 = getelementptr inbounds %struct.sha256_ctx, ptr %43, i32 0, i32 2
  %45 = getelementptr inbounds [64 x i8], ptr %44, i64 0, i64 0
  %46 = load ptr, ptr %4, align 8
  %47 = getelementptr inbounds %struct.sha256_ctx, ptr %46, i32 0, i32 3
  %48 = load i32, ptr %47, align 8
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i8, ptr %45, i64 %49
  %51 = load ptr, ptr %6, align 8
  %52 = load i32, ptr %7, align 4
  %53 = zext i32 %52 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %50, ptr align 1 %51, i64 %53, i1 false)
  %54 = load ptr, ptr %4, align 8
  %55 = getelementptr inbounds %struct.sha256_ctx, ptr %54, i32 0, i32 0
  %56 = getelementptr inbounds [8 x i32], ptr %55, i64 0, i64 0
  %57 = load ptr, ptr %4, align 8
  %58 = getelementptr inbounds %struct.sha256_ctx, ptr %57, i32 0, i32 2
  %59 = getelementptr inbounds [64 x i8], ptr %58, i64 0, i64 0
  call void @_nettle_sha256_compress(ptr noundef %56, ptr noundef %59, ptr noundef @K)
  %60 = load ptr, ptr %4, align 8
  %61 = getelementptr inbounds %struct.sha256_ctx, ptr %60, i32 0, i32 1
  %62 = load i64, ptr %61, align 8
  %63 = add i64 %62, 1
  store i64 %63, ptr %61, align 8
  %64 = load i32, ptr %7, align 4
  %65 = load ptr, ptr %6, align 8
  %66 = zext i32 %64 to i64
  %67 = getelementptr inbounds i8, ptr %65, i64 %66
  store ptr %67, ptr %6, align 8
  %68 = load i32, ptr %7, align 4
  %69 = zext i32 %68 to i64
  %70 = load i64, ptr %5, align 8
  %71 = sub i64 %70, %69
  store i64 %71, ptr %5, align 8
  br label %72

72:                                               ; preds = %42
  br label %73

73:                                               ; preds = %72, %8
  br label %74

74:                                               ; preds = %77, %73
  %75 = load i64, ptr %5, align 8
  %76 = icmp uge i64 %75, 64
  br i1 %76, label %77, label %90

77:                                               ; preds = %74
  %78 = load ptr, ptr %4, align 8
  %79 = getelementptr inbounds %struct.sha256_ctx, ptr %78, i32 0, i32 0
  %80 = getelementptr inbounds [8 x i32], ptr %79, i64 0, i64 0
  %81 = load ptr, ptr %6, align 8
  call void @_nettle_sha256_compress(ptr noundef %80, ptr noundef %81, ptr noundef @K)
  %82 = load ptr, ptr %4, align 8
  %83 = getelementptr inbounds %struct.sha256_ctx, ptr %82, i32 0, i32 1
  %84 = load i64, ptr %83, align 8
  %85 = add i64 %84, 1
  store i64 %85, ptr %83, align 8
  %86 = load ptr, ptr %6, align 8
  %87 = getelementptr inbounds i8, ptr %86, i64 64
  store ptr %87, ptr %6, align 8
  %88 = load i64, ptr %5, align 8
  %89 = sub i64 %88, 64
  store i64 %89, ptr %5, align 8
  br label %74, !llvm.loop !11

90:                                               ; preds = %74
  %91 = load ptr, ptr %4, align 8
  %92 = getelementptr inbounds %struct.sha256_ctx, ptr %91, i32 0, i32 2
  %93 = getelementptr inbounds [64 x i8], ptr %92, i64 0, i64 0
  %94 = load ptr, ptr %6, align 8
  %95 = load i64, ptr %5, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %93, ptr align 1 %94, i64 %95, i1 false)
  %96 = load i64, ptr %5, align 8
  %97 = trunc i64 %96 to i32
  %98 = load ptr, ptr %4, align 8
  %99 = getelementptr inbounds %struct.sha256_ctx, ptr %98, i32 0, i32 3
  store i32 %97, ptr %99, align 8
  br label %100

100:                                              ; preds = %90, %24
  br label %101

101:                                              ; preds = %100
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local void @sha256_digest(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  call void @sha256_write_digest(ptr noundef %7, i64 noundef %8, ptr noundef %9)
  %10 = load ptr, ptr %4, align 8
  call void @sha256_init(ptr noundef %10)
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define internal void @sha256_write_digest(ptr noundef %0, i64 noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %9 = load i64, ptr %5, align 8
  %10 = icmp ule i64 %9, 32
  br i1 %10, label %12, label %11

11:                                               ; preds = %3
  call void @exit(i32 noundef 1) #5
  unreachable

12:                                               ; preds = %3
  br label %13

13:                                               ; preds = %12
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.sha256_ctx, ptr %14, i32 0, i32 3
  %16 = load i32, ptr %15, align 8
  store i32 %16, ptr %8, align 4
  %17 = load i32, ptr %8, align 4
  %18 = zext i32 %17 to i64
  %19 = icmp ult i64 %18, 64
  br i1 %19, label %21, label %20

20:                                               ; preds = %13
  call void @exit(i32 noundef 1) #5
  unreachable

21:                                               ; preds = %13
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds %struct.sha256_ctx, ptr %22, i32 0, i32 2
  %24 = load i32, ptr %8, align 4
  %25 = add i32 %24, 1
  store i32 %25, ptr %8, align 4
  %26 = zext i32 %24 to i64
  %27 = getelementptr inbounds [64 x i8], ptr %23, i64 0, i64 %26
  store i8 -128, ptr %27, align 1
  %28 = load i32, ptr %8, align 4
  %29 = zext i32 %28 to i64
  %30 = icmp ugt i64 %29, 56
  br i1 %30, label %31, label %47

31:                                               ; preds = %21
  %32 = load ptr, ptr %4, align 8
  %33 = getelementptr inbounds %struct.sha256_ctx, ptr %32, i32 0, i32 2
  %34 = getelementptr inbounds [64 x i8], ptr %33, i64 0, i64 0
  %35 = load i32, ptr %8, align 4
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i8, ptr %34, i64 %36
  %38 = load i32, ptr %8, align 4
  %39 = zext i32 %38 to i64
  %40 = sub i64 64, %39
  call void @llvm.memset.p0.i64(ptr align 1 %37, i8 0, i64 %40, i1 false)
  %41 = load ptr, ptr %4, align 8
  %42 = getelementptr inbounds %struct.sha256_ctx, ptr %41, i32 0, i32 0
  %43 = getelementptr inbounds [8 x i32], ptr %42, i64 0, i64 0
  %44 = load ptr, ptr %4, align 8
  %45 = getelementptr inbounds %struct.sha256_ctx, ptr %44, i32 0, i32 2
  %46 = getelementptr inbounds [64 x i8], ptr %45, i64 0, i64 0
  call void @_nettle_sha256_compress(ptr noundef %43, ptr noundef %46, ptr noundef @K)
  store i32 0, ptr %8, align 4
  br label %47

47:                                               ; preds = %31, %21
  %48 = load ptr, ptr %4, align 8
  %49 = getelementptr inbounds %struct.sha256_ctx, ptr %48, i32 0, i32 2
  %50 = getelementptr inbounds [64 x i8], ptr %49, i64 0, i64 0
  %51 = load i32, ptr %8, align 4
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds i8, ptr %50, i64 %52
  %54 = load i32, ptr %8, align 4
  %55 = zext i32 %54 to i64
  %56 = sub i64 56, %55
  call void @llvm.memset.p0.i64(ptr align 1 %53, i8 0, i64 %56, i1 false)
  br label %57

57:                                               ; preds = %47
  %58 = load ptr, ptr %4, align 8
  %59 = getelementptr inbounds %struct.sha256_ctx, ptr %58, i32 0, i32 1
  %60 = load i64, ptr %59, align 8
  %61 = shl i64 %60, 9
  %62 = load ptr, ptr %4, align 8
  %63 = getelementptr inbounds %struct.sha256_ctx, ptr %62, i32 0, i32 3
  %64 = load i32, ptr %63, align 8
  %65 = shl i32 %64, 3
  %66 = zext i32 %65 to i64
  %67 = or i64 %61, %66
  store i64 %67, ptr %7, align 8
  br label %68

68:                                               ; preds = %57
  %69 = load i64, ptr %7, align 8
  %70 = lshr i64 %69, 56
  %71 = and i64 %70, 255
  %72 = trunc i64 %71 to i8
  %73 = load ptr, ptr %4, align 8
  %74 = getelementptr inbounds %struct.sha256_ctx, ptr %73, i32 0, i32 2
  %75 = getelementptr inbounds [64 x i8], ptr %74, i64 0, i64 0
  %76 = getelementptr inbounds i8, ptr %75, i64 56
  %77 = getelementptr inbounds i8, ptr %76, i64 0
  store i8 %72, ptr %77, align 1
  %78 = load i64, ptr %7, align 8
  %79 = lshr i64 %78, 48
  %80 = and i64 %79, 255
  %81 = trunc i64 %80 to i8
  %82 = load ptr, ptr %4, align 8
  %83 = getelementptr inbounds %struct.sha256_ctx, ptr %82, i32 0, i32 2
  %84 = getelementptr inbounds [64 x i8], ptr %83, i64 0, i64 0
  %85 = getelementptr inbounds i8, ptr %84, i64 56
  %86 = getelementptr inbounds i8, ptr %85, i64 1
  store i8 %81, ptr %86, align 1
  %87 = load i64, ptr %7, align 8
  %88 = lshr i64 %87, 40
  %89 = and i64 %88, 255
  %90 = trunc i64 %89 to i8
  %91 = load ptr, ptr %4, align 8
  %92 = getelementptr inbounds %struct.sha256_ctx, ptr %91, i32 0, i32 2
  %93 = getelementptr inbounds [64 x i8], ptr %92, i64 0, i64 0
  %94 = getelementptr inbounds i8, ptr %93, i64 56
  %95 = getelementptr inbounds i8, ptr %94, i64 2
  store i8 %90, ptr %95, align 1
  %96 = load i64, ptr %7, align 8
  %97 = lshr i64 %96, 32
  %98 = and i64 %97, 255
  %99 = trunc i64 %98 to i8
  %100 = load ptr, ptr %4, align 8
  %101 = getelementptr inbounds %struct.sha256_ctx, ptr %100, i32 0, i32 2
  %102 = getelementptr inbounds [64 x i8], ptr %101, i64 0, i64 0
  %103 = getelementptr inbounds i8, ptr %102, i64 56
  %104 = getelementptr inbounds i8, ptr %103, i64 3
  store i8 %99, ptr %104, align 1
  %105 = load i64, ptr %7, align 8
  %106 = lshr i64 %105, 24
  %107 = and i64 %106, 255
  %108 = trunc i64 %107 to i8
  %109 = load ptr, ptr %4, align 8
  %110 = getelementptr inbounds %struct.sha256_ctx, ptr %109, i32 0, i32 2
  %111 = getelementptr inbounds [64 x i8], ptr %110, i64 0, i64 0
  %112 = getelementptr inbounds i8, ptr %111, i64 56
  %113 = getelementptr inbounds i8, ptr %112, i64 4
  store i8 %108, ptr %113, align 1
  %114 = load i64, ptr %7, align 8
  %115 = lshr i64 %114, 16
  %116 = and i64 %115, 255
  %117 = trunc i64 %116 to i8
  %118 = load ptr, ptr %4, align 8
  %119 = getelementptr inbounds %struct.sha256_ctx, ptr %118, i32 0, i32 2
  %120 = getelementptr inbounds [64 x i8], ptr %119, i64 0, i64 0
  %121 = getelementptr inbounds i8, ptr %120, i64 56
  %122 = getelementptr inbounds i8, ptr %121, i64 5
  store i8 %117, ptr %122, align 1
  %123 = load i64, ptr %7, align 8
  %124 = lshr i64 %123, 8
  %125 = and i64 %124, 255
  %126 = trunc i64 %125 to i8
  %127 = load ptr, ptr %4, align 8
  %128 = getelementptr inbounds %struct.sha256_ctx, ptr %127, i32 0, i32 2
  %129 = getelementptr inbounds [64 x i8], ptr %128, i64 0, i64 0
  %130 = getelementptr inbounds i8, ptr %129, i64 56
  %131 = getelementptr inbounds i8, ptr %130, i64 6
  store i8 %126, ptr %131, align 1
  %132 = load i64, ptr %7, align 8
  %133 = and i64 %132, 255
  %134 = trunc i64 %133 to i8
  %135 = load ptr, ptr %4, align 8
  %136 = getelementptr inbounds %struct.sha256_ctx, ptr %135, i32 0, i32 2
  %137 = getelementptr inbounds [64 x i8], ptr %136, i64 0, i64 0
  %138 = getelementptr inbounds i8, ptr %137, i64 56
  %139 = getelementptr inbounds i8, ptr %138, i64 7
  store i8 %134, ptr %139, align 1
  br label %140

140:                                              ; preds = %68
  %141 = load ptr, ptr %4, align 8
  %142 = getelementptr inbounds %struct.sha256_ctx, ptr %141, i32 0, i32 0
  %143 = getelementptr inbounds [8 x i32], ptr %142, i64 0, i64 0
  %144 = load ptr, ptr %4, align 8
  %145 = getelementptr inbounds %struct.sha256_ctx, ptr %144, i32 0, i32 2
  %146 = getelementptr inbounds [64 x i8], ptr %145, i64 0, i64 0
  call void @_nettle_sha256_compress(ptr noundef %143, ptr noundef %146, ptr noundef @K)
  %147 = load i64, ptr %5, align 8
  %148 = load ptr, ptr %6, align 8
  %149 = load ptr, ptr %4, align 8
  %150 = getelementptr inbounds %struct.sha256_ctx, ptr %149, i32 0, i32 0
  %151 = getelementptr inbounds [8 x i32], ptr %150, i64 0, i64 0
  call void @_nettle_write_be32(i64 noundef %147, ptr noundef %148, ptr noundef %151)
  ret void
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @verify_benchmark(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  %4 = alloca i64, align 8
  store i32 %0, ptr %2, align 4
  store i8 1, ptr %3, align 1
  store i64 0, ptr %4, align 8
  br label %5

5:                                                ; preds = %20, %1
  %6 = load i64, ptr %4, align 8
  %7 = icmp ult i64 %6, 8
  br i1 %7, label %8, label %23

8:                                                ; preds = %5
  %9 = load i64, ptr %4, align 8
  %10 = getelementptr inbounds [32 x i8], ptr @hash, i64 0, i64 %9
  %11 = load i8, ptr %10, align 1
  %12 = zext i8 %11 to i32
  %13 = load i64, ptr %4, align 8
  %14 = getelementptr inbounds [32 x i8], ptr @buffer, i64 0, i64 %13
  %15 = load i8, ptr %14, align 1
  %16 = zext i8 %15 to i32
  %17 = icmp ne i32 %12, %16
  br i1 %17, label %18, label %19

18:                                               ; preds = %8
  store i8 0, ptr %3, align 1
  br label %19

19:                                               ; preds = %18, %8
  br label %20

20:                                               ; preds = %19
  %21 = load i64, ptr %4, align 8
  %22 = add i64 %21, 1
  store i64 %22, ptr %4, align 8
  br label %5, !llvm.loop !12

23:                                               ; preds = %5
  %24 = load i8, ptr %3, align 1
  %25 = trunc i8 %24 to i1
  %26 = zext i1 %25 to i32
  ret i32 %26
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
  %4 = alloca %struct.sha256_ctx, align 8
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %13, %1
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %16

9:                                                ; preds = %5
  call void @llvm.memset.p0.i64(ptr align 1 @buffer, i8 0, i64 32, i1 false)
  %10 = load ptr, ptr getelementptr inbounds (%struct.nettle_hash, ptr @nettle_sha256, i32 0, i32 4), align 8
  call void %10(ptr noundef %4)
  %11 = load ptr, ptr getelementptr inbounds (%struct.nettle_hash, ptr @nettle_sha256, i32 0, i32 5), align 8
  call void %11(ptr noundef %4, i64 noundef 56, ptr noundef @msg)
  %12 = load ptr, ptr getelementptr inbounds (%struct.nettle_hash, ptr @nettle_sha256, i32 0, i32 6), align 8
  call void %12(ptr noundef %4, i64 noundef 32, ptr noundef @buffer)
  br label %13

13:                                               ; preds = %9
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %3, align 4
  br label %5, !llvm.loop !13

16:                                               ; preds = %5
  ret i32 0
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @benchmark() #0 {
  %1 = call i32 @benchmark_body(i32 noundef 475000)
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
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %11)
  ret i32 0
}

declare void @cflat_finalize_and_print() #3

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

attributes #0 = { noinline nounwind noinline uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #1 = { noreturn nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { noreturn nounwind }

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
