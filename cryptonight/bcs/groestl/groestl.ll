; ModuleID = 'groestl/groestl.bc'
source_filename = "groestl.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-emscripten"

%struct.groestlHashState = type { [16 x i32], i32, i32, [64 x i8], i32, i32 }

@T = hidden local_unnamed_addr constant [512 x i32] [i32 -1510722874, i32 -962226188, i32 -2070450184, i32 -125506665, i32 -1716494610, i32 -291911760, i32 -1920173322, i32 -158468212, i32 219670783, i32 -15866601, i32 -1109652778, i32 -692209700, i32 -1312287010, i32 -558782520, i32 1425829265, i32 -1856751108, i32 1357942880, i32 1615905008, i32 50661122, i32 33752069, i32 -1444925746, i32 -827750432, i32 2106052950, i32 1451076743, i32 422300903, i32 -417737429, i32 1655051189, i32 -1251839578, i32 -432964531, i32 1306958385, i32 -1699390996, i32 -325401675, i32 1171210383, i32 -1891301937, i32 -1648581857, i32 530398908, i32 1086343561, i32 -1992291904, i32 -2020448006, i32 -91754606, i32 356503791, i32 -283785921, i32 -349793102, i32 -1293189338, i32 -918499698, i32 -1899428032, i32 186509051, i32 -83104483, i32 -332435903, i32 1106018863, i32 1739135667, i32 -1285063255, i32 -48479393, i32 1610464796, i32 -366649275, i32 1172998693, i32 -1076168413, i32 599738074, i32 -150843053, i32 1408738818, i32 -1767815708, i32 -459877471, i32 1542289051, i32 -1688523283, i32 -1034082187, i32 1975708253, i32 472172001, i32 -518203100, i32 -1360407491, i32 1034844905, i32 1790898764, i32 1282054334, i32 1525580396, i32 1817893102, i32 1103347070, i32 2118253763, i32 34010101, i32 -184356602, i32 1339118211, i32 -2091967023, i32 1558482024, i32 1750913252, i32 -200845743, i32 1374986759, i32 878480849, i32 -785073828, i32 135848441, i32 -116856552, i32 -1817293598, i32 -493625426, i32 1939160747, i32 -1418506859, i32 1408604002, i32 1649657077, i32 1061251882, i32 708793409, i32 202644488, i32 135008276, i32 1391879061, i32 -1789775370, i32 1706027334, i32 1181060271, i32 1591902109, i32 -1654775326, i32 678971440, i32 807952504, i32 -1577529545, i32 933326584, i32 252779274, i32 168760337, i32 -1245385937, i32 800415428, i32 152769806, i32 235478043, i32 911900196, i32 607537242, i32 -1682526949, i32 463156918, i32 1028102367, i32 -549608121, i32 644523981, i32 -853114518, i32 1773925710, i32 1315544251, i32 -850644097, i32 2144206412, i32 -1615179542, i32 -358625350, i32 455950098, i32 303768621, i32 -1632000995, i32 496908985, i32 1956430936, i32 1484042396, i32 779241012, i32 875456626, i32 762790198, i32 908946551, i32 -1295183396, i32 -592272435, i32 -299262540, i32 -1259441367, i32 -82424485, i32 1543222806, i32 -167664220, i32 -1527360767, i32 1305977206, i32 1984818391, i32 1638077623, i32 -1218349661, i32 -834063235, i32 2110716489, i32 2072895314, i32 1383834765, i32 1044553693, i32 -583098046, i32 1905511774, i32 1584512147, i32 -1750945517, i32 328672930, i32 -184245594, i32 -1493870844, i32 1756889529, i32 -1184339528, i32 0, i32 0, i32 745846209, i32 -1054041740, i32 1621155904, i32 1080066208, i32 522306275, i32 -484451039, i32 -935118215, i32 2043212355, i32 -315843914, i32 -1225951444, i32 -1093071404, i32 -725699623, i32 1187661709, i32 -1924791862, i32 -646965401, i32 1742327408, i32 1272819570, i32 1917576413, i32 -562434668, i32 -1797377159, i32 -731381864, i32 -1730925721, i32 -400321616, i32 -1326941405, i32 1256086405, i32 -2058743330, i32 1807550139, i32 -1150587459, i32 712948677, i32 -987065986, i32 -449545393, i32 1340448308, i32 372955117, i32 -317275846, i32 -984296826, i32 -2033903788, i32 -681379686, i32 -1697173662, i32 1442814310, i32 1716899071, i32 -1800948207, i32 294920871, i32 -817184630, i32 -1966141622, i32 271636969, i32 -384775888, i32 101322244, i32 67504138, i32 -2120718594, i32 -25041000, i32 -267670624, i32 -1594860789, i32 1154266232, i32 2017784012, i32 -1160384475, i32 632965845, i32 -482446005, i32 1273206334, i32 -217142110, i32 -1561108722, i32 -31898531, i32 1576974873, i32 -1067721856, i32 -2134893733, i32 -1970962427, i32 92932741, i32 -1376988353, i32 1068334828, i32 -1126171103, i32 565986015, i32 1222158448, i32 1883824344, i32 67960305, i32 -251332340, i32 -545646237, i32 1675609722, i32 -1051185289, i32 2009198168, i32 1973366959, i32 -1351268961, i32 1671817026, i32 1113818277, i32 810577952, i32 540033104, i32 439274469, i32 -451227346, i32 236122109, i32 -49356526, i32 1840711871, i32 -1083349577, i32 1288983937, i32 -2125719084, i32 339485720, i32 403976252, i32 895449382, i32 641027167, i32 795980483, i32 -1020289679, i32 -516389186, i32 -1092524232, i32 -1560426443, i32 899836669, i32 -867186808, i32 -1999893681, i32 961242414, i32 775511115, i32 1475963539, i32 -1822999047, i32 -234006443, i32 1441966605, i32 -2103614980, i32 -58530915, i32 1204401018, i32 2051536073, i32 -1393612856, i32 -928216081, i32 -416118598, i32 -1159237838, i32 729632562, i32 841704573, i32 -1784397082, i32 -426387548, i32 -1594147904, i32 -1063216133, i32 -1733055975, i32 429404851, i32 -781650274, i32 -1630460056, i32 2139169443, i32 -1551934079, i32 1722478148, i32 1147570346, i32 2122503764, i32 1417586818, i32 -1410933445, i32 1001092838, i32 -2086759157, i32 193140382, i32 -901396084, i32 -1932917947, i32 695975111, i32 -953576069, i32 -747764373, i32 1809045102, i32 1011117096, i32 675041348, i32 2039164071, i32 -1485220469, i32 -499285572, i32 -1126014147, i32 489107734, i32 371010599, i32 1989818285, i32 -1384758886, i32 994940635, i32 -616846003, i32 1459265124, i32 1683409146, i32 1322428020, i32 1951328466, i32 505558548, i32 337520674, i32 -612965230, i32 -1831125130, i32 169742860, i32 201988126, i32 1823800392, i32 1215074484, i32 -466120776, i32 -1192989897, i32 1575450783, i32 -1621285401, i32 1857163197, i32 -1116839502, i32 -282433213, i32 1139770922, i32 -1494141500, i32 -995716111, i32 -1461462471, i32 967340771, i32 -1527265743, i32 832856823, i32 928615123, i32 -751321767, i32 -1954122510, i32 -225706106, i32 844530645, i32 -718098090, i32 1137004171, i32 -1958539835, i32 1508607342, i32 1851383019, i32 -1212016422, i32 -625496126, i32 -1936749055, i32 25952911, i32 1689001393, i32 -1318815316, i32 -764546660, i32 -1663949971, i32 -532975031, i32 1239454267, i32 -1262018600, i32 -659248185, i32 -99239508, i32 -1392884971, i32 118094579, i32 -217580279, i32 628072655, i32 -819624593, i32 -1343610678, i32 -894464022, i32 -1903591948, i32 -191958135, i32 -383752377, i32 1206488608, i32 405288976, i32 270016552, i32 -714863761, i32 1876287076, i32 -2004651024, i32 -259458173, i32 1873935178, i32 1248826545, i32 1922484828, i32 1551022230, i32 611079224, i32 941912172, i32 -251109545, i32 1475456520, i32 -950918797, i32 1942480466, i32 1374905495, i32 -1756285453, i32 593866443, i32 -886862491, i32 2089035169, i32 -1585686140, i32 -1665181720, i32 -392377409, i32 560160062, i32 1042381923, i32 -579016042, i32 -1763887236, i32 -595648927, i32 1641857663, i32 -2037277683, i32 226892433, i32 -2053858545, i32 260382356, i32 -1867822112, i32 -527377493, i32 1120320124, i32 2084763846, i32 -1000921487, i32 1908728407, i32 -1427822132, i32 -861240347, i32 -663493744, i32 -1864877197, i32 84871430, i32 100994063, i32 17036535, i32 -150866685, i32 305539612, i32 470956086, i32 -1543619390, i32 -1029464066, i32 1608616810, i32 1784665313, i32 -116343122, i32 -1359395056, i32 -798293399, i32 1775293035, i32 -1851212009, i32 395390632, i32 1491628441, i32 -1722275352, i32 661214010, i32 975664233, i32 -1177487577, i32 666455760, i32 944280025, i32 -650598072, i32 322297579, i32 -351023819, i32 -1278286549, i32 733173454, i32 861239074, i32 573785173, i32 -1143601966, i32 -759447594, i32 1888500137, i32 -1452258928, i32 -1988065529, i32 126422656, i32 -1477263053, i32 866608882, i32 -1228805075, i32 766925505, i32 577133116, i32 1008892006, i32 -1834108907, i32 361900717, i32 543205833, i32 -920614560, i32 1239112839, i32 -2025253413, i32 -15028054, i32 -1426108646, i32 2022234192, i32 1350082696, i32 2056137637, i32 -1518710386, i32 -1886746365, i32 59704970, i32 -132953511, i32 1509470739, i32 -2137288183, i32 159388315, i32 389620506, i32 437728313, i32 -629862299, i32 1708837493, i32 827557079, i32 -684608173, i32 -967715452, i32 -2067393711, i32 -1194130480, i32 -793199661, i32 -1017193342, i32 -2101141666, i32 -1328815575, i32 699421387, i32 2006565722, i32 1517794457, i32 288566558, i32 504446003, i32 -884589189, i32 2076964422, i32 -65030232, i32 -1459860705, i32 -698282899, i32 1842797153, i32 978215468, i32 742021198], align 16
@shift_Values = hidden local_unnamed_addr constant [2 x [8 x i8]] [[8 x i8] c"\00\01\02\03\04\05\06\07", [8 x i8] c"\01\03\05\07\00\02\04\06"], align 16
@indices_cyclic = hidden local_unnamed_addr constant [15 x i8] c"\00\01\02\03\04\05\06\07\00\01\02\03\04\05\06", align 1

; Function Attrs: nounwind
define hidden void @groestl(i8* nocapture readonly %data, i64 %databitlen, i8* %hashval) local_unnamed_addr #0 {
if.end24.i:
  %temp.i.i = alloca [16 x i32], align 16
  %y.i.i = alloca [16 x i32], align 16
  %z.i.i = alloca [16 x i32], align 16
  %context = alloca %struct.groestlHashState, align 4
  %0 = bitcast %struct.groestlHashState* %context to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %0) #3
  call void @llvm.memset.p0i8.i32(i8* nonnull align 4 dereferenceable(64) %0, i8 0, i32 60, i1 false) #3
  %arrayidx2.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 0, i32 15
  store i32 65536, i32* %arrayidx2.i, align 4, !tbaa !2
  %buf_ptr.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 4
  store i32 0, i32* %buf_ptr.i, align 4, !tbaa !6
  %block_counter1.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 1
  store i32 0, i32* %block_counter1.i, align 4, !tbaa !8
  %block_counter2.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 2
  store i32 0, i32* %block_counter2.i, align 4, !tbaa !9
  %bits_in_last_byte.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 5
  store i32 0, i32* %bits_in_last_byte.i, align 4, !tbaa !10
  %div.i = lshr i64 %databitlen, 3
  %conv.i = trunc i64 %div.i to i32
  %1 = trunc i64 %databitlen to i32
  %conv2.i = and i32 %1, 7
  call fastcc void @Transform(%struct.groestlHashState* nonnull %context, i8* %data, i32 %conv.i) #3
  %div26.i = sdiv i32 %conv.i, 64
  %mul.i = shl nsw i32 %div26.i, 6
  %cmp2888.i = icmp slt i32 %mul.i, %conv.i
  br i1 %cmp2888.i, label %while.body30.i, label %while.end37.i

while.body30.i:                                   ; preds = %if.end24.i, %while.body30.i
  %index.289.i = phi i32 [ %inc31.i, %while.body30.i ], [ %mul.i, %if.end24.i ]
  %inc31.i = add nsw i32 %index.289.i, 1
  %arrayidx32.i = getelementptr inbounds i8, i8* %data, i32 %index.289.i
  %2 = load i8, i8* %arrayidx32.i, align 1, !tbaa !11
  %3 = load i32, i32* %buf_ptr.i, align 4, !tbaa !6
  %inc35.i = add nsw i32 %3, 1
  store i32 %inc35.i, i32* %buf_ptr.i, align 4, !tbaa !6
  %arrayidx36.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 3, i32 %3
  store i8 %2, i8* %arrayidx36.i, align 1, !tbaa !11
  %exitcond = icmp eq i32 %inc31.i, %conv.i
  br i1 %exitcond, label %while.end37.i, label %while.body30.i

while.end37.i:                                    ; preds = %while.body30.i, %if.end24.i
  %index.2.lcssa.i = phi i32 [ %mul.i, %if.end24.i ], [ %conv.i, %while.body30.i ]
  %tobool38.i = icmp eq i32 %conv2.i, 0
  br i1 %tobool38.i, label %Update.exit, label %if.then39.i

if.then39.i:                                      ; preds = %while.end37.i
  store i32 %conv2.i, i32* %bits_in_last_byte.i, align 4, !tbaa !10
  %arrayidx41.i = getelementptr inbounds i8, i8* %data, i32 %index.2.lcssa.i
  %4 = load i8, i8* %arrayidx41.i, align 1, !tbaa !11
  %5 = load i32, i32* %buf_ptr.i, align 4, !tbaa !6
  %inc44.i15 = add nsw i32 %5, 1
  store i32 %inc44.i15, i32* %buf_ptr.i, align 4, !tbaa !6
  %arrayidx45.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 3, i32 %5
  store i8 %4, i8* %arrayidx45.i, align 1, !tbaa !11
  br label %Update.exit

Update.exit:                                      ; preds = %while.end37.i, %if.then39.i
  %6 = load i32, i32* %bits_in_last_byte.i, align 4, !tbaa !10
  %tobool.i = icmp eq i32 %6, 0
  br i1 %tobool.i, label %if.else.i, label %if.then.i

if.then.i:                                        ; preds = %Update.exit
  %notmask.i = shl nsw i32 -1, %6
  %sub.i = xor i32 %notmask.i, -1
  %sub3.i = sub nsw i32 8, %6
  %shl4.i = shl i32 %sub.i, %sub3.i
  %7 = load i32, i32* %buf_ptr.i, align 4, !tbaa !6
  %sub5.i = add nsw i32 %7, -1
  %arrayidx.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 3, i32 %sub5.i
  %8 = load i8, i8* %arrayidx.i, align 1, !tbaa !11
  %9 = trunc i32 %shl4.i to i8
  %conv6.i = and i8 %8, %9
  store i8 %conv6.i, i8* %arrayidx.i, align 1, !tbaa !11
  %10 = load i32, i32* %bits_in_last_byte.i, align 4, !tbaa !10
  %sub8.i = sub nsw i32 7, %10
  %shl9.i = shl nuw i32 1, %sub8.i
  %11 = load i32, i32* %buf_ptr.i, align 4, !tbaa !6
  %sub12.i = add nsw i32 %11, -1
  %arrayidx13.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 3, i32 %sub12.i
  %12 = load i8, i8* %arrayidx13.i, align 1, !tbaa !11
  %13 = trunc i32 %shl9.i to i8
  %conv15.i = xor i8 %12, %13
  store i8 %conv15.i, i8* %arrayidx13.i, align 1, !tbaa !11
  store i32 0, i32* %bits_in_last_byte.i, align 4, !tbaa !10
  br label %if.end.i

if.else.i:                                        ; preds = %Update.exit
  %14 = load i32, i32* %buf_ptr.i, align 4, !tbaa !6
  %inc.i = add nsw i32 %14, 1
  store i32 %inc.i, i32* %buf_ptr.i, align 4, !tbaa !6
  %arrayidx19.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 3, i32 %14
  store i8 -128, i8* %arrayidx19.i, align 1, !tbaa !11
  br label %if.end.i

if.end.i:                                         ; preds = %if.else.i, %if.then.i
  %15 = load i32, i32* %buf_ptr.i, align 4, !tbaa !6
  %cmp.i = icmp sgt i32 %15, 56
  br i1 %cmp.i, label %while.cond.preheader.i, label %if.end33.i

while.cond.preheader.i:                           ; preds = %if.end.i
  %cmp24165.i = icmp slt i32 %15, 64
  br i1 %cmp24165.i, label %while.body.i, label %if.end33.thread.i

while.body.i:                                     ; preds = %while.cond.preheader.i, %while.body.i
  %16 = phi i32 [ %.pr.i, %while.body.i ], [ %15, %while.cond.preheader.i ]
  %inc28.i = add nsw i32 %16, 1
  store i32 %inc28.i, i32* %buf_ptr.i, align 4, !tbaa !6
  %arrayidx29.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 3, i32 %16
  store i8 0, i8* %arrayidx29.i, align 1, !tbaa !11
  %.pr.i = load i32, i32* %buf_ptr.i, align 4, !tbaa !6
  %cmp24.i = icmp slt i32 %.pr.i, 64
  br i1 %cmp24.i, label %while.body.i, label %if.end33.thread.i

if.end33.thread.i:                                ; preds = %while.body.i, %while.cond.preheader.i
  %arraydecay31.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 3, i32 0
  call fastcc void @Transform(%struct.groestlHashState* nonnull %context, i8* nonnull %arraydecay31.i, i32 64) #3
  store i32 0, i32* %buf_ptr.i, align 4, !tbaa !6
  br label %while.body38.i.preheader

if.end33.i:                                       ; preds = %if.end.i
  %cmp36164.i = icmp eq i32 %15, 56
  br i1 %cmp36164.i, label %while.end43.i, label %while.body38.i.preheader

while.body38.i.preheader:                         ; preds = %if.end33.i, %if.end33.thread.i
  %.ph = phi i32 [ %15, %if.end33.i ], [ 0, %if.end33.thread.i ]
  br label %while.body38.i

while.body38.i:                                   ; preds = %while.body38.i.preheader, %while.body38.i
  %17 = phi i32 [ %18, %while.body38.i ], [ %.ph, %while.body38.i.preheader ]
  %inc41.i = add nsw i32 %17, 1
  store i32 %inc41.i, i32* %buf_ptr.i, align 4, !tbaa !6
  %arrayidx42.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 3, i32 %17
  store i8 0, i8* %arrayidx42.i, align 1, !tbaa !11
  %18 = load i32, i32* %buf_ptr.i, align 4, !tbaa !6
  %cmp36.i = icmp slt i32 %18, 56
  br i1 %cmp36.i, label %while.body38.i, label %while.end43.i

while.end43.i:                                    ; preds = %while.body38.i, %if.end33.i
  %19 = load i32, i32* %block_counter1.i, align 4, !tbaa !8
  %inc44.i = add i32 %19, 1
  store i32 %inc44.i, i32* %block_counter1.i, align 4, !tbaa !8
  %cmp46.i = icmp eq i32 %inc44.i, 0
  br i1 %cmp46.i, label %if.then48.i, label %if.end50.i

if.then48.i:                                      ; preds = %while.end43.i
  %20 = load i32, i32* %block_counter2.i, align 4, !tbaa !9
  %inc49.i = add i32 %20, 1
  store i32 %inc49.i, i32* %block_counter2.i, align 4, !tbaa !9
  br label %if.end50.i

if.end50.i:                                       ; preds = %if.then48.i, %while.end43.i
  store i32 64, i32* %buf_ptr.i, align 4, !tbaa !6
  br label %while.body56.i

while.cond64.preheader.i:                         ; preds = %while.body56.i
  %cmp66163.i = icmp sgt i32 %.pr158.i, 56
  br i1 %cmp66163.i, label %while.body68.lr.ph.i, label %Final.exit

while.body68.lr.ph.i:                             ; preds = %while.cond64.preheader.i
  %.pre.i = load i32, i32* %block_counter2.i, align 4, !tbaa !9
  br label %while.body68.i

while.body56.i:                                   ; preds = %while.body56.i, %if.end50.i
  %21 = phi i32 [ %inc44.i, %if.end50.i ], [ %shr.i, %while.body56.i ]
  %22 = phi i32 [ 64, %if.end50.i ], [ %.pr158.i, %while.body56.i ]
  %conv58.i = trunc i32 %21 to i8
  %dec.i = add nsw i32 %22, -1
  store i32 %dec.i, i32* %buf_ptr.i, align 4, !tbaa !6
  %arrayidx61.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 3, i32 %dec.i
  store i8 %conv58.i, i8* %arrayidx61.i, align 1, !tbaa !11
  %23 = load i32, i32* %block_counter1.i, align 4, !tbaa !8
  %shr.i = lshr i32 %23, 8
  store i32 %shr.i, i32* %block_counter1.i, align 4, !tbaa !8
  %.pr158.i = load i32, i32* %buf_ptr.i, align 4, !tbaa !6
  %cmp54.i = icmp sgt i32 %.pr158.i, 60
  br i1 %cmp54.i, label %while.body56.i, label %while.cond64.preheader.i

while.body68.i:                                   ; preds = %while.body68.i, %while.body68.lr.ph.i
  %24 = phi i32 [ %.pre.i, %while.body68.lr.ph.i ], [ %shr76.i, %while.body68.i ]
  %25 = phi i32 [ %.pr158.i, %while.body68.lr.ph.i ], [ %27, %while.body68.i ]
  %conv70.i = trunc i32 %24 to i8
  %dec73.i = add nsw i32 %25, -1
  store i32 %dec73.i, i32* %buf_ptr.i, align 4, !tbaa !6
  %arrayidx74.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 3, i32 %dec73.i
  store i8 %conv70.i, i8* %arrayidx74.i, align 1, !tbaa !11
  %26 = load i32, i32* %block_counter2.i, align 4, !tbaa !9
  %shr76.i = lshr i32 %26, 8
  store i32 %shr76.i, i32* %block_counter2.i, align 4, !tbaa !9
  %27 = load i32, i32* %buf_ptr.i, align 4, !tbaa !6
  %cmp66.i = icmp sgt i32 %27, 56
  br i1 %cmp66.i, label %while.body68.i, label %Final.exit

Final.exit:                                       ; preds = %while.body68.i, %while.cond64.preheader.i
  %arraydecay79.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 3, i32 0
  call fastcc void @Transform(%struct.groestlHashState* nonnull %context, i8* nonnull %arraydecay79.i, i32 64) #3
  %28 = bitcast [16 x i32]* %temp.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %28) #3
  %29 = bitcast [16 x i32]* %y.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %29) #3
  %30 = bitcast [16 x i32]* %z.i.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %30) #3
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 dereferenceable(64) %28, i8* nonnull align 4 dereferenceable(64) %0, i32 64, i1 false) #3
  %arraydecay.i.i = getelementptr inbounds [16 x i32], [16 x i32]* %temp.i.i, i32 0, i32 0
  %arraydecay2.i.i = getelementptr inbounds [16 x i32], [16 x i32]* %y.i.i, i32 0, i32 0
  call fastcc void @RND512P(i8* nonnull %28, i32* nonnull %arraydecay2.i.i, i32 0) #3
  %arraydecay4.i.i = getelementptr inbounds [16 x i32], [16 x i32]* %z.i.i, i32 0, i32 0
  call fastcc void @RND512P(i8* nonnull %29, i32* nonnull %arraydecay4.i.i, i32 1) #3
  call fastcc void @RND512P(i8* nonnull %30, i32* nonnull %arraydecay2.i.i, i32 2) #3
  call fastcc void @RND512P(i8* nonnull %29, i32* nonnull %arraydecay4.i.i, i32 3) #3
  call fastcc void @RND512P(i8* nonnull %30, i32* nonnull %arraydecay2.i.i, i32 4) #3
  call fastcc void @RND512P(i8* nonnull %29, i32* nonnull %arraydecay4.i.i, i32 5) #3
  call fastcc void @RND512P(i8* nonnull %30, i32* nonnull %arraydecay2.i.i, i32 6) #3
  call fastcc void @RND512P(i8* nonnull %29, i32* nonnull %arraydecay4.i.i, i32 7) #3
  call fastcc void @RND512P(i8* nonnull %30, i32* nonnull %arraydecay2.i.i, i32 8) #3
  call fastcc void @RND512P(i8* nonnull %29, i32* nonnull %arraydecay.i.i, i32 9) #3
  %31 = load i32, i32* %arraydecay.i.i, align 16, !tbaa !2
  %arrayidx26.i.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 0, i32 0
  %32 = load i32, i32* %arrayidx26.i.i, align 4, !tbaa !2
  %xor.i.i = xor i32 %32, %31
  store i32 %xor.i.i, i32* %arrayidx26.i.i, align 4, !tbaa !2
  %arrayidx24.1.i.i = getelementptr inbounds [16 x i32], [16 x i32]* %temp.i.i, i32 0, i32 1
  %33 = load i32, i32* %arrayidx24.1.i.i, align 4, !tbaa !2
  %arrayidx26.1.i.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 0, i32 1
  %34 = load i32, i32* %arrayidx26.1.i.i, align 4, !tbaa !2
  %xor.1.i.i = xor i32 %34, %33
  store i32 %xor.1.i.i, i32* %arrayidx26.1.i.i, align 4, !tbaa !2
  %arrayidx24.2.i.i = getelementptr inbounds [16 x i32], [16 x i32]* %temp.i.i, i32 0, i32 2
  %35 = load i32, i32* %arrayidx24.2.i.i, align 8, !tbaa !2
  %arrayidx26.2.i.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 0, i32 2
  %36 = load i32, i32* %arrayidx26.2.i.i, align 4, !tbaa !2
  %xor.2.i.i = xor i32 %36, %35
  store i32 %xor.2.i.i, i32* %arrayidx26.2.i.i, align 4, !tbaa !2
  %arrayidx24.3.i.i = getelementptr inbounds [16 x i32], [16 x i32]* %temp.i.i, i32 0, i32 3
  %37 = load i32, i32* %arrayidx24.3.i.i, align 4, !tbaa !2
  %arrayidx26.3.i.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 0, i32 3
  %38 = load i32, i32* %arrayidx26.3.i.i, align 4, !tbaa !2
  %xor.3.i.i = xor i32 %38, %37
  store i32 %xor.3.i.i, i32* %arrayidx26.3.i.i, align 4, !tbaa !2
  %arrayidx24.4.i.i = getelementptr inbounds [16 x i32], [16 x i32]* %temp.i.i, i32 0, i32 4
  %39 = load i32, i32* %arrayidx24.4.i.i, align 16, !tbaa !2
  %arrayidx26.4.i.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 0, i32 4
  %40 = load i32, i32* %arrayidx26.4.i.i, align 4, !tbaa !2
  %xor.4.i.i = xor i32 %40, %39
  store i32 %xor.4.i.i, i32* %arrayidx26.4.i.i, align 4, !tbaa !2
  %arrayidx24.5.i.i = getelementptr inbounds [16 x i32], [16 x i32]* %temp.i.i, i32 0, i32 5
  %41 = load i32, i32* %arrayidx24.5.i.i, align 4, !tbaa !2
  %arrayidx26.5.i.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 0, i32 5
  %42 = load i32, i32* %arrayidx26.5.i.i, align 4, !tbaa !2
  %xor.5.i.i = xor i32 %42, %41
  store i32 %xor.5.i.i, i32* %arrayidx26.5.i.i, align 4, !tbaa !2
  %arrayidx24.6.i.i = getelementptr inbounds [16 x i32], [16 x i32]* %temp.i.i, i32 0, i32 6
  %43 = load i32, i32* %arrayidx24.6.i.i, align 8, !tbaa !2
  %arrayidx26.6.i.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 0, i32 6
  %44 = load i32, i32* %arrayidx26.6.i.i, align 4, !tbaa !2
  %xor.6.i.i = xor i32 %44, %43
  store i32 %xor.6.i.i, i32* %arrayidx26.6.i.i, align 4, !tbaa !2
  %arrayidx24.7.i.i = getelementptr inbounds [16 x i32], [16 x i32]* %temp.i.i, i32 0, i32 7
  %45 = load i32, i32* %arrayidx24.7.i.i, align 4, !tbaa !2
  %arrayidx26.7.i.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 0, i32 7
  %46 = load i32, i32* %arrayidx26.7.i.i, align 4, !tbaa !2
  %xor.7.i.i = xor i32 %46, %45
  store i32 %xor.7.i.i, i32* %arrayidx26.7.i.i, align 4, !tbaa !2
  %arrayidx24.8.i.i = getelementptr inbounds [16 x i32], [16 x i32]* %temp.i.i, i32 0, i32 8
  %47 = load i32, i32* %arrayidx24.8.i.i, align 16, !tbaa !2
  %arrayidx26.8.i.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 0, i32 8
  %48 = load i32, i32* %arrayidx26.8.i.i, align 4, !tbaa !2
  %xor.8.i.i = xor i32 %48, %47
  store i32 %xor.8.i.i, i32* %arrayidx26.8.i.i, align 4, !tbaa !2
  %arrayidx24.9.i.i = getelementptr inbounds [16 x i32], [16 x i32]* %temp.i.i, i32 0, i32 9
  %49 = load i32, i32* %arrayidx24.9.i.i, align 4, !tbaa !2
  %arrayidx26.9.i.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 0, i32 9
  %50 = load i32, i32* %arrayidx26.9.i.i, align 4, !tbaa !2
  %xor.9.i.i = xor i32 %50, %49
  store i32 %xor.9.i.i, i32* %arrayidx26.9.i.i, align 4, !tbaa !2
  %arrayidx24.10.i.i = getelementptr inbounds [16 x i32], [16 x i32]* %temp.i.i, i32 0, i32 10
  %51 = load i32, i32* %arrayidx24.10.i.i, align 8, !tbaa !2
  %arrayidx26.10.i.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 0, i32 10
  %52 = load i32, i32* %arrayidx26.10.i.i, align 4, !tbaa !2
  %xor.10.i.i = xor i32 %52, %51
  store i32 %xor.10.i.i, i32* %arrayidx26.10.i.i, align 4, !tbaa !2
  %arrayidx24.11.i.i = getelementptr inbounds [16 x i32], [16 x i32]* %temp.i.i, i32 0, i32 11
  %53 = load i32, i32* %arrayidx24.11.i.i, align 4, !tbaa !2
  %arrayidx26.11.i.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 0, i32 11
  %54 = load i32, i32* %arrayidx26.11.i.i, align 4, !tbaa !2
  %xor.11.i.i = xor i32 %54, %53
  store i32 %xor.11.i.i, i32* %arrayidx26.11.i.i, align 4, !tbaa !2
  %arrayidx24.12.i.i = getelementptr inbounds [16 x i32], [16 x i32]* %temp.i.i, i32 0, i32 12
  %55 = load i32, i32* %arrayidx24.12.i.i, align 16, !tbaa !2
  %arrayidx26.12.i.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 0, i32 12
  %56 = load i32, i32* %arrayidx26.12.i.i, align 4, !tbaa !2
  %xor.12.i.i = xor i32 %56, %55
  store i32 %xor.12.i.i, i32* %arrayidx26.12.i.i, align 4, !tbaa !2
  %arrayidx24.13.i.i = getelementptr inbounds [16 x i32], [16 x i32]* %temp.i.i, i32 0, i32 13
  %57 = load i32, i32* %arrayidx24.13.i.i, align 4, !tbaa !2
  %arrayidx26.13.i.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 0, i32 13
  %58 = load i32, i32* %arrayidx26.13.i.i, align 4, !tbaa !2
  %xor.13.i.i = xor i32 %58, %57
  store i32 %xor.13.i.i, i32* %arrayidx26.13.i.i, align 4, !tbaa !2
  %arrayidx24.14.i.i = getelementptr inbounds [16 x i32], [16 x i32]* %temp.i.i, i32 0, i32 14
  %59 = load i32, i32* %arrayidx24.14.i.i, align 8, !tbaa !2
  %arrayidx26.14.i.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %context, i32 0, i32 0, i32 14
  %60 = load i32, i32* %arrayidx26.14.i.i, align 4, !tbaa !2
  %xor.14.i.i = xor i32 %60, %59
  store i32 %xor.14.i.i, i32* %arrayidx26.14.i.i, align 4, !tbaa !2
  %arrayidx24.15.i.i = getelementptr inbounds [16 x i32], [16 x i32]* %temp.i.i, i32 0, i32 15
  %61 = load i32, i32* %arrayidx24.15.i.i, align 4, !tbaa !2
  %62 = load i32, i32* %arrayidx2.i, align 4, !tbaa !2
  %xor.15.i.i = xor i32 %62, %61
  store i32 %xor.15.i.i, i32* %arrayidx2.i, align 4, !tbaa !2
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %30) #3
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %29) #3
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %28) #3
  %63 = trunc i32 %xor.8.i.i to i8
  store i8 %63, i8* %hashval, align 1, !tbaa !11
  %64 = lshr i32 %xor.8.i.i, 8
  %65 = trunc i32 %64 to i8
  %arrayidx84.1.i = getelementptr inbounds i8, i8* %hashval, i32 1
  store i8 %65, i8* %arrayidx84.1.i, align 1, !tbaa !11
  %66 = lshr i32 %xor.8.i.i, 16
  %67 = trunc i32 %66 to i8
  %arrayidx84.2.i = getelementptr inbounds i8, i8* %hashval, i32 2
  store i8 %67, i8* %arrayidx84.2.i, align 1, !tbaa !11
  %68 = lshr i32 %xor.8.i.i, 24
  %69 = trunc i32 %68 to i8
  %arrayidx84.3.i = getelementptr inbounds i8, i8* %hashval, i32 3
  store i8 %69, i8* %arrayidx84.3.i, align 1, !tbaa !11
  %70 = trunc i32 %xor.9.i.i to i8
  %arrayidx84.4.i = getelementptr inbounds i8, i8* %hashval, i32 4
  store i8 %70, i8* %arrayidx84.4.i, align 1, !tbaa !11
  %71 = lshr i32 %xor.9.i.i, 8
  %72 = trunc i32 %71 to i8
  %arrayidx84.5.i = getelementptr inbounds i8, i8* %hashval, i32 5
  store i8 %72, i8* %arrayidx84.5.i, align 1, !tbaa !11
  %73 = lshr i32 %xor.9.i.i, 16
  %74 = trunc i32 %73 to i8
  %arrayidx84.6.i = getelementptr inbounds i8, i8* %hashval, i32 6
  store i8 %74, i8* %arrayidx84.6.i, align 1, !tbaa !11
  %75 = lshr i32 %xor.9.i.i, 24
  %76 = trunc i32 %75 to i8
  %arrayidx84.7.i = getelementptr inbounds i8, i8* %hashval, i32 7
  store i8 %76, i8* %arrayidx84.7.i, align 1, !tbaa !11
  %77 = trunc i32 %xor.10.i.i to i8
  %arrayidx84.8.i = getelementptr inbounds i8, i8* %hashval, i32 8
  store i8 %77, i8* %arrayidx84.8.i, align 1, !tbaa !11
  %78 = lshr i32 %xor.10.i.i, 8
  %79 = trunc i32 %78 to i8
  %arrayidx84.9.i = getelementptr inbounds i8, i8* %hashval, i32 9
  store i8 %79, i8* %arrayidx84.9.i, align 1, !tbaa !11
  %80 = lshr i32 %xor.10.i.i, 16
  %81 = trunc i32 %80 to i8
  %arrayidx84.10.i = getelementptr inbounds i8, i8* %hashval, i32 10
  store i8 %81, i8* %arrayidx84.10.i, align 1, !tbaa !11
  %82 = lshr i32 %xor.10.i.i, 24
  %83 = trunc i32 %82 to i8
  %arrayidx84.11.i = getelementptr inbounds i8, i8* %hashval, i32 11
  store i8 %83, i8* %arrayidx84.11.i, align 1, !tbaa !11
  %84 = trunc i32 %xor.11.i.i to i8
  %arrayidx84.12.i = getelementptr inbounds i8, i8* %hashval, i32 12
  store i8 %84, i8* %arrayidx84.12.i, align 1, !tbaa !11
  %85 = lshr i32 %xor.11.i.i, 8
  %86 = trunc i32 %85 to i8
  %arrayidx84.13.i = getelementptr inbounds i8, i8* %hashval, i32 13
  store i8 %86, i8* %arrayidx84.13.i, align 1, !tbaa !11
  %87 = lshr i32 %xor.11.i.i, 16
  %88 = trunc i32 %87 to i8
  %arrayidx84.14.i = getelementptr inbounds i8, i8* %hashval, i32 14
  store i8 %88, i8* %arrayidx84.14.i, align 1, !tbaa !11
  %89 = lshr i32 %xor.11.i.i, 24
  %90 = trunc i32 %89 to i8
  %arrayidx84.15.i = getelementptr inbounds i8, i8* %hashval, i32 15
  store i8 %90, i8* %arrayidx84.15.i, align 1, !tbaa !11
  %91 = trunc i32 %xor.12.i.i to i8
  %arrayidx84.16.i = getelementptr inbounds i8, i8* %hashval, i32 16
  store i8 %91, i8* %arrayidx84.16.i, align 1, !tbaa !11
  %arrayidx83.17.i = getelementptr inbounds i8, i8* %0, i32 49
  %92 = load i8, i8* %arrayidx83.17.i, align 1, !tbaa !11
  %arrayidx84.17.i = getelementptr inbounds i8, i8* %hashval, i32 17
  store i8 %92, i8* %arrayidx84.17.i, align 1, !tbaa !11
  %arrayidx83.18.i = getelementptr inbounds i8, i8* %0, i32 50
  %93 = load i8, i8* %arrayidx83.18.i, align 2, !tbaa !11
  %arrayidx84.18.i = getelementptr inbounds i8, i8* %hashval, i32 18
  store i8 %93, i8* %arrayidx84.18.i, align 1, !tbaa !11
  %arrayidx83.19.i = getelementptr inbounds i8, i8* %0, i32 51
  %94 = load i8, i8* %arrayidx83.19.i, align 1, !tbaa !11
  %arrayidx84.19.i = getelementptr inbounds i8, i8* %hashval, i32 19
  store i8 %94, i8* %arrayidx84.19.i, align 1, !tbaa !11
  %95 = bitcast i32* %arrayidx26.13.i.i to i8*
  %96 = load i8, i8* %95, align 4, !tbaa !11
  %arrayidx84.20.i = getelementptr inbounds i8, i8* %hashval, i32 20
  store i8 %96, i8* %arrayidx84.20.i, align 1, !tbaa !11
  %arrayidx83.21.i = getelementptr inbounds i8, i8* %0, i32 53
  %97 = load i8, i8* %arrayidx83.21.i, align 1, !tbaa !11
  %arrayidx84.21.i = getelementptr inbounds i8, i8* %hashval, i32 21
  store i8 %97, i8* %arrayidx84.21.i, align 1, !tbaa !11
  %arrayidx83.22.i = getelementptr inbounds i8, i8* %0, i32 54
  %98 = load i8, i8* %arrayidx83.22.i, align 2, !tbaa !11
  %arrayidx84.22.i = getelementptr inbounds i8, i8* %hashval, i32 22
  store i8 %98, i8* %arrayidx84.22.i, align 1, !tbaa !11
  %arrayidx83.23.i = getelementptr inbounds i8, i8* %0, i32 55
  %99 = load i8, i8* %arrayidx83.23.i, align 1, !tbaa !11
  %arrayidx84.23.i = getelementptr inbounds i8, i8* %hashval, i32 23
  store i8 %99, i8* %arrayidx84.23.i, align 1, !tbaa !11
  %100 = bitcast i32* %arrayidx26.14.i.i to i8*
  %101 = load i8, i8* %100, align 4, !tbaa !11
  %arrayidx84.24.i = getelementptr inbounds i8, i8* %hashval, i32 24
  store i8 %101, i8* %arrayidx84.24.i, align 1, !tbaa !11
  %arrayidx83.25.i = getelementptr inbounds i8, i8* %0, i32 57
  %102 = load i8, i8* %arrayidx83.25.i, align 1, !tbaa !11
  %arrayidx84.25.i = getelementptr inbounds i8, i8* %hashval, i32 25
  store i8 %102, i8* %arrayidx84.25.i, align 1, !tbaa !11
  %arrayidx83.26.i = getelementptr inbounds i8, i8* %0, i32 58
  %103 = load i8, i8* %arrayidx83.26.i, align 2, !tbaa !11
  %arrayidx84.26.i = getelementptr inbounds i8, i8* %hashval, i32 26
  store i8 %103, i8* %arrayidx84.26.i, align 1, !tbaa !11
  %arrayidx83.27.i = getelementptr inbounds i8, i8* %0, i32 59
  %104 = load i8, i8* %arrayidx83.27.i, align 1, !tbaa !11
  %arrayidx84.27.i = getelementptr inbounds i8, i8* %hashval, i32 27
  store i8 %104, i8* %arrayidx84.27.i, align 1, !tbaa !11
  %105 = bitcast i32* %arrayidx2.i to i8*
  %106 = load i8, i8* %105, align 4, !tbaa !11
  %arrayidx84.28.i = getelementptr inbounds i8, i8* %hashval, i32 28
  store i8 %106, i8* %arrayidx84.28.i, align 1, !tbaa !11
  %arrayidx83.29.i = getelementptr inbounds i8, i8* %0, i32 61
  %107 = load i8, i8* %arrayidx83.29.i, align 1, !tbaa !11
  %arrayidx84.29.i = getelementptr inbounds i8, i8* %hashval, i32 29
  store i8 %107, i8* %arrayidx84.29.i, align 1, !tbaa !11
  %arrayidx83.30.i = getelementptr inbounds i8, i8* %0, i32 62
  %108 = load i8, i8* %arrayidx83.30.i, align 2, !tbaa !11
  %arrayidx84.30.i = getelementptr inbounds i8, i8* %hashval, i32 30
  store i8 %108, i8* %arrayidx84.30.i, align 1, !tbaa !11
  %arrayidx83.31.i = getelementptr inbounds i8, i8* %0, i32 63
  %109 = load i8, i8* %arrayidx83.31.i, align 1, !tbaa !11
  %arrayidx84.31.i = getelementptr inbounds i8, i8* %hashval, i32 31
  store i8 %109, i8* %arrayidx84.31.i, align 1, !tbaa !11
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %0) #3
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind
define internal fastcc void @Transform(%struct.groestlHashState* nocapture %ctx, i8* nocapture readonly %input, i32 %msglen) unnamed_addr #0 {
entry:
  %Ptmp.i = alloca [16 x i32], align 16
  %Qtmp.i = alloca [16 x i32], align 16
  %y.i = alloca [16 x i32], align 16
  %z.i = alloca [16 x i32], align 16
  %cmp9 = icmp sgt i32 %msglen, 63
  br i1 %cmp9, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %arraydecay = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %ctx, i32 0, i32 0, i32 0
  %0 = bitcast [16 x i32]* %z.i to i8*
  %1 = bitcast [16 x i32]* %Ptmp.i to i8*
  %2 = bitcast [16 x i32]* %Qtmp.i to i8*
  %3 = bitcast [16 x i32]* %y.i to i8*
  %arrayidx4.i = getelementptr inbounds [16 x i32], [16 x i32]* %Ptmp.i, i32 0, i32 0
  %arrayidx2.1.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %ctx, i32 0, i32 0, i32 1
  %arrayidx4.1.i = getelementptr inbounds [16 x i32], [16 x i32]* %Ptmp.i, i32 0, i32 1
  %arrayidx2.2.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %ctx, i32 0, i32 0, i32 2
  %arrayidx4.2.i = getelementptr inbounds [16 x i32], [16 x i32]* %Ptmp.i, i32 0, i32 2
  %arrayidx2.3.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %ctx, i32 0, i32 0, i32 3
  %arrayidx4.3.i = getelementptr inbounds [16 x i32], [16 x i32]* %Ptmp.i, i32 0, i32 3
  %arrayidx2.4.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %ctx, i32 0, i32 0, i32 4
  %arrayidx4.4.i = getelementptr inbounds [16 x i32], [16 x i32]* %Ptmp.i, i32 0, i32 4
  %arrayidx2.5.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %ctx, i32 0, i32 0, i32 5
  %arrayidx4.5.i = getelementptr inbounds [16 x i32], [16 x i32]* %Ptmp.i, i32 0, i32 5
  %arrayidx2.6.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %ctx, i32 0, i32 0, i32 6
  %arrayidx4.6.i = getelementptr inbounds [16 x i32], [16 x i32]* %Ptmp.i, i32 0, i32 6
  %arrayidx2.7.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %ctx, i32 0, i32 0, i32 7
  %arrayidx4.7.i = getelementptr inbounds [16 x i32], [16 x i32]* %Ptmp.i, i32 0, i32 7
  %arrayidx2.8.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %ctx, i32 0, i32 0, i32 8
  %arrayidx4.8.i = getelementptr inbounds [16 x i32], [16 x i32]* %Ptmp.i, i32 0, i32 8
  %arrayidx2.9.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %ctx, i32 0, i32 0, i32 9
  %arrayidx4.9.i = getelementptr inbounds [16 x i32], [16 x i32]* %Ptmp.i, i32 0, i32 9
  %arrayidx2.10.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %ctx, i32 0, i32 0, i32 10
  %arrayidx4.10.i = getelementptr inbounds [16 x i32], [16 x i32]* %Ptmp.i, i32 0, i32 10
  %arrayidx2.11.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %ctx, i32 0, i32 0, i32 11
  %arrayidx4.11.i = getelementptr inbounds [16 x i32], [16 x i32]* %Ptmp.i, i32 0, i32 11
  %arrayidx2.12.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %ctx, i32 0, i32 0, i32 12
  %arrayidx4.12.i = getelementptr inbounds [16 x i32], [16 x i32]* %Ptmp.i, i32 0, i32 12
  %arrayidx2.13.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %ctx, i32 0, i32 0, i32 13
  %arrayidx4.13.i = getelementptr inbounds [16 x i32], [16 x i32]* %Ptmp.i, i32 0, i32 13
  %arrayidx2.14.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %ctx, i32 0, i32 0, i32 14
  %arrayidx4.14.i = getelementptr inbounds [16 x i32], [16 x i32]* %Ptmp.i, i32 0, i32 14
  %arrayidx2.15.i = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %ctx, i32 0, i32 0, i32 15
  %arrayidx4.15.i = getelementptr inbounds [16 x i32], [16 x i32]* %Ptmp.i, i32 0, i32 15
  %arraydecay.i = getelementptr inbounds [16 x i32], [16 x i32]* %z.i, i32 0, i32 0
  %arraydecay5.i = getelementptr inbounds [16 x i32], [16 x i32]* %y.i, i32 0, i32 0
  %arraydecay23.i = getelementptr inbounds [16 x i32], [16 x i32]* %Qtmp.i, i32 0, i32 0
  %arrayidx48.1.i = getelementptr inbounds [16 x i32], [16 x i32]* %Qtmp.i, i32 0, i32 1
  %arrayidx48.2.i = getelementptr inbounds [16 x i32], [16 x i32]* %Qtmp.i, i32 0, i32 2
  %arrayidx48.3.i = getelementptr inbounds [16 x i32], [16 x i32]* %Qtmp.i, i32 0, i32 3
  %arrayidx48.4.i = getelementptr inbounds [16 x i32], [16 x i32]* %Qtmp.i, i32 0, i32 4
  %arrayidx48.5.i = getelementptr inbounds [16 x i32], [16 x i32]* %Qtmp.i, i32 0, i32 5
  %arrayidx48.6.i = getelementptr inbounds [16 x i32], [16 x i32]* %Qtmp.i, i32 0, i32 6
  %arrayidx48.7.i = getelementptr inbounds [16 x i32], [16 x i32]* %Qtmp.i, i32 0, i32 7
  %arrayidx48.8.i = getelementptr inbounds [16 x i32], [16 x i32]* %Qtmp.i, i32 0, i32 8
  %arrayidx48.9.i = getelementptr inbounds [16 x i32], [16 x i32]* %Qtmp.i, i32 0, i32 9
  %arrayidx48.10.i = getelementptr inbounds [16 x i32], [16 x i32]* %Qtmp.i, i32 0, i32 10
  %arrayidx48.11.i = getelementptr inbounds [16 x i32], [16 x i32]* %Qtmp.i, i32 0, i32 11
  %arrayidx48.12.i = getelementptr inbounds [16 x i32], [16 x i32]* %Qtmp.i, i32 0, i32 12
  %arrayidx48.13.i = getelementptr inbounds [16 x i32], [16 x i32]* %Qtmp.i, i32 0, i32 13
  %arrayidx48.14.i = getelementptr inbounds [16 x i32], [16 x i32]* %Qtmp.i, i32 0, i32 14
  %arrayidx48.15.i = getelementptr inbounds [16 x i32], [16 x i32]* %Qtmp.i, i32 0, i32 15
  %block_counter1 = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %ctx, i32 0, i32 1
  %block_counter2 = getelementptr inbounds %struct.groestlHashState, %struct.groestlHashState* %ctx, i32 0, i32 2
  %.pre = load i32, i32* %arrayidx2.1.i, align 4, !tbaa !2
  %.pre12 = load i32, i32* %arrayidx2.2.i, align 4, !tbaa !2
  %.pre13 = load i32, i32* %arrayidx2.3.i, align 4, !tbaa !2
  %.pre14 = load i32, i32* %arrayidx2.4.i, align 4, !tbaa !2
  %.pre15 = load i32, i32* %arrayidx2.5.i, align 4, !tbaa !2
  %.pre16 = load i32, i32* %arrayidx2.6.i, align 4, !tbaa !2
  %.pre17 = load i32, i32* %arrayidx2.7.i, align 4, !tbaa !2
  %.pre18 = load i32, i32* %arrayidx2.8.i, align 4, !tbaa !2
  %.pre19 = load i32, i32* %arrayidx2.9.i, align 4, !tbaa !2
  %.pre20 = load i32, i32* %arrayidx2.10.i, align 4, !tbaa !2
  %.pre21 = load i32, i32* %arrayidx2.11.i, align 4, !tbaa !2
  %.pre22 = load i32, i32* %arrayidx2.12.i, align 4, !tbaa !2
  %.pre23 = load i32, i32* %arrayidx2.13.i, align 4, !tbaa !2
  %.pre24 = load i32, i32* %arrayidx2.14.i, align 4, !tbaa !2
  %.pre25 = load i32, i32* %arrayidx2.15.i, align 4, !tbaa !2
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %4 = phi i32 [ %.pre25, %for.body.lr.ph ], [ %xor51.15.i, %for.inc ]
  %5 = phi i32 [ %.pre24, %for.body.lr.ph ], [ %xor51.14.i, %for.inc ]
  %6 = phi i32 [ %.pre23, %for.body.lr.ph ], [ %xor51.13.i, %for.inc ]
  %7 = phi i32 [ %.pre22, %for.body.lr.ph ], [ %xor51.12.i, %for.inc ]
  %8 = phi i32 [ %.pre21, %for.body.lr.ph ], [ %xor51.11.i, %for.inc ]
  %9 = phi i32 [ %.pre20, %for.body.lr.ph ], [ %xor51.10.i, %for.inc ]
  %10 = phi i32 [ %.pre19, %for.body.lr.ph ], [ %xor51.9.i, %for.inc ]
  %11 = phi i32 [ %.pre18, %for.body.lr.ph ], [ %xor51.8.i, %for.inc ]
  %12 = phi i32 [ %.pre17, %for.body.lr.ph ], [ %xor51.7.i, %for.inc ]
  %13 = phi i32 [ %.pre16, %for.body.lr.ph ], [ %xor51.6.i, %for.inc ]
  %14 = phi i32 [ %.pre15, %for.body.lr.ph ], [ %xor51.5.i, %for.inc ]
  %15 = phi i32 [ %.pre14, %for.body.lr.ph ], [ %xor51.4.i, %for.inc ]
  %16 = phi i32 [ %.pre13, %for.body.lr.ph ], [ %xor51.3.i, %for.inc ]
  %17 = phi i32 [ %.pre12, %for.body.lr.ph ], [ %xor51.2.i, %for.inc ]
  %18 = phi i32 [ %.pre, %for.body.lr.ph ], [ %xor51.1.i, %for.inc ]
  %msglen.addr.011 = phi i32 [ %msglen, %for.body.lr.ph ], [ %sub, %for.inc ]
  %input.addr.010 = phi i8* [ %input, %for.body.lr.ph ], [ %add.ptr, %for.inc ]
  %19 = bitcast i8* %input.addr.010 to i32*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %1) #3
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %2) #3
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %3) #3
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %0) #3
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 dereferenceable(64) %0, i8* nonnull align 4 dereferenceable(64) %input.addr.010, i32 64, i1 false) #3
  %20 = load i32, i32* %19, align 4, !tbaa !2
  %21 = load i32, i32* %arraydecay, align 4, !tbaa !2
  %xor.i = xor i32 %21, %20
  store i32 %xor.i, i32* %arrayidx4.i, align 16, !tbaa !2
  %arrayidx.1.i = getelementptr inbounds i8, i8* %input.addr.010, i32 4
  %22 = bitcast i8* %arrayidx.1.i to i32*
  %23 = load i32, i32* %22, align 4, !tbaa !2
  %xor.1.i = xor i32 %18, %23
  store i32 %xor.1.i, i32* %arrayidx4.1.i, align 4, !tbaa !2
  %arrayidx.2.i = getelementptr inbounds i8, i8* %input.addr.010, i32 8
  %24 = bitcast i8* %arrayidx.2.i to i32*
  %25 = load i32, i32* %24, align 4, !tbaa !2
  %xor.2.i = xor i32 %17, %25
  store i32 %xor.2.i, i32* %arrayidx4.2.i, align 8, !tbaa !2
  %arrayidx.3.i = getelementptr inbounds i8, i8* %input.addr.010, i32 12
  %26 = bitcast i8* %arrayidx.3.i to i32*
  %27 = load i32, i32* %26, align 4, !tbaa !2
  %xor.3.i = xor i32 %16, %27
  store i32 %xor.3.i, i32* %arrayidx4.3.i, align 4, !tbaa !2
  %arrayidx.4.i = getelementptr inbounds i8, i8* %input.addr.010, i32 16
  %28 = bitcast i8* %arrayidx.4.i to i32*
  %29 = load i32, i32* %28, align 4, !tbaa !2
  %xor.4.i = xor i32 %15, %29
  store i32 %xor.4.i, i32* %arrayidx4.4.i, align 16, !tbaa !2
  %arrayidx.5.i = getelementptr inbounds i8, i8* %input.addr.010, i32 20
  %30 = bitcast i8* %arrayidx.5.i to i32*
  %31 = load i32, i32* %30, align 4, !tbaa !2
  %xor.5.i = xor i32 %14, %31
  store i32 %xor.5.i, i32* %arrayidx4.5.i, align 4, !tbaa !2
  %arrayidx.6.i = getelementptr inbounds i8, i8* %input.addr.010, i32 24
  %32 = bitcast i8* %arrayidx.6.i to i32*
  %33 = load i32, i32* %32, align 4, !tbaa !2
  %xor.6.i = xor i32 %13, %33
  store i32 %xor.6.i, i32* %arrayidx4.6.i, align 8, !tbaa !2
  %arrayidx.7.i = getelementptr inbounds i8, i8* %input.addr.010, i32 28
  %34 = bitcast i8* %arrayidx.7.i to i32*
  %35 = load i32, i32* %34, align 4, !tbaa !2
  %xor.7.i = xor i32 %12, %35
  store i32 %xor.7.i, i32* %arrayidx4.7.i, align 4, !tbaa !2
  %arrayidx.8.i = getelementptr inbounds i8, i8* %input.addr.010, i32 32
  %36 = bitcast i8* %arrayidx.8.i to i32*
  %37 = load i32, i32* %36, align 4, !tbaa !2
  %xor.8.i = xor i32 %11, %37
  store i32 %xor.8.i, i32* %arrayidx4.8.i, align 16, !tbaa !2
  %arrayidx.9.i = getelementptr inbounds i8, i8* %input.addr.010, i32 36
  %38 = bitcast i8* %arrayidx.9.i to i32*
  %39 = load i32, i32* %38, align 4, !tbaa !2
  %xor.9.i = xor i32 %10, %39
  store i32 %xor.9.i, i32* %arrayidx4.9.i, align 4, !tbaa !2
  %arrayidx.10.i = getelementptr inbounds i8, i8* %input.addr.010, i32 40
  %40 = bitcast i8* %arrayidx.10.i to i32*
  %41 = load i32, i32* %40, align 4, !tbaa !2
  %xor.10.i = xor i32 %9, %41
  store i32 %xor.10.i, i32* %arrayidx4.10.i, align 8, !tbaa !2
  %arrayidx.11.i = getelementptr inbounds i8, i8* %input.addr.010, i32 44
  %42 = bitcast i8* %arrayidx.11.i to i32*
  %43 = load i32, i32* %42, align 4, !tbaa !2
  %xor.11.i = xor i32 %8, %43
  store i32 %xor.11.i, i32* %arrayidx4.11.i, align 4, !tbaa !2
  %arrayidx.12.i = getelementptr inbounds i8, i8* %input.addr.010, i32 48
  %44 = bitcast i8* %arrayidx.12.i to i32*
  %45 = load i32, i32* %44, align 4, !tbaa !2
  %xor.12.i = xor i32 %7, %45
  store i32 %xor.12.i, i32* %arrayidx4.12.i, align 16, !tbaa !2
  %arrayidx.13.i = getelementptr inbounds i8, i8* %input.addr.010, i32 52
  %46 = bitcast i8* %arrayidx.13.i to i32*
  %47 = load i32, i32* %46, align 4, !tbaa !2
  %xor.13.i = xor i32 %6, %47
  store i32 %xor.13.i, i32* %arrayidx4.13.i, align 4, !tbaa !2
  %arrayidx.14.i = getelementptr inbounds i8, i8* %input.addr.010, i32 56
  %48 = bitcast i8* %arrayidx.14.i to i32*
  %49 = load i32, i32* %48, align 4, !tbaa !2
  %xor.14.i = xor i32 %5, %49
  store i32 %xor.14.i, i32* %arrayidx4.14.i, align 8, !tbaa !2
  %arrayidx.15.i = getelementptr inbounds i8, i8* %input.addr.010, i32 60
  %50 = bitcast i8* %arrayidx.15.i to i32*
  %51 = load i32, i32* %50, align 4, !tbaa !2
  %xor.15.i = xor i32 %4, %51
  store i32 %xor.15.i, i32* %arrayidx4.15.i, align 4, !tbaa !2
  call fastcc void @RND512Q(i8* nonnull %0, i32* nonnull %arraydecay5.i, i32 0) #3
  call fastcc void @RND512Q(i8* nonnull %3, i32* nonnull %arraydecay.i, i32 16777216) #3
  call fastcc void @RND512Q(i8* nonnull %0, i32* nonnull %arraydecay5.i, i32 33554432) #3
  call fastcc void @RND512Q(i8* nonnull %3, i32* nonnull %arraydecay.i, i32 50331648) #3
  call fastcc void @RND512Q(i8* nonnull %0, i32* nonnull %arraydecay5.i, i32 67108864) #3
  call fastcc void @RND512Q(i8* nonnull %3, i32* nonnull %arraydecay.i, i32 83886080) #3
  call fastcc void @RND512Q(i8* nonnull %0, i32* nonnull %arraydecay5.i, i32 100663296) #3
  call fastcc void @RND512Q(i8* nonnull %3, i32* nonnull %arraydecay.i, i32 117440512) #3
  call fastcc void @RND512Q(i8* nonnull %0, i32* nonnull %arraydecay5.i, i32 134217728) #3
  call fastcc void @RND512Q(i8* nonnull %3, i32* nonnull %arraydecay23.i, i32 150994944) #3
  call fastcc void @RND512P(i8* nonnull %1, i32* nonnull %arraydecay5.i, i32 0) #3
  call fastcc void @RND512P(i8* nonnull %3, i32* nonnull %arraydecay.i, i32 1) #3
  call fastcc void @RND512P(i8* nonnull %0, i32* nonnull %arraydecay5.i, i32 2) #3
  call fastcc void @RND512P(i8* nonnull %3, i32* nonnull %arraydecay.i, i32 3) #3
  call fastcc void @RND512P(i8* nonnull %0, i32* nonnull %arraydecay5.i, i32 4) #3
  call fastcc void @RND512P(i8* nonnull %3, i32* nonnull %arraydecay.i, i32 5) #3
  call fastcc void @RND512P(i8* nonnull %0, i32* nonnull %arraydecay5.i, i32 6) #3
  call fastcc void @RND512P(i8* nonnull %3, i32* nonnull %arraydecay.i, i32 7) #3
  call fastcc void @RND512P(i8* nonnull %0, i32* nonnull %arraydecay5.i, i32 8) #3
  call fastcc void @RND512P(i8* nonnull %3, i32* nonnull %arrayidx4.i, i32 9) #3
  %52 = load i32, i32* %arrayidx4.i, align 16, !tbaa !2
  %53 = load i32, i32* %arraydecay23.i, align 16, !tbaa !2
  %xor49.i = xor i32 %53, %52
  %54 = load i32, i32* %arraydecay, align 4, !tbaa !2
  %xor51.i = xor i32 %xor49.i, %54
  store i32 %xor51.i, i32* %arraydecay, align 4, !tbaa !2
  %55 = load i32, i32* %arrayidx4.1.i, align 4, !tbaa !2
  %56 = load i32, i32* %arrayidx48.1.i, align 4, !tbaa !2
  %xor49.1.i = xor i32 %56, %55
  %57 = load i32, i32* %arrayidx2.1.i, align 4, !tbaa !2
  %xor51.1.i = xor i32 %xor49.1.i, %57
  store i32 %xor51.1.i, i32* %arrayidx2.1.i, align 4, !tbaa !2
  %58 = load i32, i32* %arrayidx4.2.i, align 8, !tbaa !2
  %59 = load i32, i32* %arrayidx48.2.i, align 8, !tbaa !2
  %xor49.2.i = xor i32 %59, %58
  %60 = load i32, i32* %arrayidx2.2.i, align 4, !tbaa !2
  %xor51.2.i = xor i32 %xor49.2.i, %60
  store i32 %xor51.2.i, i32* %arrayidx2.2.i, align 4, !tbaa !2
  %61 = load i32, i32* %arrayidx4.3.i, align 4, !tbaa !2
  %62 = load i32, i32* %arrayidx48.3.i, align 4, !tbaa !2
  %xor49.3.i = xor i32 %62, %61
  %63 = load i32, i32* %arrayidx2.3.i, align 4, !tbaa !2
  %xor51.3.i = xor i32 %xor49.3.i, %63
  store i32 %xor51.3.i, i32* %arrayidx2.3.i, align 4, !tbaa !2
  %64 = load i32, i32* %arrayidx4.4.i, align 16, !tbaa !2
  %65 = load i32, i32* %arrayidx48.4.i, align 16, !tbaa !2
  %xor49.4.i = xor i32 %65, %64
  %66 = load i32, i32* %arrayidx2.4.i, align 4, !tbaa !2
  %xor51.4.i = xor i32 %xor49.4.i, %66
  store i32 %xor51.4.i, i32* %arrayidx2.4.i, align 4, !tbaa !2
  %67 = load i32, i32* %arrayidx4.5.i, align 4, !tbaa !2
  %68 = load i32, i32* %arrayidx48.5.i, align 4, !tbaa !2
  %xor49.5.i = xor i32 %68, %67
  %69 = load i32, i32* %arrayidx2.5.i, align 4, !tbaa !2
  %xor51.5.i = xor i32 %xor49.5.i, %69
  store i32 %xor51.5.i, i32* %arrayidx2.5.i, align 4, !tbaa !2
  %70 = load i32, i32* %arrayidx4.6.i, align 8, !tbaa !2
  %71 = load i32, i32* %arrayidx48.6.i, align 8, !tbaa !2
  %xor49.6.i = xor i32 %71, %70
  %72 = load i32, i32* %arrayidx2.6.i, align 4, !tbaa !2
  %xor51.6.i = xor i32 %xor49.6.i, %72
  store i32 %xor51.6.i, i32* %arrayidx2.6.i, align 4, !tbaa !2
  %73 = load i32, i32* %arrayidx4.7.i, align 4, !tbaa !2
  %74 = load i32, i32* %arrayidx48.7.i, align 4, !tbaa !2
  %xor49.7.i = xor i32 %74, %73
  %75 = load i32, i32* %arrayidx2.7.i, align 4, !tbaa !2
  %xor51.7.i = xor i32 %xor49.7.i, %75
  store i32 %xor51.7.i, i32* %arrayidx2.7.i, align 4, !tbaa !2
  %76 = load i32, i32* %arrayidx4.8.i, align 16, !tbaa !2
  %77 = load i32, i32* %arrayidx48.8.i, align 16, !tbaa !2
  %xor49.8.i = xor i32 %77, %76
  %78 = load i32, i32* %arrayidx2.8.i, align 4, !tbaa !2
  %xor51.8.i = xor i32 %xor49.8.i, %78
  store i32 %xor51.8.i, i32* %arrayidx2.8.i, align 4, !tbaa !2
  %79 = load i32, i32* %arrayidx4.9.i, align 4, !tbaa !2
  %80 = load i32, i32* %arrayidx48.9.i, align 4, !tbaa !2
  %xor49.9.i = xor i32 %80, %79
  %81 = load i32, i32* %arrayidx2.9.i, align 4, !tbaa !2
  %xor51.9.i = xor i32 %xor49.9.i, %81
  store i32 %xor51.9.i, i32* %arrayidx2.9.i, align 4, !tbaa !2
  %82 = load i32, i32* %arrayidx4.10.i, align 8, !tbaa !2
  %83 = load i32, i32* %arrayidx48.10.i, align 8, !tbaa !2
  %xor49.10.i = xor i32 %83, %82
  %84 = load i32, i32* %arrayidx2.10.i, align 4, !tbaa !2
  %xor51.10.i = xor i32 %xor49.10.i, %84
  store i32 %xor51.10.i, i32* %arrayidx2.10.i, align 4, !tbaa !2
  %85 = load i32, i32* %arrayidx4.11.i, align 4, !tbaa !2
  %86 = load i32, i32* %arrayidx48.11.i, align 4, !tbaa !2
  %xor49.11.i = xor i32 %86, %85
  %87 = load i32, i32* %arrayidx2.11.i, align 4, !tbaa !2
  %xor51.11.i = xor i32 %xor49.11.i, %87
  store i32 %xor51.11.i, i32* %arrayidx2.11.i, align 4, !tbaa !2
  %88 = load i32, i32* %arrayidx4.12.i, align 16, !tbaa !2
  %89 = load i32, i32* %arrayidx48.12.i, align 16, !tbaa !2
  %xor49.12.i = xor i32 %89, %88
  %90 = load i32, i32* %arrayidx2.12.i, align 4, !tbaa !2
  %xor51.12.i = xor i32 %xor49.12.i, %90
  store i32 %xor51.12.i, i32* %arrayidx2.12.i, align 4, !tbaa !2
  %91 = load i32, i32* %arrayidx4.13.i, align 4, !tbaa !2
  %92 = load i32, i32* %arrayidx48.13.i, align 4, !tbaa !2
  %xor49.13.i = xor i32 %92, %91
  %93 = load i32, i32* %arrayidx2.13.i, align 4, !tbaa !2
  %xor51.13.i = xor i32 %xor49.13.i, %93
  store i32 %xor51.13.i, i32* %arrayidx2.13.i, align 4, !tbaa !2
  %94 = load i32, i32* %arrayidx4.14.i, align 8, !tbaa !2
  %95 = load i32, i32* %arrayidx48.14.i, align 8, !tbaa !2
  %xor49.14.i = xor i32 %95, %94
  %96 = load i32, i32* %arrayidx2.14.i, align 4, !tbaa !2
  %xor51.14.i = xor i32 %xor49.14.i, %96
  store i32 %xor51.14.i, i32* %arrayidx2.14.i, align 4, !tbaa !2
  %97 = load i32, i32* %arrayidx4.15.i, align 4, !tbaa !2
  %98 = load i32, i32* %arrayidx48.15.i, align 4, !tbaa !2
  %xor49.15.i = xor i32 %98, %97
  %99 = load i32, i32* %arrayidx2.15.i, align 4, !tbaa !2
  %xor51.15.i = xor i32 %xor49.15.i, %99
  store i32 %xor51.15.i, i32* %arrayidx2.15.i, align 4, !tbaa !2
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %0) #3
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %3) #3
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %2) #3
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %1) #3
  %100 = load i32, i32* %block_counter1, align 4, !tbaa !8
  %inc = add i32 %100, 1
  store i32 %inc, i32* %block_counter1, align 4, !tbaa !8
  %cmp2 = icmp eq i32 %inc, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %101 = load i32, i32* %block_counter2, align 4, !tbaa !9
  %inc3 = add i32 %101, 1
  store i32 %inc3, i32* %block_counter2, align 4, !tbaa !9
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %sub = add nsw i32 %msglen.addr.011, -64
  %add.ptr = getelementptr inbounds i8, i8* %input.addr.010, i32 64
  %cmp = icmp sgt i32 %msglen.addr.011, 127
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.inc, %entry
  ret void
}

; Function Attrs: nofree norecurse nounwind
define internal fastcc void @RND512Q(i8* %x, i32* nocapture %y, i32 %r) unnamed_addr #2 {
entry:
  %0 = bitcast i8* %x to i32*
  %1 = load i32, i32* %0, align 4, !tbaa !2
  %neg = xor i32 %1, -1
  store i32 %neg, i32* %0, align 4, !tbaa !2
  %xor = xor i32 %r, -1
  %arrayidx2 = getelementptr inbounds i8, i8* %x, i32 4
  %2 = bitcast i8* %arrayidx2 to i32*
  %3 = load i32, i32* %2, align 4, !tbaa !2
  %xor3 = xor i32 %3, %xor
  store i32 %xor3, i32* %2, align 4, !tbaa !2
  %arrayidx4 = getelementptr inbounds i8, i8* %x, i32 8
  %4 = bitcast i8* %arrayidx4 to i32*
  %5 = load i32, i32* %4, align 4, !tbaa !2
  %neg5 = xor i32 %5, -1
  store i32 %neg5, i32* %4, align 4, !tbaa !2
  %xor7 = xor i32 %r, -268435457
  %arrayidx8 = getelementptr inbounds i8, i8* %x, i32 12
  %6 = bitcast i8* %arrayidx8 to i32*
  %7 = load i32, i32* %6, align 4, !tbaa !2
  %xor9 = xor i32 %xor7, %7
  store i32 %xor9, i32* %6, align 4, !tbaa !2
  %arrayidx10 = getelementptr inbounds i8, i8* %x, i32 16
  %8 = bitcast i8* %arrayidx10 to i32*
  %9 = load i32, i32* %8, align 4, !tbaa !2
  %neg11 = xor i32 %9, -1
  store i32 %neg11, i32* %8, align 4, !tbaa !2
  %xor13 = xor i32 %r, -536870913
  %arrayidx14 = getelementptr inbounds i8, i8* %x, i32 20
  %10 = bitcast i8* %arrayidx14 to i32*
  %11 = load i32, i32* %10, align 4, !tbaa !2
  %xor15 = xor i32 %xor13, %11
  store i32 %xor15, i32* %10, align 4, !tbaa !2
  %arrayidx16 = getelementptr inbounds i8, i8* %x, i32 24
  %12 = bitcast i8* %arrayidx16 to i32*
  %13 = load i32, i32* %12, align 4, !tbaa !2
  %neg17 = xor i32 %13, -1
  store i32 %neg17, i32* %12, align 4, !tbaa !2
  %xor19 = xor i32 %r, -805306369
  %arrayidx20 = getelementptr inbounds i8, i8* %x, i32 28
  %14 = bitcast i8* %arrayidx20 to i32*
  %15 = load i32, i32* %14, align 4, !tbaa !2
  %xor21 = xor i32 %xor19, %15
  store i32 %xor21, i32* %14, align 4, !tbaa !2
  %arrayidx22 = getelementptr inbounds i8, i8* %x, i32 32
  %16 = bitcast i8* %arrayidx22 to i32*
  %17 = load i32, i32* %16, align 4, !tbaa !2
  %neg23 = xor i32 %17, -1
  store i32 %neg23, i32* %16, align 4, !tbaa !2
  %xor25 = xor i32 %r, -1073741825
  %arrayidx26 = getelementptr inbounds i8, i8* %x, i32 36
  %18 = bitcast i8* %arrayidx26 to i32*
  %19 = load i32, i32* %18, align 4, !tbaa !2
  %xor27 = xor i32 %xor25, %19
  store i32 %xor27, i32* %18, align 4, !tbaa !2
  %arrayidx28 = getelementptr inbounds i8, i8* %x, i32 40
  %20 = bitcast i8* %arrayidx28 to i32*
  %21 = load i32, i32* %20, align 4, !tbaa !2
  %neg29 = xor i32 %21, -1
  store i32 %neg29, i32* %20, align 4, !tbaa !2
  %xor31 = xor i32 %r, -1342177281
  %arrayidx32 = getelementptr inbounds i8, i8* %x, i32 44
  %22 = bitcast i8* %arrayidx32 to i32*
  %23 = load i32, i32* %22, align 4, !tbaa !2
  %xor33 = xor i32 %xor31, %23
  store i32 %xor33, i32* %22, align 4, !tbaa !2
  %arrayidx34 = getelementptr inbounds i8, i8* %x, i32 48
  %24 = bitcast i8* %arrayidx34 to i32*
  %25 = load i32, i32* %24, align 4, !tbaa !2
  %neg35 = xor i32 %25, -1
  store i32 %neg35, i32* %24, align 4, !tbaa !2
  %xor37 = xor i32 %r, -1610612737
  %arrayidx38 = getelementptr inbounds i8, i8* %x, i32 52
  %26 = bitcast i8* %arrayidx38 to i32*
  %27 = load i32, i32* %26, align 4, !tbaa !2
  %xor39 = xor i32 %xor37, %27
  store i32 %xor39, i32* %26, align 4, !tbaa !2
  %arrayidx40 = getelementptr inbounds i8, i8* %x, i32 56
  %28 = bitcast i8* %arrayidx40 to i32*
  %29 = load i32, i32* %28, align 4, !tbaa !2
  %neg41 = xor i32 %29, -1
  store i32 %neg41, i32* %28, align 4, !tbaa !2
  %xor43 = xor i32 %r, -1879048193
  %arrayidx44 = getelementptr inbounds i8, i8* %x, i32 60
  %30 = bitcast i8* %arrayidx44 to i32*
  %31 = load i32, i32* %30, align 4, !tbaa !2
  %xor45 = xor i32 %xor43, %31
  store i32 %xor45, i32* %30, align 4, !tbaa !2
  %conv = shl i32 %neg5, 1
  %mul = and i32 %conv, 510
  %arrayidx47 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul
  %32 = load i32, i32* %arrayidx47, align 8, !tbaa !2
  %add = or i32 %mul, 1
  %arrayidx51 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add
  %33 = load i32, i32* %arrayidx51, align 4, !tbaa !2
  %34 = lshr i32 %neg17, 7
  %mul54 = and i32 %34, 510
  %arrayidx55 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul54
  %35 = load i32, i32* %arrayidx55, align 8, !tbaa !2
  %add59 = or i32 %mul54, 1
  %arrayidx60 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add59
  %36 = load i32, i32* %arrayidx60, align 4, !tbaa !2
  %shl = shl i32 %35, 8
  %shr = lshr i32 %36, 24
  %or = or i32 %shr, %shl
  %shl61 = shl i32 %36, 8
  %shr62 = lshr i32 %35, 24
  %or63 = or i32 %shl61, %shr62
  %xor64 = xor i32 %or, %32
  %xor65 = xor i32 %or63, %33
  %37 = lshr i32 %neg29, 15
  %mul68 = and i32 %37, 510
  %arrayidx69 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul68
  %38 = load i32, i32* %arrayidx69, align 8, !tbaa !2
  %add73 = or i32 %mul68, 1
  %arrayidx74 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add73
  %39 = load i32, i32* %arrayidx74, align 4, !tbaa !2
  %shl75 = shl i32 %38, 16
  %shr76 = lshr i32 %39, 16
  %or77 = or i32 %shr76, %shl75
  %shl78 = shl i32 %39, 16
  %shr79 = lshr i32 %38, 16
  %or80 = or i32 %shl78, %shr79
  %xor81 = xor i32 %xor64, %or77
  %xor82 = xor i32 %xor65, %or80
  %40 = lshr i32 %neg41, 24
  %mul85 = shl nuw nsw i32 %40, 1
  %arrayidx86 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul85
  %41 = load i32, i32* %arrayidx86, align 8, !tbaa !2
  %add90 = or i32 %mul85, 1
  %arrayidx91 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add90
  %42 = load i32, i32* %arrayidx91, align 4, !tbaa !2
  %shl92 = shl i32 %41, 24
  %shr93 = lshr i32 %42, 8
  %or94 = or i32 %shr93, %shl92
  %shl95 = shl i32 %42, 24
  %shr96 = lshr i32 %41, 8
  %or97 = or i32 %shl95, %shr96
  %xor98 = xor i32 %xor81, %or94
  %xor99 = xor i32 %xor82, %or97
  %43 = load i8, i8* %arrayidx2, align 1, !tbaa !11
  %conv101 = zext i8 %43 to i32
  %mul102 = shl nuw nsw i32 %conv101, 1
  %arrayidx103 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul102
  %44 = load i32, i32* %arrayidx103, align 8, !tbaa !2
  %xor104 = xor i32 %xor99, %44
  %add108 = or i32 %mul102, 1
  %arrayidx109 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add108
  %45 = load i32, i32* %arrayidx109, align 4, !tbaa !2
  %xor110 = xor i32 %xor98, %45
  %arrayidx111 = getelementptr inbounds i8, i8* %x, i32 21
  %46 = load i8, i8* %arrayidx111, align 1, !tbaa !11
  %conv112 = zext i8 %46 to i32
  %mul113 = shl nuw nsw i32 %conv112, 1
  %arrayidx114 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul113
  %47 = load i32, i32* %arrayidx114, align 8, !tbaa !2
  %add118 = or i32 %mul113, 1
  %arrayidx119 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add118
  %48 = load i32, i32* %arrayidx119, align 4, !tbaa !2
  %shl120 = shl i32 %47, 8
  %shr121 = lshr i32 %48, 24
  %or122 = or i32 %shr121, %shl120
  %shl123 = shl i32 %48, 8
  %shr124 = lshr i32 %47, 24
  %or125 = or i32 %shl123, %shr124
  %xor126 = xor i32 %xor104, %or122
  %xor127 = xor i32 %xor110, %or125
  %arrayidx128 = getelementptr inbounds i8, i8* %x, i32 38
  %49 = load i8, i8* %arrayidx128, align 1, !tbaa !11
  %conv129 = zext i8 %49 to i32
  %mul130 = shl nuw nsw i32 %conv129, 1
  %arrayidx131 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul130
  %50 = load i32, i32* %arrayidx131, align 8, !tbaa !2
  %add135 = or i32 %mul130, 1
  %arrayidx136 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add135
  %51 = load i32, i32* %arrayidx136, align 4, !tbaa !2
  %shl137 = shl i32 %50, 16
  %shr138 = lshr i32 %51, 16
  %or139 = or i32 %shr138, %shl137
  %shl140 = shl i32 %51, 16
  %shr141 = lshr i32 %50, 16
  %or142 = or i32 %shl140, %shr141
  %xor143 = xor i32 %xor126, %or139
  %xor144 = xor i32 %xor127, %or142
  %arrayidx145 = getelementptr inbounds i8, i8* %x, i32 55
  %52 = load i8, i8* %arrayidx145, align 1, !tbaa !11
  %conv146 = zext i8 %52 to i32
  %mul147 = shl nuw nsw i32 %conv146, 1
  %arrayidx148 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul147
  %53 = load i32, i32* %arrayidx148, align 8, !tbaa !2
  %add152 = or i32 %mul147, 1
  %arrayidx153 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add152
  %54 = load i32, i32* %arrayidx153, align 4, !tbaa !2
  %shl154 = shl i32 %53, 24
  %shr155 = lshr i32 %54, 8
  %or156 = or i32 %shr155, %shl154
  %shl157 = shl i32 %54, 24
  %shr158 = lshr i32 %53, 8
  %or159 = or i32 %shl157, %shr158
  %xor160 = xor i32 %xor143, %or156
  %xor161 = xor i32 %xor144, %or159
  store i32 %xor161, i32* %y, align 4, !tbaa !2
  %arrayidx163 = getelementptr inbounds i32, i32* %y, i32 1
  store i32 %xor160, i32* %arrayidx163, align 4, !tbaa !2
  %55 = load i8, i8* %arrayidx10, align 1, !tbaa !11
  %conv165 = zext i8 %55 to i32
  %mul166 = shl nuw nsw i32 %conv165, 1
  %arrayidx167 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul166
  %56 = load i32, i32* %arrayidx167, align 8, !tbaa !2
  %add171 = or i32 %mul166, 1
  %arrayidx172 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add171
  %57 = load i32, i32* %arrayidx172, align 4, !tbaa !2
  %arrayidx173 = getelementptr inbounds i8, i8* %x, i32 33
  %58 = load i8, i8* %arrayidx173, align 1, !tbaa !11
  %conv174 = zext i8 %58 to i32
  %mul175 = shl nuw nsw i32 %conv174, 1
  %arrayidx176 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul175
  %59 = load i32, i32* %arrayidx176, align 8, !tbaa !2
  %add180 = or i32 %mul175, 1
  %arrayidx181 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add180
  %60 = load i32, i32* %arrayidx181, align 4, !tbaa !2
  %shl182 = shl i32 %59, 8
  %shr183 = lshr i32 %60, 24
  %or184 = or i32 %shr183, %shl182
  %shl185 = shl i32 %60, 8
  %shr186 = lshr i32 %59, 24
  %or187 = or i32 %shl185, %shr186
  %xor188 = xor i32 %or184, %56
  %xor189 = xor i32 %or187, %57
  %arrayidx190 = getelementptr inbounds i8, i8* %x, i32 50
  %61 = load i8, i8* %arrayidx190, align 1, !tbaa !11
  %conv191 = zext i8 %61 to i32
  %mul192 = shl nuw nsw i32 %conv191, 1
  %arrayidx193 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul192
  %62 = load i32, i32* %arrayidx193, align 8, !tbaa !2
  %add197 = or i32 %mul192, 1
  %arrayidx198 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add197
  %63 = load i32, i32* %arrayidx198, align 4, !tbaa !2
  %shl199 = shl i32 %62, 16
  %shr200 = lshr i32 %63, 16
  %or201 = or i32 %shr200, %shl199
  %shl202 = shl i32 %63, 16
  %shr203 = lshr i32 %62, 16
  %or204 = or i32 %shl202, %shr203
  %xor205 = xor i32 %xor188, %or201
  %xor206 = xor i32 %xor189, %or204
  %arrayidx207 = getelementptr inbounds i8, i8* %x, i32 3
  %64 = load i8, i8* %arrayidx207, align 1, !tbaa !11
  %conv208 = zext i8 %64 to i32
  %mul209 = shl nuw nsw i32 %conv208, 1
  %arrayidx210 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul209
  %65 = load i32, i32* %arrayidx210, align 8, !tbaa !2
  %add214 = or i32 %mul209, 1
  %arrayidx215 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add214
  %66 = load i32, i32* %arrayidx215, align 4, !tbaa !2
  %shl216 = shl i32 %65, 24
  %shr217 = lshr i32 %66, 8
  %or218 = or i32 %shr217, %shl216
  %shl219 = shl i32 %66, 24
  %shr220 = lshr i32 %65, 8
  %or221 = or i32 %shl219, %shr220
  %xor222 = xor i32 %xor205, %or218
  %xor223 = xor i32 %xor206, %or221
  %67 = load i8, i8* %arrayidx8, align 1, !tbaa !11
  %conv225 = zext i8 %67 to i32
  %mul226 = shl nuw nsw i32 %conv225, 1
  %arrayidx227 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul226
  %68 = load i32, i32* %arrayidx227, align 8, !tbaa !2
  %xor228 = xor i32 %xor223, %68
  %add232 = or i32 %mul226, 1
  %arrayidx233 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add232
  %69 = load i32, i32* %arrayidx233, align 4, !tbaa !2
  %xor234 = xor i32 %xor222, %69
  %arrayidx235 = getelementptr inbounds i8, i8* %x, i32 29
  %70 = load i8, i8* %arrayidx235, align 1, !tbaa !11
  %conv236 = zext i8 %70 to i32
  %mul237 = shl nuw nsw i32 %conv236, 1
  %arrayidx238 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul237
  %71 = load i32, i32* %arrayidx238, align 8, !tbaa !2
  %add242 = or i32 %mul237, 1
  %arrayidx243 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add242
  %72 = load i32, i32* %arrayidx243, align 4, !tbaa !2
  %shl244 = shl i32 %71, 8
  %shr245 = lshr i32 %72, 24
  %or246 = or i32 %shr245, %shl244
  %shl247 = shl i32 %72, 8
  %shr248 = lshr i32 %71, 24
  %or249 = or i32 %shl247, %shr248
  %xor250 = xor i32 %xor228, %or246
  %xor251 = xor i32 %xor234, %or249
  %arrayidx252 = getelementptr inbounds i8, i8* %x, i32 46
  %73 = load i8, i8* %arrayidx252, align 1, !tbaa !11
  %conv253 = zext i8 %73 to i32
  %mul254 = shl nuw nsw i32 %conv253, 1
  %arrayidx255 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul254
  %74 = load i32, i32* %arrayidx255, align 8, !tbaa !2
  %add259 = or i32 %mul254, 1
  %arrayidx260 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add259
  %75 = load i32, i32* %arrayidx260, align 4, !tbaa !2
  %shl261 = shl i32 %74, 16
  %shr262 = lshr i32 %75, 16
  %or263 = or i32 %shr262, %shl261
  %shl264 = shl i32 %75, 16
  %shr265 = lshr i32 %74, 16
  %or266 = or i32 %shl264, %shr265
  %xor267 = xor i32 %xor250, %or263
  %xor268 = xor i32 %xor251, %or266
  %arrayidx269 = getelementptr inbounds i8, i8* %x, i32 63
  %76 = load i8, i8* %arrayidx269, align 1, !tbaa !11
  %conv270 = zext i8 %76 to i32
  %mul271 = shl nuw nsw i32 %conv270, 1
  %arrayidx272 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul271
  %77 = load i32, i32* %arrayidx272, align 8, !tbaa !2
  %add276 = or i32 %mul271, 1
  %arrayidx277 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add276
  %78 = load i32, i32* %arrayidx277, align 4, !tbaa !2
  %shl278 = shl i32 %77, 24
  %shr279 = lshr i32 %78, 8
  %or280 = or i32 %shr279, %shl278
  %shl281 = shl i32 %78, 24
  %shr282 = lshr i32 %77, 8
  %or283 = or i32 %shl281, %shr282
  %xor284 = xor i32 %xor267, %or280
  %xor285 = xor i32 %xor268, %or283
  %arrayidx286 = getelementptr inbounds i32, i32* %y, i32 2
  store i32 %xor285, i32* %arrayidx286, align 4, !tbaa !2
  %arrayidx287 = getelementptr inbounds i32, i32* %y, i32 3
  store i32 %xor284, i32* %arrayidx287, align 4, !tbaa !2
  %79 = load i8, i8* %arrayidx16, align 1, !tbaa !11
  %conv289 = zext i8 %79 to i32
  %mul290 = shl nuw nsw i32 %conv289, 1
  %arrayidx291 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul290
  %80 = load i32, i32* %arrayidx291, align 8, !tbaa !2
  %add295 = or i32 %mul290, 1
  %arrayidx296 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add295
  %81 = load i32, i32* %arrayidx296, align 4, !tbaa !2
  %arrayidx297 = getelementptr inbounds i8, i8* %x, i32 41
  %82 = load i8, i8* %arrayidx297, align 1, !tbaa !11
  %conv298 = zext i8 %82 to i32
  %mul299 = shl nuw nsw i32 %conv298, 1
  %arrayidx300 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul299
  %83 = load i32, i32* %arrayidx300, align 8, !tbaa !2
  %add304 = or i32 %mul299, 1
  %arrayidx305 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add304
  %84 = load i32, i32* %arrayidx305, align 4, !tbaa !2
  %shl306 = shl i32 %83, 8
  %shr307 = lshr i32 %84, 24
  %or308 = or i32 %shr307, %shl306
  %shl309 = shl i32 %84, 8
  %shr310 = lshr i32 %83, 24
  %or311 = or i32 %shl309, %shr310
  %xor312 = xor i32 %or308, %80
  %xor313 = xor i32 %or311, %81
  %arrayidx314 = getelementptr inbounds i8, i8* %x, i32 58
  %85 = load i8, i8* %arrayidx314, align 1, !tbaa !11
  %conv315 = zext i8 %85 to i32
  %mul316 = shl nuw nsw i32 %conv315, 1
  %arrayidx317 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul316
  %86 = load i32, i32* %arrayidx317, align 8, !tbaa !2
  %add321 = or i32 %mul316, 1
  %arrayidx322 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add321
  %87 = load i32, i32* %arrayidx322, align 4, !tbaa !2
  %shl323 = shl i32 %86, 16
  %shr324 = lshr i32 %87, 16
  %or325 = or i32 %shr324, %shl323
  %shl326 = shl i32 %87, 16
  %shr327 = lshr i32 %86, 16
  %or328 = or i32 %shl326, %shr327
  %xor329 = xor i32 %xor312, %or325
  %xor330 = xor i32 %xor313, %or328
  %arrayidx331 = getelementptr inbounds i8, i8* %x, i32 11
  %88 = load i8, i8* %arrayidx331, align 1, !tbaa !11
  %conv332 = zext i8 %88 to i32
  %mul333 = shl nuw nsw i32 %conv332, 1
  %arrayidx334 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul333
  %89 = load i32, i32* %arrayidx334, align 8, !tbaa !2
  %add338 = or i32 %mul333, 1
  %arrayidx339 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add338
  %90 = load i32, i32* %arrayidx339, align 4, !tbaa !2
  %shl340 = shl i32 %89, 24
  %shr341 = lshr i32 %90, 8
  %or342 = or i32 %shr341, %shl340
  %shl343 = shl i32 %90, 24
  %shr344 = lshr i32 %89, 8
  %or345 = or i32 %shl343, %shr344
  %xor346 = xor i32 %xor329, %or342
  %xor347 = xor i32 %xor330, %or345
  %91 = load i8, i8* %arrayidx14, align 1, !tbaa !11
  %conv349 = zext i8 %91 to i32
  %mul350 = shl nuw nsw i32 %conv349, 1
  %arrayidx351 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul350
  %92 = load i32, i32* %arrayidx351, align 8, !tbaa !2
  %xor352 = xor i32 %xor347, %92
  %add356 = or i32 %mul350, 1
  %arrayidx357 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add356
  %93 = load i32, i32* %arrayidx357, align 4, !tbaa !2
  %xor358 = xor i32 %xor346, %93
  %arrayidx359 = getelementptr inbounds i8, i8* %x, i32 37
  %94 = load i8, i8* %arrayidx359, align 1, !tbaa !11
  %conv360 = zext i8 %94 to i32
  %mul361 = shl nuw nsw i32 %conv360, 1
  %arrayidx362 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul361
  %95 = load i32, i32* %arrayidx362, align 8, !tbaa !2
  %add366 = or i32 %mul361, 1
  %arrayidx367 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add366
  %96 = load i32, i32* %arrayidx367, align 4, !tbaa !2
  %shl368 = shl i32 %95, 8
  %shr369 = lshr i32 %96, 24
  %or370 = or i32 %shr369, %shl368
  %shl371 = shl i32 %96, 8
  %shr372 = lshr i32 %95, 24
  %or373 = or i32 %shl371, %shr372
  %xor374 = xor i32 %xor352, %or370
  %xor375 = xor i32 %xor358, %or373
  %arrayidx376 = getelementptr inbounds i8, i8* %x, i32 54
  %97 = load i8, i8* %arrayidx376, align 1, !tbaa !11
  %conv377 = zext i8 %97 to i32
  %mul378 = shl nuw nsw i32 %conv377, 1
  %arrayidx379 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul378
  %98 = load i32, i32* %arrayidx379, align 8, !tbaa !2
  %add383 = or i32 %mul378, 1
  %arrayidx384 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add383
  %99 = load i32, i32* %arrayidx384, align 4, !tbaa !2
  %shl385 = shl i32 %98, 16
  %shr386 = lshr i32 %99, 16
  %or387 = or i32 %shr386, %shl385
  %shl388 = shl i32 %99, 16
  %shr389 = lshr i32 %98, 16
  %or390 = or i32 %shl388, %shr389
  %xor391 = xor i32 %xor374, %or387
  %xor392 = xor i32 %xor375, %or390
  %arrayidx393 = getelementptr inbounds i8, i8* %x, i32 7
  %100 = load i8, i8* %arrayidx393, align 1, !tbaa !11
  %conv394 = zext i8 %100 to i32
  %mul395 = shl nuw nsw i32 %conv394, 1
  %arrayidx396 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul395
  %101 = load i32, i32* %arrayidx396, align 8, !tbaa !2
  %add400 = or i32 %mul395, 1
  %arrayidx401 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add400
  %102 = load i32, i32* %arrayidx401, align 4, !tbaa !2
  %shl402 = shl i32 %101, 24
  %shr403 = lshr i32 %102, 8
  %or404 = or i32 %shr403, %shl402
  %shl405 = shl i32 %102, 24
  %shr406 = lshr i32 %101, 8
  %or407 = or i32 %shl405, %shr406
  %xor408 = xor i32 %xor391, %or404
  %xor409 = xor i32 %xor392, %or407
  %arrayidx410 = getelementptr inbounds i32, i32* %y, i32 4
  store i32 %xor409, i32* %arrayidx410, align 4, !tbaa !2
  %arrayidx411 = getelementptr inbounds i32, i32* %y, i32 5
  store i32 %xor408, i32* %arrayidx411, align 4, !tbaa !2
  %103 = load i8, i8* %arrayidx22, align 1, !tbaa !11
  %conv413 = zext i8 %103 to i32
  %mul414 = shl nuw nsw i32 %conv413, 1
  %arrayidx415 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul414
  %104 = load i32, i32* %arrayidx415, align 8, !tbaa !2
  %add419 = or i32 %mul414, 1
  %arrayidx420 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add419
  %105 = load i32, i32* %arrayidx420, align 4, !tbaa !2
  %arrayidx421 = getelementptr inbounds i8, i8* %x, i32 49
  %106 = load i8, i8* %arrayidx421, align 1, !tbaa !11
  %conv422 = zext i8 %106 to i32
  %mul423 = shl nuw nsw i32 %conv422, 1
  %arrayidx424 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul423
  %107 = load i32, i32* %arrayidx424, align 8, !tbaa !2
  %add428 = or i32 %mul423, 1
  %arrayidx429 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add428
  %108 = load i32, i32* %arrayidx429, align 4, !tbaa !2
  %shl430 = shl i32 %107, 8
  %shr431 = lshr i32 %108, 24
  %or432 = or i32 %shr431, %shl430
  %shl433 = shl i32 %108, 8
  %shr434 = lshr i32 %107, 24
  %or435 = or i32 %shl433, %shr434
  %xor436 = xor i32 %or432, %104
  %xor437 = xor i32 %or435, %105
  %arrayidx438 = getelementptr inbounds i8, i8* %x, i32 2
  %109 = load i8, i8* %arrayidx438, align 1, !tbaa !11
  %conv439 = zext i8 %109 to i32
  %mul440 = shl nuw nsw i32 %conv439, 1
  %arrayidx441 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul440
  %110 = load i32, i32* %arrayidx441, align 8, !tbaa !2
  %add445 = or i32 %mul440, 1
  %arrayidx446 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add445
  %111 = load i32, i32* %arrayidx446, align 4, !tbaa !2
  %shl447 = shl i32 %110, 16
  %shr448 = lshr i32 %111, 16
  %or449 = or i32 %shr448, %shl447
  %shl450 = shl i32 %111, 16
  %shr451 = lshr i32 %110, 16
  %or452 = or i32 %shl450, %shr451
  %xor453 = xor i32 %xor436, %or449
  %xor454 = xor i32 %xor437, %or452
  %arrayidx455 = getelementptr inbounds i8, i8* %x, i32 19
  %112 = load i8, i8* %arrayidx455, align 1, !tbaa !11
  %conv456 = zext i8 %112 to i32
  %mul457 = shl nuw nsw i32 %conv456, 1
  %arrayidx458 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul457
  %113 = load i32, i32* %arrayidx458, align 8, !tbaa !2
  %add462 = or i32 %mul457, 1
  %arrayidx463 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add462
  %114 = load i32, i32* %arrayidx463, align 4, !tbaa !2
  %shl464 = shl i32 %113, 24
  %shr465 = lshr i32 %114, 8
  %or466 = or i32 %shr465, %shl464
  %shl467 = shl i32 %114, 24
  %shr468 = lshr i32 %113, 8
  %or469 = or i32 %shl467, %shr468
  %xor470 = xor i32 %xor453, %or466
  %xor471 = xor i32 %xor454, %or469
  %115 = load i8, i8* %arrayidx20, align 1, !tbaa !11
  %conv473 = zext i8 %115 to i32
  %mul474 = shl nuw nsw i32 %conv473, 1
  %arrayidx475 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul474
  %116 = load i32, i32* %arrayidx475, align 8, !tbaa !2
  %xor476 = xor i32 %xor471, %116
  %add480 = or i32 %mul474, 1
  %arrayidx481 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add480
  %117 = load i32, i32* %arrayidx481, align 4, !tbaa !2
  %xor482 = xor i32 %xor470, %117
  %arrayidx483 = getelementptr inbounds i8, i8* %x, i32 45
  %118 = load i8, i8* %arrayidx483, align 1, !tbaa !11
  %conv484 = zext i8 %118 to i32
  %mul485 = shl nuw nsw i32 %conv484, 1
  %arrayidx486 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul485
  %119 = load i32, i32* %arrayidx486, align 8, !tbaa !2
  %add490 = or i32 %mul485, 1
  %arrayidx491 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add490
  %120 = load i32, i32* %arrayidx491, align 4, !tbaa !2
  %shl492 = shl i32 %119, 8
  %shr493 = lshr i32 %120, 24
  %or494 = or i32 %shr493, %shl492
  %shl495 = shl i32 %120, 8
  %shr496 = lshr i32 %119, 24
  %or497 = or i32 %shl495, %shr496
  %xor498 = xor i32 %xor476, %or494
  %xor499 = xor i32 %xor482, %or497
  %arrayidx500 = getelementptr inbounds i8, i8* %x, i32 62
  %121 = load i8, i8* %arrayidx500, align 1, !tbaa !11
  %conv501 = zext i8 %121 to i32
  %mul502 = shl nuw nsw i32 %conv501, 1
  %arrayidx503 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul502
  %122 = load i32, i32* %arrayidx503, align 8, !tbaa !2
  %add507 = or i32 %mul502, 1
  %arrayidx508 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add507
  %123 = load i32, i32* %arrayidx508, align 4, !tbaa !2
  %shl509 = shl i32 %122, 16
  %shr510 = lshr i32 %123, 16
  %or511 = or i32 %shr510, %shl509
  %shl512 = shl i32 %123, 16
  %shr513 = lshr i32 %122, 16
  %or514 = or i32 %shl512, %shr513
  %xor515 = xor i32 %xor498, %or511
  %xor516 = xor i32 %xor499, %or514
  %arrayidx517 = getelementptr inbounds i8, i8* %x, i32 15
  %124 = load i8, i8* %arrayidx517, align 1, !tbaa !11
  %conv518 = zext i8 %124 to i32
  %mul519 = shl nuw nsw i32 %conv518, 1
  %arrayidx520 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul519
  %125 = load i32, i32* %arrayidx520, align 8, !tbaa !2
  %add524 = or i32 %mul519, 1
  %arrayidx525 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add524
  %126 = load i32, i32* %arrayidx525, align 4, !tbaa !2
  %shl526 = shl i32 %125, 24
  %shr527 = lshr i32 %126, 8
  %or528 = or i32 %shr527, %shl526
  %shl529 = shl i32 %126, 24
  %shr530 = lshr i32 %125, 8
  %or531 = or i32 %shl529, %shr530
  %xor532 = xor i32 %xor515, %or528
  %xor533 = xor i32 %xor516, %or531
  %arrayidx534 = getelementptr inbounds i32, i32* %y, i32 6
  store i32 %xor533, i32* %arrayidx534, align 4, !tbaa !2
  %arrayidx535 = getelementptr inbounds i32, i32* %y, i32 7
  store i32 %xor532, i32* %arrayidx535, align 4, !tbaa !2
  %127 = load i8, i8* %arrayidx28, align 1, !tbaa !11
  %conv537 = zext i8 %127 to i32
  %mul538 = shl nuw nsw i32 %conv537, 1
  %arrayidx539 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul538
  %128 = load i32, i32* %arrayidx539, align 8, !tbaa !2
  %add543 = or i32 %mul538, 1
  %arrayidx544 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add543
  %129 = load i32, i32* %arrayidx544, align 4, !tbaa !2
  %arrayidx545 = getelementptr inbounds i8, i8* %x, i32 57
  %130 = load i8, i8* %arrayidx545, align 1, !tbaa !11
  %conv546 = zext i8 %130 to i32
  %mul547 = shl nuw nsw i32 %conv546, 1
  %arrayidx548 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul547
  %131 = load i32, i32* %arrayidx548, align 8, !tbaa !2
  %add552 = or i32 %mul547, 1
  %arrayidx553 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add552
  %132 = load i32, i32* %arrayidx553, align 4, !tbaa !2
  %shl554 = shl i32 %131, 8
  %shr555 = lshr i32 %132, 24
  %or556 = or i32 %shr555, %shl554
  %shl557 = shl i32 %132, 8
  %shr558 = lshr i32 %131, 24
  %or559 = or i32 %shl557, %shr558
  %xor560 = xor i32 %or556, %128
  %xor561 = xor i32 %or559, %129
  %arrayidx562 = getelementptr inbounds i8, i8* %x, i32 10
  %133 = load i8, i8* %arrayidx562, align 1, !tbaa !11
  %conv563 = zext i8 %133 to i32
  %mul564 = shl nuw nsw i32 %conv563, 1
  %arrayidx565 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul564
  %134 = load i32, i32* %arrayidx565, align 8, !tbaa !2
  %add569 = or i32 %mul564, 1
  %arrayidx570 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add569
  %135 = load i32, i32* %arrayidx570, align 4, !tbaa !2
  %shl571 = shl i32 %134, 16
  %shr572 = lshr i32 %135, 16
  %or573 = or i32 %shr572, %shl571
  %shl574 = shl i32 %135, 16
  %shr575 = lshr i32 %134, 16
  %or576 = or i32 %shl574, %shr575
  %xor577 = xor i32 %xor560, %or573
  %xor578 = xor i32 %xor561, %or576
  %arrayidx579 = getelementptr inbounds i8, i8* %x, i32 27
  %136 = load i8, i8* %arrayidx579, align 1, !tbaa !11
  %conv580 = zext i8 %136 to i32
  %mul581 = shl nuw nsw i32 %conv580, 1
  %arrayidx582 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul581
  %137 = load i32, i32* %arrayidx582, align 8, !tbaa !2
  %add586 = or i32 %mul581, 1
  %arrayidx587 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add586
  %138 = load i32, i32* %arrayidx587, align 4, !tbaa !2
  %shl588 = shl i32 %137, 24
  %shr589 = lshr i32 %138, 8
  %or590 = or i32 %shr589, %shl588
  %shl591 = shl i32 %138, 24
  %shr592 = lshr i32 %137, 8
  %or593 = or i32 %shl591, %shr592
  %xor594 = xor i32 %xor577, %or590
  %xor595 = xor i32 %xor578, %or593
  %139 = load i8, i8* %arrayidx26, align 1, !tbaa !11
  %conv597 = zext i8 %139 to i32
  %mul598 = shl nuw nsw i32 %conv597, 1
  %arrayidx599 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul598
  %140 = load i32, i32* %arrayidx599, align 8, !tbaa !2
  %xor600 = xor i32 %xor595, %140
  %add604 = or i32 %mul598, 1
  %arrayidx605 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add604
  %141 = load i32, i32* %arrayidx605, align 4, !tbaa !2
  %xor606 = xor i32 %xor594, %141
  %arrayidx607 = getelementptr inbounds i8, i8* %x, i32 53
  %142 = load i8, i8* %arrayidx607, align 1, !tbaa !11
  %conv608 = zext i8 %142 to i32
  %mul609 = shl nuw nsw i32 %conv608, 1
  %arrayidx610 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul609
  %143 = load i32, i32* %arrayidx610, align 8, !tbaa !2
  %add614 = or i32 %mul609, 1
  %arrayidx615 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add614
  %144 = load i32, i32* %arrayidx615, align 4, !tbaa !2
  %shl616 = shl i32 %143, 8
  %shr617 = lshr i32 %144, 24
  %or618 = or i32 %shr617, %shl616
  %shl619 = shl i32 %144, 8
  %shr620 = lshr i32 %143, 24
  %or621 = or i32 %shl619, %shr620
  %xor622 = xor i32 %xor600, %or618
  %xor623 = xor i32 %xor606, %or621
  %arrayidx624 = getelementptr inbounds i8, i8* %x, i32 6
  %145 = load i8, i8* %arrayidx624, align 1, !tbaa !11
  %conv625 = zext i8 %145 to i32
  %mul626 = shl nuw nsw i32 %conv625, 1
  %arrayidx627 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul626
  %146 = load i32, i32* %arrayidx627, align 8, !tbaa !2
  %add631 = or i32 %mul626, 1
  %arrayidx632 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add631
  %147 = load i32, i32* %arrayidx632, align 4, !tbaa !2
  %shl633 = shl i32 %146, 16
  %shr634 = lshr i32 %147, 16
  %or635 = or i32 %shr634, %shl633
  %shl636 = shl i32 %147, 16
  %shr637 = lshr i32 %146, 16
  %or638 = or i32 %shl636, %shr637
  %xor639 = xor i32 %xor622, %or635
  %xor640 = xor i32 %xor623, %or638
  %arrayidx641 = getelementptr inbounds i8, i8* %x, i32 23
  %148 = load i8, i8* %arrayidx641, align 1, !tbaa !11
  %conv642 = zext i8 %148 to i32
  %mul643 = shl nuw nsw i32 %conv642, 1
  %arrayidx644 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul643
  %149 = load i32, i32* %arrayidx644, align 8, !tbaa !2
  %add648 = or i32 %mul643, 1
  %arrayidx649 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add648
  %150 = load i32, i32* %arrayidx649, align 4, !tbaa !2
  %shl650 = shl i32 %149, 24
  %shr651 = lshr i32 %150, 8
  %or652 = or i32 %shr651, %shl650
  %shl653 = shl i32 %150, 24
  %shr654 = lshr i32 %149, 8
  %or655 = or i32 %shl653, %shr654
  %xor656 = xor i32 %xor639, %or652
  %xor657 = xor i32 %xor640, %or655
  %arrayidx658 = getelementptr inbounds i32, i32* %y, i32 8
  store i32 %xor657, i32* %arrayidx658, align 4, !tbaa !2
  %arrayidx659 = getelementptr inbounds i32, i32* %y, i32 9
  store i32 %xor656, i32* %arrayidx659, align 4, !tbaa !2
  %151 = load i8, i8* %arrayidx34, align 1, !tbaa !11
  %conv661 = zext i8 %151 to i32
  %mul662 = shl nuw nsw i32 %conv661, 1
  %arrayidx663 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul662
  %152 = load i32, i32* %arrayidx663, align 8, !tbaa !2
  %add667 = or i32 %mul662, 1
  %arrayidx668 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add667
  %153 = load i32, i32* %arrayidx668, align 4, !tbaa !2
  %arrayidx669 = getelementptr inbounds i8, i8* %x, i32 1
  %154 = load i8, i8* %arrayidx669, align 1, !tbaa !11
  %conv670 = zext i8 %154 to i32
  %mul671 = shl nuw nsw i32 %conv670, 1
  %arrayidx672 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul671
  %155 = load i32, i32* %arrayidx672, align 8, !tbaa !2
  %add676 = or i32 %mul671, 1
  %arrayidx677 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add676
  %156 = load i32, i32* %arrayidx677, align 4, !tbaa !2
  %shl678 = shl i32 %155, 8
  %shr679 = lshr i32 %156, 24
  %or680 = or i32 %shr679, %shl678
  %shl681 = shl i32 %156, 8
  %shr682 = lshr i32 %155, 24
  %or683 = or i32 %shl681, %shr682
  %xor684 = xor i32 %or680, %152
  %xor685 = xor i32 %or683, %153
  %arrayidx686 = getelementptr inbounds i8, i8* %x, i32 18
  %157 = load i8, i8* %arrayidx686, align 1, !tbaa !11
  %conv687 = zext i8 %157 to i32
  %mul688 = shl nuw nsw i32 %conv687, 1
  %arrayidx689 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul688
  %158 = load i32, i32* %arrayidx689, align 8, !tbaa !2
  %add693 = or i32 %mul688, 1
  %arrayidx694 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add693
  %159 = load i32, i32* %arrayidx694, align 4, !tbaa !2
  %shl695 = shl i32 %158, 16
  %shr696 = lshr i32 %159, 16
  %or697 = or i32 %shr696, %shl695
  %shl698 = shl i32 %159, 16
  %shr699 = lshr i32 %158, 16
  %or700 = or i32 %shl698, %shr699
  %xor701 = xor i32 %xor684, %or697
  %xor702 = xor i32 %xor685, %or700
  %arrayidx703 = getelementptr inbounds i8, i8* %x, i32 35
  %160 = load i8, i8* %arrayidx703, align 1, !tbaa !11
  %conv704 = zext i8 %160 to i32
  %mul705 = shl nuw nsw i32 %conv704, 1
  %arrayidx706 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul705
  %161 = load i32, i32* %arrayidx706, align 8, !tbaa !2
  %add710 = or i32 %mul705, 1
  %arrayidx711 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add710
  %162 = load i32, i32* %arrayidx711, align 4, !tbaa !2
  %shl712 = shl i32 %161, 24
  %shr713 = lshr i32 %162, 8
  %or714 = or i32 %shr713, %shl712
  %shl715 = shl i32 %162, 24
  %shr716 = lshr i32 %161, 8
  %or717 = or i32 %shl715, %shr716
  %xor718 = xor i32 %xor701, %or714
  %xor719 = xor i32 %xor702, %or717
  %163 = load i8, i8* %arrayidx32, align 1, !tbaa !11
  %conv721 = zext i8 %163 to i32
  %mul722 = shl nuw nsw i32 %conv721, 1
  %arrayidx723 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul722
  %164 = load i32, i32* %arrayidx723, align 8, !tbaa !2
  %xor724 = xor i32 %xor719, %164
  %add728 = or i32 %mul722, 1
  %arrayidx729 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add728
  %165 = load i32, i32* %arrayidx729, align 4, !tbaa !2
  %xor730 = xor i32 %xor718, %165
  %arrayidx731 = getelementptr inbounds i8, i8* %x, i32 61
  %166 = load i8, i8* %arrayidx731, align 1, !tbaa !11
  %conv732 = zext i8 %166 to i32
  %mul733 = shl nuw nsw i32 %conv732, 1
  %arrayidx734 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul733
  %167 = load i32, i32* %arrayidx734, align 8, !tbaa !2
  %add738 = or i32 %mul733, 1
  %arrayidx739 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add738
  %168 = load i32, i32* %arrayidx739, align 4, !tbaa !2
  %shl740 = shl i32 %167, 8
  %shr741 = lshr i32 %168, 24
  %or742 = or i32 %shr741, %shl740
  %shl743 = shl i32 %168, 8
  %shr744 = lshr i32 %167, 24
  %or745 = or i32 %shl743, %shr744
  %xor746 = xor i32 %xor724, %or742
  %xor747 = xor i32 %xor730, %or745
  %arrayidx748 = getelementptr inbounds i8, i8* %x, i32 14
  %169 = load i8, i8* %arrayidx748, align 1, !tbaa !11
  %conv749 = zext i8 %169 to i32
  %mul750 = shl nuw nsw i32 %conv749, 1
  %arrayidx751 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul750
  %170 = load i32, i32* %arrayidx751, align 8, !tbaa !2
  %add755 = or i32 %mul750, 1
  %arrayidx756 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add755
  %171 = load i32, i32* %arrayidx756, align 4, !tbaa !2
  %shl757 = shl i32 %170, 16
  %shr758 = lshr i32 %171, 16
  %or759 = or i32 %shr758, %shl757
  %shl760 = shl i32 %171, 16
  %shr761 = lshr i32 %170, 16
  %or762 = or i32 %shl760, %shr761
  %xor763 = xor i32 %xor746, %or759
  %xor764 = xor i32 %xor747, %or762
  %arrayidx765 = getelementptr inbounds i8, i8* %x, i32 31
  %172 = load i8, i8* %arrayidx765, align 1, !tbaa !11
  %conv766 = zext i8 %172 to i32
  %mul767 = shl nuw nsw i32 %conv766, 1
  %arrayidx768 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul767
  %173 = load i32, i32* %arrayidx768, align 8, !tbaa !2
  %add772 = or i32 %mul767, 1
  %arrayidx773 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add772
  %174 = load i32, i32* %arrayidx773, align 4, !tbaa !2
  %shl774 = shl i32 %173, 24
  %shr775 = lshr i32 %174, 8
  %or776 = or i32 %shr775, %shl774
  %shl777 = shl i32 %174, 24
  %shr778 = lshr i32 %173, 8
  %or779 = or i32 %shl777, %shr778
  %xor780 = xor i32 %xor763, %or776
  %xor781 = xor i32 %xor764, %or779
  %arrayidx782 = getelementptr inbounds i32, i32* %y, i32 10
  store i32 %xor781, i32* %arrayidx782, align 4, !tbaa !2
  %arrayidx783 = getelementptr inbounds i32, i32* %y, i32 11
  store i32 %xor780, i32* %arrayidx783, align 4, !tbaa !2
  %175 = load i8, i8* %arrayidx40, align 1, !tbaa !11
  %conv785 = zext i8 %175 to i32
  %mul786 = shl nuw nsw i32 %conv785, 1
  %arrayidx787 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul786
  %176 = load i32, i32* %arrayidx787, align 8, !tbaa !2
  %add791 = or i32 %mul786, 1
  %arrayidx792 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add791
  %177 = load i32, i32* %arrayidx792, align 4, !tbaa !2
  %arrayidx793 = getelementptr inbounds i8, i8* %x, i32 9
  %178 = load i8, i8* %arrayidx793, align 1, !tbaa !11
  %conv794 = zext i8 %178 to i32
  %mul795 = shl nuw nsw i32 %conv794, 1
  %arrayidx796 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul795
  %179 = load i32, i32* %arrayidx796, align 8, !tbaa !2
  %add800 = or i32 %mul795, 1
  %arrayidx801 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add800
  %180 = load i32, i32* %arrayidx801, align 4, !tbaa !2
  %shl802 = shl i32 %179, 8
  %shr803 = lshr i32 %180, 24
  %or804 = or i32 %shr803, %shl802
  %shl805 = shl i32 %180, 8
  %shr806 = lshr i32 %179, 24
  %or807 = or i32 %shl805, %shr806
  %xor808 = xor i32 %or804, %176
  %xor809 = xor i32 %or807, %177
  %arrayidx810 = getelementptr inbounds i8, i8* %x, i32 26
  %181 = load i8, i8* %arrayidx810, align 1, !tbaa !11
  %conv811 = zext i8 %181 to i32
  %mul812 = shl nuw nsw i32 %conv811, 1
  %arrayidx813 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul812
  %182 = load i32, i32* %arrayidx813, align 8, !tbaa !2
  %add817 = or i32 %mul812, 1
  %arrayidx818 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add817
  %183 = load i32, i32* %arrayidx818, align 4, !tbaa !2
  %shl819 = shl i32 %182, 16
  %shr820 = lshr i32 %183, 16
  %or821 = or i32 %shr820, %shl819
  %shl822 = shl i32 %183, 16
  %shr823 = lshr i32 %182, 16
  %or824 = or i32 %shl822, %shr823
  %xor825 = xor i32 %xor808, %or821
  %xor826 = xor i32 %xor809, %or824
  %arrayidx827 = getelementptr inbounds i8, i8* %x, i32 43
  %184 = load i8, i8* %arrayidx827, align 1, !tbaa !11
  %conv828 = zext i8 %184 to i32
  %mul829 = shl nuw nsw i32 %conv828, 1
  %arrayidx830 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul829
  %185 = load i32, i32* %arrayidx830, align 8, !tbaa !2
  %add834 = or i32 %mul829, 1
  %arrayidx835 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add834
  %186 = load i32, i32* %arrayidx835, align 4, !tbaa !2
  %shl836 = shl i32 %185, 24
  %shr837 = lshr i32 %186, 8
  %or838 = or i32 %shr837, %shl836
  %shl839 = shl i32 %186, 24
  %shr840 = lshr i32 %185, 8
  %or841 = or i32 %shl839, %shr840
  %xor842 = xor i32 %xor825, %or838
  %xor843 = xor i32 %xor826, %or841
  %187 = load i8, i8* %arrayidx38, align 1, !tbaa !11
  %conv845 = zext i8 %187 to i32
  %mul846 = shl nuw nsw i32 %conv845, 1
  %arrayidx847 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul846
  %188 = load i32, i32* %arrayidx847, align 8, !tbaa !2
  %xor848 = xor i32 %xor843, %188
  %add852 = or i32 %mul846, 1
  %arrayidx853 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add852
  %189 = load i32, i32* %arrayidx853, align 4, !tbaa !2
  %xor854 = xor i32 %xor842, %189
  %arrayidx855 = getelementptr inbounds i8, i8* %x, i32 5
  %190 = load i8, i8* %arrayidx855, align 1, !tbaa !11
  %conv856 = zext i8 %190 to i32
  %mul857 = shl nuw nsw i32 %conv856, 1
  %arrayidx858 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul857
  %191 = load i32, i32* %arrayidx858, align 8, !tbaa !2
  %add862 = or i32 %mul857, 1
  %arrayidx863 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add862
  %192 = load i32, i32* %arrayidx863, align 4, !tbaa !2
  %shl864 = shl i32 %191, 8
  %shr865 = lshr i32 %192, 24
  %or866 = or i32 %shr865, %shl864
  %shl867 = shl i32 %192, 8
  %shr868 = lshr i32 %191, 24
  %or869 = or i32 %shl867, %shr868
  %xor870 = xor i32 %xor848, %or866
  %xor871 = xor i32 %xor854, %or869
  %arrayidx872 = getelementptr inbounds i8, i8* %x, i32 22
  %193 = load i8, i8* %arrayidx872, align 1, !tbaa !11
  %conv873 = zext i8 %193 to i32
  %mul874 = shl nuw nsw i32 %conv873, 1
  %arrayidx875 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul874
  %194 = load i32, i32* %arrayidx875, align 8, !tbaa !2
  %add879 = or i32 %mul874, 1
  %arrayidx880 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add879
  %195 = load i32, i32* %arrayidx880, align 4, !tbaa !2
  %shl881 = shl i32 %194, 16
  %shr882 = lshr i32 %195, 16
  %or883 = or i32 %shr882, %shl881
  %shl884 = shl i32 %195, 16
  %shr885 = lshr i32 %194, 16
  %or886 = or i32 %shl884, %shr885
  %xor887 = xor i32 %xor870, %or883
  %xor888 = xor i32 %xor871, %or886
  %arrayidx889 = getelementptr inbounds i8, i8* %x, i32 39
  %196 = load i8, i8* %arrayidx889, align 1, !tbaa !11
  %conv890 = zext i8 %196 to i32
  %mul891 = shl nuw nsw i32 %conv890, 1
  %arrayidx892 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul891
  %197 = load i32, i32* %arrayidx892, align 8, !tbaa !2
  %add896 = or i32 %mul891, 1
  %arrayidx897 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add896
  %198 = load i32, i32* %arrayidx897, align 4, !tbaa !2
  %shl898 = shl i32 %197, 24
  %shr899 = lshr i32 %198, 8
  %or900 = or i32 %shr899, %shl898
  %shl901 = shl i32 %198, 24
  %shr902 = lshr i32 %197, 8
  %or903 = or i32 %shl901, %shr902
  %xor904 = xor i32 %xor887, %or900
  %xor905 = xor i32 %xor888, %or903
  %arrayidx906 = getelementptr inbounds i32, i32* %y, i32 12
  store i32 %xor905, i32* %arrayidx906, align 4, !tbaa !2
  %arrayidx907 = getelementptr inbounds i32, i32* %y, i32 13
  store i32 %xor904, i32* %arrayidx907, align 4, !tbaa !2
  %199 = load i8, i8* %x, align 1, !tbaa !11
  %conv909 = zext i8 %199 to i32
  %mul910 = shl nuw nsw i32 %conv909, 1
  %arrayidx911 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul910
  %200 = load i32, i32* %arrayidx911, align 8, !tbaa !2
  %add915 = or i32 %mul910, 1
  %arrayidx916 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add915
  %201 = load i32, i32* %arrayidx916, align 4, !tbaa !2
  %arrayidx917 = getelementptr inbounds i8, i8* %x, i32 17
  %202 = load i8, i8* %arrayidx917, align 1, !tbaa !11
  %conv918 = zext i8 %202 to i32
  %mul919 = shl nuw nsw i32 %conv918, 1
  %arrayidx920 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul919
  %203 = load i32, i32* %arrayidx920, align 8, !tbaa !2
  %add924 = or i32 %mul919, 1
  %arrayidx925 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add924
  %204 = load i32, i32* %arrayidx925, align 4, !tbaa !2
  %shl926 = shl i32 %203, 8
  %shr927 = lshr i32 %204, 24
  %or928 = or i32 %shr927, %shl926
  %shl929 = shl i32 %204, 8
  %shr930 = lshr i32 %203, 24
  %or931 = or i32 %shl929, %shr930
  %xor932 = xor i32 %or928, %200
  %xor933 = xor i32 %or931, %201
  %arrayidx934 = getelementptr inbounds i8, i8* %x, i32 34
  %205 = load i8, i8* %arrayidx934, align 1, !tbaa !11
  %conv935 = zext i8 %205 to i32
  %mul936 = shl nuw nsw i32 %conv935, 1
  %arrayidx937 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul936
  %206 = load i32, i32* %arrayidx937, align 8, !tbaa !2
  %add941 = or i32 %mul936, 1
  %arrayidx942 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add941
  %207 = load i32, i32* %arrayidx942, align 4, !tbaa !2
  %shl943 = shl i32 %206, 16
  %shr944 = lshr i32 %207, 16
  %or945 = or i32 %shr944, %shl943
  %shl946 = shl i32 %207, 16
  %shr947 = lshr i32 %206, 16
  %or948 = or i32 %shl946, %shr947
  %xor949 = xor i32 %xor932, %or945
  %xor950 = xor i32 %xor933, %or948
  %arrayidx951 = getelementptr inbounds i8, i8* %x, i32 51
  %208 = load i8, i8* %arrayidx951, align 1, !tbaa !11
  %conv952 = zext i8 %208 to i32
  %mul953 = shl nuw nsw i32 %conv952, 1
  %arrayidx954 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul953
  %209 = load i32, i32* %arrayidx954, align 8, !tbaa !2
  %add958 = or i32 %mul953, 1
  %arrayidx959 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add958
  %210 = load i32, i32* %arrayidx959, align 4, !tbaa !2
  %shl960 = shl i32 %209, 24
  %shr961 = lshr i32 %210, 8
  %or962 = or i32 %shr961, %shl960
  %shl963 = shl i32 %210, 24
  %shr964 = lshr i32 %209, 8
  %or965 = or i32 %shl963, %shr964
  %xor966 = xor i32 %xor949, %or962
  %xor967 = xor i32 %xor950, %or965
  %211 = load i8, i8* %arrayidx44, align 1, !tbaa !11
  %conv969 = zext i8 %211 to i32
  %mul970 = shl nuw nsw i32 %conv969, 1
  %arrayidx971 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul970
  %212 = load i32, i32* %arrayidx971, align 8, !tbaa !2
  %xor972 = xor i32 %xor967, %212
  %add976 = or i32 %mul970, 1
  %arrayidx977 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add976
  %213 = load i32, i32* %arrayidx977, align 4, !tbaa !2
  %xor978 = xor i32 %xor966, %213
  %arrayidx979 = getelementptr inbounds i8, i8* %x, i32 13
  %214 = load i8, i8* %arrayidx979, align 1, !tbaa !11
  %conv980 = zext i8 %214 to i32
  %mul981 = shl nuw nsw i32 %conv980, 1
  %arrayidx982 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul981
  %215 = load i32, i32* %arrayidx982, align 8, !tbaa !2
  %add986 = or i32 %mul981, 1
  %arrayidx987 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add986
  %216 = load i32, i32* %arrayidx987, align 4, !tbaa !2
  %shl988 = shl i32 %215, 8
  %shr989 = lshr i32 %216, 24
  %or990 = or i32 %shr989, %shl988
  %shl991 = shl i32 %216, 8
  %shr992 = lshr i32 %215, 24
  %or993 = or i32 %shl991, %shr992
  %xor994 = xor i32 %xor972, %or990
  %xor995 = xor i32 %xor978, %or993
  %arrayidx996 = getelementptr inbounds i8, i8* %x, i32 30
  %217 = load i8, i8* %arrayidx996, align 1, !tbaa !11
  %conv997 = zext i8 %217 to i32
  %mul998 = shl nuw nsw i32 %conv997, 1
  %arrayidx999 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul998
  %218 = load i32, i32* %arrayidx999, align 8, !tbaa !2
  %add1003 = or i32 %mul998, 1
  %arrayidx1004 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add1003
  %219 = load i32, i32* %arrayidx1004, align 4, !tbaa !2
  %shl1005 = shl i32 %218, 16
  %shr1006 = lshr i32 %219, 16
  %or1007 = or i32 %shr1006, %shl1005
  %shl1008 = shl i32 %219, 16
  %shr1009 = lshr i32 %218, 16
  %or1010 = or i32 %shl1008, %shr1009
  %xor1011 = xor i32 %xor994, %or1007
  %xor1012 = xor i32 %xor995, %or1010
  %arrayidx1013 = getelementptr inbounds i8, i8* %x, i32 47
  %220 = load i8, i8* %arrayidx1013, align 1, !tbaa !11
  %conv1014 = zext i8 %220 to i32
  %mul1015 = shl nuw nsw i32 %conv1014, 1
  %arrayidx1016 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul1015
  %221 = load i32, i32* %arrayidx1016, align 8, !tbaa !2
  %add1020 = or i32 %mul1015, 1
  %arrayidx1021 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add1020
  %222 = load i32, i32* %arrayidx1021, align 4, !tbaa !2
  %shl1022 = shl i32 %221, 24
  %shr1023 = lshr i32 %222, 8
  %or1024 = or i32 %shr1023, %shl1022
  %shl1025 = shl i32 %222, 24
  %shr1026 = lshr i32 %221, 8
  %or1027 = or i32 %shl1025, %shr1026
  %xor1028 = xor i32 %xor1011, %or1024
  %xor1029 = xor i32 %xor1012, %or1027
  %arrayidx1030 = getelementptr inbounds i32, i32* %y, i32 14
  store i32 %xor1029, i32* %arrayidx1030, align 4, !tbaa !2
  %arrayidx1031 = getelementptr inbounds i32, i32* %y, i32 15
  store i32 %xor1028, i32* %arrayidx1031, align 4, !tbaa !2
  ret void
}

; Function Attrs: nofree norecurse nounwind
define internal fastcc void @RND512P(i8* %x, i32* nocapture %y, i32 %r) unnamed_addr #2 {
entry:
  %0 = bitcast i8* %x to i32*
  %1 = load i32, i32* %0, align 4, !tbaa !2
  %xor1 = xor i32 %1, %r
  store i32 %xor1, i32* %0, align 4, !tbaa !2
  %xor2 = xor i32 %r, 16
  %arrayidx3 = getelementptr inbounds i8, i8* %x, i32 8
  %2 = bitcast i8* %arrayidx3 to i32*
  %3 = load i32, i32* %2, align 4, !tbaa !2
  %xor4 = xor i32 %xor2, %3
  store i32 %xor4, i32* %2, align 4, !tbaa !2
  %xor5 = xor i32 %r, 32
  %arrayidx6 = getelementptr inbounds i8, i8* %x, i32 16
  %4 = bitcast i8* %arrayidx6 to i32*
  %5 = load i32, i32* %4, align 4, !tbaa !2
  %xor7 = xor i32 %xor5, %5
  store i32 %xor7, i32* %4, align 4, !tbaa !2
  %xor8 = xor i32 %r, 48
  %arrayidx9 = getelementptr inbounds i8, i8* %x, i32 24
  %6 = bitcast i8* %arrayidx9 to i32*
  %7 = load i32, i32* %6, align 4, !tbaa !2
  %xor10 = xor i32 %xor8, %7
  store i32 %xor10, i32* %6, align 4, !tbaa !2
  %xor11 = xor i32 %r, 64
  %arrayidx12 = getelementptr inbounds i8, i8* %x, i32 32
  %8 = bitcast i8* %arrayidx12 to i32*
  %9 = load i32, i32* %8, align 4, !tbaa !2
  %xor13 = xor i32 %xor11, %9
  store i32 %xor13, i32* %8, align 4, !tbaa !2
  %xor14 = xor i32 %r, 80
  %arrayidx15 = getelementptr inbounds i8, i8* %x, i32 40
  %10 = bitcast i8* %arrayidx15 to i32*
  %11 = load i32, i32* %10, align 4, !tbaa !2
  %xor16 = xor i32 %xor14, %11
  store i32 %xor16, i32* %10, align 4, !tbaa !2
  %xor17 = xor i32 %r, 96
  %arrayidx18 = getelementptr inbounds i8, i8* %x, i32 48
  %12 = bitcast i8* %arrayidx18 to i32*
  %13 = load i32, i32* %12, align 4, !tbaa !2
  %xor19 = xor i32 %xor17, %13
  store i32 %xor19, i32* %12, align 4, !tbaa !2
  %xor20 = xor i32 %r, 112
  %arrayidx21 = getelementptr inbounds i8, i8* %x, i32 56
  %14 = bitcast i8* %arrayidx21 to i32*
  %15 = load i32, i32* %14, align 4, !tbaa !2
  %xor22 = xor i32 %xor20, %15
  store i32 %xor22, i32* %14, align 4, !tbaa !2
  %conv = shl i32 %xor1, 1
  %mul = and i32 %conv, 510
  %arrayidx24 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul
  %16 = load i32, i32* %arrayidx24, align 8, !tbaa !2
  %add = or i32 %mul, 1
  %arrayidx28 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add
  %17 = load i32, i32* %arrayidx28, align 4, !tbaa !2
  %18 = lshr i32 %xor4, 7
  %mul31 = and i32 %18, 510
  %arrayidx32 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul31
  %19 = load i32, i32* %arrayidx32, align 8, !tbaa !2
  %add36 = or i32 %mul31, 1
  %arrayidx37 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add36
  %20 = load i32, i32* %arrayidx37, align 4, !tbaa !2
  %shl = shl i32 %19, 8
  %shr = lshr i32 %20, 24
  %or = or i32 %shr, %shl
  %shl38 = shl i32 %20, 8
  %shr39 = lshr i32 %19, 24
  %or40 = or i32 %shl38, %shr39
  %xor41 = xor i32 %or, %16
  %xor42 = xor i32 %or40, %17
  %21 = lshr i32 %xor7, 15
  %mul45 = and i32 %21, 510
  %arrayidx46 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul45
  %22 = load i32, i32* %arrayidx46, align 8, !tbaa !2
  %add50 = or i32 %mul45, 1
  %arrayidx51 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add50
  %23 = load i32, i32* %arrayidx51, align 4, !tbaa !2
  %shl52 = shl i32 %22, 16
  %shr53 = lshr i32 %23, 16
  %or54 = or i32 %shr53, %shl52
  %shl55 = shl i32 %23, 16
  %shr56 = lshr i32 %22, 16
  %or57 = or i32 %shl55, %shr56
  %xor58 = xor i32 %xor41, %or54
  %xor59 = xor i32 %xor42, %or57
  %24 = lshr i32 %xor10, 24
  %mul62 = shl nuw nsw i32 %24, 1
  %arrayidx63 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul62
  %25 = load i32, i32* %arrayidx63, align 8, !tbaa !2
  %add67 = or i32 %mul62, 1
  %arrayidx68 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add67
  %26 = load i32, i32* %arrayidx68, align 4, !tbaa !2
  %shl69 = shl i32 %25, 24
  %shr70 = lshr i32 %26, 8
  %or71 = or i32 %shr70, %shl69
  %shl72 = shl i32 %26, 24
  %shr73 = lshr i32 %25, 8
  %or74 = or i32 %shl72, %shr73
  %xor75 = xor i32 %xor58, %or71
  %xor76 = xor i32 %xor59, %or74
  %arrayidx77 = getelementptr inbounds i8, i8* %x, i32 36
  %27 = load i8, i8* %arrayidx77, align 1, !tbaa !11
  %conv78 = zext i8 %27 to i32
  %mul79 = shl nuw nsw i32 %conv78, 1
  %arrayidx80 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul79
  %28 = load i32, i32* %arrayidx80, align 8, !tbaa !2
  %xor81 = xor i32 %xor76, %28
  %add85 = or i32 %mul79, 1
  %arrayidx86 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add85
  %29 = load i32, i32* %arrayidx86, align 4, !tbaa !2
  %xor87 = xor i32 %xor75, %29
  %arrayidx88 = getelementptr inbounds i8, i8* %x, i32 45
  %30 = load i8, i8* %arrayidx88, align 1, !tbaa !11
  %conv89 = zext i8 %30 to i32
  %mul90 = shl nuw nsw i32 %conv89, 1
  %arrayidx91 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul90
  %31 = load i32, i32* %arrayidx91, align 8, !tbaa !2
  %add95 = or i32 %mul90, 1
  %arrayidx96 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add95
  %32 = load i32, i32* %arrayidx96, align 4, !tbaa !2
  %shl97 = shl i32 %31, 8
  %shr98 = lshr i32 %32, 24
  %or99 = or i32 %shr98, %shl97
  %shl100 = shl i32 %32, 8
  %shr101 = lshr i32 %31, 24
  %or102 = or i32 %shl100, %shr101
  %xor103 = xor i32 %xor81, %or99
  %xor104 = xor i32 %xor87, %or102
  %arrayidx105 = getelementptr inbounds i8, i8* %x, i32 54
  %33 = load i8, i8* %arrayidx105, align 1, !tbaa !11
  %conv106 = zext i8 %33 to i32
  %mul107 = shl nuw nsw i32 %conv106, 1
  %arrayidx108 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul107
  %34 = load i32, i32* %arrayidx108, align 8, !tbaa !2
  %add112 = or i32 %mul107, 1
  %arrayidx113 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add112
  %35 = load i32, i32* %arrayidx113, align 4, !tbaa !2
  %shl114 = shl i32 %34, 16
  %shr115 = lshr i32 %35, 16
  %or116 = or i32 %shr115, %shl114
  %shl117 = shl i32 %35, 16
  %shr118 = lshr i32 %34, 16
  %or119 = or i32 %shl117, %shr118
  %xor120 = xor i32 %xor103, %or116
  %xor121 = xor i32 %xor104, %or119
  %arrayidx122 = getelementptr inbounds i8, i8* %x, i32 63
  %36 = load i8, i8* %arrayidx122, align 1, !tbaa !11
  %conv123 = zext i8 %36 to i32
  %mul124 = shl nuw nsw i32 %conv123, 1
  %arrayidx125 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul124
  %37 = load i32, i32* %arrayidx125, align 8, !tbaa !2
  %add129 = or i32 %mul124, 1
  %arrayidx130 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add129
  %38 = load i32, i32* %arrayidx130, align 4, !tbaa !2
  %shl131 = shl i32 %37, 24
  %shr132 = lshr i32 %38, 8
  %or133 = or i32 %shr132, %shl131
  %shl134 = shl i32 %38, 24
  %shr135 = lshr i32 %37, 8
  %or136 = or i32 %shl134, %shr135
  %xor137 = xor i32 %xor120, %or133
  %xor138 = xor i32 %xor121, %or136
  store i32 %xor138, i32* %y, align 4, !tbaa !2
  %arrayidx140 = getelementptr inbounds i32, i32* %y, i32 1
  store i32 %xor137, i32* %arrayidx140, align 4, !tbaa !2
  %39 = load i8, i8* %arrayidx3, align 1, !tbaa !11
  %conv142 = zext i8 %39 to i32
  %mul143 = shl nuw nsw i32 %conv142, 1
  %arrayidx144 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul143
  %40 = load i32, i32* %arrayidx144, align 8, !tbaa !2
  %add148 = or i32 %mul143, 1
  %arrayidx149 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add148
  %41 = load i32, i32* %arrayidx149, align 4, !tbaa !2
  %arrayidx150 = getelementptr inbounds i8, i8* %x, i32 17
  %42 = load i8, i8* %arrayidx150, align 1, !tbaa !11
  %conv151 = zext i8 %42 to i32
  %mul152 = shl nuw nsw i32 %conv151, 1
  %arrayidx153 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul152
  %43 = load i32, i32* %arrayidx153, align 8, !tbaa !2
  %add157 = or i32 %mul152, 1
  %arrayidx158 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add157
  %44 = load i32, i32* %arrayidx158, align 4, !tbaa !2
  %shl159 = shl i32 %43, 8
  %shr160 = lshr i32 %44, 24
  %or161 = or i32 %shr160, %shl159
  %shl162 = shl i32 %44, 8
  %shr163 = lshr i32 %43, 24
  %or164 = or i32 %shl162, %shr163
  %xor165 = xor i32 %or161, %40
  %xor166 = xor i32 %or164, %41
  %arrayidx167 = getelementptr inbounds i8, i8* %x, i32 26
  %45 = load i8, i8* %arrayidx167, align 1, !tbaa !11
  %conv168 = zext i8 %45 to i32
  %mul169 = shl nuw nsw i32 %conv168, 1
  %arrayidx170 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul169
  %46 = load i32, i32* %arrayidx170, align 8, !tbaa !2
  %add174 = or i32 %mul169, 1
  %arrayidx175 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add174
  %47 = load i32, i32* %arrayidx175, align 4, !tbaa !2
  %shl176 = shl i32 %46, 16
  %shr177 = lshr i32 %47, 16
  %or178 = or i32 %shr177, %shl176
  %shl179 = shl i32 %47, 16
  %shr180 = lshr i32 %46, 16
  %or181 = or i32 %shl179, %shr180
  %xor182 = xor i32 %xor165, %or178
  %xor183 = xor i32 %xor166, %or181
  %arrayidx184 = getelementptr inbounds i8, i8* %x, i32 35
  %48 = load i8, i8* %arrayidx184, align 1, !tbaa !11
  %conv185 = zext i8 %48 to i32
  %mul186 = shl nuw nsw i32 %conv185, 1
  %arrayidx187 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul186
  %49 = load i32, i32* %arrayidx187, align 8, !tbaa !2
  %add191 = or i32 %mul186, 1
  %arrayidx192 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add191
  %50 = load i32, i32* %arrayidx192, align 4, !tbaa !2
  %shl193 = shl i32 %49, 24
  %shr194 = lshr i32 %50, 8
  %or195 = or i32 %shr194, %shl193
  %shl196 = shl i32 %50, 24
  %shr197 = lshr i32 %49, 8
  %or198 = or i32 %shl196, %shr197
  %xor199 = xor i32 %xor182, %or195
  %xor200 = xor i32 %xor183, %or198
  %arrayidx201 = getelementptr inbounds i8, i8* %x, i32 44
  %51 = load i8, i8* %arrayidx201, align 1, !tbaa !11
  %conv202 = zext i8 %51 to i32
  %mul203 = shl nuw nsw i32 %conv202, 1
  %arrayidx204 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul203
  %52 = load i32, i32* %arrayidx204, align 8, !tbaa !2
  %xor205 = xor i32 %xor200, %52
  %add209 = or i32 %mul203, 1
  %arrayidx210 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add209
  %53 = load i32, i32* %arrayidx210, align 4, !tbaa !2
  %xor211 = xor i32 %xor199, %53
  %arrayidx212 = getelementptr inbounds i8, i8* %x, i32 53
  %54 = load i8, i8* %arrayidx212, align 1, !tbaa !11
  %conv213 = zext i8 %54 to i32
  %mul214 = shl nuw nsw i32 %conv213, 1
  %arrayidx215 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul214
  %55 = load i32, i32* %arrayidx215, align 8, !tbaa !2
  %add219 = or i32 %mul214, 1
  %arrayidx220 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add219
  %56 = load i32, i32* %arrayidx220, align 4, !tbaa !2
  %shl221 = shl i32 %55, 8
  %shr222 = lshr i32 %56, 24
  %or223 = or i32 %shr222, %shl221
  %shl224 = shl i32 %56, 8
  %shr225 = lshr i32 %55, 24
  %or226 = or i32 %shl224, %shr225
  %xor227 = xor i32 %xor205, %or223
  %xor228 = xor i32 %xor211, %or226
  %arrayidx229 = getelementptr inbounds i8, i8* %x, i32 62
  %57 = load i8, i8* %arrayidx229, align 1, !tbaa !11
  %conv230 = zext i8 %57 to i32
  %mul231 = shl nuw nsw i32 %conv230, 1
  %arrayidx232 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul231
  %58 = load i32, i32* %arrayidx232, align 8, !tbaa !2
  %add236 = or i32 %mul231, 1
  %arrayidx237 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add236
  %59 = load i32, i32* %arrayidx237, align 4, !tbaa !2
  %shl238 = shl i32 %58, 16
  %shr239 = lshr i32 %59, 16
  %or240 = or i32 %shr239, %shl238
  %shl241 = shl i32 %59, 16
  %shr242 = lshr i32 %58, 16
  %or243 = or i32 %shl241, %shr242
  %xor244 = xor i32 %xor227, %or240
  %xor245 = xor i32 %xor228, %or243
  %arrayidx246 = getelementptr inbounds i8, i8* %x, i32 7
  %60 = load i8, i8* %arrayidx246, align 1, !tbaa !11
  %conv247 = zext i8 %60 to i32
  %mul248 = shl nuw nsw i32 %conv247, 1
  %arrayidx249 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul248
  %61 = load i32, i32* %arrayidx249, align 8, !tbaa !2
  %add253 = or i32 %mul248, 1
  %arrayidx254 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add253
  %62 = load i32, i32* %arrayidx254, align 4, !tbaa !2
  %shl255 = shl i32 %61, 24
  %shr256 = lshr i32 %62, 8
  %or257 = or i32 %shr256, %shl255
  %shl258 = shl i32 %62, 24
  %shr259 = lshr i32 %61, 8
  %or260 = or i32 %shl258, %shr259
  %xor261 = xor i32 %xor244, %or257
  %xor262 = xor i32 %xor245, %or260
  %arrayidx263 = getelementptr inbounds i32, i32* %y, i32 2
  store i32 %xor262, i32* %arrayidx263, align 4, !tbaa !2
  %arrayidx264 = getelementptr inbounds i32, i32* %y, i32 3
  store i32 %xor261, i32* %arrayidx264, align 4, !tbaa !2
  %63 = load i8, i8* %arrayidx6, align 1, !tbaa !11
  %conv266 = zext i8 %63 to i32
  %mul267 = shl nuw nsw i32 %conv266, 1
  %arrayidx268 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul267
  %64 = load i32, i32* %arrayidx268, align 8, !tbaa !2
  %add272 = or i32 %mul267, 1
  %arrayidx273 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add272
  %65 = load i32, i32* %arrayidx273, align 4, !tbaa !2
  %arrayidx274 = getelementptr inbounds i8, i8* %x, i32 25
  %66 = load i8, i8* %arrayidx274, align 1, !tbaa !11
  %conv275 = zext i8 %66 to i32
  %mul276 = shl nuw nsw i32 %conv275, 1
  %arrayidx277 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul276
  %67 = load i32, i32* %arrayidx277, align 8, !tbaa !2
  %add281 = or i32 %mul276, 1
  %arrayidx282 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add281
  %68 = load i32, i32* %arrayidx282, align 4, !tbaa !2
  %shl283 = shl i32 %67, 8
  %shr284 = lshr i32 %68, 24
  %or285 = or i32 %shr284, %shl283
  %shl286 = shl i32 %68, 8
  %shr287 = lshr i32 %67, 24
  %or288 = or i32 %shl286, %shr287
  %xor289 = xor i32 %or285, %64
  %xor290 = xor i32 %or288, %65
  %arrayidx291 = getelementptr inbounds i8, i8* %x, i32 34
  %69 = load i8, i8* %arrayidx291, align 1, !tbaa !11
  %conv292 = zext i8 %69 to i32
  %mul293 = shl nuw nsw i32 %conv292, 1
  %arrayidx294 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul293
  %70 = load i32, i32* %arrayidx294, align 8, !tbaa !2
  %add298 = or i32 %mul293, 1
  %arrayidx299 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add298
  %71 = load i32, i32* %arrayidx299, align 4, !tbaa !2
  %shl300 = shl i32 %70, 16
  %shr301 = lshr i32 %71, 16
  %or302 = or i32 %shr301, %shl300
  %shl303 = shl i32 %71, 16
  %shr304 = lshr i32 %70, 16
  %or305 = or i32 %shl303, %shr304
  %xor306 = xor i32 %xor289, %or302
  %xor307 = xor i32 %xor290, %or305
  %arrayidx308 = getelementptr inbounds i8, i8* %x, i32 43
  %72 = load i8, i8* %arrayidx308, align 1, !tbaa !11
  %conv309 = zext i8 %72 to i32
  %mul310 = shl nuw nsw i32 %conv309, 1
  %arrayidx311 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul310
  %73 = load i32, i32* %arrayidx311, align 8, !tbaa !2
  %add315 = or i32 %mul310, 1
  %arrayidx316 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add315
  %74 = load i32, i32* %arrayidx316, align 4, !tbaa !2
  %shl317 = shl i32 %73, 24
  %shr318 = lshr i32 %74, 8
  %or319 = or i32 %shr318, %shl317
  %shl320 = shl i32 %74, 24
  %shr321 = lshr i32 %73, 8
  %or322 = or i32 %shl320, %shr321
  %xor323 = xor i32 %xor306, %or319
  %xor324 = xor i32 %xor307, %or322
  %arrayidx325 = getelementptr inbounds i8, i8* %x, i32 52
  %75 = load i8, i8* %arrayidx325, align 1, !tbaa !11
  %conv326 = zext i8 %75 to i32
  %mul327 = shl nuw nsw i32 %conv326, 1
  %arrayidx328 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul327
  %76 = load i32, i32* %arrayidx328, align 8, !tbaa !2
  %xor329 = xor i32 %xor324, %76
  %add333 = or i32 %mul327, 1
  %arrayidx334 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add333
  %77 = load i32, i32* %arrayidx334, align 4, !tbaa !2
  %xor335 = xor i32 %xor323, %77
  %arrayidx336 = getelementptr inbounds i8, i8* %x, i32 61
  %78 = load i8, i8* %arrayidx336, align 1, !tbaa !11
  %conv337 = zext i8 %78 to i32
  %mul338 = shl nuw nsw i32 %conv337, 1
  %arrayidx339 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul338
  %79 = load i32, i32* %arrayidx339, align 8, !tbaa !2
  %add343 = or i32 %mul338, 1
  %arrayidx344 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add343
  %80 = load i32, i32* %arrayidx344, align 4, !tbaa !2
  %shl345 = shl i32 %79, 8
  %shr346 = lshr i32 %80, 24
  %or347 = or i32 %shr346, %shl345
  %shl348 = shl i32 %80, 8
  %shr349 = lshr i32 %79, 24
  %or350 = or i32 %shl348, %shr349
  %xor351 = xor i32 %xor329, %or347
  %xor352 = xor i32 %xor335, %or350
  %arrayidx353 = getelementptr inbounds i8, i8* %x, i32 6
  %81 = load i8, i8* %arrayidx353, align 1, !tbaa !11
  %conv354 = zext i8 %81 to i32
  %mul355 = shl nuw nsw i32 %conv354, 1
  %arrayidx356 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul355
  %82 = load i32, i32* %arrayidx356, align 8, !tbaa !2
  %add360 = or i32 %mul355, 1
  %arrayidx361 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add360
  %83 = load i32, i32* %arrayidx361, align 4, !tbaa !2
  %shl362 = shl i32 %82, 16
  %shr363 = lshr i32 %83, 16
  %or364 = or i32 %shr363, %shl362
  %shl365 = shl i32 %83, 16
  %shr366 = lshr i32 %82, 16
  %or367 = or i32 %shl365, %shr366
  %xor368 = xor i32 %xor351, %or364
  %xor369 = xor i32 %xor352, %or367
  %arrayidx370 = getelementptr inbounds i8, i8* %x, i32 15
  %84 = load i8, i8* %arrayidx370, align 1, !tbaa !11
  %conv371 = zext i8 %84 to i32
  %mul372 = shl nuw nsw i32 %conv371, 1
  %arrayidx373 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul372
  %85 = load i32, i32* %arrayidx373, align 8, !tbaa !2
  %add377 = or i32 %mul372, 1
  %arrayidx378 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add377
  %86 = load i32, i32* %arrayidx378, align 4, !tbaa !2
  %shl379 = shl i32 %85, 24
  %shr380 = lshr i32 %86, 8
  %or381 = or i32 %shr380, %shl379
  %shl382 = shl i32 %86, 24
  %shr383 = lshr i32 %85, 8
  %or384 = or i32 %shl382, %shr383
  %xor385 = xor i32 %xor368, %or381
  %xor386 = xor i32 %xor369, %or384
  %arrayidx387 = getelementptr inbounds i32, i32* %y, i32 4
  store i32 %xor386, i32* %arrayidx387, align 4, !tbaa !2
  %arrayidx388 = getelementptr inbounds i32, i32* %y, i32 5
  store i32 %xor385, i32* %arrayidx388, align 4, !tbaa !2
  %87 = load i8, i8* %arrayidx9, align 1, !tbaa !11
  %conv390 = zext i8 %87 to i32
  %mul391 = shl nuw nsw i32 %conv390, 1
  %arrayidx392 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul391
  %88 = load i32, i32* %arrayidx392, align 8, !tbaa !2
  %add396 = or i32 %mul391, 1
  %arrayidx397 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add396
  %89 = load i32, i32* %arrayidx397, align 4, !tbaa !2
  %arrayidx398 = getelementptr inbounds i8, i8* %x, i32 33
  %90 = load i8, i8* %arrayidx398, align 1, !tbaa !11
  %conv399 = zext i8 %90 to i32
  %mul400 = shl nuw nsw i32 %conv399, 1
  %arrayidx401 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul400
  %91 = load i32, i32* %arrayidx401, align 8, !tbaa !2
  %add405 = or i32 %mul400, 1
  %arrayidx406 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add405
  %92 = load i32, i32* %arrayidx406, align 4, !tbaa !2
  %shl407 = shl i32 %91, 8
  %shr408 = lshr i32 %92, 24
  %or409 = or i32 %shr408, %shl407
  %shl410 = shl i32 %92, 8
  %shr411 = lshr i32 %91, 24
  %or412 = or i32 %shl410, %shr411
  %xor413 = xor i32 %or409, %88
  %xor414 = xor i32 %or412, %89
  %arrayidx415 = getelementptr inbounds i8, i8* %x, i32 42
  %93 = load i8, i8* %arrayidx415, align 1, !tbaa !11
  %conv416 = zext i8 %93 to i32
  %mul417 = shl nuw nsw i32 %conv416, 1
  %arrayidx418 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul417
  %94 = load i32, i32* %arrayidx418, align 8, !tbaa !2
  %add422 = or i32 %mul417, 1
  %arrayidx423 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add422
  %95 = load i32, i32* %arrayidx423, align 4, !tbaa !2
  %shl424 = shl i32 %94, 16
  %shr425 = lshr i32 %95, 16
  %or426 = or i32 %shr425, %shl424
  %shl427 = shl i32 %95, 16
  %shr428 = lshr i32 %94, 16
  %or429 = or i32 %shl427, %shr428
  %xor430 = xor i32 %xor413, %or426
  %xor431 = xor i32 %xor414, %or429
  %arrayidx432 = getelementptr inbounds i8, i8* %x, i32 51
  %96 = load i8, i8* %arrayidx432, align 1, !tbaa !11
  %conv433 = zext i8 %96 to i32
  %mul434 = shl nuw nsw i32 %conv433, 1
  %arrayidx435 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul434
  %97 = load i32, i32* %arrayidx435, align 8, !tbaa !2
  %add439 = or i32 %mul434, 1
  %arrayidx440 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add439
  %98 = load i32, i32* %arrayidx440, align 4, !tbaa !2
  %shl441 = shl i32 %97, 24
  %shr442 = lshr i32 %98, 8
  %or443 = or i32 %shr442, %shl441
  %shl444 = shl i32 %98, 24
  %shr445 = lshr i32 %97, 8
  %or446 = or i32 %shl444, %shr445
  %xor447 = xor i32 %xor430, %or443
  %xor448 = xor i32 %xor431, %or446
  %arrayidx449 = getelementptr inbounds i8, i8* %x, i32 60
  %99 = load i8, i8* %arrayidx449, align 1, !tbaa !11
  %conv450 = zext i8 %99 to i32
  %mul451 = shl nuw nsw i32 %conv450, 1
  %arrayidx452 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul451
  %100 = load i32, i32* %arrayidx452, align 8, !tbaa !2
  %xor453 = xor i32 %xor448, %100
  %add457 = or i32 %mul451, 1
  %arrayidx458 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add457
  %101 = load i32, i32* %arrayidx458, align 4, !tbaa !2
  %xor459 = xor i32 %xor447, %101
  %arrayidx460 = getelementptr inbounds i8, i8* %x, i32 5
  %102 = load i8, i8* %arrayidx460, align 1, !tbaa !11
  %conv461 = zext i8 %102 to i32
  %mul462 = shl nuw nsw i32 %conv461, 1
  %arrayidx463 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul462
  %103 = load i32, i32* %arrayidx463, align 8, !tbaa !2
  %add467 = or i32 %mul462, 1
  %arrayidx468 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add467
  %104 = load i32, i32* %arrayidx468, align 4, !tbaa !2
  %shl469 = shl i32 %103, 8
  %shr470 = lshr i32 %104, 24
  %or471 = or i32 %shr470, %shl469
  %shl472 = shl i32 %104, 8
  %shr473 = lshr i32 %103, 24
  %or474 = or i32 %shl472, %shr473
  %xor475 = xor i32 %xor453, %or471
  %xor476 = xor i32 %xor459, %or474
  %arrayidx477 = getelementptr inbounds i8, i8* %x, i32 14
  %105 = load i8, i8* %arrayidx477, align 1, !tbaa !11
  %conv478 = zext i8 %105 to i32
  %mul479 = shl nuw nsw i32 %conv478, 1
  %arrayidx480 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul479
  %106 = load i32, i32* %arrayidx480, align 8, !tbaa !2
  %add484 = or i32 %mul479, 1
  %arrayidx485 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add484
  %107 = load i32, i32* %arrayidx485, align 4, !tbaa !2
  %shl486 = shl i32 %106, 16
  %shr487 = lshr i32 %107, 16
  %or488 = or i32 %shr487, %shl486
  %shl489 = shl i32 %107, 16
  %shr490 = lshr i32 %106, 16
  %or491 = or i32 %shl489, %shr490
  %xor492 = xor i32 %xor475, %or488
  %xor493 = xor i32 %xor476, %or491
  %arrayidx494 = getelementptr inbounds i8, i8* %x, i32 23
  %108 = load i8, i8* %arrayidx494, align 1, !tbaa !11
  %conv495 = zext i8 %108 to i32
  %mul496 = shl nuw nsw i32 %conv495, 1
  %arrayidx497 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul496
  %109 = load i32, i32* %arrayidx497, align 8, !tbaa !2
  %add501 = or i32 %mul496, 1
  %arrayidx502 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add501
  %110 = load i32, i32* %arrayidx502, align 4, !tbaa !2
  %shl503 = shl i32 %109, 24
  %shr504 = lshr i32 %110, 8
  %or505 = or i32 %shr504, %shl503
  %shl506 = shl i32 %110, 24
  %shr507 = lshr i32 %109, 8
  %or508 = or i32 %shl506, %shr507
  %xor509 = xor i32 %xor492, %or505
  %xor510 = xor i32 %xor493, %or508
  %arrayidx511 = getelementptr inbounds i32, i32* %y, i32 6
  store i32 %xor510, i32* %arrayidx511, align 4, !tbaa !2
  %arrayidx512 = getelementptr inbounds i32, i32* %y, i32 7
  store i32 %xor509, i32* %arrayidx512, align 4, !tbaa !2
  %111 = load i8, i8* %arrayidx12, align 1, !tbaa !11
  %conv514 = zext i8 %111 to i32
  %mul515 = shl nuw nsw i32 %conv514, 1
  %arrayidx516 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul515
  %112 = load i32, i32* %arrayidx516, align 8, !tbaa !2
  %add520 = or i32 %mul515, 1
  %arrayidx521 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add520
  %113 = load i32, i32* %arrayidx521, align 4, !tbaa !2
  %arrayidx522 = getelementptr inbounds i8, i8* %x, i32 41
  %114 = load i8, i8* %arrayidx522, align 1, !tbaa !11
  %conv523 = zext i8 %114 to i32
  %mul524 = shl nuw nsw i32 %conv523, 1
  %arrayidx525 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul524
  %115 = load i32, i32* %arrayidx525, align 8, !tbaa !2
  %add529 = or i32 %mul524, 1
  %arrayidx530 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add529
  %116 = load i32, i32* %arrayidx530, align 4, !tbaa !2
  %shl531 = shl i32 %115, 8
  %shr532 = lshr i32 %116, 24
  %or533 = or i32 %shr532, %shl531
  %shl534 = shl i32 %116, 8
  %shr535 = lshr i32 %115, 24
  %or536 = or i32 %shl534, %shr535
  %xor537 = xor i32 %or533, %112
  %xor538 = xor i32 %or536, %113
  %arrayidx539 = getelementptr inbounds i8, i8* %x, i32 50
  %117 = load i8, i8* %arrayidx539, align 1, !tbaa !11
  %conv540 = zext i8 %117 to i32
  %mul541 = shl nuw nsw i32 %conv540, 1
  %arrayidx542 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul541
  %118 = load i32, i32* %arrayidx542, align 8, !tbaa !2
  %add546 = or i32 %mul541, 1
  %arrayidx547 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add546
  %119 = load i32, i32* %arrayidx547, align 4, !tbaa !2
  %shl548 = shl i32 %118, 16
  %shr549 = lshr i32 %119, 16
  %or550 = or i32 %shr549, %shl548
  %shl551 = shl i32 %119, 16
  %shr552 = lshr i32 %118, 16
  %or553 = or i32 %shl551, %shr552
  %xor554 = xor i32 %xor537, %or550
  %xor555 = xor i32 %xor538, %or553
  %arrayidx556 = getelementptr inbounds i8, i8* %x, i32 59
  %120 = load i8, i8* %arrayidx556, align 1, !tbaa !11
  %conv557 = zext i8 %120 to i32
  %mul558 = shl nuw nsw i32 %conv557, 1
  %arrayidx559 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul558
  %121 = load i32, i32* %arrayidx559, align 8, !tbaa !2
  %add563 = or i32 %mul558, 1
  %arrayidx564 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add563
  %122 = load i32, i32* %arrayidx564, align 4, !tbaa !2
  %shl565 = shl i32 %121, 24
  %shr566 = lshr i32 %122, 8
  %or567 = or i32 %shr566, %shl565
  %shl568 = shl i32 %122, 24
  %shr569 = lshr i32 %121, 8
  %or570 = or i32 %shl568, %shr569
  %xor571 = xor i32 %xor554, %or567
  %xor572 = xor i32 %xor555, %or570
  %arrayidx573 = getelementptr inbounds i8, i8* %x, i32 4
  %123 = load i8, i8* %arrayidx573, align 1, !tbaa !11
  %conv574 = zext i8 %123 to i32
  %mul575 = shl nuw nsw i32 %conv574, 1
  %arrayidx576 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul575
  %124 = load i32, i32* %arrayidx576, align 8, !tbaa !2
  %xor577 = xor i32 %xor572, %124
  %add581 = or i32 %mul575, 1
  %arrayidx582 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add581
  %125 = load i32, i32* %arrayidx582, align 4, !tbaa !2
  %xor583 = xor i32 %xor571, %125
  %arrayidx584 = getelementptr inbounds i8, i8* %x, i32 13
  %126 = load i8, i8* %arrayidx584, align 1, !tbaa !11
  %conv585 = zext i8 %126 to i32
  %mul586 = shl nuw nsw i32 %conv585, 1
  %arrayidx587 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul586
  %127 = load i32, i32* %arrayidx587, align 8, !tbaa !2
  %add591 = or i32 %mul586, 1
  %arrayidx592 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add591
  %128 = load i32, i32* %arrayidx592, align 4, !tbaa !2
  %shl593 = shl i32 %127, 8
  %shr594 = lshr i32 %128, 24
  %or595 = or i32 %shr594, %shl593
  %shl596 = shl i32 %128, 8
  %shr597 = lshr i32 %127, 24
  %or598 = or i32 %shl596, %shr597
  %xor599 = xor i32 %xor577, %or595
  %xor600 = xor i32 %xor583, %or598
  %arrayidx601 = getelementptr inbounds i8, i8* %x, i32 22
  %129 = load i8, i8* %arrayidx601, align 1, !tbaa !11
  %conv602 = zext i8 %129 to i32
  %mul603 = shl nuw nsw i32 %conv602, 1
  %arrayidx604 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul603
  %130 = load i32, i32* %arrayidx604, align 8, !tbaa !2
  %add608 = or i32 %mul603, 1
  %arrayidx609 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add608
  %131 = load i32, i32* %arrayidx609, align 4, !tbaa !2
  %shl610 = shl i32 %130, 16
  %shr611 = lshr i32 %131, 16
  %or612 = or i32 %shr611, %shl610
  %shl613 = shl i32 %131, 16
  %shr614 = lshr i32 %130, 16
  %or615 = or i32 %shl613, %shr614
  %xor616 = xor i32 %xor599, %or612
  %xor617 = xor i32 %xor600, %or615
  %arrayidx618 = getelementptr inbounds i8, i8* %x, i32 31
  %132 = load i8, i8* %arrayidx618, align 1, !tbaa !11
  %conv619 = zext i8 %132 to i32
  %mul620 = shl nuw nsw i32 %conv619, 1
  %arrayidx621 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul620
  %133 = load i32, i32* %arrayidx621, align 8, !tbaa !2
  %add625 = or i32 %mul620, 1
  %arrayidx626 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add625
  %134 = load i32, i32* %arrayidx626, align 4, !tbaa !2
  %shl627 = shl i32 %133, 24
  %shr628 = lshr i32 %134, 8
  %or629 = or i32 %shr628, %shl627
  %shl630 = shl i32 %134, 24
  %shr631 = lshr i32 %133, 8
  %or632 = or i32 %shl630, %shr631
  %xor633 = xor i32 %xor616, %or629
  %xor634 = xor i32 %xor617, %or632
  %arrayidx635 = getelementptr inbounds i32, i32* %y, i32 8
  store i32 %xor634, i32* %arrayidx635, align 4, !tbaa !2
  %arrayidx636 = getelementptr inbounds i32, i32* %y, i32 9
  store i32 %xor633, i32* %arrayidx636, align 4, !tbaa !2
  %135 = load i8, i8* %arrayidx15, align 1, !tbaa !11
  %conv638 = zext i8 %135 to i32
  %mul639 = shl nuw nsw i32 %conv638, 1
  %arrayidx640 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul639
  %136 = load i32, i32* %arrayidx640, align 8, !tbaa !2
  %add644 = or i32 %mul639, 1
  %arrayidx645 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add644
  %137 = load i32, i32* %arrayidx645, align 4, !tbaa !2
  %arrayidx646 = getelementptr inbounds i8, i8* %x, i32 49
  %138 = load i8, i8* %arrayidx646, align 1, !tbaa !11
  %conv647 = zext i8 %138 to i32
  %mul648 = shl nuw nsw i32 %conv647, 1
  %arrayidx649 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul648
  %139 = load i32, i32* %arrayidx649, align 8, !tbaa !2
  %add653 = or i32 %mul648, 1
  %arrayidx654 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add653
  %140 = load i32, i32* %arrayidx654, align 4, !tbaa !2
  %shl655 = shl i32 %139, 8
  %shr656 = lshr i32 %140, 24
  %or657 = or i32 %shr656, %shl655
  %shl658 = shl i32 %140, 8
  %shr659 = lshr i32 %139, 24
  %or660 = or i32 %shl658, %shr659
  %xor661 = xor i32 %or657, %136
  %xor662 = xor i32 %or660, %137
  %arrayidx663 = getelementptr inbounds i8, i8* %x, i32 58
  %141 = load i8, i8* %arrayidx663, align 1, !tbaa !11
  %conv664 = zext i8 %141 to i32
  %mul665 = shl nuw nsw i32 %conv664, 1
  %arrayidx666 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul665
  %142 = load i32, i32* %arrayidx666, align 8, !tbaa !2
  %add670 = or i32 %mul665, 1
  %arrayidx671 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add670
  %143 = load i32, i32* %arrayidx671, align 4, !tbaa !2
  %shl672 = shl i32 %142, 16
  %shr673 = lshr i32 %143, 16
  %or674 = or i32 %shr673, %shl672
  %shl675 = shl i32 %143, 16
  %shr676 = lshr i32 %142, 16
  %or677 = or i32 %shl675, %shr676
  %xor678 = xor i32 %xor661, %or674
  %xor679 = xor i32 %xor662, %or677
  %arrayidx680 = getelementptr inbounds i8, i8* %x, i32 3
  %144 = load i8, i8* %arrayidx680, align 1, !tbaa !11
  %conv681 = zext i8 %144 to i32
  %mul682 = shl nuw nsw i32 %conv681, 1
  %arrayidx683 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul682
  %145 = load i32, i32* %arrayidx683, align 8, !tbaa !2
  %add687 = or i32 %mul682, 1
  %arrayidx688 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add687
  %146 = load i32, i32* %arrayidx688, align 4, !tbaa !2
  %shl689 = shl i32 %145, 24
  %shr690 = lshr i32 %146, 8
  %or691 = or i32 %shr690, %shl689
  %shl692 = shl i32 %146, 24
  %shr693 = lshr i32 %145, 8
  %or694 = or i32 %shl692, %shr693
  %xor695 = xor i32 %xor678, %or691
  %xor696 = xor i32 %xor679, %or694
  %arrayidx697 = getelementptr inbounds i8, i8* %x, i32 12
  %147 = load i8, i8* %arrayidx697, align 1, !tbaa !11
  %conv698 = zext i8 %147 to i32
  %mul699 = shl nuw nsw i32 %conv698, 1
  %arrayidx700 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul699
  %148 = load i32, i32* %arrayidx700, align 8, !tbaa !2
  %xor701 = xor i32 %xor696, %148
  %add705 = or i32 %mul699, 1
  %arrayidx706 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add705
  %149 = load i32, i32* %arrayidx706, align 4, !tbaa !2
  %xor707 = xor i32 %xor695, %149
  %arrayidx708 = getelementptr inbounds i8, i8* %x, i32 21
  %150 = load i8, i8* %arrayidx708, align 1, !tbaa !11
  %conv709 = zext i8 %150 to i32
  %mul710 = shl nuw nsw i32 %conv709, 1
  %arrayidx711 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul710
  %151 = load i32, i32* %arrayidx711, align 8, !tbaa !2
  %add715 = or i32 %mul710, 1
  %arrayidx716 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add715
  %152 = load i32, i32* %arrayidx716, align 4, !tbaa !2
  %shl717 = shl i32 %151, 8
  %shr718 = lshr i32 %152, 24
  %or719 = or i32 %shr718, %shl717
  %shl720 = shl i32 %152, 8
  %shr721 = lshr i32 %151, 24
  %or722 = or i32 %shl720, %shr721
  %xor723 = xor i32 %xor701, %or719
  %xor724 = xor i32 %xor707, %or722
  %arrayidx725 = getelementptr inbounds i8, i8* %x, i32 30
  %153 = load i8, i8* %arrayidx725, align 1, !tbaa !11
  %conv726 = zext i8 %153 to i32
  %mul727 = shl nuw nsw i32 %conv726, 1
  %arrayidx728 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul727
  %154 = load i32, i32* %arrayidx728, align 8, !tbaa !2
  %add732 = or i32 %mul727, 1
  %arrayidx733 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add732
  %155 = load i32, i32* %arrayidx733, align 4, !tbaa !2
  %shl734 = shl i32 %154, 16
  %shr735 = lshr i32 %155, 16
  %or736 = or i32 %shr735, %shl734
  %shl737 = shl i32 %155, 16
  %shr738 = lshr i32 %154, 16
  %or739 = or i32 %shl737, %shr738
  %xor740 = xor i32 %xor723, %or736
  %xor741 = xor i32 %xor724, %or739
  %arrayidx742 = getelementptr inbounds i8, i8* %x, i32 39
  %156 = load i8, i8* %arrayidx742, align 1, !tbaa !11
  %conv743 = zext i8 %156 to i32
  %mul744 = shl nuw nsw i32 %conv743, 1
  %arrayidx745 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul744
  %157 = load i32, i32* %arrayidx745, align 8, !tbaa !2
  %add749 = or i32 %mul744, 1
  %arrayidx750 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add749
  %158 = load i32, i32* %arrayidx750, align 4, !tbaa !2
  %shl751 = shl i32 %157, 24
  %shr752 = lshr i32 %158, 8
  %or753 = or i32 %shr752, %shl751
  %shl754 = shl i32 %158, 24
  %shr755 = lshr i32 %157, 8
  %or756 = or i32 %shl754, %shr755
  %xor757 = xor i32 %xor740, %or753
  %xor758 = xor i32 %xor741, %or756
  %arrayidx759 = getelementptr inbounds i32, i32* %y, i32 10
  store i32 %xor758, i32* %arrayidx759, align 4, !tbaa !2
  %arrayidx760 = getelementptr inbounds i32, i32* %y, i32 11
  store i32 %xor757, i32* %arrayidx760, align 4, !tbaa !2
  %159 = load i8, i8* %arrayidx18, align 1, !tbaa !11
  %conv762 = zext i8 %159 to i32
  %mul763 = shl nuw nsw i32 %conv762, 1
  %arrayidx764 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul763
  %160 = load i32, i32* %arrayidx764, align 8, !tbaa !2
  %add768 = or i32 %mul763, 1
  %arrayidx769 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add768
  %161 = load i32, i32* %arrayidx769, align 4, !tbaa !2
  %arrayidx770 = getelementptr inbounds i8, i8* %x, i32 57
  %162 = load i8, i8* %arrayidx770, align 1, !tbaa !11
  %conv771 = zext i8 %162 to i32
  %mul772 = shl nuw nsw i32 %conv771, 1
  %arrayidx773 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul772
  %163 = load i32, i32* %arrayidx773, align 8, !tbaa !2
  %add777 = or i32 %mul772, 1
  %arrayidx778 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add777
  %164 = load i32, i32* %arrayidx778, align 4, !tbaa !2
  %shl779 = shl i32 %163, 8
  %shr780 = lshr i32 %164, 24
  %or781 = or i32 %shr780, %shl779
  %shl782 = shl i32 %164, 8
  %shr783 = lshr i32 %163, 24
  %or784 = or i32 %shl782, %shr783
  %xor785 = xor i32 %or781, %160
  %xor786 = xor i32 %or784, %161
  %arrayidx787 = getelementptr inbounds i8, i8* %x, i32 2
  %165 = load i8, i8* %arrayidx787, align 1, !tbaa !11
  %conv788 = zext i8 %165 to i32
  %mul789 = shl nuw nsw i32 %conv788, 1
  %arrayidx790 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul789
  %166 = load i32, i32* %arrayidx790, align 8, !tbaa !2
  %add794 = or i32 %mul789, 1
  %arrayidx795 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add794
  %167 = load i32, i32* %arrayidx795, align 4, !tbaa !2
  %shl796 = shl i32 %166, 16
  %shr797 = lshr i32 %167, 16
  %or798 = or i32 %shr797, %shl796
  %shl799 = shl i32 %167, 16
  %shr800 = lshr i32 %166, 16
  %or801 = or i32 %shl799, %shr800
  %xor802 = xor i32 %xor785, %or798
  %xor803 = xor i32 %xor786, %or801
  %arrayidx804 = getelementptr inbounds i8, i8* %x, i32 11
  %168 = load i8, i8* %arrayidx804, align 1, !tbaa !11
  %conv805 = zext i8 %168 to i32
  %mul806 = shl nuw nsw i32 %conv805, 1
  %arrayidx807 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul806
  %169 = load i32, i32* %arrayidx807, align 8, !tbaa !2
  %add811 = or i32 %mul806, 1
  %arrayidx812 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add811
  %170 = load i32, i32* %arrayidx812, align 4, !tbaa !2
  %shl813 = shl i32 %169, 24
  %shr814 = lshr i32 %170, 8
  %or815 = or i32 %shr814, %shl813
  %shl816 = shl i32 %170, 24
  %shr817 = lshr i32 %169, 8
  %or818 = or i32 %shl816, %shr817
  %xor819 = xor i32 %xor802, %or815
  %xor820 = xor i32 %xor803, %or818
  %arrayidx821 = getelementptr inbounds i8, i8* %x, i32 20
  %171 = load i8, i8* %arrayidx821, align 1, !tbaa !11
  %conv822 = zext i8 %171 to i32
  %mul823 = shl nuw nsw i32 %conv822, 1
  %arrayidx824 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul823
  %172 = load i32, i32* %arrayidx824, align 8, !tbaa !2
  %xor825 = xor i32 %xor820, %172
  %add829 = or i32 %mul823, 1
  %arrayidx830 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add829
  %173 = load i32, i32* %arrayidx830, align 4, !tbaa !2
  %xor831 = xor i32 %xor819, %173
  %arrayidx832 = getelementptr inbounds i8, i8* %x, i32 29
  %174 = load i8, i8* %arrayidx832, align 1, !tbaa !11
  %conv833 = zext i8 %174 to i32
  %mul834 = shl nuw nsw i32 %conv833, 1
  %arrayidx835 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul834
  %175 = load i32, i32* %arrayidx835, align 8, !tbaa !2
  %add839 = or i32 %mul834, 1
  %arrayidx840 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add839
  %176 = load i32, i32* %arrayidx840, align 4, !tbaa !2
  %shl841 = shl i32 %175, 8
  %shr842 = lshr i32 %176, 24
  %or843 = or i32 %shr842, %shl841
  %shl844 = shl i32 %176, 8
  %shr845 = lshr i32 %175, 24
  %or846 = or i32 %shl844, %shr845
  %xor847 = xor i32 %xor825, %or843
  %xor848 = xor i32 %xor831, %or846
  %arrayidx849 = getelementptr inbounds i8, i8* %x, i32 38
  %177 = load i8, i8* %arrayidx849, align 1, !tbaa !11
  %conv850 = zext i8 %177 to i32
  %mul851 = shl nuw nsw i32 %conv850, 1
  %arrayidx852 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul851
  %178 = load i32, i32* %arrayidx852, align 8, !tbaa !2
  %add856 = or i32 %mul851, 1
  %arrayidx857 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add856
  %179 = load i32, i32* %arrayidx857, align 4, !tbaa !2
  %shl858 = shl i32 %178, 16
  %shr859 = lshr i32 %179, 16
  %or860 = or i32 %shr859, %shl858
  %shl861 = shl i32 %179, 16
  %shr862 = lshr i32 %178, 16
  %or863 = or i32 %shl861, %shr862
  %xor864 = xor i32 %xor847, %or860
  %xor865 = xor i32 %xor848, %or863
  %arrayidx866 = getelementptr inbounds i8, i8* %x, i32 47
  %180 = load i8, i8* %arrayidx866, align 1, !tbaa !11
  %conv867 = zext i8 %180 to i32
  %mul868 = shl nuw nsw i32 %conv867, 1
  %arrayidx869 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul868
  %181 = load i32, i32* %arrayidx869, align 8, !tbaa !2
  %add873 = or i32 %mul868, 1
  %arrayidx874 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add873
  %182 = load i32, i32* %arrayidx874, align 4, !tbaa !2
  %shl875 = shl i32 %181, 24
  %shr876 = lshr i32 %182, 8
  %or877 = or i32 %shr876, %shl875
  %shl878 = shl i32 %182, 24
  %shr879 = lshr i32 %181, 8
  %or880 = or i32 %shl878, %shr879
  %xor881 = xor i32 %xor864, %or877
  %xor882 = xor i32 %xor865, %or880
  %arrayidx883 = getelementptr inbounds i32, i32* %y, i32 12
  store i32 %xor882, i32* %arrayidx883, align 4, !tbaa !2
  %arrayidx884 = getelementptr inbounds i32, i32* %y, i32 13
  store i32 %xor881, i32* %arrayidx884, align 4, !tbaa !2
  %183 = load i8, i8* %arrayidx21, align 1, !tbaa !11
  %conv886 = zext i8 %183 to i32
  %mul887 = shl nuw nsw i32 %conv886, 1
  %arrayidx888 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul887
  %184 = load i32, i32* %arrayidx888, align 8, !tbaa !2
  %add892 = or i32 %mul887, 1
  %arrayidx893 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add892
  %185 = load i32, i32* %arrayidx893, align 4, !tbaa !2
  %arrayidx894 = getelementptr inbounds i8, i8* %x, i32 1
  %186 = load i8, i8* %arrayidx894, align 1, !tbaa !11
  %conv895 = zext i8 %186 to i32
  %mul896 = shl nuw nsw i32 %conv895, 1
  %arrayidx897 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul896
  %187 = load i32, i32* %arrayidx897, align 8, !tbaa !2
  %add901 = or i32 %mul896, 1
  %arrayidx902 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add901
  %188 = load i32, i32* %arrayidx902, align 4, !tbaa !2
  %shl903 = shl i32 %187, 8
  %shr904 = lshr i32 %188, 24
  %or905 = or i32 %shr904, %shl903
  %shl906 = shl i32 %188, 8
  %shr907 = lshr i32 %187, 24
  %or908 = or i32 %shl906, %shr907
  %xor909 = xor i32 %or905, %184
  %xor910 = xor i32 %or908, %185
  %arrayidx911 = getelementptr inbounds i8, i8* %x, i32 10
  %189 = load i8, i8* %arrayidx911, align 1, !tbaa !11
  %conv912 = zext i8 %189 to i32
  %mul913 = shl nuw nsw i32 %conv912, 1
  %arrayidx914 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul913
  %190 = load i32, i32* %arrayidx914, align 8, !tbaa !2
  %add918 = or i32 %mul913, 1
  %arrayidx919 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add918
  %191 = load i32, i32* %arrayidx919, align 4, !tbaa !2
  %shl920 = shl i32 %190, 16
  %shr921 = lshr i32 %191, 16
  %or922 = or i32 %shr921, %shl920
  %shl923 = shl i32 %191, 16
  %shr924 = lshr i32 %190, 16
  %or925 = or i32 %shl923, %shr924
  %xor926 = xor i32 %xor909, %or922
  %xor927 = xor i32 %xor910, %or925
  %arrayidx928 = getelementptr inbounds i8, i8* %x, i32 19
  %192 = load i8, i8* %arrayidx928, align 1, !tbaa !11
  %conv929 = zext i8 %192 to i32
  %mul930 = shl nuw nsw i32 %conv929, 1
  %arrayidx931 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul930
  %193 = load i32, i32* %arrayidx931, align 8, !tbaa !2
  %add935 = or i32 %mul930, 1
  %arrayidx936 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add935
  %194 = load i32, i32* %arrayidx936, align 4, !tbaa !2
  %shl937 = shl i32 %193, 24
  %shr938 = lshr i32 %194, 8
  %or939 = or i32 %shr938, %shl937
  %shl940 = shl i32 %194, 24
  %shr941 = lshr i32 %193, 8
  %or942 = or i32 %shl940, %shr941
  %xor943 = xor i32 %xor926, %or939
  %xor944 = xor i32 %xor927, %or942
  %arrayidx945 = getelementptr inbounds i8, i8* %x, i32 28
  %195 = load i8, i8* %arrayidx945, align 1, !tbaa !11
  %conv946 = zext i8 %195 to i32
  %mul947 = shl nuw nsw i32 %conv946, 1
  %arrayidx948 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul947
  %196 = load i32, i32* %arrayidx948, align 8, !tbaa !2
  %xor949 = xor i32 %xor944, %196
  %add953 = or i32 %mul947, 1
  %arrayidx954 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add953
  %197 = load i32, i32* %arrayidx954, align 4, !tbaa !2
  %xor955 = xor i32 %xor943, %197
  %arrayidx956 = getelementptr inbounds i8, i8* %x, i32 37
  %198 = load i8, i8* %arrayidx956, align 1, !tbaa !11
  %conv957 = zext i8 %198 to i32
  %mul958 = shl nuw nsw i32 %conv957, 1
  %arrayidx959 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul958
  %199 = load i32, i32* %arrayidx959, align 8, !tbaa !2
  %add963 = or i32 %mul958, 1
  %arrayidx964 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add963
  %200 = load i32, i32* %arrayidx964, align 4, !tbaa !2
  %shl965 = shl i32 %199, 8
  %shr966 = lshr i32 %200, 24
  %or967 = or i32 %shr966, %shl965
  %shl968 = shl i32 %200, 8
  %shr969 = lshr i32 %199, 24
  %or970 = or i32 %shl968, %shr969
  %xor971 = xor i32 %xor949, %or967
  %xor972 = xor i32 %xor955, %or970
  %arrayidx973 = getelementptr inbounds i8, i8* %x, i32 46
  %201 = load i8, i8* %arrayidx973, align 1, !tbaa !11
  %conv974 = zext i8 %201 to i32
  %mul975 = shl nuw nsw i32 %conv974, 1
  %arrayidx976 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul975
  %202 = load i32, i32* %arrayidx976, align 8, !tbaa !2
  %add980 = or i32 %mul975, 1
  %arrayidx981 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add980
  %203 = load i32, i32* %arrayidx981, align 4, !tbaa !2
  %shl982 = shl i32 %202, 16
  %shr983 = lshr i32 %203, 16
  %or984 = or i32 %shr983, %shl982
  %shl985 = shl i32 %203, 16
  %shr986 = lshr i32 %202, 16
  %or987 = or i32 %shl985, %shr986
  %xor988 = xor i32 %xor971, %or984
  %xor989 = xor i32 %xor972, %or987
  %arrayidx990 = getelementptr inbounds i8, i8* %x, i32 55
  %204 = load i8, i8* %arrayidx990, align 1, !tbaa !11
  %conv991 = zext i8 %204 to i32
  %mul992 = shl nuw nsw i32 %conv991, 1
  %arrayidx993 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %mul992
  %205 = load i32, i32* %arrayidx993, align 8, !tbaa !2
  %add997 = or i32 %mul992, 1
  %arrayidx998 = getelementptr inbounds [512 x i32], [512 x i32]* @T, i32 0, i32 %add997
  %206 = load i32, i32* %arrayidx998, align 4, !tbaa !2
  %shl999 = shl i32 %205, 24
  %shr1000 = lshr i32 %206, 8
  %or1001 = or i32 %shr1000, %shl999
  %shl1002 = shl i32 %206, 24
  %shr1003 = lshr i32 %205, 8
  %or1004 = or i32 %shl1002, %shr1003
  %xor1005 = xor i32 %xor988, %or1001
  %xor1006 = xor i32 %xor989, %or1004
  %arrayidx1007 = getelementptr inbounds i32, i32* %y, i32 14
  store i32 %xor1006, i32* %arrayidx1007, align 4, !tbaa !2
  %arrayidx1008 = getelementptr inbounds i32, i32* %y, i32 15
  store i32 %xor1005, i32* %arrayidx1008, align 4, !tbaa !2
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nofree norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (/b/s/w/ir/cache/git/chromium.googlesource.com-external-github.com-llvm-llvm--project 3774bcf9f84520a8c35bf765d9a528040d68a14b)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !3, i64 136}
!7 = !{!"", !4, i64 0, !3, i64 64, !3, i64 68, !4, i64 72, !3, i64 136, !3, i64 140}
!8 = !{!7, !3, i64 64}
!9 = !{!7, !3, i64 68}
!10 = !{!7, !3, i64 140}
!11 = !{!4, !4, i64 0}
