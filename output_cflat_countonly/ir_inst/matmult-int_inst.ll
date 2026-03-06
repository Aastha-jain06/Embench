; ModuleID = './output_cflat_countonly/ir/matmult-int.ll'
source_filename = "./embench-iot-benchmarks-backup-cflat/matmult-int.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@Seed = dso_local global i32 0, align 4
@ArrayA_ref = dso_local global [20 x [20 x i64]] zeroinitializer, align 8
@ArrayB_ref = dso_local global [20 x [20 x i64]] zeroinitializer, align 8
@__const.verify_benchmark.exp = private unnamed_addr constant [20 x [20 x i64]] [[20 x i64] [i64 291018000, i64 315000075, i64 279049970, i64 205074215, i64 382719905, i64 302595865, i64 348060915, i64 308986330, i64 343160760, i64 307099935, i64 292564810, i64 240954510, i64 232755815, i64 246511665, i64 328466830, i64 263664375, i64 324016395, i64 334656070, i64 285978755, i64 345370360], [20 x i64] [i64 252241835, i64 333432715, i64 299220275, i64 247745815, i64 422508990, i64 316728505, i64 359662270, i64 277775280, i64 323336795, i64 320656600, i64 249903690, i64 251499360, i64 242195700, i64 263484280, i64 348207635, i64 289485100, i64 328607555, i64 300799835, i64 269351410, i64 305703460], [20 x i64] [i64 304901010, i64 316252815, i64 263230275, i64 208939015, i64 421993740, i64 335002930, i64 348571170, i64 280992155, i64 289749970, i64 259701175, i64 295249990, i64 310900035, i64 250896625, i64 250154105, i64 315096035, i64 236364800, i64 312879355, i64 312580685, i64 275998435, i64 344137885], [20 x i64] [i64 286700525, i64 325985600, i64 253054970, i64 224361490, i64 353502130, i64 306544290, i64 323492140, i64 259123905, i64 307731610, i64 282414410, i64 281127810, i64 246936935, i64 207890815, i64 233789540, i64 339836730, i64 277296350, i64 319925620, i64 307470895, i64 290537580, i64 292297535], [20 x i64] [i64 272571255, i64 377663320, i64 304545985, i64 263001340, i64 375034885, i64 325423710, i64 410620380, i64 313191730, i64 356989815, i64 308508355, i64 218003850, i64 272487135, i64 266000220, i64 264734710, i64 367539620, i64 304146675, i64 355295500, i64 276019740, i64 251415695, i64 301225235], [20 x i64] [i64 272547900, i64 321522300, i64 288294345, i64 247748015, i64 389912855, i64 331874890, i64 370798315, i64 315467255, i64 367554485, i64 311947660, i64 258809685, i64 270536510, i64 256730515, i64 287143040, i64 363087030, i64 285672775, i64 353670120, i64 304219695, i64 274897255, i64 324684660], [20 x i64] [i64 233123995, i64 227142480, i64 212655155, i64 198592290, i64 345335250, i64 302661845, i64 253374925, i64 233243305, i64 233750030, i64 224590040, i64 200404820, i64 250791135, i64 234405760, i64 211723645, i64 280630165, i64 185245875, i64 296423665, i64 276278575, i64 252368265, i64 278726535], [20 x i64] [i64 277690535, i64 339615440, i64 320921550, i64 307114315, i64 400187215, i64 334374655, i64 376286920, i64 295993530, i64 362988020, i64 356272700, i64 293965465, i64 261574710, i64 259690975, i64 263037705, i64 416748985, i64 274683275, i64 385571030, i64 402782385, i64 323927010, i64 362778710], [20 x i64] [i64 267168970, i64 323401680, i64 279474330, i64 201934365, i64 362624300, i64 330736145, i64 371793675, i64 299650280, i64 333646005, i64 264791490, i64 215918320, i64 277512760, i64 264068435, i64 234555295, i64 321772515, i64 217507025, i64 310372440, i64 317544750, i64 245525965, i64 343183435], [20 x i64] [i64 281293570, i64 326519505, i64 233494705, i64 238516065, i64 297038200, i64 266273420, i64 349521550, i64 259343530, i64 306032255, i64 266397915, i64 210274920, i64 263743085, i64 231689610, i64 251949545, i64 293562740, i64 226822900, i64 309225440, i64 286212000, i64 206108715, i64 236678985], [20 x i64] [i64 288404350, i64 310319375, i64 282695670, i64 244150740, i64 426489380, i64 387525790, i64 342018190, i64 326086505, i64 352250260, i64 319997735, i64 300645835, i64 284822660, i64 271837440, i64 274000415, i64 361826730, i64 252399600, i64 348582320, i64 375813820, i64 316588255, i64 322499110], [20 x i64] [i64 273368780, i64 329706295, i64 288668335, i64 234501665, i64 381962610, i64 343186285, i64 337520205, i64 259637405, i64 295755465, i64 284778105, i64 205310525, i64 249598310, i64 256662470, i64 251533535, i64 336159770, i64 249342150, i64 333559450, i64 329296590, i64 278254845, i64 300673860], [20 x i64] [i64 318589575, i64 315522800, i64 260632295, i64 250009765, i64 337127730, i64 312810490, i64 346698590, i64 260810030, i64 388289910, i64 337081285, i64 283635410, i64 208148610, i64 234123865, i64 259653165, i64 370115255, i64 243311450, i64 377808245, i64 358786770, i64 286839730, i64 321912835], [20 x i64] [i64 229541925, i64 253967450, i64 223002545, i64 202302515, i64 303446955, i64 268472740, i64 285580065, i64 211013405, i64 287677960, i64 279773910, i64 227377310, i64 197461135, i64 222469715, i64 179536615, i64 306957380, i64 178407075, i64 281051570, i64 279718120, i64 234868230, i64 288991535], [20 x i64] [i64 290692955, i64 317729070, i64 297868235, i64 213450065, i64 469270935, i64 375344910, i64 326987580, i64 334565680, i64 325300040, i64 290325655, i64 254703825, i64 284914960, i64 245773820, i64 276641510, i64 323510795, i64 271034400, i64 337424250, i64 360011440, i64 281515520, i64 331261535], [20 x i64] [i64 287075125, i64 313194850, i64 269889345, i64 208109115, i64 420653930, i64 331900290, i64 355440665, i64 318065155, i64 343785360, i64 302163035, i64 308959360, i64 312666110, i64 268997740, i64 288557415, i64 370158305, i64 205012650, i64 318198795, i64 384484520, i64 316450105, i64 378714460], [20 x i64] [i64 278680580, i64 356815220, i64 307597060, i64 216073365, i64 390879235, i64 358775185, i64 358895230, i64 306434180, i64 315569040, i64 272688130, i64 249424325, i64 274584610, i64 273530970, i64 265450585, i64 325127920, i64 312802050, i64 317134900, i64 298518590, i64 269975470, i64 332586535], [20 x i64] [i64 245629780, i64 267021570, i64 234689035, i64 208808065, i64 366356035, i64 267059560, i64 349348005, i64 270158755, i64 348048340, i64 291550930, i64 272717800, i64 259714410, i64 236033845, i64 280627610, i64 335089770, i64 176610475, i64 259339950, i64 322752840, i64 236218295, i64 329687310], [20 x i64] [i64 226517370, i64 272306005, i64 271484080, i64 216145515, i64 400972075, i64 288475645, i64 332969550, i64 338410905, i64 329052205, i64 330392265, i64 306488095, i64 271979085, i64 232795960, i64 257593945, i64 339558165, i64 202700275, i64 320622065, i64 386350450, i64 315344865, i64 329233410], [20 x i64] [i64 224852610, i64 231292540, i64 236945875, i64 243273740, i64 336327040, i64 305144680, i64 248261920, i64 191671605, i64 241699245, i64 263085200, i64 198883715, i64 175742885, i64 202517850, i64 172427630, i64 296304160, i64 209188850, i64 326546955, i64 252990460, i64 238844535, i64 289753485]], align 8
@ResultArray = dso_local global [20 x [20 x i64]] zeroinitializer, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@ArrayA = dso_local global [20 x [20 x i64]] zeroinitializer, align 8
@ArrayB = dso_local global [20 x [20 x i64]] zeroinitializer, align 8
@llvm.compiler.used = appending global [1 x ptr] [ptr @main], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @values_match(i64 noundef %0, i64 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load i64, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = icmp eq i64 %5, %6
  %8 = zext i1 %7 to i32
  call void @__cflat_call_return(i64 111183145556672)
  ret i32 %8
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @warm_caches(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  call void @__cflat_call_enter(i64 111183145559696, i64 111183145559152)
  %5 = call i32 @benchmark_body(i32 noundef %4)
  store i32 %5, ptr %3, align 4
  call void @__cflat_call_return(i64 111183145559152)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @benchmark_body(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  call void @__cflat_record_node(i64 111183145559696)
  br label %4

4:                                                ; preds = %9, %1
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %2, align 4
  %7 = icmp slt i32 %5, %6
  call void @__cflat_record_node(i64 111183145592256)
  br i1 %7, label %8, label %12

8:                                                ; preds = %4
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 @ArrayA, ptr align 8 @ArrayA_ref, i64 3200, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 @ArrayB, ptr align 8 @ArrayB_ref, i64 3200, i1 false)
  call void @__cflat_call_enter(i64 111183145593824, i64 111183145593280)
  call void @Test(ptr noundef @ArrayA, ptr noundef @ArrayB, ptr noundef @ResultArray)
  call void @__cflat_record_node(i64 111183145593280)
  br label %9

9:                                                ; preds = %8
  %10 = load i32, ptr %3, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %3, align 4
  call void @__cflat_record_node(i64 111183145594384)
  br label %4, !llvm.loop !6

12:                                               ; preds = %4
  call void @__cflat_call_return(i64 111183145559696)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @benchmark() #0 {
  call void @__cflat_call_enter(i64 111183145559696, i64 111183145598384)
  %1 = call i32 @benchmark_body(i32 noundef 46000)
  call void @__cflat_call_return(i64 111183145598384)
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @InitSeed() #0 {
  store i32 0, ptr @Seed, align 4
  call void @__cflat_call_return(i64 111183145599168)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Test(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  call void @__cflat_call_enter(i64 111183145601120, i64 111183145593824)
  call void @Multiply(ptr noundef %7, ptr noundef %8, ptr noundef %9)
  call void @__cflat_call_return(i64 111183145593824)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Multiply(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  call void @__cflat_record_node(i64 111183145601120)
  br label %10

10:                                               ; preds = %63, %3
  %11 = load i32, ptr %7, align 4
  %12 = icmp slt i32 %11, 20
  call void @__cflat_record_node(i64 111183145603440)
  br i1 %12, label %13, label %66

13:                                               ; preds = %10
  store i32 0, ptr %8, align 4
  call void @__cflat_record_node(i64 111183145604144)
  br label %14

14:                                               ; preds = %59, %13
  %15 = load i32, ptr %8, align 4
  %16 = icmp slt i32 %15, 20
  call void @__cflat_record_node(i64 111183145604464)
  br i1 %16, label %17, label %62

17:                                               ; preds = %14
  %18 = load ptr, ptr %6, align 8
  %19 = load i32, ptr %7, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [20 x i64], ptr %18, i64 %20
  %22 = load i32, ptr %8, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [20 x i64], ptr %21, i64 0, i64 %23
  store i64 0, ptr %24, align 8
  store i32 0, ptr %9, align 4
  call void @__cflat_record_node(i64 111183145605136)
  br label %25

25:                                               ; preds = %55, %17
  %26 = load i32, ptr %9, align 4
  %27 = icmp slt i32 %26, 20
  call void @__cflat_record_node(i64 111183145606656)
  br i1 %27, label %28, label %58

28:                                               ; preds = %25
  %29 = load ptr, ptr %4, align 8
  %30 = load i32, ptr %7, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [20 x i64], ptr %29, i64 %31
  %33 = load i32, ptr %9, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [20 x i64], ptr %32, i64 0, i64 %34
  %36 = load i64, ptr %35, align 8
  %37 = load ptr, ptr %5, align 8
  %38 = load i32, ptr %9, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [20 x i64], ptr %37, i64 %39
  %41 = load i32, ptr %8, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [20 x i64], ptr %40, i64 0, i64 %42
  %44 = load i64, ptr %43, align 8
  %45 = mul nsw i64 %36, %44
  %46 = load ptr, ptr %6, align 8
  %47 = load i32, ptr %7, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [20 x i64], ptr %46, i64 %48
  %50 = load i32, ptr %8, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [20 x i64], ptr %49, i64 0, i64 %51
  %53 = load i64, ptr %52, align 8
  %54 = add nsw i64 %53, %45
  store i64 %54, ptr %52, align 8
  call void @__cflat_record_node(i64 111183145607328)
  br label %55

55:                                               ; preds = %28
  %56 = load i32, ptr %9, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, ptr %9, align 4
  call void @__cflat_record_node(i64 111183145613296)
  br label %25, !llvm.loop !8

58:                                               ; preds = %25
  call void @__cflat_record_node(i64 111183145614176)
  br label %59

59:                                               ; preds = %58
  %60 = load i32, ptr %8, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %8, align 4
  call void @__cflat_record_node(i64 111183145614288)
  br label %14, !llvm.loop !9

62:                                               ; preds = %14
  call void @__cflat_record_node(i64 111183145615168)
  br label %63

63:                                               ; preds = %62
  %64 = load i32, ptr %7, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %7, align 4
  call void @__cflat_record_node(i64 111183145615280)
  br label %10, !llvm.loop !10

66:                                               ; preds = %10
  call void @__cflat_call_return(i64 111183145601120)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @RandomInteger() #0 {
  %1 = load i32, ptr @Seed, align 4
  %2 = mul nsw i32 %1, 133
  %3 = add nsw i32 %2, 81
  %4 = srem i32 %3, 8095
  store i32 %4, ptr @Seed, align 4
  %5 = load i32, ptr @Seed, align 4
  call void @__cflat_call_return(i64 111183145610304)
  ret i32 %5
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @initialise_benchmark() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @__cflat_call_enter(i64 111183145599168, i64 111183145616160)
  call void @InitSeed()
  store i32 0, ptr %1, align 4
  call void @__cflat_record_node(i64 111183145616160)
  br label %3

3:                                                ; preds = %23, %0
  %4 = load i32, ptr %1, align 4
  %5 = icmp slt i32 %4, 20
  call void @__cflat_record_node(i64 111183145616896)
  br i1 %5, label %6, label %26

6:                                                ; preds = %3
  store i32 0, ptr %2, align 4
  call void @__cflat_record_node(i64 111183145617600)
  br label %7

7:                                                ; preds = %19, %6
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %8, 20
  call void @__cflat_record_node(i64 111183145617920)
  br i1 %9, label %10, label %22

10:                                               ; preds = %7
  call void @__cflat_call_enter(i64 111183145610304, i64 111183145618592)
  %11 = call i32 @RandomInteger()
  %12 = sext i32 %11 to i64
  %13 = load i32, ptr %1, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [20 x [20 x i64]], ptr @ArrayA_ref, i64 0, i64 %14
  %16 = load i32, ptr %2, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [20 x i64], ptr %15, i64 0, i64 %17
  store i64 %12, ptr %18, align 8
  call void @__cflat_record_node(i64 111183145618592)
  br label %19

19:                                               ; preds = %10
  %20 = load i32, ptr %2, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %2, align 4
  call void @__cflat_record_node(i64 111183145620128)
  br label %7, !llvm.loop !11

22:                                               ; preds = %7
  call void @__cflat_record_node(i64 111183145621008)
  br label %23

23:                                               ; preds = %22
  %24 = load i32, ptr %1, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %1, align 4
  call void @__cflat_record_node(i64 111183145621120)
  br label %3, !llvm.loop !12

26:                                               ; preds = %3
  store i32 0, ptr %1, align 4
  call void @__cflat_record_node(i64 111183145621952)
  br label %27

27:                                               ; preds = %47, %26
  %28 = load i32, ptr %1, align 4
  %29 = icmp slt i32 %28, 20
  call void @__cflat_record_node(i64 111183145622272)
  br i1 %29, label %30, label %50

30:                                               ; preds = %27
  store i32 0, ptr %2, align 4
  call void @__cflat_record_node(i64 111183145622976)
  br label %31

31:                                               ; preds = %43, %30
  %32 = load i32, ptr %2, align 4
  %33 = icmp slt i32 %32, 20
  call void @__cflat_record_node(i64 111183145623296)
  br i1 %33, label %34, label %46

34:                                               ; preds = %31
  call void @__cflat_call_enter(i64 111183145610304, i64 111183145623968)
  %35 = call i32 @RandomInteger()
  %36 = sext i32 %35 to i64
  %37 = load i32, ptr %1, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [20 x [20 x i64]], ptr @ArrayB_ref, i64 0, i64 %38
  %40 = load i32, ptr %2, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [20 x i64], ptr %39, i64 0, i64 %41
  store i64 %36, ptr %42, align 8
  call void @__cflat_record_node(i64 111183145623968)
  br label %43

43:                                               ; preds = %34
  %44 = load i32, ptr %2, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %2, align 4
  call void @__cflat_record_node(i64 111183145625504)
  br label %31, !llvm.loop !13

46:                                               ; preds = %31
  call void @__cflat_record_node(i64 111183145626384)
  br label %47

47:                                               ; preds = %46
  %48 = load i32, ptr %1, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %1, align 4
  call void @__cflat_record_node(i64 111183145628560)
  br label %27, !llvm.loop !14

50:                                               ; preds = %27
  call void @__cflat_call_return(i64 111183145616160)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @verify_benchmark(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [20 x [20 x i64]], align 8
  store i32 %0, ptr %2, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 @__const.verify_benchmark.exp, i64 3200, i1 false)
  %6 = getelementptr inbounds [20 x [20 x i64]], ptr %5, i64 0, i64 0
  %7 = call i32 @memcmp(ptr noundef @ResultArray, ptr noundef %6, i64 noundef 3200) #4
  %8 = icmp eq i32 0, %7
  %9 = zext i1 %8 to i32
  call void @__cflat_call_return(i64 111183145627008)
  ret i32 %9
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  call void @__cflat_call_enter(i64 111183145616160, i64 111183145551728)
  call void @initialise_benchmark()
  call void @__cflat_call_enter(i64 111183145559152, i64 111183145551728)
  call void @warm_caches(i32 noundef 0)
  call void @__cflat_call_enter(i64 111183145676032, i64 111183145551728)
  %8 = call i32 @benchmark()
  store volatile i32 %8, ptr %6, align 4
  call void @cflat_finalize_and_print()
  %9 = load volatile i32, ptr %6, align 4
  call void @__cflat_call_enter(i64 111183145627008, i64 111183145551728)
  %10 = call i32 @verify_benchmark(i32 noundef %9)
  store i32 %10, ptr %7, align 4
  %11 = load i32, ptr %7, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %11)
  call void @__cflat_call_return(i64 111183145551728)
  ret i32 0
}

declare void @cflat_finalize_and_print() #3

declare i32 @printf(ptr noundef, ...) #3

declare void @__cflat_call_return(i64)

declare void @__cflat_call_enter(i64, i64)

declare void @__cflat_record_node(i64)

attributes #0 = { noinline nounwind uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
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
