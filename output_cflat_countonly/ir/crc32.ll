; ModuleID = './output_cflat_countonly/ir/crc32.ll'
source_filename = "./embench-iot-benchmarks-backup-cflat/crc_32.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@seed = internal global i64 0, align 8
@heap_ptr = internal global ptr null, align 8
@heap_end = internal global ptr null, align 8
@heap_requested = internal global i64 0, align 8
@crc_32_tab = internal constant [256 x i64] [i64 0, i64 1996959894, i64 3993919788, i64 2567524794, i64 124634137, i64 1886057615, i64 3915621685, i64 2657392035, i64 249268274, i64 2044508324, i64 3772115230, i64 2547177864, i64 162941995, i64 2125561021, i64 3887607047, i64 2428444049, i64 498536548, i64 1789927666, i64 4089016648, i64 2227061214, i64 450548861, i64 1843258603, i64 4107580753, i64 2211677639, i64 325883990, i64 1684777152, i64 4251122042, i64 2321926636, i64 335633487, i64 1661365465, i64 4195302755, i64 2366115317, i64 997073096, i64 1281953886, i64 3579855332, i64 2724688242, i64 1006888145, i64 1258607687, i64 3524101629, i64 2768942443, i64 901097722, i64 1119000684, i64 3686517206, i64 2898065728, i64 853044451, i64 1172266101, i64 3705015759, i64 2882616665, i64 651767980, i64 1373503546, i64 3369554304, i64 3218104598, i64 565507253, i64 1454621731, i64 3485111705, i64 3099436303, i64 671266974, i64 1594198024, i64 3322730930, i64 2970347812, i64 795835527, i64 1483230225, i64 3244367275, i64 3060149565, i64 1994146192, i64 31158534, i64 2563907772, i64 4023717930, i64 1907459465, i64 112637215, i64 2680153253, i64 3904427059, i64 2013776290, i64 251722036, i64 2517215374, i64 3775830040, i64 2137656763, i64 141376813, i64 2439277719, i64 3865271297, i64 1802195444, i64 476864866, i64 2238001368, i64 4066508878, i64 1812370925, i64 453092731, i64 2181625025, i64 4111451223, i64 1706088902, i64 314042704, i64 2344532202, i64 4240017532, i64 1658658271, i64 366619977, i64 2362670323, i64 4224994405, i64 1303535960, i64 984961486, i64 2747007092, i64 3569037538, i64 1256170817, i64 1037604311, i64 2765210733, i64 3554079995, i64 1131014506, i64 879679996, i64 2909243462, i64 3663771856, i64 1141124467, i64 855842277, i64 2852801631, i64 3708648649, i64 1342533948, i64 654459306, i64 3188396048, i64 3373015174, i64 1466479909, i64 544179635, i64 3110523913, i64 3462522015, i64 1591671054, i64 702138776, i64 2966460450, i64 3352799412, i64 1504918807, i64 783551873, i64 3082640443, i64 3233442989, i64 3988292384, i64 2596254646, i64 62317068, i64 1957810842, i64 3939845945, i64 2647816111, i64 81470997, i64 1943803523, i64 3814918930, i64 2489596804, i64 225274430, i64 2053790376, i64 3826175755, i64 2466906013, i64 167816743, i64 2097651377, i64 4027552580, i64 2265490386, i64 503444072, i64 1762050814, i64 4150417245, i64 2154129355, i64 426522225, i64 1852507879, i64 4275313526, i64 2312317920, i64 282753626, i64 1742555852, i64 4189708143, i64 2394877945, i64 397917763, i64 1622183637, i64 3604390888, i64 2714866558, i64 953729732, i64 1340076626, i64 3518719985, i64 2797360999, i64 1068828381, i64 1219638859, i64 3624741850, i64 2936675148, i64 906185462, i64 1090812512, i64 3747672003, i64 2825379669, i64 829329135, i64 1181335161, i64 3412177804, i64 3160834842, i64 628085408, i64 1382605366, i64 3423369109, i64 3138078467, i64 570562233, i64 1426400815, i64 3317316542, i64 2998733608, i64 733239954, i64 1555261956, i64 3268935591, i64 3050360625, i64 752459403, i64 1541320221, i64 2607071920, i64 3965973030, i64 1969922972, i64 40735498, i64 2617837225, i64 3943577151, i64 1913087877, i64 83908371, i64 2512341634, i64 3803740692, i64 2075208622, i64 213261112, i64 2463272603, i64 3855990285, i64 2094854071, i64 198958881, i64 2262029012, i64 4057260610, i64 1759359992, i64 534414190, i64 2176718541, i64 4139329115, i64 1873836001, i64 414664567, i64 2282248934, i64 4279200368, i64 1711684554, i64 285281116, i64 2405801727, i64 4167216745, i64 1634467795, i64 376229701, i64 2685067896, i64 3608007406, i64 1308918612, i64 956543938, i64 2808555105, i64 3495958263, i64 1231636301, i64 1047427035, i64 2932959818, i64 3654703836, i64 1088359270, i64 936918000, i64 2847714899, i64 3736837829, i64 1202900863, i64 817233897, i64 3183342108, i64 3401237130, i64 1404277552, i64 615818150, i64 3134207493, i64 3453421203, i64 1423857449, i64 601450431, i64 3009837614, i64 3294710456, i64 1567103746, i64 711928724, i64 3020668471, i64 3272380065, i64 1510334235, i64 755167117], align 8
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
define dso_local i64 @crc32pseudo() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  store i64 4294967295, ptr %2, align 8
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %18, %0
  %4 = load i32, ptr %1, align 4
  %5 = icmp slt i32 %4, 1024
  br i1 %5, label %6, label %21

6:                                                ; preds = %3
  %7 = load i64, ptr %2, align 8
  %8 = call i32 @rand_beebs()
  %9 = trunc i32 %8 to i8
  %10 = zext i8 %9 to i64
  %11 = xor i64 %7, %10
  %12 = and i64 %11, 255
  %13 = getelementptr inbounds [256 x i64], ptr @crc_32_tab, i64 0, i64 %12
  %14 = load i64, ptr %13, align 8
  %15 = load i64, ptr %2, align 8
  %16 = lshr i64 %15, 8
  %17 = xor i64 %14, %16
  store i64 %17, ptr %2, align 8
  br label %18

18:                                               ; preds = %6
  %19 = load i32, ptr %1, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %1, align 4
  br label %3, !llvm.loop !8

21:                                               ; preds = %3
  %22 = load i64, ptr %2, align 8
  %23 = xor i64 %22, -1
  ret i64 %23
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
  %4 = alloca i64, align 8
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %11, %1
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %14

9:                                                ; preds = %5
  call void @srand_beebs(i32 noundef 0)
  %10 = call i64 @crc32pseudo()
  store i64 %10, ptr %4, align 8
  br label %11

11:                                               ; preds = %9
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %3, align 4
  br label %5, !llvm.loop !9

14:                                               ; preds = %5
  %15 = load i64, ptr %4, align 8
  %16 = urem i64 %15, 32768
  %17 = trunc i64 %16 to i32
  ret i32 %17
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @benchmark() #0 {
  %1 = call i32 @benchmark_body(i32 noundef 170000)
  ret i32 %1
}

; Function Attrs: noinline nounwind noinline uwtable
define dso_local i32 @verify_benchmark(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp eq i32 11433, %3
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

declare void @cflat_finalize_and_print() #2

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind noinline uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
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
