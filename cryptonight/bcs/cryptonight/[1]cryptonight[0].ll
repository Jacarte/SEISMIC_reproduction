; ModuleID = 'cryptonight/[1]cryptonight[0].bc'
source_filename = "cryptonight.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-emscripten"

%struct.V4_Instruction = type { i8, i8, i8, i32 }
%struct._oaes_ctx = type { %struct._oaes_key*, i16, [16 x i8] }
%struct._oaes_key = type { i32, i8*, i32, i8*, i32, i32 }
%union.cn_slow_hash_state = type { %union.hash_state }
%union.hash_state = type { [25 x i64] }

@lastHeight = hidden local_unnamed_addr global i32 -1, align 4
@extra_hashes = hidden local_unnamed_addr constant [4 x void (i8*, i32, i8*)*] [void (i8*, i32, i8*)* @do_blake_hash, void (i8*, i32, i8*)* @do_groestl_hash, void (i8*, i32, i8*)* @do_jh_hash, void (i8*, i32, i8*)* @do_skein_hash], align 16
@TestTable1 = hidden local_unnamed_addr constant [256 x i32] [i32 -1520213050, i32 -2072216328, i32 -1720223762, i32 -1921287178, i32 234025727, i32 -1117033514, i32 -1318096930, i32 1422247313, i32 1345335392, i32 50397442, i32 -1452841010, i32 2099981142, i32 436141799, i32 1658312629, i32 -424957107, i32 -1703512340, i32 1170918031, i32 -1652391393, i32 1086966153, i32 -2021818886, i32 368769775, i32 -346465870, i32 -918075506, i32 200339707, i32 -324162239, i32 1742001331, i32 -39673249, i32 -357585083, i32 -1080255453, i32 -140204973, i32 -1770884380, i32 1539358875, i32 -1028147339, i32 486407649, i32 -1366060227, i32 1780885068, i32 1513502316, i32 1094664062, i32 49805301, i32 1338821763, i32 1546925160, i32 -190470831, i32 887481809, i32 150073849, i32 -1821281822, i32 1943591083, i32 1395732834, i32 1058346282, i32 201589768, i32 1388824469, i32 1696801606, i32 1589887901, i32 672667696, i32 -1583966665, i32 251987210, i32 -1248159185, i32 151455502, i32 907153956, i32 -1686077413, i32 1038279391, i32 652995533, i32 1764173646, i32 -843926913, i32 -1619692054, i32 453576978, i32 -1635548387, i32 1949051992, i32 773462580, i32 756751158, i32 -1301385508, i32 -296068428, i32 -73359269, i32 -162377052, i32 1295727478, i32 1641469623, i32 -827083907, i32 2066295122, i32 1055122397, i32 1898917726, i32 -1752923117, i32 -179088474, i32 1758581177, i32 0, i32 753790401, i32 1612718144, i32 536673507, i32 -927878791, i32 -312779850, i32 -1100322092, i32 1187761037, i32 -641810841, i32 1262041458, i32 -565556588, i32 -733197160, i32 -396863312, i32 1255133061, i32 1808847035, i32 720367557, i32 -441800113, i32 385612781, i32 -985447546, i32 -682799718, i32 1429418854, i32 -1803188975, i32 -817543798, i32 284817897, i32 100794884, i32 -2122350594, i32 -263171936, i32 1144798328, i32 -1163944155, i32 -475486133, i32 -212774494, i32 -22830243, i32 -1069531008, i32 -1970303227, i32 -1382903233, i32 -1130521311, i32 1211644016, i32 83228145, i32 -541279133, i32 -1044990345, i32 1977277103, i32 1663115586, i32 806359072, i32 452984805, i32 250868733, i32 1842533055, i32 1288555905, i32 336333848, i32 890442534, i32 804056259, i32 -513843266, i32 -1567123659, i32 -867941240, i32 957814574, i32 1472513171, i32 -223893675, i32 -2105639172, i32 1195195770, i32 -1402706744, i32 -413311558, i32 723065138, i32 -1787595802, i32 -1604296512, i32 -1736343271, i32 -783331426, i32 2145180835, i32 1713513028, i32 2116692564, i32 -1416589253, i32 -2088204277, i32 -901364084, i32 703524551, i32 -742868885, i32 1007948840, i32 2044649127, i32 -497131844, i32 487262998, i32 1994120109, i32 1004593371, i32 1446130276, i32 1312438900, i32 503974420, i32 -615954030, i32 168166924, i32 1814307912, i32 -463709000, i32 1573044895, i32 1859376061, i32 -273896381, i32 -1503501628, i32 -1466855111, i32 -1533700815, i32 937747667, i32 -1954973198, i32 854058965, i32 1137232011, i32 1496790894, i32 -1217565222, i32 -1936880383, i32 1691735473, i32 -766620004, i32 -525751991, i32 -1267962664, i32 -95005012, i32 133494003, i32 636152527, i32 -1352309302, i32 -1904575756, i32 -374428089, i32 403179536, i32 -709182865, i32 -2005370640, i32 1864705354, i32 1915629148, i32 605822008, i32 -240736681, i32 -944458637, i32 1371981463, i32 602466507, i32 2094914977, i32 -1670089496, i32 555687742, i32 -582268010, i32 -591544991, i32 -2037675251, i32 -2054518257, i32 -1871679264, i32 1111375484, i32 -994724495, i32 -1436129588, i32 -666351472, i32 84083462, i32 32962295, i32 302911004, i32 -1553899070, i32 1597322602, i32 -111716434, i32 -793134743, i32 -1853454825, i32 1489093017, i32 656219450, i32 -1180787161, i32 954327513, i32 335083755, i32 -1281845205, i32 856756514, i32 -1150719534, i32 1893325225, i32 -1987146233, i32 -1483434957, i32 -1231316179, i32 572399164, i32 -1836611819, i32 552200649, i32 1238290055, i32 -11184726, i32 2015897680, i32 2061492133, i32 -1886614525, i32 -123625127, i32 -2138470135, i32 386731290, i32 -624967835, i32 837215959, i32 -968736124, i32 -1201116976, i32 -1019133566, i32 -1332111063, i32 1999449434, i32 286199582, i32 -877612933, i32 -61582168, i32 -692339859, i32 974525996], align 16
@TestTable2 = hidden local_unnamed_addr constant [256 x i32] [i32 1667483301, i32 2088564868, i32 2004348569, i32 2071721613, i32 -218956019, i32 1802229437, i32 1869602481, i32 -976907948, i32 808476752, i32 16843267, i32 1734856361, i32 724260477, i32 -16849127, i32 -673729182, i32 -1414836762, i32 1987505306, i32 -892694715, i32 -2105401443, i32 -909539008, i32 2105408135, i32 -84218091, i32 1499050731, i32 1195871945, i32 -252642549, i32 -1381154324, i32 -724257945, i32 -1566416899, i32 -1347467798, i32 -1667488833, i32 -1532734473, i32 1920132246, i32 -1061119141, i32 -1212713534, i32 -33693412, i32 -1819066962, i32 640044138, i32 909536346, i32 1061125697, i32 -134744830, i32 -859012273, i32 875849820, i32 -1515892236, i32 -437923532, i32 -235800312, i32 1903288979, i32 -656888973, i32 825320019, i32 353708607, i32 67373068, i32 -943221422, i32 589514341, i32 -1010590370, i32 404238376, i32 -1768540255, i32 84216335, i32 -1701171275, i32 117902857, i32 303178806, i32 -2139087973, i32 -488448195, i32 -336868058, i32 656887401, i32 -1296924723, i32 1970662047, i32 151589403, i32 -2088559202, i32 741103732, i32 437924910, i32 454768173, i32 1852759218, i32 1515893998, i32 -1600103429, i32 1381147894, i32 993752653, i32 -690571423, i32 -1280082482, i32 690573947, i32 -471605954, i32 791633521, i32 -2071719017, i32 1397991157, i32 -774784664, i32 0, i32 -303185620, i32 538984544, i32 -50535649, i32 -1313769016, i32 1532737261, i32 1785386174, i32 -875852474, i32 -1094817831, i32 960066123, i32 1246401758, i32 1280088276, i32 1482207464, i32 -808483510, i32 -791626901, i32 -269499094, i32 -1431679003, i32 -67375850, i32 1128498885, i32 1296931543, i32 859006549, i32 -2054876780, i32 1162185423, i32 -101062384, i32 33686534, i32 2139094657, i32 1347461360, i32 1010595908, i32 -1616960070, i32 -1465365533, i32 1364304627, i32 -1549574658, i32 1077969088, i32 -1886452342, i32 -1835909203, i32 -1650646596, i32 943222856, i32 -168431356, i32 -1128504353, i32 -1229555775, i32 -623202443, i32 555827811, i32 269492272, i32 -6886, i32 -202113778, i32 -757940371, i32 -842170036, i32 202119188, i32 320022069, i32 -320027857, i32 1600110305, i32 -1751698014, i32 1145342156, i32 387395129, i32 -993750185, i32 -1482205710, i32 2122251394, i32 1027439175, i32 1684326572, i32 1566423783, i32 421081643, i32 1936975509, i32 1616953504, i32 -2122245736, i32 1330618065, i32 -589520001, i32 572671078, i32 707417214, i32 -1869595733, i32 -2004350077, i32 1179028682, i32 -286341335, i32 -1195873325, i32 336865340, i32 -555833479, i32 1583267042, i32 185275933, i32 -606360202, i32 -522134725, i32 842163286, i32 976909390, i32 168432670, i32 1229558491, i32 101059594, i32 606357612, i32 1549580516, i32 -1027432611, i32 -741098130, i32 -1397996561, i32 1650640038, i32 -1852753496, i32 -1785384540, i32 -454765769, i32 2038035083, i32 -404237006, i32 -926381245, i32 926379609, i32 1835915959, i32 -1920138868, i32 -707415708, i32 1313774802, i32 -1448523296, i32 1819072692, i32 1448520954, i32 -185273593, i32 -353710299, i32 1701169839, i32 2054878350, i32 -1364310039, i32 134746136, i32 -1162186795, i32 2021191816, i32 623200879, i32 774790258, i32 471611428, i32 -1499047951, i32 -1263242297, i32 -960063663, i32 -387396829, i32 -572677764, i32 1953818780, i32 522141217, i32 1263245021, i32 -1111662116, i32 -1953821306, i32 -1970663547, i32 1886445712, i32 1044282434, i32 -1246400060, i32 1718013098, i32 1212715224, i32 50529797, i32 -151587071, i32 235805714, i32 1633796771, i32 892693087, i32 1465364217, i32 -1179031088, i32 -2038032495, i32 -1044276904, i32 488454695, i32 -1633802311, i32 -505292488, i32 -117904621, i32 -1734857805, i32 286335539, i32 1768542907, i32 -640046736, i32 -1903294583, i32 -1802226777, i32 -1684329034, i32 505297954, i32 -2021190254, i32 -370554592, i32 -825325751, i32 1431677695, i32 673730680, i32 -538991238, i32 -1936981105, i32 -1583261192, i32 -1987507840, i32 218962455, i32 -1077975590, i32 -421079247, i32 1111655622, i32 1751699640, i32 1094812355, i32 -1718015568, i32 757946999, i32 252648977, i32 -1330611253, i32 1414834428, i32 -1145344554, i32 370551866], align 16
@TestTable3 = hidden local_unnamed_addr constant [256 x i32] [i32 1673962851, i32 2096661628, i32 2012125559, i32 2079755643, i32 -218165774, i32 1809235307, i32 1876865391, i32 -980331323, i32 811618352, i32 16909057, i32 1741597031, i32 727088427, i32 -18408962, i32 -675978537, i32 -1420958037, i32 1995217526, i32 -896580150, i32 -2111857278, i32 -913751863, i32 2113570685, i32 -84994566, i32 1504897881, i32 1200539975, i32 -251982864, i32 -1388188499, i32 -726439980, i32 -1570767454, i32 -1354372433, i32 -1675378788, i32 -1538000988, i32 1927583346, i32 -1063560256, i32 -1217019209, i32 -35578627, i32 -1824674157, i32 642542118, i32 913070646, i32 1065238847, i32 -134937865, i32 -863809588, i32 879254580, i32 -1521355611, i32 -439274267, i32 -235337487, i32 1910674289, i32 -659852328, i32 828527409, i32 355090197, i32 67636228, i32 -946515257, i32 591815971, i32 -1013096765, i32 405809176, i32 -1774739050, i32 84545285, i32 -1708149350, i32 118360327, i32 304363026, i32 -2145674368, i32 -488686110, i32 -338876693, i32 659450151, i32 -1300247118, i32 1978310517, i32 152181513, i32 -2095210877, i32 743994412, i32 439627290, i32 456535323, i32 1859957358, i32 1521806938, i32 -1604584544, i32 1386542674, i32 997608763, i32 -692624938, i32 -1283600717, i32 693271337, i32 -472039709, i32 794718511, i32 -2079090812, i32 1403450707, i32 -776378159, i32 0, i32 -306107155, i32 541089824, i32 -52224004, i32 -1317418831, i32 1538714971, i32 1792327274, i32 -879933749, i32 -1100490306, i32 963791673, i32 1251270218, i32 1285084236, i32 1487988824, i32 -813348145, i32 -793023536, i32 -272291089, i32 -1437604438, i32 -68348165, i32 1132905795, i32 1301993293, i32 862344499, i32 -2062445435, i32 1166724933, i32 -102166279, i32 33818114, i32 2147385727, i32 1352724560, i32 1014514748, i32 -1624917345, i32 -1471421528, i32 1369633617, i32 -1554121053, i32 1082179648, i32 -1895462257, i32 -1841320558, i32 -1658733411, i32 946882616, i32 -168753931, i32 -1134305348, i32 -1233665610, i32 -626035238, i32 557998881, i32 270544912, i32 -1762561, i32 -201519373, i32 -759206446, i32 -847164211, i32 202904588, i32 321271059, i32 -322752532, i32 1606345055, i32 -1758092649, i32 1149815876, i32 388905239, i32 -996976700, i32 -1487539545, i32 2130477694, i32 1031423805, i32 1690872932, i32 1572530013, i32 422718233, i32 1944491379, i32 1623236704, i32 -2129028991, i32 1335808335, i32 -593264676, i32 574907938, i32 710180394, i32 -1875137648, i32 -2012511352, i32 1183631942, i32 -288937490, i32 -1200893000, i32 338181140, i32 -559449634, i32 1589437022, i32 185998603, i32 -609388837, i32 -522503200, i32 845436466, i32 980700730, i32 169090570, i32 1234361161, i32 101452294, i32 608726052, i32 1555620956, i32 -1029743166, i32 -742560045, i32 -1404833876, i32 1657054818, i32 -1858492271, i32 -1791908715, i32 -455919644, i32 2045938553, i32 -405458201, i32 -930397240, i32 929978679, i32 1843050349, i32 -1929278323, i32 -709794603, i32 1318900302, i32 -1454776151, i32 1826141292, i32 1454176854, i32 -185399308, i32 -355523094, i32 1707781989, i32 2062847610, i32 -1371018834, i32 135272456, i32 -1167075910, i32 2029029496, i32 625635109, i32 777810478, i32 473441308, i32 -1504185946, i32 -1267480652, i32 -963161658, i32 -389340184, i32 -576619299, i32 1961401460, i32 524165407, i32 1268178251, i32 -1117659971, i32 -1962047861, i32 -1978694262, i32 1893765232, i32 1048330814, i32 -1250835275, i32 1724688998, i32 1217452104, i32 50726147, i32 -151584266, i32 236720654, i32 1640145761, i32 896163637, i32 1471084887, i32 -1184247623, i32 -2045275770, i32 -1046914879, i32 490350365, i32 -1641563746, i32 -505857823, i32 -118811656, i32 -1741966440, i32 287453969, i32 1775418217, i32 -643206951, i32 -1912108658, i32 -1808554092, i32 -1691502949, i32 507257374, i32 -2028629369, i32 -372694807, i32 -829994546, i32 1437269845, i32 676362280, i32 -542803233, i32 -1945923700, i32 -1587939167, i32 -1995865975, i32 219813645, i32 -1083843905, i32 -422104602, i32 1115997762, i32 1758509160, i32 1099088705, i32 -1725321063, i32 760903469, i32 253628687, i32 -1334064208, i32 1420360788, i32 -1150429509, i32 371997206], align 16
@TestTable4 = hidden local_unnamed_addr constant [256 x i32] [i32 -962239645, i32 -125535108, i32 -291932297, i32 -158499973, i32 -15863054, i32 -692229269, i32 -558796945, i32 -1856715323, i32 1615867952, i32 33751297, i32 -827758745, i32 1451043627, i32 -417726722, i32 -1251813417, i32 1306962859, i32 -325421450, i32 -1891251510, i32 530416258, i32 -1992242743, i32 -91783811, i32 -283772166, i32 -1293199015, i32 -1899411641, i32 -83103504, i32 1106029997, i32 -1285040940, i32 1610457762, i32 1173008303, i32 599760028, i32 1408738468, i32 -459902350, i32 -1688485696, i32 1975695287, i32 -518193667, i32 1034851219, i32 1282024998, i32 1817851446, i32 2118205247, i32 -184354825, i32 -2091922228, i32 1750873140, i32 1374987685, i32 -785062427, i32 -116854287, i32 -493653647, i32 -1418471208, i32 1649619249, i32 708777237, i32 135005188, i32 -1789737017, i32 1181033251, i32 -1654733885, i32 807933976, i32 933336726, i32 168756485, i32 800430746, i32 235472647, i32 607523346, i32 463175808, i32 -549592350, i32 -853087253, i32 1315514151, i32 2144187058, i32 -358648459, i32 303761673, i32 496927619, i32 1484008492, i32 875436570, i32 908925723, i32 -592286098, i32 -1259447718, i32 1543217312, i32 -1527360942, i32 1984772923, i32 -1218324778, i32 2110698419, i32 1383803177, i32 -583080989, i32 1584475951, i32 328696964, i32 -1493871789, i32 -1184312879, i32 0, i32 -1054020115, i32 1080041504, i32 -484442884, i32 2043195825, i32 -1225958565, i32 -725718422, i32 -1924740149, i32 1742323390, i32 1917532473, i32 -1797371318, i32 -1730917300, i32 -1326950312, i32 -2058694705, i32 -1150562096, i32 -987041809, i32 1340451498, i32 -317260805, i32 -2033892541, i32 -1697166003, i32 1716859699, i32 294946181, i32 -1966127803, i32 -384763399, i32 67502594, i32 -25067649, i32 -1594863536, i32 2017737788, i32 632987551, i32 1273211048, i32 -1561112239, i32 1576969123, i32 -2134884288, i32 92966799, i32 1068339858, i32 566009245, i32 1883781176, i32 -251333131, i32 1675607228, i32 2009183926, i32 -1351230758, i32 1113792801, i32 540020752, i32 -451215361, i32 -49351693, i32 -1083321646, i32 -2125673011, i32 403966988, i32 641012499, i32 -1020269332, i32 -1092526241, i32 899848087, i32 -1999879100, i32 775493399, i32 -1822964540, i32 1441965991, i32 -58556802, i32 2051489085, i32 -928226204, i32 -1159242403, i32 841685273, i32 -426413197, i32 -1063231392, i32 429425025, i32 -1630449841, i32 -1551901476, i32 1147544098, i32 1417554474, i32 1001099408, i32 193169544, i32 -1932900794, i32 -953553170, i32 1809037496, i32 675025940, i32 -1485185314, i32 -1126015394, i32 371002123, i32 -1384719397, i32 -616832800, i32 1683370546, i32 1951283770, i32 337512970, i32 -1831122615, i32 201983494, i32 1215046692, i32 -1192993700, i32 -1621245246, i32 -1116810285, i32 1139780780, i32 -995728798, i32 967348625, i32 832869781, i32 -751311644, i32 -225740423, i32 -718084121, i32 -1958491960, i32 1851340599, i32 -625513107, i32 25988493, i32 -1318791723, i32 -1663938994, i32 1239460265, i32 -659264404, i32 -1392880042, i32 -217582348, i32 -819598614, i32 -894474907, i32 -191989126, i32 1206496942, i32 270010376, i32 1876277946, i32 -259491720, i32 1248797989, i32 1550986798, i32 941890588, i32 1475454630, i32 1942467764, i32 -1756248378, i32 -886839064, i32 -1585652259, i32 -392399756, i32 1042358047, i32 -1763882165, i32 1641856445, i32 226921355, i32 260409994, i32 -527404944, i32 2084716094, i32 1908716981, i32 -861247898, i32 -1864873912, i32 100991747, i32 -150866186, i32 470945294, i32 -1029480095, i32 1784624437, i32 -1359390889, i32 1775286713, i32 395413126, i32 -1722236479, i32 975641885, i32 666476190, i32 -650583583, i32 -351012616, i32 733190296, i32 573772049, i32 -759469719, i32 -1452221991, i32 126455438, i32 866620564, i32 766942107, i32 1008868894, i32 361924487, i32 -920589847, i32 -2025206066, i32 -1426107051, i32 1350051880, i32 -1518673953, i32 59739276, i32 1509466529, i32 159418761, i32 437718285, i32 1708834751, i32 -684595482, i32 -2067381694, i32 -793221016, i32 -2101132991, i32 699439513, i32 1517759789, i32 504434447, i32 2076946608, i32 -1459858348, i32 1842789307, i32 742004246], align 16
@text = hidden local_unnamed_addr global [128 x i8] zeroinitializer, align 16
@r = hidden global [9 x i32] zeroinitializer, align 16
@code = hidden local_unnamed_addr global [71 x %struct.V4_Instruction] zeroinitializer, align 16
@__const.v4_random_math_init.op_latency = private unnamed_addr constant [6 x i32] [i32 3, i32 2, i32 1, i32 2, i32 2, i32 1], align 16
@__const.v4_random_math_init.asic_op_latency = private unnamed_addr constant [6 x i32] [i32 3, i32 1, i32 1, i32 1, i32 1, i32 1], align 16
@__const.v4_random_math_init.op_ALUs = private unnamed_addr constant [6 x i32] [i32 1, i32 3, i32 3, i32 3, i32 3, i32 3], align 16
@__const.v4_random_math_init.inst_data = private unnamed_addr constant [9 x i32] [i32 0, i32 1, i32 2, i32 3, i32 16777215, i32 16777215, i32 16777215, i32 16777215, i32 16777215], align 16
@__const.v4_random_math_init.pattern = private unnamed_addr constant [3 x i8] c"\03\00\00", align 1
@switch.table.cryptonight_hash_ctx = private unnamed_addr constant [4 x i32] [i32 1048560, i32 131056, i32 2097136, i32 2097136], align 4
@switch.table.cryptonight_hash_ctx.2 = private unnamed_addr constant [4 x i32] [i32 0, i32 0, i32 0, i32 1], align 4
@switch.table.cryptonight_hash_ctx.3 = private unnamed_addr constant [4 x i32] [i32 131072, i32 32768, i32 131072, i32 196608], align 4
@switch.table.cryptonight_hash_ctx.4 = private unnamed_addr constant [4 x i32] [i32 1048576, i32 262144, i32 2097152, i32 2097152], align 4

; Function Attrs: nounwind
define hidden void @do_blake_hash(i8* %input, i32 %len, i8* %output) #0 {
entry:
  %conv = zext i32 %len to i64
  tail call void @blake(i8* %input, i64 %conv, i8* %output) #7
  ret void
}

declare void @blake(i8*, i64, i8*) local_unnamed_addr #1

; Function Attrs: nounwind
define hidden void @do_groestl_hash(i8* %input, i32 %len, i8* %output) #0 {
entry:
  %mul = shl i32 %len, 3
  %conv = zext i32 %mul to i64
  tail call void @groestl(i8* %input, i64 %conv, i8* %output) #7
  ret void
}

declare void @groestl(i8*, i64, i8*) local_unnamed_addr #1

; Function Attrs: nounwind
define hidden void @do_jh_hash(i8* %input, i32 %len, i8* %output) #0 {
entry:
  %mul = shl i32 %len, 3
  tail call void @jh(i32 256, i8* %input, i32 %mul, i8* %output) #7
  ret void
}

declare void @jh(i32, i8*, i32, i8*) local_unnamed_addr #1

; Function Attrs: nounwind
define hidden void @do_skein_hash(i8* %input, i32 %len, i8* %output) #0 {
entry:
  %mul = shl i32 %len, 3
  %call = tail call i32 @skein(i32 256, i8* %input, i32 %mul, i8* %output) #7
  ret void
}

declare i32 @skein(i32, i8*, i32, i8*) local_unnamed_addr #1

; Function Attrs: nofree norecurse nounwind
define hidden void @xor_blocks_dst(i8* nocapture readonly %a, i8* nocapture readonly %b, i8* nocapture %dst) local_unnamed_addr #2 {
entry:
  %0 = bitcast i8* %a to i64*
  %1 = load i64, i64* %0, align 8, !tbaa !2
  %2 = bitcast i8* %b to i64*
  %3 = load i64, i64* %2, align 8, !tbaa !2
  %xor = xor i64 %3, %1
  %4 = bitcast i8* %dst to i64*
  store i64 %xor, i64* %4, align 8, !tbaa !2
  %arrayidx3 = getelementptr inbounds i8, i8* %a, i32 8
  %5 = bitcast i8* %arrayidx3 to i64*
  %6 = load i64, i64* %5, align 8, !tbaa !2
  %arrayidx4 = getelementptr inbounds i8, i8* %b, i32 8
  %7 = bitcast i8* %arrayidx4 to i64*
  %8 = load i64, i64* %7, align 8, !tbaa !2
  %xor5 = xor i64 %8, %6
  %arrayidx6 = getelementptr inbounds i8, i8* %dst, i32 8
  %9 = bitcast i8* %arrayidx6 to i64*
  store i64 %xor5, i64* %9, align 8, !tbaa !2
  ret void
}

; Function Attrs: nofree norecurse nounwind
define hidden void @mul64to128(i8* nocapture readonly %op1, i8* nocapture readonly %op2, i8* nocapture %dst) local_unnamed_addr #2 {
entry:
  %0 = bitcast i8* %op1 to i64*
  %1 = load i64, i64* %0, align 8, !tbaa !2
  %2 = bitcast i8* %op2 to i64*
  %3 = load i64, i64* %2, align 8, !tbaa !2
  %and = and i64 %1, 4294967295
  %and2 = and i64 %3, 4294967295
  %mul = mul nuw i64 %and2, %and
  %and3 = and i64 %mul, 4294967295
  %shr = lshr i64 %mul, 32
  %shr4 = lshr i64 %1, 32
  %mul5 = mul nuw i64 %and2, %shr4
  %add = add nuw i64 %shr, %mul5
  %and6 = and i64 %add, 4294967295
  %shr7 = lshr i64 %add, 32
  %shr8 = lshr i64 %3, 32
  %mul9 = mul nuw i64 %shr8, %and
  %add10 = add nuw i64 %and6, %mul9
  %shr11 = lshr i64 %add10, 32
  %mul12 = mul nuw i64 %shr8, %shr4
  %add13 = add nuw i64 %shr7, %mul12
  %add14 = add nuw i64 %add13, %shr11
  %shl = shl i64 %add10, 32
  %add15 = or i64 %shl, %and3
  %4 = bitcast i8* %dst to i64*
  store i64 %add14, i64* %4, align 8, !tbaa !2
  %arrayidx17 = getelementptr inbounds i8, i8* %dst, i32 8
  %5 = bitcast i8* %arrayidx17 to i64*
  store i64 %add15, i64* %5, align 8, !tbaa !2
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nofree norecurse nounwind
define hidden void @sum_xor_dst(i8* nocapture readonly %a, i8* nocapture %c, i8* nocapture %dst) local_unnamed_addr #2 {
entry:
  %0 = bitcast i8* %a to i64*
  %1 = load i64, i64* %0, align 8, !tbaa !2
  %arrayidx1 = getelementptr inbounds i8, i8* %a, i32 8
  %2 = bitcast i8* %arrayidx1 to i64*
  %3 = load i64, i64* %2, align 8, !tbaa !2
  %4 = bitcast i8* %c to i64*
  %arrayidx2 = getelementptr inbounds i8, i8* %c, i32 8
  %5 = bitcast i8* %arrayidx2 to i64*
  %6 = load i64, i64* %5, align 8, !tbaa !2
  %add = add i64 %6, %3
  %7 = load i64, i64* %4, align 8, !tbaa !2
  %add4 = add i64 %7, %1
  %8 = bitcast i8* %dst to i64*
  %9 = load i64, i64* %8, align 8, !tbaa !2
  %xor = xor i64 %9, %add4
  store i64 %xor, i64* %4, align 8, !tbaa !2
  %arrayidx7 = getelementptr inbounds i8, i8* %dst, i32 8
  %10 = bitcast i8* %arrayidx7 to i64*
  %11 = load i64, i64* %10, align 8, !tbaa !2
  %xor8 = xor i64 %11, %add
  store i64 %xor8, i64* %5, align 8, !tbaa !2
  store i64 %add4, i64* %8, align 8, !tbaa !2
  store i64 %add, i64* %10, align 8, !tbaa !2
  ret void
}

; Function Attrs: nofree norecurse nounwind
define hidden void @xor_blocks(i8* nocapture %a, i8* nocapture readonly %b) local_unnamed_addr #2 {
entry:
  %0 = bitcast i8* %b to i64*
  %1 = load i64, i64* %0, align 8, !tbaa !2
  %2 = bitcast i8* %a to i64*
  %3 = load i64, i64* %2, align 8, !tbaa !2
  %xor = xor i64 %3, %1
  store i64 %xor, i64* %2, align 8, !tbaa !2
  %arrayidx2 = getelementptr inbounds i8, i8* %b, i32 8
  %4 = bitcast i8* %arrayidx2 to i64*
  %5 = load i64, i64* %4, align 8, !tbaa !2
  %arrayidx3 = getelementptr inbounds i8, i8* %a, i32 8
  %6 = bitcast i8* %arrayidx3 to i64*
  %7 = load i64, i64* %6, align 8, !tbaa !2
  %xor4 = xor i64 %7, %5
  store i64 %xor4, i64* %6, align 8, !tbaa !2
  ret void
}

; Function Attrs: nofree norecurse nounwind
define hidden void @SubAndShiftAndMixAddRound(i32* nocapture %out, i8* nocapture readonly %temp, i32* nocapture readonly %AesEncKey) local_unnamed_addr #2 {
entry:
  %0 = load i8, i8* %temp, align 1, !tbaa !6
  %idxprom = zext i8 %0 to i32
  %arrayidx1 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom
  %1 = load i32, i32* %arrayidx1, align 4, !tbaa !7
  %arrayidx2 = getelementptr inbounds i8, i8* %temp, i32 5
  %2 = load i8, i8* %arrayidx2, align 1, !tbaa !6
  %idxprom3 = zext i8 %2 to i32
  %arrayidx4 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom3
  %3 = load i32, i32* %arrayidx4, align 4, !tbaa !7
  %xor = xor i32 %3, %1
  %arrayidx5 = getelementptr inbounds i8, i8* %temp, i32 10
  %4 = load i8, i8* %arrayidx5, align 1, !tbaa !6
  %idxprom6 = zext i8 %4 to i32
  %arrayidx7 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom6
  %5 = load i32, i32* %arrayidx7, align 4, !tbaa !7
  %xor8 = xor i32 %xor, %5
  %arrayidx9 = getelementptr inbounds i8, i8* %temp, i32 15
  %6 = load i8, i8* %arrayidx9, align 1, !tbaa !6
  %idxprom10 = zext i8 %6 to i32
  %arrayidx11 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom10
  %7 = load i32, i32* %arrayidx11, align 4, !tbaa !7
  %xor12 = xor i32 %xor8, %7
  %8 = load i32, i32* %AesEncKey, align 4, !tbaa !7
  %xor14 = xor i32 %xor12, %8
  store i32 %xor14, i32* %out, align 4, !tbaa !7
  %arrayidx16 = getelementptr inbounds i8, i8* %temp, i32 3
  %9 = load i8, i8* %arrayidx16, align 1, !tbaa !6
  %idxprom17 = zext i8 %9 to i32
  %arrayidx18 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom17
  %10 = load i32, i32* %arrayidx18, align 4, !tbaa !7
  %arrayidx19 = getelementptr inbounds i8, i8* %temp, i32 4
  %11 = load i8, i8* %arrayidx19, align 1, !tbaa !6
  %idxprom20 = zext i8 %11 to i32
  %arrayidx21 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom20
  %12 = load i32, i32* %arrayidx21, align 4, !tbaa !7
  %xor22 = xor i32 %12, %10
  %arrayidx23 = getelementptr inbounds i8, i8* %temp, i32 9
  %13 = load i8, i8* %arrayidx23, align 1, !tbaa !6
  %idxprom24 = zext i8 %13 to i32
  %arrayidx25 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom24
  %14 = load i32, i32* %arrayidx25, align 4, !tbaa !7
  %xor26 = xor i32 %xor22, %14
  %arrayidx27 = getelementptr inbounds i8, i8* %temp, i32 14
  %15 = load i8, i8* %arrayidx27, align 1, !tbaa !6
  %idxprom28 = zext i8 %15 to i32
  %arrayidx29 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom28
  %16 = load i32, i32* %arrayidx29, align 4, !tbaa !7
  %xor30 = xor i32 %xor26, %16
  %arrayidx31 = getelementptr inbounds i32, i32* %AesEncKey, i32 1
  %17 = load i32, i32* %arrayidx31, align 4, !tbaa !7
  %xor32 = xor i32 %xor30, %17
  %arrayidx33 = getelementptr inbounds i32, i32* %out, i32 1
  store i32 %xor32, i32* %arrayidx33, align 4, !tbaa !7
  %arrayidx34 = getelementptr inbounds i8, i8* %temp, i32 2
  %18 = load i8, i8* %arrayidx34, align 1, !tbaa !6
  %idxprom35 = zext i8 %18 to i32
  %arrayidx36 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom35
  %19 = load i32, i32* %arrayidx36, align 4, !tbaa !7
  %arrayidx37 = getelementptr inbounds i8, i8* %temp, i32 7
  %20 = load i8, i8* %arrayidx37, align 1, !tbaa !6
  %idxprom38 = zext i8 %20 to i32
  %arrayidx39 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom38
  %21 = load i32, i32* %arrayidx39, align 4, !tbaa !7
  %xor40 = xor i32 %21, %19
  %arrayidx41 = getelementptr inbounds i8, i8* %temp, i32 8
  %22 = load i8, i8* %arrayidx41, align 1, !tbaa !6
  %idxprom42 = zext i8 %22 to i32
  %arrayidx43 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom42
  %23 = load i32, i32* %arrayidx43, align 4, !tbaa !7
  %xor44 = xor i32 %xor40, %23
  %arrayidx45 = getelementptr inbounds i8, i8* %temp, i32 13
  %24 = load i8, i8* %arrayidx45, align 1, !tbaa !6
  %idxprom46 = zext i8 %24 to i32
  %arrayidx47 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom46
  %25 = load i32, i32* %arrayidx47, align 4, !tbaa !7
  %xor48 = xor i32 %xor44, %25
  %arrayidx49 = getelementptr inbounds i32, i32* %AesEncKey, i32 2
  %26 = load i32, i32* %arrayidx49, align 4, !tbaa !7
  %xor50 = xor i32 %xor48, %26
  %arrayidx51 = getelementptr inbounds i32, i32* %out, i32 2
  store i32 %xor50, i32* %arrayidx51, align 4, !tbaa !7
  %arrayidx52 = getelementptr inbounds i8, i8* %temp, i32 1
  %27 = load i8, i8* %arrayidx52, align 1, !tbaa !6
  %idxprom53 = zext i8 %27 to i32
  %arrayidx54 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom53
  %28 = load i32, i32* %arrayidx54, align 4, !tbaa !7
  %arrayidx55 = getelementptr inbounds i8, i8* %temp, i32 6
  %29 = load i8, i8* %arrayidx55, align 1, !tbaa !6
  %idxprom56 = zext i8 %29 to i32
  %arrayidx57 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom56
  %30 = load i32, i32* %arrayidx57, align 4, !tbaa !7
  %xor58 = xor i32 %30, %28
  %arrayidx59 = getelementptr inbounds i8, i8* %temp, i32 11
  %31 = load i8, i8* %arrayidx59, align 1, !tbaa !6
  %idxprom60 = zext i8 %31 to i32
  %arrayidx61 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom60
  %32 = load i32, i32* %arrayidx61, align 4, !tbaa !7
  %xor62 = xor i32 %xor58, %32
  %arrayidx63 = getelementptr inbounds i8, i8* %temp, i32 12
  %33 = load i8, i8* %arrayidx63, align 1, !tbaa !6
  %idxprom64 = zext i8 %33 to i32
  %arrayidx65 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom64
  %34 = load i32, i32* %arrayidx65, align 4, !tbaa !7
  %xor66 = xor i32 %xor62, %34
  %arrayidx67 = getelementptr inbounds i32, i32* %AesEncKey, i32 3
  %35 = load i32, i32* %arrayidx67, align 4, !tbaa !7
  %xor68 = xor i32 %xor66, %35
  %arrayidx69 = getelementptr inbounds i32, i32* %out, i32 3
  store i32 %xor68, i32* %arrayidx69, align 4, !tbaa !7
  ret void
}

; Function Attrs: nofree norecurse nounwind
define hidden void @SubAndShiftAndMixAddRoundInPlace(i32* nocapture %temp, i32* nocapture readonly %AesEncKey) local_unnamed_addr #2 {
entry:
  %0 = bitcast i32* %temp to i8*
  %arrayidx1 = getelementptr inbounds i8, i8* %0, i32 3
  %1 = load i8, i8* %arrayidx1, align 1, !tbaa !6
  %arrayidx3 = getelementptr inbounds i8, i8* %0, i32 2
  %2 = load i8, i8* %arrayidx3, align 1, !tbaa !6
  %arrayidx5 = getelementptr inbounds i8, i8* %0, i32 7
  %3 = load i8, i8* %arrayidx5, align 1, !tbaa !6
  %arrayidx7 = getelementptr inbounds i8, i8* %0, i32 1
  %4 = load i8, i8* %arrayidx7, align 1, !tbaa !6
  %arrayidx9 = getelementptr inbounds i8, i8* %0, i32 6
  %5 = load i8, i8* %arrayidx9, align 1, !tbaa !6
  %arrayidx11 = getelementptr inbounds i8, i8* %0, i32 11
  %6 = load i8, i8* %arrayidx11, align 1, !tbaa !6
  %7 = load i8, i8* %0, align 1, !tbaa !6
  %idxprom = zext i8 %7 to i32
  %arrayidx14 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom
  %8 = load i32, i32* %arrayidx14, align 4, !tbaa !7
  %arrayidx15 = getelementptr inbounds i8, i8* %0, i32 5
  %9 = load i8, i8* %arrayidx15, align 1, !tbaa !6
  %idxprom16 = zext i8 %9 to i32
  %arrayidx17 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom16
  %10 = load i32, i32* %arrayidx17, align 4, !tbaa !7
  %xor = xor i32 %10, %8
  %arrayidx18 = getelementptr inbounds i8, i8* %0, i32 10
  %11 = load i8, i8* %arrayidx18, align 1, !tbaa !6
  %idxprom19 = zext i8 %11 to i32
  %arrayidx20 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom19
  %12 = load i32, i32* %arrayidx20, align 4, !tbaa !7
  %xor21 = xor i32 %xor, %12
  %arrayidx22 = getelementptr inbounds i8, i8* %0, i32 15
  %13 = load i8, i8* %arrayidx22, align 1, !tbaa !6
  %idxprom23 = zext i8 %13 to i32
  %arrayidx24 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom23
  %14 = load i32, i32* %arrayidx24, align 4, !tbaa !7
  %xor25 = xor i32 %xor21, %14
  %15 = load i32, i32* %AesEncKey, align 4, !tbaa !7
  %xor27 = xor i32 %xor25, %15
  store i32 %xor27, i32* %temp, align 4, !tbaa !7
  %idxprom30 = zext i8 %1 to i32
  %arrayidx31 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom30
  %16 = load i32, i32* %arrayidx31, align 4, !tbaa !7
  %arrayidx32106 = getelementptr inbounds i32, i32* %temp, i32 1
  %arrayidx32 = bitcast i32* %arrayidx32106 to i8*
  %17 = load i8, i8* %arrayidx32, align 1, !tbaa !6
  %idxprom33 = zext i8 %17 to i32
  %arrayidx34 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom33
  %18 = load i32, i32* %arrayidx34, align 4, !tbaa !7
  %xor35 = xor i32 %18, %16
  %arrayidx36 = getelementptr inbounds i8, i8* %0, i32 9
  %19 = load i8, i8* %arrayidx36, align 1, !tbaa !6
  %idxprom37 = zext i8 %19 to i32
  %arrayidx38 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom37
  %20 = load i32, i32* %arrayidx38, align 4, !tbaa !7
  %xor39 = xor i32 %xor35, %20
  %arrayidx40 = getelementptr inbounds i8, i8* %0, i32 14
  %21 = load i8, i8* %arrayidx40, align 1, !tbaa !6
  %idxprom41 = zext i8 %21 to i32
  %arrayidx42 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom41
  %22 = load i32, i32* %arrayidx42, align 4, !tbaa !7
  %xor43 = xor i32 %xor39, %22
  %arrayidx44 = getelementptr inbounds i32, i32* %AesEncKey, i32 1
  %23 = load i32, i32* %arrayidx44, align 4, !tbaa !7
  %xor45 = xor i32 %xor43, %23
  store i32 %xor45, i32* %arrayidx32106, align 4, !tbaa !7
  %idxprom48 = zext i8 %2 to i32
  %arrayidx49 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom48
  %24 = load i32, i32* %arrayidx49, align 4, !tbaa !7
  %idxprom51 = zext i8 %3 to i32
  %arrayidx52 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom51
  %25 = load i32, i32* %arrayidx52, align 4, !tbaa !7
  %xor53 = xor i32 %25, %24
  %arrayidx54107 = getelementptr inbounds i32, i32* %temp, i32 2
  %arrayidx54 = bitcast i32* %arrayidx54107 to i8*
  %26 = load i8, i8* %arrayidx54, align 1, !tbaa !6
  %idxprom55 = zext i8 %26 to i32
  %arrayidx56 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom55
  %27 = load i32, i32* %arrayidx56, align 4, !tbaa !7
  %xor57 = xor i32 %xor53, %27
  %arrayidx58 = getelementptr inbounds i8, i8* %0, i32 13
  %28 = load i8, i8* %arrayidx58, align 1, !tbaa !6
  %idxprom59 = zext i8 %28 to i32
  %arrayidx60 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom59
  %29 = load i32, i32* %arrayidx60, align 4, !tbaa !7
  %xor61 = xor i32 %xor57, %29
  %arrayidx62 = getelementptr inbounds i32, i32* %AesEncKey, i32 2
  %30 = load i32, i32* %arrayidx62, align 4, !tbaa !7
  %xor63 = xor i32 %xor61, %30
  store i32 %xor63, i32* %arrayidx54107, align 4, !tbaa !7
  %idxprom66 = zext i8 %4 to i32
  %arrayidx67 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom66
  %31 = load i32, i32* %arrayidx67, align 4, !tbaa !7
  %idxprom69 = zext i8 %5 to i32
  %arrayidx70 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom69
  %32 = load i32, i32* %arrayidx70, align 4, !tbaa !7
  %xor71 = xor i32 %32, %31
  %idxprom73 = zext i8 %6 to i32
  %arrayidx74 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom73
  %33 = load i32, i32* %arrayidx74, align 4, !tbaa !7
  %xor75 = xor i32 %xor71, %33
  %arrayidx76108 = getelementptr inbounds i32, i32* %temp, i32 3
  %arrayidx76 = bitcast i32* %arrayidx76108 to i8*
  %34 = load i8, i8* %arrayidx76, align 1, !tbaa !6
  %idxprom77 = zext i8 %34 to i32
  %arrayidx78 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom77
  %35 = load i32, i32* %arrayidx78, align 4, !tbaa !7
  %xor79 = xor i32 %xor75, %35
  %arrayidx80 = getelementptr inbounds i32, i32* %AesEncKey, i32 3
  %36 = load i32, i32* %arrayidx80, align 4, !tbaa !7
  %xor81 = xor i32 %xor79, %36
  store i32 %xor81, i32* %arrayidx76108, align 4, !tbaa !7
  ret void
}

; Function Attrs: nounwind
define hidden void @cryptonight_hash_ctx(i8* %output, i8* %input, i32 %len, i32 %algo, i32 %variant, i32 %height) local_unnamed_addr #0 {
entry:
  %data.i = alloca [32 x i8], align 16
  %latency.i = alloca [9 x i32], align 16
  %asic_latency.i = alloca [9 x i32], align 16
  %inst_data.i = alloca [9 x i32], align 16
  %alu_busy.i = alloca [46 x [3 x i8]], align 16
  %is_rotation.i = alloca [6 x i8], align 1
  %rotated.i = alloca i32, align 4
  %aes_ctx = alloca %struct._oaes_ctx*, align 4
  %state = alloca %union.cn_slow_hash_state, align 8
  %a = alloca [16 x i8], align 16
  %b = alloca [16 x i8], align 16
  %0 = bitcast %struct._oaes_ctx** %aes_ctx to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #7
  %1 = bitcast %union.cn_slow_hash_state* %state to i8*
  call void @llvm.lifetime.start.p0i8(i64 200, i8* nonnull %1) #7
  %2 = getelementptr inbounds [16 x i8], [16 x i8]* %a, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %2) #7
  %3 = getelementptr inbounds [16 x i8], [16 x i8]* %b, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #7
  %switch.tableidx = add i32 %algo, -1
  %4 = icmp ult i32 %switch.tableidx, 4
  br i1 %4, label %switch.lookup, label %sw.epilog

switch.lookup:                                    ; preds = %entry
  %switch.gep = getelementptr inbounds [4 x i32], [4 x i32]* @switch.table.cryptonight_hash_ctx, i32 0, i32 %switch.tableidx
  %switch.load = load i32, i32* %switch.gep, align 4
  %switch.gep5832 = getelementptr inbounds [4 x i32], [4 x i32]* @switch.table.cryptonight_hash_ctx.2, i32 0, i32 %switch.tableidx
  %switch.load5833 = load i32, i32* %switch.gep5832, align 4
  %switch.gep5834 = getelementptr inbounds [4 x i32], [4 x i32]* @switch.table.cryptonight_hash_ctx.3, i32 0, i32 %switch.tableidx
  %switch.load5835 = load i32, i32* %switch.gep5834, align 4
  %switch.gep5836 = getelementptr inbounds [4 x i32], [4 x i32]* @switch.table.cryptonight_hash_ctx.4, i32 0, i32 %switch.tableidx
  %switch.load5837 = load i32, i32* %switch.gep5836, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %switch.lookup, %entry
  %mask.0 = phi i32 [ 2097136, %entry ], [ %switch.load, %switch.lookup ]
  %rvs.0 = phi i32 [ 0, %entry ], [ %switch.load5833, %switch.lookup ]
  %iter.0 = phi i32 [ 262144, %entry ], [ %switch.load5835, %switch.lookup ]
  %memory.0 = phi i32 [ 2097152, %entry ], [ %switch.load5837, %switch.lookup ]
  %call = tail call i8* @malloc(i32 %memory.0)
  %call4 = tail call i8* @oaes_alloc() #7
  %5 = bitcast %struct._oaes_ctx** %aes_ctx to i8**
  store i8* %call4, i8** %5, align 4, !tbaa !9
  call void @keccak(i8* %input, i32 %len, i8* nonnull %1, i32 200) #7
  %init = getelementptr inbounds %union.cn_slow_hash_state, %union.cn_slow_hash_state* %state, i32 0, i32 0, i32 0, i32 8
  %arraydecay6 = bitcast i64* %init to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 dereferenceable(128) getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 0), i8* nonnull align 8 dereferenceable(128) %arraydecay6, i32 128, i1 false)
  %cmp = icmp eq i32 %variant, 1
  %6 = bitcast i8* %call4 to %struct._oaes_ctx*
  br i1 %cmp, label %cond.end.thread, label %cond.end

cond.end.thread:                                  ; preds = %sw.epilog
  %add.ptr = getelementptr inbounds i8, i8* %input, i32 35
  %7 = bitcast i8* %add.ptr to i64*
  %8 = load i64, i64* %7, align 8, !tbaa !2
  %arrayidx = getelementptr inbounds %union.cn_slow_hash_state, %union.cn_slow_hash_state* %state, i32 0, i32 0, i32 0, i32 24
  %9 = load i64, i64* %arrayidx, align 8, !tbaa !6
  %xor = xor i64 %9, %8
  br label %do.end56

cond.end:                                         ; preds = %sw.epilog
  %cmp8 = icmp sgt i32 %variant, 1
  br i1 %cmp8, label %do.body33, label %do.end56

do.body33:                                        ; preds = %cond.end
  %10 = load i64, i64* %init, align 8, !tbaa !6
  %arrayidx14 = getelementptr inbounds %union.cn_slow_hash_state, %union.cn_slow_hash_state* %state, i32 0, i32 0, i32 0, i32 10
  %11 = load i64, i64* %arrayidx14, align 8, !tbaa !6
  %xor15 = xor i64 %11, %10
  %d.sroa.0.sroa.0.0.extract.trunc5305 = trunc i64 %xor15 to i32
  %d.sroa.0.sroa.23.0.extract.shift5361 = lshr i64 %xor15, 32
  %d.sroa.0.sroa.23.0.extract.trunc5362 = trunc i64 %d.sroa.0.sroa.23.0.extract.shift5361 to i32
  %arrayidx20 = getelementptr inbounds %union.cn_slow_hash_state, %union.cn_slow_hash_state* %state, i32 0, i32 0, i32 0, i32 9
  %12 = load i64, i64* %arrayidx20, align 8, !tbaa !6
  %arrayidx23 = getelementptr inbounds %union.cn_slow_hash_state, %union.cn_slow_hash_state* %state, i32 0, i32 0, i32 0, i32 11
  %13 = load i64, i64* %arrayidx23, align 8, !tbaa !6
  %xor24 = xor i64 %13, %12
  %arrayidx29 = getelementptr inbounds %union.cn_slow_hash_state, %union.cn_slow_hash_state* %state, i32 0, i32 0, i32 0, i32 12
  %14 = load i64, i64* %arrayidx29, align 8, !tbaa !6
  %arrayidx32 = getelementptr inbounds %union.cn_slow_hash_state, %union.cn_slow_hash_state* %state, i32 0, i32 0, i32 0, i32 13
  %15 = load i64, i64* %arrayidx32, align 8, !tbaa !6
  %cmp34 = icmp sgt i32 %variant, 3
  br i1 %cmp34, label %for.cond.preheader, label %do.end56

for.cond.preheader:                               ; preds = %do.body33
  %16 = bitcast i64* %arrayidx29 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 dereferenceable(16) bitcast ([9 x i32]* @r to i8*), i8* nonnull align 8 dereferenceable(16) %16, i32 16, i1 false)
  %17 = load i32, i32* @lastHeight, align 4, !tbaa !7
  %cmp50 = icmp eq i32 %17, %height
  br i1 %cmp50, label %do.end56, label %if.then51

if.then51:                                        ; preds = %for.cond.preheader
  %conv = sext i32 %height to i64
  %tmpcast.i = bitcast i32* %rotated.i to [4 x i8]*
  %18 = getelementptr inbounds [32 x i8], [32 x i8]* %data.i, i32 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %18) #7
  call void @llvm.memset.p0i8.i32(i8* nonnull align 16 dereferenceable(32) %18, i8 0, i32 32, i1 false) #7
  %tmp.0.arraydecay1.sroa_cast.i = bitcast [32 x i8]* %data.i to i64*
  store i64 %conv, i64* %tmp.0.arraydecay1.sroa_cast.i, align 16
  %arrayidx.i = getelementptr inbounds [32 x i8], [32 x i8]* %data.i, i32 0, i32 20
  store i8 -38, i8* %arrayidx.i, align 4, !tbaa !6
  %19 = bitcast [9 x i32]* %latency.i to i8*
  %20 = bitcast [9 x i32]* %asic_latency.i to i8*
  %21 = bitcast [9 x i32]* %inst_data.i to i8*
  %22 = getelementptr inbounds [46 x [3 x i8]], [46 x [3 x i8]]* %alu_busy.i, i32 0, i32 0, i32 0
  %23 = getelementptr inbounds [6 x i8], [6 x i8]* %is_rotation.i, i32 0, i32 0
  %24 = bitcast i32* %rotated.i to i8*
  %arraydecay2.i = getelementptr inbounds [9 x i32], [9 x i32]* %latency.i, i32 0, i32 0
  %arraydecay3.i = getelementptr inbounds [9 x i32], [9 x i32]* %asic_latency.i, i32 0, i32 0
  %arrayidx7.i = getelementptr inbounds [6 x i8], [6 x i8]* %is_rotation.i, i32 0, i32 3
  %arrayidx8.i = getelementptr inbounds [6 x i8], [6 x i8]* %is_rotation.i, i32 0, i32 4
  %arrayidx10.i = getelementptr inbounds [9 x i32], [9 x i32]* %latency.i, i32 0, i32 1
  %arrayidx13.i = getelementptr inbounds [9 x i32], [9 x i32]* %latency.i, i32 0, i32 2
  %arrayidx16.i = getelementptr inbounds [9 x i32], [9 x i32]* %latency.i, i32 0, i32 3
  %arrayidx249.i = getelementptr inbounds [9 x i32], [9 x i32]* %asic_latency.i, i32 0, i32 1
  %arrayidx253.i = getelementptr inbounds [9 x i32], [9 x i32]* %asic_latency.i, i32 0, i32 2
  %arrayidx257.i = getelementptr inbounds [9 x i32], [9 x i32]* %asic_latency.i, i32 0, i32 3
  br label %do.body.i

do.body.i:                                        ; preds = %while.end308.i, %if.then51
  %data_index.0.i = phi i32 [ 32, %if.then51 ], [ %data_index.9.i, %while.end308.i ]
  call void @llvm.lifetime.start.p0i8(i64 36, i8* nonnull %19) #7
  call void @llvm.lifetime.start.p0i8(i64 36, i8* nonnull %20) #7
  call void @llvm.lifetime.start.p0i8(i64 36, i8* nonnull %21) #7
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 dereferenceable(36) %21, i8* nonnull align 16 dereferenceable(36) bitcast ([9 x i32]* @__const.v4_random_math_init.inst_data to i8*), i32 36, i1 false) #7
  call void @llvm.lifetime.start.p0i8(i64 138, i8* nonnull %22) #7
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %23) #7
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %24) #7
  call void @llvm.memset.p0i8.i32(i8* nonnull align 16 dereferenceable(36) %19, i8 0, i32 36, i1 false) #7
  call void @llvm.memset.p0i8.i32(i8* nonnull align 16 dereferenceable(36) %20, i8 0, i32 36, i1 false) #7
  call void @llvm.memset.p0i8.i32(i8* nonnull align 16 dereferenceable(138) %22, i8 0, i32 138, i1 false) #7
  call void @llvm.memset.p0i8.i32(i8* nonnull align 1 dereferenceable(6) %23, i8 0, i32 6, i1 false) #7
  store i32 0, i32* %rotated.i, align 4
  store i8 1, i8* %arrayidx7.i, align 1, !tbaa !11
  store i8 1, i8* %arrayidx8.i, align 1, !tbaa !11
  br label %while.cond.i.outer

while.cond.i.outer:                               ; preds = %if.end223.cleanup234_crit_edge.i, %do.body.i
  %.pre127132.i.ph = phi i32 [ %.pre127.pre.i, %if.end223.cleanup234_crit_edge.i ], [ 0, %do.body.i ]
  %.pre126130.i.ph = phi i32 [ %.pre126.pre.i, %if.end223.cleanup234_crit_edge.i ], [ 0, %do.body.i ]
  %.pre128.i.ph = phi i32 [ %.pre.pre.i, %if.end223.cleanup234_crit_edge.i ], [ 0, %do.body.i ]
  %data_index.1.i.ph = phi i32 [ %data_index.6.i, %if.end223.cleanup234_crit_edge.i ], [ %data_index.0.i, %do.body.i ]
  %total_iterations.0.i.ph = phi i32 [ %inc.i, %if.end223.cleanup234_crit_edge.i ], [ 0, %do.body.i ]
  %num_retries.0.i.ph = phi i32 [ %num_retries.0.i.ph5849, %if.end223.cleanup234_crit_edge.i ], [ 0, %do.body.i ]
  %rotate_count.0.i.ph = phi i32 [ %spec.select.i, %if.end223.cleanup234_crit_edge.i ], [ 0, %do.body.i ]
  %r8_used.0.off0.i.ph = phi i1 [ %spec.select17.i, %if.end223.cleanup234_crit_edge.i ], [ false, %do.body.i ]
  %code_size.0.i.ph = phi i32 [ %inc224.i, %if.end223.cleanup234_crit_edge.i ], [ 0, %do.body.i ]
  %cmp.i = icmp slt i32 %.pre128.i.ph, 45
  %cmp11.i = icmp slt i32 %.pre126130.i.ph, 45
  %or.cond109.i = or i1 %cmp11.i, %cmp.i
  %cmp14.i = icmp slt i32 %.pre127132.i.ph, 45
  %or.cond110.i = or i1 %cmp14.i, %or.cond109.i
  %25 = load i32, i32* %arrayidx16.i, align 4
  %cmp17.i = icmp slt i32 %25, 45
  br label %while.cond.i.outer5846

while.cond.i.outer5846:                           ; preds = %while.cond.i.outer, %if.else229.i
  %data_index.1.i.ph5847 = phi i32 [ %data_index.1.i.ph, %while.cond.i.outer ], [ %data_index.4.i, %if.else229.i ]
  %total_iterations.0.i.ph5848 = phi i32 [ %total_iterations.0.i.ph, %while.cond.i.outer ], [ %inc.i, %if.else229.i ]
  %num_retries.0.i.ph5849 = phi i32 [ %num_retries.0.i.ph, %while.cond.i.outer ], [ %inc230.i, %if.else229.i ]
  %cmp18.i = icmp slt i32 %num_retries.0.i.ph5849, 64
  %or.cond.i = and i1 %cmp18.i, %cmp17.i
  br label %while.cond.i

while.cond.i:                                     ; preds = %while.cond.i.backedge, %while.cond.i.outer5846
  %data_index.1.i = phi i32 [ %data_index.1.i.ph5847, %while.cond.i.outer5846 ], [ %data_index.4.i, %while.cond.i.backedge ]
  %total_iterations.0.i = phi i32 [ %total_iterations.0.i.ph5848, %while.cond.i.outer5846 ], [ %inc.i, %while.cond.i.backedge ]
  br i1 %or.cond110.i, label %land.rhs.i, label %lor.lhs.false15.i

lor.lhs.false15.i:                                ; preds = %while.cond.i
  br i1 %or.cond.i, label %while.body.i, label %while.end240.i

land.rhs.i:                                       ; preds = %while.cond.i
  br i1 %cmp18.i, label %while.body.i, label %while.end240.i

while.body.i:                                     ; preds = %land.rhs.i, %lor.lhs.false15.i
  %inc.i = add nuw nsw i32 %total_iterations.0.i, 1
  %exitcond.i = icmp eq i32 %total_iterations.0.i, 256
  br i1 %exitcond.i, label %while.end240.i, label %if.end.i

if.end.i:                                         ; preds = %while.body.i
  %add.i.i = add i32 %data_index.1.i, 1
  %cmp.i.i = icmp ugt i32 %add.i.i, 32
  br i1 %cmp.i.i, label %if.then.i.i, label %check_data.exit.i

if.then.i.i:                                      ; preds = %if.end.i
  call void @blake(i8* nonnull %18, i64 32, i8* nonnull %18) #7
  br label %check_data.exit.i

check_data.exit.i:                                ; preds = %if.then.i.i, %if.end.i
  %data_index.2.i = phi i32 [ 0, %if.then.i.i ], [ %data_index.1.i, %if.end.i ]
  %inc22.i = add nsw i32 %data_index.2.i, 1
  %arrayidx23.i = getelementptr inbounds [32 x i8], [32 x i8]* %data.i, i32 0, i32 %data_index.2.i
  %26 = load i8, i8* %arrayidx23.i, align 1, !tbaa !6
  %and.i = and i8 %26, 7
  %cmp26.i = icmp eq i8 %and.i, 5
  br i1 %cmp26.i, label %if.then28.i, label %if.else.i

if.then28.i:                                      ; preds = %check_data.exit.i
  %add.i20.i = add nsw i32 %data_index.2.i, 2
  %cmp.i21.i = icmp ugt i32 %add.i20.i, 32
  br i1 %cmp.i21.i, label %if.then.i22.i, label %check_data.exit23.i

if.then.i22.i:                                    ; preds = %if.then28.i
  call void @blake(i8* nonnull %18, i64 32, i8* nonnull %18) #7
  br label %check_data.exit23.i

check_data.exit23.i:                              ; preds = %if.then.i22.i, %if.then28.i
  %data_index.3.i = phi i32 [ 0, %if.then.i22.i ], [ %inc22.i, %if.then28.i ]
  %inc30.i = add nuw nsw i32 %data_index.3.i, 1
  %arrayidx31.i = getelementptr inbounds [32 x i8], [32 x i8]* %data.i, i32 0, i32 %data_index.3.i
  %27 = load i8, i8* %arrayidx31.i, align 1, !tbaa !6
  %cmp33.i = icmp sgt i8 %27, -1
  %conv35.i = select i1 %cmp33.i, i8 3, i8 4
  br label %if.end48.i

if.else.i:                                        ; preds = %check_data.exit.i
  %cmp37.i = icmp ugt i8 %and.i, 5
  br i1 %cmp37.i, label %if.end48.i, label %if.else40.i

if.else40.i:                                      ; preds = %if.else.i
  %cmp42.i = icmp ult i8 %and.i, 3
  %sub.i = add nsw i8 %and.i, -2
  %conv46.i = select i1 %cmp42.i, i8 0, i8 %sub.i
  br label %if.end48.i

if.end48.i:                                       ; preds = %if.else40.i, %if.else.i, %check_data.exit23.i
  %data_index.4.i = phi i32 [ %inc30.i, %check_data.exit23.i ], [ %inc22.i, %if.else.i ], [ %inc22.i, %if.else40.i ]
  %opcode.0.i = phi i8 [ %conv35.i, %check_data.exit23.i ], [ 5, %if.else.i ], [ %conv46.i, %if.else40.i ]
  %28 = lshr i8 %26, 3
  %and50.i = and i8 %28, 3
  %29 = lshr i8 %26, 5
  %conv56.i = zext i8 %and50.i to i32
  %conv57.i = zext i8 %29 to i32
  %conv58.i = zext i8 %opcode.0.i to i32
  %cmp59.i = icmp eq i8 %opcode.0.i, 1
  %30 = add nsw i8 %opcode.0.i, -1
  %31 = icmp ult i8 %30, 2
  %cmp67.i = icmp eq i8 %opcode.0.i, 5
  %or.cond15.i = or i1 %cmp67.i, %31
  %cmp69.i = icmp eq i8 %and50.i, %29
  %or.cond16.i = and i1 %cmp69.i, %or.cond15.i
  %b.0.i = select i1 %or.cond16.i, i32 8, i32 %conv57.i
  %arrayidx73.i = getelementptr inbounds [6 x i8], [6 x i8]* %is_rotation.i, i32 0, i32 %conv58.i
  %32 = load i8, i8* %arrayidx73.i, align 1, !tbaa !11, !range !13
  %tobool.i = icmp eq i8 %32, 0
  br i1 %tobool.i, label %if.end80.i, label %land.lhs.true75.i

land.lhs.true75.i:                                ; preds = %if.end48.i
  %arrayidx76.i = getelementptr inbounds [4 x i8], [4 x i8]* %tmpcast.i, i32 0, i32 %conv56.i
  %33 = load i8, i8* %arrayidx76.i, align 1, !tbaa !11, !range !13
  %tobool77.i = icmp eq i8 %33, 0
  br i1 %tobool77.i, label %if.end80.i, label %while.cond.i.backedge

if.end80.i:                                       ; preds = %land.lhs.true75.i, %if.end48.i
  %cmp82.i = icmp eq i8 %opcode.0.i, 0
  br i1 %cmp82.i, label %if.end94.i, label %land.lhs.true84.i

land.lhs.true84.i:                                ; preds = %if.end80.i
  %arrayidx85.i = getelementptr inbounds [9 x i32], [9 x i32]* %inst_data.i, i32 0, i32 %conv56.i
  %34 = load i32, i32* %arrayidx85.i, align 4, !tbaa !7
  %and86.i = and i32 %34, 16776960
  %shl.i = shl nuw nsw i32 %conv58.i, 8
  %arrayidx88.i = getelementptr inbounds [9 x i32], [9 x i32]* %inst_data.i, i32 0, i32 %b.0.i
  %35 = load i32, i32* %arrayidx88.i, align 4, !tbaa !7
  %and89.i = shl i32 %35, 16
  %shl90.i = and i32 %and89.i, 16711680
  %add.i = or i32 %shl90.i, %shl.i
  %cmp91.i = icmp eq i32 %and86.i, %add.i
  br i1 %cmp91.i, label %while.cond.i.backedge, label %if.end94.i

if.end94.i:                                       ; preds = %land.lhs.true84.i, %if.end80.i
  %arrayidx95.i = getelementptr inbounds [9 x i32], [9 x i32]* %latency.i, i32 0, i32 %conv56.i
  %36 = load i32, i32* %arrayidx95.i, align 4, !tbaa !7
  %arrayidx96.i = getelementptr inbounds [9 x i32], [9 x i32]* %latency.i, i32 0, i32 %b.0.i
  %37 = load i32, i32* %arrayidx96.i, align 4, !tbaa !7
  %cmp97.i = icmp sgt i32 %36, %37
  %..i = select i1 %cmp97.i, i32 %36, i32 %37
  %cmp10649.i = icmp slt i32 %..i, 45
  br i1 %cmp10649.i, label %while.body108.us.preheader.i, label %while.end.i

while.body108.us.preheader.i:                     ; preds = %if.end94.i
  %arrayidx110.i = getelementptr inbounds [6 x i32], [6 x i32]* @__const.v4_random_math_init.op_ALUs, i32 0, i32 %conv58.i
  %38 = load i32, i32* %arrayidx110.i, align 4, !tbaa !7
  %i.045.i = add nsw i32 %38, -1
  %arrayidx135.i = getelementptr inbounds [6 x i32], [6 x i32]* @__const.v4_random_math_init.op_latency, i32 0, i32 %conv58.i
  br i1 %cmp59.i, label %while.body108.us.i.us, label %while.body108.us.i

while.body108.us.i.us:                            ; preds = %while.body108.us.preheader.i, %if.end144.us.i.us
  %next_latency.050.us.i.us = phi i32 [ %add122.us.i.us, %if.end144.us.i.us ], [ %..i, %while.body108.us.preheader.i ]
  %add122.us.i.us = add nsw i32 %next_latency.050.us.i.us, 1
  br i1 %tobool.i, label %for.body.us.us.i.us.us, label %for.body.us.us.i.us5726

for.body.us.us.i.us5726:                          ; preds = %while.body108.us.i.us, %for.inc.us.us.i.us5738
  %i.048.us.us.i.us5727 = phi i32 [ %i.0.us.us.i.us5739, %for.inc.us.us.i.us5738 ], [ %i.045.i, %while.body108.us.i.us ]
  %i.0.in47.us.us.i.us5728 = phi i32 [ %i.048.us.us.i.us5727, %for.inc.us.us.i.us5738 ], [ %38, %while.body108.us.i.us ]
  %arrayidx115.us.us.i.us5729 = getelementptr inbounds [46 x [3 x i8]], [46 x [3 x i8]]* %alu_busy.i, i32 0, i32 %next_latency.050.us.i.us, i32 %i.048.us.us.i.us5727
  %39 = load i8, i8* %arrayidx115.us.us.i.us5729, align 1, !tbaa !11, !range !13
  %tobool116.us.us.i.us5730 = icmp eq i8 %39, 0
  br i1 %tobool116.us.us.i.us5730, label %land.lhs.true121.us.us.i.us5731, label %for.inc.us.us.i.us5738

land.lhs.true121.us.us.i.us5731:                  ; preds = %for.body.us.us.i.us5726
  %arrayidx124.us.us.i.us5732 = getelementptr inbounds [46 x [3 x i8]], [46 x [3 x i8]]* %alu_busy.i, i32 0, i32 %add122.us.i.us, i32 %i.048.us.us.i.us5727
  %40 = load i8, i8* %arrayidx124.us.us.i.us5732, align 1, !tbaa !11, !range !13
  %tobool125.us.us.i.us5733 = icmp eq i8 %40, 0
  br i1 %tobool125.us.us.i.us5733, label %land.lhs.true133.us.us.i.us5735, label %for.inc.us.us.i.us5738

land.lhs.true133.us.us.i.us5735:                  ; preds = %land.lhs.true121.us.us.i.us5731
  %41 = load i32, i32* %arrayidx135.i, align 4, !tbaa !7
  %mul.us.us.i.us5736 = mul nsw i32 %41, %rotate_count.0.i.ph
  %cmp136.us.us.i.us5737 = icmp slt i32 %next_latency.050.us.i.us, %mul.us.us.i.us5736
  br i1 %cmp136.us.us.i.us5737, label %for.inc.us.us.i.us5738, label %cleanup.us.i.loopexit.us

for.inc.us.us.i.us5738:                           ; preds = %land.lhs.true133.us.us.i.us5735, %land.lhs.true121.us.us.i.us5731, %for.body.us.us.i.us5726
  %i.0.us.us.i.us5739 = add nsw i32 %i.048.us.us.i.us5727, -1
  %cmp112.us.us.i.us5740 = icmp sgt i32 %i.048.us.us.i.us5727, 0
  br i1 %cmp112.us.us.i.us5740, label %for.body.us.us.i.us5726, label %if.end144.us.i.us

if.end144.us.i.us:                                ; preds = %for.inc.us.us.i.us5738, %for.inc.us.us.i.us.us, %cleanup.us.i.loopexit.us
  %cmp106.us.i.us = icmp slt i32 %next_latency.050.us.i.us, 44
  br i1 %cmp106.us.i.us, label %while.body108.us.i.us, label %while.end.i

cleanup.us.i.loopexit.us:                         ; preds = %land.lhs.true133.us.us.i.us5735, %land.lhs.true121.us.us.i.us.us
  %i.048.us.us.i.lcssa.us = phi i32 [ %i.048.us.us.i.us.us, %land.lhs.true121.us.us.i.us.us ], [ %i.048.us.us.i.us5727, %land.lhs.true133.us.us.i.us5735 ]
  %i.0.in47.us.us.i.lcssa.us = phi i32 [ %i.0.in47.us.us.i.us.us, %land.lhs.true121.us.us.i.us.us ], [ %i.0.in47.us.us.i.us5728, %land.lhs.true133.us.us.i.us5735 ]
  %cmp141.us.i.us = icmp sgt i32 %i.0.in47.us.us.i.lcssa.us, 0
  br i1 %cmp141.us.i.us, label %while.end.i, label %if.end144.us.i.us

for.body.us.us.i.us.us:                           ; preds = %while.body108.us.i.us, %for.inc.us.us.i.us.us
  %i.048.us.us.i.us.us = phi i32 [ %i.0.us.us.i.us.us, %for.inc.us.us.i.us.us ], [ %i.045.i, %while.body108.us.i.us ]
  %i.0.in47.us.us.i.us.us = phi i32 [ %i.048.us.us.i.us.us, %for.inc.us.us.i.us.us ], [ %38, %while.body108.us.i.us ]
  %arrayidx115.us.us.i.us.us = getelementptr inbounds [46 x [3 x i8]], [46 x [3 x i8]]* %alu_busy.i, i32 0, i32 %next_latency.050.us.i.us, i32 %i.048.us.us.i.us.us
  %42 = load i8, i8* %arrayidx115.us.us.i.us.us, align 1, !tbaa !11, !range !13
  %tobool116.us.us.i.us.us = icmp eq i8 %42, 0
  br i1 %tobool116.us.us.i.us.us, label %land.lhs.true121.us.us.i.us.us, label %for.inc.us.us.i.us.us

land.lhs.true121.us.us.i.us.us:                   ; preds = %for.body.us.us.i.us.us
  %arrayidx124.us.us.i.us.us = getelementptr inbounds [46 x [3 x i8]], [46 x [3 x i8]]* %alu_busy.i, i32 0, i32 %add122.us.i.us, i32 %i.048.us.us.i.us.us
  %43 = load i8, i8* %arrayidx124.us.us.i.us.us, align 1, !tbaa !11, !range !13
  %tobool125.us.us.i.us.us = icmp eq i8 %43, 0
  br i1 %tobool125.us.us.i.us.us, label %cleanup.us.i.loopexit.us, label %for.inc.us.us.i.us.us

for.inc.us.us.i.us.us:                            ; preds = %land.lhs.true121.us.us.i.us.us, %for.body.us.us.i.us.us
  %i.0.us.us.i.us.us = add nsw i32 %i.048.us.us.i.us.us, -1
  %cmp112.us.us.i.us.us = icmp sgt i32 %i.048.us.us.i.us.us, 0
  br i1 %cmp112.us.us.i.us.us, label %for.body.us.us.i.us.us, label %if.end144.us.i.us

while.body108.us.i:                               ; preds = %while.body108.us.preheader.i, %if.end144.us.i
  %next_latency.050.us.i = phi i32 [ %add122.us.i, %if.end144.us.i ], [ %..i, %while.body108.us.preheader.i ]
  %add122.us.i = add nsw i32 %next_latency.050.us.i, 1
  br i1 %tobool.i, label %for.body.us67.us.i.preheader, label %for.body.us83.i

for.body.us83.i:                                  ; preds = %while.body108.us.i, %for.inc.us96.i
  %i.048.us84.i = phi i32 [ %i.0.us97.i, %for.inc.us96.i ], [ %i.045.i, %while.body108.us.i ]
  %i.0.in47.us85.i = phi i32 [ %i.048.us84.i, %for.inc.us96.i ], [ %38, %while.body108.us.i ]
  %arrayidx115.us86.i = getelementptr inbounds [46 x [3 x i8]], [46 x [3 x i8]]* %alu_busy.i, i32 0, i32 %next_latency.050.us.i, i32 %i.048.us84.i
  %44 = load i8, i8* %arrayidx115.us86.i, align 1, !tbaa !11, !range !13
  %tobool116.us87.i = icmp eq i8 %44, 0
  br i1 %tobool116.us87.i, label %land.lhs.true133.us93.i, label %for.inc.us96.i

land.lhs.true133.us93.i:                          ; preds = %for.body.us83.i
  %45 = load i32, i32* %arrayidx135.i, align 4, !tbaa !7
  %mul.us94.i = mul nsw i32 %45, %rotate_count.0.i.ph
  %cmp136.us95.i = icmp slt i32 %next_latency.050.us.i, %mul.us94.i
  br i1 %cmp136.us95.i, label %for.inc.us96.i, label %cleanup.us.i

for.inc.us96.i:                                   ; preds = %land.lhs.true133.us93.i, %for.body.us83.i
  %i.0.us97.i = add nsw i32 %i.048.us84.i, -1
  %cmp112.us98.i = icmp sgt i32 %i.048.us84.i, 0
  br i1 %cmp112.us98.i, label %for.body.us83.i, label %if.end144.us.i

cleanup.us.i:                                     ; preds = %land.lhs.true133.us93.i, %for.body.us67.us.i.preheader
  %i.0.in.lcssa44.us.i = phi i32 [ %38, %for.body.us67.us.i.preheader ], [ %i.0.in47.us85.i, %land.lhs.true133.us93.i ]
  %i.0.lcssa43.us.i = phi i32 [ %i.045.i, %for.body.us67.us.i.preheader ], [ %i.048.us84.i, %land.lhs.true133.us93.i ]
  %cmp141.us.i = icmp sgt i32 %i.0.in.lcssa44.us.i, 0
  br i1 %cmp141.us.i, label %while.end.i, label %if.end144.us.i

if.end144.us.i:                                   ; preds = %for.inc.us96.i, %for.inc.us80.us.i, %cleanup.us.i
  %cmp106.us.i = icmp slt i32 %next_latency.050.us.i, 44
  br i1 %cmp106.us.i, label %while.body108.us.i, label %while.end.i

for.body.us67.us.i.preheader:                     ; preds = %while.body108.us.i
  %arrayidx115.us70.us.i5721 = getelementptr inbounds [46 x [3 x i8]], [46 x [3 x i8]]* %alu_busy.i, i32 0, i32 %next_latency.050.us.i, i32 %i.045.i
  %46 = load i8, i8* %arrayidx115.us70.us.i5721, align 1, !tbaa !11, !range !13
  %tobool116.us71.us.i5722 = icmp eq i8 %46, 0
  br i1 %tobool116.us71.us.i5722, label %cleanup.us.i, label %for.inc.us80.us.i

for.body.us67.us.i:                               ; preds = %for.inc.us80.us.i
  %arrayidx115.us70.us.i = getelementptr inbounds [46 x [3 x i8]], [46 x [3 x i8]]* %alu_busy.i, i32 0, i32 %next_latency.050.us.i, i32 %i.0.us81.us.i
  %47 = load i8, i8* %arrayidx115.us70.us.i, align 1, !tbaa !11, !range !13
  %tobool116.us71.us.i = icmp eq i8 %47, 0
  br i1 %tobool116.us71.us.i, label %while.end.i, label %for.inc.us80.us.i

for.inc.us80.us.i:                                ; preds = %for.body.us67.us.i.preheader, %for.body.us67.us.i
  %i.048.us68.us.i5723 = phi i32 [ %i.0.us81.us.i, %for.body.us67.us.i ], [ %i.045.i, %for.body.us67.us.i.preheader ]
  %i.0.us81.us.i = add nsw i32 %i.048.us68.us.i5723, -1
  %cmp112.us82.us.i = icmp sgt i32 %i.048.us68.us.i5723, 0
  br i1 %cmp112.us82.us.i, label %for.body.us67.us.i, label %if.end144.us.i

while.end.i:                                      ; preds = %if.end144.us.i, %cleanup.us.i, %if.end144.us.i.us, %cleanup.us.i.loopexit.us, %for.body.us67.us.i, %if.end94.i
  %next_latency.0.lcssa.i = phi i32 [ %..i, %if.end94.i ], [ %next_latency.050.us.i, %for.body.us67.us.i ], [ %next_latency.050.us.i.us, %cleanup.us.i.loopexit.us ], [ %add122.us.i.us, %if.end144.us.i.us ], [ %next_latency.050.us.i, %cleanup.us.i ], [ %add122.us.i, %if.end144.us.i ]
  %alu_index.2.i = phi i32 [ -1, %if.end94.i ], [ %i.0.us81.us.i, %for.body.us67.us.i ], [ %i.048.us.us.i.lcssa.us, %cleanup.us.i.loopexit.us ], [ -1, %if.end144.us.i.us ], [ %i.0.lcssa43.us.i, %cleanup.us.i ], [ -1, %if.end144.us.i ]
  %add147.i = add nsw i32 %36, 7
  %cmp148.i = icmp sgt i32 %next_latency.0.lcssa.i, %add147.i
  br i1 %cmp148.i, label %while.cond.i.backedge, label %if.end151.i

while.cond.i.backedge:                            ; preds = %while.end.i, %land.lhs.true84.i, %land.lhs.true75.i
  br label %while.cond.i

if.end151.i:                                      ; preds = %while.end.i
  %arrayidx153.i = getelementptr inbounds [6 x i32], [6 x i32]* @__const.v4_random_math_init.op_latency, i32 0, i32 %conv58.i
  %48 = load i32, i32* %arrayidx153.i, align 4, !tbaa !7
  %add154.i = add nsw i32 %48, %next_latency.0.lcssa.i
  %cmp155.i = icmp slt i32 %add154.i, 46
  br i1 %cmp155.i, label %if.then157.i, label %if.else229.i

if.then157.i:                                     ; preds = %if.end151.i
  %src_index.0.i.le.le = select i1 %or.cond16.i, i8 8, i8 %29
  %not.tobool.i = xor i1 %tobool.i, true
  %inc162.i = zext i1 %not.tobool.i to i32
  %spec.select.i = add nuw nsw i32 %rotate_count.0.i.ph, %inc162.i
  %arrayidx168.i = getelementptr inbounds [46 x [3 x i8]], [46 x [3 x i8]]* %alu_busy.i, i32 0, i32 %next_latency.0.lcssa.i, i32 %alu_index.2.i
  store i8 1, i8* %arrayidx168.i, align 1, !tbaa !11
  store i32 %add154.i, i32* %arrayidx95.i, align 4, !tbaa !7
  %arrayidx170.i = getelementptr inbounds [9 x i32], [9 x i32]* %asic_latency.i, i32 0, i32 %conv56.i
  %49 = load i32, i32* %arrayidx170.i, align 4, !tbaa !7
  %arrayidx171.i = getelementptr inbounds [9 x i32], [9 x i32]* %asic_latency.i, i32 0, i32 %b.0.i
  %50 = load i32, i32* %arrayidx171.i, align 4, !tbaa !7
  %cmp172.i = icmp sgt i32 %49, %50
  %cond179.i = select i1 %cmp172.i, i32 %49, i32 %50
  %arrayidx181.i = getelementptr inbounds [6 x i32], [6 x i32]* @__const.v4_random_math_init.asic_op_latency, i32 0, i32 %conv58.i
  %51 = load i32, i32* %arrayidx181.i, align 4, !tbaa !7
  %add182.i = add nsw i32 %cond179.i, %51
  store i32 %add182.i, i32* %arrayidx170.i, align 4, !tbaa !7
  %arrayidx187.i = getelementptr inbounds [4 x i8], [4 x i8]* %tmpcast.i, i32 0, i32 %conv56.i
  store i8 %32, i8* %arrayidx187.i, align 1, !tbaa !11
  %shl189.i = shl nuw nsw i32 %conv58.i, 8
  %add190.i = add nuw nsw i32 %shl189.i, %code_size.0.i.ph
  %arrayidx191.i = getelementptr inbounds [9 x i32], [9 x i32]* %inst_data.i, i32 0, i32 %b.0.i
  %52 = load i32, i32* %arrayidx191.i, align 4, !tbaa !7
  %and192.i = shl i32 %52, 16
  %shl193.i = and i32 %and192.i, 16711680
  %add194.i = add nuw i32 %add190.i, %shl193.i
  %arrayidx195.i = getelementptr inbounds [9 x i32], [9 x i32]* %inst_data.i, i32 0, i32 %conv56.i
  store i32 %add194.i, i32* %arrayidx195.i, align 4, !tbaa !7
  %opcode197.i = getelementptr inbounds [71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 %code_size.0.i.ph, i32 2
  store i8 %opcode.0.i, i8* %opcode197.i, align 2, !tbaa !14
  %dst_index199.i = getelementptr inbounds [71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 %code_size.0.i.ph, i32 0
  store i8 %and50.i, i8* %dst_index199.i, align 8, !tbaa !16
  %src_index201.i = getelementptr inbounds [71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 %code_size.0.i.ph, i32 1
  store i8 %src_index.0.i.le.le, i8* %src_index201.i, align 1, !tbaa !17
  %C.i = getelementptr inbounds [71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 %code_size.0.i.ph, i32 3
  store i32 0, i32* %C.i, align 4, !tbaa !18
  %spec.select17.i = or i1 %r8_used.0.off0.i.ph, %or.cond16.i
  br i1 %cmp59.i, label %if.then211.i, label %if.end223.i

if.then211.i:                                     ; preds = %if.then157.i
  %add215.i = add nsw i32 %next_latency.0.lcssa.i, 1
  %arrayidx217.i = getelementptr inbounds [46 x [3 x i8]], [46 x [3 x i8]]* %alu_busy.i, i32 0, i32 %add215.i, i32 %alu_index.2.i
  store i8 1, i8* %arrayidx217.i, align 1, !tbaa !11
  %add.i24.i = add i32 %data_index.4.i, 4
  %cmp.i25.i = icmp ugt i32 %add.i24.i, 32
  br i1 %cmp.i25.i, label %if.then.i26.i, label %check_data.exit27.i

if.then.i26.i:                                    ; preds = %if.then211.i
  call void @blake(i8* nonnull %18, i64 32, i8* nonnull %18) #7
  br label %check_data.exit27.i

check_data.exit27.i:                              ; preds = %if.then.i26.i, %if.then211.i
  %data_index.5.i = phi i32 [ 0, %if.then.i26.i ], [ %data_index.4.i, %if.then211.i ]
  %add.ptr.i = getelementptr inbounds [32 x i8], [32 x i8]* %data.i, i32 0, i32 %data_index.5.i
  %t.0.add.ptr.sroa_cast.i = bitcast i8* %add.ptr.i to i32*
  %t.0.copyload.i = load i32, i32* %t.0.add.ptr.sroa_cast.i, align 1
  store i32 %t.0.copyload.i, i32* %C.i, align 4, !tbaa !18
  %add222.i = add nsw i32 %data_index.5.i, 4
  br label %if.end223.i

if.end223.i:                                      ; preds = %check_data.exit27.i, %if.then157.i
  %data_index.6.i = phi i32 [ %add222.i, %check_data.exit27.i ], [ %data_index.4.i, %if.then157.i ]
  %inc224.i = add nuw nsw i32 %code_size.0.i.ph, 1
  %cmp225.i = icmp ugt i32 %code_size.0.i.ph, 58
  br i1 %cmp225.i, label %while.end240.i, label %if.end223.cleanup234_crit_edge.i

if.end223.cleanup234_crit_edge.i:                 ; preds = %if.end223.i
  %.pre.pre.i = load i32, i32* %arraydecay2.i, align 16, !tbaa !7
  %.pre126.pre.i = load i32, i32* %arrayidx10.i, align 4
  %.pre127.pre.i = load i32, i32* %arrayidx13.i, align 8
  br label %while.cond.i.outer

if.else229.i:                                     ; preds = %if.end151.i
  %inc230.i = add nsw i32 %num_retries.0.i.ph5849, 1
  br label %while.cond.i.outer5846

while.end240.i:                                   ; preds = %if.end223.i, %while.body.i, %land.rhs.i, %lor.lhs.false15.i
  %data_index.9.i = phi i32 [ %data_index.1.i, %lor.lhs.false15.i ], [ %data_index.1.i, %land.rhs.i ], [ %data_index.1.i, %while.body.i ], [ %data_index.6.i, %if.end223.i ]
  %r8_used.5.off0.i = phi i1 [ %r8_used.0.off0.i.ph, %lor.lhs.false15.i ], [ %r8_used.0.off0.i.ph, %land.rhs.i ], [ %r8_used.0.off0.i.ph, %while.body.i ], [ %spec.select17.i, %if.end223.i ]
  %code_size.4.i = phi i32 [ %code_size.0.i.ph, %lor.lhs.false15.i ], [ %code_size.0.i.ph, %land.rhs.i ], [ %code_size.0.i.ph, %while.body.i ], [ %inc224.i, %if.end223.i ]
  %cmp24259.i = icmp slt i32 %code_size.4.i, 70
  %53 = load i32, i32* %arraydecay3.i, align 16
  %cmp24660.i = icmp slt i32 %53, 45
  %or.cond1861.i = and i1 %cmp24259.i, %cmp24660.i
  br i1 %or.cond1861.i, label %land.lhs.true248.i, label %while.end308.i

land.lhs.true248.i:                               ; preds = %while.end240.i, %for.body267.preheader.i
  %54 = phi i32 [ %67, %for.body267.preheader.i ], [ %53, %while.end240.i ]
  %code_size.562.i = phi i32 [ %inc307.i, %for.body267.preheader.i ], [ %code_size.4.i, %while.end240.i ]
  %55 = load i32, i32* %arrayidx249.i, align 4, !tbaa !7
  %cmp250.i = icmp slt i32 %55, 45
  %56 = load i32, i32* %arrayidx253.i, align 8
  %cmp254.i = icmp slt i32 %56, 45
  %or.cond111.i = and i1 %cmp250.i, %cmp254.i
  %57 = load i32, i32* %arrayidx257.i, align 4
  %cmp258.i = icmp slt i32 %57, 45
  %or.cond112.i = and i1 %or.cond111.i, %cmp258.i
  br i1 %or.cond112.i, label %for.body267.preheader.i, label %while.end308.i

for.body267.preheader.i:                          ; preds = %land.lhs.true248.i
  %cmp270.i = icmp slt i32 %55, %54
  %spec.select19.i = zext i1 %cmp270.i to i32
  %cmp276.i = icmp sgt i32 %55, %54
  %max_idx.1.i = zext i1 %cmp276.i to i32
  %arrayidx269.1.i = getelementptr inbounds [9 x i32], [9 x i32]* %asic_latency.i, i32 0, i32 %spec.select19.i
  %58 = load i32, i32* %arrayidx269.1.i, align 4, !tbaa !7
  %cmp270.1.i = icmp slt i32 %56, %58
  %spec.select19.1.i = select i1 %cmp270.1.i, i32 2, i32 %spec.select19.i
  %arrayidx275.1.i = getelementptr inbounds [9 x i32], [9 x i32]* %asic_latency.i, i32 0, i32 %max_idx.1.i
  %59 = load i32, i32* %arrayidx275.1.i, align 4, !tbaa !7
  %cmp276.1.i = icmp sgt i32 %56, %59
  %max_idx.1.1.i = select i1 %cmp276.1.i, i32 2, i32 %max_idx.1.i
  %arrayidx269.2.i = getelementptr inbounds [9 x i32], [9 x i32]* %asic_latency.i, i32 0, i32 %spec.select19.1.i
  %60 = load i32, i32* %arrayidx269.2.i, align 4, !tbaa !7
  %cmp270.2.i = icmp slt i32 %57, %60
  %spec.select19.2.i = select i1 %cmp270.2.i, i32 3, i32 %spec.select19.1.i
  %arrayidx275.2.i = getelementptr inbounds [9 x i32], [9 x i32]* %asic_latency.i, i32 0, i32 %max_idx.1.1.i
  %61 = load i32, i32* %arrayidx275.2.i, align 4, !tbaa !7
  %cmp276.2.i = icmp sgt i32 %57, %61
  %max_idx.1.2.i = select i1 %cmp276.2.i, i32 3, i32 %max_idx.1.1.i
  %sub285.i = sub nsw i32 %code_size.562.i, %code_size.4.i
  %rem.i = srem i32 %sub285.i, 3
  %arrayidx286.i = getelementptr inbounds [3 x i8], [3 x i8]* @__const.v4_random_math_init.pattern, i32 0, i32 %rem.i
  %62 = load i8, i8* %arrayidx286.i, align 1, !tbaa !6
  %arrayidx287.i = getelementptr inbounds [9 x i32], [9 x i32]* %latency.i, i32 0, i32 %max_idx.1.2.i
  %63 = load i32, i32* %arrayidx287.i, align 4, !tbaa !7
  %idxprom288.i = zext i8 %62 to i32
  %arrayidx289.i = getelementptr inbounds [6 x i32], [6 x i32]* @__const.v4_random_math_init.op_latency, i32 0, i32 %idxprom288.i
  %64 = load i32, i32* %arrayidx289.i, align 4, !tbaa !7
  %add290.i = add nsw i32 %64, %63
  %arrayidx291.i = getelementptr inbounds [9 x i32], [9 x i32]* %latency.i, i32 0, i32 %spec.select19.2.i
  store i32 %add290.i, i32* %arrayidx291.i, align 4, !tbaa !7
  %arrayidx292.i = getelementptr inbounds [9 x i32], [9 x i32]* %asic_latency.i, i32 0, i32 %max_idx.1.2.i
  %65 = load i32, i32* %arrayidx292.i, align 4, !tbaa !7
  %arrayidx294.i = getelementptr inbounds [6 x i32], [6 x i32]* @__const.v4_random_math_init.asic_op_latency, i32 0, i32 %idxprom288.i
  %66 = load i32, i32* %arrayidx294.i, align 4, !tbaa !7
  %add295.i = add nsw i32 %66, %65
  %arrayidx296.i = getelementptr inbounds [9 x i32], [9 x i32]* %asic_latency.i, i32 0, i32 %spec.select19.2.i
  store i32 %add295.i, i32* %arrayidx296.i, align 4, !tbaa !7
  %opcode298.i = getelementptr inbounds [71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 %code_size.562.i, i32 2
  store i8 %62, i8* %opcode298.i, align 2, !tbaa !14
  %conv299.i = trunc i32 %spec.select19.2.i to i8
  %dst_index301.i = getelementptr inbounds [71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 %code_size.562.i, i32 0
  store i8 %conv299.i, i8* %dst_index301.i, align 8, !tbaa !16
  %conv302.i = trunc i32 %max_idx.1.2.i to i8
  %src_index304.i = getelementptr inbounds [71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 %code_size.562.i, i32 1
  store i8 %conv302.i, i8* %src_index304.i, align 1, !tbaa !17
  %C306.i = getelementptr inbounds [71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 %code_size.562.i, i32 3
  store i32 0, i32* %C306.i, align 4, !tbaa !18
  %inc307.i = add nsw i32 %code_size.562.i, 1
  %cmp242.i = icmp slt i32 %code_size.562.i, 69
  %67 = load i32, i32* %arraydecay3.i, align 16
  %cmp246.i = icmp slt i32 %67, 45
  %or.cond18.i = and i1 %cmp242.i, %cmp246.i
  br i1 %or.cond18.i, label %land.lhs.true248.i, label %while.end308.i

while.end308.i:                                   ; preds = %for.body267.preheader.i, %land.lhs.true248.i, %while.end240.i
  %code_size.5.lcssa.i = phi i32 [ %code_size.4.i, %while.end240.i ], [ %code_size.562.i, %land.lhs.true248.i ], [ %inc307.i, %for.body267.preheader.i ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %24) #7
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %23) #7
  call void @llvm.lifetime.end.p0i8(i64 138, i8* nonnull %22) #7
  call void @llvm.lifetime.end.p0i8(i64 36, i8* nonnull %21) #7
  call void @llvm.lifetime.end.p0i8(i64 36, i8* nonnull %20) #7
  call void @llvm.lifetime.end.p0i8(i64 36, i8* nonnull %19) #7
  %tobool309.not.i = xor i1 %r8_used.5.off0.i, true
  %code_size.5.off.i = add i32 %code_size.5.lcssa.i, -60
  %68 = icmp ugt i32 %code_size.5.off.i, 10
  %69 = or i1 %68, %tobool309.not.i
  br i1 %69, label %do.body.i, label %v4_random_math_init.exit

v4_random_math_init.exit:                         ; preds = %while.end308.i
  %opcode316.i = getelementptr inbounds [71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 %code_size.5.lcssa.i, i32 2
  store i8 6, i8* %opcode316.i, align 2, !tbaa !14
  %dst_index318.i = getelementptr inbounds [71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 %code_size.5.lcssa.i, i32 0
  store i8 0, i8* %dst_index318.i, align 8, !tbaa !16
  %src_index320.i = getelementptr inbounds [71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 %code_size.5.lcssa.i, i32 1
  store i8 0, i8* %src_index320.i, align 1, !tbaa !17
  %C322.i = getelementptr inbounds [71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 %code_size.5.lcssa.i, i32 3
  store i32 0, i32* %C322.i, align 4, !tbaa !18
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %18) #7
  store i32 %height, i32* @lastHeight, align 4, !tbaa !7
  %.pre = load i8*, i8** %5, align 4, !tbaa !9
  %70 = bitcast i8* %.pre to %struct._oaes_ctx*
  br label %do.end56

do.end56:                                         ; preds = %cond.end, %cond.end.thread, %for.cond.preheader, %v4_random_math_init.exit, %do.body33
  %71 = phi %struct._oaes_ctx* [ %6, %for.cond.preheader ], [ %70, %v4_random_math_init.exit ], [ %6, %do.body33 ], [ %6, %cond.end.thread ], [ %6, %cond.end ]
  %72 = phi i8* [ %call4, %for.cond.preheader ], [ %.pre, %v4_random_math_init.exit ], [ %call4, %do.body33 ], [ %call4, %cond.end.thread ], [ %call4, %cond.end ]
  %cmp345683 = phi i1 [ true, %for.cond.preheader ], [ true, %v4_random_math_init.exit ], [ false, %do.body33 ], [ false, %cond.end.thread ], [ false, %cond.end ]
  %division_result.05682 = phi i64 [ %14, %for.cond.preheader ], [ %14, %v4_random_math_init.exit ], [ %14, %do.body33 ], [ 0, %cond.end.thread ], [ 0, %cond.end ]
  %sqrt_result.05681 = phi i64 [ %15, %for.cond.preheader ], [ %15, %v4_random_math_init.exit ], [ %15, %do.body33 ], [ 0, %cond.end.thread ], [ 0, %cond.end ]
  %d.sroa.23.05680 = phi i64 [ %xor24, %for.cond.preheader ], [ %xor24, %v4_random_math_init.exit ], [ %xor24, %do.body33 ], [ undef, %cond.end.thread ], [ undef, %cond.end ]
  %d.sroa.0.sroa.0.05679 = phi i32 [ %d.sroa.0.sroa.0.0.extract.trunc5305, %for.cond.preheader ], [ %d.sroa.0.sroa.0.0.extract.trunc5305, %v4_random_math_init.exit ], [ %d.sroa.0.sroa.0.0.extract.trunc5305, %do.body33 ], [ undef, %cond.end.thread ], [ undef, %cond.end ]
  %d.sroa.0.sroa.23.05678 = phi i32 [ %d.sroa.0.sroa.23.0.extract.trunc5362, %for.cond.preheader ], [ %d.sroa.0.sroa.23.0.extract.trunc5362, %v4_random_math_init.exit ], [ %d.sroa.0.sroa.23.0.extract.trunc5362, %do.body33 ], [ undef, %cond.end.thread ], [ undef, %cond.end ]
  %cond56695677 = phi i64 [ 0, %for.cond.preheader ], [ 0, %v4_random_math_init.exit ], [ 0, %do.body33 ], [ %xor, %cond.end.thread ], [ 0, %cond.end ]
  %call60 = call i32 @oaes_key_import_data(i8* %72, i8* nonnull %1, i32 32) #7
  %key = getelementptr inbounds %struct._oaes_ctx, %struct._oaes_ctx* %71, i32 0, i32 0
  br label %for.cond65.preheader

for.cond65.preheader:                             ; preds = %do.end56, %for.end72
  %i.05720 = phi i32 [ 0, %do.end56 ], [ %add, %for.end72 ]
  %73 = load %struct._oaes_key*, %struct._oaes_key** %key, align 4, !tbaa !19
  %exp_data = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %73, i32 0, i32 3
  %74 = load i8*, i8** %exp_data, align 4, !tbaa !22
  br label %for.body68

for.cond76.preheader:                             ; preds = %for.end72
  %75 = bitcast [16 x i8]* %a to i64*
  %76 = bitcast [16 x i8]* %b to i64*
  %arrayidx81 = getelementptr inbounds %union.cn_slow_hash_state, %union.cn_slow_hash_state* %state, i32 0, i32 0, i32 0, i32 0
  %77 = load i64, i64* %arrayidx81, align 8, !tbaa !2
  %arrayidx85 = getelementptr inbounds %union.cn_slow_hash_state, %union.cn_slow_hash_state* %state, i32 0, i32 0, i32 0, i32 4
  %78 = load i64, i64* %arrayidx85, align 8, !tbaa !2
  %xor86 = xor i64 %78, %77
  store i64 %xor86, i64* %75, align 16, !tbaa !2
  %arrayidx92 = getelementptr inbounds %union.cn_slow_hash_state, %union.cn_slow_hash_state* %state, i32 0, i32 0, i32 0, i32 2
  %79 = load i64, i64* %arrayidx92, align 8, !tbaa !2
  %arrayidx96 = getelementptr inbounds %union.cn_slow_hash_state, %union.cn_slow_hash_state* %state, i32 0, i32 0, i32 0, i32 6
  %80 = load i64, i64* %arrayidx96, align 8, !tbaa !2
  %xor97 = xor i64 %80, %79
  store i64 %xor97, i64* %76, align 16, !tbaa !2
  %arrayidx81.1 = getelementptr inbounds %union.cn_slow_hash_state, %union.cn_slow_hash_state* %state, i32 0, i32 0, i32 0, i32 1
  %81 = load i64, i64* %arrayidx81.1, align 8, !tbaa !2
  %arrayidx85.1 = getelementptr inbounds %union.cn_slow_hash_state, %union.cn_slow_hash_state* %state, i32 0, i32 0, i32 0, i32 5
  %82 = load i64, i64* %arrayidx85.1, align 8, !tbaa !2
  %xor86.1 = xor i64 %82, %81
  %arrayidx88.1 = getelementptr inbounds [16 x i8], [16 x i8]* %a, i32 0, i32 8
  %83 = bitcast i8* %arrayidx88.1 to i64*
  store i64 %xor86.1, i64* %83, align 8, !tbaa !2
  %arrayidx92.1 = getelementptr inbounds %union.cn_slow_hash_state, %union.cn_slow_hash_state* %state, i32 0, i32 0, i32 0, i32 3
  %84 = load i64, i64* %arrayidx92.1, align 8, !tbaa !2
  %arrayidx96.1 = getelementptr inbounds %union.cn_slow_hash_state, %union.cn_slow_hash_state* %state, i32 0, i32 0, i32 0, i32 7
  %85 = load i64, i64* %arrayidx96.1, align 8, !tbaa !2
  %xor97.1 = xor i64 %85, %84
  %arrayidx99.1 = getelementptr inbounds [16 x i8], [16 x i8]* %b, i32 0, i32 8
  %86 = bitcast i8* %arrayidx99.1 to i64*
  store i64 %xor97.1, i64* %86, align 8, !tbaa !2
  %cmp103 = icmp eq i32 %variant, 0
  %87 = trunc i64 %xor86 to i32
  %88 = lshr i64 %xor86, 32
  %89 = trunc i64 %88 to i32
  %90 = trunc i64 %xor86.1 to i32
  br i1 %cmp103, label %for.cond106.preheader, label %if.else

for.body68:                                       ; preds = %for.body68, %for.cond65.preheader
  %j.05719 = phi i32 [ 0, %for.cond65.preheader ], [ %inc71, %for.body68 ]
  %shl = shl nuw nsw i32 %j.05719, 4
  %arrayidx69 = getelementptr inbounds i8, i8* %74, i32 %shl
  %91 = bitcast i8* %arrayidx69 to i32*
  %92 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 3), align 1, !tbaa !6
  %93 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 2), align 2, !tbaa !6
  %94 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 7), align 1, !tbaa !6
  %95 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 1), align 1, !tbaa !6
  %96 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 6), align 2, !tbaa !6
  %97 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 11), align 1, !tbaa !6
  %98 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 0), align 16, !tbaa !6
  %idxprom.i = zext i8 %98 to i32
  %arrayidx14.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i
  %99 = load i32, i32* %arrayidx14.i, align 4, !tbaa !7
  %100 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 5), align 1, !tbaa !6
  %idxprom16.i = zext i8 %100 to i32
  %arrayidx17.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom16.i
  %101 = load i32, i32* %arrayidx17.i, align 4, !tbaa !7
  %xor.i = xor i32 %101, %99
  %102 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 10), align 2, !tbaa !6
  %idxprom19.i = zext i8 %102 to i32
  %arrayidx20.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom19.i
  %103 = load i32, i32* %arrayidx20.i, align 4, !tbaa !7
  %xor21.i = xor i32 %xor.i, %103
  %104 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 15), align 1, !tbaa !6
  %idxprom23.i = zext i8 %104 to i32
  %arrayidx24.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom23.i
  %105 = load i32, i32* %arrayidx24.i, align 4, !tbaa !7
  %xor25.i = xor i32 %xor21.i, %105
  %106 = load i32, i32* %91, align 4, !tbaa !7
  %xor27.i = xor i32 %xor25.i, %106
  store i32 %xor27.i, i32* bitcast ([128 x i8]* @text to i32*), align 16, !tbaa !7
  %idxprom30.i = zext i8 %92 to i32
  %arrayidx31.i2089 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom30.i
  %107 = load i32, i32* %arrayidx31.i2089, align 4, !tbaa !7
  %108 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 4), align 4, !tbaa !6
  %idxprom33.i = zext i8 %108 to i32
  %arrayidx34.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom33.i
  %109 = load i32, i32* %arrayidx34.i, align 4, !tbaa !7
  %xor35.i = xor i32 %109, %107
  %110 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 9), align 1, !tbaa !6
  %idxprom37.i = zext i8 %110 to i32
  %arrayidx38.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom37.i
  %111 = load i32, i32* %arrayidx38.i, align 4, !tbaa !7
  %xor39.i = xor i32 %xor35.i, %111
  %112 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 14), align 2, !tbaa !6
  %idxprom41.i = zext i8 %112 to i32
  %arrayidx42.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom41.i
  %113 = load i32, i32* %arrayidx42.i, align 4, !tbaa !7
  %xor43.i = xor i32 %xor39.i, %113
  %arrayidx44.i = getelementptr inbounds i8, i8* %arrayidx69, i32 4
  %114 = bitcast i8* %arrayidx44.i to i32*
  %115 = load i32, i32* %114, align 4, !tbaa !7
  %xor45.i = xor i32 %xor43.i, %115
  store i32 %xor45.i, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 4) to i32*), align 4, !tbaa !7
  %idxprom48.i = zext i8 %93 to i32
  %arrayidx49.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom48.i
  %116 = load i32, i32* %arrayidx49.i, align 4, !tbaa !7
  %idxprom51.i = zext i8 %94 to i32
  %arrayidx52.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom51.i
  %117 = load i32, i32* %arrayidx52.i, align 4, !tbaa !7
  %xor53.i = xor i32 %117, %116
  %118 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 8), align 8, !tbaa !6
  %idxprom55.i = zext i8 %118 to i32
  %arrayidx56.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom55.i
  %119 = load i32, i32* %arrayidx56.i, align 4, !tbaa !7
  %xor57.i = xor i32 %xor53.i, %119
  %120 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 13), align 1, !tbaa !6
  %idxprom59.i = zext i8 %120 to i32
  %arrayidx60.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom59.i
  %121 = load i32, i32* %arrayidx60.i, align 4, !tbaa !7
  %xor61.i = xor i32 %xor57.i, %121
  %arrayidx62.i = getelementptr inbounds i8, i8* %arrayidx69, i32 8
  %122 = bitcast i8* %arrayidx62.i to i32*
  %123 = load i32, i32* %122, align 4, !tbaa !7
  %xor63.i = xor i32 %xor61.i, %123
  store i32 %xor63.i, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 8) to i32*), align 8, !tbaa !7
  %idxprom66.i = zext i8 %95 to i32
  %arrayidx67.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom66.i
  %124 = load i32, i32* %arrayidx67.i, align 4, !tbaa !7
  %idxprom69.i = zext i8 %96 to i32
  %arrayidx70.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom69.i
  %125 = load i32, i32* %arrayidx70.i, align 4, !tbaa !7
  %xor71.i = xor i32 %125, %124
  %idxprom73.i = zext i8 %97 to i32
  %arrayidx74.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom73.i
  %126 = load i32, i32* %arrayidx74.i, align 4, !tbaa !7
  %xor75.i = xor i32 %xor71.i, %126
  %127 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 12), align 4, !tbaa !6
  %idxprom77.i = zext i8 %127 to i32
  %arrayidx78.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom77.i
  %128 = load i32, i32* %arrayidx78.i, align 4, !tbaa !7
  %xor79.i = xor i32 %xor75.i, %128
  %arrayidx80.i = getelementptr inbounds i8, i8* %arrayidx69, i32 12
  %129 = bitcast i8* %arrayidx80.i to i32*
  %130 = load i32, i32* %129, align 4, !tbaa !7
  %xor81.i = xor i32 %xor79.i, %130
  store i32 %xor81.i, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 12) to i32*), align 4, !tbaa !7
  %131 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 19), align 1, !tbaa !6
  %132 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 18), align 2, !tbaa !6
  %133 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 23), align 1, !tbaa !6
  %134 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 17), align 1, !tbaa !6
  %135 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 22), align 2, !tbaa !6
  %136 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 27), align 1, !tbaa !6
  %137 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 16), align 16, !tbaa !6
  %idxprom.i2090 = zext i8 %137 to i32
  %arrayidx14.i2091 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i2090
  %138 = load i32, i32* %arrayidx14.i2091, align 4, !tbaa !7
  %139 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 21), align 1, !tbaa !6
  %idxprom16.i2092 = zext i8 %139 to i32
  %arrayidx17.i2093 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom16.i2092
  %140 = load i32, i32* %arrayidx17.i2093, align 4, !tbaa !7
  %xor.i2094 = xor i32 %140, %138
  %141 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 26), align 2, !tbaa !6
  %idxprom19.i2095 = zext i8 %141 to i32
  %arrayidx20.i2096 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom19.i2095
  %142 = load i32, i32* %arrayidx20.i2096, align 4, !tbaa !7
  %xor21.i2097 = xor i32 %xor.i2094, %142
  %143 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 31), align 1, !tbaa !6
  %idxprom23.i2098 = zext i8 %143 to i32
  %arrayidx24.i2099 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom23.i2098
  %144 = load i32, i32* %arrayidx24.i2099, align 4, !tbaa !7
  %xor25.i2100 = xor i32 %xor21.i2097, %144
  %145 = load i32, i32* %91, align 4, !tbaa !7
  %xor27.i2101 = xor i32 %xor25.i2100, %145
  store i32 %xor27.i2101, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 16) to i32*), align 16, !tbaa !7
  %idxprom30.i2102 = zext i8 %131 to i32
  %arrayidx31.i2103 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom30.i2102
  %146 = load i32, i32* %arrayidx31.i2103, align 4, !tbaa !7
  %147 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 20), align 4, !tbaa !6
  %idxprom33.i2104 = zext i8 %147 to i32
  %arrayidx34.i2105 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom33.i2104
  %148 = load i32, i32* %arrayidx34.i2105, align 4, !tbaa !7
  %xor35.i2106 = xor i32 %148, %146
  %149 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 25), align 1, !tbaa !6
  %idxprom37.i2107 = zext i8 %149 to i32
  %arrayidx38.i2108 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom37.i2107
  %150 = load i32, i32* %arrayidx38.i2108, align 4, !tbaa !7
  %xor39.i2109 = xor i32 %xor35.i2106, %150
  %151 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 30), align 2, !tbaa !6
  %idxprom41.i2110 = zext i8 %151 to i32
  %arrayidx42.i2111 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom41.i2110
  %152 = load i32, i32* %arrayidx42.i2111, align 4, !tbaa !7
  %xor43.i2112 = xor i32 %xor39.i2109, %152
  %153 = load i32, i32* %114, align 4, !tbaa !7
  %xor45.i2114 = xor i32 %xor43.i2112, %153
  store i32 %xor45.i2114, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 20) to i32*), align 4, !tbaa !7
  %idxprom48.i2115 = zext i8 %132 to i32
  %arrayidx49.i2116 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom48.i2115
  %154 = load i32, i32* %arrayidx49.i2116, align 4, !tbaa !7
  %idxprom51.i2117 = zext i8 %133 to i32
  %arrayidx52.i2118 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom51.i2117
  %155 = load i32, i32* %arrayidx52.i2118, align 4, !tbaa !7
  %xor53.i2119 = xor i32 %155, %154
  %156 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 24), align 8, !tbaa !6
  %idxprom55.i2120 = zext i8 %156 to i32
  %arrayidx56.i2121 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom55.i2120
  %157 = load i32, i32* %arrayidx56.i2121, align 4, !tbaa !7
  %xor57.i2122 = xor i32 %xor53.i2119, %157
  %158 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 29), align 1, !tbaa !6
  %idxprom59.i2123 = zext i8 %158 to i32
  %arrayidx60.i2124 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom59.i2123
  %159 = load i32, i32* %arrayidx60.i2124, align 4, !tbaa !7
  %xor61.i2125 = xor i32 %xor57.i2122, %159
  %160 = load i32, i32* %122, align 4, !tbaa !7
  %xor63.i2127 = xor i32 %xor61.i2125, %160
  store i32 %xor63.i2127, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 24) to i32*), align 8, !tbaa !7
  %idxprom66.i2128 = zext i8 %134 to i32
  %arrayidx67.i2129 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom66.i2128
  %161 = load i32, i32* %arrayidx67.i2129, align 4, !tbaa !7
  %idxprom69.i2130 = zext i8 %135 to i32
  %arrayidx70.i2131 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom69.i2130
  %162 = load i32, i32* %arrayidx70.i2131, align 4, !tbaa !7
  %xor71.i2132 = xor i32 %162, %161
  %idxprom73.i2133 = zext i8 %136 to i32
  %arrayidx74.i2134 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom73.i2133
  %163 = load i32, i32* %arrayidx74.i2134, align 4, !tbaa !7
  %xor75.i2135 = xor i32 %xor71.i2132, %163
  %164 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 28), align 4, !tbaa !6
  %idxprom77.i2136 = zext i8 %164 to i32
  %arrayidx78.i2137 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom77.i2136
  %165 = load i32, i32* %arrayidx78.i2137, align 4, !tbaa !7
  %xor79.i2138 = xor i32 %xor75.i2135, %165
  %166 = load i32, i32* %129, align 4, !tbaa !7
  %xor81.i2140 = xor i32 %xor79.i2138, %166
  store i32 %xor81.i2140, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 28) to i32*), align 4, !tbaa !7
  %167 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 35), align 1, !tbaa !6
  %168 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 34), align 2, !tbaa !6
  %169 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 39), align 1, !tbaa !6
  %170 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 33), align 1, !tbaa !6
  %171 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 38), align 2, !tbaa !6
  %172 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 43), align 1, !tbaa !6
  %173 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 32), align 16, !tbaa !6
  %idxprom.i2141 = zext i8 %173 to i32
  %arrayidx14.i2142 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i2141
  %174 = load i32, i32* %arrayidx14.i2142, align 4, !tbaa !7
  %175 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 37), align 1, !tbaa !6
  %idxprom16.i2143 = zext i8 %175 to i32
  %arrayidx17.i2144 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom16.i2143
  %176 = load i32, i32* %arrayidx17.i2144, align 4, !tbaa !7
  %xor.i2145 = xor i32 %176, %174
  %177 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 42), align 2, !tbaa !6
  %idxprom19.i2146 = zext i8 %177 to i32
  %arrayidx20.i2147 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom19.i2146
  %178 = load i32, i32* %arrayidx20.i2147, align 4, !tbaa !7
  %xor21.i2148 = xor i32 %xor.i2145, %178
  %179 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 47), align 1, !tbaa !6
  %idxprom23.i2149 = zext i8 %179 to i32
  %arrayidx24.i2150 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom23.i2149
  %180 = load i32, i32* %arrayidx24.i2150, align 4, !tbaa !7
  %xor25.i2151 = xor i32 %xor21.i2148, %180
  %181 = load i32, i32* %91, align 4, !tbaa !7
  %xor27.i2152 = xor i32 %xor25.i2151, %181
  store i32 %xor27.i2152, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 32) to i32*), align 16, !tbaa !7
  %idxprom30.i2153 = zext i8 %167 to i32
  %arrayidx31.i2154 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom30.i2153
  %182 = load i32, i32* %arrayidx31.i2154, align 4, !tbaa !7
  %183 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 36), align 4, !tbaa !6
  %idxprom33.i2155 = zext i8 %183 to i32
  %arrayidx34.i2156 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom33.i2155
  %184 = load i32, i32* %arrayidx34.i2156, align 4, !tbaa !7
  %xor35.i2157 = xor i32 %184, %182
  %185 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 41), align 1, !tbaa !6
  %idxprom37.i2158 = zext i8 %185 to i32
  %arrayidx38.i2159 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom37.i2158
  %186 = load i32, i32* %arrayidx38.i2159, align 4, !tbaa !7
  %xor39.i2160 = xor i32 %xor35.i2157, %186
  %187 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 46), align 2, !tbaa !6
  %idxprom41.i2161 = zext i8 %187 to i32
  %arrayidx42.i2162 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom41.i2161
  %188 = load i32, i32* %arrayidx42.i2162, align 4, !tbaa !7
  %xor43.i2163 = xor i32 %xor39.i2160, %188
  %189 = load i32, i32* %114, align 4, !tbaa !7
  %xor45.i2165 = xor i32 %xor43.i2163, %189
  store i32 %xor45.i2165, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 36) to i32*), align 4, !tbaa !7
  %idxprom48.i2166 = zext i8 %168 to i32
  %arrayidx49.i2167 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom48.i2166
  %190 = load i32, i32* %arrayidx49.i2167, align 4, !tbaa !7
  %idxprom51.i2168 = zext i8 %169 to i32
  %arrayidx52.i2169 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom51.i2168
  %191 = load i32, i32* %arrayidx52.i2169, align 4, !tbaa !7
  %xor53.i2170 = xor i32 %191, %190
  %192 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 40), align 8, !tbaa !6
  %idxprom55.i2171 = zext i8 %192 to i32
  %arrayidx56.i2172 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom55.i2171
  %193 = load i32, i32* %arrayidx56.i2172, align 4, !tbaa !7
  %xor57.i2173 = xor i32 %xor53.i2170, %193
  %194 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 45), align 1, !tbaa !6
  %idxprom59.i2174 = zext i8 %194 to i32
  %arrayidx60.i2175 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom59.i2174
  %195 = load i32, i32* %arrayidx60.i2175, align 4, !tbaa !7
  %xor61.i2176 = xor i32 %xor57.i2173, %195
  %196 = load i32, i32* %122, align 4, !tbaa !7
  %xor63.i2178 = xor i32 %xor61.i2176, %196
  store i32 %xor63.i2178, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 40) to i32*), align 8, !tbaa !7
  %idxprom66.i2179 = zext i8 %170 to i32
  %arrayidx67.i2180 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom66.i2179
  %197 = load i32, i32* %arrayidx67.i2180, align 4, !tbaa !7
  %idxprom69.i2181 = zext i8 %171 to i32
  %arrayidx70.i2182 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom69.i2181
  %198 = load i32, i32* %arrayidx70.i2182, align 4, !tbaa !7
  %xor71.i2183 = xor i32 %198, %197
  %idxprom73.i2184 = zext i8 %172 to i32
  %arrayidx74.i2185 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom73.i2184
  %199 = load i32, i32* %arrayidx74.i2185, align 4, !tbaa !7
  %xor75.i2186 = xor i32 %xor71.i2183, %199
  %200 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 44), align 4, !tbaa !6
  %idxprom77.i2187 = zext i8 %200 to i32
  %arrayidx78.i2188 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom77.i2187
  %201 = load i32, i32* %arrayidx78.i2188, align 4, !tbaa !7
  %xor79.i2189 = xor i32 %xor75.i2186, %201
  %202 = load i32, i32* %129, align 4, !tbaa !7
  %xor81.i2191 = xor i32 %xor79.i2189, %202
  store i32 %xor81.i2191, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 44) to i32*), align 4, !tbaa !7
  %203 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 51), align 1, !tbaa !6
  %204 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 50), align 2, !tbaa !6
  %205 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 55), align 1, !tbaa !6
  %206 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 49), align 1, !tbaa !6
  %207 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 54), align 2, !tbaa !6
  %208 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 59), align 1, !tbaa !6
  %209 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 48), align 16, !tbaa !6
  %idxprom.i2192 = zext i8 %209 to i32
  %arrayidx14.i2193 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i2192
  %210 = load i32, i32* %arrayidx14.i2193, align 4, !tbaa !7
  %211 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 53), align 1, !tbaa !6
  %idxprom16.i2194 = zext i8 %211 to i32
  %arrayidx17.i2195 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom16.i2194
  %212 = load i32, i32* %arrayidx17.i2195, align 4, !tbaa !7
  %xor.i2196 = xor i32 %212, %210
  %213 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 58), align 2, !tbaa !6
  %idxprom19.i2197 = zext i8 %213 to i32
  %arrayidx20.i2198 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom19.i2197
  %214 = load i32, i32* %arrayidx20.i2198, align 4, !tbaa !7
  %xor21.i2199 = xor i32 %xor.i2196, %214
  %215 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 63), align 1, !tbaa !6
  %idxprom23.i2200 = zext i8 %215 to i32
  %arrayidx24.i2201 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom23.i2200
  %216 = load i32, i32* %arrayidx24.i2201, align 4, !tbaa !7
  %xor25.i2202 = xor i32 %xor21.i2199, %216
  %217 = load i32, i32* %91, align 4, !tbaa !7
  %xor27.i2203 = xor i32 %xor25.i2202, %217
  store i32 %xor27.i2203, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 48) to i32*), align 16, !tbaa !7
  %idxprom30.i2204 = zext i8 %203 to i32
  %arrayidx31.i2205 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom30.i2204
  %218 = load i32, i32* %arrayidx31.i2205, align 4, !tbaa !7
  %219 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 52), align 4, !tbaa !6
  %idxprom33.i2206 = zext i8 %219 to i32
  %arrayidx34.i2207 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom33.i2206
  %220 = load i32, i32* %arrayidx34.i2207, align 4, !tbaa !7
  %xor35.i2208 = xor i32 %220, %218
  %221 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 57), align 1, !tbaa !6
  %idxprom37.i2209 = zext i8 %221 to i32
  %arrayidx38.i2210 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom37.i2209
  %222 = load i32, i32* %arrayidx38.i2210, align 4, !tbaa !7
  %xor39.i2211 = xor i32 %xor35.i2208, %222
  %223 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 62), align 2, !tbaa !6
  %idxprom41.i2212 = zext i8 %223 to i32
  %arrayidx42.i2213 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom41.i2212
  %224 = load i32, i32* %arrayidx42.i2213, align 4, !tbaa !7
  %xor43.i2214 = xor i32 %xor39.i2211, %224
  %225 = load i32, i32* %114, align 4, !tbaa !7
  %xor45.i2216 = xor i32 %xor43.i2214, %225
  store i32 %xor45.i2216, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 52) to i32*), align 4, !tbaa !7
  %idxprom48.i2217 = zext i8 %204 to i32
  %arrayidx49.i2218 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom48.i2217
  %226 = load i32, i32* %arrayidx49.i2218, align 4, !tbaa !7
  %idxprom51.i2219 = zext i8 %205 to i32
  %arrayidx52.i2220 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom51.i2219
  %227 = load i32, i32* %arrayidx52.i2220, align 4, !tbaa !7
  %xor53.i2221 = xor i32 %227, %226
  %228 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 56), align 8, !tbaa !6
  %idxprom55.i2222 = zext i8 %228 to i32
  %arrayidx56.i2223 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom55.i2222
  %229 = load i32, i32* %arrayidx56.i2223, align 4, !tbaa !7
  %xor57.i2224 = xor i32 %xor53.i2221, %229
  %230 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 61), align 1, !tbaa !6
  %idxprom59.i2225 = zext i8 %230 to i32
  %arrayidx60.i2226 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom59.i2225
  %231 = load i32, i32* %arrayidx60.i2226, align 4, !tbaa !7
  %xor61.i2227 = xor i32 %xor57.i2224, %231
  %232 = load i32, i32* %122, align 4, !tbaa !7
  %xor63.i2229 = xor i32 %xor61.i2227, %232
  store i32 %xor63.i2229, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 56) to i32*), align 8, !tbaa !7
  %idxprom66.i2230 = zext i8 %206 to i32
  %arrayidx67.i2231 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom66.i2230
  %233 = load i32, i32* %arrayidx67.i2231, align 4, !tbaa !7
  %idxprom69.i2232 = zext i8 %207 to i32
  %arrayidx70.i2233 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom69.i2232
  %234 = load i32, i32* %arrayidx70.i2233, align 4, !tbaa !7
  %xor71.i2234 = xor i32 %234, %233
  %idxprom73.i2235 = zext i8 %208 to i32
  %arrayidx74.i2236 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom73.i2235
  %235 = load i32, i32* %arrayidx74.i2236, align 4, !tbaa !7
  %xor75.i2237 = xor i32 %xor71.i2234, %235
  %236 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 60), align 4, !tbaa !6
  %idxprom77.i2238 = zext i8 %236 to i32
  %arrayidx78.i2239 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom77.i2238
  %237 = load i32, i32* %arrayidx78.i2239, align 4, !tbaa !7
  %xor79.i2240 = xor i32 %xor75.i2237, %237
  %238 = load i32, i32* %129, align 4, !tbaa !7
  %xor81.i2242 = xor i32 %xor79.i2240, %238
  store i32 %xor81.i2242, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 60) to i32*), align 4, !tbaa !7
  %239 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 67), align 1, !tbaa !6
  %240 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 66), align 2, !tbaa !6
  %241 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 71), align 1, !tbaa !6
  %242 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 65), align 1, !tbaa !6
  %243 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 70), align 2, !tbaa !6
  %244 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 75), align 1, !tbaa !6
  %245 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 64), align 16, !tbaa !6
  %idxprom.i5144 = zext i8 %245 to i32
  %arrayidx14.i5145 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i5144
  %246 = load i32, i32* %arrayidx14.i5145, align 4, !tbaa !7
  %247 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 69), align 1, !tbaa !6
  %idxprom16.i5146 = zext i8 %247 to i32
  %arrayidx17.i5147 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom16.i5146
  %248 = load i32, i32* %arrayidx17.i5147, align 4, !tbaa !7
  %xor.i5148 = xor i32 %248, %246
  %249 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 74), align 2, !tbaa !6
  %idxprom19.i5149 = zext i8 %249 to i32
  %arrayidx20.i5150 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom19.i5149
  %250 = load i32, i32* %arrayidx20.i5150, align 4, !tbaa !7
  %xor21.i5151 = xor i32 %xor.i5148, %250
  %251 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 79), align 1, !tbaa !6
  %idxprom23.i5152 = zext i8 %251 to i32
  %arrayidx24.i5153 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom23.i5152
  %252 = load i32, i32* %arrayidx24.i5153, align 4, !tbaa !7
  %xor25.i5154 = xor i32 %xor21.i5151, %252
  %253 = load i32, i32* %91, align 4, !tbaa !7
  %xor27.i5155 = xor i32 %xor25.i5154, %253
  store i32 %xor27.i5155, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 64) to i32*), align 16, !tbaa !7
  %idxprom30.i5156 = zext i8 %239 to i32
  %arrayidx31.i5157 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom30.i5156
  %254 = load i32, i32* %arrayidx31.i5157, align 4, !tbaa !7
  %255 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 68), align 4, !tbaa !6
  %idxprom33.i5158 = zext i8 %255 to i32
  %arrayidx34.i5159 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom33.i5158
  %256 = load i32, i32* %arrayidx34.i5159, align 4, !tbaa !7
  %xor35.i5160 = xor i32 %256, %254
  %257 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 73), align 1, !tbaa !6
  %idxprom37.i5161 = zext i8 %257 to i32
  %arrayidx38.i5162 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom37.i5161
  %258 = load i32, i32* %arrayidx38.i5162, align 4, !tbaa !7
  %xor39.i5163 = xor i32 %xor35.i5160, %258
  %259 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 78), align 2, !tbaa !6
  %idxprom41.i5164 = zext i8 %259 to i32
  %arrayidx42.i5165 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom41.i5164
  %260 = load i32, i32* %arrayidx42.i5165, align 4, !tbaa !7
  %xor43.i5166 = xor i32 %xor39.i5163, %260
  %261 = load i32, i32* %114, align 4, !tbaa !7
  %xor45.i5168 = xor i32 %xor43.i5166, %261
  store i32 %xor45.i5168, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 68) to i32*), align 4, !tbaa !7
  %idxprom48.i5169 = zext i8 %240 to i32
  %arrayidx49.i5170 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom48.i5169
  %262 = load i32, i32* %arrayidx49.i5170, align 4, !tbaa !7
  %idxprom51.i5171 = zext i8 %241 to i32
  %arrayidx52.i5172 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom51.i5171
  %263 = load i32, i32* %arrayidx52.i5172, align 4, !tbaa !7
  %xor53.i5173 = xor i32 %263, %262
  %264 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 72), align 8, !tbaa !6
  %idxprom55.i5174 = zext i8 %264 to i32
  %arrayidx56.i5175 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom55.i5174
  %265 = load i32, i32* %arrayidx56.i5175, align 4, !tbaa !7
  %xor57.i5176 = xor i32 %xor53.i5173, %265
  %266 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 77), align 1, !tbaa !6
  %idxprom59.i5177 = zext i8 %266 to i32
  %arrayidx60.i5178 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom59.i5177
  %267 = load i32, i32* %arrayidx60.i5178, align 4, !tbaa !7
  %xor61.i5179 = xor i32 %xor57.i5176, %267
  %268 = load i32, i32* %122, align 4, !tbaa !7
  %xor63.i5181 = xor i32 %xor61.i5179, %268
  store i32 %xor63.i5181, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 72) to i32*), align 8, !tbaa !7
  %idxprom66.i5182 = zext i8 %242 to i32
  %arrayidx67.i5183 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom66.i5182
  %269 = load i32, i32* %arrayidx67.i5183, align 4, !tbaa !7
  %idxprom69.i5184 = zext i8 %243 to i32
  %arrayidx70.i5185 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom69.i5184
  %270 = load i32, i32* %arrayidx70.i5185, align 4, !tbaa !7
  %xor71.i5186 = xor i32 %270, %269
  %idxprom73.i5187 = zext i8 %244 to i32
  %arrayidx74.i5188 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom73.i5187
  %271 = load i32, i32* %arrayidx74.i5188, align 4, !tbaa !7
  %xor75.i5189 = xor i32 %xor71.i5186, %271
  %272 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 76), align 4, !tbaa !6
  %idxprom77.i5190 = zext i8 %272 to i32
  %arrayidx78.i5191 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom77.i5190
  %273 = load i32, i32* %arrayidx78.i5191, align 4, !tbaa !7
  %xor79.i5192 = xor i32 %xor75.i5189, %273
  %274 = load i32, i32* %129, align 4, !tbaa !7
  %xor81.i5194 = xor i32 %xor79.i5192, %274
  store i32 %xor81.i5194, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 76) to i32*), align 4, !tbaa !7
  %275 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 83), align 1, !tbaa !6
  %276 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 82), align 2, !tbaa !6
  %277 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 87), align 1, !tbaa !6
  %278 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 81), align 1, !tbaa !6
  %279 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 86), align 2, !tbaa !6
  %280 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 91), align 1, !tbaa !6
  %281 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 80), align 16, !tbaa !6
  %idxprom.i5093 = zext i8 %281 to i32
  %arrayidx14.i5094 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i5093
  %282 = load i32, i32* %arrayidx14.i5094, align 4, !tbaa !7
  %283 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 85), align 1, !tbaa !6
  %idxprom16.i5095 = zext i8 %283 to i32
  %arrayidx17.i5096 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom16.i5095
  %284 = load i32, i32* %arrayidx17.i5096, align 4, !tbaa !7
  %xor.i5097 = xor i32 %284, %282
  %285 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 90), align 2, !tbaa !6
  %idxprom19.i5098 = zext i8 %285 to i32
  %arrayidx20.i5099 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom19.i5098
  %286 = load i32, i32* %arrayidx20.i5099, align 4, !tbaa !7
  %xor21.i5100 = xor i32 %xor.i5097, %286
  %287 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 95), align 1, !tbaa !6
  %idxprom23.i5101 = zext i8 %287 to i32
  %arrayidx24.i5102 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom23.i5101
  %288 = load i32, i32* %arrayidx24.i5102, align 4, !tbaa !7
  %xor25.i5103 = xor i32 %xor21.i5100, %288
  %289 = load i32, i32* %91, align 4, !tbaa !7
  %xor27.i5104 = xor i32 %xor25.i5103, %289
  store i32 %xor27.i5104, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 80) to i32*), align 16, !tbaa !7
  %idxprom30.i5105 = zext i8 %275 to i32
  %arrayidx31.i5106 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom30.i5105
  %290 = load i32, i32* %arrayidx31.i5106, align 4, !tbaa !7
  %291 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 84), align 4, !tbaa !6
  %idxprom33.i5107 = zext i8 %291 to i32
  %arrayidx34.i5108 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom33.i5107
  %292 = load i32, i32* %arrayidx34.i5108, align 4, !tbaa !7
  %xor35.i5109 = xor i32 %292, %290
  %293 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 89), align 1, !tbaa !6
  %idxprom37.i5110 = zext i8 %293 to i32
  %arrayidx38.i5111 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom37.i5110
  %294 = load i32, i32* %arrayidx38.i5111, align 4, !tbaa !7
  %xor39.i5112 = xor i32 %xor35.i5109, %294
  %295 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 94), align 2, !tbaa !6
  %idxprom41.i5113 = zext i8 %295 to i32
  %arrayidx42.i5114 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom41.i5113
  %296 = load i32, i32* %arrayidx42.i5114, align 4, !tbaa !7
  %xor43.i5115 = xor i32 %xor39.i5112, %296
  %297 = load i32, i32* %114, align 4, !tbaa !7
  %xor45.i5117 = xor i32 %xor43.i5115, %297
  store i32 %xor45.i5117, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 84) to i32*), align 4, !tbaa !7
  %idxprom48.i5118 = zext i8 %276 to i32
  %arrayidx49.i5119 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom48.i5118
  %298 = load i32, i32* %arrayidx49.i5119, align 4, !tbaa !7
  %idxprom51.i5120 = zext i8 %277 to i32
  %arrayidx52.i5121 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom51.i5120
  %299 = load i32, i32* %arrayidx52.i5121, align 4, !tbaa !7
  %xor53.i5122 = xor i32 %299, %298
  %300 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 88), align 8, !tbaa !6
  %idxprom55.i5123 = zext i8 %300 to i32
  %arrayidx56.i5124 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom55.i5123
  %301 = load i32, i32* %arrayidx56.i5124, align 4, !tbaa !7
  %xor57.i5125 = xor i32 %xor53.i5122, %301
  %302 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 93), align 1, !tbaa !6
  %idxprom59.i5126 = zext i8 %302 to i32
  %arrayidx60.i5127 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom59.i5126
  %303 = load i32, i32* %arrayidx60.i5127, align 4, !tbaa !7
  %xor61.i5128 = xor i32 %xor57.i5125, %303
  %304 = load i32, i32* %122, align 4, !tbaa !7
  %xor63.i5130 = xor i32 %xor61.i5128, %304
  store i32 %xor63.i5130, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 88) to i32*), align 8, !tbaa !7
  %idxprom66.i5131 = zext i8 %278 to i32
  %arrayidx67.i5132 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom66.i5131
  %305 = load i32, i32* %arrayidx67.i5132, align 4, !tbaa !7
  %idxprom69.i5133 = zext i8 %279 to i32
  %arrayidx70.i5134 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom69.i5133
  %306 = load i32, i32* %arrayidx70.i5134, align 4, !tbaa !7
  %xor71.i5135 = xor i32 %306, %305
  %idxprom73.i5136 = zext i8 %280 to i32
  %arrayidx74.i5137 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom73.i5136
  %307 = load i32, i32* %arrayidx74.i5137, align 4, !tbaa !7
  %xor75.i5138 = xor i32 %xor71.i5135, %307
  %308 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 92), align 4, !tbaa !6
  %idxprom77.i5139 = zext i8 %308 to i32
  %arrayidx78.i5140 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom77.i5139
  %309 = load i32, i32* %arrayidx78.i5140, align 4, !tbaa !7
  %xor79.i5141 = xor i32 %xor75.i5138, %309
  %310 = load i32, i32* %129, align 4, !tbaa !7
  %xor81.i5143 = xor i32 %xor79.i5141, %310
  store i32 %xor81.i5143, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 92) to i32*), align 4, !tbaa !7
  %311 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 99), align 1, !tbaa !6
  %312 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 98), align 2, !tbaa !6
  %313 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 103), align 1, !tbaa !6
  %314 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 97), align 1, !tbaa !6
  %315 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 102), align 2, !tbaa !6
  %316 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 107), align 1, !tbaa !6
  %317 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 96), align 16, !tbaa !6
  %idxprom.i5042 = zext i8 %317 to i32
  %arrayidx14.i5043 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i5042
  %318 = load i32, i32* %arrayidx14.i5043, align 4, !tbaa !7
  %319 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 101), align 1, !tbaa !6
  %idxprom16.i5044 = zext i8 %319 to i32
  %arrayidx17.i5045 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom16.i5044
  %320 = load i32, i32* %arrayidx17.i5045, align 4, !tbaa !7
  %xor.i5046 = xor i32 %320, %318
  %321 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 106), align 2, !tbaa !6
  %idxprom19.i5047 = zext i8 %321 to i32
  %arrayidx20.i5048 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom19.i5047
  %322 = load i32, i32* %arrayidx20.i5048, align 4, !tbaa !7
  %xor21.i5049 = xor i32 %xor.i5046, %322
  %323 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 111), align 1, !tbaa !6
  %idxprom23.i5050 = zext i8 %323 to i32
  %arrayidx24.i5051 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom23.i5050
  %324 = load i32, i32* %arrayidx24.i5051, align 4, !tbaa !7
  %xor25.i5052 = xor i32 %xor21.i5049, %324
  %325 = load i32, i32* %91, align 4, !tbaa !7
  %xor27.i5053 = xor i32 %xor25.i5052, %325
  store i32 %xor27.i5053, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 96) to i32*), align 16, !tbaa !7
  %idxprom30.i5054 = zext i8 %311 to i32
  %arrayidx31.i5055 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom30.i5054
  %326 = load i32, i32* %arrayidx31.i5055, align 4, !tbaa !7
  %327 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 100), align 4, !tbaa !6
  %idxprom33.i5056 = zext i8 %327 to i32
  %arrayidx34.i5057 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom33.i5056
  %328 = load i32, i32* %arrayidx34.i5057, align 4, !tbaa !7
  %xor35.i5058 = xor i32 %328, %326
  %329 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 105), align 1, !tbaa !6
  %idxprom37.i5059 = zext i8 %329 to i32
  %arrayidx38.i5060 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom37.i5059
  %330 = load i32, i32* %arrayidx38.i5060, align 4, !tbaa !7
  %xor39.i5061 = xor i32 %xor35.i5058, %330
  %331 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 110), align 2, !tbaa !6
  %idxprom41.i5062 = zext i8 %331 to i32
  %arrayidx42.i5063 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom41.i5062
  %332 = load i32, i32* %arrayidx42.i5063, align 4, !tbaa !7
  %xor43.i5064 = xor i32 %xor39.i5061, %332
  %333 = load i32, i32* %114, align 4, !tbaa !7
  %xor45.i5066 = xor i32 %xor43.i5064, %333
  store i32 %xor45.i5066, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 100) to i32*), align 4, !tbaa !7
  %idxprom48.i5067 = zext i8 %312 to i32
  %arrayidx49.i5068 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom48.i5067
  %334 = load i32, i32* %arrayidx49.i5068, align 4, !tbaa !7
  %idxprom51.i5069 = zext i8 %313 to i32
  %arrayidx52.i5070 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom51.i5069
  %335 = load i32, i32* %arrayidx52.i5070, align 4, !tbaa !7
  %xor53.i5071 = xor i32 %335, %334
  %336 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 104), align 8, !tbaa !6
  %idxprom55.i5072 = zext i8 %336 to i32
  %arrayidx56.i5073 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom55.i5072
  %337 = load i32, i32* %arrayidx56.i5073, align 4, !tbaa !7
  %xor57.i5074 = xor i32 %xor53.i5071, %337
  %338 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 109), align 1, !tbaa !6
  %idxprom59.i5075 = zext i8 %338 to i32
  %arrayidx60.i5076 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom59.i5075
  %339 = load i32, i32* %arrayidx60.i5076, align 4, !tbaa !7
  %xor61.i5077 = xor i32 %xor57.i5074, %339
  %340 = load i32, i32* %122, align 4, !tbaa !7
  %xor63.i5079 = xor i32 %xor61.i5077, %340
  store i32 %xor63.i5079, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 104) to i32*), align 8, !tbaa !7
  %idxprom66.i5080 = zext i8 %314 to i32
  %arrayidx67.i5081 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom66.i5080
  %341 = load i32, i32* %arrayidx67.i5081, align 4, !tbaa !7
  %idxprom69.i5082 = zext i8 %315 to i32
  %arrayidx70.i5083 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom69.i5082
  %342 = load i32, i32* %arrayidx70.i5083, align 4, !tbaa !7
  %xor71.i5084 = xor i32 %342, %341
  %idxprom73.i5085 = zext i8 %316 to i32
  %arrayidx74.i5086 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom73.i5085
  %343 = load i32, i32* %arrayidx74.i5086, align 4, !tbaa !7
  %xor75.i5087 = xor i32 %xor71.i5084, %343
  %344 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 108), align 4, !tbaa !6
  %idxprom77.i5088 = zext i8 %344 to i32
  %arrayidx78.i5089 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom77.i5088
  %345 = load i32, i32* %arrayidx78.i5089, align 4, !tbaa !7
  %xor79.i5090 = xor i32 %xor75.i5087, %345
  %346 = load i32, i32* %129, align 4, !tbaa !7
  %xor81.i5092 = xor i32 %xor79.i5090, %346
  store i32 %xor81.i5092, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 108) to i32*), align 4, !tbaa !7
  %347 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 115), align 1, !tbaa !6
  %348 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 114), align 2, !tbaa !6
  %349 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 119), align 1, !tbaa !6
  %350 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 113), align 1, !tbaa !6
  %351 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 118), align 2, !tbaa !6
  %352 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 123), align 1, !tbaa !6
  %353 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 112), align 16, !tbaa !6
  %idxprom.i4991 = zext i8 %353 to i32
  %arrayidx14.i4992 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i4991
  %354 = load i32, i32* %arrayidx14.i4992, align 4, !tbaa !7
  %355 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 117), align 1, !tbaa !6
  %idxprom16.i4993 = zext i8 %355 to i32
  %arrayidx17.i4994 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom16.i4993
  %356 = load i32, i32* %arrayidx17.i4994, align 4, !tbaa !7
  %xor.i4995 = xor i32 %356, %354
  %357 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 122), align 2, !tbaa !6
  %idxprom19.i4996 = zext i8 %357 to i32
  %arrayidx20.i4997 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom19.i4996
  %358 = load i32, i32* %arrayidx20.i4997, align 4, !tbaa !7
  %xor21.i4998 = xor i32 %xor.i4995, %358
  %359 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 127), align 1, !tbaa !6
  %idxprom23.i4999 = zext i8 %359 to i32
  %arrayidx24.i5000 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom23.i4999
  %360 = load i32, i32* %arrayidx24.i5000, align 4, !tbaa !7
  %xor25.i5001 = xor i32 %xor21.i4998, %360
  %361 = load i32, i32* %91, align 4, !tbaa !7
  %xor27.i5002 = xor i32 %xor25.i5001, %361
  store i32 %xor27.i5002, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 112) to i32*), align 16, !tbaa !7
  %idxprom30.i5003 = zext i8 %347 to i32
  %arrayidx31.i5004 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom30.i5003
  %362 = load i32, i32* %arrayidx31.i5004, align 4, !tbaa !7
  %363 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 116), align 4, !tbaa !6
  %idxprom33.i5005 = zext i8 %363 to i32
  %arrayidx34.i5006 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom33.i5005
  %364 = load i32, i32* %arrayidx34.i5006, align 4, !tbaa !7
  %xor35.i5007 = xor i32 %364, %362
  %365 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 121), align 1, !tbaa !6
  %idxprom37.i5008 = zext i8 %365 to i32
  %arrayidx38.i5009 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom37.i5008
  %366 = load i32, i32* %arrayidx38.i5009, align 4, !tbaa !7
  %xor39.i5010 = xor i32 %xor35.i5007, %366
  %367 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 126), align 2, !tbaa !6
  %idxprom41.i5011 = zext i8 %367 to i32
  %arrayidx42.i5012 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom41.i5011
  %368 = load i32, i32* %arrayidx42.i5012, align 4, !tbaa !7
  %xor43.i5013 = xor i32 %xor39.i5010, %368
  %369 = load i32, i32* %114, align 4, !tbaa !7
  %xor45.i5015 = xor i32 %xor43.i5013, %369
  store i32 %xor45.i5015, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 116) to i32*), align 4, !tbaa !7
  %idxprom48.i5016 = zext i8 %348 to i32
  %arrayidx49.i5017 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom48.i5016
  %370 = load i32, i32* %arrayidx49.i5017, align 4, !tbaa !7
  %idxprom51.i5018 = zext i8 %349 to i32
  %arrayidx52.i5019 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom51.i5018
  %371 = load i32, i32* %arrayidx52.i5019, align 4, !tbaa !7
  %xor53.i5020 = xor i32 %371, %370
  %372 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 120), align 8, !tbaa !6
  %idxprom55.i5021 = zext i8 %372 to i32
  %arrayidx56.i5022 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom55.i5021
  %373 = load i32, i32* %arrayidx56.i5022, align 4, !tbaa !7
  %xor57.i5023 = xor i32 %xor53.i5020, %373
  %374 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 125), align 1, !tbaa !6
  %idxprom59.i5024 = zext i8 %374 to i32
  %arrayidx60.i5025 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom59.i5024
  %375 = load i32, i32* %arrayidx60.i5025, align 4, !tbaa !7
  %xor61.i5026 = xor i32 %xor57.i5023, %375
  %376 = load i32, i32* %122, align 4, !tbaa !7
  %xor63.i5028 = xor i32 %xor61.i5026, %376
  store i32 %xor63.i5028, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 120) to i32*), align 8, !tbaa !7
  %idxprom66.i5029 = zext i8 %350 to i32
  %arrayidx67.i5030 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom66.i5029
  %377 = load i32, i32* %arrayidx67.i5030, align 4, !tbaa !7
  %idxprom69.i5031 = zext i8 %351 to i32
  %arrayidx70.i5032 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom69.i5031
  %378 = load i32, i32* %arrayidx70.i5032, align 4, !tbaa !7
  %xor71.i5033 = xor i32 %378, %377
  %idxprom73.i5034 = zext i8 %352 to i32
  %arrayidx74.i5035 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom73.i5034
  %379 = load i32, i32* %arrayidx74.i5035, align 4, !tbaa !7
  %xor75.i5036 = xor i32 %xor71.i5033, %379
  %380 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 124), align 4, !tbaa !6
  %idxprom77.i5037 = zext i8 %380 to i32
  %arrayidx78.i5038 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom77.i5037
  %381 = load i32, i32* %arrayidx78.i5038, align 4, !tbaa !7
  %xor79.i5039 = xor i32 %xor75.i5036, %381
  %382 = load i32, i32* %129, align 4, !tbaa !7
  %xor81.i5041 = xor i32 %xor79.i5039, %382
  store i32 %xor81.i5041, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 124) to i32*), align 4, !tbaa !7
  %inc71 = add nuw nsw i32 %j.05719, 1
  %exitcond5770 = icmp eq i32 %inc71, 10
  br i1 %exitcond5770, label %for.end72, label %for.body68

for.end72:                                        ; preds = %for.body68
  %arrayidx73 = getelementptr inbounds i8, i8* %call, i32 %i.05720
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 1 dereferenceable(128) %arrayidx73, i8* nonnull align 16 dereferenceable(128) getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 0), i32 128, i1 false)
  %add = add nuw nsw i32 %i.05720, 128
  %cmp62 = icmp ult i32 %add, %memory.0
  br i1 %cmp62, label %for.cond65.preheader, label %for.cond76.preheader

for.cond106.preheader:                            ; preds = %for.cond76.preheader
  %arrayidx67.i4988 = getelementptr inbounds [16 x i8], [16 x i8]* %a, i32 0, i32 12
  %383 = bitcast i8* %arrayidx67.i4988 to i32*
  %384 = bitcast [16 x i8]* %b to i32*
  %arrayidx33.i4853 = getelementptr inbounds [16 x i8], [16 x i8]* %b, i32 0, i32 4
  %385 = bitcast i8* %arrayidx33.i4853 to i32*
  %386 = bitcast i8* %arrayidx99.1 to i32*
  %arrayidx69.i4889 = getelementptr inbounds [16 x i8], [16 x i8]* %b, i32 0, i32 12
  %387 = bitcast i8* %arrayidx69.i4889 to i32*
  %.promoted = load i64, i64* %75, align 16, !tbaa !2
  br label %for.body109

for.body109:                                      ; preds = %for.body109, %for.cond106.preheader
  %388 = phi i64 [ %.promoted, %for.cond106.preheader ], [ %xor.i4793, %for.body109 ]
  %389 = phi i32 [ %90, %for.cond106.preheader ], [ %482, %for.body109 ]
  %390 = phi i32 [ %89, %for.cond106.preheader ], [ %481, %for.body109 ]
  %391 = phi i32 [ %87, %for.cond106.preheader ], [ %479, %for.body109 ]
  %i.25700 = phi i32 [ 0, %for.cond106.preheader ], [ %inc146, %for.body109 ]
  %and = and i32 %391, %mask.0
  %arrayidx113 = getelementptr inbounds i8, i8* %call, i32 %and
  %392 = load i8, i8* %arrayidx113, align 1, !tbaa !6
  %idxprom.i4922 = zext i8 %392 to i32
  %arrayidx1.i4923 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i4922
  %393 = load i32, i32* %arrayidx1.i4923, align 4, !tbaa !7
  %arrayidx2.i4924 = getelementptr inbounds i8, i8* %arrayidx113, i32 5
  %394 = load i8, i8* %arrayidx2.i4924, align 1, !tbaa !6
  %idxprom3.i4925 = zext i8 %394 to i32
  %arrayidx4.i4926 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom3.i4925
  %395 = load i32, i32* %arrayidx4.i4926, align 4, !tbaa !7
  %arrayidx5.i4928 = getelementptr inbounds i8, i8* %arrayidx113, i32 10
  %396 = load i8, i8* %arrayidx5.i4928, align 1, !tbaa !6
  %idxprom6.i4929 = zext i8 %396 to i32
  %arrayidx7.i4930 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom6.i4929
  %397 = load i32, i32* %arrayidx7.i4930, align 4, !tbaa !7
  %arrayidx9.i4932 = getelementptr inbounds i8, i8* %arrayidx113, i32 15
  %398 = load i8, i8* %arrayidx9.i4932, align 1, !tbaa !6
  %idxprom10.i4933 = zext i8 %398 to i32
  %arrayidx11.i4934 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom10.i4933
  %399 = load i32, i32* %arrayidx11.i4934, align 4, !tbaa !7
  %xor.i4927 = xor i32 %393, %391
  %xor8.i4931 = xor i32 %xor.i4927, %395
  %xor12.i4935 = xor i32 %xor8.i4931, %397
  %xor14.i4936 = xor i32 %xor12.i4935, %399
  %arrayidx16.i4937 = getelementptr inbounds i8, i8* %arrayidx113, i32 3
  %400 = load i8, i8* %arrayidx16.i4937, align 1, !tbaa !6
  %idxprom17.i4938 = zext i8 %400 to i32
  %arrayidx18.i4939 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom17.i4938
  %401 = load i32, i32* %arrayidx18.i4939, align 4, !tbaa !7
  %arrayidx19.i4940 = getelementptr inbounds i8, i8* %arrayidx113, i32 4
  %402 = load i8, i8* %arrayidx19.i4940, align 1, !tbaa !6
  %idxprom20.i4941 = zext i8 %402 to i32
  %arrayidx21.i4942 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom20.i4941
  %403 = load i32, i32* %arrayidx21.i4942, align 4, !tbaa !7
  %xor22.i4943 = xor i32 %403, %401
  %arrayidx23.i4944 = getelementptr inbounds i8, i8* %arrayidx113, i32 9
  %404 = load i8, i8* %arrayidx23.i4944, align 1, !tbaa !6
  %idxprom24.i4945 = zext i8 %404 to i32
  %arrayidx25.i4946 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom24.i4945
  %405 = load i32, i32* %arrayidx25.i4946, align 4, !tbaa !7
  %xor26.i4947 = xor i32 %xor22.i4943, %405
  %arrayidx27.i4948 = getelementptr inbounds i8, i8* %arrayidx113, i32 14
  %406 = load i8, i8* %arrayidx27.i4948, align 1, !tbaa !6
  %idxprom28.i4949 = zext i8 %406 to i32
  %arrayidx29.i4950 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom28.i4949
  %407 = load i32, i32* %arrayidx29.i4950, align 4, !tbaa !7
  %xor30.i4951 = xor i32 %xor26.i4947, %407
  %xor32.i4953 = xor i32 %xor30.i4951, %390
  %arrayidx34.i4955 = getelementptr inbounds i8, i8* %arrayidx113, i32 2
  %408 = load i8, i8* %arrayidx34.i4955, align 1, !tbaa !6
  %idxprom35.i4956 = zext i8 %408 to i32
  %arrayidx36.i4957 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom35.i4956
  %409 = load i32, i32* %arrayidx36.i4957, align 4, !tbaa !7
  %arrayidx37.i4958 = getelementptr inbounds i8, i8* %arrayidx113, i32 7
  %410 = load i8, i8* %arrayidx37.i4958, align 1, !tbaa !6
  %idxprom38.i4959 = zext i8 %410 to i32
  %arrayidx39.i4960 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom38.i4959
  %411 = load i32, i32* %arrayidx39.i4960, align 4, !tbaa !7
  %xor40.i4961 = xor i32 %411, %409
  %arrayidx41.i4962 = getelementptr inbounds i8, i8* %arrayidx113, i32 8
  %412 = load i8, i8* %arrayidx41.i4962, align 1, !tbaa !6
  %idxprom42.i4963 = zext i8 %412 to i32
  %arrayidx43.i4964 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom42.i4963
  %413 = load i32, i32* %arrayidx43.i4964, align 4, !tbaa !7
  %xor44.i4965 = xor i32 %xor40.i4961, %413
  %arrayidx45.i4966 = getelementptr inbounds i8, i8* %arrayidx113, i32 13
  %414 = load i8, i8* %arrayidx45.i4966, align 1, !tbaa !6
  %idxprom46.i4967 = zext i8 %414 to i32
  %arrayidx47.i4968 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom46.i4967
  %415 = load i32, i32* %arrayidx47.i4968, align 4, !tbaa !7
  %xor48.i4969 = xor i32 %xor44.i4965, %415
  %xor50.i4971 = xor i32 %xor48.i4969, %389
  %c.sroa.50.8.insert.ext5444 = zext i32 %xor50.i4971 to i64
  %arrayidx52.i4973 = getelementptr inbounds i8, i8* %arrayidx113, i32 1
  %416 = load i8, i8* %arrayidx52.i4973, align 1, !tbaa !6
  %idxprom53.i4974 = zext i8 %416 to i32
  %arrayidx54.i4975 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom53.i4974
  %417 = load i32, i32* %arrayidx54.i4975, align 4, !tbaa !7
  %arrayidx55.i4976 = getelementptr inbounds i8, i8* %arrayidx113, i32 6
  %418 = load i8, i8* %arrayidx55.i4976, align 1, !tbaa !6
  %idxprom56.i4977 = zext i8 %418 to i32
  %arrayidx57.i4978 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom56.i4977
  %419 = load i32, i32* %arrayidx57.i4978, align 4, !tbaa !7
  %xor58.i4979 = xor i32 %419, %417
  %arrayidx59.i4980 = getelementptr inbounds i8, i8* %arrayidx113, i32 11
  %420 = load i8, i8* %arrayidx59.i4980, align 1, !tbaa !6
  %idxprom60.i4981 = zext i8 %420 to i32
  %arrayidx61.i4982 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom60.i4981
  %421 = load i32, i32* %arrayidx61.i4982, align 4, !tbaa !7
  %xor62.i4983 = xor i32 %xor58.i4979, %421
  %arrayidx63.i4984 = getelementptr inbounds i8, i8* %arrayidx113, i32 12
  %422 = load i8, i8* %arrayidx63.i4984, align 1, !tbaa !6
  %idxprom64.i4985 = zext i8 %422 to i32
  %arrayidx65.i4986 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom64.i4985
  %423 = load i32, i32* %arrayidx65.i4986, align 4, !tbaa !7
  %xor66.i4987 = xor i32 %xor62.i4983, %423
  %424 = load i32, i32* %383, align 4, !tbaa !7
  %xor68.i4989 = xor i32 %xor66.i4987, %424
  %c.sroa.50.12.insert.ext5448 = zext i32 %xor68.i4989 to i64
  %c.sroa.50.12.insert.shift5449 = shl nuw i64 %c.sroa.50.12.insert.ext5448, 32
  %c.sroa.50.12.insert.insert5451 = or i64 %c.sroa.50.12.insert.shift5449, %c.sroa.50.8.insert.ext5444
  %c.sroa.0.sroa.45.0.insert.ext5635 = zext i32 %xor32.i4953 to i64
  %c.sroa.0.sroa.45.0.insert.shift5636 = shl nuw i64 %c.sroa.0.sroa.45.0.insert.ext5635, 32
  %c.sroa.0.sroa.0.0.insert.ext5528 = zext i32 %xor14.i4936 to i64
  %c.sroa.0.sroa.0.0.insert.insert5530 = or i64 %c.sroa.0.sroa.45.0.insert.shift5636, %c.sroa.0.sroa.0.0.insert.ext5528
  %425 = load i64, i64* %76, align 16, !tbaa !2
  %xor.i4917 = xor i64 %425, %c.sroa.0.sroa.0.0.insert.insert5530
  %426 = bitcast i8* %arrayidx113 to i64*
  store i64 %xor.i4917, i64* %426, align 8, !tbaa !2
  %427 = load i64, i64* %86, align 8, !tbaa !2
  %xor5.i4920 = xor i64 %c.sroa.50.12.insert.insert5451, %427
  %428 = bitcast i8* %arrayidx41.i4962 to i64*
  store i64 %xor5.i4920, i64* %428, align 8, !tbaa !2
  %and120 = and i32 %xor14.i4936, %mask.0
  %arrayidx122 = getelementptr inbounds i8, i8* %call, i32 %and120
  %429 = bitcast i8* %arrayidx122 to i64*
  %430 = load i64, i64* %429, align 8, !tbaa !2
  %and2.i4898 = and i64 %430, 4294967295
  %mul.i4899 = mul nuw i64 %and2.i4898, %c.sroa.0.sroa.0.0.insert.ext5528
  %and3.i4900 = and i64 %mul.i4899, 4294967295
  %shr.i4901 = lshr i64 %mul.i4899, 32
  %mul5.i4903 = mul nuw i64 %and2.i4898, %c.sroa.0.sroa.45.0.insert.ext5635
  %add.i4904 = add nuw i64 %shr.i4901, %mul5.i4903
  %and6.i4905 = and i64 %add.i4904, 4294967295
  %shr7.i4906 = lshr i64 %add.i4904, 32
  %shr8.i4907 = lshr i64 %430, 32
  %mul9.i4908 = mul nuw i64 %shr8.i4907, %c.sroa.0.sroa.0.0.insert.ext5528
  %add10.i4909 = add nuw i64 %and6.i4905, %mul9.i4908
  %shr11.i4910 = lshr i64 %add10.i4909, 32
  %mul12.i4911 = mul nuw i64 %shr8.i4907, %c.sroa.0.sroa.45.0.insert.ext5635
  %shl.i4914 = shl i64 %add10.i4909, 32
  %add15.i4915 = or i64 %shl.i4914, %and3.i4900
  %431 = load i64, i64* %83, align 8, !tbaa !2
  %add.i4892 = add i64 %add15.i4915, %431
  %add13.i4912 = add i64 %388, %mul12.i4911
  %add14.i4913 = add i64 %add13.i4912, %shr7.i4906
  %add4.i4893 = add i64 %add14.i4913, %shr11.i4910
  %xor.i4894 = xor i64 %add4.i4893, %430
  %arrayidx7.i4895 = getelementptr inbounds i8, i8* %arrayidx122, i32 8
  %432 = bitcast i8* %arrayidx7.i4895 to i64*
  %433 = load i64, i64* %432, align 8, !tbaa !2
  %xor8.i4896 = xor i64 %add.i4892, %433
  store i64 %xor8.i4896, i64* %83, align 8, !tbaa !2
  store i64 %add4.i4893, i64* %429, align 8, !tbaa !2
  store i64 %add.i4892, i64* %432, align 8, !tbaa !2
  %434 = trunc i64 %xor.i4894 to i32
  %and129 = and i32 %mask.0, %434
  %arrayidx131 = getelementptr inbounds i8, i8* %call, i32 %and129
  %435 = load i8, i8* %arrayidx131, align 1, !tbaa !6
  %idxprom.i4821 = zext i8 %435 to i32
  %arrayidx1.i4822 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i4821
  %436 = load i32, i32* %arrayidx1.i4822, align 4, !tbaa !7
  %arrayidx2.i4823 = getelementptr inbounds i8, i8* %arrayidx131, i32 5
  %437 = load i8, i8* %arrayidx2.i4823, align 1, !tbaa !6
  %idxprom3.i4824 = zext i8 %437 to i32
  %arrayidx4.i4825 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom3.i4824
  %438 = load i32, i32* %arrayidx4.i4825, align 4, !tbaa !7
  %arrayidx5.i4827 = getelementptr inbounds i8, i8* %arrayidx131, i32 10
  %439 = load i8, i8* %arrayidx5.i4827, align 1, !tbaa !6
  %idxprom6.i4828 = zext i8 %439 to i32
  %arrayidx7.i4829 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom6.i4828
  %440 = load i32, i32* %arrayidx7.i4829, align 4, !tbaa !7
  %arrayidx9.i4831 = getelementptr inbounds i8, i8* %arrayidx131, i32 15
  %441 = load i8, i8* %arrayidx9.i4831, align 1, !tbaa !6
  %idxprom10.i4832 = zext i8 %441 to i32
  %arrayidx11.i4833 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom10.i4832
  %442 = load i32, i32* %arrayidx11.i4833, align 4, !tbaa !7
  %xor.i4826 = xor i32 %436, %434
  %xor8.i4830 = xor i32 %xor.i4826, %438
  %xor12.i4834 = xor i32 %xor8.i4830, %440
  %xor14.i4835 = xor i32 %xor12.i4834, %442
  store i32 %xor14.i4835, i32* %384, align 16, !tbaa !7
  %arrayidx16.i4836 = getelementptr inbounds i8, i8* %arrayidx131, i32 3
  %443 = load i8, i8* %arrayidx16.i4836, align 1, !tbaa !6
  %idxprom17.i4837 = zext i8 %443 to i32
  %arrayidx18.i4838 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom17.i4837
  %444 = load i32, i32* %arrayidx18.i4838, align 4, !tbaa !7
  %arrayidx19.i4839 = getelementptr inbounds i8, i8* %arrayidx131, i32 4
  %445 = load i8, i8* %arrayidx19.i4839, align 1, !tbaa !6
  %idxprom20.i4840 = zext i8 %445 to i32
  %arrayidx21.i4841 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom20.i4840
  %446 = load i32, i32* %arrayidx21.i4841, align 4, !tbaa !7
  %xor22.i4842 = xor i32 %446, %444
  %arrayidx23.i4843 = getelementptr inbounds i8, i8* %arrayidx131, i32 9
  %447 = load i8, i8* %arrayidx23.i4843, align 1, !tbaa !6
  %idxprom24.i4844 = zext i8 %447 to i32
  %arrayidx25.i4845 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom24.i4844
  %448 = load i32, i32* %arrayidx25.i4845, align 4, !tbaa !7
  %xor26.i4846 = xor i32 %xor22.i4842, %448
  %arrayidx27.i4847 = getelementptr inbounds i8, i8* %arrayidx131, i32 14
  %449 = load i8, i8* %arrayidx27.i4847, align 1, !tbaa !6
  %idxprom28.i4848 = zext i8 %449 to i32
  %arrayidx29.i4849 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom28.i4848
  %450 = load i32, i32* %arrayidx29.i4849, align 4, !tbaa !7
  %xor30.i4850 = xor i32 %xor26.i4846, %450
  %451 = lshr i64 %xor.i4894, 32
  %452 = trunc i64 %451 to i32
  %xor32.i4852 = xor i32 %xor30.i4850, %452
  store i32 %xor32.i4852, i32* %385, align 4, !tbaa !7
  %arrayidx34.i4854 = getelementptr inbounds i8, i8* %arrayidx131, i32 2
  %453 = load i8, i8* %arrayidx34.i4854, align 1, !tbaa !6
  %idxprom35.i4855 = zext i8 %453 to i32
  %arrayidx36.i4856 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom35.i4855
  %454 = load i32, i32* %arrayidx36.i4856, align 4, !tbaa !7
  %arrayidx37.i4857 = getelementptr inbounds i8, i8* %arrayidx131, i32 7
  %455 = load i8, i8* %arrayidx37.i4857, align 1, !tbaa !6
  %idxprom38.i4858 = zext i8 %455 to i32
  %arrayidx39.i4859 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom38.i4858
  %456 = load i32, i32* %arrayidx39.i4859, align 4, !tbaa !7
  %xor40.i4860 = xor i32 %456, %454
  %arrayidx41.i4861 = getelementptr inbounds i8, i8* %arrayidx131, i32 8
  %457 = load i8, i8* %arrayidx41.i4861, align 1, !tbaa !6
  %idxprom42.i4862 = zext i8 %457 to i32
  %arrayidx43.i4863 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom42.i4862
  %458 = load i32, i32* %arrayidx43.i4863, align 4, !tbaa !7
  %xor44.i4864 = xor i32 %xor40.i4860, %458
  %arrayidx45.i4865 = getelementptr inbounds i8, i8* %arrayidx131, i32 13
  %459 = load i8, i8* %arrayidx45.i4865, align 1, !tbaa !6
  %idxprom46.i4866 = zext i8 %459 to i32
  %arrayidx47.i4867 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom46.i4866
  %460 = load i32, i32* %arrayidx47.i4867, align 4, !tbaa !7
  %xor48.i4868 = xor i32 %xor44.i4864, %460
  %461 = trunc i64 %xor8.i4896 to i32
  %xor50.i4870 = xor i32 %xor48.i4868, %461
  store i32 %xor50.i4870, i32* %386, align 8, !tbaa !7
  %arrayidx52.i4872 = getelementptr inbounds i8, i8* %arrayidx131, i32 1
  %462 = load i8, i8* %arrayidx52.i4872, align 1, !tbaa !6
  %idxprom53.i4873 = zext i8 %462 to i32
  %arrayidx54.i4874 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom53.i4873
  %463 = load i32, i32* %arrayidx54.i4874, align 4, !tbaa !7
  %arrayidx55.i4875 = getelementptr inbounds i8, i8* %arrayidx131, i32 6
  %464 = load i8, i8* %arrayidx55.i4875, align 1, !tbaa !6
  %idxprom56.i4876 = zext i8 %464 to i32
  %arrayidx57.i4877 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom56.i4876
  %465 = load i32, i32* %arrayidx57.i4877, align 4, !tbaa !7
  %xor58.i4878 = xor i32 %465, %463
  %arrayidx59.i4879 = getelementptr inbounds i8, i8* %arrayidx131, i32 11
  %466 = load i8, i8* %arrayidx59.i4879, align 1, !tbaa !6
  %idxprom60.i4880 = zext i8 %466 to i32
  %arrayidx61.i4881 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom60.i4880
  %467 = load i32, i32* %arrayidx61.i4881, align 4, !tbaa !7
  %xor62.i4882 = xor i32 %xor58.i4878, %467
  %arrayidx63.i4883 = getelementptr inbounds i8, i8* %arrayidx131, i32 12
  %468 = load i8, i8* %arrayidx63.i4883, align 1, !tbaa !6
  %idxprom64.i4884 = zext i8 %468 to i32
  %arrayidx65.i4885 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom64.i4884
  %469 = load i32, i32* %arrayidx65.i4885, align 4, !tbaa !7
  %xor66.i4886 = xor i32 %xor62.i4882, %469
  %470 = load i32, i32* %383, align 4, !tbaa !7
  %xor68.i4888 = xor i32 %xor66.i4886, %470
  store i32 %xor68.i4888, i32* %387, align 4, !tbaa !7
  %471 = load i64, i64* %76, align 16, !tbaa !2
  %xor.i4816 = xor i64 %471, %c.sroa.0.sroa.0.0.insert.insert5530
  %472 = bitcast i8* %arrayidx131 to i64*
  store i64 %xor.i4816, i64* %472, align 8, !tbaa !2
  %473 = load i64, i64* %86, align 8, !tbaa !2
  %xor5.i4819 = xor i64 %473, %c.sroa.50.12.insert.insert5451
  %474 = bitcast i8* %arrayidx41.i4861 to i64*
  store i64 %xor5.i4819, i64* %474, align 8, !tbaa !2
  %and138 = and i32 %xor14.i4835, %mask.0
  %arrayidx140 = getelementptr inbounds i8, i8* %call, i32 %and138
  %475 = bitcast i8* %arrayidx140 to i64*
  %476 = load i64, i64* %475, align 8, !tbaa !2
  %and.i4796 = and i64 %471, 4294967295
  %and2.i4797 = and i64 %476, 4294967295
  %mul.i4798 = mul nuw i64 %and2.i4797, %and.i4796
  %and3.i4799 = and i64 %mul.i4798, 4294967295
  %shr.i4800 = lshr i64 %mul.i4798, 32
  %shr4.i4801 = lshr i64 %471, 32
  %mul5.i4802 = mul nuw i64 %and2.i4797, %shr4.i4801
  %add.i4803 = add nuw i64 %shr.i4800, %mul5.i4802
  %and6.i4804 = and i64 %add.i4803, 4294967295
  %shr7.i4805 = lshr i64 %add.i4803, 32
  %shr8.i4806 = lshr i64 %476, 32
  %mul9.i4807 = mul nuw i64 %shr8.i4806, %and.i4796
  %add10.i4808 = add nuw i64 %and6.i4804, %mul9.i4807
  %shr11.i4809 = lshr i64 %add10.i4808, 32
  %mul12.i4810 = mul nuw i64 %shr8.i4806, %shr4.i4801
  %shl.i4813 = shl i64 %add10.i4808, 32
  %add15.i4814 = or i64 %shl.i4813, %and3.i4799
  %add.i4791 = add i64 %add15.i4814, %xor8.i4896
  %add13.i4811 = add i64 %mul12.i4810, %xor.i4894
  %add14.i4812 = add i64 %add13.i4811, %shr7.i4805
  %add4.i4792 = add i64 %add14.i4812, %shr11.i4809
  %xor.i4793 = xor i64 %add4.i4792, %476
  %arrayidx7.i4794 = getelementptr inbounds i8, i8* %arrayidx140, i32 8
  %477 = bitcast i8* %arrayidx7.i4794 to i64*
  %478 = load i64, i64* %477, align 8, !tbaa !2
  %xor8.i4795 = xor i64 %add.i4791, %478
  store i64 %xor8.i4795, i64* %83, align 8, !tbaa !2
  store i64 %add4.i4792, i64* %475, align 8, !tbaa !2
  store i64 %add.i4791, i64* %477, align 8, !tbaa !2
  %inc146 = add nuw nsw i32 %i.25700, 1
  %exitcond5765 = icmp eq i32 %inc146, %iter.0
  %479 = trunc i64 %xor.i4793 to i32
  %480 = lshr i64 %xor.i4793, 32
  %481 = trunc i64 %480 to i32
  %482 = trunc i64 %xor8.i4795 to i32
  br i1 %exitcond5765, label %if.end1380.loopexit, label %for.body109

if.else:                                          ; preds = %for.cond76.preheader
  br i1 %cmp, label %for.cond151.preheader, label %if.else246

for.cond151.preheader:                            ; preds = %if.else
  %arrayidx67.i4786 = getelementptr inbounds [16 x i8], [16 x i8]* %a, i32 0, i32 12
  %483 = bitcast i8* %arrayidx67.i4786 to i32*
  %484 = bitcast [16 x i8]* %b to i32*
  %arrayidx33.i4650 = getelementptr inbounds [16 x i8], [16 x i8]* %b, i32 0, i32 4
  %485 = bitcast i8* %arrayidx33.i4650 to i32*
  %486 = bitcast i8* %arrayidx99.1 to i32*
  %arrayidx69.i4686 = getelementptr inbounds [16 x i8], [16 x i8]* %b, i32 0, i32 12
  %487 = bitcast i8* %arrayidx69.i4686 to i32*
  %.promoted5812 = load i64, i64* %75, align 16, !tbaa !2
  br label %for.body154

for.body154:                                      ; preds = %for.body154, %for.cond151.preheader
  %488 = phi i64 [ %.promoted5812, %for.cond151.preheader ], [ %xor.i4590, %for.body154 ]
  %489 = phi i32 [ %90, %for.cond151.preheader ], [ %594, %for.body154 ]
  %490 = phi i32 [ %89, %for.cond151.preheader ], [ %593, %for.body154 ]
  %491 = phi i32 [ %87, %for.cond151.preheader ], [ %591, %for.body154 ]
  %i.35701 = phi i32 [ 0, %for.cond151.preheader ], [ %inc244, %for.body154 ]
  %and157 = and i32 %491, %mask.0
  %arrayidx159 = getelementptr inbounds i8, i8* %call, i32 %and157
  %492 = load i8, i8* %arrayidx159, align 1, !tbaa !6
  %idxprom.i4720 = zext i8 %492 to i32
  %arrayidx1.i4721 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i4720
  %493 = load i32, i32* %arrayidx1.i4721, align 4, !tbaa !7
  %arrayidx2.i4722 = getelementptr inbounds i8, i8* %arrayidx159, i32 5
  %494 = load i8, i8* %arrayidx2.i4722, align 1, !tbaa !6
  %idxprom3.i4723 = zext i8 %494 to i32
  %arrayidx4.i4724 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom3.i4723
  %495 = load i32, i32* %arrayidx4.i4724, align 4, !tbaa !7
  %arrayidx5.i4726 = getelementptr inbounds i8, i8* %arrayidx159, i32 10
  %496 = load i8, i8* %arrayidx5.i4726, align 1, !tbaa !6
  %idxprom6.i4727 = zext i8 %496 to i32
  %arrayidx7.i4728 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom6.i4727
  %497 = load i32, i32* %arrayidx7.i4728, align 4, !tbaa !7
  %arrayidx9.i4730 = getelementptr inbounds i8, i8* %arrayidx159, i32 15
  %498 = load i8, i8* %arrayidx9.i4730, align 1, !tbaa !6
  %idxprom10.i4731 = zext i8 %498 to i32
  %arrayidx11.i4732 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom10.i4731
  %499 = load i32, i32* %arrayidx11.i4732, align 4, !tbaa !7
  %xor.i4725 = xor i32 %493, %491
  %xor8.i4729 = xor i32 %xor.i4725, %495
  %xor12.i4733 = xor i32 %xor8.i4729, %497
  %xor14.i4734 = xor i32 %xor12.i4733, %499
  %arrayidx16.i4735 = getelementptr inbounds i8, i8* %arrayidx159, i32 3
  %500 = load i8, i8* %arrayidx16.i4735, align 1, !tbaa !6
  %idxprom17.i4736 = zext i8 %500 to i32
  %arrayidx18.i4737 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom17.i4736
  %501 = load i32, i32* %arrayidx18.i4737, align 4, !tbaa !7
  %arrayidx19.i4738 = getelementptr inbounds i8, i8* %arrayidx159, i32 4
  %502 = load i8, i8* %arrayidx19.i4738, align 1, !tbaa !6
  %idxprom20.i4739 = zext i8 %502 to i32
  %arrayidx21.i4740 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom20.i4739
  %503 = load i32, i32* %arrayidx21.i4740, align 4, !tbaa !7
  %xor22.i4741 = xor i32 %503, %501
  %arrayidx23.i4742 = getelementptr inbounds i8, i8* %arrayidx159, i32 9
  %504 = load i8, i8* %arrayidx23.i4742, align 1, !tbaa !6
  %idxprom24.i4743 = zext i8 %504 to i32
  %arrayidx25.i4744 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom24.i4743
  %505 = load i32, i32* %arrayidx25.i4744, align 4, !tbaa !7
  %xor26.i4745 = xor i32 %xor22.i4741, %505
  %arrayidx27.i4746 = getelementptr inbounds i8, i8* %arrayidx159, i32 14
  %506 = load i8, i8* %arrayidx27.i4746, align 1, !tbaa !6
  %idxprom28.i4747 = zext i8 %506 to i32
  %arrayidx29.i4748 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom28.i4747
  %507 = load i32, i32* %arrayidx29.i4748, align 4, !tbaa !7
  %xor30.i4749 = xor i32 %xor26.i4745, %507
  %xor32.i4751 = xor i32 %xor30.i4749, %490
  %arrayidx34.i4753 = getelementptr inbounds i8, i8* %arrayidx159, i32 2
  %508 = load i8, i8* %arrayidx34.i4753, align 1, !tbaa !6
  %idxprom35.i4754 = zext i8 %508 to i32
  %arrayidx36.i4755 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom35.i4754
  %509 = load i32, i32* %arrayidx36.i4755, align 4, !tbaa !7
  %arrayidx37.i4756 = getelementptr inbounds i8, i8* %arrayidx159, i32 7
  %510 = load i8, i8* %arrayidx37.i4756, align 1, !tbaa !6
  %idxprom38.i4757 = zext i8 %510 to i32
  %arrayidx39.i4758 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom38.i4757
  %511 = load i32, i32* %arrayidx39.i4758, align 4, !tbaa !7
  %xor40.i4759 = xor i32 %511, %509
  %arrayidx41.i4760 = getelementptr inbounds i8, i8* %arrayidx159, i32 8
  %512 = load i8, i8* %arrayidx41.i4760, align 1, !tbaa !6
  %idxprom42.i4761 = zext i8 %512 to i32
  %arrayidx43.i4762 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom42.i4761
  %513 = load i32, i32* %arrayidx43.i4762, align 4, !tbaa !7
  %xor44.i4763 = xor i32 %xor40.i4759, %513
  %arrayidx45.i4764 = getelementptr inbounds i8, i8* %arrayidx159, i32 13
  %514 = load i8, i8* %arrayidx45.i4764, align 1, !tbaa !6
  %idxprom46.i4765 = zext i8 %514 to i32
  %arrayidx47.i4766 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom46.i4765
  %515 = load i32, i32* %arrayidx47.i4766, align 4, !tbaa !7
  %xor48.i4767 = xor i32 %xor44.i4763, %515
  %xor50.i4769 = xor i32 %xor48.i4767, %489
  %c.sroa.50.8.insert.ext5440 = zext i32 %xor50.i4769 to i64
  %arrayidx52.i4771 = getelementptr inbounds i8, i8* %arrayidx159, i32 1
  %516 = load i8, i8* %arrayidx52.i4771, align 1, !tbaa !6
  %idxprom53.i4772 = zext i8 %516 to i32
  %arrayidx54.i4773 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom53.i4772
  %517 = load i32, i32* %arrayidx54.i4773, align 4, !tbaa !7
  %arrayidx55.i4774 = getelementptr inbounds i8, i8* %arrayidx159, i32 6
  %518 = load i8, i8* %arrayidx55.i4774, align 1, !tbaa !6
  %idxprom56.i4775 = zext i8 %518 to i32
  %arrayidx57.i4776 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom56.i4775
  %519 = load i32, i32* %arrayidx57.i4776, align 4, !tbaa !7
  %xor58.i4777 = xor i32 %519, %517
  %arrayidx59.i4778 = getelementptr inbounds i8, i8* %arrayidx159, i32 11
  %520 = load i8, i8* %arrayidx59.i4778, align 1, !tbaa !6
  %idxprom60.i4779 = zext i8 %520 to i32
  %arrayidx61.i4780 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom60.i4779
  %521 = load i32, i32* %arrayidx61.i4780, align 4, !tbaa !7
  %xor62.i4781 = xor i32 %xor58.i4777, %521
  %arrayidx63.i4782 = getelementptr inbounds i8, i8* %arrayidx159, i32 12
  %522 = load i8, i8* %arrayidx63.i4782, align 1, !tbaa !6
  %idxprom64.i4783 = zext i8 %522 to i32
  %arrayidx65.i4784 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom64.i4783
  %523 = load i32, i32* %arrayidx65.i4784, align 4, !tbaa !7
  %xor66.i4785 = xor i32 %xor62.i4781, %523
  %524 = load i32, i32* %483, align 4, !tbaa !7
  %xor68.i4787 = xor i32 %xor66.i4785, %524
  %c.sroa.50.12.insert.ext5463 = zext i32 %xor68.i4787 to i64
  %c.sroa.50.12.insert.shift5464 = shl nuw i64 %c.sroa.50.12.insert.ext5463, 32
  %c.sroa.50.12.insert.insert5466 = or i64 %c.sroa.50.12.insert.shift5464, %c.sroa.50.8.insert.ext5440
  %c.sroa.0.sroa.45.0.insert.ext5655 = zext i32 %xor32.i4751 to i64
  %c.sroa.0.sroa.45.0.insert.shift5656 = shl nuw i64 %c.sroa.0.sroa.45.0.insert.ext5655, 32
  %c.sroa.0.sroa.0.0.insert.ext5543 = zext i32 %xor14.i4734 to i64
  %c.sroa.0.sroa.0.0.insert.insert5545 = or i64 %c.sroa.0.sroa.45.0.insert.shift5656, %c.sroa.0.sroa.0.0.insert.ext5543
  %525 = load i64, i64* %76, align 16, !tbaa !2
  %xor.i4715 = xor i64 %525, %c.sroa.0.sroa.0.0.insert.insert5545
  %526 = bitcast i8* %arrayidx159 to i64*
  store i64 %xor.i4715, i64* %526, align 8, !tbaa !2
  %527 = load i64, i64* %86, align 8, !tbaa !2
  %xor5.i4718 = xor i64 %c.sroa.50.12.insert.insert5466, %527
  %528 = bitcast i8* %arrayidx41.i4760 to i64*
  store i64 %xor5.i4718, i64* %528, align 8, !tbaa !2
  %529 = lshr i64 %xor5.i4718, 24
  %530 = trunc i64 %529 to i8
  %531 = lshr i64 %xor5.i4718, 27
  %532 = trunc i64 %531 to i8
  %and168 = and i8 %532, 6
  %and170 = and i8 %530, 1
  %or = or i8 %and168, %and170
  %shl171 = shl nuw nsw i8 %or, 1
  %conv174 = zext i8 %shl171 to i32
  %shr175 = lshr i32 480016, %conv174
  %533 = trunc i32 %shr175 to i8
  %534 = and i8 %533, 48
  %conv178 = xor i8 %534, %530
  store i8 %conv178, i8* %arrayidx59.i4778, align 1, !tbaa !6
  %and185 = and i32 %xor14.i4734, %mask.0
  %arrayidx187 = getelementptr inbounds i8, i8* %call, i32 %and185
  %535 = bitcast i8* %arrayidx187 to i64*
  %536 = load i64, i64* %535, align 8, !tbaa !2
  %and2.i4696 = and i64 %536, 4294967295
  %mul.i4697 = mul nuw i64 %and2.i4696, %c.sroa.0.sroa.0.0.insert.ext5543
  %and3.i4698 = and i64 %mul.i4697, 4294967295
  %shr.i4699 = lshr i64 %mul.i4697, 32
  %mul5.i4701 = mul nuw i64 %and2.i4696, %c.sroa.0.sroa.45.0.insert.ext5655
  %add.i4702 = add nuw i64 %shr.i4699, %mul5.i4701
  %and6.i4703 = and i64 %add.i4702, 4294967295
  %shr7.i4704 = lshr i64 %add.i4702, 32
  %shr8.i4705 = lshr i64 %536, 32
  %mul9.i4706 = mul nuw i64 %shr8.i4705, %c.sroa.0.sroa.0.0.insert.ext5543
  %add10.i4707 = add nuw i64 %and6.i4703, %mul9.i4706
  %shr11.i4708 = lshr i64 %add10.i4707, 32
  %mul12.i4709 = mul nuw i64 %shr8.i4705, %c.sroa.0.sroa.45.0.insert.ext5655
  %shl.i4712 = shl i64 %add10.i4707, 32
  %add15.i4713 = or i64 %shl.i4712, %and3.i4698
  %537 = load i64, i64* %83, align 8, !tbaa !2
  %add.i4690 = add i64 %add15.i4713, %537
  %add13.i4710 = add i64 %488, %mul12.i4709
  %add14.i4711 = add i64 %add13.i4710, %shr7.i4704
  %add4.i4691 = add i64 %add14.i4711, %shr11.i4708
  %xor.i4692 = xor i64 %add4.i4691, %536
  %arrayidx7.i4693 = getelementptr inbounds i8, i8* %arrayidx187, i32 8
  %538 = bitcast i8* %arrayidx7.i4693 to i64*
  %539 = load i64, i64* %538, align 8, !tbaa !2
  %xor8.i4694 = xor i64 %add.i4690, %539
  store i64 %xor8.i4694, i64* %83, align 8, !tbaa !2
  store i64 %add4.i4691, i64* %535, align 8, !tbaa !2
  %xor.i4687 = xor i64 %add.i4690, %cond56695677
  store i64 %xor.i4687, i64* %538, align 8, !tbaa !2
  %540 = trunc i64 %xor.i4692 to i32
  %and199 = and i32 %mask.0, %540
  %arrayidx201 = getelementptr inbounds i8, i8* %call, i32 %and199
  %541 = load i8, i8* %arrayidx201, align 1, !tbaa !6
  %idxprom.i4618 = zext i8 %541 to i32
  %arrayidx1.i4619 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i4618
  %542 = load i32, i32* %arrayidx1.i4619, align 4, !tbaa !7
  %arrayidx2.i4620 = getelementptr inbounds i8, i8* %arrayidx201, i32 5
  %543 = load i8, i8* %arrayidx2.i4620, align 1, !tbaa !6
  %idxprom3.i4621 = zext i8 %543 to i32
  %arrayidx4.i4622 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom3.i4621
  %544 = load i32, i32* %arrayidx4.i4622, align 4, !tbaa !7
  %arrayidx5.i4624 = getelementptr inbounds i8, i8* %arrayidx201, i32 10
  %545 = load i8, i8* %arrayidx5.i4624, align 1, !tbaa !6
  %idxprom6.i4625 = zext i8 %545 to i32
  %arrayidx7.i4626 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom6.i4625
  %546 = load i32, i32* %arrayidx7.i4626, align 4, !tbaa !7
  %arrayidx9.i4628 = getelementptr inbounds i8, i8* %arrayidx201, i32 15
  %547 = load i8, i8* %arrayidx9.i4628, align 1, !tbaa !6
  %idxprom10.i4629 = zext i8 %547 to i32
  %arrayidx11.i4630 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom10.i4629
  %548 = load i32, i32* %arrayidx11.i4630, align 4, !tbaa !7
  %xor.i4623 = xor i32 %542, %540
  %xor8.i4627 = xor i32 %xor.i4623, %544
  %xor12.i4631 = xor i32 %xor8.i4627, %546
  %xor14.i4632 = xor i32 %xor12.i4631, %548
  store i32 %xor14.i4632, i32* %484, align 16, !tbaa !7
  %arrayidx16.i4633 = getelementptr inbounds i8, i8* %arrayidx201, i32 3
  %549 = load i8, i8* %arrayidx16.i4633, align 1, !tbaa !6
  %idxprom17.i4634 = zext i8 %549 to i32
  %arrayidx18.i4635 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom17.i4634
  %550 = load i32, i32* %arrayidx18.i4635, align 4, !tbaa !7
  %arrayidx19.i4636 = getelementptr inbounds i8, i8* %arrayidx201, i32 4
  %551 = load i8, i8* %arrayidx19.i4636, align 1, !tbaa !6
  %idxprom20.i4637 = zext i8 %551 to i32
  %arrayidx21.i4638 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom20.i4637
  %552 = load i32, i32* %arrayidx21.i4638, align 4, !tbaa !7
  %xor22.i4639 = xor i32 %552, %550
  %arrayidx23.i4640 = getelementptr inbounds i8, i8* %arrayidx201, i32 9
  %553 = load i8, i8* %arrayidx23.i4640, align 1, !tbaa !6
  %idxprom24.i4641 = zext i8 %553 to i32
  %arrayidx25.i4642 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom24.i4641
  %554 = load i32, i32* %arrayidx25.i4642, align 4, !tbaa !7
  %xor26.i4643 = xor i32 %xor22.i4639, %554
  %arrayidx27.i4644 = getelementptr inbounds i8, i8* %arrayidx201, i32 14
  %555 = load i8, i8* %arrayidx27.i4644, align 1, !tbaa !6
  %idxprom28.i4645 = zext i8 %555 to i32
  %arrayidx29.i4646 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom28.i4645
  %556 = load i32, i32* %arrayidx29.i4646, align 4, !tbaa !7
  %xor30.i4647 = xor i32 %xor26.i4643, %556
  %557 = lshr i64 %xor.i4692, 32
  %558 = trunc i64 %557 to i32
  %xor32.i4649 = xor i32 %xor30.i4647, %558
  store i32 %xor32.i4649, i32* %485, align 4, !tbaa !7
  %arrayidx34.i4651 = getelementptr inbounds i8, i8* %arrayidx201, i32 2
  %559 = load i8, i8* %arrayidx34.i4651, align 1, !tbaa !6
  %idxprom35.i4652 = zext i8 %559 to i32
  %arrayidx36.i4653 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom35.i4652
  %560 = load i32, i32* %arrayidx36.i4653, align 4, !tbaa !7
  %arrayidx37.i4654 = getelementptr inbounds i8, i8* %arrayidx201, i32 7
  %561 = load i8, i8* %arrayidx37.i4654, align 1, !tbaa !6
  %idxprom38.i4655 = zext i8 %561 to i32
  %arrayidx39.i4656 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom38.i4655
  %562 = load i32, i32* %arrayidx39.i4656, align 4, !tbaa !7
  %xor40.i4657 = xor i32 %562, %560
  %arrayidx41.i4658 = getelementptr inbounds i8, i8* %arrayidx201, i32 8
  %563 = load i8, i8* %arrayidx41.i4658, align 1, !tbaa !6
  %idxprom42.i4659 = zext i8 %563 to i32
  %arrayidx43.i4660 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom42.i4659
  %564 = load i32, i32* %arrayidx43.i4660, align 4, !tbaa !7
  %xor44.i4661 = xor i32 %xor40.i4657, %564
  %arrayidx45.i4662 = getelementptr inbounds i8, i8* %arrayidx201, i32 13
  %565 = load i8, i8* %arrayidx45.i4662, align 1, !tbaa !6
  %idxprom46.i4663 = zext i8 %565 to i32
  %arrayidx47.i4664 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom46.i4663
  %566 = load i32, i32* %arrayidx47.i4664, align 4, !tbaa !7
  %xor48.i4665 = xor i32 %xor44.i4661, %566
  %567 = trunc i64 %xor8.i4694 to i32
  %xor50.i4667 = xor i32 %xor48.i4665, %567
  store i32 %xor50.i4667, i32* %486, align 8, !tbaa !7
  %arrayidx52.i4669 = getelementptr inbounds i8, i8* %arrayidx201, i32 1
  %568 = load i8, i8* %arrayidx52.i4669, align 1, !tbaa !6
  %idxprom53.i4670 = zext i8 %568 to i32
  %arrayidx54.i4671 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom53.i4670
  %569 = load i32, i32* %arrayidx54.i4671, align 4, !tbaa !7
  %arrayidx55.i4672 = getelementptr inbounds i8, i8* %arrayidx201, i32 6
  %570 = load i8, i8* %arrayidx55.i4672, align 1, !tbaa !6
  %idxprom56.i4673 = zext i8 %570 to i32
  %arrayidx57.i4674 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom56.i4673
  %571 = load i32, i32* %arrayidx57.i4674, align 4, !tbaa !7
  %xor58.i4675 = xor i32 %571, %569
  %arrayidx59.i4676 = getelementptr inbounds i8, i8* %arrayidx201, i32 11
  %572 = load i8, i8* %arrayidx59.i4676, align 1, !tbaa !6
  %idxprom60.i4677 = zext i8 %572 to i32
  %arrayidx61.i4678 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom60.i4677
  %573 = load i32, i32* %arrayidx61.i4678, align 4, !tbaa !7
  %xor62.i4679 = xor i32 %xor58.i4675, %573
  %arrayidx63.i4680 = getelementptr inbounds i8, i8* %arrayidx201, i32 12
  %574 = load i8, i8* %arrayidx63.i4680, align 1, !tbaa !6
  %idxprom64.i4681 = zext i8 %574 to i32
  %arrayidx65.i4682 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom64.i4681
  %575 = load i32, i32* %arrayidx65.i4682, align 4, !tbaa !7
  %xor66.i4683 = xor i32 %xor62.i4679, %575
  %576 = load i32, i32* %483, align 4, !tbaa !7
  %xor68.i4685 = xor i32 %xor66.i4683, %576
  store i32 %xor68.i4685, i32* %487, align 4, !tbaa !7
  %577 = load i64, i64* %76, align 16, !tbaa !2
  %xor.i4613 = xor i64 %577, %c.sroa.0.sroa.0.0.insert.insert5545
  %578 = bitcast i8* %arrayidx201 to i64*
  store i64 %xor.i4613, i64* %578, align 8, !tbaa !2
  %579 = load i64, i64* %86, align 8, !tbaa !2
  %xor5.i4616 = xor i64 %579, %c.sroa.50.12.insert.insert5466
  %580 = bitcast i8* %arrayidx41.i4658 to i64*
  store i64 %xor5.i4616, i64* %580, align 8, !tbaa !2
  %581 = lshr i64 %xor5.i4616, 24
  %582 = trunc i64 %581 to i8
  %583 = lshr i64 %xor5.i4616, 27
  %584 = trunc i64 %583 to i8
  %and213 = and i8 %584, 6
  %and215 = and i8 %582, 1
  %or216 = or i8 %and213, %and215
  %shl217 = shl nuw nsw i8 %or216, 1
  %conv220 = zext i8 %shl217 to i32
  %shr221 = lshr i32 480016, %conv220
  %585 = trunc i32 %shr221 to i8
  %586 = and i8 %585, 48
  %conv224 = xor i8 %586, %582
  store i8 %conv224, i8* %arrayidx59.i4676, align 1, !tbaa !6
  %and231 = and i32 %xor14.i4632, %mask.0
  %arrayidx233 = getelementptr inbounds i8, i8* %call, i32 %and231
  %587 = bitcast i8* %arrayidx233 to i64*
  %588 = load i64, i64* %587, align 8, !tbaa !2
  %and.i4593 = and i64 %577, 4294967295
  %and2.i4594 = and i64 %588, 4294967295
  %mul.i4595 = mul nuw i64 %and2.i4594, %and.i4593
  %and3.i4596 = and i64 %mul.i4595, 4294967295
  %shr.i4597 = lshr i64 %mul.i4595, 32
  %shr4.i4598 = lshr i64 %577, 32
  %mul5.i4599 = mul nuw i64 %and2.i4594, %shr4.i4598
  %add.i4600 = add nuw i64 %shr.i4597, %mul5.i4599
  %and6.i4601 = and i64 %add.i4600, 4294967295
  %shr7.i4602 = lshr i64 %add.i4600, 32
  %shr8.i4603 = lshr i64 %588, 32
  %mul9.i4604 = mul nuw i64 %shr8.i4603, %and.i4593
  %add10.i4605 = add nuw i64 %and6.i4601, %mul9.i4604
  %shr11.i4606 = lshr i64 %add10.i4605, 32
  %mul12.i4607 = mul nuw i64 %shr8.i4603, %shr4.i4598
  %shl.i4610 = shl i64 %add10.i4605, 32
  %add15.i4611 = or i64 %shl.i4610, %and3.i4596
  %add.i4588 = add i64 %add15.i4611, %xor8.i4694
  %add13.i4608 = add i64 %mul12.i4607, %xor.i4692
  %add14.i4609 = add i64 %add13.i4608, %shr7.i4602
  %add4.i4589 = add i64 %add14.i4609, %shr11.i4606
  %xor.i4590 = xor i64 %add4.i4589, %588
  %arrayidx7.i4591 = getelementptr inbounds i8, i8* %arrayidx233, i32 8
  %589 = bitcast i8* %arrayidx7.i4591 to i64*
  %590 = load i64, i64* %589, align 8, !tbaa !2
  %xor8.i4592 = xor i64 %add.i4588, %590
  store i64 %xor8.i4592, i64* %83, align 8, !tbaa !2
  store i64 %add4.i4589, i64* %587, align 8, !tbaa !2
  %xor.i4585 = xor i64 %add.i4588, %cond56695677
  store i64 %xor.i4585, i64* %589, align 8, !tbaa !2
  %inc244 = add nuw nsw i32 %i.35701, 1
  %exitcond5766 = icmp eq i32 %inc244, %iter.0
  %591 = trunc i64 %xor.i4590 to i32
  %592 = lshr i64 %xor.i4590, 32
  %593 = trunc i64 %592 to i32
  %594 = trunc i64 %xor8.i4592 to i32
  br i1 %exitcond5766, label %if.end1380.loopexit5793, label %for.body154

if.else246:                                       ; preds = %if.else
  %595 = and i32 %variant, -2
  %596 = icmp eq i32 %595, 2
  br i1 %596, label %if.then251, label %for.cond977.preheader

for.cond977.preheader:                            ; preds = %if.else246
  %arrayidx67.i4138 = getelementptr inbounds [16 x i8], [16 x i8]* %a, i32 0, i32 12
  %597 = bitcast i8* %arrayidx67.i4138 to i32*
  %598 = bitcast [16 x i8]* %b to i32*
  %arrayidx33.i = getelementptr inbounds [16 x i8], [16 x i8]* %b, i32 0, i32 4
  %599 = bitcast i8* %arrayidx33.i to i32*
  %600 = bitcast i8* %arrayidx99.1 to i32*
  %arrayidx69.i = getelementptr inbounds [16 x i8], [16 x i8]* %b, i32 0, i32 12
  %601 = bitcast i8* %arrayidx69.i to i32*
  %arrayidx1108 = getelementptr inbounds i8, i8* %call, i32 8
  br label %for.body980

if.then251:                                       ; preds = %if.else246
  %tobool = icmp eq i32 %rvs.0, 0
  %602 = bitcast i8* %arrayidx88.1 to i32*
  %arrayidx67.i4360 = getelementptr inbounds [16 x i8], [16 x i8]* %a, i32 0, i32 12
  %603 = bitcast i8* %arrayidx67.i4360 to i32*
  %604 = bitcast [16 x i8]* %b to i32*
  %arrayidx33.i4215 = getelementptr inbounds [16 x i8], [16 x i8]* %b, i32 0, i32 4
  %605 = bitcast i8* %arrayidx33.i4215 to i32*
  %606 = bitcast i8* %arrayidx99.1 to i32*
  %arrayidx69.i4251 = getelementptr inbounds [16 x i8], [16 x i8]* %b, i32 0, i32 12
  %607 = bitcast i8* %arrayidx69.i4251 to i32*
  %.promoted5813 = load i64, i64* %75, align 16, !tbaa !2
  br i1 %tobool, label %for.body611, label %for.body256

for.body256:                                      ; preds = %if.then251, %for.body256.for.body256_crit_edge
  %xor.i43695815 = phi i64 [ %xor.i4369, %for.body256.for.body256_crit_edge ], [ %.promoted5813, %if.then251 ]
  %608 = phi i32 [ %759, %for.body256.for.body256_crit_edge ], [ %89, %if.then251 ]
  %609 = phi i64 [ %.pre5779, %for.body256.for.body256_crit_edge ], [ %xor97.1, %if.then251 ]
  %610 = phi i64 [ %.pre5778, %for.body256.for.body256_crit_edge ], [ %xor97, %if.then251 ]
  %611 = phi i64 [ %xor8.i4371, %for.body256.for.body256_crit_edge ], [ %xor86.1, %if.then251 ]
  %612 = phi i64 [ %xor.i4369, %for.body256.for.body256_crit_edge ], [ %xor86, %if.then251 ]
  %613 = phi i32 [ %760, %for.body256.for.body256_crit_edge ], [ %87, %if.then251 ]
  %i.45713 = phi i32 [ %inc605, %for.body256.for.body256_crit_edge ], [ 0, %if.then251 ]
  %division_result.15712 = phi i64 [ %add504, %for.body256.for.body256_crit_edge ], [ %division_result.05682, %if.then251 ]
  %sqrt_result.15711 = phi i64 [ %add538, %for.body256.for.body256_crit_edge ], [ %sqrt_result.05681, %if.then251 ]
  %d.sroa.23.15710 = phi i64 [ %c.sroa.50.12.insert.insert5456, %for.body256.for.body256_crit_edge ], [ %d.sroa.23.05680, %if.then251 ]
  %d.sroa.0.sroa.0.15709 = phi i32 [ %xor14.i4530, %for.body256.for.body256_crit_edge ], [ %d.sroa.0.sroa.0.05679, %if.then251 ]
  %d.sroa.0.sroa.23.15708 = phi i32 [ %xor32.i4547, %for.body256.for.body256_crit_edge ], [ %d.sroa.0.sroa.23.05678, %if.then251 ]
  %and259 = and i32 %613, %mask.0
  %xor261 = xor i32 %and259, 16
  %add.ptr262 = getelementptr inbounds i8, i8* %call, i32 %xor261
  %614 = bitcast i8* %add.ptr262 to i64*
  %xor263 = xor i32 %and259, 32
  %add.ptr264 = getelementptr inbounds i8, i8* %call, i32 %xor263
  %615 = bitcast i8* %add.ptr264 to i64*
  %xor265 = xor i32 %and259, 48
  %add.ptr266 = getelementptr inbounds i8, i8* %call, i32 %xor265
  %616 = bitcast i8* %add.ptr266 to i64*
  %617 = load i64, i64* %616, align 8, !tbaa !2
  %arrayidx268 = getelementptr inbounds i8, i8* %add.ptr266, i32 8
  %618 = bitcast i8* %arrayidx268 to i64*
  %619 = load i64, i64* %618, align 8, !tbaa !2
  %620 = load i64, i64* %614, align 8, !tbaa !2
  %d.sroa.0.sroa.23.0.insert.ext5340 = zext i32 %d.sroa.0.sroa.23.15708 to i64
  %d.sroa.0.sroa.23.0.insert.shift5341 = shl nuw i64 %d.sroa.0.sroa.23.0.insert.ext5340, 32
  %d.sroa.0.sroa.0.0.insert.ext5289 = zext i32 %d.sroa.0.sroa.0.15709 to i64
  %d.sroa.0.sroa.0.0.insert.insert5291 = or i64 %d.sroa.0.sroa.23.0.insert.shift5341, %d.sroa.0.sroa.0.0.insert.ext5289
  %add272 = add i64 %620, %d.sroa.0.sroa.0.0.insert.insert5291
  store i64 %add272, i64* %614, align 8, !tbaa !2
  %arrayidx274 = getelementptr inbounds i8, i8* %add.ptr262, i32 8
  %621 = bitcast i8* %arrayidx274 to i64*
  %622 = load i64, i64* %621, align 8, !tbaa !2
  %add277 = add i64 %622, %d.sroa.23.15710
  store i64 %add277, i64* %621, align 8, !tbaa !2
  %623 = load i64, i64* %615, align 8, !tbaa !2
  %add282 = add i64 %612, %623
  store i64 %add282, i64* %616, align 8, !tbaa !2
  %arrayidx284 = getelementptr inbounds i8, i8* %add.ptr264, i32 8
  %624 = bitcast i8* %arrayidx284 to i64*
  %625 = load i64, i64* %624, align 8, !tbaa !2
  %add287 = add i64 %611, %625
  store i64 %add287, i64* %618, align 8, !tbaa !2
  %add291 = add i64 %610, %617
  store i64 %add291, i64* %615, align 8, !tbaa !2
  %add295 = add i64 %609, %619
  store i64 %add295, i64* %624, align 8, !tbaa !2
  %arrayidx300 = getelementptr inbounds i8, i8* %call, i32 %and259
  %626 = load i8, i8* %arrayidx300, align 1, !tbaa !6
  %idxprom.i4516 = zext i8 %626 to i32
  %arrayidx1.i4517 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i4516
  %627 = load i32, i32* %arrayidx1.i4517, align 4, !tbaa !7
  %arrayidx2.i4518 = getelementptr inbounds i8, i8* %arrayidx300, i32 5
  %628 = load i8, i8* %arrayidx2.i4518, align 1, !tbaa !6
  %idxprom3.i4519 = zext i8 %628 to i32
  %arrayidx4.i4520 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom3.i4519
  %629 = load i32, i32* %arrayidx4.i4520, align 4, !tbaa !7
  %arrayidx5.i4522 = getelementptr inbounds i8, i8* %arrayidx300, i32 10
  %630 = load i8, i8* %arrayidx5.i4522, align 1, !tbaa !6
  %idxprom6.i4523 = zext i8 %630 to i32
  %arrayidx7.i4524 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom6.i4523
  %631 = load i32, i32* %arrayidx7.i4524, align 4, !tbaa !7
  %arrayidx9.i4526 = getelementptr inbounds i8, i8* %arrayidx300, i32 15
  %632 = load i8, i8* %arrayidx9.i4526, align 1, !tbaa !6
  %idxprom10.i4527 = zext i8 %632 to i32
  %arrayidx11.i4528 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom10.i4527
  %633 = load i32, i32* %arrayidx11.i4528, align 4, !tbaa !7
  %xor.i4521 = xor i32 %627, %613
  %xor8.i4525 = xor i32 %xor.i4521, %629
  %xor12.i4529 = xor i32 %xor8.i4525, %631
  %xor14.i4530 = xor i32 %xor12.i4529, %633
  %arrayidx16.i4531 = getelementptr inbounds i8, i8* %arrayidx300, i32 3
  %634 = load i8, i8* %arrayidx16.i4531, align 1, !tbaa !6
  %idxprom17.i4532 = zext i8 %634 to i32
  %arrayidx18.i4533 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom17.i4532
  %635 = load i32, i32* %arrayidx18.i4533, align 4, !tbaa !7
  %arrayidx19.i4534 = getelementptr inbounds i8, i8* %arrayidx300, i32 4
  %636 = load i8, i8* %arrayidx19.i4534, align 1, !tbaa !6
  %idxprom20.i4535 = zext i8 %636 to i32
  %arrayidx21.i4536 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom20.i4535
  %637 = load i32, i32* %arrayidx21.i4536, align 4, !tbaa !7
  %xor22.i4537 = xor i32 %637, %635
  %arrayidx23.i4538 = getelementptr inbounds i8, i8* %arrayidx300, i32 9
  %638 = load i8, i8* %arrayidx23.i4538, align 1, !tbaa !6
  %idxprom24.i4539 = zext i8 %638 to i32
  %arrayidx25.i4540 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom24.i4539
  %639 = load i32, i32* %arrayidx25.i4540, align 4, !tbaa !7
  %xor26.i4541 = xor i32 %xor22.i4537, %639
  %arrayidx27.i4542 = getelementptr inbounds i8, i8* %arrayidx300, i32 14
  %640 = load i8, i8* %arrayidx27.i4542, align 1, !tbaa !6
  %idxprom28.i4543 = zext i8 %640 to i32
  %arrayidx29.i4544 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom28.i4543
  %641 = load i32, i32* %arrayidx29.i4544, align 4, !tbaa !7
  %xor30.i4545 = xor i32 %xor26.i4541, %641
  %xor32.i4547 = xor i32 %xor30.i4545, %608
  %arrayidx34.i4549 = getelementptr inbounds i8, i8* %arrayidx300, i32 2
  %642 = load i8, i8* %arrayidx34.i4549, align 1, !tbaa !6
  %idxprom35.i4550 = zext i8 %642 to i32
  %arrayidx36.i4551 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom35.i4550
  %643 = load i32, i32* %arrayidx36.i4551, align 4, !tbaa !7
  %arrayidx37.i4552 = getelementptr inbounds i8, i8* %arrayidx300, i32 7
  %644 = load i8, i8* %arrayidx37.i4552, align 1, !tbaa !6
  %idxprom38.i4553 = zext i8 %644 to i32
  %arrayidx39.i4554 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom38.i4553
  %645 = load i32, i32* %arrayidx39.i4554, align 4, !tbaa !7
  %xor40.i4555 = xor i32 %645, %643
  %arrayidx41.i4556 = getelementptr inbounds i8, i8* %arrayidx300, i32 8
  %646 = load i8, i8* %arrayidx41.i4556, align 1, !tbaa !6
  %idxprom42.i4557 = zext i8 %646 to i32
  %arrayidx43.i4558 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom42.i4557
  %647 = load i32, i32* %arrayidx43.i4558, align 4, !tbaa !7
  %xor44.i4559 = xor i32 %xor40.i4555, %647
  %arrayidx45.i4560 = getelementptr inbounds i8, i8* %arrayidx300, i32 13
  %648 = load i8, i8* %arrayidx45.i4560, align 1, !tbaa !6
  %idxprom46.i4561 = zext i8 %648 to i32
  %arrayidx47.i4562 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom46.i4561
  %649 = load i32, i32* %arrayidx47.i4562, align 4, !tbaa !7
  %xor48.i4563 = xor i32 %xor44.i4559, %649
  %650 = load i32, i32* %602, align 8, !tbaa !7
  %xor50.i4565 = xor i32 %xor48.i4563, %650
  %c.sroa.50.8.insert.ext5432 = zext i32 %xor50.i4565 to i64
  %arrayidx52.i4567 = getelementptr inbounds i8, i8* %arrayidx300, i32 1
  %651 = load i8, i8* %arrayidx52.i4567, align 1, !tbaa !6
  %idxprom53.i4568 = zext i8 %651 to i32
  %arrayidx54.i4569 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom53.i4568
  %652 = load i32, i32* %arrayidx54.i4569, align 4, !tbaa !7
  %arrayidx55.i4570 = getelementptr inbounds i8, i8* %arrayidx300, i32 6
  %653 = load i8, i8* %arrayidx55.i4570, align 1, !tbaa !6
  %idxprom56.i4571 = zext i8 %653 to i32
  %arrayidx57.i4572 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom56.i4571
  %654 = load i32, i32* %arrayidx57.i4572, align 4, !tbaa !7
  %xor58.i4573 = xor i32 %654, %652
  %arrayidx59.i4574 = getelementptr inbounds i8, i8* %arrayidx300, i32 11
  %655 = load i8, i8* %arrayidx59.i4574, align 1, !tbaa !6
  %idxprom60.i4575 = zext i8 %655 to i32
  %arrayidx61.i4576 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom60.i4575
  %656 = load i32, i32* %arrayidx61.i4576, align 4, !tbaa !7
  %xor62.i4577 = xor i32 %xor58.i4573, %656
  %arrayidx63.i4578 = getelementptr inbounds i8, i8* %arrayidx300, i32 12
  %657 = load i8, i8* %arrayidx63.i4578, align 1, !tbaa !6
  %idxprom64.i4579 = zext i8 %657 to i32
  %arrayidx65.i4580 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom64.i4579
  %658 = load i32, i32* %arrayidx65.i4580, align 4, !tbaa !7
  %xor66.i4581 = xor i32 %xor62.i4577, %658
  %659 = load i32, i32* %603, align 4, !tbaa !7
  %xor68.i4583 = xor i32 %xor66.i4581, %659
  %c.sroa.50.12.insert.ext5453 = zext i32 %xor68.i4583 to i64
  %c.sroa.50.12.insert.shift5454 = shl nuw i64 %c.sroa.50.12.insert.ext5453, 32
  %c.sroa.50.12.insert.insert5456 = or i64 %c.sroa.50.12.insert.shift5454, %c.sroa.50.8.insert.ext5432
  %c.sroa.0.sroa.45.0.insert.ext5564 = zext i32 %xor32.i4547 to i64
  %c.sroa.0.sroa.45.0.insert.shift5565 = shl nuw i64 %c.sroa.0.sroa.45.0.insert.ext5564, 32
  %c.sroa.0.sroa.0.0.insert.ext5476 = zext i32 %xor14.i4530 to i64
  %c.sroa.0.sroa.0.0.insert.insert5478 = or i64 %c.sroa.0.sroa.45.0.insert.shift5565, %c.sroa.0.sroa.0.0.insert.ext5476
  %660 = load i64, i64* %76, align 16, !tbaa !2
  %xor.i4511 = xor i64 %660, %c.sroa.0.sroa.0.0.insert.insert5478
  %661 = bitcast i8* %arrayidx300 to i64*
  store i64 %xor.i4511, i64* %661, align 8, !tbaa !2
  %662 = load i64, i64* %86, align 8, !tbaa !2
  %xor5.i4514 = xor i64 %c.sroa.50.12.insert.insert5456, %662
  %663 = bitcast i8* %arrayidx41.i4556 to i64*
  store i64 %xor5.i4514, i64* %663, align 8, !tbaa !2
  %and307 = and i32 %xor14.i4530, %mask.0
  %shl309 = shl i64 %sqrt_result.15711, 32
  %xor310 = xor i64 %division_result.15712, %shl309
  %arrayidx311 = getelementptr inbounds i8, i8* %call, i32 %and307
  %664 = bitcast i8* %arrayidx311 to i64*
  %665 = load i64, i64* %664, align 8, !tbaa !2
  %xor313 = xor i64 %xor310, %665
  store i64 %xor313, i64* %664, align 8, !tbaa !2
  %shl318 = shl i64 %sqrt_result.15711, 1
  %add319 = add i64 %shl318, %c.sroa.0.sroa.0.0.insert.ext5476
  %conv321 = and i64 %add319, 2147483646
  %conv322 = or i64 %conv321, 2147483649
  %div = udiv i64 %c.sroa.50.12.insert.insert5456, %conv322
  %and323 = and i64 %div, 4294967295
  %mul325 = mul i64 %div, %conv322
  %sub = sub i64 %c.sroa.50.8.insert.ext5432, %mul325
  %shl326 = shl i64 %sub, 32
  %add327 = or i64 %shl326, %and323
  %add330 = add i64 %add327, %c.sroa.0.sroa.0.0.insert.insert5478
  %conv332 = uitofp i64 %add330 to double
  %add333 = fadd double %conv332, 0x43F0000000000000
  %666 = call double @llvm.sqrt.f64(double %add333)
  %mul334 = fmul double %666, 2.000000e+00
  %sub335 = fadd double %mul334, 0xC200000000000000
  %conv336 = fptoui double %sub335 to i64
  %shr340 = lshr i64 %conv336, 1
  %and342 = and i64 %conv336, 1
  %add343 = add nuw i64 %shr340, %and342
  %mul344 = mul i64 %add343, %shr340
  %shl345 = shl i64 %conv336, 32
  %add346 = add i64 %mul344, %shl345
  %add347 = add i64 %add346, %and342
  %cmp348 = icmp ugt i64 %add347, %add330
  %cond350 = sext i1 %cmp348 to i64
  %add351 = add i64 %add346, 4294967296
  %sub352 = sub i64 %add330, %shr340
  %cmp353 = icmp ult i64 %add351, %sub352
  %cond355 = zext i1 %cmp353 to i64
  %add356 = add i64 %cond355, %conv336
  %add358 = add i64 %add356, %cond350
  %and2.i4492 = and i64 %xor313, 4294967295
  %mul.i4493 = mul nuw i64 %and2.i4492, %c.sroa.0.sroa.0.0.insert.ext5476
  %and3.i4494 = and i64 %mul.i4493, 4294967295
  %shr.i4495 = lshr i64 %mul.i4493, 32
  %mul5.i4497 = mul nuw i64 %and2.i4492, %c.sroa.0.sroa.45.0.insert.ext5564
  %add.i4498 = add nuw i64 %shr.i4495, %mul5.i4497
  %and6.i4499 = and i64 %add.i4498, 4294967295
  %shr7.i4500 = lshr i64 %add.i4498, 32
  %shr8.i4501 = lshr i64 %xor313, 32
  %mul9.i4502 = mul nuw i64 %shr8.i4501, %c.sroa.0.sroa.0.0.insert.ext5476
  %add10.i4503 = add nuw i64 %and6.i4499, %mul9.i4502
  %shr11.i4504 = lshr i64 %add10.i4503, 32
  %mul12.i4505 = mul nuw i64 %shr8.i4501, %c.sroa.0.sroa.45.0.insert.ext5564
  %add13.i4506 = add nuw i64 %shr7.i4500, %mul12.i4505
  %add14.i4507 = add nuw i64 %add13.i4506, %shr11.i4504
  %shl.i4508 = shl i64 %add10.i4503, 32
  %add15.i4509 = or i64 %shl.i4508, %and3.i4494
  %xor367 = xor i32 %and307, 16
  %add.ptr368 = getelementptr inbounds i8, i8* %call, i32 %xor367
  %667 = bitcast i8* %add.ptr368 to i64*
  %668 = load i64, i64* %667, align 8, !tbaa !2
  %xor.i4487 = xor i64 %add14.i4507, %668
  store i64 %xor.i4487, i64* %667, align 8, !tbaa !2
  %arrayidx3.i4489 = getelementptr inbounds i8, i8* %add.ptr368, i32 8
  %669 = bitcast i8* %arrayidx3.i4489 to i64*
  %670 = load i64, i64* %669, align 8, !tbaa !2
  %xor4.i4490 = xor i64 %add15.i4509, %670
  store i64 %xor4.i4490, i64* %669, align 8, !tbaa !2
  %xor371 = xor i32 %and307, 32
  %add.ptr372 = getelementptr inbounds i8, i8* %call, i32 %xor371
  %671 = bitcast i8* %add.ptr372 to i64*
  %672 = load i64, i64* %671, align 8, !tbaa !2
  %xor.i4483 = xor i64 %add14.i4507, %672
  %arrayidx2.i4484 = getelementptr inbounds i8, i8* %add.ptr372, i32 8
  %673 = bitcast i8* %arrayidx2.i4484 to i64*
  %674 = load i64, i64* %673, align 8, !tbaa !2
  %xor4.i4486 = xor i64 %add15.i4509, %674
  %xor383 = xor i32 %and307, 48
  %add.ptr384 = getelementptr inbounds i8, i8* %call, i32 %xor383
  %675 = bitcast i8* %add.ptr384 to i64*
  %676 = load i64, i64* %675, align 8, !tbaa !2
  %arrayidx388 = getelementptr inbounds i8, i8* %add.ptr384, i32 8
  %677 = bitcast i8* %arrayidx388 to i64*
  %678 = load i64, i64* %677, align 8, !tbaa !2
  %add392 = add i64 %xor.i4487, %d.sroa.0.sroa.0.0.insert.insert5291
  store i64 %add392, i64* %667, align 8, !tbaa !2
  %add397 = add i64 %xor4.i4490, %d.sroa.23.15710
  store i64 %add397, i64* %669, align 8, !tbaa !2
  %679 = load i64, i64* %671, align 8, !tbaa !2
  %add402 = add i64 %679, %612
  store i64 %add402, i64* %675, align 8, !tbaa !2
  %680 = load i64, i64* %673, align 8, !tbaa !2
  %add407 = add i64 %680, %611
  store i64 %add407, i64* %677, align 8, !tbaa !2
  %add411 = add i64 %676, %610
  store i64 %add411, i64* %671, align 8, !tbaa !2
  %add415 = add i64 %678, %609
  store i64 %add415, i64* %673, align 8, !tbaa !2
  %681 = load i64, i64* %83, align 8, !tbaa !2
  %add.i4478 = add i64 %681, %xor4.i4486
  %add4.i4479 = add i64 %xor.i43695815, %xor.i4483
  %682 = load i64, i64* %664, align 8, !tbaa !2
  %xor.i4480 = xor i64 %682, %add4.i4479
  %arrayidx7.i4481 = getelementptr inbounds i8, i8* %arrayidx311, i32 8
  %683 = bitcast i8* %arrayidx7.i4481 to i64*
  %684 = load i64, i64* %683, align 8, !tbaa !2
  %xor8.i4482 = xor i64 %684, %add.i4478
  store i64 %xor8.i4482, i64* %83, align 8, !tbaa !2
  store i64 %add4.i4479, i64* %664, align 8, !tbaa !2
  store i64 %add.i4478, i64* %683, align 8, !tbaa !2
  %685 = trunc i64 %xor.i4480 to i32
  %and426 = and i32 %mask.0, %685
  %xor429 = xor i32 %and426, 16
  %add.ptr430 = getelementptr inbounds i8, i8* %call, i32 %xor429
  %686 = bitcast i8* %add.ptr430 to i64*
  %xor432 = xor i32 %and426, 32
  %add.ptr433 = getelementptr inbounds i8, i8* %call, i32 %xor432
  %687 = bitcast i8* %add.ptr433 to i64*
  %xor435 = xor i32 %and426, 48
  %add.ptr436 = getelementptr inbounds i8, i8* %call, i32 %xor435
  %688 = bitcast i8* %add.ptr436 to i64*
  %689 = load i64, i64* %688, align 8, !tbaa !2
  %arrayidx440 = getelementptr inbounds i8, i8* %add.ptr436, i32 8
  %690 = bitcast i8* %arrayidx440 to i64*
  %691 = load i64, i64* %690, align 8, !tbaa !2
  %692 = load i64, i64* %686, align 8, !tbaa !2
  %add444 = add i64 %692, %660
  store i64 %add444, i64* %686, align 8, !tbaa !2
  %arrayidx446 = getelementptr inbounds i8, i8* %add.ptr430, i32 8
  %693 = bitcast i8* %arrayidx446 to i64*
  %694 = load i64, i64* %693, align 8, !tbaa !2
  %add449 = add i64 %694, %662
  store i64 %add449, i64* %693, align 8, !tbaa !2
  %695 = load i64, i64* %687, align 8, !tbaa !2
  %add454 = add i64 %xor.i4480, %695
  store i64 %add454, i64* %688, align 8, !tbaa !2
  %arrayidx456 = getelementptr inbounds i8, i8* %add.ptr433, i32 8
  %696 = bitcast i8* %arrayidx456 to i64*
  %697 = load i64, i64* %696, align 8, !tbaa !2
  %add459 = add i64 %xor8.i4482, %697
  store i64 %add459, i64* %690, align 8, !tbaa !2
  %add463 = add i64 %689, %c.sroa.0.sroa.0.0.insert.insert5478
  store i64 %add463, i64* %687, align 8, !tbaa !2
  %add467 = add i64 %691, %c.sroa.50.12.insert.insert5456
  store i64 %add467, i64* %696, align 8, !tbaa !2
  %arrayidx472 = getelementptr inbounds i8, i8* %call, i32 %and426
  %698 = load i8, i8* %arrayidx472, align 1, !tbaa !6
  %idxprom.i4405 = zext i8 %698 to i32
  %arrayidx1.i4406 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i4405
  %699 = load i32, i32* %arrayidx1.i4406, align 4, !tbaa !7
  %arrayidx2.i4407 = getelementptr inbounds i8, i8* %arrayidx472, i32 5
  %700 = load i8, i8* %arrayidx2.i4407, align 1, !tbaa !6
  %idxprom3.i4408 = zext i8 %700 to i32
  %arrayidx4.i4409 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom3.i4408
  %701 = load i32, i32* %arrayidx4.i4409, align 4, !tbaa !7
  %arrayidx5.i4411 = getelementptr inbounds i8, i8* %arrayidx472, i32 10
  %702 = load i8, i8* %arrayidx5.i4411, align 1, !tbaa !6
  %idxprom6.i4412 = zext i8 %702 to i32
  %arrayidx7.i4413 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom6.i4412
  %703 = load i32, i32* %arrayidx7.i4413, align 4, !tbaa !7
  %arrayidx9.i4415 = getelementptr inbounds i8, i8* %arrayidx472, i32 15
  %704 = load i8, i8* %arrayidx9.i4415, align 1, !tbaa !6
  %idxprom10.i4416 = zext i8 %704 to i32
  %arrayidx11.i4417 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom10.i4416
  %705 = load i32, i32* %arrayidx11.i4417, align 4, !tbaa !7
  %xor.i4410 = xor i32 %699, %685
  %xor8.i4414 = xor i32 %xor.i4410, %701
  %xor12.i4418 = xor i32 %xor8.i4414, %703
  %xor14.i4419 = xor i32 %xor12.i4418, %705
  store i32 %xor14.i4419, i32* %604, align 16, !tbaa !7
  %arrayidx16.i4420 = getelementptr inbounds i8, i8* %arrayidx472, i32 3
  %706 = load i8, i8* %arrayidx16.i4420, align 1, !tbaa !6
  %idxprom17.i4421 = zext i8 %706 to i32
  %arrayidx18.i4422 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom17.i4421
  %707 = load i32, i32* %arrayidx18.i4422, align 4, !tbaa !7
  %arrayidx19.i4423 = getelementptr inbounds i8, i8* %arrayidx472, i32 4
  %708 = load i8, i8* %arrayidx19.i4423, align 1, !tbaa !6
  %idxprom20.i4424 = zext i8 %708 to i32
  %arrayidx21.i4425 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom20.i4424
  %709 = load i32, i32* %arrayidx21.i4425, align 4, !tbaa !7
  %xor22.i4426 = xor i32 %709, %707
  %arrayidx23.i4427 = getelementptr inbounds i8, i8* %arrayidx472, i32 9
  %710 = load i8, i8* %arrayidx23.i4427, align 1, !tbaa !6
  %idxprom24.i4428 = zext i8 %710 to i32
  %arrayidx25.i4429 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom24.i4428
  %711 = load i32, i32* %arrayidx25.i4429, align 4, !tbaa !7
  %xor26.i4430 = xor i32 %xor22.i4426, %711
  %arrayidx27.i4431 = getelementptr inbounds i8, i8* %arrayidx472, i32 14
  %712 = load i8, i8* %arrayidx27.i4431, align 1, !tbaa !6
  %idxprom28.i4432 = zext i8 %712 to i32
  %arrayidx29.i4433 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom28.i4432
  %713 = load i32, i32* %arrayidx29.i4433, align 4, !tbaa !7
  %xor30.i4434 = xor i32 %xor26.i4430, %713
  %714 = lshr i64 %xor.i4480, 32
  %715 = trunc i64 %714 to i32
  %xor32.i4436 = xor i32 %xor30.i4434, %715
  store i32 %xor32.i4436, i32* %605, align 4, !tbaa !7
  %arrayidx34.i4438 = getelementptr inbounds i8, i8* %arrayidx472, i32 2
  %716 = load i8, i8* %arrayidx34.i4438, align 1, !tbaa !6
  %idxprom35.i4439 = zext i8 %716 to i32
  %arrayidx36.i4440 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom35.i4439
  %717 = load i32, i32* %arrayidx36.i4440, align 4, !tbaa !7
  %arrayidx37.i4441 = getelementptr inbounds i8, i8* %arrayidx472, i32 7
  %718 = load i8, i8* %arrayidx37.i4441, align 1, !tbaa !6
  %idxprom38.i4442 = zext i8 %718 to i32
  %arrayidx39.i4443 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom38.i4442
  %719 = load i32, i32* %arrayidx39.i4443, align 4, !tbaa !7
  %xor40.i4444 = xor i32 %719, %717
  %arrayidx41.i4445 = getelementptr inbounds i8, i8* %arrayidx472, i32 8
  %720 = load i8, i8* %arrayidx41.i4445, align 1, !tbaa !6
  %idxprom42.i4446 = zext i8 %720 to i32
  %arrayidx43.i4447 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom42.i4446
  %721 = load i32, i32* %arrayidx43.i4447, align 4, !tbaa !7
  %xor44.i4448 = xor i32 %xor40.i4444, %721
  %arrayidx45.i4449 = getelementptr inbounds i8, i8* %arrayidx472, i32 13
  %722 = load i8, i8* %arrayidx45.i4449, align 1, !tbaa !6
  %idxprom46.i4450 = zext i8 %722 to i32
  %arrayidx47.i4451 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom46.i4450
  %723 = load i32, i32* %arrayidx47.i4451, align 4, !tbaa !7
  %xor48.i4452 = xor i32 %xor44.i4448, %723
  %724 = load i32, i32* %602, align 8, !tbaa !7
  %xor50.i4454 = xor i32 %xor48.i4452, %724
  store i32 %xor50.i4454, i32* %606, align 8, !tbaa !7
  %arrayidx52.i4456 = getelementptr inbounds i8, i8* %arrayidx472, i32 1
  %725 = load i8, i8* %arrayidx52.i4456, align 1, !tbaa !6
  %idxprom53.i4457 = zext i8 %725 to i32
  %arrayidx54.i4458 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom53.i4457
  %726 = load i32, i32* %arrayidx54.i4458, align 4, !tbaa !7
  %arrayidx55.i4459 = getelementptr inbounds i8, i8* %arrayidx472, i32 6
  %727 = load i8, i8* %arrayidx55.i4459, align 1, !tbaa !6
  %idxprom56.i4460 = zext i8 %727 to i32
  %arrayidx57.i4461 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom56.i4460
  %728 = load i32, i32* %arrayidx57.i4461, align 4, !tbaa !7
  %xor58.i4462 = xor i32 %728, %726
  %arrayidx59.i4463 = getelementptr inbounds i8, i8* %arrayidx472, i32 11
  %729 = load i8, i8* %arrayidx59.i4463, align 1, !tbaa !6
  %idxprom60.i4464 = zext i8 %729 to i32
  %arrayidx61.i4465 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom60.i4464
  %730 = load i32, i32* %arrayidx61.i4465, align 4, !tbaa !7
  %xor62.i4466 = xor i32 %xor58.i4462, %730
  %arrayidx63.i4467 = getelementptr inbounds i8, i8* %arrayidx472, i32 12
  %731 = load i8, i8* %arrayidx63.i4467, align 1, !tbaa !6
  %idxprom64.i4468 = zext i8 %731 to i32
  %arrayidx65.i4469 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom64.i4468
  %732 = load i32, i32* %arrayidx65.i4469, align 4, !tbaa !7
  %xor66.i4470 = xor i32 %xor62.i4466, %732
  %733 = load i32, i32* %603, align 4, !tbaa !7
  %xor68.i4472 = xor i32 %xor66.i4470, %733
  store i32 %xor68.i4472, i32* %607, align 4, !tbaa !7
  %734 = load i64, i64* %76, align 16, !tbaa !2
  %xor.i4400 = xor i64 %734, %c.sroa.0.sroa.0.0.insert.insert5478
  %735 = bitcast i8* %arrayidx472 to i64*
  store i64 %xor.i4400, i64* %735, align 8, !tbaa !2
  %736 = load i64, i64* %86, align 8, !tbaa !2
  %xor5.i4403 = xor i64 %736, %c.sroa.50.12.insert.insert5456
  %737 = bitcast i8* %arrayidx41.i4445 to i64*
  store i64 %xor5.i4403, i64* %737, align 8, !tbaa !2
  %and479 = and i32 %xor14.i4419, %mask.0
  %shl481 = shl i64 %add358, 32
  %xor482 = xor i64 %shl481, %add327
  %arrayidx483 = getelementptr inbounds i8, i8* %call, i32 %and479
  %738 = bitcast i8* %arrayidx483 to i64*
  %739 = load i64, i64* %738, align 8, !tbaa !2
  %xor485 = xor i64 %xor482, %739
  store i64 %xor485, i64* %738, align 8, !tbaa !2
  %shl492 = shl i64 %add358, 1
  %add493 = add i64 %734, %shl492
  %conv495 = and i64 %add493, 2147483646
  %conv497 = or i64 %conv495, 2147483649
  %div498 = udiv i64 %736, %conv497
  %and499 = and i64 %div498, 4294967295
  %mul501 = mul i64 %conv497, %div498
  %sub502 = sub i64 %736, %mul501
  %shl503 = shl i64 %sub502, 32
  %add504 = or i64 %shl503, %and499
  %add508 = add i64 %add504, %734
  %conv510 = uitofp i64 %add508 to double
  %add511 = fadd double %conv510, 0x43F0000000000000
  %740 = call double @llvm.sqrt.f64(double %add511)
  %mul512 = fmul double %740, 2.000000e+00
  %sub513 = fadd double %mul512, 0xC200000000000000
  %conv514 = fptoui double %sub513 to i64
  %shr519 = lshr i64 %conv514, 1
  %and521 = and i64 %conv514, 1
  %add523 = add nuw i64 %shr519, %and521
  %mul524 = mul i64 %add523, %shr519
  %shl525 = shl i64 %conv514, 32
  %add526 = add i64 %mul524, %shl525
  %and.i4380 = and i64 %734, 4294967295
  %and2.i4381 = and i64 %xor485, 4294967295
  %mul.i4382 = mul nuw i64 %and2.i4381, %and.i4380
  %and3.i4383 = and i64 %mul.i4382, 4294967295
  %shr.i4384 = lshr i64 %mul.i4382, 32
  %shr4.i4385 = lshr i64 %734, 32
  %mul5.i4386 = mul nuw i64 %and2.i4381, %shr4.i4385
  %add.i4387 = add nuw i64 %shr.i4384, %mul5.i4386
  %and6.i4388 = and i64 %add.i4387, 4294967295
  %shr7.i4389 = lshr i64 %add.i4387, 32
  %shr8.i4390 = lshr i64 %xor485, 32
  %mul9.i4391 = mul nuw i64 %shr8.i4390, %and.i4380
  %add10.i4392 = add nuw i64 %and6.i4388, %mul9.i4391
  %shr11.i4393 = lshr i64 %add10.i4392, 32
  %mul12.i4394 = mul nuw i64 %shr8.i4390, %shr4.i4385
  %add13.i4395 = add nuw i64 %shr7.i4389, %mul12.i4394
  %add14.i4396 = add nuw i64 %add13.i4395, %shr11.i4393
  %shl.i4397 = shl i64 %add10.i4392, 32
  %add15.i4398 = or i64 %shl.i4397, %and3.i4383
  %xor547 = xor i32 %and479, 16
  %add.ptr548 = getelementptr inbounds i8, i8* %call, i32 %xor547
  %741 = bitcast i8* %add.ptr548 to i64*
  %742 = load i64, i64* %741, align 8, !tbaa !2
  %xor.i4376 = xor i64 %add14.i4396, %742
  store i64 %xor.i4376, i64* %741, align 8, !tbaa !2
  %arrayidx3.i4378 = getelementptr inbounds i8, i8* %add.ptr548, i32 8
  %743 = bitcast i8* %arrayidx3.i4378 to i64*
  %744 = load i64, i64* %743, align 8, !tbaa !2
  %xor4.i4379 = xor i64 %add15.i4398, %744
  store i64 %xor4.i4379, i64* %743, align 8, !tbaa !2
  %xor551 = xor i32 %and479, 32
  %add.ptr552 = getelementptr inbounds i8, i8* %call, i32 %xor551
  %745 = bitcast i8* %add.ptr552 to i64*
  %746 = load i64, i64* %745, align 8, !tbaa !2
  %xor.i4372 = xor i64 %add14.i4396, %746
  %arrayidx2.i4373 = getelementptr inbounds i8, i8* %add.ptr552, i32 8
  %747 = bitcast i8* %arrayidx2.i4373 to i64*
  %748 = load i64, i64* %747, align 8, !tbaa !2
  %xor4.i4375 = xor i64 %748, %add15.i4398
  %xor563 = xor i32 %and479, 48
  %add.ptr564 = getelementptr inbounds i8, i8* %call, i32 %xor563
  %749 = bitcast i8* %add.ptr564 to i64*
  %750 = load i64, i64* %749, align 8, !tbaa !2
  %arrayidx568 = getelementptr inbounds i8, i8* %add.ptr564, i32 8
  %751 = bitcast i8* %arrayidx568 to i64*
  %752 = load i64, i64* %751, align 8, !tbaa !2
  %add572 = add i64 %xor.i4376, %660
  store i64 %add572, i64* %741, align 8, !tbaa !2
  %add577 = add i64 %xor4.i4379, %662
  store i64 %add577, i64* %743, align 8, !tbaa !2
  %753 = load i64, i64* %745, align 8, !tbaa !2
  %add582 = add i64 %753, %xor.i4480
  store i64 %add582, i64* %749, align 8, !tbaa !2
  %754 = load i64, i64* %747, align 8, !tbaa !2
  %add587 = add i64 %754, %xor8.i4482
  store i64 %add587, i64* %751, align 8, !tbaa !2
  %add591 = add i64 %750, %c.sroa.0.sroa.0.0.insert.insert5478
  store i64 %add591, i64* %745, align 8, !tbaa !2
  %add595 = add i64 %752, %c.sroa.50.12.insert.insert5456
  store i64 %add595, i64* %747, align 8, !tbaa !2
  %add.i4367 = add i64 %xor4.i4375, %xor8.i4482
  %add4.i4368 = add i64 %xor.i4372, %xor.i4480
  %755 = load i64, i64* %738, align 8, !tbaa !2
  %xor.i4369 = xor i64 %755, %add4.i4368
  %arrayidx7.i4370 = getelementptr inbounds i8, i8* %arrayidx483, i32 8
  %756 = bitcast i8* %arrayidx7.i4370 to i64*
  %757 = load i64, i64* %756, align 8, !tbaa !2
  %xor8.i4371 = xor i64 %757, %add.i4367
  store i64 %xor8.i4371, i64* %83, align 8, !tbaa !2
  store i64 %add4.i4368, i64* %738, align 8, !tbaa !2
  store i64 %add.i4367, i64* %756, align 8, !tbaa !2
  %inc605 = add nuw nsw i32 %i.45713, 1
  %exitcond5768 = icmp eq i32 %inc605, %iter.0
  br i1 %exitcond5768, label %if.end1380.loopexit5795, label %for.body256.for.body256_crit_edge

for.body256.for.body256_crit_edge:                ; preds = %for.body256
  %758 = lshr i64 %xor.i4369, 32
  %759 = trunc i64 %758 to i32
  %760 = trunc i64 %xor.i4369 to i32
  %add531 = add i64 %add526, 4294967296
  %sub532 = sub i64 %add508, %shr519
  %cmp533 = icmp ult i64 %add531, %sub532
  %cond535 = zext i1 %cmp533 to i64
  %add536 = add i64 %cond535, %conv514
  %add527 = add i64 %add526, %and521
  %cmp528 = icmp ugt i64 %add527, %add508
  %cond530 = sext i1 %cmp528 to i64
  %add538 = add i64 %add536, %cond530
  %.pre5778 = load i64, i64* %76, align 16, !tbaa !2
  %.pre5779 = load i64, i64* %86, align 8, !tbaa !2
  br label %for.body256

for.body611:                                      ; preds = %if.then251, %for.body611.for.body611_crit_edge
  %761 = phi i64 [ %xor.i4147, %for.body611.for.body611_crit_edge ], [ %.promoted5813, %if.then251 ]
  %762 = phi i32 [ %913, %for.body611.for.body611_crit_edge ], [ %89, %if.then251 ]
  %763 = phi i64 [ %.pre5781, %for.body611.for.body611_crit_edge ], [ %xor97.1, %if.then251 ]
  %764 = phi i64 [ %.pre5780, %for.body611.for.body611_crit_edge ], [ %xor97, %if.then251 ]
  %765 = phi i64 [ %xor8.i4149, %for.body611.for.body611_crit_edge ], [ %xor86.1, %if.then251 ]
  %766 = phi i64 [ %xor.i4147, %for.body611.for.body611_crit_edge ], [ %xor86, %if.then251 ]
  %767 = phi i32 [ %914, %for.body611.for.body611_crit_edge ], [ %87, %if.then251 ]
  %i.55707 = phi i32 [ %inc973, %for.body611.for.body611_crit_edge ], [ 0, %if.then251 ]
  %division_result.25706 = phi i64 [ %add872, %for.body611.for.body611_crit_edge ], [ %division_result.05682, %if.then251 ]
  %sqrt_result.25705 = phi i64 [ %add906, %for.body611.for.body611_crit_edge ], [ %sqrt_result.05681, %if.then251 ]
  %d.sroa.23.25704 = phi i64 [ %c.sroa.50.12.insert.insert, %for.body611.for.body611_crit_edge ], [ %d.sroa.23.05680, %if.then251 ]
  %d.sroa.0.sroa.0.25703 = phi i32 [ %xor14.i4308, %for.body611.for.body611_crit_edge ], [ %d.sroa.0.sroa.0.05679, %if.then251 ]
  %d.sroa.0.sroa.23.25702 = phi i32 [ %xor32.i4325, %for.body611.for.body611_crit_edge ], [ %d.sroa.0.sroa.23.05678, %if.then251 ]
  %and614 = and i32 %767, %mask.0
  %xor617 = xor i32 %and614, 16
  %add.ptr618 = getelementptr inbounds i8, i8* %call, i32 %xor617
  %768 = bitcast i8* %add.ptr618 to i64*
  %xor620 = xor i32 %and614, 32
  %add.ptr621 = getelementptr inbounds i8, i8* %call, i32 %xor620
  %769 = bitcast i8* %add.ptr621 to i64*
  %xor623 = xor i32 %and614, 48
  %add.ptr624 = getelementptr inbounds i8, i8* %call, i32 %xor623
  %770 = bitcast i8* %add.ptr624 to i64*
  %771 = load i64, i64* %768, align 8, !tbaa !2
  %arrayidx628 = getelementptr inbounds i8, i8* %add.ptr618, i32 8
  %772 = bitcast i8* %arrayidx628 to i64*
  %773 = load i64, i64* %772, align 8, !tbaa !2
  %774 = load i64, i64* %770, align 8, !tbaa !2
  %d.sroa.0.sroa.23.0.insert.ext5324 = zext i32 %d.sroa.0.sroa.23.25702 to i64
  %d.sroa.0.sroa.23.0.insert.shift5325 = shl nuw i64 %d.sroa.0.sroa.23.0.insert.ext5324, 32
  %d.sroa.0.sroa.0.0.insert.ext5277 = zext i32 %d.sroa.0.sroa.0.25703 to i64
  %d.sroa.0.sroa.0.0.insert.insert5279 = or i64 %d.sroa.0.sroa.23.0.insert.shift5325, %d.sroa.0.sroa.0.0.insert.ext5277
  %add632 = add i64 %774, %d.sroa.0.sroa.0.0.insert.insert5279
  store i64 %add632, i64* %768, align 8, !tbaa !2
  %arrayidx634 = getelementptr inbounds i8, i8* %add.ptr624, i32 8
  %775 = bitcast i8* %arrayidx634 to i64*
  %776 = load i64, i64* %775, align 8, !tbaa !2
  %add637 = add i64 %776, %d.sroa.23.25704
  store i64 %add637, i64* %772, align 8, !tbaa !2
  %777 = load i64, i64* %769, align 8, !tbaa !2
  %add642 = add i64 %766, %777
  store i64 %add642, i64* %770, align 8, !tbaa !2
  %arrayidx644 = getelementptr inbounds i8, i8* %add.ptr621, i32 8
  %778 = bitcast i8* %arrayidx644 to i64*
  %779 = load i64, i64* %778, align 8, !tbaa !2
  %add647 = add i64 %765, %779
  store i64 %add647, i64* %775, align 8, !tbaa !2
  %add651 = add i64 %764, %771
  store i64 %add651, i64* %769, align 8, !tbaa !2
  %add655 = add i64 %763, %773
  store i64 %add655, i64* %778, align 8, !tbaa !2
  %arrayidx660 = getelementptr inbounds i8, i8* %call, i32 %and614
  %780 = load i8, i8* %arrayidx660, align 1, !tbaa !6
  %idxprom.i4294 = zext i8 %780 to i32
  %arrayidx1.i4295 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i4294
  %781 = load i32, i32* %arrayidx1.i4295, align 4, !tbaa !7
  %arrayidx2.i4296 = getelementptr inbounds i8, i8* %arrayidx660, i32 5
  %782 = load i8, i8* %arrayidx2.i4296, align 1, !tbaa !6
  %idxprom3.i4297 = zext i8 %782 to i32
  %arrayidx4.i4298 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom3.i4297
  %783 = load i32, i32* %arrayidx4.i4298, align 4, !tbaa !7
  %arrayidx5.i4300 = getelementptr inbounds i8, i8* %arrayidx660, i32 10
  %784 = load i8, i8* %arrayidx5.i4300, align 1, !tbaa !6
  %idxprom6.i4301 = zext i8 %784 to i32
  %arrayidx7.i4302 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom6.i4301
  %785 = load i32, i32* %arrayidx7.i4302, align 4, !tbaa !7
  %arrayidx9.i4304 = getelementptr inbounds i8, i8* %arrayidx660, i32 15
  %786 = load i8, i8* %arrayidx9.i4304, align 1, !tbaa !6
  %idxprom10.i4305 = zext i8 %786 to i32
  %arrayidx11.i4306 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom10.i4305
  %787 = load i32, i32* %arrayidx11.i4306, align 4, !tbaa !7
  %xor.i4299 = xor i32 %781, %767
  %xor8.i4303 = xor i32 %xor.i4299, %783
  %xor12.i4307 = xor i32 %xor8.i4303, %785
  %xor14.i4308 = xor i32 %xor12.i4307, %787
  %arrayidx16.i4309 = getelementptr inbounds i8, i8* %arrayidx660, i32 3
  %788 = load i8, i8* %arrayidx16.i4309, align 1, !tbaa !6
  %idxprom17.i4310 = zext i8 %788 to i32
  %arrayidx18.i4311 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom17.i4310
  %789 = load i32, i32* %arrayidx18.i4311, align 4, !tbaa !7
  %arrayidx19.i4312 = getelementptr inbounds i8, i8* %arrayidx660, i32 4
  %790 = load i8, i8* %arrayidx19.i4312, align 1, !tbaa !6
  %idxprom20.i4313 = zext i8 %790 to i32
  %arrayidx21.i4314 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom20.i4313
  %791 = load i32, i32* %arrayidx21.i4314, align 4, !tbaa !7
  %xor22.i4315 = xor i32 %791, %789
  %arrayidx23.i4316 = getelementptr inbounds i8, i8* %arrayidx660, i32 9
  %792 = load i8, i8* %arrayidx23.i4316, align 1, !tbaa !6
  %idxprom24.i4317 = zext i8 %792 to i32
  %arrayidx25.i4318 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom24.i4317
  %793 = load i32, i32* %arrayidx25.i4318, align 4, !tbaa !7
  %xor26.i4319 = xor i32 %xor22.i4315, %793
  %arrayidx27.i4320 = getelementptr inbounds i8, i8* %arrayidx660, i32 14
  %794 = load i8, i8* %arrayidx27.i4320, align 1, !tbaa !6
  %idxprom28.i4321 = zext i8 %794 to i32
  %arrayidx29.i4322 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom28.i4321
  %795 = load i32, i32* %arrayidx29.i4322, align 4, !tbaa !7
  %xor30.i4323 = xor i32 %xor26.i4319, %795
  %xor32.i4325 = xor i32 %xor30.i4323, %762
  %arrayidx34.i4327 = getelementptr inbounds i8, i8* %arrayidx660, i32 2
  %796 = load i8, i8* %arrayidx34.i4327, align 1, !tbaa !6
  %idxprom35.i4328 = zext i8 %796 to i32
  %arrayidx36.i4329 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom35.i4328
  %797 = load i32, i32* %arrayidx36.i4329, align 4, !tbaa !7
  %arrayidx37.i4330 = getelementptr inbounds i8, i8* %arrayidx660, i32 7
  %798 = load i8, i8* %arrayidx37.i4330, align 1, !tbaa !6
  %idxprom38.i4331 = zext i8 %798 to i32
  %arrayidx39.i4332 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom38.i4331
  %799 = load i32, i32* %arrayidx39.i4332, align 4, !tbaa !7
  %xor40.i4333 = xor i32 %799, %797
  %arrayidx41.i4334 = getelementptr inbounds i8, i8* %arrayidx660, i32 8
  %800 = load i8, i8* %arrayidx41.i4334, align 1, !tbaa !6
  %idxprom42.i4335 = zext i8 %800 to i32
  %arrayidx43.i4336 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom42.i4335
  %801 = load i32, i32* %arrayidx43.i4336, align 4, !tbaa !7
  %xor44.i4337 = xor i32 %xor40.i4333, %801
  %arrayidx45.i4338 = getelementptr inbounds i8, i8* %arrayidx660, i32 13
  %802 = load i8, i8* %arrayidx45.i4338, align 1, !tbaa !6
  %idxprom46.i4339 = zext i8 %802 to i32
  %arrayidx47.i4340 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom46.i4339
  %803 = load i32, i32* %arrayidx47.i4340, align 4, !tbaa !7
  %xor48.i4341 = xor i32 %xor44.i4337, %803
  %804 = load i32, i32* %602, align 8, !tbaa !7
  %xor50.i4343 = xor i32 %xor48.i4341, %804
  %c.sroa.50.8.insert.ext = zext i32 %xor50.i4343 to i64
  %arrayidx52.i4345 = getelementptr inbounds i8, i8* %arrayidx660, i32 1
  %805 = load i8, i8* %arrayidx52.i4345, align 1, !tbaa !6
  %idxprom53.i4346 = zext i8 %805 to i32
  %arrayidx54.i4347 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom53.i4346
  %806 = load i32, i32* %arrayidx54.i4347, align 4, !tbaa !7
  %arrayidx55.i4348 = getelementptr inbounds i8, i8* %arrayidx660, i32 6
  %807 = load i8, i8* %arrayidx55.i4348, align 1, !tbaa !6
  %idxprom56.i4349 = zext i8 %807 to i32
  %arrayidx57.i4350 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom56.i4349
  %808 = load i32, i32* %arrayidx57.i4350, align 4, !tbaa !7
  %xor58.i4351 = xor i32 %808, %806
  %arrayidx59.i4352 = getelementptr inbounds i8, i8* %arrayidx660, i32 11
  %809 = load i8, i8* %arrayidx59.i4352, align 1, !tbaa !6
  %idxprom60.i4353 = zext i8 %809 to i32
  %arrayidx61.i4354 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom60.i4353
  %810 = load i32, i32* %arrayidx61.i4354, align 4, !tbaa !7
  %xor62.i4355 = xor i32 %xor58.i4351, %810
  %arrayidx63.i4356 = getelementptr inbounds i8, i8* %arrayidx660, i32 12
  %811 = load i8, i8* %arrayidx63.i4356, align 1, !tbaa !6
  %idxprom64.i4357 = zext i8 %811 to i32
  %arrayidx65.i4358 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom64.i4357
  %812 = load i32, i32* %arrayidx65.i4358, align 4, !tbaa !7
  %xor66.i4359 = xor i32 %xor62.i4355, %812
  %813 = load i32, i32* %603, align 4, !tbaa !7
  %xor68.i4361 = xor i32 %xor66.i4359, %813
  %c.sroa.50.12.insert.ext = zext i32 %xor68.i4361 to i64
  %c.sroa.50.12.insert.shift = shl nuw i64 %c.sroa.50.12.insert.ext, 32
  %c.sroa.50.12.insert.insert = or i64 %c.sroa.50.12.insert.shift, %c.sroa.50.8.insert.ext
  %c.sroa.0.sroa.45.0.insert.ext5588 = zext i32 %xor32.i4325 to i64
  %c.sroa.0.sroa.45.0.insert.shift5589 = shl nuw i64 %c.sroa.0.sroa.45.0.insert.ext5588, 32
  %c.sroa.0.sroa.0.0.insert.ext5494 = zext i32 %xor14.i4308 to i64
  %c.sroa.0.sroa.0.0.insert.insert5496 = or i64 %c.sroa.0.sroa.45.0.insert.shift5589, %c.sroa.0.sroa.0.0.insert.ext5494
  %814 = load i64, i64* %76, align 16, !tbaa !2
  %xor.i4289 = xor i64 %814, %c.sroa.0.sroa.0.0.insert.insert5496
  %815 = bitcast i8* %arrayidx660 to i64*
  store i64 %xor.i4289, i64* %815, align 8, !tbaa !2
  %816 = load i64, i64* %86, align 8, !tbaa !2
  %xor5.i4292 = xor i64 %c.sroa.50.12.insert.insert, %816
  %817 = bitcast i8* %arrayidx41.i4334 to i64*
  store i64 %xor5.i4292, i64* %817, align 8, !tbaa !2
  %and667 = and i32 %xor14.i4308, %mask.0
  %shl669 = shl i64 %sqrt_result.25705, 32
  %xor670 = xor i64 %division_result.25706, %shl669
  %arrayidx671 = getelementptr inbounds i8, i8* %call, i32 %and667
  %818 = bitcast i8* %arrayidx671 to i64*
  %819 = load i64, i64* %818, align 8, !tbaa !2
  %xor673 = xor i64 %xor670, %819
  store i64 %xor673, i64* %818, align 8, !tbaa !2
  %shl680 = shl i64 %sqrt_result.25705, 1
  %add681 = add i64 %shl680, %c.sroa.0.sroa.0.0.insert.ext5494
  %conv683 = and i64 %add681, 2147483646
  %conv685 = or i64 %conv683, 2147483649
  %div686 = udiv i64 %c.sroa.50.12.insert.insert, %conv685
  %and687 = and i64 %div686, 4294967295
  %mul689 = mul i64 %div686, %conv685
  %sub690 = sub i64 %c.sroa.50.8.insert.ext, %mul689
  %shl691 = shl i64 %sub690, 32
  %add692 = or i64 %shl691, %and687
  %add696 = add i64 %add692, %c.sroa.0.sroa.0.0.insert.insert5496
  %conv698 = uitofp i64 %add696 to double
  %add699 = fadd double %conv698, 0x43F0000000000000
  %820 = call double @llvm.sqrt.f64(double %add699)
  %mul700 = fmul double %820, 2.000000e+00
  %sub701 = fadd double %mul700, 0xC200000000000000
  %conv702 = fptoui double %sub701 to i64
  %shr707 = lshr i64 %conv702, 1
  %and709 = and i64 %conv702, 1
  %add711 = add nuw i64 %shr707, %and709
  %mul712 = mul i64 %add711, %shr707
  %shl713 = shl i64 %conv702, 32
  %add714 = add i64 %mul712, %shl713
  %add715 = add i64 %add714, %and709
  %cmp716 = icmp ugt i64 %add715, %add696
  %cond718 = sext i1 %cmp716 to i64
  %add719 = add i64 %add714, 4294967296
  %sub720 = sub i64 %add696, %shr707
  %cmp721 = icmp ult i64 %add719, %sub720
  %cond723 = zext i1 %cmp721 to i64
  %add724 = add i64 %cond723, %conv702
  %add726 = add i64 %add724, %cond718
  %and2.i4270 = and i64 %xor673, 4294967295
  %mul.i4271 = mul nuw i64 %and2.i4270, %c.sroa.0.sroa.0.0.insert.ext5494
  %and3.i4272 = and i64 %mul.i4271, 4294967295
  %shr.i4273 = lshr i64 %mul.i4271, 32
  %mul5.i4275 = mul nuw i64 %and2.i4270, %c.sroa.0.sroa.45.0.insert.ext5588
  %add.i4276 = add nuw i64 %shr.i4273, %mul5.i4275
  %and6.i4277 = and i64 %add.i4276, 4294967295
  %shr7.i4278 = lshr i64 %add.i4276, 32
  %shr8.i4279 = lshr i64 %xor673, 32
  %mul9.i4280 = mul nuw i64 %shr8.i4279, %c.sroa.0.sroa.0.0.insert.ext5494
  %add10.i4281 = add nuw i64 %and6.i4277, %mul9.i4280
  %shr11.i4282 = lshr i64 %add10.i4281, 32
  %mul12.i4283 = mul nuw i64 %shr8.i4279, %c.sroa.0.sroa.45.0.insert.ext5588
  %add13.i4284 = add nuw i64 %shr7.i4278, %mul12.i4283
  %add14.i4285 = add nuw i64 %add13.i4284, %shr11.i4282
  %shl.i4286 = shl i64 %add10.i4281, 32
  %add15.i4287 = or i64 %shl.i4286, %and3.i4272
  %xor735 = xor i32 %and667, 16
  %add.ptr736 = getelementptr inbounds i8, i8* %call, i32 %xor735
  %821 = bitcast i8* %add.ptr736 to i64*
  %822 = load i64, i64* %821, align 8, !tbaa !2
  %xor.i4265 = xor i64 %add14.i4285, %822
  store i64 %xor.i4265, i64* %821, align 8, !tbaa !2
  %arrayidx3.i4267 = getelementptr inbounds i8, i8* %add.ptr736, i32 8
  %823 = bitcast i8* %arrayidx3.i4267 to i64*
  %824 = load i64, i64* %823, align 8, !tbaa !2
  %xor4.i4268 = xor i64 %add15.i4287, %824
  store i64 %xor4.i4268, i64* %823, align 8, !tbaa !2
  %xor739 = xor i32 %and667, 32
  %add.ptr740 = getelementptr inbounds i8, i8* %call, i32 %xor739
  %825 = bitcast i8* %add.ptr740 to i64*
  %826 = load i64, i64* %825, align 8, !tbaa !2
  %xor.i4261 = xor i64 %add14.i4285, %826
  %arrayidx2.i4262 = getelementptr inbounds i8, i8* %add.ptr740, i32 8
  %827 = bitcast i8* %arrayidx2.i4262 to i64*
  %828 = load i64, i64* %827, align 8, !tbaa !2
  %xor4.i4264 = xor i64 %add15.i4287, %828
  %xor751 = xor i32 %and667, 48
  %add.ptr752 = getelementptr inbounds i8, i8* %call, i32 %xor751
  %829 = bitcast i8* %add.ptr752 to i64*
  %830 = load i64, i64* %829, align 8, !tbaa !2
  %add760 = add i64 %830, %d.sroa.0.sroa.0.0.insert.insert5279
  store i64 %add760, i64* %821, align 8, !tbaa !2
  %arrayidx762 = getelementptr inbounds i8, i8* %add.ptr752, i32 8
  %831 = bitcast i8* %arrayidx762 to i64*
  %832 = load i64, i64* %831, align 8, !tbaa !2
  %add765 = add i64 %832, %d.sroa.23.25704
  store i64 %add765, i64* %823, align 8, !tbaa !2
  %833 = load i64, i64* %825, align 8, !tbaa !2
  %add770 = add i64 %833, %766
  store i64 %add770, i64* %829, align 8, !tbaa !2
  %834 = load i64, i64* %827, align 8, !tbaa !2
  %add775 = add i64 %834, %765
  store i64 %add775, i64* %831, align 8, !tbaa !2
  %add779 = add i64 %xor.i4265, %764
  store i64 %add779, i64* %825, align 8, !tbaa !2
  %add783 = add i64 %xor4.i4268, %763
  store i64 %add783, i64* %827, align 8, !tbaa !2
  %835 = load i64, i64* %83, align 8, !tbaa !2
  %add.i4256 = add i64 %835, %xor4.i4264
  %add4.i4257 = add i64 %761, %xor.i4261
  %836 = load i64, i64* %818, align 8, !tbaa !2
  %xor.i4258 = xor i64 %836, %add4.i4257
  %arrayidx7.i4259 = getelementptr inbounds i8, i8* %arrayidx671, i32 8
  %837 = bitcast i8* %arrayidx7.i4259 to i64*
  %838 = load i64, i64* %837, align 8, !tbaa !2
  %xor8.i4260 = xor i64 %838, %add.i4256
  store i64 %xor8.i4260, i64* %83, align 8, !tbaa !2
  store i64 %add4.i4257, i64* %818, align 8, !tbaa !2
  store i64 %add.i4256, i64* %837, align 8, !tbaa !2
  %839 = trunc i64 %xor.i4258 to i32
  %and794 = and i32 %mask.0, %839
  %xor797 = xor i32 %and794, 16
  %add.ptr798 = getelementptr inbounds i8, i8* %call, i32 %xor797
  %840 = bitcast i8* %add.ptr798 to i64*
  %xor800 = xor i32 %and794, 32
  %add.ptr801 = getelementptr inbounds i8, i8* %call, i32 %xor800
  %841 = bitcast i8* %add.ptr801 to i64*
  %xor803 = xor i32 %and794, 48
  %add.ptr804 = getelementptr inbounds i8, i8* %call, i32 %xor803
  %842 = bitcast i8* %add.ptr804 to i64*
  %843 = load i64, i64* %840, align 8, !tbaa !2
  %arrayidx808 = getelementptr inbounds i8, i8* %add.ptr798, i32 8
  %844 = bitcast i8* %arrayidx808 to i64*
  %845 = load i64, i64* %844, align 8, !tbaa !2
  %846 = load i64, i64* %842, align 8, !tbaa !2
  %add812 = add i64 %846, %814
  store i64 %add812, i64* %840, align 8, !tbaa !2
  %arrayidx814 = getelementptr inbounds i8, i8* %add.ptr804, i32 8
  %847 = bitcast i8* %arrayidx814 to i64*
  %848 = load i64, i64* %847, align 8, !tbaa !2
  %add817 = add i64 %848, %816
  store i64 %add817, i64* %844, align 8, !tbaa !2
  %849 = load i64, i64* %841, align 8, !tbaa !2
  %add822 = add i64 %xor.i4258, %849
  store i64 %add822, i64* %842, align 8, !tbaa !2
  %arrayidx824 = getelementptr inbounds i8, i8* %add.ptr801, i32 8
  %850 = bitcast i8* %arrayidx824 to i64*
  %851 = load i64, i64* %850, align 8, !tbaa !2
  %add827 = add i64 %xor8.i4260, %851
  store i64 %add827, i64* %847, align 8, !tbaa !2
  %add831 = add i64 %843, %c.sroa.0.sroa.0.0.insert.insert5496
  store i64 %add831, i64* %841, align 8, !tbaa !2
  %add835 = add i64 %845, %c.sroa.50.12.insert.insert
  store i64 %add835, i64* %850, align 8, !tbaa !2
  %arrayidx840 = getelementptr inbounds i8, i8* %call, i32 %and794
  %852 = load i8, i8* %arrayidx840, align 1, !tbaa !6
  %idxprom.i4183 = zext i8 %852 to i32
  %arrayidx1.i4184 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i4183
  %853 = load i32, i32* %arrayidx1.i4184, align 4, !tbaa !7
  %arrayidx2.i4185 = getelementptr inbounds i8, i8* %arrayidx840, i32 5
  %854 = load i8, i8* %arrayidx2.i4185, align 1, !tbaa !6
  %idxprom3.i4186 = zext i8 %854 to i32
  %arrayidx4.i4187 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom3.i4186
  %855 = load i32, i32* %arrayidx4.i4187, align 4, !tbaa !7
  %arrayidx5.i4189 = getelementptr inbounds i8, i8* %arrayidx840, i32 10
  %856 = load i8, i8* %arrayidx5.i4189, align 1, !tbaa !6
  %idxprom6.i4190 = zext i8 %856 to i32
  %arrayidx7.i4191 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom6.i4190
  %857 = load i32, i32* %arrayidx7.i4191, align 4, !tbaa !7
  %arrayidx9.i4193 = getelementptr inbounds i8, i8* %arrayidx840, i32 15
  %858 = load i8, i8* %arrayidx9.i4193, align 1, !tbaa !6
  %idxprom10.i4194 = zext i8 %858 to i32
  %arrayidx11.i4195 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom10.i4194
  %859 = load i32, i32* %arrayidx11.i4195, align 4, !tbaa !7
  %xor.i4188 = xor i32 %853, %839
  %xor8.i4192 = xor i32 %xor.i4188, %855
  %xor12.i4196 = xor i32 %xor8.i4192, %857
  %xor14.i4197 = xor i32 %xor12.i4196, %859
  store i32 %xor14.i4197, i32* %604, align 16, !tbaa !7
  %arrayidx16.i4198 = getelementptr inbounds i8, i8* %arrayidx840, i32 3
  %860 = load i8, i8* %arrayidx16.i4198, align 1, !tbaa !6
  %idxprom17.i4199 = zext i8 %860 to i32
  %arrayidx18.i4200 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom17.i4199
  %861 = load i32, i32* %arrayidx18.i4200, align 4, !tbaa !7
  %arrayidx19.i4201 = getelementptr inbounds i8, i8* %arrayidx840, i32 4
  %862 = load i8, i8* %arrayidx19.i4201, align 1, !tbaa !6
  %idxprom20.i4202 = zext i8 %862 to i32
  %arrayidx21.i4203 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom20.i4202
  %863 = load i32, i32* %arrayidx21.i4203, align 4, !tbaa !7
  %xor22.i4204 = xor i32 %863, %861
  %arrayidx23.i4205 = getelementptr inbounds i8, i8* %arrayidx840, i32 9
  %864 = load i8, i8* %arrayidx23.i4205, align 1, !tbaa !6
  %idxprom24.i4206 = zext i8 %864 to i32
  %arrayidx25.i4207 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom24.i4206
  %865 = load i32, i32* %arrayidx25.i4207, align 4, !tbaa !7
  %xor26.i4208 = xor i32 %xor22.i4204, %865
  %arrayidx27.i4209 = getelementptr inbounds i8, i8* %arrayidx840, i32 14
  %866 = load i8, i8* %arrayidx27.i4209, align 1, !tbaa !6
  %idxprom28.i4210 = zext i8 %866 to i32
  %arrayidx29.i4211 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom28.i4210
  %867 = load i32, i32* %arrayidx29.i4211, align 4, !tbaa !7
  %xor30.i4212 = xor i32 %xor26.i4208, %867
  %868 = lshr i64 %xor.i4258, 32
  %869 = trunc i64 %868 to i32
  %xor32.i4214 = xor i32 %xor30.i4212, %869
  store i32 %xor32.i4214, i32* %605, align 4, !tbaa !7
  %arrayidx34.i4216 = getelementptr inbounds i8, i8* %arrayidx840, i32 2
  %870 = load i8, i8* %arrayidx34.i4216, align 1, !tbaa !6
  %idxprom35.i4217 = zext i8 %870 to i32
  %arrayidx36.i4218 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom35.i4217
  %871 = load i32, i32* %arrayidx36.i4218, align 4, !tbaa !7
  %arrayidx37.i4219 = getelementptr inbounds i8, i8* %arrayidx840, i32 7
  %872 = load i8, i8* %arrayidx37.i4219, align 1, !tbaa !6
  %idxprom38.i4220 = zext i8 %872 to i32
  %arrayidx39.i4221 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom38.i4220
  %873 = load i32, i32* %arrayidx39.i4221, align 4, !tbaa !7
  %xor40.i4222 = xor i32 %873, %871
  %arrayidx41.i4223 = getelementptr inbounds i8, i8* %arrayidx840, i32 8
  %874 = load i8, i8* %arrayidx41.i4223, align 1, !tbaa !6
  %idxprom42.i4224 = zext i8 %874 to i32
  %arrayidx43.i4225 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom42.i4224
  %875 = load i32, i32* %arrayidx43.i4225, align 4, !tbaa !7
  %xor44.i4226 = xor i32 %xor40.i4222, %875
  %arrayidx45.i4227 = getelementptr inbounds i8, i8* %arrayidx840, i32 13
  %876 = load i8, i8* %arrayidx45.i4227, align 1, !tbaa !6
  %idxprom46.i4228 = zext i8 %876 to i32
  %arrayidx47.i4229 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom46.i4228
  %877 = load i32, i32* %arrayidx47.i4229, align 4, !tbaa !7
  %xor48.i4230 = xor i32 %xor44.i4226, %877
  %878 = load i32, i32* %602, align 8, !tbaa !7
  %xor50.i4232 = xor i32 %xor48.i4230, %878
  store i32 %xor50.i4232, i32* %606, align 8, !tbaa !7
  %arrayidx52.i4234 = getelementptr inbounds i8, i8* %arrayidx840, i32 1
  %879 = load i8, i8* %arrayidx52.i4234, align 1, !tbaa !6
  %idxprom53.i4235 = zext i8 %879 to i32
  %arrayidx54.i4236 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom53.i4235
  %880 = load i32, i32* %arrayidx54.i4236, align 4, !tbaa !7
  %arrayidx55.i4237 = getelementptr inbounds i8, i8* %arrayidx840, i32 6
  %881 = load i8, i8* %arrayidx55.i4237, align 1, !tbaa !6
  %idxprom56.i4238 = zext i8 %881 to i32
  %arrayidx57.i4239 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom56.i4238
  %882 = load i32, i32* %arrayidx57.i4239, align 4, !tbaa !7
  %xor58.i4240 = xor i32 %882, %880
  %arrayidx59.i4241 = getelementptr inbounds i8, i8* %arrayidx840, i32 11
  %883 = load i8, i8* %arrayidx59.i4241, align 1, !tbaa !6
  %idxprom60.i4242 = zext i8 %883 to i32
  %arrayidx61.i4243 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom60.i4242
  %884 = load i32, i32* %arrayidx61.i4243, align 4, !tbaa !7
  %xor62.i4244 = xor i32 %xor58.i4240, %884
  %arrayidx63.i4245 = getelementptr inbounds i8, i8* %arrayidx840, i32 12
  %885 = load i8, i8* %arrayidx63.i4245, align 1, !tbaa !6
  %idxprom64.i4246 = zext i8 %885 to i32
  %arrayidx65.i4247 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom64.i4246
  %886 = load i32, i32* %arrayidx65.i4247, align 4, !tbaa !7
  %xor66.i4248 = xor i32 %xor62.i4244, %886
  %887 = load i32, i32* %603, align 4, !tbaa !7
  %xor68.i4250 = xor i32 %xor66.i4248, %887
  store i32 %xor68.i4250, i32* %607, align 4, !tbaa !7
  %888 = load i64, i64* %76, align 16, !tbaa !2
  %xor.i4178 = xor i64 %888, %c.sroa.0.sroa.0.0.insert.insert5496
  %889 = bitcast i8* %arrayidx840 to i64*
  store i64 %xor.i4178, i64* %889, align 8, !tbaa !2
  %890 = load i64, i64* %86, align 8, !tbaa !2
  %xor5.i4181 = xor i64 %890, %c.sroa.50.12.insert.insert
  %891 = bitcast i8* %arrayidx41.i4223 to i64*
  store i64 %xor5.i4181, i64* %891, align 8, !tbaa !2
  %and847 = and i32 %xor14.i4197, %mask.0
  %shl849 = shl i64 %add726, 32
  %xor850 = xor i64 %shl849, %add692
  %arrayidx851 = getelementptr inbounds i8, i8* %call, i32 %and847
  %892 = bitcast i8* %arrayidx851 to i64*
  %893 = load i64, i64* %892, align 8, !tbaa !2
  %xor853 = xor i64 %xor850, %893
  store i64 %xor853, i64* %892, align 8, !tbaa !2
  %shl860 = shl i64 %add726, 1
  %add861 = add i64 %888, %shl860
  %conv863 = and i64 %add861, 2147483646
  %conv865 = or i64 %conv863, 2147483649
  %div866 = udiv i64 %890, %conv865
  %and867 = and i64 %div866, 4294967295
  %mul869 = mul i64 %conv865, %div866
  %sub870 = sub i64 %890, %mul869
  %shl871 = shl i64 %sub870, 32
  %add872 = or i64 %shl871, %and867
  %add876 = add i64 %add872, %888
  %conv878 = uitofp i64 %add876 to double
  %add879 = fadd double %conv878, 0x43F0000000000000
  %894 = call double @llvm.sqrt.f64(double %add879)
  %mul880 = fmul double %894, 2.000000e+00
  %sub881 = fadd double %mul880, 0xC200000000000000
  %conv882 = fptoui double %sub881 to i64
  %shr887 = lshr i64 %conv882, 1
  %and889 = and i64 %conv882, 1
  %add891 = add nuw i64 %shr887, %and889
  %mul892 = mul i64 %add891, %shr887
  %shl893 = shl i64 %conv882, 32
  %add894 = add i64 %mul892, %shl893
  %and.i4158 = and i64 %888, 4294967295
  %and2.i4159 = and i64 %xor853, 4294967295
  %mul.i4160 = mul nuw i64 %and2.i4159, %and.i4158
  %and3.i4161 = and i64 %mul.i4160, 4294967295
  %shr.i4162 = lshr i64 %mul.i4160, 32
  %shr4.i4163 = lshr i64 %888, 32
  %mul5.i4164 = mul nuw i64 %and2.i4159, %shr4.i4163
  %add.i4165 = add nuw i64 %shr.i4162, %mul5.i4164
  %and6.i4166 = and i64 %add.i4165, 4294967295
  %shr7.i4167 = lshr i64 %add.i4165, 32
  %shr8.i4168 = lshr i64 %xor853, 32
  %mul9.i4169 = mul nuw i64 %shr8.i4168, %and.i4158
  %add10.i4170 = add nuw i64 %and6.i4166, %mul9.i4169
  %shr11.i4171 = lshr i64 %add10.i4170, 32
  %mul12.i4172 = mul nuw i64 %shr8.i4168, %shr4.i4163
  %add13.i4173 = add nuw i64 %shr7.i4167, %mul12.i4172
  %add14.i4174 = add nuw i64 %add13.i4173, %shr11.i4171
  %shl.i4175 = shl i64 %add10.i4170, 32
  %add15.i4176 = or i64 %shl.i4175, %and3.i4161
  %xor915 = xor i32 %and847, 16
  %add.ptr916 = getelementptr inbounds i8, i8* %call, i32 %xor915
  %895 = bitcast i8* %add.ptr916 to i64*
  %896 = load i64, i64* %895, align 8, !tbaa !2
  %xor.i4154 = xor i64 %add14.i4174, %896
  store i64 %xor.i4154, i64* %895, align 8, !tbaa !2
  %arrayidx3.i4156 = getelementptr inbounds i8, i8* %add.ptr916, i32 8
  %897 = bitcast i8* %arrayidx3.i4156 to i64*
  %898 = load i64, i64* %897, align 8, !tbaa !2
  %xor4.i4157 = xor i64 %add15.i4176, %898
  store i64 %xor4.i4157, i64* %897, align 8, !tbaa !2
  %xor919 = xor i32 %and847, 32
  %add.ptr920 = getelementptr inbounds i8, i8* %call, i32 %xor919
  %899 = bitcast i8* %add.ptr920 to i64*
  %900 = load i64, i64* %899, align 8, !tbaa !2
  %xor.i4150 = xor i64 %add14.i4174, %900
  %arrayidx2.i4151 = getelementptr inbounds i8, i8* %add.ptr920, i32 8
  %901 = bitcast i8* %arrayidx2.i4151 to i64*
  %902 = load i64, i64* %901, align 8, !tbaa !2
  %xor4.i4153 = xor i64 %902, %add15.i4176
  %xor931 = xor i32 %and847, 48
  %add.ptr932 = getelementptr inbounds i8, i8* %call, i32 %xor931
  %903 = bitcast i8* %add.ptr932 to i64*
  %904 = load i64, i64* %903, align 8, !tbaa !2
  %add940 = add i64 %904, %814
  store i64 %add940, i64* %895, align 8, !tbaa !2
  %arrayidx942 = getelementptr inbounds i8, i8* %add.ptr932, i32 8
  %905 = bitcast i8* %arrayidx942 to i64*
  %906 = load i64, i64* %905, align 8, !tbaa !2
  %add945 = add i64 %906, %816
  store i64 %add945, i64* %897, align 8, !tbaa !2
  %907 = load i64, i64* %899, align 8, !tbaa !2
  %add950 = add i64 %907, %xor.i4258
  store i64 %add950, i64* %903, align 8, !tbaa !2
  %908 = load i64, i64* %901, align 8, !tbaa !2
  %add955 = add i64 %908, %xor8.i4260
  store i64 %add955, i64* %905, align 8, !tbaa !2
  %add959 = add i64 %xor.i4154, %c.sroa.0.sroa.0.0.insert.insert5496
  store i64 %add959, i64* %899, align 8, !tbaa !2
  %add963 = add i64 %xor4.i4157, %c.sroa.50.12.insert.insert
  store i64 %add963, i64* %901, align 8, !tbaa !2
  %add.i4145 = add i64 %xor4.i4153, %xor8.i4260
  %add4.i4146 = add i64 %xor.i4150, %xor.i4258
  %909 = load i64, i64* %892, align 8, !tbaa !2
  %xor.i4147 = xor i64 %909, %add4.i4146
  %arrayidx7.i4148 = getelementptr inbounds i8, i8* %arrayidx851, i32 8
  %910 = bitcast i8* %arrayidx7.i4148 to i64*
  %911 = load i64, i64* %910, align 8, !tbaa !2
  %xor8.i4149 = xor i64 %911, %add.i4145
  store i64 %xor8.i4149, i64* %83, align 8, !tbaa !2
  store i64 %add4.i4146, i64* %892, align 8, !tbaa !2
  store i64 %add.i4145, i64* %910, align 8, !tbaa !2
  %inc973 = add nuw nsw i32 %i.55707, 1
  %exitcond5767 = icmp eq i32 %inc973, %iter.0
  br i1 %exitcond5767, label %if.end1380.loopexit5794, label %for.body611.for.body611_crit_edge

for.body611.for.body611_crit_edge:                ; preds = %for.body611
  %912 = lshr i64 %xor.i4147, 32
  %913 = trunc i64 %912 to i32
  %914 = trunc i64 %xor.i4147 to i32
  %add899 = add i64 %add894, 4294967296
  %sub900 = sub i64 %add876, %shr887
  %cmp901 = icmp ult i64 %add899, %sub900
  %cond903 = zext i1 %cmp901 to i64
  %add904 = add i64 %cond903, %conv882
  %add895 = add i64 %add894, %and889
  %cmp896 = icmp ugt i64 %add895, %add876
  %cond898 = sext i1 %cmp896 to i64
  %add906 = add i64 %add904, %cond898
  %.pre5780 = load i64, i64* %76, align 16, !tbaa !2
  %.pre5781 = load i64, i64* %86, align 8, !tbaa !2
  br label %for.body611

for.body980:                                      ; preds = %do.end1306, %for.cond977.preheader
  %915 = phi i32 [ %90, %for.cond977.preheader ], [ %2623, %do.end1306 ]
  %916 = phi i32 [ %89, %for.cond977.preheader ], [ %2622, %do.end1306 ]
  %917 = phi i32 [ %87, %for.cond977.preheader ], [ %2620, %do.end1306 ]
  %i.65717 = phi i32 [ 0, %for.cond977.preheader ], [ %inc1376, %do.end1306 ]
  %d.sroa.23.35716 = phi i64 [ %d.sroa.23.05680, %for.cond977.preheader ], [ %xor1167, %do.end1306 ]
  %d.sroa.0.sroa.0.35715 = phi i32 [ %d.sroa.0.sroa.0.05679, %for.cond977.preheader ], [ %d.sroa.0.sroa.0.0.extract.trunc5269.pre-phi, %do.end1306 ]
  %d.sroa.0.sroa.23.35714 = phi i32 [ %d.sroa.0.sroa.23.05678, %for.cond977.preheader ], [ %d.sroa.0.sroa.23.0.extract.trunc5313, %do.end1306 ]
  %and983 = and i32 %917, %mask.0
  %arrayidx985 = getelementptr inbounds i8, i8* %call, i32 %and983
  %918 = load i8, i8* %arrayidx985, align 1, !tbaa !6
  %idxprom.i4072 = zext i8 %918 to i32
  %arrayidx1.i4073 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i4072
  %919 = load i32, i32* %arrayidx1.i4073, align 4, !tbaa !7
  %arrayidx2.i4074 = getelementptr inbounds i8, i8* %arrayidx985, i32 5
  %920 = load i8, i8* %arrayidx2.i4074, align 1, !tbaa !6
  %idxprom3.i4075 = zext i8 %920 to i32
  %arrayidx4.i4076 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom3.i4075
  %921 = load i32, i32* %arrayidx4.i4076, align 4, !tbaa !7
  %arrayidx5.i4078 = getelementptr inbounds i8, i8* %arrayidx985, i32 10
  %922 = load i8, i8* %arrayidx5.i4078, align 1, !tbaa !6
  %idxprom6.i4079 = zext i8 %922 to i32
  %arrayidx7.i4080 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom6.i4079
  %923 = load i32, i32* %arrayidx7.i4080, align 4, !tbaa !7
  %arrayidx9.i4082 = getelementptr inbounds i8, i8* %arrayidx985, i32 15
  %924 = load i8, i8* %arrayidx9.i4082, align 1, !tbaa !6
  %idxprom10.i4083 = zext i8 %924 to i32
  %arrayidx11.i4084 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom10.i4083
  %925 = load i32, i32* %arrayidx11.i4084, align 4, !tbaa !7
  %xor.i4077 = xor i32 %919, %917
  %xor8.i4081 = xor i32 %xor.i4077, %921
  %xor12.i4085 = xor i32 %xor8.i4081, %923
  %xor14.i4086 = xor i32 %xor12.i4085, %925
  %arrayidx16.i4087 = getelementptr inbounds i8, i8* %arrayidx985, i32 3
  %926 = load i8, i8* %arrayidx16.i4087, align 1, !tbaa !6
  %idxprom17.i4088 = zext i8 %926 to i32
  %arrayidx18.i4089 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom17.i4088
  %927 = load i32, i32* %arrayidx18.i4089, align 4, !tbaa !7
  %arrayidx19.i4090 = getelementptr inbounds i8, i8* %arrayidx985, i32 4
  %928 = load i8, i8* %arrayidx19.i4090, align 1, !tbaa !6
  %idxprom20.i4091 = zext i8 %928 to i32
  %arrayidx21.i4092 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom20.i4091
  %929 = load i32, i32* %arrayidx21.i4092, align 4, !tbaa !7
  %xor22.i4093 = xor i32 %929, %927
  %arrayidx23.i4094 = getelementptr inbounds i8, i8* %arrayidx985, i32 9
  %930 = load i8, i8* %arrayidx23.i4094, align 1, !tbaa !6
  %idxprom24.i4095 = zext i8 %930 to i32
  %arrayidx25.i4096 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom24.i4095
  %931 = load i32, i32* %arrayidx25.i4096, align 4, !tbaa !7
  %xor26.i4097 = xor i32 %xor22.i4093, %931
  %arrayidx27.i4098 = getelementptr inbounds i8, i8* %arrayidx985, i32 14
  %932 = load i8, i8* %arrayidx27.i4098, align 1, !tbaa !6
  %idxprom28.i4099 = zext i8 %932 to i32
  %arrayidx29.i4100 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom28.i4099
  %933 = load i32, i32* %arrayidx29.i4100, align 4, !tbaa !7
  %xor30.i4101 = xor i32 %xor26.i4097, %933
  %xor32.i4103 = xor i32 %xor30.i4101, %916
  %arrayidx34.i4105 = getelementptr inbounds i8, i8* %arrayidx985, i32 2
  %934 = load i8, i8* %arrayidx34.i4105, align 1, !tbaa !6
  %idxprom35.i4106 = zext i8 %934 to i32
  %arrayidx36.i4107 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom35.i4106
  %935 = load i32, i32* %arrayidx36.i4107, align 4, !tbaa !7
  %arrayidx37.i4108 = getelementptr inbounds i8, i8* %arrayidx985, i32 7
  %936 = load i8, i8* %arrayidx37.i4108, align 1, !tbaa !6
  %idxprom38.i4109 = zext i8 %936 to i32
  %arrayidx39.i4110 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom38.i4109
  %937 = load i32, i32* %arrayidx39.i4110, align 4, !tbaa !7
  %xor40.i4111 = xor i32 %937, %935
  %arrayidx41.i4112 = getelementptr inbounds i8, i8* %arrayidx985, i32 8
  %938 = load i8, i8* %arrayidx41.i4112, align 1, !tbaa !6
  %idxprom42.i4113 = zext i8 %938 to i32
  %arrayidx43.i4114 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom42.i4113
  %939 = load i32, i32* %arrayidx43.i4114, align 4, !tbaa !7
  %xor44.i4115 = xor i32 %xor40.i4111, %939
  %arrayidx45.i4116 = getelementptr inbounds i8, i8* %arrayidx985, i32 13
  %940 = load i8, i8* %arrayidx45.i4116, align 1, !tbaa !6
  %idxprom46.i4117 = zext i8 %940 to i32
  %arrayidx47.i4118 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom46.i4117
  %941 = load i32, i32* %arrayidx47.i4118, align 4, !tbaa !7
  %xor48.i4119 = xor i32 %xor44.i4115, %941
  %xor50.i4121 = xor i32 %xor48.i4119, %915
  %c.sroa.50.8.insert.ext5436 = zext i32 %xor50.i4121 to i64
  %arrayidx52.i4123 = getelementptr inbounds i8, i8* %arrayidx985, i32 1
  %942 = load i8, i8* %arrayidx52.i4123, align 1, !tbaa !6
  %idxprom53.i4124 = zext i8 %942 to i32
  %arrayidx54.i4125 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom53.i4124
  %943 = load i32, i32* %arrayidx54.i4125, align 4, !tbaa !7
  %arrayidx55.i4126 = getelementptr inbounds i8, i8* %arrayidx985, i32 6
  %944 = load i8, i8* %arrayidx55.i4126, align 1, !tbaa !6
  %idxprom56.i4127 = zext i8 %944 to i32
  %arrayidx57.i4128 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom56.i4127
  %945 = load i32, i32* %arrayidx57.i4128, align 4, !tbaa !7
  %xor58.i4129 = xor i32 %945, %943
  %arrayidx59.i4130 = getelementptr inbounds i8, i8* %arrayidx985, i32 11
  %946 = load i8, i8* %arrayidx59.i4130, align 1, !tbaa !6
  %idxprom60.i4131 = zext i8 %946 to i32
  %arrayidx61.i4132 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom60.i4131
  %947 = load i32, i32* %arrayidx61.i4132, align 4, !tbaa !7
  %xor62.i4133 = xor i32 %xor58.i4129, %947
  %arrayidx63.i4134 = getelementptr inbounds i8, i8* %arrayidx985, i32 12
  %948 = load i8, i8* %arrayidx63.i4134, align 1, !tbaa !6
  %idxprom64.i4135 = zext i8 %948 to i32
  %arrayidx65.i4136 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom64.i4135
  %949 = load i32, i32* %arrayidx65.i4136, align 4, !tbaa !7
  %xor66.i4137 = xor i32 %xor62.i4133, %949
  %950 = load i32, i32* %597, align 4, !tbaa !7
  %xor68.i4139 = xor i32 %xor66.i4137, %950
  %c.sroa.50.12.insert.ext5458 = zext i32 %xor68.i4139 to i64
  %c.sroa.50.12.insert.shift5459 = shl nuw i64 %c.sroa.50.12.insert.ext5458, 32
  %c.sroa.50.12.insert.insert5461 = or i64 %c.sroa.50.12.insert.shift5459, %c.sroa.50.8.insert.ext5436
  %xor989 = xor i32 %and983, 16
  %add.ptr990 = getelementptr inbounds i8, i8* %call, i32 %xor989
  %951 = bitcast i8* %add.ptr990 to i64*
  %xor992 = xor i32 %and983, 32
  %add.ptr993 = getelementptr inbounds i8, i8* %call, i32 %xor992
  %952 = bitcast i8* %add.ptr993 to i64*
  %xor995 = xor i32 %and983, 48
  %add.ptr996 = getelementptr inbounds i8, i8* %call, i32 %xor995
  %953 = bitcast i8* %add.ptr996 to i64*
  %954 = load i64, i64* %951, align 8, !tbaa !2
  %arrayidx1001 = getelementptr inbounds i8, i8* %add.ptr990, i32 8
  %955 = bitcast i8* %arrayidx1001 to i64*
  %956 = load i64, i64* %955, align 8, !tbaa !2
  %957 = load i64, i64* %952, align 8, !tbaa !2
  %arrayidx1003 = getelementptr inbounds i8, i8* %add.ptr993, i32 8
  %958 = bitcast i8* %arrayidx1003 to i64*
  %959 = load i64, i64* %958, align 8, !tbaa !2
  %960 = load i64, i64* %953, align 8, !tbaa !2
  %arrayidx1005 = getelementptr inbounds i8, i8* %add.ptr996, i32 8
  %961 = bitcast i8* %arrayidx1005 to i64*
  %962 = load i64, i64* %961, align 8, !tbaa !2
  %d.sroa.0.sroa.23.0.insert.ext = zext i32 %d.sroa.0.sroa.23.35714 to i64
  %d.sroa.0.sroa.23.0.insert.shift = shl nuw i64 %d.sroa.0.sroa.23.0.insert.ext, 32
  %d.sroa.0.sroa.0.0.insert.ext = zext i32 %d.sroa.0.sroa.0.35715 to i64
  %d.sroa.0.sroa.0.0.insert.insert = or i64 %d.sroa.0.sroa.23.0.insert.shift, %d.sroa.0.sroa.0.0.insert.ext
  %add1008 = add i64 %960, %d.sroa.0.sroa.0.0.insert.insert
  store i64 %add1008, i64* %951, align 8, !tbaa !2
  %add1012 = add i64 %962, %d.sroa.23.35716
  store i64 %add1012, i64* %955, align 8, !tbaa !2
  %963 = load i64, i64* %75, align 16, !tbaa !2
  %add1016 = add i64 %963, %957
  store i64 %add1016, i64* %953, align 8, !tbaa !2
  %964 = load i64, i64* %83, align 8, !tbaa !2
  %add1020 = add i64 %964, %959
  store i64 %add1020, i64* %961, align 8, !tbaa !2
  %965 = load i64, i64* %76, align 16, !tbaa !2
  %add1024 = add i64 %965, %954
  store i64 %add1024, i64* %952, align 8, !tbaa !2
  %966 = load i64, i64* %86, align 8, !tbaa !2
  %add1028 = add i64 %966, %956
  store i64 %add1028, i64* %958, align 8, !tbaa !2
  %c.sroa.0.sroa.45.0.insert.ext5616 = zext i32 %xor32.i4103 to i64
  %c.sroa.0.sroa.45.0.insert.shift5617 = shl nuw i64 %c.sroa.0.sroa.45.0.insert.ext5616, 32
  %c.sroa.0.sroa.0.0.insert.ext5514 = zext i32 %xor14.i4086 to i64
  %c.sroa.0.sroa.0.0.insert.insert5516 = or i64 %c.sroa.0.sroa.45.0.insert.shift5617, %c.sroa.0.sroa.0.0.insert.ext5514
  %xor1033 = xor i64 %954, %c.sroa.0.sroa.0.0.insert.insert5516
  %xor1030 = xor i64 %xor1033, %957
  %xor1037 = xor i64 %xor1030, %960
  %c.sroa.0.sroa.0.0.extract.trunc5507 = trunc i64 %xor1037 to i32
  %xor1035 = xor i64 %959, %956
  %xor1031 = xor i64 %xor1035, %c.sroa.50.12.insert.insert5461
  %xor1039 = xor i64 %xor1031, %962
  %xor.i4067 = xor i64 %965, %xor1037
  %967 = bitcast i8* %arrayidx985 to i64*
  store i64 %xor.i4067, i64* %967, align 8, !tbaa !2
  %xor5.i4070 = xor i64 %966, %xor1039
  %968 = bitcast i8* %arrayidx41.i4112 to i64*
  store i64 %xor5.i4070, i64* %968, align 8, !tbaa !2
  %and1047 = and i32 %mask.0, %c.sroa.0.sroa.0.0.extract.trunc5507
  %969 = trunc i64 %965 to i32
  br i1 %cmp345683, label %if.then1053, label %for.body980.do.end1106_crit_edge

for.body980.do.end1106_crit_edge:                 ; preds = %for.body980
  %arrayidx1108.phi.trans.insert = getelementptr inbounds i8, i8* %call, i32 %and1047
  %.phi.trans.insert = bitcast i8* %arrayidx1108.phi.trans.insert to i64*
  %.pre5775 = load i64, i64* %.phi.trans.insert, align 8, !tbaa !2
  br label %do.end1106

if.then1053:                                      ; preds = %for.body980
  %970 = trunc i64 %964 to i32
  %arrayidx1055 = getelementptr inbounds i8, i8* %call, i32 %and1047
  %t.sroa.0.0.arrayidx1055.sroa_cast = bitcast i8* %arrayidx1055 to i64*
  %t.sroa.0.0.copyload1545 = load i64, i64* %t.sroa.0.0.arrayidx1055.sroa_cast, align 1
  %971 = load i32, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 0), align 16, !tbaa !7
  %972 = load i32, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 1), align 4, !tbaa !7
  %add1056 = add i32 %972, %971
  %conv1057 = zext i32 %add1056 to i64
  %973 = load i32, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 2), align 8, !tbaa !7
  %974 = load i32, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 3), align 4, !tbaa !7
  %add1058 = add i32 %974, %973
  %conv1059 = zext i32 %add1058 to i64
  %shl1060 = shl nuw i64 %conv1059, 32
  %or1061 = or i64 %shl1060, %conv1057
  %xor1063 = xor i64 %or1061, %t.sroa.0.0.copyload1545
  store i64 %xor1063, i64* %t.sroa.0.0.arrayidx1055.sroa_cast, align 1
  store i32 %917, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 4), align 16
  store i32 %970, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 5), align 4
  store i32 %969, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 6), align 8
  store i32 %d.sroa.0.sroa.0.35715, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 7), align 4
  %d.sroa.23.8.extract.trunc = trunc i64 %d.sroa.23.35716 to i32
  store i32 %d.sroa.23.8.extract.trunc, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 8), align 16
  %975 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 0, i32 1), align 1, !tbaa !17
  %idxprom.i2735 = zext i8 %975 to i32
  %arrayidx.i2736 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom.i2735
  %976 = load i32, i32* %arrayidx.i2736, align 4, !tbaa !7
  %977 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 0, i32 0), align 16, !tbaa !16
  %conv.i2737 = zext i8 %977 to i32
  %add.ptr2.i2738 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv.i2737
  %978 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 0, i32 2), align 2, !tbaa !14
  switch i8 %978, label %sw.default.i2752 [
    i8 0, label %sw.bb.i2740
    i8 1, label %sw.bb4.i2743
    i8 2, label %sw.bb6.i2745
    i8 3, label %sw.bb7.i2747
    i8 4, label %sw.bb10.i2749
    i8 5, label %sw.bb18.i2751
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb.i2740:                                      ; preds = %if.then1053
  %979 = load i32, i32* %add.ptr2.i2738, align 4, !tbaa !7
  %mul.i2739 = mul i32 %979, %976
  br label %cleanup.cont.i2757

sw.bb4.i2743:                                     ; preds = %if.then1053
  %980 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 0, i32 3), align 4, !tbaa !18
  %add.i2741 = add i32 %980, %976
  %981 = load i32, i32* %add.ptr2.i2738, align 4, !tbaa !7
  %add5.i2742 = add i32 %add.i2741, %981
  br label %cleanup.cont.i2757

sw.bb6.i2745:                                     ; preds = %if.then1053
  %982 = load i32, i32* %add.ptr2.i2738, align 4, !tbaa !7
  %sub.i2744 = sub i32 %982, %976
  br label %cleanup.cont.i2757

sw.bb7.i2747:                                     ; preds = %if.then1053
  %983 = load i32, i32* %add.ptr2.i2738, align 4, !tbaa !7
  %or.i2746 = call i32 @llvm.fshr.i32(i32 %983, i32 %983, i32 %976) #7
  br label %cleanup.cont.i2757

sw.bb10.i2749:                                    ; preds = %if.then1053
  %984 = load i32, i32* %add.ptr2.i2738, align 4, !tbaa !7
  %or17.i2748 = call i32 @llvm.fshl.i32(i32 %984, i32 %984, i32 %976) #7
  br label %cleanup.cont.i2757

sw.bb18.i2751:                                    ; preds = %if.then1053
  %985 = load i32, i32* %add.ptr2.i2738, align 4, !tbaa !7
  %xor.i2750 = xor i32 %985, %976
  br label %cleanup.cont.i2757

sw.default.i2752:                                 ; preds = %if.then1053
  unreachable

cleanup.cont.i2757:                               ; preds = %sw.bb18.i2751, %sw.bb10.i2749, %sw.bb7.i2747, %sw.bb6.i2745, %sw.bb4.i2743, %sw.bb.i2740
  %xor.i2750.sink = phi i32 [ %xor.i2750, %sw.bb18.i2751 ], [ %or17.i2748, %sw.bb10.i2749 ], [ %or.i2746, %sw.bb7.i2747 ], [ %sub.i2744, %sw.bb6.i2745 ], [ %add5.i2742, %sw.bb4.i2743 ], [ %mul.i2739, %sw.bb.i2740 ]
  store i32 %xor.i2750.sink, i32* %add.ptr2.i2738, align 4, !tbaa !7
  %986 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 1, i32 1), align 1, !tbaa !17
  %idxprom27.i2753 = zext i8 %986 to i32
  %arrayidx28.i2754 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom27.i2753
  %987 = load i32, i32* %arrayidx28.i2754, align 4, !tbaa !7
  %988 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 1, i32 0), align 8, !tbaa !16
  %conv31.i2755 = zext i8 %988 to i32
  %add.ptr32.i2756 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv31.i2755
  %989 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 1, i32 2), align 2, !tbaa !14
  switch i8 %989, label %sw.default62.i2771 [
    i8 0, label %sw.bb35.i2759
    i8 1, label %sw.bb37.i2762
    i8 2, label %sw.bb41.i2764
    i8 3, label %sw.bb43.i2766
    i8 4, label %sw.bb51.i2768
    i8 5, label %sw.bb59.i2770
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb35.i2759:                                    ; preds = %cleanup.cont.i2757
  %990 = load i32, i32* %add.ptr32.i2756, align 4, !tbaa !7
  %mul36.i2758 = mul i32 %990, %987
  br label %cleanup.cont68.i2776

sw.bb37.i2762:                                    ; preds = %cleanup.cont.i2757
  %991 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 1, i32 3), align 4, !tbaa !18
  %add39.i2760 = add i32 %991, %987
  %992 = load i32, i32* %add.ptr32.i2756, align 4, !tbaa !7
  %add40.i2761 = add i32 %add39.i2760, %992
  br label %cleanup.cont68.i2776

sw.bb41.i2764:                                    ; preds = %cleanup.cont.i2757
  %993 = load i32, i32* %add.ptr32.i2756, align 4, !tbaa !7
  %sub42.i2763 = sub i32 %993, %987
  br label %cleanup.cont68.i2776

sw.bb43.i2766:                                    ; preds = %cleanup.cont.i2757
  %994 = load i32, i32* %add.ptr32.i2756, align 4, !tbaa !7
  %or50.i2765 = call i32 @llvm.fshr.i32(i32 %994, i32 %994, i32 %987) #7
  br label %cleanup.cont68.i2776

sw.bb51.i2768:                                    ; preds = %cleanup.cont.i2757
  %995 = load i32, i32* %add.ptr32.i2756, align 4, !tbaa !7
  %or58.i2767 = call i32 @llvm.fshl.i32(i32 %995, i32 %995, i32 %987) #7
  br label %cleanup.cont68.i2776

sw.bb59.i2770:                                    ; preds = %cleanup.cont.i2757
  %996 = load i32, i32* %add.ptr32.i2756, align 4, !tbaa !7
  %xor60.i2769 = xor i32 %996, %987
  br label %cleanup.cont68.i2776

sw.default62.i2771:                               ; preds = %cleanup.cont.i2757
  unreachable

cleanup.cont68.i2776:                             ; preds = %sw.bb59.i2770, %sw.bb51.i2768, %sw.bb43.i2766, %sw.bb41.i2764, %sw.bb37.i2762, %sw.bb35.i2759
  %xor60.i2769.sink = phi i32 [ %xor60.i2769, %sw.bb59.i2770 ], [ %or58.i2767, %sw.bb51.i2768 ], [ %or50.i2765, %sw.bb43.i2766 ], [ %sub42.i2763, %sw.bb41.i2764 ], [ %add40.i2761, %sw.bb37.i2762 ], [ %mul36.i2758, %sw.bb35.i2759 ]
  store i32 %xor60.i2769.sink, i32* %add.ptr32.i2756, align 4, !tbaa !7
  %997 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 2, i32 1), align 1, !tbaa !17
  %idxprom74.i2772 = zext i8 %997 to i32
  %arrayidx75.i2773 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom74.i2772
  %998 = load i32, i32* %arrayidx75.i2773, align 4, !tbaa !7
  %999 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 2, i32 0), align 16, !tbaa !16
  %conv78.i2774 = zext i8 %999 to i32
  %add.ptr79.i2775 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv78.i2774
  %1000 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 2, i32 2), align 2, !tbaa !14
  switch i8 %1000, label %sw.default109.i2790 [
    i8 0, label %sw.bb82.i2778
    i8 1, label %sw.bb84.i2781
    i8 2, label %sw.bb88.i2783
    i8 3, label %sw.bb90.i2785
    i8 4, label %sw.bb98.i2787
    i8 5, label %sw.bb106.i2789
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb82.i2778:                                    ; preds = %cleanup.cont68.i2776
  %1001 = load i32, i32* %add.ptr79.i2775, align 4, !tbaa !7
  %mul83.i2777 = mul i32 %1001, %998
  br label %cleanup.cont115.i2795

sw.bb84.i2781:                                    ; preds = %cleanup.cont68.i2776
  %1002 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 2, i32 3), align 4, !tbaa !18
  %add86.i2779 = add i32 %1002, %998
  %1003 = load i32, i32* %add.ptr79.i2775, align 4, !tbaa !7
  %add87.i2780 = add i32 %add86.i2779, %1003
  br label %cleanup.cont115.i2795

sw.bb88.i2783:                                    ; preds = %cleanup.cont68.i2776
  %1004 = load i32, i32* %add.ptr79.i2775, align 4, !tbaa !7
  %sub89.i2782 = sub i32 %1004, %998
  br label %cleanup.cont115.i2795

sw.bb90.i2785:                                    ; preds = %cleanup.cont68.i2776
  %1005 = load i32, i32* %add.ptr79.i2775, align 4, !tbaa !7
  %or97.i2784 = call i32 @llvm.fshr.i32(i32 %1005, i32 %1005, i32 %998) #7
  br label %cleanup.cont115.i2795

sw.bb98.i2787:                                    ; preds = %cleanup.cont68.i2776
  %1006 = load i32, i32* %add.ptr79.i2775, align 4, !tbaa !7
  %or105.i2786 = call i32 @llvm.fshl.i32(i32 %1006, i32 %1006, i32 %998) #7
  br label %cleanup.cont115.i2795

sw.bb106.i2789:                                   ; preds = %cleanup.cont68.i2776
  %1007 = load i32, i32* %add.ptr79.i2775, align 4, !tbaa !7
  %xor107.i2788 = xor i32 %1007, %998
  br label %cleanup.cont115.i2795

sw.default109.i2790:                              ; preds = %cleanup.cont68.i2776
  unreachable

cleanup.cont115.i2795:                            ; preds = %sw.bb106.i2789, %sw.bb98.i2787, %sw.bb90.i2785, %sw.bb88.i2783, %sw.bb84.i2781, %sw.bb82.i2778
  %xor107.i2788.sink = phi i32 [ %xor107.i2788, %sw.bb106.i2789 ], [ %or105.i2786, %sw.bb98.i2787 ], [ %or97.i2784, %sw.bb90.i2785 ], [ %sub89.i2782, %sw.bb88.i2783 ], [ %add87.i2780, %sw.bb84.i2781 ], [ %mul83.i2777, %sw.bb82.i2778 ]
  store i32 %xor107.i2788.sink, i32* %add.ptr79.i2775, align 4, !tbaa !7
  %1008 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 3, i32 1), align 1, !tbaa !17
  %idxprom121.i2791 = zext i8 %1008 to i32
  %arrayidx122.i2792 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom121.i2791
  %1009 = load i32, i32* %arrayidx122.i2792, align 4, !tbaa !7
  %1010 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 3, i32 0), align 8, !tbaa !16
  %conv125.i2793 = zext i8 %1010 to i32
  %add.ptr126.i2794 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv125.i2793
  %1011 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 3, i32 2), align 2, !tbaa !14
  switch i8 %1011, label %sw.default156.i2809 [
    i8 0, label %sw.bb129.i2797
    i8 1, label %sw.bb131.i2800
    i8 2, label %sw.bb135.i2802
    i8 3, label %sw.bb137.i2804
    i8 4, label %sw.bb145.i2806
    i8 5, label %sw.bb153.i2808
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb129.i2797:                                   ; preds = %cleanup.cont115.i2795
  %1012 = load i32, i32* %add.ptr126.i2794, align 4, !tbaa !7
  %mul130.i2796 = mul i32 %1012, %1009
  br label %cleanup.cont162.i2814

sw.bb131.i2800:                                   ; preds = %cleanup.cont115.i2795
  %1013 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 3, i32 3), align 4, !tbaa !18
  %add133.i2798 = add i32 %1013, %1009
  %1014 = load i32, i32* %add.ptr126.i2794, align 4, !tbaa !7
  %add134.i2799 = add i32 %add133.i2798, %1014
  br label %cleanup.cont162.i2814

sw.bb135.i2802:                                   ; preds = %cleanup.cont115.i2795
  %1015 = load i32, i32* %add.ptr126.i2794, align 4, !tbaa !7
  %sub136.i2801 = sub i32 %1015, %1009
  br label %cleanup.cont162.i2814

sw.bb137.i2804:                                   ; preds = %cleanup.cont115.i2795
  %1016 = load i32, i32* %add.ptr126.i2794, align 4, !tbaa !7
  %or144.i2803 = call i32 @llvm.fshr.i32(i32 %1016, i32 %1016, i32 %1009) #7
  br label %cleanup.cont162.i2814

sw.bb145.i2806:                                   ; preds = %cleanup.cont115.i2795
  %1017 = load i32, i32* %add.ptr126.i2794, align 4, !tbaa !7
  %or152.i2805 = call i32 @llvm.fshl.i32(i32 %1017, i32 %1017, i32 %1009) #7
  br label %cleanup.cont162.i2814

sw.bb153.i2808:                                   ; preds = %cleanup.cont115.i2795
  %1018 = load i32, i32* %add.ptr126.i2794, align 4, !tbaa !7
  %xor154.i2807 = xor i32 %1018, %1009
  br label %cleanup.cont162.i2814

sw.default156.i2809:                              ; preds = %cleanup.cont115.i2795
  unreachable

cleanup.cont162.i2814:                            ; preds = %sw.bb153.i2808, %sw.bb145.i2806, %sw.bb137.i2804, %sw.bb135.i2802, %sw.bb131.i2800, %sw.bb129.i2797
  %xor154.i2807.sink = phi i32 [ %xor154.i2807, %sw.bb153.i2808 ], [ %or152.i2805, %sw.bb145.i2806 ], [ %or144.i2803, %sw.bb137.i2804 ], [ %sub136.i2801, %sw.bb135.i2802 ], [ %add134.i2799, %sw.bb131.i2800 ], [ %mul130.i2796, %sw.bb129.i2797 ]
  store i32 %xor154.i2807.sink, i32* %add.ptr126.i2794, align 4, !tbaa !7
  %1019 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 4, i32 1), align 1, !tbaa !17
  %idxprom168.i2810 = zext i8 %1019 to i32
  %arrayidx169.i2811 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom168.i2810
  %1020 = load i32, i32* %arrayidx169.i2811, align 4, !tbaa !7
  %1021 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 4, i32 0), align 16, !tbaa !16
  %conv172.i2812 = zext i8 %1021 to i32
  %add.ptr173.i2813 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv172.i2812
  %1022 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 4, i32 2), align 2, !tbaa !14
  switch i8 %1022, label %sw.default203.i2828 [
    i8 0, label %sw.bb176.i2816
    i8 1, label %sw.bb178.i2819
    i8 2, label %sw.bb182.i2821
    i8 3, label %sw.bb184.i2823
    i8 4, label %sw.bb192.i2825
    i8 5, label %sw.bb200.i2827
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb176.i2816:                                   ; preds = %cleanup.cont162.i2814
  %1023 = load i32, i32* %add.ptr173.i2813, align 4, !tbaa !7
  %mul177.i2815 = mul i32 %1023, %1020
  br label %cleanup.cont209.i2833

sw.bb178.i2819:                                   ; preds = %cleanup.cont162.i2814
  %1024 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 4, i32 3), align 4, !tbaa !18
  %add180.i2817 = add i32 %1024, %1020
  %1025 = load i32, i32* %add.ptr173.i2813, align 4, !tbaa !7
  %add181.i2818 = add i32 %add180.i2817, %1025
  br label %cleanup.cont209.i2833

sw.bb182.i2821:                                   ; preds = %cleanup.cont162.i2814
  %1026 = load i32, i32* %add.ptr173.i2813, align 4, !tbaa !7
  %sub183.i2820 = sub i32 %1026, %1020
  br label %cleanup.cont209.i2833

sw.bb184.i2823:                                   ; preds = %cleanup.cont162.i2814
  %1027 = load i32, i32* %add.ptr173.i2813, align 4, !tbaa !7
  %or191.i2822 = call i32 @llvm.fshr.i32(i32 %1027, i32 %1027, i32 %1020) #7
  br label %cleanup.cont209.i2833

sw.bb192.i2825:                                   ; preds = %cleanup.cont162.i2814
  %1028 = load i32, i32* %add.ptr173.i2813, align 4, !tbaa !7
  %or199.i2824 = call i32 @llvm.fshl.i32(i32 %1028, i32 %1028, i32 %1020) #7
  br label %cleanup.cont209.i2833

sw.bb200.i2827:                                   ; preds = %cleanup.cont162.i2814
  %1029 = load i32, i32* %add.ptr173.i2813, align 4, !tbaa !7
  %xor201.i2826 = xor i32 %1029, %1020
  br label %cleanup.cont209.i2833

sw.default203.i2828:                              ; preds = %cleanup.cont162.i2814
  unreachable

cleanup.cont209.i2833:                            ; preds = %sw.bb200.i2827, %sw.bb192.i2825, %sw.bb184.i2823, %sw.bb182.i2821, %sw.bb178.i2819, %sw.bb176.i2816
  %xor201.i2826.sink = phi i32 [ %xor201.i2826, %sw.bb200.i2827 ], [ %or199.i2824, %sw.bb192.i2825 ], [ %or191.i2822, %sw.bb184.i2823 ], [ %sub183.i2820, %sw.bb182.i2821 ], [ %add181.i2818, %sw.bb178.i2819 ], [ %mul177.i2815, %sw.bb176.i2816 ]
  store i32 %xor201.i2826.sink, i32* %add.ptr173.i2813, align 4, !tbaa !7
  %1030 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 5, i32 1), align 1, !tbaa !17
  %idxprom215.i2829 = zext i8 %1030 to i32
  %arrayidx216.i2830 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom215.i2829
  %1031 = load i32, i32* %arrayidx216.i2830, align 4, !tbaa !7
  %1032 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 5, i32 0), align 8, !tbaa !16
  %conv219.i2831 = zext i8 %1032 to i32
  %add.ptr220.i2832 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv219.i2831
  %1033 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 5, i32 2), align 2, !tbaa !14
  switch i8 %1033, label %sw.default250.i2847 [
    i8 0, label %sw.bb223.i2835
    i8 1, label %sw.bb225.i2838
    i8 2, label %sw.bb229.i2840
    i8 3, label %sw.bb231.i2842
    i8 4, label %sw.bb239.i2844
    i8 5, label %sw.bb247.i2846
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb223.i2835:                                   ; preds = %cleanup.cont209.i2833
  %1034 = load i32, i32* %add.ptr220.i2832, align 4, !tbaa !7
  %mul224.i2834 = mul i32 %1034, %1031
  br label %cleanup.cont256.i2852

sw.bb225.i2838:                                   ; preds = %cleanup.cont209.i2833
  %1035 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 5, i32 3), align 4, !tbaa !18
  %add227.i2836 = add i32 %1035, %1031
  %1036 = load i32, i32* %add.ptr220.i2832, align 4, !tbaa !7
  %add228.i2837 = add i32 %add227.i2836, %1036
  br label %cleanup.cont256.i2852

sw.bb229.i2840:                                   ; preds = %cleanup.cont209.i2833
  %1037 = load i32, i32* %add.ptr220.i2832, align 4, !tbaa !7
  %sub230.i2839 = sub i32 %1037, %1031
  br label %cleanup.cont256.i2852

sw.bb231.i2842:                                   ; preds = %cleanup.cont209.i2833
  %1038 = load i32, i32* %add.ptr220.i2832, align 4, !tbaa !7
  %or238.i2841 = call i32 @llvm.fshr.i32(i32 %1038, i32 %1038, i32 %1031) #7
  br label %cleanup.cont256.i2852

sw.bb239.i2844:                                   ; preds = %cleanup.cont209.i2833
  %1039 = load i32, i32* %add.ptr220.i2832, align 4, !tbaa !7
  %or246.i2843 = call i32 @llvm.fshl.i32(i32 %1039, i32 %1039, i32 %1031) #7
  br label %cleanup.cont256.i2852

sw.bb247.i2846:                                   ; preds = %cleanup.cont209.i2833
  %1040 = load i32, i32* %add.ptr220.i2832, align 4, !tbaa !7
  %xor248.i2845 = xor i32 %1040, %1031
  br label %cleanup.cont256.i2852

sw.default250.i2847:                              ; preds = %cleanup.cont209.i2833
  unreachable

cleanup.cont256.i2852:                            ; preds = %sw.bb247.i2846, %sw.bb239.i2844, %sw.bb231.i2842, %sw.bb229.i2840, %sw.bb225.i2838, %sw.bb223.i2835
  %xor248.i2845.sink = phi i32 [ %xor248.i2845, %sw.bb247.i2846 ], [ %or246.i2843, %sw.bb239.i2844 ], [ %or238.i2841, %sw.bb231.i2842 ], [ %sub230.i2839, %sw.bb229.i2840 ], [ %add228.i2837, %sw.bb225.i2838 ], [ %mul224.i2834, %sw.bb223.i2835 ]
  store i32 %xor248.i2845.sink, i32* %add.ptr220.i2832, align 4, !tbaa !7
  %1041 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 6, i32 1), align 1, !tbaa !17
  %idxprom262.i2848 = zext i8 %1041 to i32
  %arrayidx263.i2849 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom262.i2848
  %1042 = load i32, i32* %arrayidx263.i2849, align 4, !tbaa !7
  %1043 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 6, i32 0), align 16, !tbaa !16
  %conv266.i2850 = zext i8 %1043 to i32
  %add.ptr267.i2851 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv266.i2850
  %1044 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 6, i32 2), align 2, !tbaa !14
  switch i8 %1044, label %sw.default297.i2866 [
    i8 0, label %sw.bb270.i2854
    i8 1, label %sw.bb272.i2857
    i8 2, label %sw.bb276.i2859
    i8 3, label %sw.bb278.i2861
    i8 4, label %sw.bb286.i2863
    i8 5, label %sw.bb294.i2865
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb270.i2854:                                   ; preds = %cleanup.cont256.i2852
  %1045 = load i32, i32* %add.ptr267.i2851, align 4, !tbaa !7
  %mul271.i2853 = mul i32 %1045, %1042
  br label %cleanup.cont303.i2871

sw.bb272.i2857:                                   ; preds = %cleanup.cont256.i2852
  %1046 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 6, i32 3), align 4, !tbaa !18
  %add274.i2855 = add i32 %1046, %1042
  %1047 = load i32, i32* %add.ptr267.i2851, align 4, !tbaa !7
  %add275.i2856 = add i32 %add274.i2855, %1047
  br label %cleanup.cont303.i2871

sw.bb276.i2859:                                   ; preds = %cleanup.cont256.i2852
  %1048 = load i32, i32* %add.ptr267.i2851, align 4, !tbaa !7
  %sub277.i2858 = sub i32 %1048, %1042
  br label %cleanup.cont303.i2871

sw.bb278.i2861:                                   ; preds = %cleanup.cont256.i2852
  %1049 = load i32, i32* %add.ptr267.i2851, align 4, !tbaa !7
  %or285.i2860 = call i32 @llvm.fshr.i32(i32 %1049, i32 %1049, i32 %1042) #7
  br label %cleanup.cont303.i2871

sw.bb286.i2863:                                   ; preds = %cleanup.cont256.i2852
  %1050 = load i32, i32* %add.ptr267.i2851, align 4, !tbaa !7
  %or293.i2862 = call i32 @llvm.fshl.i32(i32 %1050, i32 %1050, i32 %1042) #7
  br label %cleanup.cont303.i2871

sw.bb294.i2865:                                   ; preds = %cleanup.cont256.i2852
  %1051 = load i32, i32* %add.ptr267.i2851, align 4, !tbaa !7
  %xor295.i2864 = xor i32 %1051, %1042
  br label %cleanup.cont303.i2871

sw.default297.i2866:                              ; preds = %cleanup.cont256.i2852
  unreachable

cleanup.cont303.i2871:                            ; preds = %sw.bb294.i2865, %sw.bb286.i2863, %sw.bb278.i2861, %sw.bb276.i2859, %sw.bb272.i2857, %sw.bb270.i2854
  %xor295.i2864.sink = phi i32 [ %xor295.i2864, %sw.bb294.i2865 ], [ %or293.i2862, %sw.bb286.i2863 ], [ %or285.i2860, %sw.bb278.i2861 ], [ %sub277.i2858, %sw.bb276.i2859 ], [ %add275.i2856, %sw.bb272.i2857 ], [ %mul271.i2853, %sw.bb270.i2854 ]
  store i32 %xor295.i2864.sink, i32* %add.ptr267.i2851, align 4, !tbaa !7
  %1052 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 7, i32 1), align 1, !tbaa !17
  %idxprom309.i2867 = zext i8 %1052 to i32
  %arrayidx310.i2868 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom309.i2867
  %1053 = load i32, i32* %arrayidx310.i2868, align 4, !tbaa !7
  %1054 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 7, i32 0), align 8, !tbaa !16
  %conv313.i2869 = zext i8 %1054 to i32
  %add.ptr314.i2870 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv313.i2869
  %1055 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 7, i32 2), align 2, !tbaa !14
  switch i8 %1055, label %sw.default344.i2885 [
    i8 0, label %sw.bb317.i2873
    i8 1, label %sw.bb319.i2876
    i8 2, label %sw.bb323.i2878
    i8 3, label %sw.bb325.i2880
    i8 4, label %sw.bb333.i2882
    i8 5, label %sw.bb341.i2884
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb317.i2873:                                   ; preds = %cleanup.cont303.i2871
  %1056 = load i32, i32* %add.ptr314.i2870, align 4, !tbaa !7
  %mul318.i2872 = mul i32 %1056, %1053
  br label %cleanup.cont350.i2890

sw.bb319.i2876:                                   ; preds = %cleanup.cont303.i2871
  %1057 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 7, i32 3), align 4, !tbaa !18
  %add321.i2874 = add i32 %1057, %1053
  %1058 = load i32, i32* %add.ptr314.i2870, align 4, !tbaa !7
  %add322.i2875 = add i32 %add321.i2874, %1058
  br label %cleanup.cont350.i2890

sw.bb323.i2878:                                   ; preds = %cleanup.cont303.i2871
  %1059 = load i32, i32* %add.ptr314.i2870, align 4, !tbaa !7
  %sub324.i2877 = sub i32 %1059, %1053
  br label %cleanup.cont350.i2890

sw.bb325.i2880:                                   ; preds = %cleanup.cont303.i2871
  %1060 = load i32, i32* %add.ptr314.i2870, align 4, !tbaa !7
  %or332.i2879 = call i32 @llvm.fshr.i32(i32 %1060, i32 %1060, i32 %1053) #7
  br label %cleanup.cont350.i2890

sw.bb333.i2882:                                   ; preds = %cleanup.cont303.i2871
  %1061 = load i32, i32* %add.ptr314.i2870, align 4, !tbaa !7
  %or340.i2881 = call i32 @llvm.fshl.i32(i32 %1061, i32 %1061, i32 %1053) #7
  br label %cleanup.cont350.i2890

sw.bb341.i2884:                                   ; preds = %cleanup.cont303.i2871
  %1062 = load i32, i32* %add.ptr314.i2870, align 4, !tbaa !7
  %xor342.i2883 = xor i32 %1062, %1053
  br label %cleanup.cont350.i2890

sw.default344.i2885:                              ; preds = %cleanup.cont303.i2871
  unreachable

cleanup.cont350.i2890:                            ; preds = %sw.bb341.i2884, %sw.bb333.i2882, %sw.bb325.i2880, %sw.bb323.i2878, %sw.bb319.i2876, %sw.bb317.i2873
  %xor342.i2883.sink = phi i32 [ %xor342.i2883, %sw.bb341.i2884 ], [ %or340.i2881, %sw.bb333.i2882 ], [ %or332.i2879, %sw.bb325.i2880 ], [ %sub324.i2877, %sw.bb323.i2878 ], [ %add322.i2875, %sw.bb319.i2876 ], [ %mul318.i2872, %sw.bb317.i2873 ]
  store i32 %xor342.i2883.sink, i32* %add.ptr314.i2870, align 4, !tbaa !7
  %1063 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 8, i32 1), align 1, !tbaa !17
  %idxprom356.i2886 = zext i8 %1063 to i32
  %arrayidx357.i2887 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom356.i2886
  %1064 = load i32, i32* %arrayidx357.i2887, align 4, !tbaa !7
  %1065 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 8, i32 0), align 16, !tbaa !16
  %conv360.i2888 = zext i8 %1065 to i32
  %add.ptr361.i2889 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv360.i2888
  %1066 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 8, i32 2), align 2, !tbaa !14
  switch i8 %1066, label %sw.default391.i2904 [
    i8 0, label %sw.bb364.i2892
    i8 1, label %sw.bb366.i2895
    i8 2, label %sw.bb370.i2897
    i8 3, label %sw.bb372.i2899
    i8 4, label %sw.bb380.i2901
    i8 5, label %sw.bb388.i2903
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb364.i2892:                                   ; preds = %cleanup.cont350.i2890
  %1067 = load i32, i32* %add.ptr361.i2889, align 4, !tbaa !7
  %mul365.i2891 = mul i32 %1067, %1064
  br label %cleanup.cont397.i2909

sw.bb366.i2895:                                   ; preds = %cleanup.cont350.i2890
  %1068 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 8, i32 3), align 4, !tbaa !18
  %add368.i2893 = add i32 %1068, %1064
  %1069 = load i32, i32* %add.ptr361.i2889, align 4, !tbaa !7
  %add369.i2894 = add i32 %add368.i2893, %1069
  br label %cleanup.cont397.i2909

sw.bb370.i2897:                                   ; preds = %cleanup.cont350.i2890
  %1070 = load i32, i32* %add.ptr361.i2889, align 4, !tbaa !7
  %sub371.i2896 = sub i32 %1070, %1064
  br label %cleanup.cont397.i2909

sw.bb372.i2899:                                   ; preds = %cleanup.cont350.i2890
  %1071 = load i32, i32* %add.ptr361.i2889, align 4, !tbaa !7
  %or379.i2898 = call i32 @llvm.fshr.i32(i32 %1071, i32 %1071, i32 %1064) #7
  br label %cleanup.cont397.i2909

sw.bb380.i2901:                                   ; preds = %cleanup.cont350.i2890
  %1072 = load i32, i32* %add.ptr361.i2889, align 4, !tbaa !7
  %or387.i2900 = call i32 @llvm.fshl.i32(i32 %1072, i32 %1072, i32 %1064) #7
  br label %cleanup.cont397.i2909

sw.bb388.i2903:                                   ; preds = %cleanup.cont350.i2890
  %1073 = load i32, i32* %add.ptr361.i2889, align 4, !tbaa !7
  %xor389.i2902 = xor i32 %1073, %1064
  br label %cleanup.cont397.i2909

sw.default391.i2904:                              ; preds = %cleanup.cont350.i2890
  unreachable

cleanup.cont397.i2909:                            ; preds = %sw.bb388.i2903, %sw.bb380.i2901, %sw.bb372.i2899, %sw.bb370.i2897, %sw.bb366.i2895, %sw.bb364.i2892
  %xor389.i2902.sink = phi i32 [ %xor389.i2902, %sw.bb388.i2903 ], [ %or387.i2900, %sw.bb380.i2901 ], [ %or379.i2898, %sw.bb372.i2899 ], [ %sub371.i2896, %sw.bb370.i2897 ], [ %add369.i2894, %sw.bb366.i2895 ], [ %mul365.i2891, %sw.bb364.i2892 ]
  store i32 %xor389.i2902.sink, i32* %add.ptr361.i2889, align 4, !tbaa !7
  %1074 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 9, i32 1), align 1, !tbaa !17
  %idxprom403.i2905 = zext i8 %1074 to i32
  %arrayidx404.i2906 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom403.i2905
  %1075 = load i32, i32* %arrayidx404.i2906, align 4, !tbaa !7
  %1076 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 9, i32 0), align 8, !tbaa !16
  %conv407.i2907 = zext i8 %1076 to i32
  %add.ptr408.i2908 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv407.i2907
  %1077 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 9, i32 2), align 2, !tbaa !14
  switch i8 %1077, label %sw.default438.i2923 [
    i8 0, label %sw.bb411.i2911
    i8 1, label %sw.bb413.i2914
    i8 2, label %sw.bb417.i2916
    i8 3, label %sw.bb419.i2918
    i8 4, label %sw.bb427.i2920
    i8 5, label %sw.bb435.i2922
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb411.i2911:                                   ; preds = %cleanup.cont397.i2909
  %1078 = load i32, i32* %add.ptr408.i2908, align 4, !tbaa !7
  %mul412.i2910 = mul i32 %1078, %1075
  br label %cleanup.cont444.i2928

sw.bb413.i2914:                                   ; preds = %cleanup.cont397.i2909
  %1079 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 9, i32 3), align 4, !tbaa !18
  %add415.i2912 = add i32 %1079, %1075
  %1080 = load i32, i32* %add.ptr408.i2908, align 4, !tbaa !7
  %add416.i2913 = add i32 %add415.i2912, %1080
  br label %cleanup.cont444.i2928

sw.bb417.i2916:                                   ; preds = %cleanup.cont397.i2909
  %1081 = load i32, i32* %add.ptr408.i2908, align 4, !tbaa !7
  %sub418.i2915 = sub i32 %1081, %1075
  br label %cleanup.cont444.i2928

sw.bb419.i2918:                                   ; preds = %cleanup.cont397.i2909
  %1082 = load i32, i32* %add.ptr408.i2908, align 4, !tbaa !7
  %or426.i2917 = call i32 @llvm.fshr.i32(i32 %1082, i32 %1082, i32 %1075) #7
  br label %cleanup.cont444.i2928

sw.bb427.i2920:                                   ; preds = %cleanup.cont397.i2909
  %1083 = load i32, i32* %add.ptr408.i2908, align 4, !tbaa !7
  %or434.i2919 = call i32 @llvm.fshl.i32(i32 %1083, i32 %1083, i32 %1075) #7
  br label %cleanup.cont444.i2928

sw.bb435.i2922:                                   ; preds = %cleanup.cont397.i2909
  %1084 = load i32, i32* %add.ptr408.i2908, align 4, !tbaa !7
  %xor436.i2921 = xor i32 %1084, %1075
  br label %cleanup.cont444.i2928

sw.default438.i2923:                              ; preds = %cleanup.cont397.i2909
  unreachable

cleanup.cont444.i2928:                            ; preds = %sw.bb435.i2922, %sw.bb427.i2920, %sw.bb419.i2918, %sw.bb417.i2916, %sw.bb413.i2914, %sw.bb411.i2911
  %xor436.i2921.sink = phi i32 [ %xor436.i2921, %sw.bb435.i2922 ], [ %or434.i2919, %sw.bb427.i2920 ], [ %or426.i2917, %sw.bb419.i2918 ], [ %sub418.i2915, %sw.bb417.i2916 ], [ %add416.i2913, %sw.bb413.i2914 ], [ %mul412.i2910, %sw.bb411.i2911 ]
  store i32 %xor436.i2921.sink, i32* %add.ptr408.i2908, align 4, !tbaa !7
  %1085 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 10, i32 1), align 1, !tbaa !17
  %idxprom450.i2924 = zext i8 %1085 to i32
  %arrayidx451.i2925 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom450.i2924
  %1086 = load i32, i32* %arrayidx451.i2925, align 4, !tbaa !7
  %1087 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 10, i32 0), align 16, !tbaa !16
  %conv454.i2926 = zext i8 %1087 to i32
  %add.ptr455.i2927 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv454.i2926
  %1088 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 10, i32 2), align 2, !tbaa !14
  switch i8 %1088, label %sw.default485.i2942 [
    i8 0, label %sw.bb458.i2930
    i8 1, label %sw.bb460.i2933
    i8 2, label %sw.bb464.i2935
    i8 3, label %sw.bb466.i2937
    i8 4, label %sw.bb474.i2939
    i8 5, label %sw.bb482.i2941
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb458.i2930:                                   ; preds = %cleanup.cont444.i2928
  %1089 = load i32, i32* %add.ptr455.i2927, align 4, !tbaa !7
  %mul459.i2929 = mul i32 %1089, %1086
  br label %cleanup.cont491.i2947

sw.bb460.i2933:                                   ; preds = %cleanup.cont444.i2928
  %1090 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 10, i32 3), align 4, !tbaa !18
  %add462.i2931 = add i32 %1090, %1086
  %1091 = load i32, i32* %add.ptr455.i2927, align 4, !tbaa !7
  %add463.i2932 = add i32 %add462.i2931, %1091
  br label %cleanup.cont491.i2947

sw.bb464.i2935:                                   ; preds = %cleanup.cont444.i2928
  %1092 = load i32, i32* %add.ptr455.i2927, align 4, !tbaa !7
  %sub465.i2934 = sub i32 %1092, %1086
  br label %cleanup.cont491.i2947

sw.bb466.i2937:                                   ; preds = %cleanup.cont444.i2928
  %1093 = load i32, i32* %add.ptr455.i2927, align 4, !tbaa !7
  %or473.i2936 = call i32 @llvm.fshr.i32(i32 %1093, i32 %1093, i32 %1086) #7
  br label %cleanup.cont491.i2947

sw.bb474.i2939:                                   ; preds = %cleanup.cont444.i2928
  %1094 = load i32, i32* %add.ptr455.i2927, align 4, !tbaa !7
  %or481.i2938 = call i32 @llvm.fshl.i32(i32 %1094, i32 %1094, i32 %1086) #7
  br label %cleanup.cont491.i2947

sw.bb482.i2941:                                   ; preds = %cleanup.cont444.i2928
  %1095 = load i32, i32* %add.ptr455.i2927, align 4, !tbaa !7
  %xor483.i2940 = xor i32 %1095, %1086
  br label %cleanup.cont491.i2947

sw.default485.i2942:                              ; preds = %cleanup.cont444.i2928
  unreachable

cleanup.cont491.i2947:                            ; preds = %sw.bb482.i2941, %sw.bb474.i2939, %sw.bb466.i2937, %sw.bb464.i2935, %sw.bb460.i2933, %sw.bb458.i2930
  %xor483.i2940.sink = phi i32 [ %xor483.i2940, %sw.bb482.i2941 ], [ %or481.i2938, %sw.bb474.i2939 ], [ %or473.i2936, %sw.bb466.i2937 ], [ %sub465.i2934, %sw.bb464.i2935 ], [ %add463.i2932, %sw.bb460.i2933 ], [ %mul459.i2929, %sw.bb458.i2930 ]
  store i32 %xor483.i2940.sink, i32* %add.ptr455.i2927, align 4, !tbaa !7
  %1096 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 11, i32 1), align 1, !tbaa !17
  %idxprom497.i2943 = zext i8 %1096 to i32
  %arrayidx498.i2944 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom497.i2943
  %1097 = load i32, i32* %arrayidx498.i2944, align 4, !tbaa !7
  %1098 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 11, i32 0), align 8, !tbaa !16
  %conv501.i2945 = zext i8 %1098 to i32
  %add.ptr502.i2946 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv501.i2945
  %1099 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 11, i32 2), align 2, !tbaa !14
  switch i8 %1099, label %sw.default532.i2961 [
    i8 0, label %sw.bb505.i2949
    i8 1, label %sw.bb507.i2952
    i8 2, label %sw.bb511.i2954
    i8 3, label %sw.bb513.i2956
    i8 4, label %sw.bb521.i2958
    i8 5, label %sw.bb529.i2960
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb505.i2949:                                   ; preds = %cleanup.cont491.i2947
  %1100 = load i32, i32* %add.ptr502.i2946, align 4, !tbaa !7
  %mul506.i2948 = mul i32 %1100, %1097
  br label %cleanup.cont538.i2966

sw.bb507.i2952:                                   ; preds = %cleanup.cont491.i2947
  %1101 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 11, i32 3), align 4, !tbaa !18
  %add509.i2950 = add i32 %1101, %1097
  %1102 = load i32, i32* %add.ptr502.i2946, align 4, !tbaa !7
  %add510.i2951 = add i32 %add509.i2950, %1102
  br label %cleanup.cont538.i2966

sw.bb511.i2954:                                   ; preds = %cleanup.cont491.i2947
  %1103 = load i32, i32* %add.ptr502.i2946, align 4, !tbaa !7
  %sub512.i2953 = sub i32 %1103, %1097
  br label %cleanup.cont538.i2966

sw.bb513.i2956:                                   ; preds = %cleanup.cont491.i2947
  %1104 = load i32, i32* %add.ptr502.i2946, align 4, !tbaa !7
  %or520.i2955 = call i32 @llvm.fshr.i32(i32 %1104, i32 %1104, i32 %1097) #7
  br label %cleanup.cont538.i2966

sw.bb521.i2958:                                   ; preds = %cleanup.cont491.i2947
  %1105 = load i32, i32* %add.ptr502.i2946, align 4, !tbaa !7
  %or528.i2957 = call i32 @llvm.fshl.i32(i32 %1105, i32 %1105, i32 %1097) #7
  br label %cleanup.cont538.i2966

sw.bb529.i2960:                                   ; preds = %cleanup.cont491.i2947
  %1106 = load i32, i32* %add.ptr502.i2946, align 4, !tbaa !7
  %xor530.i2959 = xor i32 %1106, %1097
  br label %cleanup.cont538.i2966

sw.default532.i2961:                              ; preds = %cleanup.cont491.i2947
  unreachable

cleanup.cont538.i2966:                            ; preds = %sw.bb529.i2960, %sw.bb521.i2958, %sw.bb513.i2956, %sw.bb511.i2954, %sw.bb507.i2952, %sw.bb505.i2949
  %xor530.i2959.sink = phi i32 [ %xor530.i2959, %sw.bb529.i2960 ], [ %or528.i2957, %sw.bb521.i2958 ], [ %or520.i2955, %sw.bb513.i2956 ], [ %sub512.i2953, %sw.bb511.i2954 ], [ %add510.i2951, %sw.bb507.i2952 ], [ %mul506.i2948, %sw.bb505.i2949 ]
  store i32 %xor530.i2959.sink, i32* %add.ptr502.i2946, align 4, !tbaa !7
  %1107 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 12, i32 1), align 1, !tbaa !17
  %idxprom544.i2962 = zext i8 %1107 to i32
  %arrayidx545.i2963 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom544.i2962
  %1108 = load i32, i32* %arrayidx545.i2963, align 4, !tbaa !7
  %1109 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 12, i32 0), align 16, !tbaa !16
  %conv548.i2964 = zext i8 %1109 to i32
  %add.ptr549.i2965 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv548.i2964
  %1110 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 12, i32 2), align 2, !tbaa !14
  switch i8 %1110, label %sw.default579.i2980 [
    i8 0, label %sw.bb552.i2968
    i8 1, label %sw.bb554.i2971
    i8 2, label %sw.bb558.i2973
    i8 3, label %sw.bb560.i2975
    i8 4, label %sw.bb568.i2977
    i8 5, label %sw.bb576.i2979
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb552.i2968:                                   ; preds = %cleanup.cont538.i2966
  %1111 = load i32, i32* %add.ptr549.i2965, align 4, !tbaa !7
  %mul553.i2967 = mul i32 %1111, %1108
  br label %cleanup.cont585.i2985

sw.bb554.i2971:                                   ; preds = %cleanup.cont538.i2966
  %1112 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 12, i32 3), align 4, !tbaa !18
  %add556.i2969 = add i32 %1112, %1108
  %1113 = load i32, i32* %add.ptr549.i2965, align 4, !tbaa !7
  %add557.i2970 = add i32 %add556.i2969, %1113
  br label %cleanup.cont585.i2985

sw.bb558.i2973:                                   ; preds = %cleanup.cont538.i2966
  %1114 = load i32, i32* %add.ptr549.i2965, align 4, !tbaa !7
  %sub559.i2972 = sub i32 %1114, %1108
  br label %cleanup.cont585.i2985

sw.bb560.i2975:                                   ; preds = %cleanup.cont538.i2966
  %1115 = load i32, i32* %add.ptr549.i2965, align 4, !tbaa !7
  %or567.i2974 = call i32 @llvm.fshr.i32(i32 %1115, i32 %1115, i32 %1108) #7
  br label %cleanup.cont585.i2985

sw.bb568.i2977:                                   ; preds = %cleanup.cont538.i2966
  %1116 = load i32, i32* %add.ptr549.i2965, align 4, !tbaa !7
  %or575.i2976 = call i32 @llvm.fshl.i32(i32 %1116, i32 %1116, i32 %1108) #7
  br label %cleanup.cont585.i2985

sw.bb576.i2979:                                   ; preds = %cleanup.cont538.i2966
  %1117 = load i32, i32* %add.ptr549.i2965, align 4, !tbaa !7
  %xor577.i2978 = xor i32 %1117, %1108
  br label %cleanup.cont585.i2985

sw.default579.i2980:                              ; preds = %cleanup.cont538.i2966
  unreachable

cleanup.cont585.i2985:                            ; preds = %sw.bb576.i2979, %sw.bb568.i2977, %sw.bb560.i2975, %sw.bb558.i2973, %sw.bb554.i2971, %sw.bb552.i2968
  %xor577.i2978.sink = phi i32 [ %xor577.i2978, %sw.bb576.i2979 ], [ %or575.i2976, %sw.bb568.i2977 ], [ %or567.i2974, %sw.bb560.i2975 ], [ %sub559.i2972, %sw.bb558.i2973 ], [ %add557.i2970, %sw.bb554.i2971 ], [ %mul553.i2967, %sw.bb552.i2968 ]
  store i32 %xor577.i2978.sink, i32* %add.ptr549.i2965, align 4, !tbaa !7
  %1118 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 13, i32 1), align 1, !tbaa !17
  %idxprom591.i2981 = zext i8 %1118 to i32
  %arrayidx592.i2982 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom591.i2981
  %1119 = load i32, i32* %arrayidx592.i2982, align 4, !tbaa !7
  %1120 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 13, i32 0), align 8, !tbaa !16
  %conv595.i2983 = zext i8 %1120 to i32
  %add.ptr596.i2984 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv595.i2983
  %1121 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 13, i32 2), align 2, !tbaa !14
  switch i8 %1121, label %sw.default626.i2999 [
    i8 0, label %sw.bb599.i2987
    i8 1, label %sw.bb601.i2990
    i8 2, label %sw.bb605.i2992
    i8 3, label %sw.bb607.i2994
    i8 4, label %sw.bb615.i2996
    i8 5, label %sw.bb623.i2998
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb599.i2987:                                   ; preds = %cleanup.cont585.i2985
  %1122 = load i32, i32* %add.ptr596.i2984, align 4, !tbaa !7
  %mul600.i2986 = mul i32 %1122, %1119
  br label %cleanup.cont632.i3004

sw.bb601.i2990:                                   ; preds = %cleanup.cont585.i2985
  %1123 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 13, i32 3), align 4, !tbaa !18
  %add603.i2988 = add i32 %1123, %1119
  %1124 = load i32, i32* %add.ptr596.i2984, align 4, !tbaa !7
  %add604.i2989 = add i32 %add603.i2988, %1124
  br label %cleanup.cont632.i3004

sw.bb605.i2992:                                   ; preds = %cleanup.cont585.i2985
  %1125 = load i32, i32* %add.ptr596.i2984, align 4, !tbaa !7
  %sub606.i2991 = sub i32 %1125, %1119
  br label %cleanup.cont632.i3004

sw.bb607.i2994:                                   ; preds = %cleanup.cont585.i2985
  %1126 = load i32, i32* %add.ptr596.i2984, align 4, !tbaa !7
  %or614.i2993 = call i32 @llvm.fshr.i32(i32 %1126, i32 %1126, i32 %1119) #7
  br label %cleanup.cont632.i3004

sw.bb615.i2996:                                   ; preds = %cleanup.cont585.i2985
  %1127 = load i32, i32* %add.ptr596.i2984, align 4, !tbaa !7
  %or622.i2995 = call i32 @llvm.fshl.i32(i32 %1127, i32 %1127, i32 %1119) #7
  br label %cleanup.cont632.i3004

sw.bb623.i2998:                                   ; preds = %cleanup.cont585.i2985
  %1128 = load i32, i32* %add.ptr596.i2984, align 4, !tbaa !7
  %xor624.i2997 = xor i32 %1128, %1119
  br label %cleanup.cont632.i3004

sw.default626.i2999:                              ; preds = %cleanup.cont585.i2985
  unreachable

cleanup.cont632.i3004:                            ; preds = %sw.bb623.i2998, %sw.bb615.i2996, %sw.bb607.i2994, %sw.bb605.i2992, %sw.bb601.i2990, %sw.bb599.i2987
  %xor624.i2997.sink = phi i32 [ %xor624.i2997, %sw.bb623.i2998 ], [ %or622.i2995, %sw.bb615.i2996 ], [ %or614.i2993, %sw.bb607.i2994 ], [ %sub606.i2991, %sw.bb605.i2992 ], [ %add604.i2989, %sw.bb601.i2990 ], [ %mul600.i2986, %sw.bb599.i2987 ]
  store i32 %xor624.i2997.sink, i32* %add.ptr596.i2984, align 4, !tbaa !7
  %1129 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 14, i32 1), align 1, !tbaa !17
  %idxprom638.i3000 = zext i8 %1129 to i32
  %arrayidx639.i3001 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom638.i3000
  %1130 = load i32, i32* %arrayidx639.i3001, align 4, !tbaa !7
  %1131 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 14, i32 0), align 16, !tbaa !16
  %conv642.i3002 = zext i8 %1131 to i32
  %add.ptr643.i3003 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv642.i3002
  %1132 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 14, i32 2), align 2, !tbaa !14
  switch i8 %1132, label %sw.default673.i3018 [
    i8 0, label %sw.bb646.i3006
    i8 1, label %sw.bb648.i3009
    i8 2, label %sw.bb652.i3011
    i8 3, label %sw.bb654.i3013
    i8 4, label %sw.bb662.i3015
    i8 5, label %sw.bb670.i3017
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb646.i3006:                                   ; preds = %cleanup.cont632.i3004
  %1133 = load i32, i32* %add.ptr643.i3003, align 4, !tbaa !7
  %mul647.i3005 = mul i32 %1133, %1130
  br label %cleanup.cont679.i3023

sw.bb648.i3009:                                   ; preds = %cleanup.cont632.i3004
  %1134 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 14, i32 3), align 4, !tbaa !18
  %add650.i3007 = add i32 %1134, %1130
  %1135 = load i32, i32* %add.ptr643.i3003, align 4, !tbaa !7
  %add651.i3008 = add i32 %add650.i3007, %1135
  br label %cleanup.cont679.i3023

sw.bb652.i3011:                                   ; preds = %cleanup.cont632.i3004
  %1136 = load i32, i32* %add.ptr643.i3003, align 4, !tbaa !7
  %sub653.i3010 = sub i32 %1136, %1130
  br label %cleanup.cont679.i3023

sw.bb654.i3013:                                   ; preds = %cleanup.cont632.i3004
  %1137 = load i32, i32* %add.ptr643.i3003, align 4, !tbaa !7
  %or661.i3012 = call i32 @llvm.fshr.i32(i32 %1137, i32 %1137, i32 %1130) #7
  br label %cleanup.cont679.i3023

sw.bb662.i3015:                                   ; preds = %cleanup.cont632.i3004
  %1138 = load i32, i32* %add.ptr643.i3003, align 4, !tbaa !7
  %or669.i3014 = call i32 @llvm.fshl.i32(i32 %1138, i32 %1138, i32 %1130) #7
  br label %cleanup.cont679.i3023

sw.bb670.i3017:                                   ; preds = %cleanup.cont632.i3004
  %1139 = load i32, i32* %add.ptr643.i3003, align 4, !tbaa !7
  %xor671.i3016 = xor i32 %1139, %1130
  br label %cleanup.cont679.i3023

sw.default673.i3018:                              ; preds = %cleanup.cont632.i3004
  unreachable

cleanup.cont679.i3023:                            ; preds = %sw.bb670.i3017, %sw.bb662.i3015, %sw.bb654.i3013, %sw.bb652.i3011, %sw.bb648.i3009, %sw.bb646.i3006
  %xor671.i3016.sink = phi i32 [ %xor671.i3016, %sw.bb670.i3017 ], [ %or669.i3014, %sw.bb662.i3015 ], [ %or661.i3012, %sw.bb654.i3013 ], [ %sub653.i3010, %sw.bb652.i3011 ], [ %add651.i3008, %sw.bb648.i3009 ], [ %mul647.i3005, %sw.bb646.i3006 ]
  store i32 %xor671.i3016.sink, i32* %add.ptr643.i3003, align 4, !tbaa !7
  %1140 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 15, i32 1), align 1, !tbaa !17
  %idxprom685.i3019 = zext i8 %1140 to i32
  %arrayidx686.i3020 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom685.i3019
  %1141 = load i32, i32* %arrayidx686.i3020, align 4, !tbaa !7
  %1142 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 15, i32 0), align 8, !tbaa !16
  %conv689.i3021 = zext i8 %1142 to i32
  %add.ptr690.i3022 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv689.i3021
  %1143 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 15, i32 2), align 2, !tbaa !14
  switch i8 %1143, label %sw.default720.i3037 [
    i8 0, label %sw.bb693.i3025
    i8 1, label %sw.bb695.i3028
    i8 2, label %sw.bb699.i3030
    i8 3, label %sw.bb701.i3032
    i8 4, label %sw.bb709.i3034
    i8 5, label %sw.bb717.i3036
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb693.i3025:                                   ; preds = %cleanup.cont679.i3023
  %1144 = load i32, i32* %add.ptr690.i3022, align 4, !tbaa !7
  %mul694.i3024 = mul i32 %1144, %1141
  br label %cleanup.cont726.i3042

sw.bb695.i3028:                                   ; preds = %cleanup.cont679.i3023
  %1145 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 15, i32 3), align 4, !tbaa !18
  %add697.i3026 = add i32 %1145, %1141
  %1146 = load i32, i32* %add.ptr690.i3022, align 4, !tbaa !7
  %add698.i3027 = add i32 %add697.i3026, %1146
  br label %cleanup.cont726.i3042

sw.bb699.i3030:                                   ; preds = %cleanup.cont679.i3023
  %1147 = load i32, i32* %add.ptr690.i3022, align 4, !tbaa !7
  %sub700.i3029 = sub i32 %1147, %1141
  br label %cleanup.cont726.i3042

sw.bb701.i3032:                                   ; preds = %cleanup.cont679.i3023
  %1148 = load i32, i32* %add.ptr690.i3022, align 4, !tbaa !7
  %or708.i3031 = call i32 @llvm.fshr.i32(i32 %1148, i32 %1148, i32 %1141) #7
  br label %cleanup.cont726.i3042

sw.bb709.i3034:                                   ; preds = %cleanup.cont679.i3023
  %1149 = load i32, i32* %add.ptr690.i3022, align 4, !tbaa !7
  %or716.i3033 = call i32 @llvm.fshl.i32(i32 %1149, i32 %1149, i32 %1141) #7
  br label %cleanup.cont726.i3042

sw.bb717.i3036:                                   ; preds = %cleanup.cont679.i3023
  %1150 = load i32, i32* %add.ptr690.i3022, align 4, !tbaa !7
  %xor718.i3035 = xor i32 %1150, %1141
  br label %cleanup.cont726.i3042

sw.default720.i3037:                              ; preds = %cleanup.cont679.i3023
  unreachable

cleanup.cont726.i3042:                            ; preds = %sw.bb717.i3036, %sw.bb709.i3034, %sw.bb701.i3032, %sw.bb699.i3030, %sw.bb695.i3028, %sw.bb693.i3025
  %xor718.i3035.sink = phi i32 [ %xor718.i3035, %sw.bb717.i3036 ], [ %or716.i3033, %sw.bb709.i3034 ], [ %or708.i3031, %sw.bb701.i3032 ], [ %sub700.i3029, %sw.bb699.i3030 ], [ %add698.i3027, %sw.bb695.i3028 ], [ %mul694.i3024, %sw.bb693.i3025 ]
  store i32 %xor718.i3035.sink, i32* %add.ptr690.i3022, align 4, !tbaa !7
  %1151 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 16, i32 1), align 1, !tbaa !17
  %idxprom732.i3038 = zext i8 %1151 to i32
  %arrayidx733.i3039 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom732.i3038
  %1152 = load i32, i32* %arrayidx733.i3039, align 4, !tbaa !7
  %1153 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 16, i32 0), align 16, !tbaa !16
  %conv736.i3040 = zext i8 %1153 to i32
  %add.ptr737.i3041 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv736.i3040
  %1154 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 16, i32 2), align 2, !tbaa !14
  switch i8 %1154, label %sw.default767.i3056 [
    i8 0, label %sw.bb740.i3044
    i8 1, label %sw.bb742.i3047
    i8 2, label %sw.bb746.i3049
    i8 3, label %sw.bb748.i3051
    i8 4, label %sw.bb756.i3053
    i8 5, label %sw.bb764.i3055
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb740.i3044:                                   ; preds = %cleanup.cont726.i3042
  %1155 = load i32, i32* %add.ptr737.i3041, align 4, !tbaa !7
  %mul741.i3043 = mul i32 %1155, %1152
  br label %cleanup.cont773.i3061

sw.bb742.i3047:                                   ; preds = %cleanup.cont726.i3042
  %1156 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 16, i32 3), align 4, !tbaa !18
  %add744.i3045 = add i32 %1156, %1152
  %1157 = load i32, i32* %add.ptr737.i3041, align 4, !tbaa !7
  %add745.i3046 = add i32 %add744.i3045, %1157
  br label %cleanup.cont773.i3061

sw.bb746.i3049:                                   ; preds = %cleanup.cont726.i3042
  %1158 = load i32, i32* %add.ptr737.i3041, align 4, !tbaa !7
  %sub747.i3048 = sub i32 %1158, %1152
  br label %cleanup.cont773.i3061

sw.bb748.i3051:                                   ; preds = %cleanup.cont726.i3042
  %1159 = load i32, i32* %add.ptr737.i3041, align 4, !tbaa !7
  %or755.i3050 = call i32 @llvm.fshr.i32(i32 %1159, i32 %1159, i32 %1152) #7
  br label %cleanup.cont773.i3061

sw.bb756.i3053:                                   ; preds = %cleanup.cont726.i3042
  %1160 = load i32, i32* %add.ptr737.i3041, align 4, !tbaa !7
  %or763.i3052 = call i32 @llvm.fshl.i32(i32 %1160, i32 %1160, i32 %1152) #7
  br label %cleanup.cont773.i3061

sw.bb764.i3055:                                   ; preds = %cleanup.cont726.i3042
  %1161 = load i32, i32* %add.ptr737.i3041, align 4, !tbaa !7
  %xor765.i3054 = xor i32 %1161, %1152
  br label %cleanup.cont773.i3061

sw.default767.i3056:                              ; preds = %cleanup.cont726.i3042
  unreachable

cleanup.cont773.i3061:                            ; preds = %sw.bb764.i3055, %sw.bb756.i3053, %sw.bb748.i3051, %sw.bb746.i3049, %sw.bb742.i3047, %sw.bb740.i3044
  %xor765.i3054.sink = phi i32 [ %xor765.i3054, %sw.bb764.i3055 ], [ %or763.i3052, %sw.bb756.i3053 ], [ %or755.i3050, %sw.bb748.i3051 ], [ %sub747.i3048, %sw.bb746.i3049 ], [ %add745.i3046, %sw.bb742.i3047 ], [ %mul741.i3043, %sw.bb740.i3044 ]
  store i32 %xor765.i3054.sink, i32* %add.ptr737.i3041, align 4, !tbaa !7
  %1162 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 17, i32 1), align 1, !tbaa !17
  %idxprom779.i3057 = zext i8 %1162 to i32
  %arrayidx780.i3058 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom779.i3057
  %1163 = load i32, i32* %arrayidx780.i3058, align 4, !tbaa !7
  %1164 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 17, i32 0), align 8, !tbaa !16
  %conv783.i3059 = zext i8 %1164 to i32
  %add.ptr784.i3060 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv783.i3059
  %1165 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 17, i32 2), align 2, !tbaa !14
  switch i8 %1165, label %sw.default814.i3075 [
    i8 0, label %sw.bb787.i3063
    i8 1, label %sw.bb789.i3066
    i8 2, label %sw.bb793.i3068
    i8 3, label %sw.bb795.i3070
    i8 4, label %sw.bb803.i3072
    i8 5, label %sw.bb811.i3074
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb787.i3063:                                   ; preds = %cleanup.cont773.i3061
  %1166 = load i32, i32* %add.ptr784.i3060, align 4, !tbaa !7
  %mul788.i3062 = mul i32 %1166, %1163
  br label %cleanup.cont820.i3080

sw.bb789.i3066:                                   ; preds = %cleanup.cont773.i3061
  %1167 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 17, i32 3), align 4, !tbaa !18
  %add791.i3064 = add i32 %1167, %1163
  %1168 = load i32, i32* %add.ptr784.i3060, align 4, !tbaa !7
  %add792.i3065 = add i32 %add791.i3064, %1168
  br label %cleanup.cont820.i3080

sw.bb793.i3068:                                   ; preds = %cleanup.cont773.i3061
  %1169 = load i32, i32* %add.ptr784.i3060, align 4, !tbaa !7
  %sub794.i3067 = sub i32 %1169, %1163
  br label %cleanup.cont820.i3080

sw.bb795.i3070:                                   ; preds = %cleanup.cont773.i3061
  %1170 = load i32, i32* %add.ptr784.i3060, align 4, !tbaa !7
  %or802.i3069 = call i32 @llvm.fshr.i32(i32 %1170, i32 %1170, i32 %1163) #7
  br label %cleanup.cont820.i3080

sw.bb803.i3072:                                   ; preds = %cleanup.cont773.i3061
  %1171 = load i32, i32* %add.ptr784.i3060, align 4, !tbaa !7
  %or810.i3071 = call i32 @llvm.fshl.i32(i32 %1171, i32 %1171, i32 %1163) #7
  br label %cleanup.cont820.i3080

sw.bb811.i3074:                                   ; preds = %cleanup.cont773.i3061
  %1172 = load i32, i32* %add.ptr784.i3060, align 4, !tbaa !7
  %xor812.i3073 = xor i32 %1172, %1163
  br label %cleanup.cont820.i3080

sw.default814.i3075:                              ; preds = %cleanup.cont773.i3061
  unreachable

cleanup.cont820.i3080:                            ; preds = %sw.bb811.i3074, %sw.bb803.i3072, %sw.bb795.i3070, %sw.bb793.i3068, %sw.bb789.i3066, %sw.bb787.i3063
  %xor812.i3073.sink = phi i32 [ %xor812.i3073, %sw.bb811.i3074 ], [ %or810.i3071, %sw.bb803.i3072 ], [ %or802.i3069, %sw.bb795.i3070 ], [ %sub794.i3067, %sw.bb793.i3068 ], [ %add792.i3065, %sw.bb789.i3066 ], [ %mul788.i3062, %sw.bb787.i3063 ]
  store i32 %xor812.i3073.sink, i32* %add.ptr784.i3060, align 4, !tbaa !7
  %1173 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 18, i32 1), align 1, !tbaa !17
  %idxprom826.i3076 = zext i8 %1173 to i32
  %arrayidx827.i3077 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom826.i3076
  %1174 = load i32, i32* %arrayidx827.i3077, align 4, !tbaa !7
  %1175 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 18, i32 0), align 16, !tbaa !16
  %conv830.i3078 = zext i8 %1175 to i32
  %add.ptr831.i3079 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv830.i3078
  %1176 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 18, i32 2), align 2, !tbaa !14
  switch i8 %1176, label %sw.default861.i3094 [
    i8 0, label %sw.bb834.i3082
    i8 1, label %sw.bb836.i3085
    i8 2, label %sw.bb840.i3087
    i8 3, label %sw.bb842.i3089
    i8 4, label %sw.bb850.i3091
    i8 5, label %sw.bb858.i3093
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb834.i3082:                                   ; preds = %cleanup.cont820.i3080
  %1177 = load i32, i32* %add.ptr831.i3079, align 4, !tbaa !7
  %mul835.i3081 = mul i32 %1177, %1174
  br label %cleanup.cont867.i3099

sw.bb836.i3085:                                   ; preds = %cleanup.cont820.i3080
  %1178 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 18, i32 3), align 4, !tbaa !18
  %add838.i3083 = add i32 %1178, %1174
  %1179 = load i32, i32* %add.ptr831.i3079, align 4, !tbaa !7
  %add839.i3084 = add i32 %add838.i3083, %1179
  br label %cleanup.cont867.i3099

sw.bb840.i3087:                                   ; preds = %cleanup.cont820.i3080
  %1180 = load i32, i32* %add.ptr831.i3079, align 4, !tbaa !7
  %sub841.i3086 = sub i32 %1180, %1174
  br label %cleanup.cont867.i3099

sw.bb842.i3089:                                   ; preds = %cleanup.cont820.i3080
  %1181 = load i32, i32* %add.ptr831.i3079, align 4, !tbaa !7
  %or849.i3088 = call i32 @llvm.fshr.i32(i32 %1181, i32 %1181, i32 %1174) #7
  br label %cleanup.cont867.i3099

sw.bb850.i3091:                                   ; preds = %cleanup.cont820.i3080
  %1182 = load i32, i32* %add.ptr831.i3079, align 4, !tbaa !7
  %or857.i3090 = call i32 @llvm.fshl.i32(i32 %1182, i32 %1182, i32 %1174) #7
  br label %cleanup.cont867.i3099

sw.bb858.i3093:                                   ; preds = %cleanup.cont820.i3080
  %1183 = load i32, i32* %add.ptr831.i3079, align 4, !tbaa !7
  %xor859.i3092 = xor i32 %1183, %1174
  br label %cleanup.cont867.i3099

sw.default861.i3094:                              ; preds = %cleanup.cont820.i3080
  unreachable

cleanup.cont867.i3099:                            ; preds = %sw.bb858.i3093, %sw.bb850.i3091, %sw.bb842.i3089, %sw.bb840.i3087, %sw.bb836.i3085, %sw.bb834.i3082
  %xor859.i3092.sink = phi i32 [ %xor859.i3092, %sw.bb858.i3093 ], [ %or857.i3090, %sw.bb850.i3091 ], [ %or849.i3088, %sw.bb842.i3089 ], [ %sub841.i3086, %sw.bb840.i3087 ], [ %add839.i3084, %sw.bb836.i3085 ], [ %mul835.i3081, %sw.bb834.i3082 ]
  store i32 %xor859.i3092.sink, i32* %add.ptr831.i3079, align 4, !tbaa !7
  %1184 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 19, i32 1), align 1, !tbaa !17
  %idxprom873.i3095 = zext i8 %1184 to i32
  %arrayidx874.i3096 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom873.i3095
  %1185 = load i32, i32* %arrayidx874.i3096, align 4, !tbaa !7
  %1186 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 19, i32 0), align 8, !tbaa !16
  %conv877.i3097 = zext i8 %1186 to i32
  %add.ptr878.i3098 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv877.i3097
  %1187 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 19, i32 2), align 2, !tbaa !14
  switch i8 %1187, label %sw.default908.i3113 [
    i8 0, label %sw.bb881.i3101
    i8 1, label %sw.bb883.i3104
    i8 2, label %sw.bb887.i3106
    i8 3, label %sw.bb889.i3108
    i8 4, label %sw.bb897.i3110
    i8 5, label %sw.bb905.i3112
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb881.i3101:                                   ; preds = %cleanup.cont867.i3099
  %1188 = load i32, i32* %add.ptr878.i3098, align 4, !tbaa !7
  %mul882.i3100 = mul i32 %1188, %1185
  br label %cleanup.cont914.i3118

sw.bb883.i3104:                                   ; preds = %cleanup.cont867.i3099
  %1189 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 19, i32 3), align 4, !tbaa !18
  %add885.i3102 = add i32 %1189, %1185
  %1190 = load i32, i32* %add.ptr878.i3098, align 4, !tbaa !7
  %add886.i3103 = add i32 %add885.i3102, %1190
  br label %cleanup.cont914.i3118

sw.bb887.i3106:                                   ; preds = %cleanup.cont867.i3099
  %1191 = load i32, i32* %add.ptr878.i3098, align 4, !tbaa !7
  %sub888.i3105 = sub i32 %1191, %1185
  br label %cleanup.cont914.i3118

sw.bb889.i3108:                                   ; preds = %cleanup.cont867.i3099
  %1192 = load i32, i32* %add.ptr878.i3098, align 4, !tbaa !7
  %or896.i3107 = call i32 @llvm.fshr.i32(i32 %1192, i32 %1192, i32 %1185) #7
  br label %cleanup.cont914.i3118

sw.bb897.i3110:                                   ; preds = %cleanup.cont867.i3099
  %1193 = load i32, i32* %add.ptr878.i3098, align 4, !tbaa !7
  %or904.i3109 = call i32 @llvm.fshl.i32(i32 %1193, i32 %1193, i32 %1185) #7
  br label %cleanup.cont914.i3118

sw.bb905.i3112:                                   ; preds = %cleanup.cont867.i3099
  %1194 = load i32, i32* %add.ptr878.i3098, align 4, !tbaa !7
  %xor906.i3111 = xor i32 %1194, %1185
  br label %cleanup.cont914.i3118

sw.default908.i3113:                              ; preds = %cleanup.cont867.i3099
  unreachable

cleanup.cont914.i3118:                            ; preds = %sw.bb905.i3112, %sw.bb897.i3110, %sw.bb889.i3108, %sw.bb887.i3106, %sw.bb883.i3104, %sw.bb881.i3101
  %xor906.i3111.sink = phi i32 [ %xor906.i3111, %sw.bb905.i3112 ], [ %or904.i3109, %sw.bb897.i3110 ], [ %or896.i3107, %sw.bb889.i3108 ], [ %sub888.i3105, %sw.bb887.i3106 ], [ %add886.i3103, %sw.bb883.i3104 ], [ %mul882.i3100, %sw.bb881.i3101 ]
  store i32 %xor906.i3111.sink, i32* %add.ptr878.i3098, align 4, !tbaa !7
  %1195 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 20, i32 1), align 1, !tbaa !17
  %idxprom920.i3114 = zext i8 %1195 to i32
  %arrayidx921.i3115 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom920.i3114
  %1196 = load i32, i32* %arrayidx921.i3115, align 4, !tbaa !7
  %1197 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 20, i32 0), align 16, !tbaa !16
  %conv924.i3116 = zext i8 %1197 to i32
  %add.ptr925.i3117 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv924.i3116
  %1198 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 20, i32 2), align 2, !tbaa !14
  switch i8 %1198, label %sw.default955.i3132 [
    i8 0, label %sw.bb928.i3120
    i8 1, label %sw.bb930.i3123
    i8 2, label %sw.bb934.i3125
    i8 3, label %sw.bb936.i3127
    i8 4, label %sw.bb944.i3129
    i8 5, label %sw.bb952.i3131
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb928.i3120:                                   ; preds = %cleanup.cont914.i3118
  %1199 = load i32, i32* %add.ptr925.i3117, align 4, !tbaa !7
  %mul929.i3119 = mul i32 %1199, %1196
  br label %cleanup.cont961.i3137

sw.bb930.i3123:                                   ; preds = %cleanup.cont914.i3118
  %1200 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 20, i32 3), align 4, !tbaa !18
  %add932.i3121 = add i32 %1200, %1196
  %1201 = load i32, i32* %add.ptr925.i3117, align 4, !tbaa !7
  %add933.i3122 = add i32 %add932.i3121, %1201
  br label %cleanup.cont961.i3137

sw.bb934.i3125:                                   ; preds = %cleanup.cont914.i3118
  %1202 = load i32, i32* %add.ptr925.i3117, align 4, !tbaa !7
  %sub935.i3124 = sub i32 %1202, %1196
  br label %cleanup.cont961.i3137

sw.bb936.i3127:                                   ; preds = %cleanup.cont914.i3118
  %1203 = load i32, i32* %add.ptr925.i3117, align 4, !tbaa !7
  %or943.i3126 = call i32 @llvm.fshr.i32(i32 %1203, i32 %1203, i32 %1196) #7
  br label %cleanup.cont961.i3137

sw.bb944.i3129:                                   ; preds = %cleanup.cont914.i3118
  %1204 = load i32, i32* %add.ptr925.i3117, align 4, !tbaa !7
  %or951.i3128 = call i32 @llvm.fshl.i32(i32 %1204, i32 %1204, i32 %1196) #7
  br label %cleanup.cont961.i3137

sw.bb952.i3131:                                   ; preds = %cleanup.cont914.i3118
  %1205 = load i32, i32* %add.ptr925.i3117, align 4, !tbaa !7
  %xor953.i3130 = xor i32 %1205, %1196
  br label %cleanup.cont961.i3137

sw.default955.i3132:                              ; preds = %cleanup.cont914.i3118
  unreachable

cleanup.cont961.i3137:                            ; preds = %sw.bb952.i3131, %sw.bb944.i3129, %sw.bb936.i3127, %sw.bb934.i3125, %sw.bb930.i3123, %sw.bb928.i3120
  %xor953.i3130.sink = phi i32 [ %xor953.i3130, %sw.bb952.i3131 ], [ %or951.i3128, %sw.bb944.i3129 ], [ %or943.i3126, %sw.bb936.i3127 ], [ %sub935.i3124, %sw.bb934.i3125 ], [ %add933.i3122, %sw.bb930.i3123 ], [ %mul929.i3119, %sw.bb928.i3120 ]
  store i32 %xor953.i3130.sink, i32* %add.ptr925.i3117, align 4, !tbaa !7
  %1206 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 21, i32 1), align 1, !tbaa !17
  %idxprom967.i3133 = zext i8 %1206 to i32
  %arrayidx968.i3134 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom967.i3133
  %1207 = load i32, i32* %arrayidx968.i3134, align 4, !tbaa !7
  %1208 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 21, i32 0), align 8, !tbaa !16
  %conv971.i3135 = zext i8 %1208 to i32
  %add.ptr972.i3136 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv971.i3135
  %1209 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 21, i32 2), align 2, !tbaa !14
  switch i8 %1209, label %sw.default1002.i3151 [
    i8 0, label %sw.bb975.i3139
    i8 1, label %sw.bb977.i3142
    i8 2, label %sw.bb981.i3144
    i8 3, label %sw.bb983.i3146
    i8 4, label %sw.bb991.i3148
    i8 5, label %sw.bb999.i3150
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb975.i3139:                                   ; preds = %cleanup.cont961.i3137
  %1210 = load i32, i32* %add.ptr972.i3136, align 4, !tbaa !7
  %mul976.i3138 = mul i32 %1210, %1207
  br label %cleanup.cont1008.i3156

sw.bb977.i3142:                                   ; preds = %cleanup.cont961.i3137
  %1211 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 21, i32 3), align 4, !tbaa !18
  %add979.i3140 = add i32 %1211, %1207
  %1212 = load i32, i32* %add.ptr972.i3136, align 4, !tbaa !7
  %add980.i3141 = add i32 %add979.i3140, %1212
  br label %cleanup.cont1008.i3156

sw.bb981.i3144:                                   ; preds = %cleanup.cont961.i3137
  %1213 = load i32, i32* %add.ptr972.i3136, align 4, !tbaa !7
  %sub982.i3143 = sub i32 %1213, %1207
  br label %cleanup.cont1008.i3156

sw.bb983.i3146:                                   ; preds = %cleanup.cont961.i3137
  %1214 = load i32, i32* %add.ptr972.i3136, align 4, !tbaa !7
  %or990.i3145 = call i32 @llvm.fshr.i32(i32 %1214, i32 %1214, i32 %1207) #7
  br label %cleanup.cont1008.i3156

sw.bb991.i3148:                                   ; preds = %cleanup.cont961.i3137
  %1215 = load i32, i32* %add.ptr972.i3136, align 4, !tbaa !7
  %or998.i3147 = call i32 @llvm.fshl.i32(i32 %1215, i32 %1215, i32 %1207) #7
  br label %cleanup.cont1008.i3156

sw.bb999.i3150:                                   ; preds = %cleanup.cont961.i3137
  %1216 = load i32, i32* %add.ptr972.i3136, align 4, !tbaa !7
  %xor1000.i3149 = xor i32 %1216, %1207
  br label %cleanup.cont1008.i3156

sw.default1002.i3151:                             ; preds = %cleanup.cont961.i3137
  unreachable

cleanup.cont1008.i3156:                           ; preds = %sw.bb999.i3150, %sw.bb991.i3148, %sw.bb983.i3146, %sw.bb981.i3144, %sw.bb977.i3142, %sw.bb975.i3139
  %xor1000.i3149.sink = phi i32 [ %xor1000.i3149, %sw.bb999.i3150 ], [ %or998.i3147, %sw.bb991.i3148 ], [ %or990.i3145, %sw.bb983.i3146 ], [ %sub982.i3143, %sw.bb981.i3144 ], [ %add980.i3141, %sw.bb977.i3142 ], [ %mul976.i3138, %sw.bb975.i3139 ]
  store i32 %xor1000.i3149.sink, i32* %add.ptr972.i3136, align 4, !tbaa !7
  %1217 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 22, i32 1), align 1, !tbaa !17
  %idxprom1014.i3152 = zext i8 %1217 to i32
  %arrayidx1015.i3153 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1014.i3152
  %1218 = load i32, i32* %arrayidx1015.i3153, align 4, !tbaa !7
  %1219 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 22, i32 0), align 16, !tbaa !16
  %conv1018.i3154 = zext i8 %1219 to i32
  %add.ptr1019.i3155 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1018.i3154
  %1220 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 22, i32 2), align 2, !tbaa !14
  switch i8 %1220, label %sw.default1049.i3170 [
    i8 0, label %sw.bb1022.i3158
    i8 1, label %sw.bb1024.i3161
    i8 2, label %sw.bb1028.i3163
    i8 3, label %sw.bb1030.i3165
    i8 4, label %sw.bb1038.i3167
    i8 5, label %sw.bb1046.i3169
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1022.i3158:                                  ; preds = %cleanup.cont1008.i3156
  %1221 = load i32, i32* %add.ptr1019.i3155, align 4, !tbaa !7
  %mul1023.i3157 = mul i32 %1221, %1218
  br label %cleanup.cont1055.i3175

sw.bb1024.i3161:                                  ; preds = %cleanup.cont1008.i3156
  %1222 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 22, i32 3), align 4, !tbaa !18
  %add1026.i3159 = add i32 %1222, %1218
  %1223 = load i32, i32* %add.ptr1019.i3155, align 4, !tbaa !7
  %add1027.i3160 = add i32 %add1026.i3159, %1223
  br label %cleanup.cont1055.i3175

sw.bb1028.i3163:                                  ; preds = %cleanup.cont1008.i3156
  %1224 = load i32, i32* %add.ptr1019.i3155, align 4, !tbaa !7
  %sub1029.i3162 = sub i32 %1224, %1218
  br label %cleanup.cont1055.i3175

sw.bb1030.i3165:                                  ; preds = %cleanup.cont1008.i3156
  %1225 = load i32, i32* %add.ptr1019.i3155, align 4, !tbaa !7
  %or1037.i3164 = call i32 @llvm.fshr.i32(i32 %1225, i32 %1225, i32 %1218) #7
  br label %cleanup.cont1055.i3175

sw.bb1038.i3167:                                  ; preds = %cleanup.cont1008.i3156
  %1226 = load i32, i32* %add.ptr1019.i3155, align 4, !tbaa !7
  %or1045.i3166 = call i32 @llvm.fshl.i32(i32 %1226, i32 %1226, i32 %1218) #7
  br label %cleanup.cont1055.i3175

sw.bb1046.i3169:                                  ; preds = %cleanup.cont1008.i3156
  %1227 = load i32, i32* %add.ptr1019.i3155, align 4, !tbaa !7
  %xor1047.i3168 = xor i32 %1227, %1218
  br label %cleanup.cont1055.i3175

sw.default1049.i3170:                             ; preds = %cleanup.cont1008.i3156
  unreachable

cleanup.cont1055.i3175:                           ; preds = %sw.bb1046.i3169, %sw.bb1038.i3167, %sw.bb1030.i3165, %sw.bb1028.i3163, %sw.bb1024.i3161, %sw.bb1022.i3158
  %xor1047.i3168.sink = phi i32 [ %xor1047.i3168, %sw.bb1046.i3169 ], [ %or1045.i3166, %sw.bb1038.i3167 ], [ %or1037.i3164, %sw.bb1030.i3165 ], [ %sub1029.i3162, %sw.bb1028.i3163 ], [ %add1027.i3160, %sw.bb1024.i3161 ], [ %mul1023.i3157, %sw.bb1022.i3158 ]
  store i32 %xor1047.i3168.sink, i32* %add.ptr1019.i3155, align 4, !tbaa !7
  %1228 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 23, i32 1), align 1, !tbaa !17
  %idxprom1061.i3171 = zext i8 %1228 to i32
  %arrayidx1062.i3172 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1061.i3171
  %1229 = load i32, i32* %arrayidx1062.i3172, align 4, !tbaa !7
  %1230 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 23, i32 0), align 8, !tbaa !16
  %conv1065.i3173 = zext i8 %1230 to i32
  %add.ptr1066.i3174 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1065.i3173
  %1231 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 23, i32 2), align 2, !tbaa !14
  switch i8 %1231, label %sw.default1096.i3189 [
    i8 0, label %sw.bb1069.i3177
    i8 1, label %sw.bb1071.i3180
    i8 2, label %sw.bb1075.i3182
    i8 3, label %sw.bb1077.i3184
    i8 4, label %sw.bb1085.i3186
    i8 5, label %sw.bb1093.i3188
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1069.i3177:                                  ; preds = %cleanup.cont1055.i3175
  %1232 = load i32, i32* %add.ptr1066.i3174, align 4, !tbaa !7
  %mul1070.i3176 = mul i32 %1232, %1229
  br label %cleanup.cont1102.i3194

sw.bb1071.i3180:                                  ; preds = %cleanup.cont1055.i3175
  %1233 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 23, i32 3), align 4, !tbaa !18
  %add1073.i3178 = add i32 %1233, %1229
  %1234 = load i32, i32* %add.ptr1066.i3174, align 4, !tbaa !7
  %add1074.i3179 = add i32 %add1073.i3178, %1234
  br label %cleanup.cont1102.i3194

sw.bb1075.i3182:                                  ; preds = %cleanup.cont1055.i3175
  %1235 = load i32, i32* %add.ptr1066.i3174, align 4, !tbaa !7
  %sub1076.i3181 = sub i32 %1235, %1229
  br label %cleanup.cont1102.i3194

sw.bb1077.i3184:                                  ; preds = %cleanup.cont1055.i3175
  %1236 = load i32, i32* %add.ptr1066.i3174, align 4, !tbaa !7
  %or1084.i3183 = call i32 @llvm.fshr.i32(i32 %1236, i32 %1236, i32 %1229) #7
  br label %cleanup.cont1102.i3194

sw.bb1085.i3186:                                  ; preds = %cleanup.cont1055.i3175
  %1237 = load i32, i32* %add.ptr1066.i3174, align 4, !tbaa !7
  %or1092.i3185 = call i32 @llvm.fshl.i32(i32 %1237, i32 %1237, i32 %1229) #7
  br label %cleanup.cont1102.i3194

sw.bb1093.i3188:                                  ; preds = %cleanup.cont1055.i3175
  %1238 = load i32, i32* %add.ptr1066.i3174, align 4, !tbaa !7
  %xor1094.i3187 = xor i32 %1238, %1229
  br label %cleanup.cont1102.i3194

sw.default1096.i3189:                             ; preds = %cleanup.cont1055.i3175
  unreachable

cleanup.cont1102.i3194:                           ; preds = %sw.bb1093.i3188, %sw.bb1085.i3186, %sw.bb1077.i3184, %sw.bb1075.i3182, %sw.bb1071.i3180, %sw.bb1069.i3177
  %xor1094.i3187.sink = phi i32 [ %xor1094.i3187, %sw.bb1093.i3188 ], [ %or1092.i3185, %sw.bb1085.i3186 ], [ %or1084.i3183, %sw.bb1077.i3184 ], [ %sub1076.i3181, %sw.bb1075.i3182 ], [ %add1074.i3179, %sw.bb1071.i3180 ], [ %mul1070.i3176, %sw.bb1069.i3177 ]
  store i32 %xor1094.i3187.sink, i32* %add.ptr1066.i3174, align 4, !tbaa !7
  %1239 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 24, i32 1), align 1, !tbaa !17
  %idxprom1108.i3190 = zext i8 %1239 to i32
  %arrayidx1109.i3191 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1108.i3190
  %1240 = load i32, i32* %arrayidx1109.i3191, align 4, !tbaa !7
  %1241 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 24, i32 0), align 16, !tbaa !16
  %conv1112.i3192 = zext i8 %1241 to i32
  %add.ptr1113.i3193 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1112.i3192
  %1242 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 24, i32 2), align 2, !tbaa !14
  switch i8 %1242, label %sw.default1143.i3208 [
    i8 0, label %sw.bb1116.i3196
    i8 1, label %sw.bb1118.i3199
    i8 2, label %sw.bb1122.i3201
    i8 3, label %sw.bb1124.i3203
    i8 4, label %sw.bb1132.i3205
    i8 5, label %sw.bb1140.i3207
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1116.i3196:                                  ; preds = %cleanup.cont1102.i3194
  %1243 = load i32, i32* %add.ptr1113.i3193, align 4, !tbaa !7
  %mul1117.i3195 = mul i32 %1243, %1240
  br label %cleanup.cont1149.i3213

sw.bb1118.i3199:                                  ; preds = %cleanup.cont1102.i3194
  %1244 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 24, i32 3), align 4, !tbaa !18
  %add1120.i3197 = add i32 %1244, %1240
  %1245 = load i32, i32* %add.ptr1113.i3193, align 4, !tbaa !7
  %add1121.i3198 = add i32 %add1120.i3197, %1245
  br label %cleanup.cont1149.i3213

sw.bb1122.i3201:                                  ; preds = %cleanup.cont1102.i3194
  %1246 = load i32, i32* %add.ptr1113.i3193, align 4, !tbaa !7
  %sub1123.i3200 = sub i32 %1246, %1240
  br label %cleanup.cont1149.i3213

sw.bb1124.i3203:                                  ; preds = %cleanup.cont1102.i3194
  %1247 = load i32, i32* %add.ptr1113.i3193, align 4, !tbaa !7
  %or1131.i3202 = call i32 @llvm.fshr.i32(i32 %1247, i32 %1247, i32 %1240) #7
  br label %cleanup.cont1149.i3213

sw.bb1132.i3205:                                  ; preds = %cleanup.cont1102.i3194
  %1248 = load i32, i32* %add.ptr1113.i3193, align 4, !tbaa !7
  %or1139.i3204 = call i32 @llvm.fshl.i32(i32 %1248, i32 %1248, i32 %1240) #7
  br label %cleanup.cont1149.i3213

sw.bb1140.i3207:                                  ; preds = %cleanup.cont1102.i3194
  %1249 = load i32, i32* %add.ptr1113.i3193, align 4, !tbaa !7
  %xor1141.i3206 = xor i32 %1249, %1240
  br label %cleanup.cont1149.i3213

sw.default1143.i3208:                             ; preds = %cleanup.cont1102.i3194
  unreachable

cleanup.cont1149.i3213:                           ; preds = %sw.bb1140.i3207, %sw.bb1132.i3205, %sw.bb1124.i3203, %sw.bb1122.i3201, %sw.bb1118.i3199, %sw.bb1116.i3196
  %xor1141.i3206.sink = phi i32 [ %xor1141.i3206, %sw.bb1140.i3207 ], [ %or1139.i3204, %sw.bb1132.i3205 ], [ %or1131.i3202, %sw.bb1124.i3203 ], [ %sub1123.i3200, %sw.bb1122.i3201 ], [ %add1121.i3198, %sw.bb1118.i3199 ], [ %mul1117.i3195, %sw.bb1116.i3196 ]
  store i32 %xor1141.i3206.sink, i32* %add.ptr1113.i3193, align 4, !tbaa !7
  %1250 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 25, i32 1), align 1, !tbaa !17
  %idxprom1155.i3209 = zext i8 %1250 to i32
  %arrayidx1156.i3210 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1155.i3209
  %1251 = load i32, i32* %arrayidx1156.i3210, align 4, !tbaa !7
  %1252 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 25, i32 0), align 8, !tbaa !16
  %conv1159.i3211 = zext i8 %1252 to i32
  %add.ptr1160.i3212 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1159.i3211
  %1253 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 25, i32 2), align 2, !tbaa !14
  switch i8 %1253, label %sw.default1190.i3227 [
    i8 0, label %sw.bb1163.i3215
    i8 1, label %sw.bb1165.i3218
    i8 2, label %sw.bb1169.i3220
    i8 3, label %sw.bb1171.i3222
    i8 4, label %sw.bb1179.i3224
    i8 5, label %sw.bb1187.i3226
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1163.i3215:                                  ; preds = %cleanup.cont1149.i3213
  %1254 = load i32, i32* %add.ptr1160.i3212, align 4, !tbaa !7
  %mul1164.i3214 = mul i32 %1254, %1251
  br label %cleanup.cont1196.i3232

sw.bb1165.i3218:                                  ; preds = %cleanup.cont1149.i3213
  %1255 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 25, i32 3), align 4, !tbaa !18
  %add1167.i3216 = add i32 %1255, %1251
  %1256 = load i32, i32* %add.ptr1160.i3212, align 4, !tbaa !7
  %add1168.i3217 = add i32 %add1167.i3216, %1256
  br label %cleanup.cont1196.i3232

sw.bb1169.i3220:                                  ; preds = %cleanup.cont1149.i3213
  %1257 = load i32, i32* %add.ptr1160.i3212, align 4, !tbaa !7
  %sub1170.i3219 = sub i32 %1257, %1251
  br label %cleanup.cont1196.i3232

sw.bb1171.i3222:                                  ; preds = %cleanup.cont1149.i3213
  %1258 = load i32, i32* %add.ptr1160.i3212, align 4, !tbaa !7
  %or1178.i3221 = call i32 @llvm.fshr.i32(i32 %1258, i32 %1258, i32 %1251) #7
  br label %cleanup.cont1196.i3232

sw.bb1179.i3224:                                  ; preds = %cleanup.cont1149.i3213
  %1259 = load i32, i32* %add.ptr1160.i3212, align 4, !tbaa !7
  %or1186.i3223 = call i32 @llvm.fshl.i32(i32 %1259, i32 %1259, i32 %1251) #7
  br label %cleanup.cont1196.i3232

sw.bb1187.i3226:                                  ; preds = %cleanup.cont1149.i3213
  %1260 = load i32, i32* %add.ptr1160.i3212, align 4, !tbaa !7
  %xor1188.i3225 = xor i32 %1260, %1251
  br label %cleanup.cont1196.i3232

sw.default1190.i3227:                             ; preds = %cleanup.cont1149.i3213
  unreachable

cleanup.cont1196.i3232:                           ; preds = %sw.bb1187.i3226, %sw.bb1179.i3224, %sw.bb1171.i3222, %sw.bb1169.i3220, %sw.bb1165.i3218, %sw.bb1163.i3215
  %xor1188.i3225.sink = phi i32 [ %xor1188.i3225, %sw.bb1187.i3226 ], [ %or1186.i3223, %sw.bb1179.i3224 ], [ %or1178.i3221, %sw.bb1171.i3222 ], [ %sub1170.i3219, %sw.bb1169.i3220 ], [ %add1168.i3217, %sw.bb1165.i3218 ], [ %mul1164.i3214, %sw.bb1163.i3215 ]
  store i32 %xor1188.i3225.sink, i32* %add.ptr1160.i3212, align 4, !tbaa !7
  %1261 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 26, i32 1), align 1, !tbaa !17
  %idxprom1202.i3228 = zext i8 %1261 to i32
  %arrayidx1203.i3229 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1202.i3228
  %1262 = load i32, i32* %arrayidx1203.i3229, align 4, !tbaa !7
  %1263 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 26, i32 0), align 16, !tbaa !16
  %conv1206.i3230 = zext i8 %1263 to i32
  %add.ptr1207.i3231 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1206.i3230
  %1264 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 26, i32 2), align 2, !tbaa !14
  switch i8 %1264, label %sw.default1237.i3246 [
    i8 0, label %sw.bb1210.i3234
    i8 1, label %sw.bb1212.i3237
    i8 2, label %sw.bb1216.i3239
    i8 3, label %sw.bb1218.i3241
    i8 4, label %sw.bb1226.i3243
    i8 5, label %sw.bb1234.i3245
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1210.i3234:                                  ; preds = %cleanup.cont1196.i3232
  %1265 = load i32, i32* %add.ptr1207.i3231, align 4, !tbaa !7
  %mul1211.i3233 = mul i32 %1265, %1262
  br label %cleanup.cont1243.i3251

sw.bb1212.i3237:                                  ; preds = %cleanup.cont1196.i3232
  %1266 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 26, i32 3), align 4, !tbaa !18
  %add1214.i3235 = add i32 %1266, %1262
  %1267 = load i32, i32* %add.ptr1207.i3231, align 4, !tbaa !7
  %add1215.i3236 = add i32 %add1214.i3235, %1267
  br label %cleanup.cont1243.i3251

sw.bb1216.i3239:                                  ; preds = %cleanup.cont1196.i3232
  %1268 = load i32, i32* %add.ptr1207.i3231, align 4, !tbaa !7
  %sub1217.i3238 = sub i32 %1268, %1262
  br label %cleanup.cont1243.i3251

sw.bb1218.i3241:                                  ; preds = %cleanup.cont1196.i3232
  %1269 = load i32, i32* %add.ptr1207.i3231, align 4, !tbaa !7
  %or1225.i3240 = call i32 @llvm.fshr.i32(i32 %1269, i32 %1269, i32 %1262) #7
  br label %cleanup.cont1243.i3251

sw.bb1226.i3243:                                  ; preds = %cleanup.cont1196.i3232
  %1270 = load i32, i32* %add.ptr1207.i3231, align 4, !tbaa !7
  %or1233.i3242 = call i32 @llvm.fshl.i32(i32 %1270, i32 %1270, i32 %1262) #7
  br label %cleanup.cont1243.i3251

sw.bb1234.i3245:                                  ; preds = %cleanup.cont1196.i3232
  %1271 = load i32, i32* %add.ptr1207.i3231, align 4, !tbaa !7
  %xor1235.i3244 = xor i32 %1271, %1262
  br label %cleanup.cont1243.i3251

sw.default1237.i3246:                             ; preds = %cleanup.cont1196.i3232
  unreachable

cleanup.cont1243.i3251:                           ; preds = %sw.bb1234.i3245, %sw.bb1226.i3243, %sw.bb1218.i3241, %sw.bb1216.i3239, %sw.bb1212.i3237, %sw.bb1210.i3234
  %xor1235.i3244.sink = phi i32 [ %xor1235.i3244, %sw.bb1234.i3245 ], [ %or1233.i3242, %sw.bb1226.i3243 ], [ %or1225.i3240, %sw.bb1218.i3241 ], [ %sub1217.i3238, %sw.bb1216.i3239 ], [ %add1215.i3236, %sw.bb1212.i3237 ], [ %mul1211.i3233, %sw.bb1210.i3234 ]
  store i32 %xor1235.i3244.sink, i32* %add.ptr1207.i3231, align 4, !tbaa !7
  %1272 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 27, i32 1), align 1, !tbaa !17
  %idxprom1249.i3247 = zext i8 %1272 to i32
  %arrayidx1250.i3248 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1249.i3247
  %1273 = load i32, i32* %arrayidx1250.i3248, align 4, !tbaa !7
  %1274 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 27, i32 0), align 8, !tbaa !16
  %conv1253.i3249 = zext i8 %1274 to i32
  %add.ptr1254.i3250 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1253.i3249
  %1275 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 27, i32 2), align 2, !tbaa !14
  switch i8 %1275, label %sw.default1284.i3265 [
    i8 0, label %sw.bb1257.i3253
    i8 1, label %sw.bb1259.i3256
    i8 2, label %sw.bb1263.i3258
    i8 3, label %sw.bb1265.i3260
    i8 4, label %sw.bb1273.i3262
    i8 5, label %sw.bb1281.i3264
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1257.i3253:                                  ; preds = %cleanup.cont1243.i3251
  %1276 = load i32, i32* %add.ptr1254.i3250, align 4, !tbaa !7
  %mul1258.i3252 = mul i32 %1276, %1273
  br label %cleanup.cont1290.i3270

sw.bb1259.i3256:                                  ; preds = %cleanup.cont1243.i3251
  %1277 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 27, i32 3), align 4, !tbaa !18
  %add1261.i3254 = add i32 %1277, %1273
  %1278 = load i32, i32* %add.ptr1254.i3250, align 4, !tbaa !7
  %add1262.i3255 = add i32 %add1261.i3254, %1278
  br label %cleanup.cont1290.i3270

sw.bb1263.i3258:                                  ; preds = %cleanup.cont1243.i3251
  %1279 = load i32, i32* %add.ptr1254.i3250, align 4, !tbaa !7
  %sub1264.i3257 = sub i32 %1279, %1273
  br label %cleanup.cont1290.i3270

sw.bb1265.i3260:                                  ; preds = %cleanup.cont1243.i3251
  %1280 = load i32, i32* %add.ptr1254.i3250, align 4, !tbaa !7
  %or1272.i3259 = call i32 @llvm.fshr.i32(i32 %1280, i32 %1280, i32 %1273) #7
  br label %cleanup.cont1290.i3270

sw.bb1273.i3262:                                  ; preds = %cleanup.cont1243.i3251
  %1281 = load i32, i32* %add.ptr1254.i3250, align 4, !tbaa !7
  %or1280.i3261 = call i32 @llvm.fshl.i32(i32 %1281, i32 %1281, i32 %1273) #7
  br label %cleanup.cont1290.i3270

sw.bb1281.i3264:                                  ; preds = %cleanup.cont1243.i3251
  %1282 = load i32, i32* %add.ptr1254.i3250, align 4, !tbaa !7
  %xor1282.i3263 = xor i32 %1282, %1273
  br label %cleanup.cont1290.i3270

sw.default1284.i3265:                             ; preds = %cleanup.cont1243.i3251
  unreachable

cleanup.cont1290.i3270:                           ; preds = %sw.bb1281.i3264, %sw.bb1273.i3262, %sw.bb1265.i3260, %sw.bb1263.i3258, %sw.bb1259.i3256, %sw.bb1257.i3253
  %xor1282.i3263.sink = phi i32 [ %xor1282.i3263, %sw.bb1281.i3264 ], [ %or1280.i3261, %sw.bb1273.i3262 ], [ %or1272.i3259, %sw.bb1265.i3260 ], [ %sub1264.i3257, %sw.bb1263.i3258 ], [ %add1262.i3255, %sw.bb1259.i3256 ], [ %mul1258.i3252, %sw.bb1257.i3253 ]
  store i32 %xor1282.i3263.sink, i32* %add.ptr1254.i3250, align 4, !tbaa !7
  %1283 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 28, i32 1), align 1, !tbaa !17
  %idxprom1296.i3266 = zext i8 %1283 to i32
  %arrayidx1297.i3267 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1296.i3266
  %1284 = load i32, i32* %arrayidx1297.i3267, align 4, !tbaa !7
  %1285 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 28, i32 0), align 16, !tbaa !16
  %conv1300.i3268 = zext i8 %1285 to i32
  %add.ptr1301.i3269 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1300.i3268
  %1286 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 28, i32 2), align 2, !tbaa !14
  switch i8 %1286, label %sw.default1331.i3284 [
    i8 0, label %sw.bb1304.i3272
    i8 1, label %sw.bb1306.i3275
    i8 2, label %sw.bb1310.i3277
    i8 3, label %sw.bb1312.i3279
    i8 4, label %sw.bb1320.i3281
    i8 5, label %sw.bb1328.i3283
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1304.i3272:                                  ; preds = %cleanup.cont1290.i3270
  %1287 = load i32, i32* %add.ptr1301.i3269, align 4, !tbaa !7
  %mul1305.i3271 = mul i32 %1287, %1284
  br label %cleanup.cont1337.i3289

sw.bb1306.i3275:                                  ; preds = %cleanup.cont1290.i3270
  %1288 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 28, i32 3), align 4, !tbaa !18
  %add1308.i3273 = add i32 %1288, %1284
  %1289 = load i32, i32* %add.ptr1301.i3269, align 4, !tbaa !7
  %add1309.i3274 = add i32 %add1308.i3273, %1289
  br label %cleanup.cont1337.i3289

sw.bb1310.i3277:                                  ; preds = %cleanup.cont1290.i3270
  %1290 = load i32, i32* %add.ptr1301.i3269, align 4, !tbaa !7
  %sub1311.i3276 = sub i32 %1290, %1284
  br label %cleanup.cont1337.i3289

sw.bb1312.i3279:                                  ; preds = %cleanup.cont1290.i3270
  %1291 = load i32, i32* %add.ptr1301.i3269, align 4, !tbaa !7
  %or1319.i3278 = call i32 @llvm.fshr.i32(i32 %1291, i32 %1291, i32 %1284) #7
  br label %cleanup.cont1337.i3289

sw.bb1320.i3281:                                  ; preds = %cleanup.cont1290.i3270
  %1292 = load i32, i32* %add.ptr1301.i3269, align 4, !tbaa !7
  %or1327.i3280 = call i32 @llvm.fshl.i32(i32 %1292, i32 %1292, i32 %1284) #7
  br label %cleanup.cont1337.i3289

sw.bb1328.i3283:                                  ; preds = %cleanup.cont1290.i3270
  %1293 = load i32, i32* %add.ptr1301.i3269, align 4, !tbaa !7
  %xor1329.i3282 = xor i32 %1293, %1284
  br label %cleanup.cont1337.i3289

sw.default1331.i3284:                             ; preds = %cleanup.cont1290.i3270
  unreachable

cleanup.cont1337.i3289:                           ; preds = %sw.bb1328.i3283, %sw.bb1320.i3281, %sw.bb1312.i3279, %sw.bb1310.i3277, %sw.bb1306.i3275, %sw.bb1304.i3272
  %xor1329.i3282.sink = phi i32 [ %xor1329.i3282, %sw.bb1328.i3283 ], [ %or1327.i3280, %sw.bb1320.i3281 ], [ %or1319.i3278, %sw.bb1312.i3279 ], [ %sub1311.i3276, %sw.bb1310.i3277 ], [ %add1309.i3274, %sw.bb1306.i3275 ], [ %mul1305.i3271, %sw.bb1304.i3272 ]
  store i32 %xor1329.i3282.sink, i32* %add.ptr1301.i3269, align 4, !tbaa !7
  %1294 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 29, i32 1), align 1, !tbaa !17
  %idxprom1343.i3285 = zext i8 %1294 to i32
  %arrayidx1344.i3286 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1343.i3285
  %1295 = load i32, i32* %arrayidx1344.i3286, align 4, !tbaa !7
  %1296 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 29, i32 0), align 8, !tbaa !16
  %conv1347.i3287 = zext i8 %1296 to i32
  %add.ptr1348.i3288 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1347.i3287
  %1297 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 29, i32 2), align 2, !tbaa !14
  switch i8 %1297, label %sw.default1378.i3303 [
    i8 0, label %sw.bb1351.i3291
    i8 1, label %sw.bb1353.i3294
    i8 2, label %sw.bb1357.i3296
    i8 3, label %sw.bb1359.i3298
    i8 4, label %sw.bb1367.i3300
    i8 5, label %sw.bb1375.i3302
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1351.i3291:                                  ; preds = %cleanup.cont1337.i3289
  %1298 = load i32, i32* %add.ptr1348.i3288, align 4, !tbaa !7
  %mul1352.i3290 = mul i32 %1298, %1295
  br label %cleanup.cont1384.i3308

sw.bb1353.i3294:                                  ; preds = %cleanup.cont1337.i3289
  %1299 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 29, i32 3), align 4, !tbaa !18
  %add1355.i3292 = add i32 %1299, %1295
  %1300 = load i32, i32* %add.ptr1348.i3288, align 4, !tbaa !7
  %add1356.i3293 = add i32 %add1355.i3292, %1300
  br label %cleanup.cont1384.i3308

sw.bb1357.i3296:                                  ; preds = %cleanup.cont1337.i3289
  %1301 = load i32, i32* %add.ptr1348.i3288, align 4, !tbaa !7
  %sub1358.i3295 = sub i32 %1301, %1295
  br label %cleanup.cont1384.i3308

sw.bb1359.i3298:                                  ; preds = %cleanup.cont1337.i3289
  %1302 = load i32, i32* %add.ptr1348.i3288, align 4, !tbaa !7
  %or1366.i3297 = call i32 @llvm.fshr.i32(i32 %1302, i32 %1302, i32 %1295) #7
  br label %cleanup.cont1384.i3308

sw.bb1367.i3300:                                  ; preds = %cleanup.cont1337.i3289
  %1303 = load i32, i32* %add.ptr1348.i3288, align 4, !tbaa !7
  %or1374.i3299 = call i32 @llvm.fshl.i32(i32 %1303, i32 %1303, i32 %1295) #7
  br label %cleanup.cont1384.i3308

sw.bb1375.i3302:                                  ; preds = %cleanup.cont1337.i3289
  %1304 = load i32, i32* %add.ptr1348.i3288, align 4, !tbaa !7
  %xor1376.i3301 = xor i32 %1304, %1295
  br label %cleanup.cont1384.i3308

sw.default1378.i3303:                             ; preds = %cleanup.cont1337.i3289
  unreachable

cleanup.cont1384.i3308:                           ; preds = %sw.bb1375.i3302, %sw.bb1367.i3300, %sw.bb1359.i3298, %sw.bb1357.i3296, %sw.bb1353.i3294, %sw.bb1351.i3291
  %xor1376.i3301.sink = phi i32 [ %xor1376.i3301, %sw.bb1375.i3302 ], [ %or1374.i3299, %sw.bb1367.i3300 ], [ %or1366.i3297, %sw.bb1359.i3298 ], [ %sub1358.i3295, %sw.bb1357.i3296 ], [ %add1356.i3293, %sw.bb1353.i3294 ], [ %mul1352.i3290, %sw.bb1351.i3291 ]
  store i32 %xor1376.i3301.sink, i32* %add.ptr1348.i3288, align 4, !tbaa !7
  %1305 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 30, i32 1), align 1, !tbaa !17
  %idxprom1390.i3304 = zext i8 %1305 to i32
  %arrayidx1391.i3305 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1390.i3304
  %1306 = load i32, i32* %arrayidx1391.i3305, align 4, !tbaa !7
  %1307 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 30, i32 0), align 16, !tbaa !16
  %conv1394.i3306 = zext i8 %1307 to i32
  %add.ptr1395.i3307 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1394.i3306
  %1308 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 30, i32 2), align 2, !tbaa !14
  switch i8 %1308, label %sw.default1425.i3322 [
    i8 0, label %sw.bb1398.i3310
    i8 1, label %sw.bb1400.i3313
    i8 2, label %sw.bb1404.i3315
    i8 3, label %sw.bb1406.i3317
    i8 4, label %sw.bb1414.i3319
    i8 5, label %sw.bb1422.i3321
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1398.i3310:                                  ; preds = %cleanup.cont1384.i3308
  %1309 = load i32, i32* %add.ptr1395.i3307, align 4, !tbaa !7
  %mul1399.i3309 = mul i32 %1309, %1306
  br label %cleanup.cont1431.i3327

sw.bb1400.i3313:                                  ; preds = %cleanup.cont1384.i3308
  %1310 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 30, i32 3), align 4, !tbaa !18
  %add1402.i3311 = add i32 %1310, %1306
  %1311 = load i32, i32* %add.ptr1395.i3307, align 4, !tbaa !7
  %add1403.i3312 = add i32 %add1402.i3311, %1311
  br label %cleanup.cont1431.i3327

sw.bb1404.i3315:                                  ; preds = %cleanup.cont1384.i3308
  %1312 = load i32, i32* %add.ptr1395.i3307, align 4, !tbaa !7
  %sub1405.i3314 = sub i32 %1312, %1306
  br label %cleanup.cont1431.i3327

sw.bb1406.i3317:                                  ; preds = %cleanup.cont1384.i3308
  %1313 = load i32, i32* %add.ptr1395.i3307, align 4, !tbaa !7
  %or1413.i3316 = call i32 @llvm.fshr.i32(i32 %1313, i32 %1313, i32 %1306) #7
  br label %cleanup.cont1431.i3327

sw.bb1414.i3319:                                  ; preds = %cleanup.cont1384.i3308
  %1314 = load i32, i32* %add.ptr1395.i3307, align 4, !tbaa !7
  %or1421.i3318 = call i32 @llvm.fshl.i32(i32 %1314, i32 %1314, i32 %1306) #7
  br label %cleanup.cont1431.i3327

sw.bb1422.i3321:                                  ; preds = %cleanup.cont1384.i3308
  %1315 = load i32, i32* %add.ptr1395.i3307, align 4, !tbaa !7
  %xor1423.i3320 = xor i32 %1315, %1306
  br label %cleanup.cont1431.i3327

sw.default1425.i3322:                             ; preds = %cleanup.cont1384.i3308
  unreachable

cleanup.cont1431.i3327:                           ; preds = %sw.bb1422.i3321, %sw.bb1414.i3319, %sw.bb1406.i3317, %sw.bb1404.i3315, %sw.bb1400.i3313, %sw.bb1398.i3310
  %xor1423.i3320.sink = phi i32 [ %xor1423.i3320, %sw.bb1422.i3321 ], [ %or1421.i3318, %sw.bb1414.i3319 ], [ %or1413.i3316, %sw.bb1406.i3317 ], [ %sub1405.i3314, %sw.bb1404.i3315 ], [ %add1403.i3312, %sw.bb1400.i3313 ], [ %mul1399.i3309, %sw.bb1398.i3310 ]
  store i32 %xor1423.i3320.sink, i32* %add.ptr1395.i3307, align 4, !tbaa !7
  %1316 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 31, i32 1), align 1, !tbaa !17
  %idxprom1437.i3323 = zext i8 %1316 to i32
  %arrayidx1438.i3324 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1437.i3323
  %1317 = load i32, i32* %arrayidx1438.i3324, align 4, !tbaa !7
  %1318 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 31, i32 0), align 8, !tbaa !16
  %conv1441.i3325 = zext i8 %1318 to i32
  %add.ptr1442.i3326 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1441.i3325
  %1319 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 31, i32 2), align 2, !tbaa !14
  switch i8 %1319, label %sw.default1472.i3341 [
    i8 0, label %sw.bb1445.i3329
    i8 1, label %sw.bb1447.i3332
    i8 2, label %sw.bb1451.i3334
    i8 3, label %sw.bb1453.i3336
    i8 4, label %sw.bb1461.i3338
    i8 5, label %sw.bb1469.i3340
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1445.i3329:                                  ; preds = %cleanup.cont1431.i3327
  %1320 = load i32, i32* %add.ptr1442.i3326, align 4, !tbaa !7
  %mul1446.i3328 = mul i32 %1320, %1317
  br label %cleanup.cont1478.i3346

sw.bb1447.i3332:                                  ; preds = %cleanup.cont1431.i3327
  %1321 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 31, i32 3), align 4, !tbaa !18
  %add1449.i3330 = add i32 %1321, %1317
  %1322 = load i32, i32* %add.ptr1442.i3326, align 4, !tbaa !7
  %add1450.i3331 = add i32 %add1449.i3330, %1322
  br label %cleanup.cont1478.i3346

sw.bb1451.i3334:                                  ; preds = %cleanup.cont1431.i3327
  %1323 = load i32, i32* %add.ptr1442.i3326, align 4, !tbaa !7
  %sub1452.i3333 = sub i32 %1323, %1317
  br label %cleanup.cont1478.i3346

sw.bb1453.i3336:                                  ; preds = %cleanup.cont1431.i3327
  %1324 = load i32, i32* %add.ptr1442.i3326, align 4, !tbaa !7
  %or1460.i3335 = call i32 @llvm.fshr.i32(i32 %1324, i32 %1324, i32 %1317) #7
  br label %cleanup.cont1478.i3346

sw.bb1461.i3338:                                  ; preds = %cleanup.cont1431.i3327
  %1325 = load i32, i32* %add.ptr1442.i3326, align 4, !tbaa !7
  %or1468.i3337 = call i32 @llvm.fshl.i32(i32 %1325, i32 %1325, i32 %1317) #7
  br label %cleanup.cont1478.i3346

sw.bb1469.i3340:                                  ; preds = %cleanup.cont1431.i3327
  %1326 = load i32, i32* %add.ptr1442.i3326, align 4, !tbaa !7
  %xor1470.i3339 = xor i32 %1326, %1317
  br label %cleanup.cont1478.i3346

sw.default1472.i3341:                             ; preds = %cleanup.cont1431.i3327
  unreachable

cleanup.cont1478.i3346:                           ; preds = %sw.bb1469.i3340, %sw.bb1461.i3338, %sw.bb1453.i3336, %sw.bb1451.i3334, %sw.bb1447.i3332, %sw.bb1445.i3329
  %xor1470.i3339.sink = phi i32 [ %xor1470.i3339, %sw.bb1469.i3340 ], [ %or1468.i3337, %sw.bb1461.i3338 ], [ %or1460.i3335, %sw.bb1453.i3336 ], [ %sub1452.i3333, %sw.bb1451.i3334 ], [ %add1450.i3331, %sw.bb1447.i3332 ], [ %mul1446.i3328, %sw.bb1445.i3329 ]
  store i32 %xor1470.i3339.sink, i32* %add.ptr1442.i3326, align 4, !tbaa !7
  %1327 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 32, i32 1), align 1, !tbaa !17
  %idxprom1484.i3342 = zext i8 %1327 to i32
  %arrayidx1485.i3343 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1484.i3342
  %1328 = load i32, i32* %arrayidx1485.i3343, align 4, !tbaa !7
  %1329 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 32, i32 0), align 16, !tbaa !16
  %conv1488.i3344 = zext i8 %1329 to i32
  %add.ptr1489.i3345 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1488.i3344
  %1330 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 32, i32 2), align 2, !tbaa !14
  switch i8 %1330, label %sw.default1519.i3360 [
    i8 0, label %sw.bb1492.i3348
    i8 1, label %sw.bb1494.i3351
    i8 2, label %sw.bb1498.i3353
    i8 3, label %sw.bb1500.i3355
    i8 4, label %sw.bb1508.i3357
    i8 5, label %sw.bb1516.i3359
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1492.i3348:                                  ; preds = %cleanup.cont1478.i3346
  %1331 = load i32, i32* %add.ptr1489.i3345, align 4, !tbaa !7
  %mul1493.i3347 = mul i32 %1331, %1328
  br label %cleanup.cont1525.i3365

sw.bb1494.i3351:                                  ; preds = %cleanup.cont1478.i3346
  %1332 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 32, i32 3), align 4, !tbaa !18
  %add1496.i3349 = add i32 %1332, %1328
  %1333 = load i32, i32* %add.ptr1489.i3345, align 4, !tbaa !7
  %add1497.i3350 = add i32 %add1496.i3349, %1333
  br label %cleanup.cont1525.i3365

sw.bb1498.i3353:                                  ; preds = %cleanup.cont1478.i3346
  %1334 = load i32, i32* %add.ptr1489.i3345, align 4, !tbaa !7
  %sub1499.i3352 = sub i32 %1334, %1328
  br label %cleanup.cont1525.i3365

sw.bb1500.i3355:                                  ; preds = %cleanup.cont1478.i3346
  %1335 = load i32, i32* %add.ptr1489.i3345, align 4, !tbaa !7
  %or1507.i3354 = call i32 @llvm.fshr.i32(i32 %1335, i32 %1335, i32 %1328) #7
  br label %cleanup.cont1525.i3365

sw.bb1508.i3357:                                  ; preds = %cleanup.cont1478.i3346
  %1336 = load i32, i32* %add.ptr1489.i3345, align 4, !tbaa !7
  %or1515.i3356 = call i32 @llvm.fshl.i32(i32 %1336, i32 %1336, i32 %1328) #7
  br label %cleanup.cont1525.i3365

sw.bb1516.i3359:                                  ; preds = %cleanup.cont1478.i3346
  %1337 = load i32, i32* %add.ptr1489.i3345, align 4, !tbaa !7
  %xor1517.i3358 = xor i32 %1337, %1328
  br label %cleanup.cont1525.i3365

sw.default1519.i3360:                             ; preds = %cleanup.cont1478.i3346
  unreachable

cleanup.cont1525.i3365:                           ; preds = %sw.bb1516.i3359, %sw.bb1508.i3357, %sw.bb1500.i3355, %sw.bb1498.i3353, %sw.bb1494.i3351, %sw.bb1492.i3348
  %xor1517.i3358.sink = phi i32 [ %xor1517.i3358, %sw.bb1516.i3359 ], [ %or1515.i3356, %sw.bb1508.i3357 ], [ %or1507.i3354, %sw.bb1500.i3355 ], [ %sub1499.i3352, %sw.bb1498.i3353 ], [ %add1497.i3350, %sw.bb1494.i3351 ], [ %mul1493.i3347, %sw.bb1492.i3348 ]
  store i32 %xor1517.i3358.sink, i32* %add.ptr1489.i3345, align 4, !tbaa !7
  %1338 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 33, i32 1), align 1, !tbaa !17
  %idxprom1531.i3361 = zext i8 %1338 to i32
  %arrayidx1532.i3362 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1531.i3361
  %1339 = load i32, i32* %arrayidx1532.i3362, align 4, !tbaa !7
  %1340 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 33, i32 0), align 8, !tbaa !16
  %conv1535.i3363 = zext i8 %1340 to i32
  %add.ptr1536.i3364 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1535.i3363
  %1341 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 33, i32 2), align 2, !tbaa !14
  switch i8 %1341, label %sw.default1566.i3379 [
    i8 0, label %sw.bb1539.i3367
    i8 1, label %sw.bb1541.i3370
    i8 2, label %sw.bb1545.i3372
    i8 3, label %sw.bb1547.i3374
    i8 4, label %sw.bb1555.i3376
    i8 5, label %sw.bb1563.i3378
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1539.i3367:                                  ; preds = %cleanup.cont1525.i3365
  %1342 = load i32, i32* %add.ptr1536.i3364, align 4, !tbaa !7
  %mul1540.i3366 = mul i32 %1342, %1339
  br label %cleanup.cont1572.i3384

sw.bb1541.i3370:                                  ; preds = %cleanup.cont1525.i3365
  %1343 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 33, i32 3), align 4, !tbaa !18
  %add1543.i3368 = add i32 %1343, %1339
  %1344 = load i32, i32* %add.ptr1536.i3364, align 4, !tbaa !7
  %add1544.i3369 = add i32 %add1543.i3368, %1344
  br label %cleanup.cont1572.i3384

sw.bb1545.i3372:                                  ; preds = %cleanup.cont1525.i3365
  %1345 = load i32, i32* %add.ptr1536.i3364, align 4, !tbaa !7
  %sub1546.i3371 = sub i32 %1345, %1339
  br label %cleanup.cont1572.i3384

sw.bb1547.i3374:                                  ; preds = %cleanup.cont1525.i3365
  %1346 = load i32, i32* %add.ptr1536.i3364, align 4, !tbaa !7
  %or1554.i3373 = call i32 @llvm.fshr.i32(i32 %1346, i32 %1346, i32 %1339) #7
  br label %cleanup.cont1572.i3384

sw.bb1555.i3376:                                  ; preds = %cleanup.cont1525.i3365
  %1347 = load i32, i32* %add.ptr1536.i3364, align 4, !tbaa !7
  %or1562.i3375 = call i32 @llvm.fshl.i32(i32 %1347, i32 %1347, i32 %1339) #7
  br label %cleanup.cont1572.i3384

sw.bb1563.i3378:                                  ; preds = %cleanup.cont1525.i3365
  %1348 = load i32, i32* %add.ptr1536.i3364, align 4, !tbaa !7
  %xor1564.i3377 = xor i32 %1348, %1339
  br label %cleanup.cont1572.i3384

sw.default1566.i3379:                             ; preds = %cleanup.cont1525.i3365
  unreachable

cleanup.cont1572.i3384:                           ; preds = %sw.bb1563.i3378, %sw.bb1555.i3376, %sw.bb1547.i3374, %sw.bb1545.i3372, %sw.bb1541.i3370, %sw.bb1539.i3367
  %xor1564.i3377.sink = phi i32 [ %xor1564.i3377, %sw.bb1563.i3378 ], [ %or1562.i3375, %sw.bb1555.i3376 ], [ %or1554.i3373, %sw.bb1547.i3374 ], [ %sub1546.i3371, %sw.bb1545.i3372 ], [ %add1544.i3369, %sw.bb1541.i3370 ], [ %mul1540.i3366, %sw.bb1539.i3367 ]
  store i32 %xor1564.i3377.sink, i32* %add.ptr1536.i3364, align 4, !tbaa !7
  %1349 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 34, i32 1), align 1, !tbaa !17
  %idxprom1578.i3380 = zext i8 %1349 to i32
  %arrayidx1579.i3381 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1578.i3380
  %1350 = load i32, i32* %arrayidx1579.i3381, align 4, !tbaa !7
  %1351 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 34, i32 0), align 16, !tbaa !16
  %conv1582.i3382 = zext i8 %1351 to i32
  %add.ptr1583.i3383 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1582.i3382
  %1352 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 34, i32 2), align 2, !tbaa !14
  switch i8 %1352, label %sw.default1613.i3398 [
    i8 0, label %sw.bb1586.i3386
    i8 1, label %sw.bb1588.i3389
    i8 2, label %sw.bb1592.i3391
    i8 3, label %sw.bb1594.i3393
    i8 4, label %sw.bb1602.i3395
    i8 5, label %sw.bb1610.i3397
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1586.i3386:                                  ; preds = %cleanup.cont1572.i3384
  %1353 = load i32, i32* %add.ptr1583.i3383, align 4, !tbaa !7
  %mul1587.i3385 = mul i32 %1353, %1350
  br label %cleanup.cont1619.i3403

sw.bb1588.i3389:                                  ; preds = %cleanup.cont1572.i3384
  %1354 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 34, i32 3), align 4, !tbaa !18
  %add1590.i3387 = add i32 %1354, %1350
  %1355 = load i32, i32* %add.ptr1583.i3383, align 4, !tbaa !7
  %add1591.i3388 = add i32 %add1590.i3387, %1355
  br label %cleanup.cont1619.i3403

sw.bb1592.i3391:                                  ; preds = %cleanup.cont1572.i3384
  %1356 = load i32, i32* %add.ptr1583.i3383, align 4, !tbaa !7
  %sub1593.i3390 = sub i32 %1356, %1350
  br label %cleanup.cont1619.i3403

sw.bb1594.i3393:                                  ; preds = %cleanup.cont1572.i3384
  %1357 = load i32, i32* %add.ptr1583.i3383, align 4, !tbaa !7
  %or1601.i3392 = call i32 @llvm.fshr.i32(i32 %1357, i32 %1357, i32 %1350) #7
  br label %cleanup.cont1619.i3403

sw.bb1602.i3395:                                  ; preds = %cleanup.cont1572.i3384
  %1358 = load i32, i32* %add.ptr1583.i3383, align 4, !tbaa !7
  %or1609.i3394 = call i32 @llvm.fshl.i32(i32 %1358, i32 %1358, i32 %1350) #7
  br label %cleanup.cont1619.i3403

sw.bb1610.i3397:                                  ; preds = %cleanup.cont1572.i3384
  %1359 = load i32, i32* %add.ptr1583.i3383, align 4, !tbaa !7
  %xor1611.i3396 = xor i32 %1359, %1350
  br label %cleanup.cont1619.i3403

sw.default1613.i3398:                             ; preds = %cleanup.cont1572.i3384
  unreachable

cleanup.cont1619.i3403:                           ; preds = %sw.bb1610.i3397, %sw.bb1602.i3395, %sw.bb1594.i3393, %sw.bb1592.i3391, %sw.bb1588.i3389, %sw.bb1586.i3386
  %xor1611.i3396.sink = phi i32 [ %xor1611.i3396, %sw.bb1610.i3397 ], [ %or1609.i3394, %sw.bb1602.i3395 ], [ %or1601.i3392, %sw.bb1594.i3393 ], [ %sub1593.i3390, %sw.bb1592.i3391 ], [ %add1591.i3388, %sw.bb1588.i3389 ], [ %mul1587.i3385, %sw.bb1586.i3386 ]
  store i32 %xor1611.i3396.sink, i32* %add.ptr1583.i3383, align 4, !tbaa !7
  %1360 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 35, i32 1), align 1, !tbaa !17
  %idxprom1625.i3399 = zext i8 %1360 to i32
  %arrayidx1626.i3400 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1625.i3399
  %1361 = load i32, i32* %arrayidx1626.i3400, align 4, !tbaa !7
  %1362 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 35, i32 0), align 8, !tbaa !16
  %conv1629.i3401 = zext i8 %1362 to i32
  %add.ptr1630.i3402 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1629.i3401
  %1363 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 35, i32 2), align 2, !tbaa !14
  switch i8 %1363, label %sw.default1660.i3417 [
    i8 0, label %sw.bb1633.i3405
    i8 1, label %sw.bb1635.i3408
    i8 2, label %sw.bb1639.i3410
    i8 3, label %sw.bb1641.i3412
    i8 4, label %sw.bb1649.i3414
    i8 5, label %sw.bb1657.i3416
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1633.i3405:                                  ; preds = %cleanup.cont1619.i3403
  %1364 = load i32, i32* %add.ptr1630.i3402, align 4, !tbaa !7
  %mul1634.i3404 = mul i32 %1364, %1361
  br label %cleanup.cont1666.i3422

sw.bb1635.i3408:                                  ; preds = %cleanup.cont1619.i3403
  %1365 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 35, i32 3), align 4, !tbaa !18
  %add1637.i3406 = add i32 %1365, %1361
  %1366 = load i32, i32* %add.ptr1630.i3402, align 4, !tbaa !7
  %add1638.i3407 = add i32 %add1637.i3406, %1366
  br label %cleanup.cont1666.i3422

sw.bb1639.i3410:                                  ; preds = %cleanup.cont1619.i3403
  %1367 = load i32, i32* %add.ptr1630.i3402, align 4, !tbaa !7
  %sub1640.i3409 = sub i32 %1367, %1361
  br label %cleanup.cont1666.i3422

sw.bb1641.i3412:                                  ; preds = %cleanup.cont1619.i3403
  %1368 = load i32, i32* %add.ptr1630.i3402, align 4, !tbaa !7
  %or1648.i3411 = call i32 @llvm.fshr.i32(i32 %1368, i32 %1368, i32 %1361) #7
  br label %cleanup.cont1666.i3422

sw.bb1649.i3414:                                  ; preds = %cleanup.cont1619.i3403
  %1369 = load i32, i32* %add.ptr1630.i3402, align 4, !tbaa !7
  %or1656.i3413 = call i32 @llvm.fshl.i32(i32 %1369, i32 %1369, i32 %1361) #7
  br label %cleanup.cont1666.i3422

sw.bb1657.i3416:                                  ; preds = %cleanup.cont1619.i3403
  %1370 = load i32, i32* %add.ptr1630.i3402, align 4, !tbaa !7
  %xor1658.i3415 = xor i32 %1370, %1361
  br label %cleanup.cont1666.i3422

sw.default1660.i3417:                             ; preds = %cleanup.cont1619.i3403
  unreachable

cleanup.cont1666.i3422:                           ; preds = %sw.bb1657.i3416, %sw.bb1649.i3414, %sw.bb1641.i3412, %sw.bb1639.i3410, %sw.bb1635.i3408, %sw.bb1633.i3405
  %xor1658.i3415.sink = phi i32 [ %xor1658.i3415, %sw.bb1657.i3416 ], [ %or1656.i3413, %sw.bb1649.i3414 ], [ %or1648.i3411, %sw.bb1641.i3412 ], [ %sub1640.i3409, %sw.bb1639.i3410 ], [ %add1638.i3407, %sw.bb1635.i3408 ], [ %mul1634.i3404, %sw.bb1633.i3405 ]
  store i32 %xor1658.i3415.sink, i32* %add.ptr1630.i3402, align 4, !tbaa !7
  %1371 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 36, i32 1), align 1, !tbaa !17
  %idxprom1672.i3418 = zext i8 %1371 to i32
  %arrayidx1673.i3419 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1672.i3418
  %1372 = load i32, i32* %arrayidx1673.i3419, align 4, !tbaa !7
  %1373 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 36, i32 0), align 16, !tbaa !16
  %conv1676.i3420 = zext i8 %1373 to i32
  %add.ptr1677.i3421 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1676.i3420
  %1374 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 36, i32 2), align 2, !tbaa !14
  switch i8 %1374, label %sw.default1707.i3436 [
    i8 0, label %sw.bb1680.i3424
    i8 1, label %sw.bb1682.i3427
    i8 2, label %sw.bb1686.i3429
    i8 3, label %sw.bb1688.i3431
    i8 4, label %sw.bb1696.i3433
    i8 5, label %sw.bb1704.i3435
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1680.i3424:                                  ; preds = %cleanup.cont1666.i3422
  %1375 = load i32, i32* %add.ptr1677.i3421, align 4, !tbaa !7
  %mul1681.i3423 = mul i32 %1375, %1372
  br label %cleanup.cont1713.i3441

sw.bb1682.i3427:                                  ; preds = %cleanup.cont1666.i3422
  %1376 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 36, i32 3), align 4, !tbaa !18
  %add1684.i3425 = add i32 %1376, %1372
  %1377 = load i32, i32* %add.ptr1677.i3421, align 4, !tbaa !7
  %add1685.i3426 = add i32 %add1684.i3425, %1377
  br label %cleanup.cont1713.i3441

sw.bb1686.i3429:                                  ; preds = %cleanup.cont1666.i3422
  %1378 = load i32, i32* %add.ptr1677.i3421, align 4, !tbaa !7
  %sub1687.i3428 = sub i32 %1378, %1372
  br label %cleanup.cont1713.i3441

sw.bb1688.i3431:                                  ; preds = %cleanup.cont1666.i3422
  %1379 = load i32, i32* %add.ptr1677.i3421, align 4, !tbaa !7
  %or1695.i3430 = call i32 @llvm.fshr.i32(i32 %1379, i32 %1379, i32 %1372) #7
  br label %cleanup.cont1713.i3441

sw.bb1696.i3433:                                  ; preds = %cleanup.cont1666.i3422
  %1380 = load i32, i32* %add.ptr1677.i3421, align 4, !tbaa !7
  %or1703.i3432 = call i32 @llvm.fshl.i32(i32 %1380, i32 %1380, i32 %1372) #7
  br label %cleanup.cont1713.i3441

sw.bb1704.i3435:                                  ; preds = %cleanup.cont1666.i3422
  %1381 = load i32, i32* %add.ptr1677.i3421, align 4, !tbaa !7
  %xor1705.i3434 = xor i32 %1381, %1372
  br label %cleanup.cont1713.i3441

sw.default1707.i3436:                             ; preds = %cleanup.cont1666.i3422
  unreachable

cleanup.cont1713.i3441:                           ; preds = %sw.bb1704.i3435, %sw.bb1696.i3433, %sw.bb1688.i3431, %sw.bb1686.i3429, %sw.bb1682.i3427, %sw.bb1680.i3424
  %xor1705.i3434.sink = phi i32 [ %xor1705.i3434, %sw.bb1704.i3435 ], [ %or1703.i3432, %sw.bb1696.i3433 ], [ %or1695.i3430, %sw.bb1688.i3431 ], [ %sub1687.i3428, %sw.bb1686.i3429 ], [ %add1685.i3426, %sw.bb1682.i3427 ], [ %mul1681.i3423, %sw.bb1680.i3424 ]
  store i32 %xor1705.i3434.sink, i32* %add.ptr1677.i3421, align 4, !tbaa !7
  %1382 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 37, i32 1), align 1, !tbaa !17
  %idxprom1719.i3437 = zext i8 %1382 to i32
  %arrayidx1720.i3438 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1719.i3437
  %1383 = load i32, i32* %arrayidx1720.i3438, align 4, !tbaa !7
  %1384 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 37, i32 0), align 8, !tbaa !16
  %conv1723.i3439 = zext i8 %1384 to i32
  %add.ptr1724.i3440 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1723.i3439
  %1385 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 37, i32 2), align 2, !tbaa !14
  switch i8 %1385, label %sw.default1754.i3455 [
    i8 0, label %sw.bb1727.i3443
    i8 1, label %sw.bb1729.i3446
    i8 2, label %sw.bb1733.i3448
    i8 3, label %sw.bb1735.i3450
    i8 4, label %sw.bb1743.i3452
    i8 5, label %sw.bb1751.i3454
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1727.i3443:                                  ; preds = %cleanup.cont1713.i3441
  %1386 = load i32, i32* %add.ptr1724.i3440, align 4, !tbaa !7
  %mul1728.i3442 = mul i32 %1386, %1383
  br label %cleanup.cont1760.i3460

sw.bb1729.i3446:                                  ; preds = %cleanup.cont1713.i3441
  %1387 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 37, i32 3), align 4, !tbaa !18
  %add1731.i3444 = add i32 %1387, %1383
  %1388 = load i32, i32* %add.ptr1724.i3440, align 4, !tbaa !7
  %add1732.i3445 = add i32 %add1731.i3444, %1388
  br label %cleanup.cont1760.i3460

sw.bb1733.i3448:                                  ; preds = %cleanup.cont1713.i3441
  %1389 = load i32, i32* %add.ptr1724.i3440, align 4, !tbaa !7
  %sub1734.i3447 = sub i32 %1389, %1383
  br label %cleanup.cont1760.i3460

sw.bb1735.i3450:                                  ; preds = %cleanup.cont1713.i3441
  %1390 = load i32, i32* %add.ptr1724.i3440, align 4, !tbaa !7
  %or1742.i3449 = call i32 @llvm.fshr.i32(i32 %1390, i32 %1390, i32 %1383) #7
  br label %cleanup.cont1760.i3460

sw.bb1743.i3452:                                  ; preds = %cleanup.cont1713.i3441
  %1391 = load i32, i32* %add.ptr1724.i3440, align 4, !tbaa !7
  %or1750.i3451 = call i32 @llvm.fshl.i32(i32 %1391, i32 %1391, i32 %1383) #7
  br label %cleanup.cont1760.i3460

sw.bb1751.i3454:                                  ; preds = %cleanup.cont1713.i3441
  %1392 = load i32, i32* %add.ptr1724.i3440, align 4, !tbaa !7
  %xor1752.i3453 = xor i32 %1392, %1383
  br label %cleanup.cont1760.i3460

sw.default1754.i3455:                             ; preds = %cleanup.cont1713.i3441
  unreachable

cleanup.cont1760.i3460:                           ; preds = %sw.bb1751.i3454, %sw.bb1743.i3452, %sw.bb1735.i3450, %sw.bb1733.i3448, %sw.bb1729.i3446, %sw.bb1727.i3443
  %xor1752.i3453.sink = phi i32 [ %xor1752.i3453, %sw.bb1751.i3454 ], [ %or1750.i3451, %sw.bb1743.i3452 ], [ %or1742.i3449, %sw.bb1735.i3450 ], [ %sub1734.i3447, %sw.bb1733.i3448 ], [ %add1732.i3445, %sw.bb1729.i3446 ], [ %mul1728.i3442, %sw.bb1727.i3443 ]
  store i32 %xor1752.i3453.sink, i32* %add.ptr1724.i3440, align 4, !tbaa !7
  %1393 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 38, i32 1), align 1, !tbaa !17
  %idxprom1766.i3456 = zext i8 %1393 to i32
  %arrayidx1767.i3457 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1766.i3456
  %1394 = load i32, i32* %arrayidx1767.i3457, align 4, !tbaa !7
  %1395 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 38, i32 0), align 16, !tbaa !16
  %conv1770.i3458 = zext i8 %1395 to i32
  %add.ptr1771.i3459 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1770.i3458
  %1396 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 38, i32 2), align 2, !tbaa !14
  switch i8 %1396, label %sw.default1801.i3474 [
    i8 0, label %sw.bb1774.i3462
    i8 1, label %sw.bb1776.i3465
    i8 2, label %sw.bb1780.i3467
    i8 3, label %sw.bb1782.i3469
    i8 4, label %sw.bb1790.i3471
    i8 5, label %sw.bb1798.i3473
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1774.i3462:                                  ; preds = %cleanup.cont1760.i3460
  %1397 = load i32, i32* %add.ptr1771.i3459, align 4, !tbaa !7
  %mul1775.i3461 = mul i32 %1397, %1394
  br label %cleanup.cont1807.i3479

sw.bb1776.i3465:                                  ; preds = %cleanup.cont1760.i3460
  %1398 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 38, i32 3), align 4, !tbaa !18
  %add1778.i3463 = add i32 %1398, %1394
  %1399 = load i32, i32* %add.ptr1771.i3459, align 4, !tbaa !7
  %add1779.i3464 = add i32 %add1778.i3463, %1399
  br label %cleanup.cont1807.i3479

sw.bb1780.i3467:                                  ; preds = %cleanup.cont1760.i3460
  %1400 = load i32, i32* %add.ptr1771.i3459, align 4, !tbaa !7
  %sub1781.i3466 = sub i32 %1400, %1394
  br label %cleanup.cont1807.i3479

sw.bb1782.i3469:                                  ; preds = %cleanup.cont1760.i3460
  %1401 = load i32, i32* %add.ptr1771.i3459, align 4, !tbaa !7
  %or1789.i3468 = call i32 @llvm.fshr.i32(i32 %1401, i32 %1401, i32 %1394) #7
  br label %cleanup.cont1807.i3479

sw.bb1790.i3471:                                  ; preds = %cleanup.cont1760.i3460
  %1402 = load i32, i32* %add.ptr1771.i3459, align 4, !tbaa !7
  %or1797.i3470 = call i32 @llvm.fshl.i32(i32 %1402, i32 %1402, i32 %1394) #7
  br label %cleanup.cont1807.i3479

sw.bb1798.i3473:                                  ; preds = %cleanup.cont1760.i3460
  %1403 = load i32, i32* %add.ptr1771.i3459, align 4, !tbaa !7
  %xor1799.i3472 = xor i32 %1403, %1394
  br label %cleanup.cont1807.i3479

sw.default1801.i3474:                             ; preds = %cleanup.cont1760.i3460
  unreachable

cleanup.cont1807.i3479:                           ; preds = %sw.bb1798.i3473, %sw.bb1790.i3471, %sw.bb1782.i3469, %sw.bb1780.i3467, %sw.bb1776.i3465, %sw.bb1774.i3462
  %xor1799.i3472.sink = phi i32 [ %xor1799.i3472, %sw.bb1798.i3473 ], [ %or1797.i3470, %sw.bb1790.i3471 ], [ %or1789.i3468, %sw.bb1782.i3469 ], [ %sub1781.i3466, %sw.bb1780.i3467 ], [ %add1779.i3464, %sw.bb1776.i3465 ], [ %mul1775.i3461, %sw.bb1774.i3462 ]
  store i32 %xor1799.i3472.sink, i32* %add.ptr1771.i3459, align 4, !tbaa !7
  %1404 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 39, i32 1), align 1, !tbaa !17
  %idxprom1813.i3475 = zext i8 %1404 to i32
  %arrayidx1814.i3476 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1813.i3475
  %1405 = load i32, i32* %arrayidx1814.i3476, align 4, !tbaa !7
  %1406 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 39, i32 0), align 8, !tbaa !16
  %conv1817.i3477 = zext i8 %1406 to i32
  %add.ptr1818.i3478 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1817.i3477
  %1407 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 39, i32 2), align 2, !tbaa !14
  switch i8 %1407, label %sw.default1848.i3493 [
    i8 0, label %sw.bb1821.i3481
    i8 1, label %sw.bb1823.i3484
    i8 2, label %sw.bb1827.i3486
    i8 3, label %sw.bb1829.i3488
    i8 4, label %sw.bb1837.i3490
    i8 5, label %sw.bb1845.i3492
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1821.i3481:                                  ; preds = %cleanup.cont1807.i3479
  %1408 = load i32, i32* %add.ptr1818.i3478, align 4, !tbaa !7
  %mul1822.i3480 = mul i32 %1408, %1405
  br label %cleanup.cont1854.i3498

sw.bb1823.i3484:                                  ; preds = %cleanup.cont1807.i3479
  %1409 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 39, i32 3), align 4, !tbaa !18
  %add1825.i3482 = add i32 %1409, %1405
  %1410 = load i32, i32* %add.ptr1818.i3478, align 4, !tbaa !7
  %add1826.i3483 = add i32 %add1825.i3482, %1410
  br label %cleanup.cont1854.i3498

sw.bb1827.i3486:                                  ; preds = %cleanup.cont1807.i3479
  %1411 = load i32, i32* %add.ptr1818.i3478, align 4, !tbaa !7
  %sub1828.i3485 = sub i32 %1411, %1405
  br label %cleanup.cont1854.i3498

sw.bb1829.i3488:                                  ; preds = %cleanup.cont1807.i3479
  %1412 = load i32, i32* %add.ptr1818.i3478, align 4, !tbaa !7
  %or1836.i3487 = call i32 @llvm.fshr.i32(i32 %1412, i32 %1412, i32 %1405) #7
  br label %cleanup.cont1854.i3498

sw.bb1837.i3490:                                  ; preds = %cleanup.cont1807.i3479
  %1413 = load i32, i32* %add.ptr1818.i3478, align 4, !tbaa !7
  %or1844.i3489 = call i32 @llvm.fshl.i32(i32 %1413, i32 %1413, i32 %1405) #7
  br label %cleanup.cont1854.i3498

sw.bb1845.i3492:                                  ; preds = %cleanup.cont1807.i3479
  %1414 = load i32, i32* %add.ptr1818.i3478, align 4, !tbaa !7
  %xor1846.i3491 = xor i32 %1414, %1405
  br label %cleanup.cont1854.i3498

sw.default1848.i3493:                             ; preds = %cleanup.cont1807.i3479
  unreachable

cleanup.cont1854.i3498:                           ; preds = %sw.bb1845.i3492, %sw.bb1837.i3490, %sw.bb1829.i3488, %sw.bb1827.i3486, %sw.bb1823.i3484, %sw.bb1821.i3481
  %xor1846.i3491.sink = phi i32 [ %xor1846.i3491, %sw.bb1845.i3492 ], [ %or1844.i3489, %sw.bb1837.i3490 ], [ %or1836.i3487, %sw.bb1829.i3488 ], [ %sub1828.i3485, %sw.bb1827.i3486 ], [ %add1826.i3483, %sw.bb1823.i3484 ], [ %mul1822.i3480, %sw.bb1821.i3481 ]
  store i32 %xor1846.i3491.sink, i32* %add.ptr1818.i3478, align 4, !tbaa !7
  %1415 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 40, i32 1), align 1, !tbaa !17
  %idxprom1860.i3494 = zext i8 %1415 to i32
  %arrayidx1861.i3495 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1860.i3494
  %1416 = load i32, i32* %arrayidx1861.i3495, align 4, !tbaa !7
  %1417 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 40, i32 0), align 16, !tbaa !16
  %conv1864.i3496 = zext i8 %1417 to i32
  %add.ptr1865.i3497 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1864.i3496
  %1418 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 40, i32 2), align 2, !tbaa !14
  switch i8 %1418, label %sw.default1895.i3512 [
    i8 0, label %sw.bb1868.i3500
    i8 1, label %sw.bb1870.i3503
    i8 2, label %sw.bb1874.i3505
    i8 3, label %sw.bb1876.i3507
    i8 4, label %sw.bb1884.i3509
    i8 5, label %sw.bb1892.i3511
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1868.i3500:                                  ; preds = %cleanup.cont1854.i3498
  %1419 = load i32, i32* %add.ptr1865.i3497, align 4, !tbaa !7
  %mul1869.i3499 = mul i32 %1419, %1416
  br label %cleanup.cont1901.i3517

sw.bb1870.i3503:                                  ; preds = %cleanup.cont1854.i3498
  %1420 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 40, i32 3), align 4, !tbaa !18
  %add1872.i3501 = add i32 %1420, %1416
  %1421 = load i32, i32* %add.ptr1865.i3497, align 4, !tbaa !7
  %add1873.i3502 = add i32 %add1872.i3501, %1421
  br label %cleanup.cont1901.i3517

sw.bb1874.i3505:                                  ; preds = %cleanup.cont1854.i3498
  %1422 = load i32, i32* %add.ptr1865.i3497, align 4, !tbaa !7
  %sub1875.i3504 = sub i32 %1422, %1416
  br label %cleanup.cont1901.i3517

sw.bb1876.i3507:                                  ; preds = %cleanup.cont1854.i3498
  %1423 = load i32, i32* %add.ptr1865.i3497, align 4, !tbaa !7
  %or1883.i3506 = call i32 @llvm.fshr.i32(i32 %1423, i32 %1423, i32 %1416) #7
  br label %cleanup.cont1901.i3517

sw.bb1884.i3509:                                  ; preds = %cleanup.cont1854.i3498
  %1424 = load i32, i32* %add.ptr1865.i3497, align 4, !tbaa !7
  %or1891.i3508 = call i32 @llvm.fshl.i32(i32 %1424, i32 %1424, i32 %1416) #7
  br label %cleanup.cont1901.i3517

sw.bb1892.i3511:                                  ; preds = %cleanup.cont1854.i3498
  %1425 = load i32, i32* %add.ptr1865.i3497, align 4, !tbaa !7
  %xor1893.i3510 = xor i32 %1425, %1416
  br label %cleanup.cont1901.i3517

sw.default1895.i3512:                             ; preds = %cleanup.cont1854.i3498
  unreachable

cleanup.cont1901.i3517:                           ; preds = %sw.bb1892.i3511, %sw.bb1884.i3509, %sw.bb1876.i3507, %sw.bb1874.i3505, %sw.bb1870.i3503, %sw.bb1868.i3500
  %xor1893.i3510.sink = phi i32 [ %xor1893.i3510, %sw.bb1892.i3511 ], [ %or1891.i3508, %sw.bb1884.i3509 ], [ %or1883.i3506, %sw.bb1876.i3507 ], [ %sub1875.i3504, %sw.bb1874.i3505 ], [ %add1873.i3502, %sw.bb1870.i3503 ], [ %mul1869.i3499, %sw.bb1868.i3500 ]
  store i32 %xor1893.i3510.sink, i32* %add.ptr1865.i3497, align 4, !tbaa !7
  %1426 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 41, i32 1), align 1, !tbaa !17
  %idxprom1907.i3513 = zext i8 %1426 to i32
  %arrayidx1908.i3514 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1907.i3513
  %1427 = load i32, i32* %arrayidx1908.i3514, align 4, !tbaa !7
  %1428 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 41, i32 0), align 8, !tbaa !16
  %conv1911.i3515 = zext i8 %1428 to i32
  %add.ptr1912.i3516 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1911.i3515
  %1429 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 41, i32 2), align 2, !tbaa !14
  switch i8 %1429, label %sw.default1942.i3531 [
    i8 0, label %sw.bb1915.i3519
    i8 1, label %sw.bb1917.i3522
    i8 2, label %sw.bb1921.i3524
    i8 3, label %sw.bb1923.i3526
    i8 4, label %sw.bb1931.i3528
    i8 5, label %sw.bb1939.i3530
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1915.i3519:                                  ; preds = %cleanup.cont1901.i3517
  %1430 = load i32, i32* %add.ptr1912.i3516, align 4, !tbaa !7
  %mul1916.i3518 = mul i32 %1430, %1427
  br label %cleanup.cont1948.i3536

sw.bb1917.i3522:                                  ; preds = %cleanup.cont1901.i3517
  %1431 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 41, i32 3), align 4, !tbaa !18
  %add1919.i3520 = add i32 %1431, %1427
  %1432 = load i32, i32* %add.ptr1912.i3516, align 4, !tbaa !7
  %add1920.i3521 = add i32 %add1919.i3520, %1432
  br label %cleanup.cont1948.i3536

sw.bb1921.i3524:                                  ; preds = %cleanup.cont1901.i3517
  %1433 = load i32, i32* %add.ptr1912.i3516, align 4, !tbaa !7
  %sub1922.i3523 = sub i32 %1433, %1427
  br label %cleanup.cont1948.i3536

sw.bb1923.i3526:                                  ; preds = %cleanup.cont1901.i3517
  %1434 = load i32, i32* %add.ptr1912.i3516, align 4, !tbaa !7
  %or1930.i3525 = call i32 @llvm.fshr.i32(i32 %1434, i32 %1434, i32 %1427) #7
  br label %cleanup.cont1948.i3536

sw.bb1931.i3528:                                  ; preds = %cleanup.cont1901.i3517
  %1435 = load i32, i32* %add.ptr1912.i3516, align 4, !tbaa !7
  %or1938.i3527 = call i32 @llvm.fshl.i32(i32 %1435, i32 %1435, i32 %1427) #7
  br label %cleanup.cont1948.i3536

sw.bb1939.i3530:                                  ; preds = %cleanup.cont1901.i3517
  %1436 = load i32, i32* %add.ptr1912.i3516, align 4, !tbaa !7
  %xor1940.i3529 = xor i32 %1436, %1427
  br label %cleanup.cont1948.i3536

sw.default1942.i3531:                             ; preds = %cleanup.cont1901.i3517
  unreachable

cleanup.cont1948.i3536:                           ; preds = %sw.bb1939.i3530, %sw.bb1931.i3528, %sw.bb1923.i3526, %sw.bb1921.i3524, %sw.bb1917.i3522, %sw.bb1915.i3519
  %xor1940.i3529.sink = phi i32 [ %xor1940.i3529, %sw.bb1939.i3530 ], [ %or1938.i3527, %sw.bb1931.i3528 ], [ %or1930.i3525, %sw.bb1923.i3526 ], [ %sub1922.i3523, %sw.bb1921.i3524 ], [ %add1920.i3521, %sw.bb1917.i3522 ], [ %mul1916.i3518, %sw.bb1915.i3519 ]
  store i32 %xor1940.i3529.sink, i32* %add.ptr1912.i3516, align 4, !tbaa !7
  %1437 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 42, i32 1), align 1, !tbaa !17
  %idxprom1954.i3532 = zext i8 %1437 to i32
  %arrayidx1955.i3533 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1954.i3532
  %1438 = load i32, i32* %arrayidx1955.i3533, align 4, !tbaa !7
  %1439 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 42, i32 0), align 16, !tbaa !16
  %conv1958.i3534 = zext i8 %1439 to i32
  %add.ptr1959.i3535 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1958.i3534
  %1440 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 42, i32 2), align 2, !tbaa !14
  switch i8 %1440, label %sw.default1989.i3550 [
    i8 0, label %sw.bb1962.i3538
    i8 1, label %sw.bb1964.i3541
    i8 2, label %sw.bb1968.i3543
    i8 3, label %sw.bb1970.i3545
    i8 4, label %sw.bb1978.i3547
    i8 5, label %sw.bb1986.i3549
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb1962.i3538:                                  ; preds = %cleanup.cont1948.i3536
  %1441 = load i32, i32* %add.ptr1959.i3535, align 4, !tbaa !7
  %mul1963.i3537 = mul i32 %1441, %1438
  br label %cleanup.cont1995.i3555

sw.bb1964.i3541:                                  ; preds = %cleanup.cont1948.i3536
  %1442 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 42, i32 3), align 4, !tbaa !18
  %add1966.i3539 = add i32 %1442, %1438
  %1443 = load i32, i32* %add.ptr1959.i3535, align 4, !tbaa !7
  %add1967.i3540 = add i32 %add1966.i3539, %1443
  br label %cleanup.cont1995.i3555

sw.bb1968.i3543:                                  ; preds = %cleanup.cont1948.i3536
  %1444 = load i32, i32* %add.ptr1959.i3535, align 4, !tbaa !7
  %sub1969.i3542 = sub i32 %1444, %1438
  br label %cleanup.cont1995.i3555

sw.bb1970.i3545:                                  ; preds = %cleanup.cont1948.i3536
  %1445 = load i32, i32* %add.ptr1959.i3535, align 4, !tbaa !7
  %or1977.i3544 = call i32 @llvm.fshr.i32(i32 %1445, i32 %1445, i32 %1438) #7
  br label %cleanup.cont1995.i3555

sw.bb1978.i3547:                                  ; preds = %cleanup.cont1948.i3536
  %1446 = load i32, i32* %add.ptr1959.i3535, align 4, !tbaa !7
  %or1985.i3546 = call i32 @llvm.fshl.i32(i32 %1446, i32 %1446, i32 %1438) #7
  br label %cleanup.cont1995.i3555

sw.bb1986.i3549:                                  ; preds = %cleanup.cont1948.i3536
  %1447 = load i32, i32* %add.ptr1959.i3535, align 4, !tbaa !7
  %xor1987.i3548 = xor i32 %1447, %1438
  br label %cleanup.cont1995.i3555

sw.default1989.i3550:                             ; preds = %cleanup.cont1948.i3536
  unreachable

cleanup.cont1995.i3555:                           ; preds = %sw.bb1986.i3549, %sw.bb1978.i3547, %sw.bb1970.i3545, %sw.bb1968.i3543, %sw.bb1964.i3541, %sw.bb1962.i3538
  %xor1987.i3548.sink = phi i32 [ %xor1987.i3548, %sw.bb1986.i3549 ], [ %or1985.i3546, %sw.bb1978.i3547 ], [ %or1977.i3544, %sw.bb1970.i3545 ], [ %sub1969.i3542, %sw.bb1968.i3543 ], [ %add1967.i3540, %sw.bb1964.i3541 ], [ %mul1963.i3537, %sw.bb1962.i3538 ]
  store i32 %xor1987.i3548.sink, i32* %add.ptr1959.i3535, align 4, !tbaa !7
  %1448 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 43, i32 1), align 1, !tbaa !17
  %idxprom2001.i3551 = zext i8 %1448 to i32
  %arrayidx2002.i3552 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2001.i3551
  %1449 = load i32, i32* %arrayidx2002.i3552, align 4, !tbaa !7
  %1450 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 43, i32 0), align 8, !tbaa !16
  %conv2005.i3553 = zext i8 %1450 to i32
  %add.ptr2006.i3554 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2005.i3553
  %1451 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 43, i32 2), align 2, !tbaa !14
  switch i8 %1451, label %sw.default2036.i3569 [
    i8 0, label %sw.bb2009.i3557
    i8 1, label %sw.bb2011.i3560
    i8 2, label %sw.bb2015.i3562
    i8 3, label %sw.bb2017.i3564
    i8 4, label %sw.bb2025.i3566
    i8 5, label %sw.bb2033.i3568
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2009.i3557:                                  ; preds = %cleanup.cont1995.i3555
  %1452 = load i32, i32* %add.ptr2006.i3554, align 4, !tbaa !7
  %mul2010.i3556 = mul i32 %1452, %1449
  br label %cleanup.cont2042.i3574

sw.bb2011.i3560:                                  ; preds = %cleanup.cont1995.i3555
  %1453 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 43, i32 3), align 4, !tbaa !18
  %add2013.i3558 = add i32 %1453, %1449
  %1454 = load i32, i32* %add.ptr2006.i3554, align 4, !tbaa !7
  %add2014.i3559 = add i32 %add2013.i3558, %1454
  br label %cleanup.cont2042.i3574

sw.bb2015.i3562:                                  ; preds = %cleanup.cont1995.i3555
  %1455 = load i32, i32* %add.ptr2006.i3554, align 4, !tbaa !7
  %sub2016.i3561 = sub i32 %1455, %1449
  br label %cleanup.cont2042.i3574

sw.bb2017.i3564:                                  ; preds = %cleanup.cont1995.i3555
  %1456 = load i32, i32* %add.ptr2006.i3554, align 4, !tbaa !7
  %or2024.i3563 = call i32 @llvm.fshr.i32(i32 %1456, i32 %1456, i32 %1449) #7
  br label %cleanup.cont2042.i3574

sw.bb2025.i3566:                                  ; preds = %cleanup.cont1995.i3555
  %1457 = load i32, i32* %add.ptr2006.i3554, align 4, !tbaa !7
  %or2032.i3565 = call i32 @llvm.fshl.i32(i32 %1457, i32 %1457, i32 %1449) #7
  br label %cleanup.cont2042.i3574

sw.bb2033.i3568:                                  ; preds = %cleanup.cont1995.i3555
  %1458 = load i32, i32* %add.ptr2006.i3554, align 4, !tbaa !7
  %xor2034.i3567 = xor i32 %1458, %1449
  br label %cleanup.cont2042.i3574

sw.default2036.i3569:                             ; preds = %cleanup.cont1995.i3555
  unreachable

cleanup.cont2042.i3574:                           ; preds = %sw.bb2033.i3568, %sw.bb2025.i3566, %sw.bb2017.i3564, %sw.bb2015.i3562, %sw.bb2011.i3560, %sw.bb2009.i3557
  %xor2034.i3567.sink = phi i32 [ %xor2034.i3567, %sw.bb2033.i3568 ], [ %or2032.i3565, %sw.bb2025.i3566 ], [ %or2024.i3563, %sw.bb2017.i3564 ], [ %sub2016.i3561, %sw.bb2015.i3562 ], [ %add2014.i3559, %sw.bb2011.i3560 ], [ %mul2010.i3556, %sw.bb2009.i3557 ]
  store i32 %xor2034.i3567.sink, i32* %add.ptr2006.i3554, align 4, !tbaa !7
  %1459 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 44, i32 1), align 1, !tbaa !17
  %idxprom2048.i3570 = zext i8 %1459 to i32
  %arrayidx2049.i3571 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2048.i3570
  %1460 = load i32, i32* %arrayidx2049.i3571, align 4, !tbaa !7
  %1461 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 44, i32 0), align 16, !tbaa !16
  %conv2052.i3572 = zext i8 %1461 to i32
  %add.ptr2053.i3573 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2052.i3572
  %1462 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 44, i32 2), align 2, !tbaa !14
  switch i8 %1462, label %sw.default2083.i3588 [
    i8 0, label %sw.bb2056.i3576
    i8 1, label %sw.bb2058.i3579
    i8 2, label %sw.bb2062.i3581
    i8 3, label %sw.bb2064.i3583
    i8 4, label %sw.bb2072.i3585
    i8 5, label %sw.bb2080.i3587
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2056.i3576:                                  ; preds = %cleanup.cont2042.i3574
  %1463 = load i32, i32* %add.ptr2053.i3573, align 4, !tbaa !7
  %mul2057.i3575 = mul i32 %1463, %1460
  br label %cleanup.cont2089.i3593

sw.bb2058.i3579:                                  ; preds = %cleanup.cont2042.i3574
  %1464 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 44, i32 3), align 4, !tbaa !18
  %add2060.i3577 = add i32 %1464, %1460
  %1465 = load i32, i32* %add.ptr2053.i3573, align 4, !tbaa !7
  %add2061.i3578 = add i32 %add2060.i3577, %1465
  br label %cleanup.cont2089.i3593

sw.bb2062.i3581:                                  ; preds = %cleanup.cont2042.i3574
  %1466 = load i32, i32* %add.ptr2053.i3573, align 4, !tbaa !7
  %sub2063.i3580 = sub i32 %1466, %1460
  br label %cleanup.cont2089.i3593

sw.bb2064.i3583:                                  ; preds = %cleanup.cont2042.i3574
  %1467 = load i32, i32* %add.ptr2053.i3573, align 4, !tbaa !7
  %or2071.i3582 = call i32 @llvm.fshr.i32(i32 %1467, i32 %1467, i32 %1460) #7
  br label %cleanup.cont2089.i3593

sw.bb2072.i3585:                                  ; preds = %cleanup.cont2042.i3574
  %1468 = load i32, i32* %add.ptr2053.i3573, align 4, !tbaa !7
  %or2079.i3584 = call i32 @llvm.fshl.i32(i32 %1468, i32 %1468, i32 %1460) #7
  br label %cleanup.cont2089.i3593

sw.bb2080.i3587:                                  ; preds = %cleanup.cont2042.i3574
  %1469 = load i32, i32* %add.ptr2053.i3573, align 4, !tbaa !7
  %xor2081.i3586 = xor i32 %1469, %1460
  br label %cleanup.cont2089.i3593

sw.default2083.i3588:                             ; preds = %cleanup.cont2042.i3574
  unreachable

cleanup.cont2089.i3593:                           ; preds = %sw.bb2080.i3587, %sw.bb2072.i3585, %sw.bb2064.i3583, %sw.bb2062.i3581, %sw.bb2058.i3579, %sw.bb2056.i3576
  %xor2081.i3586.sink = phi i32 [ %xor2081.i3586, %sw.bb2080.i3587 ], [ %or2079.i3584, %sw.bb2072.i3585 ], [ %or2071.i3582, %sw.bb2064.i3583 ], [ %sub2063.i3580, %sw.bb2062.i3581 ], [ %add2061.i3578, %sw.bb2058.i3579 ], [ %mul2057.i3575, %sw.bb2056.i3576 ]
  store i32 %xor2081.i3586.sink, i32* %add.ptr2053.i3573, align 4, !tbaa !7
  %1470 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 45, i32 1), align 1, !tbaa !17
  %idxprom2095.i3589 = zext i8 %1470 to i32
  %arrayidx2096.i3590 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2095.i3589
  %1471 = load i32, i32* %arrayidx2096.i3590, align 4, !tbaa !7
  %1472 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 45, i32 0), align 8, !tbaa !16
  %conv2099.i3591 = zext i8 %1472 to i32
  %add.ptr2100.i3592 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2099.i3591
  %1473 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 45, i32 2), align 2, !tbaa !14
  switch i8 %1473, label %sw.default2130.i3607 [
    i8 0, label %sw.bb2103.i3595
    i8 1, label %sw.bb2105.i3598
    i8 2, label %sw.bb2109.i3600
    i8 3, label %sw.bb2111.i3602
    i8 4, label %sw.bb2119.i3604
    i8 5, label %sw.bb2127.i3606
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2103.i3595:                                  ; preds = %cleanup.cont2089.i3593
  %1474 = load i32, i32* %add.ptr2100.i3592, align 4, !tbaa !7
  %mul2104.i3594 = mul i32 %1474, %1471
  br label %cleanup.cont2136.i3612

sw.bb2105.i3598:                                  ; preds = %cleanup.cont2089.i3593
  %1475 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 45, i32 3), align 4, !tbaa !18
  %add2107.i3596 = add i32 %1475, %1471
  %1476 = load i32, i32* %add.ptr2100.i3592, align 4, !tbaa !7
  %add2108.i3597 = add i32 %add2107.i3596, %1476
  br label %cleanup.cont2136.i3612

sw.bb2109.i3600:                                  ; preds = %cleanup.cont2089.i3593
  %1477 = load i32, i32* %add.ptr2100.i3592, align 4, !tbaa !7
  %sub2110.i3599 = sub i32 %1477, %1471
  br label %cleanup.cont2136.i3612

sw.bb2111.i3602:                                  ; preds = %cleanup.cont2089.i3593
  %1478 = load i32, i32* %add.ptr2100.i3592, align 4, !tbaa !7
  %or2118.i3601 = call i32 @llvm.fshr.i32(i32 %1478, i32 %1478, i32 %1471) #7
  br label %cleanup.cont2136.i3612

sw.bb2119.i3604:                                  ; preds = %cleanup.cont2089.i3593
  %1479 = load i32, i32* %add.ptr2100.i3592, align 4, !tbaa !7
  %or2126.i3603 = call i32 @llvm.fshl.i32(i32 %1479, i32 %1479, i32 %1471) #7
  br label %cleanup.cont2136.i3612

sw.bb2127.i3606:                                  ; preds = %cleanup.cont2089.i3593
  %1480 = load i32, i32* %add.ptr2100.i3592, align 4, !tbaa !7
  %xor2128.i3605 = xor i32 %1480, %1471
  br label %cleanup.cont2136.i3612

sw.default2130.i3607:                             ; preds = %cleanup.cont2089.i3593
  unreachable

cleanup.cont2136.i3612:                           ; preds = %sw.bb2127.i3606, %sw.bb2119.i3604, %sw.bb2111.i3602, %sw.bb2109.i3600, %sw.bb2105.i3598, %sw.bb2103.i3595
  %xor2128.i3605.sink = phi i32 [ %xor2128.i3605, %sw.bb2127.i3606 ], [ %or2126.i3603, %sw.bb2119.i3604 ], [ %or2118.i3601, %sw.bb2111.i3602 ], [ %sub2110.i3599, %sw.bb2109.i3600 ], [ %add2108.i3597, %sw.bb2105.i3598 ], [ %mul2104.i3594, %sw.bb2103.i3595 ]
  store i32 %xor2128.i3605.sink, i32* %add.ptr2100.i3592, align 4, !tbaa !7
  %1481 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 46, i32 1), align 1, !tbaa !17
  %idxprom2142.i3608 = zext i8 %1481 to i32
  %arrayidx2143.i3609 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2142.i3608
  %1482 = load i32, i32* %arrayidx2143.i3609, align 4, !tbaa !7
  %1483 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 46, i32 0), align 16, !tbaa !16
  %conv2146.i3610 = zext i8 %1483 to i32
  %add.ptr2147.i3611 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2146.i3610
  %1484 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 46, i32 2), align 2, !tbaa !14
  switch i8 %1484, label %sw.default2177.i3626 [
    i8 0, label %sw.bb2150.i3614
    i8 1, label %sw.bb2152.i3617
    i8 2, label %sw.bb2156.i3619
    i8 3, label %sw.bb2158.i3621
    i8 4, label %sw.bb2166.i3623
    i8 5, label %sw.bb2174.i3625
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2150.i3614:                                  ; preds = %cleanup.cont2136.i3612
  %1485 = load i32, i32* %add.ptr2147.i3611, align 4, !tbaa !7
  %mul2151.i3613 = mul i32 %1485, %1482
  br label %cleanup.cont2183.i3631

sw.bb2152.i3617:                                  ; preds = %cleanup.cont2136.i3612
  %1486 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 46, i32 3), align 4, !tbaa !18
  %add2154.i3615 = add i32 %1486, %1482
  %1487 = load i32, i32* %add.ptr2147.i3611, align 4, !tbaa !7
  %add2155.i3616 = add i32 %add2154.i3615, %1487
  br label %cleanup.cont2183.i3631

sw.bb2156.i3619:                                  ; preds = %cleanup.cont2136.i3612
  %1488 = load i32, i32* %add.ptr2147.i3611, align 4, !tbaa !7
  %sub2157.i3618 = sub i32 %1488, %1482
  br label %cleanup.cont2183.i3631

sw.bb2158.i3621:                                  ; preds = %cleanup.cont2136.i3612
  %1489 = load i32, i32* %add.ptr2147.i3611, align 4, !tbaa !7
  %or2165.i3620 = call i32 @llvm.fshr.i32(i32 %1489, i32 %1489, i32 %1482) #7
  br label %cleanup.cont2183.i3631

sw.bb2166.i3623:                                  ; preds = %cleanup.cont2136.i3612
  %1490 = load i32, i32* %add.ptr2147.i3611, align 4, !tbaa !7
  %or2173.i3622 = call i32 @llvm.fshl.i32(i32 %1490, i32 %1490, i32 %1482) #7
  br label %cleanup.cont2183.i3631

sw.bb2174.i3625:                                  ; preds = %cleanup.cont2136.i3612
  %1491 = load i32, i32* %add.ptr2147.i3611, align 4, !tbaa !7
  %xor2175.i3624 = xor i32 %1491, %1482
  br label %cleanup.cont2183.i3631

sw.default2177.i3626:                             ; preds = %cleanup.cont2136.i3612
  unreachable

cleanup.cont2183.i3631:                           ; preds = %sw.bb2174.i3625, %sw.bb2166.i3623, %sw.bb2158.i3621, %sw.bb2156.i3619, %sw.bb2152.i3617, %sw.bb2150.i3614
  %xor2175.i3624.sink = phi i32 [ %xor2175.i3624, %sw.bb2174.i3625 ], [ %or2173.i3622, %sw.bb2166.i3623 ], [ %or2165.i3620, %sw.bb2158.i3621 ], [ %sub2157.i3618, %sw.bb2156.i3619 ], [ %add2155.i3616, %sw.bb2152.i3617 ], [ %mul2151.i3613, %sw.bb2150.i3614 ]
  store i32 %xor2175.i3624.sink, i32* %add.ptr2147.i3611, align 4, !tbaa !7
  %1492 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 47, i32 1), align 1, !tbaa !17
  %idxprom2189.i3627 = zext i8 %1492 to i32
  %arrayidx2190.i3628 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2189.i3627
  %1493 = load i32, i32* %arrayidx2190.i3628, align 4, !tbaa !7
  %1494 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 47, i32 0), align 8, !tbaa !16
  %conv2193.i3629 = zext i8 %1494 to i32
  %add.ptr2194.i3630 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2193.i3629
  %1495 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 47, i32 2), align 2, !tbaa !14
  switch i8 %1495, label %sw.default2224.i3645 [
    i8 0, label %sw.bb2197.i3633
    i8 1, label %sw.bb2199.i3636
    i8 2, label %sw.bb2203.i3638
    i8 3, label %sw.bb2205.i3640
    i8 4, label %sw.bb2213.i3642
    i8 5, label %sw.bb2221.i3644
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2197.i3633:                                  ; preds = %cleanup.cont2183.i3631
  %1496 = load i32, i32* %add.ptr2194.i3630, align 4, !tbaa !7
  %mul2198.i3632 = mul i32 %1496, %1493
  br label %cleanup.cont2230.i3650

sw.bb2199.i3636:                                  ; preds = %cleanup.cont2183.i3631
  %1497 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 47, i32 3), align 4, !tbaa !18
  %add2201.i3634 = add i32 %1497, %1493
  %1498 = load i32, i32* %add.ptr2194.i3630, align 4, !tbaa !7
  %add2202.i3635 = add i32 %add2201.i3634, %1498
  br label %cleanup.cont2230.i3650

sw.bb2203.i3638:                                  ; preds = %cleanup.cont2183.i3631
  %1499 = load i32, i32* %add.ptr2194.i3630, align 4, !tbaa !7
  %sub2204.i3637 = sub i32 %1499, %1493
  br label %cleanup.cont2230.i3650

sw.bb2205.i3640:                                  ; preds = %cleanup.cont2183.i3631
  %1500 = load i32, i32* %add.ptr2194.i3630, align 4, !tbaa !7
  %or2212.i3639 = call i32 @llvm.fshr.i32(i32 %1500, i32 %1500, i32 %1493) #7
  br label %cleanup.cont2230.i3650

sw.bb2213.i3642:                                  ; preds = %cleanup.cont2183.i3631
  %1501 = load i32, i32* %add.ptr2194.i3630, align 4, !tbaa !7
  %or2220.i3641 = call i32 @llvm.fshl.i32(i32 %1501, i32 %1501, i32 %1493) #7
  br label %cleanup.cont2230.i3650

sw.bb2221.i3644:                                  ; preds = %cleanup.cont2183.i3631
  %1502 = load i32, i32* %add.ptr2194.i3630, align 4, !tbaa !7
  %xor2222.i3643 = xor i32 %1502, %1493
  br label %cleanup.cont2230.i3650

sw.default2224.i3645:                             ; preds = %cleanup.cont2183.i3631
  unreachable

cleanup.cont2230.i3650:                           ; preds = %sw.bb2221.i3644, %sw.bb2213.i3642, %sw.bb2205.i3640, %sw.bb2203.i3638, %sw.bb2199.i3636, %sw.bb2197.i3633
  %xor2222.i3643.sink = phi i32 [ %xor2222.i3643, %sw.bb2221.i3644 ], [ %or2220.i3641, %sw.bb2213.i3642 ], [ %or2212.i3639, %sw.bb2205.i3640 ], [ %sub2204.i3637, %sw.bb2203.i3638 ], [ %add2202.i3635, %sw.bb2199.i3636 ], [ %mul2198.i3632, %sw.bb2197.i3633 ]
  store i32 %xor2222.i3643.sink, i32* %add.ptr2194.i3630, align 4, !tbaa !7
  %1503 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 48, i32 1), align 1, !tbaa !17
  %idxprom2236.i3646 = zext i8 %1503 to i32
  %arrayidx2237.i3647 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2236.i3646
  %1504 = load i32, i32* %arrayidx2237.i3647, align 4, !tbaa !7
  %1505 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 48, i32 0), align 16, !tbaa !16
  %conv2240.i3648 = zext i8 %1505 to i32
  %add.ptr2241.i3649 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2240.i3648
  %1506 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 48, i32 2), align 2, !tbaa !14
  switch i8 %1506, label %sw.default2271.i3664 [
    i8 0, label %sw.bb2244.i3652
    i8 1, label %sw.bb2246.i3655
    i8 2, label %sw.bb2250.i3657
    i8 3, label %sw.bb2252.i3659
    i8 4, label %sw.bb2260.i3661
    i8 5, label %sw.bb2268.i3663
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2244.i3652:                                  ; preds = %cleanup.cont2230.i3650
  %1507 = load i32, i32* %add.ptr2241.i3649, align 4, !tbaa !7
  %mul2245.i3651 = mul i32 %1507, %1504
  br label %cleanup.cont2277.i3669

sw.bb2246.i3655:                                  ; preds = %cleanup.cont2230.i3650
  %1508 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 48, i32 3), align 4, !tbaa !18
  %add2248.i3653 = add i32 %1508, %1504
  %1509 = load i32, i32* %add.ptr2241.i3649, align 4, !tbaa !7
  %add2249.i3654 = add i32 %add2248.i3653, %1509
  br label %cleanup.cont2277.i3669

sw.bb2250.i3657:                                  ; preds = %cleanup.cont2230.i3650
  %1510 = load i32, i32* %add.ptr2241.i3649, align 4, !tbaa !7
  %sub2251.i3656 = sub i32 %1510, %1504
  br label %cleanup.cont2277.i3669

sw.bb2252.i3659:                                  ; preds = %cleanup.cont2230.i3650
  %1511 = load i32, i32* %add.ptr2241.i3649, align 4, !tbaa !7
  %or2259.i3658 = call i32 @llvm.fshr.i32(i32 %1511, i32 %1511, i32 %1504) #7
  br label %cleanup.cont2277.i3669

sw.bb2260.i3661:                                  ; preds = %cleanup.cont2230.i3650
  %1512 = load i32, i32* %add.ptr2241.i3649, align 4, !tbaa !7
  %or2267.i3660 = call i32 @llvm.fshl.i32(i32 %1512, i32 %1512, i32 %1504) #7
  br label %cleanup.cont2277.i3669

sw.bb2268.i3663:                                  ; preds = %cleanup.cont2230.i3650
  %1513 = load i32, i32* %add.ptr2241.i3649, align 4, !tbaa !7
  %xor2269.i3662 = xor i32 %1513, %1504
  br label %cleanup.cont2277.i3669

sw.default2271.i3664:                             ; preds = %cleanup.cont2230.i3650
  unreachable

cleanup.cont2277.i3669:                           ; preds = %sw.bb2268.i3663, %sw.bb2260.i3661, %sw.bb2252.i3659, %sw.bb2250.i3657, %sw.bb2246.i3655, %sw.bb2244.i3652
  %xor2269.i3662.sink = phi i32 [ %xor2269.i3662, %sw.bb2268.i3663 ], [ %or2267.i3660, %sw.bb2260.i3661 ], [ %or2259.i3658, %sw.bb2252.i3659 ], [ %sub2251.i3656, %sw.bb2250.i3657 ], [ %add2249.i3654, %sw.bb2246.i3655 ], [ %mul2245.i3651, %sw.bb2244.i3652 ]
  store i32 %xor2269.i3662.sink, i32* %add.ptr2241.i3649, align 4, !tbaa !7
  %1514 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 49, i32 1), align 1, !tbaa !17
  %idxprom2283.i3665 = zext i8 %1514 to i32
  %arrayidx2284.i3666 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2283.i3665
  %1515 = load i32, i32* %arrayidx2284.i3666, align 4, !tbaa !7
  %1516 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 49, i32 0), align 8, !tbaa !16
  %conv2287.i3667 = zext i8 %1516 to i32
  %add.ptr2288.i3668 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2287.i3667
  %1517 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 49, i32 2), align 2, !tbaa !14
  switch i8 %1517, label %sw.default2318.i3683 [
    i8 0, label %sw.bb2291.i3671
    i8 1, label %sw.bb2293.i3674
    i8 2, label %sw.bb2297.i3676
    i8 3, label %sw.bb2299.i3678
    i8 4, label %sw.bb2307.i3680
    i8 5, label %sw.bb2315.i3682
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2291.i3671:                                  ; preds = %cleanup.cont2277.i3669
  %1518 = load i32, i32* %add.ptr2288.i3668, align 4, !tbaa !7
  %mul2292.i3670 = mul i32 %1518, %1515
  br label %cleanup.cont2324.i3688

sw.bb2293.i3674:                                  ; preds = %cleanup.cont2277.i3669
  %1519 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 49, i32 3), align 4, !tbaa !18
  %add2295.i3672 = add i32 %1519, %1515
  %1520 = load i32, i32* %add.ptr2288.i3668, align 4, !tbaa !7
  %add2296.i3673 = add i32 %add2295.i3672, %1520
  br label %cleanup.cont2324.i3688

sw.bb2297.i3676:                                  ; preds = %cleanup.cont2277.i3669
  %1521 = load i32, i32* %add.ptr2288.i3668, align 4, !tbaa !7
  %sub2298.i3675 = sub i32 %1521, %1515
  br label %cleanup.cont2324.i3688

sw.bb2299.i3678:                                  ; preds = %cleanup.cont2277.i3669
  %1522 = load i32, i32* %add.ptr2288.i3668, align 4, !tbaa !7
  %or2306.i3677 = call i32 @llvm.fshr.i32(i32 %1522, i32 %1522, i32 %1515) #7
  br label %cleanup.cont2324.i3688

sw.bb2307.i3680:                                  ; preds = %cleanup.cont2277.i3669
  %1523 = load i32, i32* %add.ptr2288.i3668, align 4, !tbaa !7
  %or2314.i3679 = call i32 @llvm.fshl.i32(i32 %1523, i32 %1523, i32 %1515) #7
  br label %cleanup.cont2324.i3688

sw.bb2315.i3682:                                  ; preds = %cleanup.cont2277.i3669
  %1524 = load i32, i32* %add.ptr2288.i3668, align 4, !tbaa !7
  %xor2316.i3681 = xor i32 %1524, %1515
  br label %cleanup.cont2324.i3688

sw.default2318.i3683:                             ; preds = %cleanup.cont2277.i3669
  unreachable

cleanup.cont2324.i3688:                           ; preds = %sw.bb2315.i3682, %sw.bb2307.i3680, %sw.bb2299.i3678, %sw.bb2297.i3676, %sw.bb2293.i3674, %sw.bb2291.i3671
  %xor2316.i3681.sink = phi i32 [ %xor2316.i3681, %sw.bb2315.i3682 ], [ %or2314.i3679, %sw.bb2307.i3680 ], [ %or2306.i3677, %sw.bb2299.i3678 ], [ %sub2298.i3675, %sw.bb2297.i3676 ], [ %add2296.i3673, %sw.bb2293.i3674 ], [ %mul2292.i3670, %sw.bb2291.i3671 ]
  store i32 %xor2316.i3681.sink, i32* %add.ptr2288.i3668, align 4, !tbaa !7
  %1525 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 50, i32 1), align 1, !tbaa !17
  %idxprom2330.i3684 = zext i8 %1525 to i32
  %arrayidx2331.i3685 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2330.i3684
  %1526 = load i32, i32* %arrayidx2331.i3685, align 4, !tbaa !7
  %1527 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 50, i32 0), align 16, !tbaa !16
  %conv2334.i3686 = zext i8 %1527 to i32
  %add.ptr2335.i3687 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2334.i3686
  %1528 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 50, i32 2), align 2, !tbaa !14
  switch i8 %1528, label %sw.default2365.i3702 [
    i8 0, label %sw.bb2338.i3690
    i8 1, label %sw.bb2340.i3693
    i8 2, label %sw.bb2344.i3695
    i8 3, label %sw.bb2346.i3697
    i8 4, label %sw.bb2354.i3699
    i8 5, label %sw.bb2362.i3701
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2338.i3690:                                  ; preds = %cleanup.cont2324.i3688
  %1529 = load i32, i32* %add.ptr2335.i3687, align 4, !tbaa !7
  %mul2339.i3689 = mul i32 %1529, %1526
  br label %cleanup.cont2371.i3707

sw.bb2340.i3693:                                  ; preds = %cleanup.cont2324.i3688
  %1530 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 50, i32 3), align 4, !tbaa !18
  %add2342.i3691 = add i32 %1530, %1526
  %1531 = load i32, i32* %add.ptr2335.i3687, align 4, !tbaa !7
  %add2343.i3692 = add i32 %add2342.i3691, %1531
  br label %cleanup.cont2371.i3707

sw.bb2344.i3695:                                  ; preds = %cleanup.cont2324.i3688
  %1532 = load i32, i32* %add.ptr2335.i3687, align 4, !tbaa !7
  %sub2345.i3694 = sub i32 %1532, %1526
  br label %cleanup.cont2371.i3707

sw.bb2346.i3697:                                  ; preds = %cleanup.cont2324.i3688
  %1533 = load i32, i32* %add.ptr2335.i3687, align 4, !tbaa !7
  %or2353.i3696 = call i32 @llvm.fshr.i32(i32 %1533, i32 %1533, i32 %1526) #7
  br label %cleanup.cont2371.i3707

sw.bb2354.i3699:                                  ; preds = %cleanup.cont2324.i3688
  %1534 = load i32, i32* %add.ptr2335.i3687, align 4, !tbaa !7
  %or2361.i3698 = call i32 @llvm.fshl.i32(i32 %1534, i32 %1534, i32 %1526) #7
  br label %cleanup.cont2371.i3707

sw.bb2362.i3701:                                  ; preds = %cleanup.cont2324.i3688
  %1535 = load i32, i32* %add.ptr2335.i3687, align 4, !tbaa !7
  %xor2363.i3700 = xor i32 %1535, %1526
  br label %cleanup.cont2371.i3707

sw.default2365.i3702:                             ; preds = %cleanup.cont2324.i3688
  unreachable

cleanup.cont2371.i3707:                           ; preds = %sw.bb2362.i3701, %sw.bb2354.i3699, %sw.bb2346.i3697, %sw.bb2344.i3695, %sw.bb2340.i3693, %sw.bb2338.i3690
  %xor2363.i3700.sink = phi i32 [ %xor2363.i3700, %sw.bb2362.i3701 ], [ %or2361.i3698, %sw.bb2354.i3699 ], [ %or2353.i3696, %sw.bb2346.i3697 ], [ %sub2345.i3694, %sw.bb2344.i3695 ], [ %add2343.i3692, %sw.bb2340.i3693 ], [ %mul2339.i3689, %sw.bb2338.i3690 ]
  store i32 %xor2363.i3700.sink, i32* %add.ptr2335.i3687, align 4, !tbaa !7
  %1536 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 51, i32 1), align 1, !tbaa !17
  %idxprom2377.i3703 = zext i8 %1536 to i32
  %arrayidx2378.i3704 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2377.i3703
  %1537 = load i32, i32* %arrayidx2378.i3704, align 4, !tbaa !7
  %1538 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 51, i32 0), align 8, !tbaa !16
  %conv2381.i3705 = zext i8 %1538 to i32
  %add.ptr2382.i3706 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2381.i3705
  %1539 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 51, i32 2), align 2, !tbaa !14
  switch i8 %1539, label %sw.default2412.i3721 [
    i8 0, label %sw.bb2385.i3709
    i8 1, label %sw.bb2387.i3712
    i8 2, label %sw.bb2391.i3714
    i8 3, label %sw.bb2393.i3716
    i8 4, label %sw.bb2401.i3718
    i8 5, label %sw.bb2409.i3720
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2385.i3709:                                  ; preds = %cleanup.cont2371.i3707
  %1540 = load i32, i32* %add.ptr2382.i3706, align 4, !tbaa !7
  %mul2386.i3708 = mul i32 %1540, %1537
  br label %cleanup.cont2418.i3726

sw.bb2387.i3712:                                  ; preds = %cleanup.cont2371.i3707
  %1541 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 51, i32 3), align 4, !tbaa !18
  %add2389.i3710 = add i32 %1541, %1537
  %1542 = load i32, i32* %add.ptr2382.i3706, align 4, !tbaa !7
  %add2390.i3711 = add i32 %add2389.i3710, %1542
  br label %cleanup.cont2418.i3726

sw.bb2391.i3714:                                  ; preds = %cleanup.cont2371.i3707
  %1543 = load i32, i32* %add.ptr2382.i3706, align 4, !tbaa !7
  %sub2392.i3713 = sub i32 %1543, %1537
  br label %cleanup.cont2418.i3726

sw.bb2393.i3716:                                  ; preds = %cleanup.cont2371.i3707
  %1544 = load i32, i32* %add.ptr2382.i3706, align 4, !tbaa !7
  %or2400.i3715 = call i32 @llvm.fshr.i32(i32 %1544, i32 %1544, i32 %1537) #7
  br label %cleanup.cont2418.i3726

sw.bb2401.i3718:                                  ; preds = %cleanup.cont2371.i3707
  %1545 = load i32, i32* %add.ptr2382.i3706, align 4, !tbaa !7
  %or2408.i3717 = call i32 @llvm.fshl.i32(i32 %1545, i32 %1545, i32 %1537) #7
  br label %cleanup.cont2418.i3726

sw.bb2409.i3720:                                  ; preds = %cleanup.cont2371.i3707
  %1546 = load i32, i32* %add.ptr2382.i3706, align 4, !tbaa !7
  %xor2410.i3719 = xor i32 %1546, %1537
  br label %cleanup.cont2418.i3726

sw.default2412.i3721:                             ; preds = %cleanup.cont2371.i3707
  unreachable

cleanup.cont2418.i3726:                           ; preds = %sw.bb2409.i3720, %sw.bb2401.i3718, %sw.bb2393.i3716, %sw.bb2391.i3714, %sw.bb2387.i3712, %sw.bb2385.i3709
  %xor2410.i3719.sink = phi i32 [ %xor2410.i3719, %sw.bb2409.i3720 ], [ %or2408.i3717, %sw.bb2401.i3718 ], [ %or2400.i3715, %sw.bb2393.i3716 ], [ %sub2392.i3713, %sw.bb2391.i3714 ], [ %add2390.i3711, %sw.bb2387.i3712 ], [ %mul2386.i3708, %sw.bb2385.i3709 ]
  store i32 %xor2410.i3719.sink, i32* %add.ptr2382.i3706, align 4, !tbaa !7
  %1547 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 52, i32 1), align 1, !tbaa !17
  %idxprom2424.i3722 = zext i8 %1547 to i32
  %arrayidx2425.i3723 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2424.i3722
  %1548 = load i32, i32* %arrayidx2425.i3723, align 4, !tbaa !7
  %1549 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 52, i32 0), align 16, !tbaa !16
  %conv2428.i3724 = zext i8 %1549 to i32
  %add.ptr2429.i3725 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2428.i3724
  %1550 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 52, i32 2), align 2, !tbaa !14
  switch i8 %1550, label %sw.default2459.i3740 [
    i8 0, label %sw.bb2432.i3728
    i8 1, label %sw.bb2434.i3731
    i8 2, label %sw.bb2438.i3733
    i8 3, label %sw.bb2440.i3735
    i8 4, label %sw.bb2448.i3737
    i8 5, label %sw.bb2456.i3739
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2432.i3728:                                  ; preds = %cleanup.cont2418.i3726
  %1551 = load i32, i32* %add.ptr2429.i3725, align 4, !tbaa !7
  %mul2433.i3727 = mul i32 %1551, %1548
  br label %cleanup.cont2465.i3745

sw.bb2434.i3731:                                  ; preds = %cleanup.cont2418.i3726
  %1552 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 52, i32 3), align 4, !tbaa !18
  %add2436.i3729 = add i32 %1552, %1548
  %1553 = load i32, i32* %add.ptr2429.i3725, align 4, !tbaa !7
  %add2437.i3730 = add i32 %add2436.i3729, %1553
  br label %cleanup.cont2465.i3745

sw.bb2438.i3733:                                  ; preds = %cleanup.cont2418.i3726
  %1554 = load i32, i32* %add.ptr2429.i3725, align 4, !tbaa !7
  %sub2439.i3732 = sub i32 %1554, %1548
  br label %cleanup.cont2465.i3745

sw.bb2440.i3735:                                  ; preds = %cleanup.cont2418.i3726
  %1555 = load i32, i32* %add.ptr2429.i3725, align 4, !tbaa !7
  %or2447.i3734 = call i32 @llvm.fshr.i32(i32 %1555, i32 %1555, i32 %1548) #7
  br label %cleanup.cont2465.i3745

sw.bb2448.i3737:                                  ; preds = %cleanup.cont2418.i3726
  %1556 = load i32, i32* %add.ptr2429.i3725, align 4, !tbaa !7
  %or2455.i3736 = call i32 @llvm.fshl.i32(i32 %1556, i32 %1556, i32 %1548) #7
  br label %cleanup.cont2465.i3745

sw.bb2456.i3739:                                  ; preds = %cleanup.cont2418.i3726
  %1557 = load i32, i32* %add.ptr2429.i3725, align 4, !tbaa !7
  %xor2457.i3738 = xor i32 %1557, %1548
  br label %cleanup.cont2465.i3745

sw.default2459.i3740:                             ; preds = %cleanup.cont2418.i3726
  unreachable

cleanup.cont2465.i3745:                           ; preds = %sw.bb2456.i3739, %sw.bb2448.i3737, %sw.bb2440.i3735, %sw.bb2438.i3733, %sw.bb2434.i3731, %sw.bb2432.i3728
  %xor2457.i3738.sink = phi i32 [ %xor2457.i3738, %sw.bb2456.i3739 ], [ %or2455.i3736, %sw.bb2448.i3737 ], [ %or2447.i3734, %sw.bb2440.i3735 ], [ %sub2439.i3732, %sw.bb2438.i3733 ], [ %add2437.i3730, %sw.bb2434.i3731 ], [ %mul2433.i3727, %sw.bb2432.i3728 ]
  store i32 %xor2457.i3738.sink, i32* %add.ptr2429.i3725, align 4, !tbaa !7
  %1558 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 53, i32 1), align 1, !tbaa !17
  %idxprom2471.i3741 = zext i8 %1558 to i32
  %arrayidx2472.i3742 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2471.i3741
  %1559 = load i32, i32* %arrayidx2472.i3742, align 4, !tbaa !7
  %1560 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 53, i32 0), align 8, !tbaa !16
  %conv2475.i3743 = zext i8 %1560 to i32
  %add.ptr2476.i3744 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2475.i3743
  %1561 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 53, i32 2), align 2, !tbaa !14
  switch i8 %1561, label %sw.default2506.i3759 [
    i8 0, label %sw.bb2479.i3747
    i8 1, label %sw.bb2481.i3750
    i8 2, label %sw.bb2485.i3752
    i8 3, label %sw.bb2487.i3754
    i8 4, label %sw.bb2495.i3756
    i8 5, label %sw.bb2503.i3758
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2479.i3747:                                  ; preds = %cleanup.cont2465.i3745
  %1562 = load i32, i32* %add.ptr2476.i3744, align 4, !tbaa !7
  %mul2480.i3746 = mul i32 %1562, %1559
  br label %cleanup.cont2512.i3764

sw.bb2481.i3750:                                  ; preds = %cleanup.cont2465.i3745
  %1563 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 53, i32 3), align 4, !tbaa !18
  %add2483.i3748 = add i32 %1563, %1559
  %1564 = load i32, i32* %add.ptr2476.i3744, align 4, !tbaa !7
  %add2484.i3749 = add i32 %add2483.i3748, %1564
  br label %cleanup.cont2512.i3764

sw.bb2485.i3752:                                  ; preds = %cleanup.cont2465.i3745
  %1565 = load i32, i32* %add.ptr2476.i3744, align 4, !tbaa !7
  %sub2486.i3751 = sub i32 %1565, %1559
  br label %cleanup.cont2512.i3764

sw.bb2487.i3754:                                  ; preds = %cleanup.cont2465.i3745
  %1566 = load i32, i32* %add.ptr2476.i3744, align 4, !tbaa !7
  %or2494.i3753 = call i32 @llvm.fshr.i32(i32 %1566, i32 %1566, i32 %1559) #7
  br label %cleanup.cont2512.i3764

sw.bb2495.i3756:                                  ; preds = %cleanup.cont2465.i3745
  %1567 = load i32, i32* %add.ptr2476.i3744, align 4, !tbaa !7
  %or2502.i3755 = call i32 @llvm.fshl.i32(i32 %1567, i32 %1567, i32 %1559) #7
  br label %cleanup.cont2512.i3764

sw.bb2503.i3758:                                  ; preds = %cleanup.cont2465.i3745
  %1568 = load i32, i32* %add.ptr2476.i3744, align 4, !tbaa !7
  %xor2504.i3757 = xor i32 %1568, %1559
  br label %cleanup.cont2512.i3764

sw.default2506.i3759:                             ; preds = %cleanup.cont2465.i3745
  unreachable

cleanup.cont2512.i3764:                           ; preds = %sw.bb2503.i3758, %sw.bb2495.i3756, %sw.bb2487.i3754, %sw.bb2485.i3752, %sw.bb2481.i3750, %sw.bb2479.i3747
  %xor2504.i3757.sink = phi i32 [ %xor2504.i3757, %sw.bb2503.i3758 ], [ %or2502.i3755, %sw.bb2495.i3756 ], [ %or2494.i3753, %sw.bb2487.i3754 ], [ %sub2486.i3751, %sw.bb2485.i3752 ], [ %add2484.i3749, %sw.bb2481.i3750 ], [ %mul2480.i3746, %sw.bb2479.i3747 ]
  store i32 %xor2504.i3757.sink, i32* %add.ptr2476.i3744, align 4, !tbaa !7
  %1569 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 54, i32 1), align 1, !tbaa !17
  %idxprom2518.i3760 = zext i8 %1569 to i32
  %arrayidx2519.i3761 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2518.i3760
  %1570 = load i32, i32* %arrayidx2519.i3761, align 4, !tbaa !7
  %1571 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 54, i32 0), align 16, !tbaa !16
  %conv2522.i3762 = zext i8 %1571 to i32
  %add.ptr2523.i3763 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2522.i3762
  %1572 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 54, i32 2), align 2, !tbaa !14
  switch i8 %1572, label %sw.default2553.i3778 [
    i8 0, label %sw.bb2526.i3766
    i8 1, label %sw.bb2528.i3769
    i8 2, label %sw.bb2532.i3771
    i8 3, label %sw.bb2534.i3773
    i8 4, label %sw.bb2542.i3775
    i8 5, label %sw.bb2550.i3777
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2526.i3766:                                  ; preds = %cleanup.cont2512.i3764
  %1573 = load i32, i32* %add.ptr2523.i3763, align 4, !tbaa !7
  %mul2527.i3765 = mul i32 %1573, %1570
  br label %cleanup.cont2559.i3783

sw.bb2528.i3769:                                  ; preds = %cleanup.cont2512.i3764
  %1574 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 54, i32 3), align 4, !tbaa !18
  %add2530.i3767 = add i32 %1574, %1570
  %1575 = load i32, i32* %add.ptr2523.i3763, align 4, !tbaa !7
  %add2531.i3768 = add i32 %add2530.i3767, %1575
  br label %cleanup.cont2559.i3783

sw.bb2532.i3771:                                  ; preds = %cleanup.cont2512.i3764
  %1576 = load i32, i32* %add.ptr2523.i3763, align 4, !tbaa !7
  %sub2533.i3770 = sub i32 %1576, %1570
  br label %cleanup.cont2559.i3783

sw.bb2534.i3773:                                  ; preds = %cleanup.cont2512.i3764
  %1577 = load i32, i32* %add.ptr2523.i3763, align 4, !tbaa !7
  %or2541.i3772 = call i32 @llvm.fshr.i32(i32 %1577, i32 %1577, i32 %1570) #7
  br label %cleanup.cont2559.i3783

sw.bb2542.i3775:                                  ; preds = %cleanup.cont2512.i3764
  %1578 = load i32, i32* %add.ptr2523.i3763, align 4, !tbaa !7
  %or2549.i3774 = call i32 @llvm.fshl.i32(i32 %1578, i32 %1578, i32 %1570) #7
  br label %cleanup.cont2559.i3783

sw.bb2550.i3777:                                  ; preds = %cleanup.cont2512.i3764
  %1579 = load i32, i32* %add.ptr2523.i3763, align 4, !tbaa !7
  %xor2551.i3776 = xor i32 %1579, %1570
  br label %cleanup.cont2559.i3783

sw.default2553.i3778:                             ; preds = %cleanup.cont2512.i3764
  unreachable

cleanup.cont2559.i3783:                           ; preds = %sw.bb2550.i3777, %sw.bb2542.i3775, %sw.bb2534.i3773, %sw.bb2532.i3771, %sw.bb2528.i3769, %sw.bb2526.i3766
  %xor2551.i3776.sink = phi i32 [ %xor2551.i3776, %sw.bb2550.i3777 ], [ %or2549.i3774, %sw.bb2542.i3775 ], [ %or2541.i3772, %sw.bb2534.i3773 ], [ %sub2533.i3770, %sw.bb2532.i3771 ], [ %add2531.i3768, %sw.bb2528.i3769 ], [ %mul2527.i3765, %sw.bb2526.i3766 ]
  store i32 %xor2551.i3776.sink, i32* %add.ptr2523.i3763, align 4, !tbaa !7
  %1580 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 55, i32 1), align 1, !tbaa !17
  %idxprom2565.i3779 = zext i8 %1580 to i32
  %arrayidx2566.i3780 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2565.i3779
  %1581 = load i32, i32* %arrayidx2566.i3780, align 4, !tbaa !7
  %1582 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 55, i32 0), align 8, !tbaa !16
  %conv2569.i3781 = zext i8 %1582 to i32
  %add.ptr2570.i3782 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2569.i3781
  %1583 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 55, i32 2), align 2, !tbaa !14
  switch i8 %1583, label %sw.default2600.i3797 [
    i8 0, label %sw.bb2573.i3785
    i8 1, label %sw.bb2575.i3788
    i8 2, label %sw.bb2579.i3790
    i8 3, label %sw.bb2581.i3792
    i8 4, label %sw.bb2589.i3794
    i8 5, label %sw.bb2597.i3796
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2573.i3785:                                  ; preds = %cleanup.cont2559.i3783
  %1584 = load i32, i32* %add.ptr2570.i3782, align 4, !tbaa !7
  %mul2574.i3784 = mul i32 %1584, %1581
  br label %cleanup.cont2606.i3802

sw.bb2575.i3788:                                  ; preds = %cleanup.cont2559.i3783
  %1585 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 55, i32 3), align 4, !tbaa !18
  %add2577.i3786 = add i32 %1585, %1581
  %1586 = load i32, i32* %add.ptr2570.i3782, align 4, !tbaa !7
  %add2578.i3787 = add i32 %add2577.i3786, %1586
  br label %cleanup.cont2606.i3802

sw.bb2579.i3790:                                  ; preds = %cleanup.cont2559.i3783
  %1587 = load i32, i32* %add.ptr2570.i3782, align 4, !tbaa !7
  %sub2580.i3789 = sub i32 %1587, %1581
  br label %cleanup.cont2606.i3802

sw.bb2581.i3792:                                  ; preds = %cleanup.cont2559.i3783
  %1588 = load i32, i32* %add.ptr2570.i3782, align 4, !tbaa !7
  %or2588.i3791 = call i32 @llvm.fshr.i32(i32 %1588, i32 %1588, i32 %1581) #7
  br label %cleanup.cont2606.i3802

sw.bb2589.i3794:                                  ; preds = %cleanup.cont2559.i3783
  %1589 = load i32, i32* %add.ptr2570.i3782, align 4, !tbaa !7
  %or2596.i3793 = call i32 @llvm.fshl.i32(i32 %1589, i32 %1589, i32 %1581) #7
  br label %cleanup.cont2606.i3802

sw.bb2597.i3796:                                  ; preds = %cleanup.cont2559.i3783
  %1590 = load i32, i32* %add.ptr2570.i3782, align 4, !tbaa !7
  %xor2598.i3795 = xor i32 %1590, %1581
  br label %cleanup.cont2606.i3802

sw.default2600.i3797:                             ; preds = %cleanup.cont2559.i3783
  unreachable

cleanup.cont2606.i3802:                           ; preds = %sw.bb2597.i3796, %sw.bb2589.i3794, %sw.bb2581.i3792, %sw.bb2579.i3790, %sw.bb2575.i3788, %sw.bb2573.i3785
  %xor2598.i3795.sink = phi i32 [ %xor2598.i3795, %sw.bb2597.i3796 ], [ %or2596.i3793, %sw.bb2589.i3794 ], [ %or2588.i3791, %sw.bb2581.i3792 ], [ %sub2580.i3789, %sw.bb2579.i3790 ], [ %add2578.i3787, %sw.bb2575.i3788 ], [ %mul2574.i3784, %sw.bb2573.i3785 ]
  store i32 %xor2598.i3795.sink, i32* %add.ptr2570.i3782, align 4, !tbaa !7
  %1591 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 56, i32 1), align 1, !tbaa !17
  %idxprom2612.i3798 = zext i8 %1591 to i32
  %arrayidx2613.i3799 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2612.i3798
  %1592 = load i32, i32* %arrayidx2613.i3799, align 4, !tbaa !7
  %1593 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 56, i32 0), align 16, !tbaa !16
  %conv2616.i3800 = zext i8 %1593 to i32
  %add.ptr2617.i3801 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2616.i3800
  %1594 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 56, i32 2), align 2, !tbaa !14
  switch i8 %1594, label %sw.default2647.i3816 [
    i8 0, label %sw.bb2620.i3804
    i8 1, label %sw.bb2622.i3807
    i8 2, label %sw.bb2626.i3809
    i8 3, label %sw.bb2628.i3811
    i8 4, label %sw.bb2636.i3813
    i8 5, label %sw.bb2644.i3815
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2620.i3804:                                  ; preds = %cleanup.cont2606.i3802
  %1595 = load i32, i32* %add.ptr2617.i3801, align 4, !tbaa !7
  %mul2621.i3803 = mul i32 %1595, %1592
  br label %cleanup.cont2653.i3821

sw.bb2622.i3807:                                  ; preds = %cleanup.cont2606.i3802
  %1596 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 56, i32 3), align 4, !tbaa !18
  %add2624.i3805 = add i32 %1596, %1592
  %1597 = load i32, i32* %add.ptr2617.i3801, align 4, !tbaa !7
  %add2625.i3806 = add i32 %add2624.i3805, %1597
  br label %cleanup.cont2653.i3821

sw.bb2626.i3809:                                  ; preds = %cleanup.cont2606.i3802
  %1598 = load i32, i32* %add.ptr2617.i3801, align 4, !tbaa !7
  %sub2627.i3808 = sub i32 %1598, %1592
  br label %cleanup.cont2653.i3821

sw.bb2628.i3811:                                  ; preds = %cleanup.cont2606.i3802
  %1599 = load i32, i32* %add.ptr2617.i3801, align 4, !tbaa !7
  %or2635.i3810 = call i32 @llvm.fshr.i32(i32 %1599, i32 %1599, i32 %1592) #7
  br label %cleanup.cont2653.i3821

sw.bb2636.i3813:                                  ; preds = %cleanup.cont2606.i3802
  %1600 = load i32, i32* %add.ptr2617.i3801, align 4, !tbaa !7
  %or2643.i3812 = call i32 @llvm.fshl.i32(i32 %1600, i32 %1600, i32 %1592) #7
  br label %cleanup.cont2653.i3821

sw.bb2644.i3815:                                  ; preds = %cleanup.cont2606.i3802
  %1601 = load i32, i32* %add.ptr2617.i3801, align 4, !tbaa !7
  %xor2645.i3814 = xor i32 %1601, %1592
  br label %cleanup.cont2653.i3821

sw.default2647.i3816:                             ; preds = %cleanup.cont2606.i3802
  unreachable

cleanup.cont2653.i3821:                           ; preds = %sw.bb2644.i3815, %sw.bb2636.i3813, %sw.bb2628.i3811, %sw.bb2626.i3809, %sw.bb2622.i3807, %sw.bb2620.i3804
  %xor2645.i3814.sink = phi i32 [ %xor2645.i3814, %sw.bb2644.i3815 ], [ %or2643.i3812, %sw.bb2636.i3813 ], [ %or2635.i3810, %sw.bb2628.i3811 ], [ %sub2627.i3808, %sw.bb2626.i3809 ], [ %add2625.i3806, %sw.bb2622.i3807 ], [ %mul2621.i3803, %sw.bb2620.i3804 ]
  store i32 %xor2645.i3814.sink, i32* %add.ptr2617.i3801, align 4, !tbaa !7
  %1602 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 57, i32 1), align 1, !tbaa !17
  %idxprom2659.i3817 = zext i8 %1602 to i32
  %arrayidx2660.i3818 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2659.i3817
  %1603 = load i32, i32* %arrayidx2660.i3818, align 4, !tbaa !7
  %1604 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 57, i32 0), align 8, !tbaa !16
  %conv2663.i3819 = zext i8 %1604 to i32
  %add.ptr2664.i3820 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2663.i3819
  %1605 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 57, i32 2), align 2, !tbaa !14
  switch i8 %1605, label %sw.default2694.i3835 [
    i8 0, label %sw.bb2667.i3823
    i8 1, label %sw.bb2669.i3826
    i8 2, label %sw.bb2673.i3828
    i8 3, label %sw.bb2675.i3830
    i8 4, label %sw.bb2683.i3832
    i8 5, label %sw.bb2691.i3834
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2667.i3823:                                  ; preds = %cleanup.cont2653.i3821
  %1606 = load i32, i32* %add.ptr2664.i3820, align 4, !tbaa !7
  %mul2668.i3822 = mul i32 %1606, %1603
  br label %cleanup.cont2700.i3840

sw.bb2669.i3826:                                  ; preds = %cleanup.cont2653.i3821
  %1607 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 57, i32 3), align 4, !tbaa !18
  %add2671.i3824 = add i32 %1607, %1603
  %1608 = load i32, i32* %add.ptr2664.i3820, align 4, !tbaa !7
  %add2672.i3825 = add i32 %add2671.i3824, %1608
  br label %cleanup.cont2700.i3840

sw.bb2673.i3828:                                  ; preds = %cleanup.cont2653.i3821
  %1609 = load i32, i32* %add.ptr2664.i3820, align 4, !tbaa !7
  %sub2674.i3827 = sub i32 %1609, %1603
  br label %cleanup.cont2700.i3840

sw.bb2675.i3830:                                  ; preds = %cleanup.cont2653.i3821
  %1610 = load i32, i32* %add.ptr2664.i3820, align 4, !tbaa !7
  %or2682.i3829 = call i32 @llvm.fshr.i32(i32 %1610, i32 %1610, i32 %1603) #7
  br label %cleanup.cont2700.i3840

sw.bb2683.i3832:                                  ; preds = %cleanup.cont2653.i3821
  %1611 = load i32, i32* %add.ptr2664.i3820, align 4, !tbaa !7
  %or2690.i3831 = call i32 @llvm.fshl.i32(i32 %1611, i32 %1611, i32 %1603) #7
  br label %cleanup.cont2700.i3840

sw.bb2691.i3834:                                  ; preds = %cleanup.cont2653.i3821
  %1612 = load i32, i32* %add.ptr2664.i3820, align 4, !tbaa !7
  %xor2692.i3833 = xor i32 %1612, %1603
  br label %cleanup.cont2700.i3840

sw.default2694.i3835:                             ; preds = %cleanup.cont2653.i3821
  unreachable

cleanup.cont2700.i3840:                           ; preds = %sw.bb2691.i3834, %sw.bb2683.i3832, %sw.bb2675.i3830, %sw.bb2673.i3828, %sw.bb2669.i3826, %sw.bb2667.i3823
  %xor2692.i3833.sink = phi i32 [ %xor2692.i3833, %sw.bb2691.i3834 ], [ %or2690.i3831, %sw.bb2683.i3832 ], [ %or2682.i3829, %sw.bb2675.i3830 ], [ %sub2674.i3827, %sw.bb2673.i3828 ], [ %add2672.i3825, %sw.bb2669.i3826 ], [ %mul2668.i3822, %sw.bb2667.i3823 ]
  store i32 %xor2692.i3833.sink, i32* %add.ptr2664.i3820, align 4, !tbaa !7
  %1613 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 58, i32 1), align 1, !tbaa !17
  %idxprom2706.i3836 = zext i8 %1613 to i32
  %arrayidx2707.i3837 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2706.i3836
  %1614 = load i32, i32* %arrayidx2707.i3837, align 4, !tbaa !7
  %1615 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 58, i32 0), align 16, !tbaa !16
  %conv2710.i3838 = zext i8 %1615 to i32
  %add.ptr2711.i3839 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2710.i3838
  %1616 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 58, i32 2), align 2, !tbaa !14
  switch i8 %1616, label %sw.default2741.i3854 [
    i8 0, label %sw.bb2714.i3842
    i8 1, label %sw.bb2716.i3845
    i8 2, label %sw.bb2720.i3847
    i8 3, label %sw.bb2722.i3849
    i8 4, label %sw.bb2730.i3851
    i8 5, label %sw.bb2738.i3853
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2714.i3842:                                  ; preds = %cleanup.cont2700.i3840
  %1617 = load i32, i32* %add.ptr2711.i3839, align 4, !tbaa !7
  %mul2715.i3841 = mul i32 %1617, %1614
  br label %cleanup.cont2747.i3859

sw.bb2716.i3845:                                  ; preds = %cleanup.cont2700.i3840
  %1618 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 58, i32 3), align 4, !tbaa !18
  %add2718.i3843 = add i32 %1618, %1614
  %1619 = load i32, i32* %add.ptr2711.i3839, align 4, !tbaa !7
  %add2719.i3844 = add i32 %add2718.i3843, %1619
  br label %cleanup.cont2747.i3859

sw.bb2720.i3847:                                  ; preds = %cleanup.cont2700.i3840
  %1620 = load i32, i32* %add.ptr2711.i3839, align 4, !tbaa !7
  %sub2721.i3846 = sub i32 %1620, %1614
  br label %cleanup.cont2747.i3859

sw.bb2722.i3849:                                  ; preds = %cleanup.cont2700.i3840
  %1621 = load i32, i32* %add.ptr2711.i3839, align 4, !tbaa !7
  %or2729.i3848 = call i32 @llvm.fshr.i32(i32 %1621, i32 %1621, i32 %1614) #7
  br label %cleanup.cont2747.i3859

sw.bb2730.i3851:                                  ; preds = %cleanup.cont2700.i3840
  %1622 = load i32, i32* %add.ptr2711.i3839, align 4, !tbaa !7
  %or2737.i3850 = call i32 @llvm.fshl.i32(i32 %1622, i32 %1622, i32 %1614) #7
  br label %cleanup.cont2747.i3859

sw.bb2738.i3853:                                  ; preds = %cleanup.cont2700.i3840
  %1623 = load i32, i32* %add.ptr2711.i3839, align 4, !tbaa !7
  %xor2739.i3852 = xor i32 %1623, %1614
  br label %cleanup.cont2747.i3859

sw.default2741.i3854:                             ; preds = %cleanup.cont2700.i3840
  unreachable

cleanup.cont2747.i3859:                           ; preds = %sw.bb2738.i3853, %sw.bb2730.i3851, %sw.bb2722.i3849, %sw.bb2720.i3847, %sw.bb2716.i3845, %sw.bb2714.i3842
  %xor2739.i3852.sink = phi i32 [ %xor2739.i3852, %sw.bb2738.i3853 ], [ %or2737.i3850, %sw.bb2730.i3851 ], [ %or2729.i3848, %sw.bb2722.i3849 ], [ %sub2721.i3846, %sw.bb2720.i3847 ], [ %add2719.i3844, %sw.bb2716.i3845 ], [ %mul2715.i3841, %sw.bb2714.i3842 ]
  store i32 %xor2739.i3852.sink, i32* %add.ptr2711.i3839, align 4, !tbaa !7
  %1624 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 59, i32 1), align 1, !tbaa !17
  %idxprom2753.i3855 = zext i8 %1624 to i32
  %arrayidx2754.i3856 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2753.i3855
  %1625 = load i32, i32* %arrayidx2754.i3856, align 4, !tbaa !7
  %1626 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 59, i32 0), align 8, !tbaa !16
  %conv2757.i3857 = zext i8 %1626 to i32
  %add.ptr2758.i3858 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2757.i3857
  %1627 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 59, i32 2), align 2, !tbaa !14
  switch i8 %1627, label %sw.default2788.i3873 [
    i8 0, label %sw.bb2761.i3861
    i8 1, label %sw.bb2763.i3864
    i8 2, label %sw.bb2767.i3866
    i8 3, label %sw.bb2769.i3868
    i8 4, label %sw.bb2777.i3870
    i8 5, label %sw.bb2785.i3872
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2761.i3861:                                  ; preds = %cleanup.cont2747.i3859
  %1628 = load i32, i32* %add.ptr2758.i3858, align 4, !tbaa !7
  %mul2762.i3860 = mul i32 %1628, %1625
  br label %cleanup.cont2794.i3878

sw.bb2763.i3864:                                  ; preds = %cleanup.cont2747.i3859
  %1629 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 59, i32 3), align 4, !tbaa !18
  %add2765.i3862 = add i32 %1629, %1625
  %1630 = load i32, i32* %add.ptr2758.i3858, align 4, !tbaa !7
  %add2766.i3863 = add i32 %add2765.i3862, %1630
  br label %cleanup.cont2794.i3878

sw.bb2767.i3866:                                  ; preds = %cleanup.cont2747.i3859
  %1631 = load i32, i32* %add.ptr2758.i3858, align 4, !tbaa !7
  %sub2768.i3865 = sub i32 %1631, %1625
  br label %cleanup.cont2794.i3878

sw.bb2769.i3868:                                  ; preds = %cleanup.cont2747.i3859
  %1632 = load i32, i32* %add.ptr2758.i3858, align 4, !tbaa !7
  %or2776.i3867 = call i32 @llvm.fshr.i32(i32 %1632, i32 %1632, i32 %1625) #7
  br label %cleanup.cont2794.i3878

sw.bb2777.i3870:                                  ; preds = %cleanup.cont2747.i3859
  %1633 = load i32, i32* %add.ptr2758.i3858, align 4, !tbaa !7
  %or2784.i3869 = call i32 @llvm.fshl.i32(i32 %1633, i32 %1633, i32 %1625) #7
  br label %cleanup.cont2794.i3878

sw.bb2785.i3872:                                  ; preds = %cleanup.cont2747.i3859
  %1634 = load i32, i32* %add.ptr2758.i3858, align 4, !tbaa !7
  %xor2786.i3871 = xor i32 %1634, %1625
  br label %cleanup.cont2794.i3878

sw.default2788.i3873:                             ; preds = %cleanup.cont2747.i3859
  unreachable

cleanup.cont2794.i3878:                           ; preds = %sw.bb2785.i3872, %sw.bb2777.i3870, %sw.bb2769.i3868, %sw.bb2767.i3866, %sw.bb2763.i3864, %sw.bb2761.i3861
  %xor2786.i3871.sink = phi i32 [ %xor2786.i3871, %sw.bb2785.i3872 ], [ %or2784.i3869, %sw.bb2777.i3870 ], [ %or2776.i3867, %sw.bb2769.i3868 ], [ %sub2768.i3865, %sw.bb2767.i3866 ], [ %add2766.i3863, %sw.bb2763.i3864 ], [ %mul2762.i3860, %sw.bb2761.i3861 ]
  store i32 %xor2786.i3871.sink, i32* %add.ptr2758.i3858, align 4, !tbaa !7
  %1635 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 60, i32 1), align 1, !tbaa !17
  %idxprom2800.i3874 = zext i8 %1635 to i32
  %arrayidx2801.i3875 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2800.i3874
  %1636 = load i32, i32* %arrayidx2801.i3875, align 4, !tbaa !7
  %1637 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 60, i32 0), align 16, !tbaa !16
  %conv2804.i3876 = zext i8 %1637 to i32
  %add.ptr2805.i3877 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2804.i3876
  %1638 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 60, i32 2), align 2, !tbaa !14
  switch i8 %1638, label %sw.default2835.i3892 [
    i8 0, label %sw.bb2808.i3880
    i8 1, label %sw.bb2810.i3883
    i8 2, label %sw.bb2814.i3885
    i8 3, label %sw.bb2816.i3887
    i8 4, label %sw.bb2824.i3889
    i8 5, label %sw.bb2832.i3891
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2808.i3880:                                  ; preds = %cleanup.cont2794.i3878
  %1639 = load i32, i32* %add.ptr2805.i3877, align 4, !tbaa !7
  %mul2809.i3879 = mul i32 %1639, %1636
  br label %cleanup.cont2841.i3897

sw.bb2810.i3883:                                  ; preds = %cleanup.cont2794.i3878
  %1640 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 60, i32 3), align 4, !tbaa !18
  %add2812.i3881 = add i32 %1640, %1636
  %1641 = load i32, i32* %add.ptr2805.i3877, align 4, !tbaa !7
  %add2813.i3882 = add i32 %add2812.i3881, %1641
  br label %cleanup.cont2841.i3897

sw.bb2814.i3885:                                  ; preds = %cleanup.cont2794.i3878
  %1642 = load i32, i32* %add.ptr2805.i3877, align 4, !tbaa !7
  %sub2815.i3884 = sub i32 %1642, %1636
  br label %cleanup.cont2841.i3897

sw.bb2816.i3887:                                  ; preds = %cleanup.cont2794.i3878
  %1643 = load i32, i32* %add.ptr2805.i3877, align 4, !tbaa !7
  %or2823.i3886 = call i32 @llvm.fshr.i32(i32 %1643, i32 %1643, i32 %1636) #7
  br label %cleanup.cont2841.i3897

sw.bb2824.i3889:                                  ; preds = %cleanup.cont2794.i3878
  %1644 = load i32, i32* %add.ptr2805.i3877, align 4, !tbaa !7
  %or2831.i3888 = call i32 @llvm.fshl.i32(i32 %1644, i32 %1644, i32 %1636) #7
  br label %cleanup.cont2841.i3897

sw.bb2832.i3891:                                  ; preds = %cleanup.cont2794.i3878
  %1645 = load i32, i32* %add.ptr2805.i3877, align 4, !tbaa !7
  %xor2833.i3890 = xor i32 %1645, %1636
  br label %cleanup.cont2841.i3897

sw.default2835.i3892:                             ; preds = %cleanup.cont2794.i3878
  unreachable

cleanup.cont2841.i3897:                           ; preds = %sw.bb2832.i3891, %sw.bb2824.i3889, %sw.bb2816.i3887, %sw.bb2814.i3885, %sw.bb2810.i3883, %sw.bb2808.i3880
  %xor2833.i3890.sink = phi i32 [ %xor2833.i3890, %sw.bb2832.i3891 ], [ %or2831.i3888, %sw.bb2824.i3889 ], [ %or2823.i3886, %sw.bb2816.i3887 ], [ %sub2815.i3884, %sw.bb2814.i3885 ], [ %add2813.i3882, %sw.bb2810.i3883 ], [ %mul2809.i3879, %sw.bb2808.i3880 ]
  store i32 %xor2833.i3890.sink, i32* %add.ptr2805.i3877, align 4, !tbaa !7
  %1646 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 61, i32 1), align 1, !tbaa !17
  %idxprom2847.i3893 = zext i8 %1646 to i32
  %arrayidx2848.i3894 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2847.i3893
  %1647 = load i32, i32* %arrayidx2848.i3894, align 4, !tbaa !7
  %1648 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 61, i32 0), align 8, !tbaa !16
  %conv2851.i3895 = zext i8 %1648 to i32
  %add.ptr2852.i3896 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2851.i3895
  %1649 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 61, i32 2), align 2, !tbaa !14
  switch i8 %1649, label %sw.default2882.i3911 [
    i8 0, label %sw.bb2855.i3899
    i8 1, label %sw.bb2857.i3902
    i8 2, label %sw.bb2861.i3904
    i8 3, label %sw.bb2863.i3906
    i8 4, label %sw.bb2871.i3908
    i8 5, label %sw.bb2879.i3910
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2855.i3899:                                  ; preds = %cleanup.cont2841.i3897
  %1650 = load i32, i32* %add.ptr2852.i3896, align 4, !tbaa !7
  %mul2856.i3898 = mul i32 %1650, %1647
  br label %cleanup.cont2888.i3916

sw.bb2857.i3902:                                  ; preds = %cleanup.cont2841.i3897
  %1651 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 61, i32 3), align 4, !tbaa !18
  %add2859.i3900 = add i32 %1651, %1647
  %1652 = load i32, i32* %add.ptr2852.i3896, align 4, !tbaa !7
  %add2860.i3901 = add i32 %add2859.i3900, %1652
  br label %cleanup.cont2888.i3916

sw.bb2861.i3904:                                  ; preds = %cleanup.cont2841.i3897
  %1653 = load i32, i32* %add.ptr2852.i3896, align 4, !tbaa !7
  %sub2862.i3903 = sub i32 %1653, %1647
  br label %cleanup.cont2888.i3916

sw.bb2863.i3906:                                  ; preds = %cleanup.cont2841.i3897
  %1654 = load i32, i32* %add.ptr2852.i3896, align 4, !tbaa !7
  %or2870.i3905 = call i32 @llvm.fshr.i32(i32 %1654, i32 %1654, i32 %1647) #7
  br label %cleanup.cont2888.i3916

sw.bb2871.i3908:                                  ; preds = %cleanup.cont2841.i3897
  %1655 = load i32, i32* %add.ptr2852.i3896, align 4, !tbaa !7
  %or2878.i3907 = call i32 @llvm.fshl.i32(i32 %1655, i32 %1655, i32 %1647) #7
  br label %cleanup.cont2888.i3916

sw.bb2879.i3910:                                  ; preds = %cleanup.cont2841.i3897
  %1656 = load i32, i32* %add.ptr2852.i3896, align 4, !tbaa !7
  %xor2880.i3909 = xor i32 %1656, %1647
  br label %cleanup.cont2888.i3916

sw.default2882.i3911:                             ; preds = %cleanup.cont2841.i3897
  unreachable

cleanup.cont2888.i3916:                           ; preds = %sw.bb2879.i3910, %sw.bb2871.i3908, %sw.bb2863.i3906, %sw.bb2861.i3904, %sw.bb2857.i3902, %sw.bb2855.i3899
  %xor2880.i3909.sink = phi i32 [ %xor2880.i3909, %sw.bb2879.i3910 ], [ %or2878.i3907, %sw.bb2871.i3908 ], [ %or2870.i3905, %sw.bb2863.i3906 ], [ %sub2862.i3903, %sw.bb2861.i3904 ], [ %add2860.i3901, %sw.bb2857.i3902 ], [ %mul2856.i3898, %sw.bb2855.i3899 ]
  store i32 %xor2880.i3909.sink, i32* %add.ptr2852.i3896, align 4, !tbaa !7
  %1657 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 62, i32 1), align 1, !tbaa !17
  %idxprom2894.i3912 = zext i8 %1657 to i32
  %arrayidx2895.i3913 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2894.i3912
  %1658 = load i32, i32* %arrayidx2895.i3913, align 4, !tbaa !7
  %1659 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 62, i32 0), align 16, !tbaa !16
  %conv2898.i3914 = zext i8 %1659 to i32
  %add.ptr2899.i3915 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2898.i3914
  %1660 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 62, i32 2), align 2, !tbaa !14
  switch i8 %1660, label %sw.default2929.i3930 [
    i8 0, label %sw.bb2902.i3918
    i8 1, label %sw.bb2904.i3921
    i8 2, label %sw.bb2908.i3923
    i8 3, label %sw.bb2910.i3925
    i8 4, label %sw.bb2918.i3927
    i8 5, label %sw.bb2926.i3929
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2902.i3918:                                  ; preds = %cleanup.cont2888.i3916
  %1661 = load i32, i32* %add.ptr2899.i3915, align 4, !tbaa !7
  %mul2903.i3917 = mul i32 %1661, %1658
  br label %cleanup.cont2935.i3935

sw.bb2904.i3921:                                  ; preds = %cleanup.cont2888.i3916
  %1662 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 62, i32 3), align 4, !tbaa !18
  %add2906.i3919 = add i32 %1662, %1658
  %1663 = load i32, i32* %add.ptr2899.i3915, align 4, !tbaa !7
  %add2907.i3920 = add i32 %add2906.i3919, %1663
  br label %cleanup.cont2935.i3935

sw.bb2908.i3923:                                  ; preds = %cleanup.cont2888.i3916
  %1664 = load i32, i32* %add.ptr2899.i3915, align 4, !tbaa !7
  %sub2909.i3922 = sub i32 %1664, %1658
  br label %cleanup.cont2935.i3935

sw.bb2910.i3925:                                  ; preds = %cleanup.cont2888.i3916
  %1665 = load i32, i32* %add.ptr2899.i3915, align 4, !tbaa !7
  %or2917.i3924 = call i32 @llvm.fshr.i32(i32 %1665, i32 %1665, i32 %1658) #7
  br label %cleanup.cont2935.i3935

sw.bb2918.i3927:                                  ; preds = %cleanup.cont2888.i3916
  %1666 = load i32, i32* %add.ptr2899.i3915, align 4, !tbaa !7
  %or2925.i3926 = call i32 @llvm.fshl.i32(i32 %1666, i32 %1666, i32 %1658) #7
  br label %cleanup.cont2935.i3935

sw.bb2926.i3929:                                  ; preds = %cleanup.cont2888.i3916
  %1667 = load i32, i32* %add.ptr2899.i3915, align 4, !tbaa !7
  %xor2927.i3928 = xor i32 %1667, %1658
  br label %cleanup.cont2935.i3935

sw.default2929.i3930:                             ; preds = %cleanup.cont2888.i3916
  unreachable

cleanup.cont2935.i3935:                           ; preds = %sw.bb2926.i3929, %sw.bb2918.i3927, %sw.bb2910.i3925, %sw.bb2908.i3923, %sw.bb2904.i3921, %sw.bb2902.i3918
  %xor2927.i3928.sink = phi i32 [ %xor2927.i3928, %sw.bb2926.i3929 ], [ %or2925.i3926, %sw.bb2918.i3927 ], [ %or2917.i3924, %sw.bb2910.i3925 ], [ %sub2909.i3922, %sw.bb2908.i3923 ], [ %add2907.i3920, %sw.bb2904.i3921 ], [ %mul2903.i3917, %sw.bb2902.i3918 ]
  store i32 %xor2927.i3928.sink, i32* %add.ptr2899.i3915, align 4, !tbaa !7
  %1668 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 63, i32 1), align 1, !tbaa !17
  %idxprom2941.i3931 = zext i8 %1668 to i32
  %arrayidx2942.i3932 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2941.i3931
  %1669 = load i32, i32* %arrayidx2942.i3932, align 4, !tbaa !7
  %1670 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 63, i32 0), align 8, !tbaa !16
  %conv2945.i3933 = zext i8 %1670 to i32
  %add.ptr2946.i3934 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2945.i3933
  %1671 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 63, i32 2), align 2, !tbaa !14
  switch i8 %1671, label %sw.default2976.i3949 [
    i8 0, label %sw.bb2949.i3937
    i8 1, label %sw.bb2951.i3940
    i8 2, label %sw.bb2955.i3942
    i8 3, label %sw.bb2957.i3944
    i8 4, label %sw.bb2965.i3946
    i8 5, label %sw.bb2973.i3948
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2949.i3937:                                  ; preds = %cleanup.cont2935.i3935
  %1672 = load i32, i32* %add.ptr2946.i3934, align 4, !tbaa !7
  %mul2950.i3936 = mul i32 %1672, %1669
  br label %cleanup.cont2982.i3954

sw.bb2951.i3940:                                  ; preds = %cleanup.cont2935.i3935
  %1673 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 63, i32 3), align 4, !tbaa !18
  %add2953.i3938 = add i32 %1673, %1669
  %1674 = load i32, i32* %add.ptr2946.i3934, align 4, !tbaa !7
  %add2954.i3939 = add i32 %add2953.i3938, %1674
  br label %cleanup.cont2982.i3954

sw.bb2955.i3942:                                  ; preds = %cleanup.cont2935.i3935
  %1675 = load i32, i32* %add.ptr2946.i3934, align 4, !tbaa !7
  %sub2956.i3941 = sub i32 %1675, %1669
  br label %cleanup.cont2982.i3954

sw.bb2957.i3944:                                  ; preds = %cleanup.cont2935.i3935
  %1676 = load i32, i32* %add.ptr2946.i3934, align 4, !tbaa !7
  %or2964.i3943 = call i32 @llvm.fshr.i32(i32 %1676, i32 %1676, i32 %1669) #7
  br label %cleanup.cont2982.i3954

sw.bb2965.i3946:                                  ; preds = %cleanup.cont2935.i3935
  %1677 = load i32, i32* %add.ptr2946.i3934, align 4, !tbaa !7
  %or2972.i3945 = call i32 @llvm.fshl.i32(i32 %1677, i32 %1677, i32 %1669) #7
  br label %cleanup.cont2982.i3954

sw.bb2973.i3948:                                  ; preds = %cleanup.cont2935.i3935
  %1678 = load i32, i32* %add.ptr2946.i3934, align 4, !tbaa !7
  %xor2974.i3947 = xor i32 %1678, %1669
  br label %cleanup.cont2982.i3954

sw.default2976.i3949:                             ; preds = %cleanup.cont2935.i3935
  unreachable

cleanup.cont2982.i3954:                           ; preds = %sw.bb2973.i3948, %sw.bb2965.i3946, %sw.bb2957.i3944, %sw.bb2955.i3942, %sw.bb2951.i3940, %sw.bb2949.i3937
  %xor2974.i3947.sink = phi i32 [ %xor2974.i3947, %sw.bb2973.i3948 ], [ %or2972.i3945, %sw.bb2965.i3946 ], [ %or2964.i3943, %sw.bb2957.i3944 ], [ %sub2956.i3941, %sw.bb2955.i3942 ], [ %add2954.i3939, %sw.bb2951.i3940 ], [ %mul2950.i3936, %sw.bb2949.i3937 ]
  store i32 %xor2974.i3947.sink, i32* %add.ptr2946.i3934, align 4, !tbaa !7
  %1679 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 64, i32 1), align 1, !tbaa !17
  %idxprom2988.i3950 = zext i8 %1679 to i32
  %arrayidx2989.i3951 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2988.i3950
  %1680 = load i32, i32* %arrayidx2989.i3951, align 4, !tbaa !7
  %1681 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 64, i32 0), align 16, !tbaa !16
  %conv2992.i3952 = zext i8 %1681 to i32
  %add.ptr2993.i3953 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2992.i3952
  %1682 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 64, i32 2), align 2, !tbaa !14
  switch i8 %1682, label %sw.default3023.i3968 [
    i8 0, label %sw.bb2996.i3956
    i8 1, label %sw.bb2998.i3959
    i8 2, label %sw.bb3002.i3961
    i8 3, label %sw.bb3004.i3963
    i8 4, label %sw.bb3012.i3965
    i8 5, label %sw.bb3020.i3967
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb2996.i3956:                                  ; preds = %cleanup.cont2982.i3954
  %1683 = load i32, i32* %add.ptr2993.i3953, align 4, !tbaa !7
  %mul2997.i3955 = mul i32 %1683, %1680
  br label %cleanup.cont3029.i3973

sw.bb2998.i3959:                                  ; preds = %cleanup.cont2982.i3954
  %1684 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 64, i32 3), align 4, !tbaa !18
  %add3000.i3957 = add i32 %1684, %1680
  %1685 = load i32, i32* %add.ptr2993.i3953, align 4, !tbaa !7
  %add3001.i3958 = add i32 %add3000.i3957, %1685
  br label %cleanup.cont3029.i3973

sw.bb3002.i3961:                                  ; preds = %cleanup.cont2982.i3954
  %1686 = load i32, i32* %add.ptr2993.i3953, align 4, !tbaa !7
  %sub3003.i3960 = sub i32 %1686, %1680
  br label %cleanup.cont3029.i3973

sw.bb3004.i3963:                                  ; preds = %cleanup.cont2982.i3954
  %1687 = load i32, i32* %add.ptr2993.i3953, align 4, !tbaa !7
  %or3011.i3962 = call i32 @llvm.fshr.i32(i32 %1687, i32 %1687, i32 %1680) #7
  br label %cleanup.cont3029.i3973

sw.bb3012.i3965:                                  ; preds = %cleanup.cont2982.i3954
  %1688 = load i32, i32* %add.ptr2993.i3953, align 4, !tbaa !7
  %or3019.i3964 = call i32 @llvm.fshl.i32(i32 %1688, i32 %1688, i32 %1680) #7
  br label %cleanup.cont3029.i3973

sw.bb3020.i3967:                                  ; preds = %cleanup.cont2982.i3954
  %1689 = load i32, i32* %add.ptr2993.i3953, align 4, !tbaa !7
  %xor3021.i3966 = xor i32 %1689, %1680
  br label %cleanup.cont3029.i3973

sw.default3023.i3968:                             ; preds = %cleanup.cont2982.i3954
  unreachable

cleanup.cont3029.i3973:                           ; preds = %sw.bb3020.i3967, %sw.bb3012.i3965, %sw.bb3004.i3963, %sw.bb3002.i3961, %sw.bb2998.i3959, %sw.bb2996.i3956
  %xor3021.i3966.sink = phi i32 [ %xor3021.i3966, %sw.bb3020.i3967 ], [ %or3019.i3964, %sw.bb3012.i3965 ], [ %or3011.i3962, %sw.bb3004.i3963 ], [ %sub3003.i3960, %sw.bb3002.i3961 ], [ %add3001.i3958, %sw.bb2998.i3959 ], [ %mul2997.i3955, %sw.bb2996.i3956 ]
  store i32 %xor3021.i3966.sink, i32* %add.ptr2993.i3953, align 4, !tbaa !7
  %1690 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 65, i32 1), align 1, !tbaa !17
  %idxprom3035.i3969 = zext i8 %1690 to i32
  %arrayidx3036.i3970 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom3035.i3969
  %1691 = load i32, i32* %arrayidx3036.i3970, align 4, !tbaa !7
  %1692 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 65, i32 0), align 8, !tbaa !16
  %conv3039.i3971 = zext i8 %1692 to i32
  %add.ptr3040.i3972 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv3039.i3971
  %1693 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 65, i32 2), align 2, !tbaa !14
  switch i8 %1693, label %sw.default3070.i3987 [
    i8 0, label %sw.bb3043.i3975
    i8 1, label %sw.bb3045.i3978
    i8 2, label %sw.bb3049.i3980
    i8 3, label %sw.bb3051.i3982
    i8 4, label %sw.bb3059.i3984
    i8 5, label %sw.bb3067.i3986
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb3043.i3975:                                  ; preds = %cleanup.cont3029.i3973
  %1694 = load i32, i32* %add.ptr3040.i3972, align 4, !tbaa !7
  %mul3044.i3974 = mul i32 %1694, %1691
  br label %cleanup.cont3076.i3992

sw.bb3045.i3978:                                  ; preds = %cleanup.cont3029.i3973
  %1695 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 65, i32 3), align 4, !tbaa !18
  %add3047.i3976 = add i32 %1695, %1691
  %1696 = load i32, i32* %add.ptr3040.i3972, align 4, !tbaa !7
  %add3048.i3977 = add i32 %add3047.i3976, %1696
  br label %cleanup.cont3076.i3992

sw.bb3049.i3980:                                  ; preds = %cleanup.cont3029.i3973
  %1697 = load i32, i32* %add.ptr3040.i3972, align 4, !tbaa !7
  %sub3050.i3979 = sub i32 %1697, %1691
  br label %cleanup.cont3076.i3992

sw.bb3051.i3982:                                  ; preds = %cleanup.cont3029.i3973
  %1698 = load i32, i32* %add.ptr3040.i3972, align 4, !tbaa !7
  %or3058.i3981 = call i32 @llvm.fshr.i32(i32 %1698, i32 %1698, i32 %1691) #7
  br label %cleanup.cont3076.i3992

sw.bb3059.i3984:                                  ; preds = %cleanup.cont3029.i3973
  %1699 = load i32, i32* %add.ptr3040.i3972, align 4, !tbaa !7
  %or3066.i3983 = call i32 @llvm.fshl.i32(i32 %1699, i32 %1699, i32 %1691) #7
  br label %cleanup.cont3076.i3992

sw.bb3067.i3986:                                  ; preds = %cleanup.cont3029.i3973
  %1700 = load i32, i32* %add.ptr3040.i3972, align 4, !tbaa !7
  %xor3068.i3985 = xor i32 %1700, %1691
  br label %cleanup.cont3076.i3992

sw.default3070.i3987:                             ; preds = %cleanup.cont3029.i3973
  unreachable

cleanup.cont3076.i3992:                           ; preds = %sw.bb3067.i3986, %sw.bb3059.i3984, %sw.bb3051.i3982, %sw.bb3049.i3980, %sw.bb3045.i3978, %sw.bb3043.i3975
  %xor3068.i3985.sink = phi i32 [ %xor3068.i3985, %sw.bb3067.i3986 ], [ %or3066.i3983, %sw.bb3059.i3984 ], [ %or3058.i3981, %sw.bb3051.i3982 ], [ %sub3050.i3979, %sw.bb3049.i3980 ], [ %add3048.i3977, %sw.bb3045.i3978 ], [ %mul3044.i3974, %sw.bb3043.i3975 ]
  store i32 %xor3068.i3985.sink, i32* %add.ptr3040.i3972, align 4, !tbaa !7
  %1701 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 66, i32 1), align 1, !tbaa !17
  %idxprom3082.i3988 = zext i8 %1701 to i32
  %arrayidx3083.i3989 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom3082.i3988
  %1702 = load i32, i32* %arrayidx3083.i3989, align 4, !tbaa !7
  %1703 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 66, i32 0), align 16, !tbaa !16
  %conv3086.i3990 = zext i8 %1703 to i32
  %add.ptr3087.i3991 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv3086.i3990
  %1704 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 66, i32 2), align 2, !tbaa !14
  switch i8 %1704, label %sw.default3117.i4006 [
    i8 0, label %sw.bb3090.i3994
    i8 1, label %sw.bb3092.i3997
    i8 2, label %sw.bb3096.i3999
    i8 3, label %sw.bb3098.i4001
    i8 4, label %sw.bb3106.i4003
    i8 5, label %sw.bb3114.i4005
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb3090.i3994:                                  ; preds = %cleanup.cont3076.i3992
  %1705 = load i32, i32* %add.ptr3087.i3991, align 4, !tbaa !7
  %mul3091.i3993 = mul i32 %1705, %1702
  br label %cleanup.cont3123.i4011

sw.bb3092.i3997:                                  ; preds = %cleanup.cont3076.i3992
  %1706 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 66, i32 3), align 4, !tbaa !18
  %add3094.i3995 = add i32 %1706, %1702
  %1707 = load i32, i32* %add.ptr3087.i3991, align 4, !tbaa !7
  %add3095.i3996 = add i32 %add3094.i3995, %1707
  br label %cleanup.cont3123.i4011

sw.bb3096.i3999:                                  ; preds = %cleanup.cont3076.i3992
  %1708 = load i32, i32* %add.ptr3087.i3991, align 4, !tbaa !7
  %sub3097.i3998 = sub i32 %1708, %1702
  br label %cleanup.cont3123.i4011

sw.bb3098.i4001:                                  ; preds = %cleanup.cont3076.i3992
  %1709 = load i32, i32* %add.ptr3087.i3991, align 4, !tbaa !7
  %or3105.i4000 = call i32 @llvm.fshr.i32(i32 %1709, i32 %1709, i32 %1702) #7
  br label %cleanup.cont3123.i4011

sw.bb3106.i4003:                                  ; preds = %cleanup.cont3076.i3992
  %1710 = load i32, i32* %add.ptr3087.i3991, align 4, !tbaa !7
  %or3113.i4002 = call i32 @llvm.fshl.i32(i32 %1710, i32 %1710, i32 %1702) #7
  br label %cleanup.cont3123.i4011

sw.bb3114.i4005:                                  ; preds = %cleanup.cont3076.i3992
  %1711 = load i32, i32* %add.ptr3087.i3991, align 4, !tbaa !7
  %xor3115.i4004 = xor i32 %1711, %1702
  br label %cleanup.cont3123.i4011

sw.default3117.i4006:                             ; preds = %cleanup.cont3076.i3992
  unreachable

cleanup.cont3123.i4011:                           ; preds = %sw.bb3114.i4005, %sw.bb3106.i4003, %sw.bb3098.i4001, %sw.bb3096.i3999, %sw.bb3092.i3997, %sw.bb3090.i3994
  %xor3115.i4004.sink = phi i32 [ %xor3115.i4004, %sw.bb3114.i4005 ], [ %or3113.i4002, %sw.bb3106.i4003 ], [ %or3105.i4000, %sw.bb3098.i4001 ], [ %sub3097.i3998, %sw.bb3096.i3999 ], [ %add3095.i3996, %sw.bb3092.i3997 ], [ %mul3091.i3993, %sw.bb3090.i3994 ]
  store i32 %xor3115.i4004.sink, i32* %add.ptr3087.i3991, align 4, !tbaa !7
  %1712 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 67, i32 1), align 1, !tbaa !17
  %idxprom3129.i4007 = zext i8 %1712 to i32
  %arrayidx3130.i4008 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom3129.i4007
  %1713 = load i32, i32* %arrayidx3130.i4008, align 4, !tbaa !7
  %1714 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 67, i32 0), align 8, !tbaa !16
  %conv3133.i4009 = zext i8 %1714 to i32
  %add.ptr3134.i4010 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv3133.i4009
  %1715 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 67, i32 2), align 2, !tbaa !14
  switch i8 %1715, label %sw.default3164.i4025 [
    i8 0, label %sw.bb3137.i4013
    i8 1, label %sw.bb3139.i4016
    i8 2, label %sw.bb3143.i4018
    i8 3, label %sw.bb3145.i4020
    i8 4, label %sw.bb3153.i4022
    i8 5, label %sw.bb3161.i4024
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb3137.i4013:                                  ; preds = %cleanup.cont3123.i4011
  %1716 = load i32, i32* %add.ptr3134.i4010, align 4, !tbaa !7
  %mul3138.i4012 = mul i32 %1716, %1713
  br label %cleanup.cont3170.i4030

sw.bb3139.i4016:                                  ; preds = %cleanup.cont3123.i4011
  %1717 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 67, i32 3), align 4, !tbaa !18
  %add3141.i4014 = add i32 %1717, %1713
  %1718 = load i32, i32* %add.ptr3134.i4010, align 4, !tbaa !7
  %add3142.i4015 = add i32 %add3141.i4014, %1718
  br label %cleanup.cont3170.i4030

sw.bb3143.i4018:                                  ; preds = %cleanup.cont3123.i4011
  %1719 = load i32, i32* %add.ptr3134.i4010, align 4, !tbaa !7
  %sub3144.i4017 = sub i32 %1719, %1713
  br label %cleanup.cont3170.i4030

sw.bb3145.i4020:                                  ; preds = %cleanup.cont3123.i4011
  %1720 = load i32, i32* %add.ptr3134.i4010, align 4, !tbaa !7
  %or3152.i4019 = call i32 @llvm.fshr.i32(i32 %1720, i32 %1720, i32 %1713) #7
  br label %cleanup.cont3170.i4030

sw.bb3153.i4022:                                  ; preds = %cleanup.cont3123.i4011
  %1721 = load i32, i32* %add.ptr3134.i4010, align 4, !tbaa !7
  %or3160.i4021 = call i32 @llvm.fshl.i32(i32 %1721, i32 %1721, i32 %1713) #7
  br label %cleanup.cont3170.i4030

sw.bb3161.i4024:                                  ; preds = %cleanup.cont3123.i4011
  %1722 = load i32, i32* %add.ptr3134.i4010, align 4, !tbaa !7
  %xor3162.i4023 = xor i32 %1722, %1713
  br label %cleanup.cont3170.i4030

sw.default3164.i4025:                             ; preds = %cleanup.cont3123.i4011
  unreachable

cleanup.cont3170.i4030:                           ; preds = %sw.bb3161.i4024, %sw.bb3153.i4022, %sw.bb3145.i4020, %sw.bb3143.i4018, %sw.bb3139.i4016, %sw.bb3137.i4013
  %xor3162.i4023.sink = phi i32 [ %xor3162.i4023, %sw.bb3161.i4024 ], [ %or3160.i4021, %sw.bb3153.i4022 ], [ %or3152.i4019, %sw.bb3145.i4020 ], [ %sub3144.i4017, %sw.bb3143.i4018 ], [ %add3142.i4015, %sw.bb3139.i4016 ], [ %mul3138.i4012, %sw.bb3137.i4013 ]
  store i32 %xor3162.i4023.sink, i32* %add.ptr3134.i4010, align 4, !tbaa !7
  %1723 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 68, i32 1), align 1, !tbaa !17
  %idxprom3176.i4026 = zext i8 %1723 to i32
  %arrayidx3177.i4027 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom3176.i4026
  %1724 = load i32, i32* %arrayidx3177.i4027, align 4, !tbaa !7
  %1725 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 68, i32 0), align 16, !tbaa !16
  %conv3180.i4028 = zext i8 %1725 to i32
  %add.ptr3181.i4029 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv3180.i4028
  %1726 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 68, i32 2), align 2, !tbaa !14
  switch i8 %1726, label %sw.default3211.i4044 [
    i8 0, label %sw.bb3184.i4032
    i8 1, label %sw.bb3186.i4035
    i8 2, label %sw.bb3190.i4037
    i8 3, label %sw.bb3192.i4039
    i8 4, label %sw.bb3200.i4041
    i8 5, label %sw.bb3208.i4043
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb3184.i4032:                                  ; preds = %cleanup.cont3170.i4030
  %1727 = load i32, i32* %add.ptr3181.i4029, align 4, !tbaa !7
  %mul3185.i4031 = mul i32 %1727, %1724
  br label %cleanup.cont3217.i4049

sw.bb3186.i4035:                                  ; preds = %cleanup.cont3170.i4030
  %1728 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 68, i32 3), align 4, !tbaa !18
  %add3188.i4033 = add i32 %1728, %1724
  %1729 = load i32, i32* %add.ptr3181.i4029, align 4, !tbaa !7
  %add3189.i4034 = add i32 %add3188.i4033, %1729
  br label %cleanup.cont3217.i4049

sw.bb3190.i4037:                                  ; preds = %cleanup.cont3170.i4030
  %1730 = load i32, i32* %add.ptr3181.i4029, align 4, !tbaa !7
  %sub3191.i4036 = sub i32 %1730, %1724
  br label %cleanup.cont3217.i4049

sw.bb3192.i4039:                                  ; preds = %cleanup.cont3170.i4030
  %1731 = load i32, i32* %add.ptr3181.i4029, align 4, !tbaa !7
  %or3199.i4038 = call i32 @llvm.fshr.i32(i32 %1731, i32 %1731, i32 %1724) #7
  br label %cleanup.cont3217.i4049

sw.bb3200.i4041:                                  ; preds = %cleanup.cont3170.i4030
  %1732 = load i32, i32* %add.ptr3181.i4029, align 4, !tbaa !7
  %or3207.i4040 = call i32 @llvm.fshl.i32(i32 %1732, i32 %1732, i32 %1724) #7
  br label %cleanup.cont3217.i4049

sw.bb3208.i4043:                                  ; preds = %cleanup.cont3170.i4030
  %1733 = load i32, i32* %add.ptr3181.i4029, align 4, !tbaa !7
  %xor3209.i4042 = xor i32 %1733, %1724
  br label %cleanup.cont3217.i4049

sw.default3211.i4044:                             ; preds = %cleanup.cont3170.i4030
  unreachable

cleanup.cont3217.i4049:                           ; preds = %sw.bb3208.i4043, %sw.bb3200.i4041, %sw.bb3192.i4039, %sw.bb3190.i4037, %sw.bb3186.i4035, %sw.bb3184.i4032
  %xor3209.i4042.sink = phi i32 [ %xor3209.i4042, %sw.bb3208.i4043 ], [ %or3207.i4040, %sw.bb3200.i4041 ], [ %or3199.i4038, %sw.bb3192.i4039 ], [ %sub3191.i4036, %sw.bb3190.i4037 ], [ %add3189.i4034, %sw.bb3186.i4035 ], [ %mul3185.i4031, %sw.bb3184.i4032 ]
  store i32 %xor3209.i4042.sink, i32* %add.ptr3181.i4029, align 4, !tbaa !7
  %1734 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 69, i32 1), align 1, !tbaa !17
  %idxprom3223.i4045 = zext i8 %1734 to i32
  %arrayidx3224.i4046 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom3223.i4045
  %1735 = load i32, i32* %arrayidx3224.i4046, align 4, !tbaa !7
  %1736 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 69, i32 0), align 8, !tbaa !16
  %conv3227.i4047 = zext i8 %1736 to i32
  %add.ptr3228.i4048 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv3227.i4047
  %1737 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 69, i32 2), align 2, !tbaa !14
  switch i8 %1737, label %sw.default3258.i4063 [
    i8 0, label %sw.bb3231.i4051
    i8 1, label %sw.bb3233.i4054
    i8 2, label %sw.bb3237.i4056
    i8 3, label %sw.bb3239.i4058
    i8 4, label %sw.bb3247.i4060
    i8 5, label %sw.bb3255.i4062
    i8 6, label %v4_random_math.exit4064
  ]

sw.bb3231.i4051:                                  ; preds = %cleanup.cont3217.i4049
  %1738 = load i32, i32* %add.ptr3228.i4048, align 4, !tbaa !7
  %mul3232.i4050 = mul i32 %1738, %1735
  store i32 %mul3232.i4050, i32* %add.ptr3228.i4048, align 4, !tbaa !7
  br label %v4_random_math.exit4064

sw.bb3233.i4054:                                  ; preds = %cleanup.cont3217.i4049
  %1739 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 69, i32 3), align 4, !tbaa !18
  %add3235.i4052 = add i32 %1739, %1735
  %1740 = load i32, i32* %add.ptr3228.i4048, align 4, !tbaa !7
  %add3236.i4053 = add i32 %add3235.i4052, %1740
  store i32 %add3236.i4053, i32* %add.ptr3228.i4048, align 4, !tbaa !7
  br label %v4_random_math.exit4064

sw.bb3237.i4056:                                  ; preds = %cleanup.cont3217.i4049
  %1741 = load i32, i32* %add.ptr3228.i4048, align 4, !tbaa !7
  %sub3238.i4055 = sub i32 %1741, %1735
  store i32 %sub3238.i4055, i32* %add.ptr3228.i4048, align 4, !tbaa !7
  br label %v4_random_math.exit4064

sw.bb3239.i4058:                                  ; preds = %cleanup.cont3217.i4049
  %1742 = load i32, i32* %add.ptr3228.i4048, align 4, !tbaa !7
  %or3246.i4057 = call i32 @llvm.fshr.i32(i32 %1742, i32 %1742, i32 %1735) #7
  store i32 %or3246.i4057, i32* %add.ptr3228.i4048, align 4, !tbaa !7
  br label %v4_random_math.exit4064

sw.bb3247.i4060:                                  ; preds = %cleanup.cont3217.i4049
  %1743 = load i32, i32* %add.ptr3228.i4048, align 4, !tbaa !7
  %or3254.i4059 = call i32 @llvm.fshl.i32(i32 %1743, i32 %1743, i32 %1735) #7
  store i32 %or3254.i4059, i32* %add.ptr3228.i4048, align 4, !tbaa !7
  br label %v4_random_math.exit4064

sw.bb3255.i4062:                                  ; preds = %cleanup.cont3217.i4049
  %1744 = load i32, i32* %add.ptr3228.i4048, align 4, !tbaa !7
  %xor3256.i4061 = xor i32 %1744, %1735
  store i32 %xor3256.i4061, i32* %add.ptr3228.i4048, align 4, !tbaa !7
  br label %v4_random_math.exit4064

sw.default3258.i4063:                             ; preds = %cleanup.cont3217.i4049
  unreachable

v4_random_math.exit4064:                          ; preds = %if.then1053, %cleanup.cont.i2757, %cleanup.cont68.i2776, %cleanup.cont115.i2795, %cleanup.cont162.i2814, %cleanup.cont209.i2833, %cleanup.cont256.i2852, %cleanup.cont303.i2871, %cleanup.cont350.i2890, %cleanup.cont397.i2909, %cleanup.cont444.i2928, %cleanup.cont491.i2947, %cleanup.cont538.i2966, %cleanup.cont585.i2985, %cleanup.cont632.i3004, %cleanup.cont679.i3023, %cleanup.cont726.i3042, %cleanup.cont773.i3061, %cleanup.cont820.i3080, %cleanup.cont867.i3099, %cleanup.cont914.i3118, %cleanup.cont961.i3137, %cleanup.cont1008.i3156, %cleanup.cont1055.i3175, %cleanup.cont1102.i3194, %cleanup.cont1149.i3213, %cleanup.cont1196.i3232, %cleanup.cont1243.i3251, %cleanup.cont1290.i3270, %cleanup.cont1337.i3289, %cleanup.cont1384.i3308, %cleanup.cont1431.i3327, %cleanup.cont1478.i3346, %cleanup.cont1525.i3365, %cleanup.cont1572.i3384, %cleanup.cont1619.i3403, %cleanup.cont1666.i3422, %cleanup.cont1713.i3441, %cleanup.cont1760.i3460, %cleanup.cont1807.i3479, %cleanup.cont1854.i3498, %cleanup.cont1901.i3517, %cleanup.cont1948.i3536, %cleanup.cont1995.i3555, %cleanup.cont2042.i3574, %cleanup.cont2089.i3593, %cleanup.cont2136.i3612, %cleanup.cont2183.i3631, %cleanup.cont2230.i3650, %cleanup.cont2277.i3669, %cleanup.cont2324.i3688, %cleanup.cont2371.i3707, %cleanup.cont2418.i3726, %cleanup.cont2465.i3745, %cleanup.cont2512.i3764, %cleanup.cont2559.i3783, %cleanup.cont2606.i3802, %cleanup.cont2653.i3821, %cleanup.cont2700.i3840, %cleanup.cont2747.i3859, %cleanup.cont2794.i3878, %cleanup.cont2841.i3897, %cleanup.cont2888.i3916, %cleanup.cont2935.i3935, %cleanup.cont2982.i3954, %cleanup.cont3029.i3973, %cleanup.cont3076.i3992, %cleanup.cont3123.i4011, %cleanup.cont3170.i4030, %cleanup.cont3217.i4049, %sw.bb3231.i4051, %sw.bb3233.i4054, %sw.bb3237.i4056, %sw.bb3239.i4058, %sw.bb3247.i4060, %sw.bb3255.i4062
  %1745 = load i32, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 2), align 8, !tbaa !7
  %conv1090 = zext i32 %1745 to i64
  %1746 = load i32, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 3), align 4, !tbaa !7
  %conv1091 = zext i32 %1746 to i64
  %shl1092 = shl nuw i64 %conv1091, 32
  %or1093 = or i64 %shl1092, %conv1090
  %xor1095 = xor i64 %or1093, %963
  %1747 = load i32, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 0), align 16, !tbaa !7
  %conv1096 = zext i32 %1747 to i64
  %1748 = load i32, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 1), align 4, !tbaa !7
  %conv1097 = zext i32 %1748 to i64
  %shl1098 = shl nuw i64 %conv1097, 32
  %or1099 = or i64 %shl1098, %conv1096
  %xor1101 = xor i64 %or1099, %964
  store i64 %xor1095, i64* %75, align 16
  store i64 %xor1101, i64* %83, align 8
  br label %do.end1106

do.end1106:                                       ; preds = %for.body980.do.end1106_crit_edge, %v4_random_math.exit4064
  %.pre-phi = phi i64* [ %.phi.trans.insert, %for.body980.do.end1106_crit_edge ], [ %t.sroa.0.0.arrayidx1055.sroa_cast, %v4_random_math.exit4064 ]
  %1749 = phi i64 [ %963, %for.body980.do.end1106_crit_edge ], [ %xor1095, %v4_random_math.exit4064 ]
  %1750 = phi i64 [ %964, %for.body980.do.end1106_crit_edge ], [ %xor1101, %v4_random_math.exit4064 ]
  %1751 = phi i64 [ %.pre5775, %for.body980.do.end1106_crit_edge ], [ %xor1063, %v4_random_math.exit4064 ]
  %and.i2715 = and i64 %xor1037, 4294967295
  %and2.i2716 = and i64 %1751, 4294967295
  %mul.i2717 = mul nuw i64 %and2.i2716, %and.i2715
  %and3.i2718 = and i64 %mul.i2717, 4294967295
  %shr.i2719 = lshr i64 %mul.i2717, 32
  %shr4.i2720 = lshr i64 %xor1037, 32
  %mul5.i2721 = mul nuw i64 %and2.i2716, %shr4.i2720
  %add.i2722 = add nuw i64 %shr.i2719, %mul5.i2721
  %and6.i2723 = and i64 %add.i2722, 4294967295
  %shr7.i2724 = lshr i64 %add.i2722, 32
  %shr8.i2725 = lshr i64 %1751, 32
  %mul9.i2726 = mul nuw i64 %shr8.i2725, %and.i2715
  %add10.i2727 = add nuw i64 %and6.i2723, %mul9.i2726
  %shr11.i2728 = lshr i64 %add10.i2727, 32
  %mul12.i2729 = mul nuw i64 %shr8.i2725, %shr4.i2720
  %add13.i2730 = add nuw i64 %shr7.i2724, %mul12.i2729
  %add14.i2731 = add nuw i64 %add13.i2730, %shr11.i2728
  %shl.i2732 = shl i64 %add10.i2727, 32
  %add15.i2733 = or i64 %shl.i2732, %and3.i2718
  %xor1112 = xor i32 %and1047, 16
  %add.ptr1113 = getelementptr inbounds i8, i8* %call, i32 %xor1112
  %1752 = bitcast i8* %add.ptr1113 to i64*
  %xor1115 = xor i32 %and1047, 32
  %add.ptr1116 = getelementptr inbounds i8, i8* %call, i32 %xor1115
  %1753 = bitcast i8* %add.ptr1116 to i64*
  %xor1118 = xor i32 %and1047, 48
  %add.ptr1119 = getelementptr inbounds i8, i8* %call, i32 %xor1118
  %1754 = bitcast i8* %add.ptr1119 to i64*
  %1755 = load i64, i64* %1752, align 8, !tbaa !2
  %arrayidx1125 = getelementptr inbounds i8, i8* %add.ptr1113, i32 8
  %1756 = bitcast i8* %arrayidx1125 to i64*
  %1757 = load i64, i64* %1756, align 8, !tbaa !2
  %1758 = load i64, i64* %1753, align 8, !tbaa !2
  %arrayidx1129 = getelementptr inbounds i8, i8* %add.ptr1116, i32 8
  %1759 = bitcast i8* %arrayidx1129 to i64*
  %1760 = load i64, i64* %1759, align 8, !tbaa !2
  %1761 = load i64, i64* %1754, align 8, !tbaa !2
  %arrayidx1133 = getelementptr inbounds i8, i8* %add.ptr1119, i32 8
  %1762 = bitcast i8* %arrayidx1133 to i64*
  %1763 = load i64, i64* %1762, align 8, !tbaa !2
  %add1136 = add i64 %1761, %d.sroa.0.sroa.0.0.insert.insert
  store i64 %add1136, i64* %1752, align 8, !tbaa !2
  %add1140 = add i64 %1763, %d.sroa.23.35716
  store i64 %add1140, i64* %1756, align 8, !tbaa !2
  %add1144 = add i64 %1758, %963
  store i64 %add1144, i64* %1754, align 8, !tbaa !2
  %add1148 = add i64 %1760, %964
  store i64 %add1148, i64* %1762, align 8, !tbaa !2
  %add1152 = add i64 %965, %1755
  store i64 %add1152, i64* %1753, align 8, !tbaa !2
  %add1156 = add i64 %966, %1757
  store i64 %add1156, i64* %1759, align 8, !tbaa !2
  %xor1161 = xor i64 %1755, %xor1037
  %xor1158 = xor i64 %xor1161, %1758
  %xor1165 = xor i64 %xor1158, %1761
  %xor1163 = xor i64 %1757, %xor1039
  %xor1159 = xor i64 %xor1163, %1760
  %xor1167 = xor i64 %xor1159, %1763
  %add.i2710 = add i64 %1750, %add15.i2733
  %add4.i2711 = add i64 %add14.i2731, %1749
  %1764 = load i64, i64* %.pre-phi, align 8, !tbaa !2
  %xor.i2712 = xor i64 %1764, %add4.i2711
  store i64 %xor.i2712, i64* %75, align 16, !tbaa !2
  %arrayidx7.i2713 = getelementptr inbounds i8, i8* %arrayidx1108, i32 %and1047
  %1765 = bitcast i8* %arrayidx7.i2713 to i64*
  %1766 = load i64, i64* %1765, align 8, !tbaa !2
  %xor8.i2714 = xor i64 %1766, %add.i2710
  store i64 %xor8.i2714, i64* %83, align 8, !tbaa !2
  store i64 %add4.i2711, i64* %.pre-phi, align 8, !tbaa !2
  store i64 %add.i2710, i64* %1765, align 8, !tbaa !2
  %1767 = trunc i64 %xor.i2712 to i32
  %and1177 = and i32 %mask.0, %1767
  %arrayidx1179 = getelementptr inbounds i8, i8* %call, i32 %and1177
  %1768 = load i8, i8* %arrayidx1179, align 1, !tbaa !6
  %idxprom.i2692 = zext i8 %1768 to i32
  %arrayidx1.i2693 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i2692
  %1769 = load i32, i32* %arrayidx1.i2693, align 4, !tbaa !7
  %arrayidx2.i2694 = getelementptr inbounds i8, i8* %arrayidx1179, i32 5
  %1770 = load i8, i8* %arrayidx2.i2694, align 1, !tbaa !6
  %idxprom3.i = zext i8 %1770 to i32
  %arrayidx4.i2695 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom3.i
  %1771 = load i32, i32* %arrayidx4.i2695, align 4, !tbaa !7
  %arrayidx5.i = getelementptr inbounds i8, i8* %arrayidx1179, i32 10
  %1772 = load i8, i8* %arrayidx5.i, align 1, !tbaa !6
  %idxprom6.i = zext i8 %1772 to i32
  %arrayidx7.i2697 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom6.i
  %1773 = load i32, i32* %arrayidx7.i2697, align 4, !tbaa !7
  %arrayidx9.i = getelementptr inbounds i8, i8* %arrayidx1179, i32 15
  %1774 = load i8, i8* %arrayidx9.i, align 1, !tbaa !6
  %idxprom10.i = zext i8 %1774 to i32
  %arrayidx11.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom10.i
  %1775 = load i32, i32* %arrayidx11.i, align 4, !tbaa !7
  %xor.i2696 = xor i32 %1769, %1767
  %xor8.i2698 = xor i32 %xor.i2696, %1771
  %xor12.i = xor i32 %xor8.i2698, %1773
  %xor14.i = xor i32 %xor12.i, %1775
  store i32 %xor14.i, i32* %598, align 16, !tbaa !7
  %arrayidx16.i2699 = getelementptr inbounds i8, i8* %arrayidx1179, i32 3
  %1776 = load i8, i8* %arrayidx16.i2699, align 1, !tbaa !6
  %idxprom17.i = zext i8 %1776 to i32
  %arrayidx18.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom17.i
  %1777 = load i32, i32* %arrayidx18.i, align 4, !tbaa !7
  %arrayidx19.i = getelementptr inbounds i8, i8* %arrayidx1179, i32 4
  %1778 = load i8, i8* %arrayidx19.i, align 1, !tbaa !6
  %idxprom20.i = zext i8 %1778 to i32
  %arrayidx21.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom20.i
  %1779 = load i32, i32* %arrayidx21.i, align 4, !tbaa !7
  %xor22.i = xor i32 %1779, %1777
  %arrayidx23.i2700 = getelementptr inbounds i8, i8* %arrayidx1179, i32 9
  %1780 = load i8, i8* %arrayidx23.i2700, align 1, !tbaa !6
  %idxprom24.i = zext i8 %1780 to i32
  %arrayidx25.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom24.i
  %1781 = load i32, i32* %arrayidx25.i, align 4, !tbaa !7
  %xor26.i = xor i32 %xor22.i, %1781
  %arrayidx27.i = getelementptr inbounds i8, i8* %arrayidx1179, i32 14
  %1782 = load i8, i8* %arrayidx27.i, align 1, !tbaa !6
  %idxprom28.i = zext i8 %1782 to i32
  %arrayidx29.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom28.i
  %1783 = load i32, i32* %arrayidx29.i, align 4, !tbaa !7
  %xor30.i = xor i32 %xor26.i, %1783
  %1784 = lshr i64 %xor.i2712, 32
  %1785 = trunc i64 %1784 to i32
  %xor32.i = xor i32 %xor30.i, %1785
  store i32 %xor32.i, i32* %599, align 4, !tbaa !7
  %arrayidx34.i2702 = getelementptr inbounds i8, i8* %arrayidx1179, i32 2
  %1786 = load i8, i8* %arrayidx34.i2702, align 1, !tbaa !6
  %idxprom35.i = zext i8 %1786 to i32
  %arrayidx36.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom35.i
  %1787 = load i32, i32* %arrayidx36.i, align 4, !tbaa !7
  %arrayidx37.i = getelementptr inbounds i8, i8* %arrayidx1179, i32 7
  %1788 = load i8, i8* %arrayidx37.i, align 1, !tbaa !6
  %idxprom38.i = zext i8 %1788 to i32
  %arrayidx39.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom38.i
  %1789 = load i32, i32* %arrayidx39.i, align 4, !tbaa !7
  %xor40.i = xor i32 %1789, %1787
  %arrayidx41.i = getelementptr inbounds i8, i8* %arrayidx1179, i32 8
  %1790 = load i8, i8* %arrayidx41.i, align 1, !tbaa !6
  %idxprom42.i = zext i8 %1790 to i32
  %arrayidx43.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom42.i
  %1791 = load i32, i32* %arrayidx43.i, align 4, !tbaa !7
  %xor44.i = xor i32 %xor40.i, %1791
  %arrayidx45.i = getelementptr inbounds i8, i8* %arrayidx1179, i32 13
  %1792 = load i8, i8* %arrayidx45.i, align 1, !tbaa !6
  %idxprom46.i = zext i8 %1792 to i32
  %arrayidx47.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom46.i
  %1793 = load i32, i32* %arrayidx47.i, align 4, !tbaa !7
  %xor48.i = xor i32 %xor44.i, %1793
  %1794 = trunc i64 %xor8.i2714 to i32
  %xor50.i = xor i32 %xor48.i, %1794
  store i32 %xor50.i, i32* %600, align 8, !tbaa !7
  %arrayidx52.i2704 = getelementptr inbounds i8, i8* %arrayidx1179, i32 1
  %1795 = load i8, i8* %arrayidx52.i2704, align 1, !tbaa !6
  %idxprom53.i = zext i8 %1795 to i32
  %arrayidx54.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom53.i
  %1796 = load i32, i32* %arrayidx54.i, align 4, !tbaa !7
  %arrayidx55.i = getelementptr inbounds i8, i8* %arrayidx1179, i32 6
  %1797 = load i8, i8* %arrayidx55.i, align 1, !tbaa !6
  %idxprom56.i = zext i8 %1797 to i32
  %arrayidx57.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom56.i
  %1798 = load i32, i32* %arrayidx57.i, align 4, !tbaa !7
  %xor58.i = xor i32 %1798, %1796
  %arrayidx59.i = getelementptr inbounds i8, i8* %arrayidx1179, i32 11
  %1799 = load i8, i8* %arrayidx59.i, align 1, !tbaa !6
  %idxprom60.i = zext i8 %1799 to i32
  %arrayidx61.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom60.i
  %1800 = load i32, i32* %arrayidx61.i, align 4, !tbaa !7
  %xor62.i = xor i32 %xor58.i, %1800
  %arrayidx63.i = getelementptr inbounds i8, i8* %arrayidx1179, i32 12
  %1801 = load i8, i8* %arrayidx63.i, align 1, !tbaa !6
  %idxprom64.i = zext i8 %1801 to i32
  %arrayidx65.i = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom64.i
  %1802 = load i32, i32* %arrayidx65.i, align 4, !tbaa !7
  %xor66.i = xor i32 %xor62.i, %1802
  %1803 = load i32, i32* %597, align 4, !tbaa !7
  %xor68.i = xor i32 %xor66.i, %1803
  store i32 %xor68.i, i32* %601, align 4, !tbaa !7
  %xor1183 = xor i32 %and1177, 16
  %add.ptr1184 = getelementptr inbounds i8, i8* %call, i32 %xor1183
  %1804 = bitcast i8* %add.ptr1184 to i64*
  %xor1186 = xor i32 %and1177, 32
  %add.ptr1187 = getelementptr inbounds i8, i8* %call, i32 %xor1186
  %1805 = bitcast i8* %add.ptr1187 to i64*
  %xor1189 = xor i32 %and1177, 48
  %add.ptr1190 = getelementptr inbounds i8, i8* %call, i32 %xor1189
  %1806 = bitcast i8* %add.ptr1190 to i64*
  %1807 = load i64, i64* %1804, align 8, !tbaa !2
  %arrayidx1196 = getelementptr inbounds i8, i8* %add.ptr1184, i32 8
  %1808 = bitcast i8* %arrayidx1196 to i64*
  %1809 = load i64, i64* %1808, align 8, !tbaa !2
  %1810 = load i64, i64* %1805, align 8, !tbaa !2
  %arrayidx1200 = getelementptr inbounds i8, i8* %add.ptr1187, i32 8
  %1811 = bitcast i8* %arrayidx1200 to i64*
  %1812 = load i64, i64* %1811, align 8, !tbaa !2
  %1813 = load i64, i64* %1806, align 8, !tbaa !2
  %arrayidx1204 = getelementptr inbounds i8, i8* %add.ptr1190, i32 8
  %1814 = bitcast i8* %arrayidx1204 to i64*
  %1815 = load i64, i64* %1814, align 8, !tbaa !2
  %add1207 = add i64 %1813, %965
  store i64 %add1207, i64* %1804, align 8, !tbaa !2
  %add1211 = add i64 %1815, %966
  store i64 %add1211, i64* %1808, align 8, !tbaa !2
  %1816 = load i64, i64* %75, align 16, !tbaa !2
  %add1215 = add i64 %1816, %1810
  store i64 %add1215, i64* %1806, align 8, !tbaa !2
  %1817 = load i64, i64* %83, align 8, !tbaa !2
  %add1219 = add i64 %1817, %1812
  store i64 %add1219, i64* %1814, align 8, !tbaa !2
  %add1223 = add i64 %1807, %xor1165
  store i64 %add1223, i64* %1805, align 8, !tbaa !2
  %add1227 = add i64 %1809, %xor1167
  store i64 %add1227, i64* %1811, align 8, !tbaa !2
  %xor1229 = xor i64 %1810, %1807
  %xor1230 = xor i64 %1812, %1809
  %1818 = load i64, i64* %76, align 16, !tbaa !2
  %xor1232 = xor i64 %1818, %1813
  %1819 = load i64, i64* %86, align 8, !tbaa !2
  %xor1234 = xor i64 %1819, %1815
  %xor1236 = xor i64 %xor1229, %xor1232
  store i64 %xor1236, i64* %76, align 16, !tbaa !2
  %xor1238 = xor i64 %xor1230, %xor1234
  store i64 %xor1238, i64* %86, align 8, !tbaa !2
  %xor.i2690 = xor i64 %xor1236, %xor1165
  %1820 = bitcast i8* %arrayidx1179 to i64*
  store i64 %xor.i2690, i64* %1820, align 8, !tbaa !2
  %xor5.i = xor i64 %xor1238, %xor1167
  %1821 = bitcast i8* %arrayidx41.i to i64*
  store i64 %xor5.i, i64* %1821, align 8, !tbaa !2
  %1822 = trunc i64 %xor1236 to i32
  %and1246 = and i32 %mask.0, %1822
  br i1 %cmp345683, label %if.then1252, label %do.end1106.do.end1306_crit_edge

do.end1106.do.end1306_crit_edge:                  ; preds = %do.end1106
  %arrayidx1308.phi.trans.insert = getelementptr inbounds i8, i8* %call, i32 %and1246
  %.phi.trans.insert5776 = bitcast i8* %arrayidx1308.phi.trans.insert to i64*
  %.pre5777 = load i64, i64* %.phi.trans.insert5776, align 8, !tbaa !2
  %.pre5789 = trunc i64 %xor1165 to i32
  br label %do.end1306

if.then1252:                                      ; preds = %do.end1106
  %1823 = trunc i64 %1817 to i32
  %c.sroa.0.sroa.0.0.extract.trunc = trunc i64 %xor1165 to i32
  %arrayidx1255 = getelementptr inbounds i8, i8* %call, i32 %and1246
  %t1253.sroa.0.0.arrayidx1255.sroa_cast = bitcast i8* %arrayidx1255 to i64*
  %t1253.sroa.0.0.copyload1478 = load i64, i64* %t1253.sroa.0.0.arrayidx1255.sroa_cast, align 1
  %1824 = load i32, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 0), align 16, !tbaa !7
  %1825 = load i32, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 1), align 4, !tbaa !7
  %add1256 = add i32 %1825, %1824
  %conv1257 = zext i32 %add1256 to i64
  %1826 = load i32, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 2), align 8, !tbaa !7
  %1827 = load i32, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 3), align 4, !tbaa !7
  %add1258 = add i32 %1827, %1826
  %conv1259 = zext i32 %add1258 to i64
  %shl1260 = shl nuw i64 %conv1259, 32
  %or1261 = or i64 %shl1260, %conv1257
  %xor1263 = xor i64 %or1261, %t1253.sroa.0.0.copyload1478
  store i64 %xor1263, i64* %t1253.sroa.0.0.arrayidx1255.sroa_cast, align 1
  store i32 %1767, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 4), align 16
  store i32 %1823, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 5), align 4
  store i32 %c.sroa.0.sroa.0.0.extract.trunc, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 6), align 8
  store i32 %969, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 7), align 4
  %d.sroa.23.8.extract.trunc5265 = trunc i64 %966 to i32
  store i32 %d.sroa.23.8.extract.trunc5265, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 8), align 16
  %1828 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 0, i32 1), align 1, !tbaa !17
  %idxprom.i2682 = zext i8 %1828 to i32
  %arrayidx.i2683 = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom.i2682
  %1829 = load i32, i32* %arrayidx.i2683, align 4, !tbaa !7
  %1830 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 0, i32 0), align 16, !tbaa !16
  %conv.i = zext i8 %1830 to i32
  %add.ptr2.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv.i
  %1831 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 0, i32 2), align 2, !tbaa !14
  switch i8 %1831, label %sw.default.i [
    i8 0, label %sw.bb.i
    i8 1, label %sw.bb4.i
    i8 2, label %sw.bb6.i
    i8 3, label %sw.bb7.i
    i8 4, label %sw.bb10.i
    i8 5, label %sw.bb18.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb.i:                                          ; preds = %if.then1252
  %1832 = load i32, i32* %add.ptr2.i, align 4, !tbaa !7
  %mul.i2684 = mul i32 %1832, %1829
  br label %cleanup.cont.i

sw.bb4.i:                                         ; preds = %if.then1252
  %1833 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 0, i32 3), align 4, !tbaa !18
  %add.i2685 = add i32 %1833, %1829
  %1834 = load i32, i32* %add.ptr2.i, align 4, !tbaa !7
  %add5.i = add i32 %add.i2685, %1834
  br label %cleanup.cont.i

sw.bb6.i:                                         ; preds = %if.then1252
  %1835 = load i32, i32* %add.ptr2.i, align 4, !tbaa !7
  %sub.i2686 = sub i32 %1835, %1829
  br label %cleanup.cont.i

sw.bb7.i:                                         ; preds = %if.then1252
  %1836 = load i32, i32* %add.ptr2.i, align 4, !tbaa !7
  %or.i = call i32 @llvm.fshr.i32(i32 %1836, i32 %1836, i32 %1829) #7
  br label %cleanup.cont.i

sw.bb10.i:                                        ; preds = %if.then1252
  %1837 = load i32, i32* %add.ptr2.i, align 4, !tbaa !7
  %or17.i = call i32 @llvm.fshl.i32(i32 %1837, i32 %1837, i32 %1829) #7
  br label %cleanup.cont.i

sw.bb18.i:                                        ; preds = %if.then1252
  %1838 = load i32, i32* %add.ptr2.i, align 4, !tbaa !7
  %xor.i2687 = xor i32 %1838, %1829
  br label %cleanup.cont.i

sw.default.i:                                     ; preds = %if.then1252
  unreachable

cleanup.cont.i:                                   ; preds = %sw.bb18.i, %sw.bb10.i, %sw.bb7.i, %sw.bb6.i, %sw.bb4.i, %sw.bb.i
  %xor.i2687.sink = phi i32 [ %xor.i2687, %sw.bb18.i ], [ %or17.i, %sw.bb10.i ], [ %or.i, %sw.bb7.i ], [ %sub.i2686, %sw.bb6.i ], [ %add5.i, %sw.bb4.i ], [ %mul.i2684, %sw.bb.i ]
  store i32 %xor.i2687.sink, i32* %add.ptr2.i, align 4, !tbaa !7
  %1839 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 1, i32 1), align 1, !tbaa !17
  %idxprom27.i = zext i8 %1839 to i32
  %arrayidx28.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom27.i
  %1840 = load i32, i32* %arrayidx28.i, align 4, !tbaa !7
  %1841 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 1, i32 0), align 8, !tbaa !16
  %conv31.i = zext i8 %1841 to i32
  %add.ptr32.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv31.i
  %1842 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 1, i32 2), align 2, !tbaa !14
  switch i8 %1842, label %sw.default62.i [
    i8 0, label %sw.bb35.i
    i8 1, label %sw.bb37.i
    i8 2, label %sw.bb41.i
    i8 3, label %sw.bb43.i
    i8 4, label %sw.bb51.i
    i8 5, label %sw.bb59.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb35.i:                                        ; preds = %cleanup.cont.i
  %1843 = load i32, i32* %add.ptr32.i, align 4, !tbaa !7
  %mul36.i = mul i32 %1843, %1840
  br label %cleanup.cont68.i

sw.bb37.i:                                        ; preds = %cleanup.cont.i
  %1844 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 1, i32 3), align 4, !tbaa !18
  %add39.i = add i32 %1844, %1840
  %1845 = load i32, i32* %add.ptr32.i, align 4, !tbaa !7
  %add40.i = add i32 %add39.i, %1845
  br label %cleanup.cont68.i

sw.bb41.i:                                        ; preds = %cleanup.cont.i
  %1846 = load i32, i32* %add.ptr32.i, align 4, !tbaa !7
  %sub42.i = sub i32 %1846, %1840
  br label %cleanup.cont68.i

sw.bb43.i:                                        ; preds = %cleanup.cont.i
  %1847 = load i32, i32* %add.ptr32.i, align 4, !tbaa !7
  %or50.i = call i32 @llvm.fshr.i32(i32 %1847, i32 %1847, i32 %1840) #7
  br label %cleanup.cont68.i

sw.bb51.i:                                        ; preds = %cleanup.cont.i
  %1848 = load i32, i32* %add.ptr32.i, align 4, !tbaa !7
  %or58.i = call i32 @llvm.fshl.i32(i32 %1848, i32 %1848, i32 %1840) #7
  br label %cleanup.cont68.i

sw.bb59.i:                                        ; preds = %cleanup.cont.i
  %1849 = load i32, i32* %add.ptr32.i, align 4, !tbaa !7
  %xor60.i = xor i32 %1849, %1840
  br label %cleanup.cont68.i

sw.default62.i:                                   ; preds = %cleanup.cont.i
  unreachable

cleanup.cont68.i:                                 ; preds = %sw.bb59.i, %sw.bb51.i, %sw.bb43.i, %sw.bb41.i, %sw.bb37.i, %sw.bb35.i
  %xor60.i.sink = phi i32 [ %xor60.i, %sw.bb59.i ], [ %or58.i, %sw.bb51.i ], [ %or50.i, %sw.bb43.i ], [ %sub42.i, %sw.bb41.i ], [ %add40.i, %sw.bb37.i ], [ %mul36.i, %sw.bb35.i ]
  store i32 %xor60.i.sink, i32* %add.ptr32.i, align 4, !tbaa !7
  %1850 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 2, i32 1), align 1, !tbaa !17
  %idxprom74.i = zext i8 %1850 to i32
  %arrayidx75.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom74.i
  %1851 = load i32, i32* %arrayidx75.i, align 4, !tbaa !7
  %1852 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 2, i32 0), align 16, !tbaa !16
  %conv78.i = zext i8 %1852 to i32
  %add.ptr79.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv78.i
  %1853 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 2, i32 2), align 2, !tbaa !14
  switch i8 %1853, label %sw.default109.i [
    i8 0, label %sw.bb82.i
    i8 1, label %sw.bb84.i
    i8 2, label %sw.bb88.i
    i8 3, label %sw.bb90.i
    i8 4, label %sw.bb98.i
    i8 5, label %sw.bb106.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb82.i:                                        ; preds = %cleanup.cont68.i
  %1854 = load i32, i32* %add.ptr79.i, align 4, !tbaa !7
  %mul83.i = mul i32 %1854, %1851
  br label %cleanup.cont115.i

sw.bb84.i:                                        ; preds = %cleanup.cont68.i
  %1855 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 2, i32 3), align 4, !tbaa !18
  %add86.i = add i32 %1855, %1851
  %1856 = load i32, i32* %add.ptr79.i, align 4, !tbaa !7
  %add87.i = add i32 %add86.i, %1856
  br label %cleanup.cont115.i

sw.bb88.i:                                        ; preds = %cleanup.cont68.i
  %1857 = load i32, i32* %add.ptr79.i, align 4, !tbaa !7
  %sub89.i = sub i32 %1857, %1851
  br label %cleanup.cont115.i

sw.bb90.i:                                        ; preds = %cleanup.cont68.i
  %1858 = load i32, i32* %add.ptr79.i, align 4, !tbaa !7
  %or97.i = call i32 @llvm.fshr.i32(i32 %1858, i32 %1858, i32 %1851) #7
  br label %cleanup.cont115.i

sw.bb98.i:                                        ; preds = %cleanup.cont68.i
  %1859 = load i32, i32* %add.ptr79.i, align 4, !tbaa !7
  %or105.i = call i32 @llvm.fshl.i32(i32 %1859, i32 %1859, i32 %1851) #7
  br label %cleanup.cont115.i

sw.bb106.i:                                       ; preds = %cleanup.cont68.i
  %1860 = load i32, i32* %add.ptr79.i, align 4, !tbaa !7
  %xor107.i = xor i32 %1860, %1851
  br label %cleanup.cont115.i

sw.default109.i:                                  ; preds = %cleanup.cont68.i
  unreachable

cleanup.cont115.i:                                ; preds = %sw.bb106.i, %sw.bb98.i, %sw.bb90.i, %sw.bb88.i, %sw.bb84.i, %sw.bb82.i
  %xor107.i.sink = phi i32 [ %xor107.i, %sw.bb106.i ], [ %or105.i, %sw.bb98.i ], [ %or97.i, %sw.bb90.i ], [ %sub89.i, %sw.bb88.i ], [ %add87.i, %sw.bb84.i ], [ %mul83.i, %sw.bb82.i ]
  store i32 %xor107.i.sink, i32* %add.ptr79.i, align 4, !tbaa !7
  %1861 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 3, i32 1), align 1, !tbaa !17
  %idxprom121.i = zext i8 %1861 to i32
  %arrayidx122.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom121.i
  %1862 = load i32, i32* %arrayidx122.i, align 4, !tbaa !7
  %1863 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 3, i32 0), align 8, !tbaa !16
  %conv125.i = zext i8 %1863 to i32
  %add.ptr126.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv125.i
  %1864 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 3, i32 2), align 2, !tbaa !14
  switch i8 %1864, label %sw.default156.i [
    i8 0, label %sw.bb129.i
    i8 1, label %sw.bb131.i
    i8 2, label %sw.bb135.i
    i8 3, label %sw.bb137.i
    i8 4, label %sw.bb145.i
    i8 5, label %sw.bb153.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb129.i:                                       ; preds = %cleanup.cont115.i
  %1865 = load i32, i32* %add.ptr126.i, align 4, !tbaa !7
  %mul130.i = mul i32 %1865, %1862
  br label %cleanup.cont162.i

sw.bb131.i:                                       ; preds = %cleanup.cont115.i
  %1866 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 3, i32 3), align 4, !tbaa !18
  %add133.i = add i32 %1866, %1862
  %1867 = load i32, i32* %add.ptr126.i, align 4, !tbaa !7
  %add134.i = add i32 %add133.i, %1867
  br label %cleanup.cont162.i

sw.bb135.i:                                       ; preds = %cleanup.cont115.i
  %1868 = load i32, i32* %add.ptr126.i, align 4, !tbaa !7
  %sub136.i = sub i32 %1868, %1862
  br label %cleanup.cont162.i

sw.bb137.i:                                       ; preds = %cleanup.cont115.i
  %1869 = load i32, i32* %add.ptr126.i, align 4, !tbaa !7
  %or144.i = call i32 @llvm.fshr.i32(i32 %1869, i32 %1869, i32 %1862) #7
  br label %cleanup.cont162.i

sw.bb145.i:                                       ; preds = %cleanup.cont115.i
  %1870 = load i32, i32* %add.ptr126.i, align 4, !tbaa !7
  %or152.i = call i32 @llvm.fshl.i32(i32 %1870, i32 %1870, i32 %1862) #7
  br label %cleanup.cont162.i

sw.bb153.i:                                       ; preds = %cleanup.cont115.i
  %1871 = load i32, i32* %add.ptr126.i, align 4, !tbaa !7
  %xor154.i = xor i32 %1871, %1862
  br label %cleanup.cont162.i

sw.default156.i:                                  ; preds = %cleanup.cont115.i
  unreachable

cleanup.cont162.i:                                ; preds = %sw.bb153.i, %sw.bb145.i, %sw.bb137.i, %sw.bb135.i, %sw.bb131.i, %sw.bb129.i
  %xor154.i.sink = phi i32 [ %xor154.i, %sw.bb153.i ], [ %or152.i, %sw.bb145.i ], [ %or144.i, %sw.bb137.i ], [ %sub136.i, %sw.bb135.i ], [ %add134.i, %sw.bb131.i ], [ %mul130.i, %sw.bb129.i ]
  store i32 %xor154.i.sink, i32* %add.ptr126.i, align 4, !tbaa !7
  %1872 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 4, i32 1), align 1, !tbaa !17
  %idxprom168.i = zext i8 %1872 to i32
  %arrayidx169.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom168.i
  %1873 = load i32, i32* %arrayidx169.i, align 4, !tbaa !7
  %1874 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 4, i32 0), align 16, !tbaa !16
  %conv172.i = zext i8 %1874 to i32
  %add.ptr173.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv172.i
  %1875 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 4, i32 2), align 2, !tbaa !14
  switch i8 %1875, label %sw.default203.i [
    i8 0, label %sw.bb176.i
    i8 1, label %sw.bb178.i
    i8 2, label %sw.bb182.i
    i8 3, label %sw.bb184.i
    i8 4, label %sw.bb192.i
    i8 5, label %sw.bb200.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb176.i:                                       ; preds = %cleanup.cont162.i
  %1876 = load i32, i32* %add.ptr173.i, align 4, !tbaa !7
  %mul177.i = mul i32 %1876, %1873
  br label %cleanup.cont209.i

sw.bb178.i:                                       ; preds = %cleanup.cont162.i
  %1877 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 4, i32 3), align 4, !tbaa !18
  %add180.i = add i32 %1877, %1873
  %1878 = load i32, i32* %add.ptr173.i, align 4, !tbaa !7
  %add181.i = add i32 %add180.i, %1878
  br label %cleanup.cont209.i

sw.bb182.i:                                       ; preds = %cleanup.cont162.i
  %1879 = load i32, i32* %add.ptr173.i, align 4, !tbaa !7
  %sub183.i = sub i32 %1879, %1873
  br label %cleanup.cont209.i

sw.bb184.i:                                       ; preds = %cleanup.cont162.i
  %1880 = load i32, i32* %add.ptr173.i, align 4, !tbaa !7
  %or191.i = call i32 @llvm.fshr.i32(i32 %1880, i32 %1880, i32 %1873) #7
  br label %cleanup.cont209.i

sw.bb192.i:                                       ; preds = %cleanup.cont162.i
  %1881 = load i32, i32* %add.ptr173.i, align 4, !tbaa !7
  %or199.i = call i32 @llvm.fshl.i32(i32 %1881, i32 %1881, i32 %1873) #7
  br label %cleanup.cont209.i

sw.bb200.i:                                       ; preds = %cleanup.cont162.i
  %1882 = load i32, i32* %add.ptr173.i, align 4, !tbaa !7
  %xor201.i = xor i32 %1882, %1873
  br label %cleanup.cont209.i

sw.default203.i:                                  ; preds = %cleanup.cont162.i
  unreachable

cleanup.cont209.i:                                ; preds = %sw.bb200.i, %sw.bb192.i, %sw.bb184.i, %sw.bb182.i, %sw.bb178.i, %sw.bb176.i
  %xor201.i.sink = phi i32 [ %xor201.i, %sw.bb200.i ], [ %or199.i, %sw.bb192.i ], [ %or191.i, %sw.bb184.i ], [ %sub183.i, %sw.bb182.i ], [ %add181.i, %sw.bb178.i ], [ %mul177.i, %sw.bb176.i ]
  store i32 %xor201.i.sink, i32* %add.ptr173.i, align 4, !tbaa !7
  %1883 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 5, i32 1), align 1, !tbaa !17
  %idxprom215.i = zext i8 %1883 to i32
  %arrayidx216.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom215.i
  %1884 = load i32, i32* %arrayidx216.i, align 4, !tbaa !7
  %1885 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 5, i32 0), align 8, !tbaa !16
  %conv219.i = zext i8 %1885 to i32
  %add.ptr220.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv219.i
  %1886 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 5, i32 2), align 2, !tbaa !14
  switch i8 %1886, label %sw.default250.i [
    i8 0, label %sw.bb223.i
    i8 1, label %sw.bb225.i
    i8 2, label %sw.bb229.i
    i8 3, label %sw.bb231.i
    i8 4, label %sw.bb239.i
    i8 5, label %sw.bb247.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb223.i:                                       ; preds = %cleanup.cont209.i
  %1887 = load i32, i32* %add.ptr220.i, align 4, !tbaa !7
  %mul224.i = mul i32 %1887, %1884
  br label %cleanup.cont256.i

sw.bb225.i:                                       ; preds = %cleanup.cont209.i
  %1888 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 5, i32 3), align 4, !tbaa !18
  %add227.i = add i32 %1888, %1884
  %1889 = load i32, i32* %add.ptr220.i, align 4, !tbaa !7
  %add228.i = add i32 %add227.i, %1889
  br label %cleanup.cont256.i

sw.bb229.i:                                       ; preds = %cleanup.cont209.i
  %1890 = load i32, i32* %add.ptr220.i, align 4, !tbaa !7
  %sub230.i = sub i32 %1890, %1884
  br label %cleanup.cont256.i

sw.bb231.i:                                       ; preds = %cleanup.cont209.i
  %1891 = load i32, i32* %add.ptr220.i, align 4, !tbaa !7
  %or238.i = call i32 @llvm.fshr.i32(i32 %1891, i32 %1891, i32 %1884) #7
  br label %cleanup.cont256.i

sw.bb239.i:                                       ; preds = %cleanup.cont209.i
  %1892 = load i32, i32* %add.ptr220.i, align 4, !tbaa !7
  %or246.i = call i32 @llvm.fshl.i32(i32 %1892, i32 %1892, i32 %1884) #7
  br label %cleanup.cont256.i

sw.bb247.i:                                       ; preds = %cleanup.cont209.i
  %1893 = load i32, i32* %add.ptr220.i, align 4, !tbaa !7
  %xor248.i = xor i32 %1893, %1884
  br label %cleanup.cont256.i

sw.default250.i:                                  ; preds = %cleanup.cont209.i
  unreachable

cleanup.cont256.i:                                ; preds = %sw.bb247.i, %sw.bb239.i, %sw.bb231.i, %sw.bb229.i, %sw.bb225.i, %sw.bb223.i
  %xor248.i.sink = phi i32 [ %xor248.i, %sw.bb247.i ], [ %or246.i, %sw.bb239.i ], [ %or238.i, %sw.bb231.i ], [ %sub230.i, %sw.bb229.i ], [ %add228.i, %sw.bb225.i ], [ %mul224.i, %sw.bb223.i ]
  store i32 %xor248.i.sink, i32* %add.ptr220.i, align 4, !tbaa !7
  %1894 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 6, i32 1), align 1, !tbaa !17
  %idxprom262.i = zext i8 %1894 to i32
  %arrayidx263.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom262.i
  %1895 = load i32, i32* %arrayidx263.i, align 4, !tbaa !7
  %1896 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 6, i32 0), align 16, !tbaa !16
  %conv266.i = zext i8 %1896 to i32
  %add.ptr267.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv266.i
  %1897 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 6, i32 2), align 2, !tbaa !14
  switch i8 %1897, label %sw.default297.i [
    i8 0, label %sw.bb270.i
    i8 1, label %sw.bb272.i
    i8 2, label %sw.bb276.i
    i8 3, label %sw.bb278.i
    i8 4, label %sw.bb286.i
    i8 5, label %sw.bb294.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb270.i:                                       ; preds = %cleanup.cont256.i
  %1898 = load i32, i32* %add.ptr267.i, align 4, !tbaa !7
  %mul271.i = mul i32 %1898, %1895
  br label %cleanup.cont303.i

sw.bb272.i:                                       ; preds = %cleanup.cont256.i
  %1899 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 6, i32 3), align 4, !tbaa !18
  %add274.i = add i32 %1899, %1895
  %1900 = load i32, i32* %add.ptr267.i, align 4, !tbaa !7
  %add275.i = add i32 %add274.i, %1900
  br label %cleanup.cont303.i

sw.bb276.i:                                       ; preds = %cleanup.cont256.i
  %1901 = load i32, i32* %add.ptr267.i, align 4, !tbaa !7
  %sub277.i = sub i32 %1901, %1895
  br label %cleanup.cont303.i

sw.bb278.i:                                       ; preds = %cleanup.cont256.i
  %1902 = load i32, i32* %add.ptr267.i, align 4, !tbaa !7
  %or285.i = call i32 @llvm.fshr.i32(i32 %1902, i32 %1902, i32 %1895) #7
  br label %cleanup.cont303.i

sw.bb286.i:                                       ; preds = %cleanup.cont256.i
  %1903 = load i32, i32* %add.ptr267.i, align 4, !tbaa !7
  %or293.i = call i32 @llvm.fshl.i32(i32 %1903, i32 %1903, i32 %1895) #7
  br label %cleanup.cont303.i

sw.bb294.i:                                       ; preds = %cleanup.cont256.i
  %1904 = load i32, i32* %add.ptr267.i, align 4, !tbaa !7
  %xor295.i = xor i32 %1904, %1895
  br label %cleanup.cont303.i

sw.default297.i:                                  ; preds = %cleanup.cont256.i
  unreachable

cleanup.cont303.i:                                ; preds = %sw.bb294.i, %sw.bb286.i, %sw.bb278.i, %sw.bb276.i, %sw.bb272.i, %sw.bb270.i
  %xor295.i.sink = phi i32 [ %xor295.i, %sw.bb294.i ], [ %or293.i, %sw.bb286.i ], [ %or285.i, %sw.bb278.i ], [ %sub277.i, %sw.bb276.i ], [ %add275.i, %sw.bb272.i ], [ %mul271.i, %sw.bb270.i ]
  store i32 %xor295.i.sink, i32* %add.ptr267.i, align 4, !tbaa !7
  %1905 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 7, i32 1), align 1, !tbaa !17
  %idxprom309.i = zext i8 %1905 to i32
  %arrayidx310.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom309.i
  %1906 = load i32, i32* %arrayidx310.i, align 4, !tbaa !7
  %1907 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 7, i32 0), align 8, !tbaa !16
  %conv313.i = zext i8 %1907 to i32
  %add.ptr314.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv313.i
  %1908 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 7, i32 2), align 2, !tbaa !14
  switch i8 %1908, label %sw.default344.i [
    i8 0, label %sw.bb317.i
    i8 1, label %sw.bb319.i
    i8 2, label %sw.bb323.i
    i8 3, label %sw.bb325.i
    i8 4, label %sw.bb333.i
    i8 5, label %sw.bb341.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb317.i:                                       ; preds = %cleanup.cont303.i
  %1909 = load i32, i32* %add.ptr314.i, align 4, !tbaa !7
  %mul318.i = mul i32 %1909, %1906
  br label %cleanup.cont350.i

sw.bb319.i:                                       ; preds = %cleanup.cont303.i
  %1910 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 7, i32 3), align 4, !tbaa !18
  %add321.i = add i32 %1910, %1906
  %1911 = load i32, i32* %add.ptr314.i, align 4, !tbaa !7
  %add322.i = add i32 %add321.i, %1911
  br label %cleanup.cont350.i

sw.bb323.i:                                       ; preds = %cleanup.cont303.i
  %1912 = load i32, i32* %add.ptr314.i, align 4, !tbaa !7
  %sub324.i = sub i32 %1912, %1906
  br label %cleanup.cont350.i

sw.bb325.i:                                       ; preds = %cleanup.cont303.i
  %1913 = load i32, i32* %add.ptr314.i, align 4, !tbaa !7
  %or332.i = call i32 @llvm.fshr.i32(i32 %1913, i32 %1913, i32 %1906) #7
  br label %cleanup.cont350.i

sw.bb333.i:                                       ; preds = %cleanup.cont303.i
  %1914 = load i32, i32* %add.ptr314.i, align 4, !tbaa !7
  %or340.i = call i32 @llvm.fshl.i32(i32 %1914, i32 %1914, i32 %1906) #7
  br label %cleanup.cont350.i

sw.bb341.i:                                       ; preds = %cleanup.cont303.i
  %1915 = load i32, i32* %add.ptr314.i, align 4, !tbaa !7
  %xor342.i = xor i32 %1915, %1906
  br label %cleanup.cont350.i

sw.default344.i:                                  ; preds = %cleanup.cont303.i
  unreachable

cleanup.cont350.i:                                ; preds = %sw.bb341.i, %sw.bb333.i, %sw.bb325.i, %sw.bb323.i, %sw.bb319.i, %sw.bb317.i
  %xor342.i.sink = phi i32 [ %xor342.i, %sw.bb341.i ], [ %or340.i, %sw.bb333.i ], [ %or332.i, %sw.bb325.i ], [ %sub324.i, %sw.bb323.i ], [ %add322.i, %sw.bb319.i ], [ %mul318.i, %sw.bb317.i ]
  store i32 %xor342.i.sink, i32* %add.ptr314.i, align 4, !tbaa !7
  %1916 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 8, i32 1), align 1, !tbaa !17
  %idxprom356.i = zext i8 %1916 to i32
  %arrayidx357.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom356.i
  %1917 = load i32, i32* %arrayidx357.i, align 4, !tbaa !7
  %1918 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 8, i32 0), align 16, !tbaa !16
  %conv360.i = zext i8 %1918 to i32
  %add.ptr361.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv360.i
  %1919 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 8, i32 2), align 2, !tbaa !14
  switch i8 %1919, label %sw.default391.i [
    i8 0, label %sw.bb364.i
    i8 1, label %sw.bb366.i
    i8 2, label %sw.bb370.i
    i8 3, label %sw.bb372.i
    i8 4, label %sw.bb380.i
    i8 5, label %sw.bb388.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb364.i:                                       ; preds = %cleanup.cont350.i
  %1920 = load i32, i32* %add.ptr361.i, align 4, !tbaa !7
  %mul365.i = mul i32 %1920, %1917
  br label %cleanup.cont397.i

sw.bb366.i:                                       ; preds = %cleanup.cont350.i
  %1921 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 8, i32 3), align 4, !tbaa !18
  %add368.i = add i32 %1921, %1917
  %1922 = load i32, i32* %add.ptr361.i, align 4, !tbaa !7
  %add369.i = add i32 %add368.i, %1922
  br label %cleanup.cont397.i

sw.bb370.i:                                       ; preds = %cleanup.cont350.i
  %1923 = load i32, i32* %add.ptr361.i, align 4, !tbaa !7
  %sub371.i = sub i32 %1923, %1917
  br label %cleanup.cont397.i

sw.bb372.i:                                       ; preds = %cleanup.cont350.i
  %1924 = load i32, i32* %add.ptr361.i, align 4, !tbaa !7
  %or379.i = call i32 @llvm.fshr.i32(i32 %1924, i32 %1924, i32 %1917) #7
  br label %cleanup.cont397.i

sw.bb380.i:                                       ; preds = %cleanup.cont350.i
  %1925 = load i32, i32* %add.ptr361.i, align 4, !tbaa !7
  %or387.i = call i32 @llvm.fshl.i32(i32 %1925, i32 %1925, i32 %1917) #7
  br label %cleanup.cont397.i

sw.bb388.i:                                       ; preds = %cleanup.cont350.i
  %1926 = load i32, i32* %add.ptr361.i, align 4, !tbaa !7
  %xor389.i = xor i32 %1926, %1917
  br label %cleanup.cont397.i

sw.default391.i:                                  ; preds = %cleanup.cont350.i
  unreachable

cleanup.cont397.i:                                ; preds = %sw.bb388.i, %sw.bb380.i, %sw.bb372.i, %sw.bb370.i, %sw.bb366.i, %sw.bb364.i
  %xor389.i.sink = phi i32 [ %xor389.i, %sw.bb388.i ], [ %or387.i, %sw.bb380.i ], [ %or379.i, %sw.bb372.i ], [ %sub371.i, %sw.bb370.i ], [ %add369.i, %sw.bb366.i ], [ %mul365.i, %sw.bb364.i ]
  store i32 %xor389.i.sink, i32* %add.ptr361.i, align 4, !tbaa !7
  %1927 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 9, i32 1), align 1, !tbaa !17
  %idxprom403.i = zext i8 %1927 to i32
  %arrayidx404.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom403.i
  %1928 = load i32, i32* %arrayidx404.i, align 4, !tbaa !7
  %1929 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 9, i32 0), align 8, !tbaa !16
  %conv407.i = zext i8 %1929 to i32
  %add.ptr408.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv407.i
  %1930 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 9, i32 2), align 2, !tbaa !14
  switch i8 %1930, label %sw.default438.i [
    i8 0, label %sw.bb411.i
    i8 1, label %sw.bb413.i
    i8 2, label %sw.bb417.i
    i8 3, label %sw.bb419.i
    i8 4, label %sw.bb427.i
    i8 5, label %sw.bb435.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb411.i:                                       ; preds = %cleanup.cont397.i
  %1931 = load i32, i32* %add.ptr408.i, align 4, !tbaa !7
  %mul412.i = mul i32 %1931, %1928
  br label %cleanup.cont444.i

sw.bb413.i:                                       ; preds = %cleanup.cont397.i
  %1932 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 9, i32 3), align 4, !tbaa !18
  %add415.i = add i32 %1932, %1928
  %1933 = load i32, i32* %add.ptr408.i, align 4, !tbaa !7
  %add416.i = add i32 %add415.i, %1933
  br label %cleanup.cont444.i

sw.bb417.i:                                       ; preds = %cleanup.cont397.i
  %1934 = load i32, i32* %add.ptr408.i, align 4, !tbaa !7
  %sub418.i = sub i32 %1934, %1928
  br label %cleanup.cont444.i

sw.bb419.i:                                       ; preds = %cleanup.cont397.i
  %1935 = load i32, i32* %add.ptr408.i, align 4, !tbaa !7
  %or426.i = call i32 @llvm.fshr.i32(i32 %1935, i32 %1935, i32 %1928) #7
  br label %cleanup.cont444.i

sw.bb427.i:                                       ; preds = %cleanup.cont397.i
  %1936 = load i32, i32* %add.ptr408.i, align 4, !tbaa !7
  %or434.i = call i32 @llvm.fshl.i32(i32 %1936, i32 %1936, i32 %1928) #7
  br label %cleanup.cont444.i

sw.bb435.i:                                       ; preds = %cleanup.cont397.i
  %1937 = load i32, i32* %add.ptr408.i, align 4, !tbaa !7
  %xor436.i = xor i32 %1937, %1928
  br label %cleanup.cont444.i

sw.default438.i:                                  ; preds = %cleanup.cont397.i
  unreachable

cleanup.cont444.i:                                ; preds = %sw.bb435.i, %sw.bb427.i, %sw.bb419.i, %sw.bb417.i, %sw.bb413.i, %sw.bb411.i
  %xor436.i.sink = phi i32 [ %xor436.i, %sw.bb435.i ], [ %or434.i, %sw.bb427.i ], [ %or426.i, %sw.bb419.i ], [ %sub418.i, %sw.bb417.i ], [ %add416.i, %sw.bb413.i ], [ %mul412.i, %sw.bb411.i ]
  store i32 %xor436.i.sink, i32* %add.ptr408.i, align 4, !tbaa !7
  %1938 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 10, i32 1), align 1, !tbaa !17
  %idxprom450.i = zext i8 %1938 to i32
  %arrayidx451.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom450.i
  %1939 = load i32, i32* %arrayidx451.i, align 4, !tbaa !7
  %1940 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 10, i32 0), align 16, !tbaa !16
  %conv454.i = zext i8 %1940 to i32
  %add.ptr455.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv454.i
  %1941 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 10, i32 2), align 2, !tbaa !14
  switch i8 %1941, label %sw.default485.i [
    i8 0, label %sw.bb458.i
    i8 1, label %sw.bb460.i
    i8 2, label %sw.bb464.i
    i8 3, label %sw.bb466.i
    i8 4, label %sw.bb474.i
    i8 5, label %sw.bb482.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb458.i:                                       ; preds = %cleanup.cont444.i
  %1942 = load i32, i32* %add.ptr455.i, align 4, !tbaa !7
  %mul459.i = mul i32 %1942, %1939
  br label %cleanup.cont491.i

sw.bb460.i:                                       ; preds = %cleanup.cont444.i
  %1943 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 10, i32 3), align 4, !tbaa !18
  %add462.i = add i32 %1943, %1939
  %1944 = load i32, i32* %add.ptr455.i, align 4, !tbaa !7
  %add463.i = add i32 %add462.i, %1944
  br label %cleanup.cont491.i

sw.bb464.i:                                       ; preds = %cleanup.cont444.i
  %1945 = load i32, i32* %add.ptr455.i, align 4, !tbaa !7
  %sub465.i = sub i32 %1945, %1939
  br label %cleanup.cont491.i

sw.bb466.i:                                       ; preds = %cleanup.cont444.i
  %1946 = load i32, i32* %add.ptr455.i, align 4, !tbaa !7
  %or473.i = call i32 @llvm.fshr.i32(i32 %1946, i32 %1946, i32 %1939) #7
  br label %cleanup.cont491.i

sw.bb474.i:                                       ; preds = %cleanup.cont444.i
  %1947 = load i32, i32* %add.ptr455.i, align 4, !tbaa !7
  %or481.i = call i32 @llvm.fshl.i32(i32 %1947, i32 %1947, i32 %1939) #7
  br label %cleanup.cont491.i

sw.bb482.i:                                       ; preds = %cleanup.cont444.i
  %1948 = load i32, i32* %add.ptr455.i, align 4, !tbaa !7
  %xor483.i = xor i32 %1948, %1939
  br label %cleanup.cont491.i

sw.default485.i:                                  ; preds = %cleanup.cont444.i
  unreachable

cleanup.cont491.i:                                ; preds = %sw.bb482.i, %sw.bb474.i, %sw.bb466.i, %sw.bb464.i, %sw.bb460.i, %sw.bb458.i
  %xor483.i.sink = phi i32 [ %xor483.i, %sw.bb482.i ], [ %or481.i, %sw.bb474.i ], [ %or473.i, %sw.bb466.i ], [ %sub465.i, %sw.bb464.i ], [ %add463.i, %sw.bb460.i ], [ %mul459.i, %sw.bb458.i ]
  store i32 %xor483.i.sink, i32* %add.ptr455.i, align 4, !tbaa !7
  %1949 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 11, i32 1), align 1, !tbaa !17
  %idxprom497.i = zext i8 %1949 to i32
  %arrayidx498.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom497.i
  %1950 = load i32, i32* %arrayidx498.i, align 4, !tbaa !7
  %1951 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 11, i32 0), align 8, !tbaa !16
  %conv501.i = zext i8 %1951 to i32
  %add.ptr502.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv501.i
  %1952 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 11, i32 2), align 2, !tbaa !14
  switch i8 %1952, label %sw.default532.i [
    i8 0, label %sw.bb505.i
    i8 1, label %sw.bb507.i
    i8 2, label %sw.bb511.i
    i8 3, label %sw.bb513.i
    i8 4, label %sw.bb521.i
    i8 5, label %sw.bb529.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb505.i:                                       ; preds = %cleanup.cont491.i
  %1953 = load i32, i32* %add.ptr502.i, align 4, !tbaa !7
  %mul506.i = mul i32 %1953, %1950
  br label %cleanup.cont538.i

sw.bb507.i:                                       ; preds = %cleanup.cont491.i
  %1954 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 11, i32 3), align 4, !tbaa !18
  %add509.i = add i32 %1954, %1950
  %1955 = load i32, i32* %add.ptr502.i, align 4, !tbaa !7
  %add510.i = add i32 %add509.i, %1955
  br label %cleanup.cont538.i

sw.bb511.i:                                       ; preds = %cleanup.cont491.i
  %1956 = load i32, i32* %add.ptr502.i, align 4, !tbaa !7
  %sub512.i = sub i32 %1956, %1950
  br label %cleanup.cont538.i

sw.bb513.i:                                       ; preds = %cleanup.cont491.i
  %1957 = load i32, i32* %add.ptr502.i, align 4, !tbaa !7
  %or520.i = call i32 @llvm.fshr.i32(i32 %1957, i32 %1957, i32 %1950) #7
  br label %cleanup.cont538.i

sw.bb521.i:                                       ; preds = %cleanup.cont491.i
  %1958 = load i32, i32* %add.ptr502.i, align 4, !tbaa !7
  %or528.i = call i32 @llvm.fshl.i32(i32 %1958, i32 %1958, i32 %1950) #7
  br label %cleanup.cont538.i

sw.bb529.i:                                       ; preds = %cleanup.cont491.i
  %1959 = load i32, i32* %add.ptr502.i, align 4, !tbaa !7
  %xor530.i = xor i32 %1959, %1950
  br label %cleanup.cont538.i

sw.default532.i:                                  ; preds = %cleanup.cont491.i
  unreachable

cleanup.cont538.i:                                ; preds = %sw.bb529.i, %sw.bb521.i, %sw.bb513.i, %sw.bb511.i, %sw.bb507.i, %sw.bb505.i
  %xor530.i.sink = phi i32 [ %xor530.i, %sw.bb529.i ], [ %or528.i, %sw.bb521.i ], [ %or520.i, %sw.bb513.i ], [ %sub512.i, %sw.bb511.i ], [ %add510.i, %sw.bb507.i ], [ %mul506.i, %sw.bb505.i ]
  store i32 %xor530.i.sink, i32* %add.ptr502.i, align 4, !tbaa !7
  %1960 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 12, i32 1), align 1, !tbaa !17
  %idxprom544.i = zext i8 %1960 to i32
  %arrayidx545.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom544.i
  %1961 = load i32, i32* %arrayidx545.i, align 4, !tbaa !7
  %1962 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 12, i32 0), align 16, !tbaa !16
  %conv548.i = zext i8 %1962 to i32
  %add.ptr549.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv548.i
  %1963 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 12, i32 2), align 2, !tbaa !14
  switch i8 %1963, label %sw.default579.i [
    i8 0, label %sw.bb552.i
    i8 1, label %sw.bb554.i
    i8 2, label %sw.bb558.i
    i8 3, label %sw.bb560.i
    i8 4, label %sw.bb568.i
    i8 5, label %sw.bb576.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb552.i:                                       ; preds = %cleanup.cont538.i
  %1964 = load i32, i32* %add.ptr549.i, align 4, !tbaa !7
  %mul553.i = mul i32 %1964, %1961
  br label %cleanup.cont585.i

sw.bb554.i:                                       ; preds = %cleanup.cont538.i
  %1965 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 12, i32 3), align 4, !tbaa !18
  %add556.i = add i32 %1965, %1961
  %1966 = load i32, i32* %add.ptr549.i, align 4, !tbaa !7
  %add557.i = add i32 %add556.i, %1966
  br label %cleanup.cont585.i

sw.bb558.i:                                       ; preds = %cleanup.cont538.i
  %1967 = load i32, i32* %add.ptr549.i, align 4, !tbaa !7
  %sub559.i = sub i32 %1967, %1961
  br label %cleanup.cont585.i

sw.bb560.i:                                       ; preds = %cleanup.cont538.i
  %1968 = load i32, i32* %add.ptr549.i, align 4, !tbaa !7
  %or567.i = call i32 @llvm.fshr.i32(i32 %1968, i32 %1968, i32 %1961) #7
  br label %cleanup.cont585.i

sw.bb568.i:                                       ; preds = %cleanup.cont538.i
  %1969 = load i32, i32* %add.ptr549.i, align 4, !tbaa !7
  %or575.i = call i32 @llvm.fshl.i32(i32 %1969, i32 %1969, i32 %1961) #7
  br label %cleanup.cont585.i

sw.bb576.i:                                       ; preds = %cleanup.cont538.i
  %1970 = load i32, i32* %add.ptr549.i, align 4, !tbaa !7
  %xor577.i = xor i32 %1970, %1961
  br label %cleanup.cont585.i

sw.default579.i:                                  ; preds = %cleanup.cont538.i
  unreachable

cleanup.cont585.i:                                ; preds = %sw.bb576.i, %sw.bb568.i, %sw.bb560.i, %sw.bb558.i, %sw.bb554.i, %sw.bb552.i
  %xor577.i.sink = phi i32 [ %xor577.i, %sw.bb576.i ], [ %or575.i, %sw.bb568.i ], [ %or567.i, %sw.bb560.i ], [ %sub559.i, %sw.bb558.i ], [ %add557.i, %sw.bb554.i ], [ %mul553.i, %sw.bb552.i ]
  store i32 %xor577.i.sink, i32* %add.ptr549.i, align 4, !tbaa !7
  %1971 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 13, i32 1), align 1, !tbaa !17
  %idxprom591.i = zext i8 %1971 to i32
  %arrayidx592.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom591.i
  %1972 = load i32, i32* %arrayidx592.i, align 4, !tbaa !7
  %1973 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 13, i32 0), align 8, !tbaa !16
  %conv595.i = zext i8 %1973 to i32
  %add.ptr596.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv595.i
  %1974 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 13, i32 2), align 2, !tbaa !14
  switch i8 %1974, label %sw.default626.i [
    i8 0, label %sw.bb599.i
    i8 1, label %sw.bb601.i
    i8 2, label %sw.bb605.i
    i8 3, label %sw.bb607.i
    i8 4, label %sw.bb615.i
    i8 5, label %sw.bb623.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb599.i:                                       ; preds = %cleanup.cont585.i
  %1975 = load i32, i32* %add.ptr596.i, align 4, !tbaa !7
  %mul600.i = mul i32 %1975, %1972
  br label %cleanup.cont632.i

sw.bb601.i:                                       ; preds = %cleanup.cont585.i
  %1976 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 13, i32 3), align 4, !tbaa !18
  %add603.i = add i32 %1976, %1972
  %1977 = load i32, i32* %add.ptr596.i, align 4, !tbaa !7
  %add604.i = add i32 %add603.i, %1977
  br label %cleanup.cont632.i

sw.bb605.i:                                       ; preds = %cleanup.cont585.i
  %1978 = load i32, i32* %add.ptr596.i, align 4, !tbaa !7
  %sub606.i = sub i32 %1978, %1972
  br label %cleanup.cont632.i

sw.bb607.i:                                       ; preds = %cleanup.cont585.i
  %1979 = load i32, i32* %add.ptr596.i, align 4, !tbaa !7
  %or614.i = call i32 @llvm.fshr.i32(i32 %1979, i32 %1979, i32 %1972) #7
  br label %cleanup.cont632.i

sw.bb615.i:                                       ; preds = %cleanup.cont585.i
  %1980 = load i32, i32* %add.ptr596.i, align 4, !tbaa !7
  %or622.i = call i32 @llvm.fshl.i32(i32 %1980, i32 %1980, i32 %1972) #7
  br label %cleanup.cont632.i

sw.bb623.i:                                       ; preds = %cleanup.cont585.i
  %1981 = load i32, i32* %add.ptr596.i, align 4, !tbaa !7
  %xor624.i = xor i32 %1981, %1972
  br label %cleanup.cont632.i

sw.default626.i:                                  ; preds = %cleanup.cont585.i
  unreachable

cleanup.cont632.i:                                ; preds = %sw.bb623.i, %sw.bb615.i, %sw.bb607.i, %sw.bb605.i, %sw.bb601.i, %sw.bb599.i
  %xor624.i.sink = phi i32 [ %xor624.i, %sw.bb623.i ], [ %or622.i, %sw.bb615.i ], [ %or614.i, %sw.bb607.i ], [ %sub606.i, %sw.bb605.i ], [ %add604.i, %sw.bb601.i ], [ %mul600.i, %sw.bb599.i ]
  store i32 %xor624.i.sink, i32* %add.ptr596.i, align 4, !tbaa !7
  %1982 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 14, i32 1), align 1, !tbaa !17
  %idxprom638.i = zext i8 %1982 to i32
  %arrayidx639.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom638.i
  %1983 = load i32, i32* %arrayidx639.i, align 4, !tbaa !7
  %1984 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 14, i32 0), align 16, !tbaa !16
  %conv642.i = zext i8 %1984 to i32
  %add.ptr643.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv642.i
  %1985 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 14, i32 2), align 2, !tbaa !14
  switch i8 %1985, label %sw.default673.i [
    i8 0, label %sw.bb646.i
    i8 1, label %sw.bb648.i
    i8 2, label %sw.bb652.i
    i8 3, label %sw.bb654.i
    i8 4, label %sw.bb662.i
    i8 5, label %sw.bb670.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb646.i:                                       ; preds = %cleanup.cont632.i
  %1986 = load i32, i32* %add.ptr643.i, align 4, !tbaa !7
  %mul647.i = mul i32 %1986, %1983
  br label %cleanup.cont679.i

sw.bb648.i:                                       ; preds = %cleanup.cont632.i
  %1987 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 14, i32 3), align 4, !tbaa !18
  %add650.i = add i32 %1987, %1983
  %1988 = load i32, i32* %add.ptr643.i, align 4, !tbaa !7
  %add651.i = add i32 %add650.i, %1988
  br label %cleanup.cont679.i

sw.bb652.i:                                       ; preds = %cleanup.cont632.i
  %1989 = load i32, i32* %add.ptr643.i, align 4, !tbaa !7
  %sub653.i = sub i32 %1989, %1983
  br label %cleanup.cont679.i

sw.bb654.i:                                       ; preds = %cleanup.cont632.i
  %1990 = load i32, i32* %add.ptr643.i, align 4, !tbaa !7
  %or661.i = call i32 @llvm.fshr.i32(i32 %1990, i32 %1990, i32 %1983) #7
  br label %cleanup.cont679.i

sw.bb662.i:                                       ; preds = %cleanup.cont632.i
  %1991 = load i32, i32* %add.ptr643.i, align 4, !tbaa !7
  %or669.i = call i32 @llvm.fshl.i32(i32 %1991, i32 %1991, i32 %1983) #7
  br label %cleanup.cont679.i

sw.bb670.i:                                       ; preds = %cleanup.cont632.i
  %1992 = load i32, i32* %add.ptr643.i, align 4, !tbaa !7
  %xor671.i = xor i32 %1992, %1983
  br label %cleanup.cont679.i

sw.default673.i:                                  ; preds = %cleanup.cont632.i
  unreachable

cleanup.cont679.i:                                ; preds = %sw.bb670.i, %sw.bb662.i, %sw.bb654.i, %sw.bb652.i, %sw.bb648.i, %sw.bb646.i
  %xor671.i.sink = phi i32 [ %xor671.i, %sw.bb670.i ], [ %or669.i, %sw.bb662.i ], [ %or661.i, %sw.bb654.i ], [ %sub653.i, %sw.bb652.i ], [ %add651.i, %sw.bb648.i ], [ %mul647.i, %sw.bb646.i ]
  store i32 %xor671.i.sink, i32* %add.ptr643.i, align 4, !tbaa !7
  %1993 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 15, i32 1), align 1, !tbaa !17
  %idxprom685.i = zext i8 %1993 to i32
  %arrayidx686.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom685.i
  %1994 = load i32, i32* %arrayidx686.i, align 4, !tbaa !7
  %1995 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 15, i32 0), align 8, !tbaa !16
  %conv689.i = zext i8 %1995 to i32
  %add.ptr690.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv689.i
  %1996 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 15, i32 2), align 2, !tbaa !14
  switch i8 %1996, label %sw.default720.i [
    i8 0, label %sw.bb693.i
    i8 1, label %sw.bb695.i
    i8 2, label %sw.bb699.i
    i8 3, label %sw.bb701.i
    i8 4, label %sw.bb709.i
    i8 5, label %sw.bb717.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb693.i:                                       ; preds = %cleanup.cont679.i
  %1997 = load i32, i32* %add.ptr690.i, align 4, !tbaa !7
  %mul694.i = mul i32 %1997, %1994
  br label %cleanup.cont726.i

sw.bb695.i:                                       ; preds = %cleanup.cont679.i
  %1998 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 15, i32 3), align 4, !tbaa !18
  %add697.i = add i32 %1998, %1994
  %1999 = load i32, i32* %add.ptr690.i, align 4, !tbaa !7
  %add698.i = add i32 %add697.i, %1999
  br label %cleanup.cont726.i

sw.bb699.i:                                       ; preds = %cleanup.cont679.i
  %2000 = load i32, i32* %add.ptr690.i, align 4, !tbaa !7
  %sub700.i = sub i32 %2000, %1994
  br label %cleanup.cont726.i

sw.bb701.i:                                       ; preds = %cleanup.cont679.i
  %2001 = load i32, i32* %add.ptr690.i, align 4, !tbaa !7
  %or708.i = call i32 @llvm.fshr.i32(i32 %2001, i32 %2001, i32 %1994) #7
  br label %cleanup.cont726.i

sw.bb709.i:                                       ; preds = %cleanup.cont679.i
  %2002 = load i32, i32* %add.ptr690.i, align 4, !tbaa !7
  %or716.i = call i32 @llvm.fshl.i32(i32 %2002, i32 %2002, i32 %1994) #7
  br label %cleanup.cont726.i

sw.bb717.i:                                       ; preds = %cleanup.cont679.i
  %2003 = load i32, i32* %add.ptr690.i, align 4, !tbaa !7
  %xor718.i = xor i32 %2003, %1994
  br label %cleanup.cont726.i

sw.default720.i:                                  ; preds = %cleanup.cont679.i
  unreachable

cleanup.cont726.i:                                ; preds = %sw.bb717.i, %sw.bb709.i, %sw.bb701.i, %sw.bb699.i, %sw.bb695.i, %sw.bb693.i
  %xor718.i.sink = phi i32 [ %xor718.i, %sw.bb717.i ], [ %or716.i, %sw.bb709.i ], [ %or708.i, %sw.bb701.i ], [ %sub700.i, %sw.bb699.i ], [ %add698.i, %sw.bb695.i ], [ %mul694.i, %sw.bb693.i ]
  store i32 %xor718.i.sink, i32* %add.ptr690.i, align 4, !tbaa !7
  %2004 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 16, i32 1), align 1, !tbaa !17
  %idxprom732.i = zext i8 %2004 to i32
  %arrayidx733.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom732.i
  %2005 = load i32, i32* %arrayidx733.i, align 4, !tbaa !7
  %2006 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 16, i32 0), align 16, !tbaa !16
  %conv736.i = zext i8 %2006 to i32
  %add.ptr737.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv736.i
  %2007 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 16, i32 2), align 2, !tbaa !14
  switch i8 %2007, label %sw.default767.i [
    i8 0, label %sw.bb740.i
    i8 1, label %sw.bb742.i
    i8 2, label %sw.bb746.i
    i8 3, label %sw.bb748.i
    i8 4, label %sw.bb756.i
    i8 5, label %sw.bb764.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb740.i:                                       ; preds = %cleanup.cont726.i
  %2008 = load i32, i32* %add.ptr737.i, align 4, !tbaa !7
  %mul741.i = mul i32 %2008, %2005
  br label %cleanup.cont773.i

sw.bb742.i:                                       ; preds = %cleanup.cont726.i
  %2009 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 16, i32 3), align 4, !tbaa !18
  %add744.i = add i32 %2009, %2005
  %2010 = load i32, i32* %add.ptr737.i, align 4, !tbaa !7
  %add745.i = add i32 %add744.i, %2010
  br label %cleanup.cont773.i

sw.bb746.i:                                       ; preds = %cleanup.cont726.i
  %2011 = load i32, i32* %add.ptr737.i, align 4, !tbaa !7
  %sub747.i = sub i32 %2011, %2005
  br label %cleanup.cont773.i

sw.bb748.i:                                       ; preds = %cleanup.cont726.i
  %2012 = load i32, i32* %add.ptr737.i, align 4, !tbaa !7
  %or755.i = call i32 @llvm.fshr.i32(i32 %2012, i32 %2012, i32 %2005) #7
  br label %cleanup.cont773.i

sw.bb756.i:                                       ; preds = %cleanup.cont726.i
  %2013 = load i32, i32* %add.ptr737.i, align 4, !tbaa !7
  %or763.i = call i32 @llvm.fshl.i32(i32 %2013, i32 %2013, i32 %2005) #7
  br label %cleanup.cont773.i

sw.bb764.i:                                       ; preds = %cleanup.cont726.i
  %2014 = load i32, i32* %add.ptr737.i, align 4, !tbaa !7
  %xor765.i = xor i32 %2014, %2005
  br label %cleanup.cont773.i

sw.default767.i:                                  ; preds = %cleanup.cont726.i
  unreachable

cleanup.cont773.i:                                ; preds = %sw.bb764.i, %sw.bb756.i, %sw.bb748.i, %sw.bb746.i, %sw.bb742.i, %sw.bb740.i
  %xor765.i.sink = phi i32 [ %xor765.i, %sw.bb764.i ], [ %or763.i, %sw.bb756.i ], [ %or755.i, %sw.bb748.i ], [ %sub747.i, %sw.bb746.i ], [ %add745.i, %sw.bb742.i ], [ %mul741.i, %sw.bb740.i ]
  store i32 %xor765.i.sink, i32* %add.ptr737.i, align 4, !tbaa !7
  %2015 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 17, i32 1), align 1, !tbaa !17
  %idxprom779.i = zext i8 %2015 to i32
  %arrayidx780.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom779.i
  %2016 = load i32, i32* %arrayidx780.i, align 4, !tbaa !7
  %2017 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 17, i32 0), align 8, !tbaa !16
  %conv783.i = zext i8 %2017 to i32
  %add.ptr784.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv783.i
  %2018 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 17, i32 2), align 2, !tbaa !14
  switch i8 %2018, label %sw.default814.i [
    i8 0, label %sw.bb787.i
    i8 1, label %sw.bb789.i
    i8 2, label %sw.bb793.i
    i8 3, label %sw.bb795.i
    i8 4, label %sw.bb803.i
    i8 5, label %sw.bb811.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb787.i:                                       ; preds = %cleanup.cont773.i
  %2019 = load i32, i32* %add.ptr784.i, align 4, !tbaa !7
  %mul788.i = mul i32 %2019, %2016
  br label %cleanup.cont820.i

sw.bb789.i:                                       ; preds = %cleanup.cont773.i
  %2020 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 17, i32 3), align 4, !tbaa !18
  %add791.i = add i32 %2020, %2016
  %2021 = load i32, i32* %add.ptr784.i, align 4, !tbaa !7
  %add792.i = add i32 %add791.i, %2021
  br label %cleanup.cont820.i

sw.bb793.i:                                       ; preds = %cleanup.cont773.i
  %2022 = load i32, i32* %add.ptr784.i, align 4, !tbaa !7
  %sub794.i = sub i32 %2022, %2016
  br label %cleanup.cont820.i

sw.bb795.i:                                       ; preds = %cleanup.cont773.i
  %2023 = load i32, i32* %add.ptr784.i, align 4, !tbaa !7
  %or802.i = call i32 @llvm.fshr.i32(i32 %2023, i32 %2023, i32 %2016) #7
  br label %cleanup.cont820.i

sw.bb803.i:                                       ; preds = %cleanup.cont773.i
  %2024 = load i32, i32* %add.ptr784.i, align 4, !tbaa !7
  %or810.i = call i32 @llvm.fshl.i32(i32 %2024, i32 %2024, i32 %2016) #7
  br label %cleanup.cont820.i

sw.bb811.i:                                       ; preds = %cleanup.cont773.i
  %2025 = load i32, i32* %add.ptr784.i, align 4, !tbaa !7
  %xor812.i = xor i32 %2025, %2016
  br label %cleanup.cont820.i

sw.default814.i:                                  ; preds = %cleanup.cont773.i
  unreachable

cleanup.cont820.i:                                ; preds = %sw.bb811.i, %sw.bb803.i, %sw.bb795.i, %sw.bb793.i, %sw.bb789.i, %sw.bb787.i
  %xor812.i.sink = phi i32 [ %xor812.i, %sw.bb811.i ], [ %or810.i, %sw.bb803.i ], [ %or802.i, %sw.bb795.i ], [ %sub794.i, %sw.bb793.i ], [ %add792.i, %sw.bb789.i ], [ %mul788.i, %sw.bb787.i ]
  store i32 %xor812.i.sink, i32* %add.ptr784.i, align 4, !tbaa !7
  %2026 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 18, i32 1), align 1, !tbaa !17
  %idxprom826.i = zext i8 %2026 to i32
  %arrayidx827.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom826.i
  %2027 = load i32, i32* %arrayidx827.i, align 4, !tbaa !7
  %2028 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 18, i32 0), align 16, !tbaa !16
  %conv830.i = zext i8 %2028 to i32
  %add.ptr831.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv830.i
  %2029 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 18, i32 2), align 2, !tbaa !14
  switch i8 %2029, label %sw.default861.i [
    i8 0, label %sw.bb834.i
    i8 1, label %sw.bb836.i
    i8 2, label %sw.bb840.i
    i8 3, label %sw.bb842.i
    i8 4, label %sw.bb850.i
    i8 5, label %sw.bb858.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb834.i:                                       ; preds = %cleanup.cont820.i
  %2030 = load i32, i32* %add.ptr831.i, align 4, !tbaa !7
  %mul835.i = mul i32 %2030, %2027
  br label %cleanup.cont867.i

sw.bb836.i:                                       ; preds = %cleanup.cont820.i
  %2031 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 18, i32 3), align 4, !tbaa !18
  %add838.i = add i32 %2031, %2027
  %2032 = load i32, i32* %add.ptr831.i, align 4, !tbaa !7
  %add839.i = add i32 %add838.i, %2032
  br label %cleanup.cont867.i

sw.bb840.i:                                       ; preds = %cleanup.cont820.i
  %2033 = load i32, i32* %add.ptr831.i, align 4, !tbaa !7
  %sub841.i = sub i32 %2033, %2027
  br label %cleanup.cont867.i

sw.bb842.i:                                       ; preds = %cleanup.cont820.i
  %2034 = load i32, i32* %add.ptr831.i, align 4, !tbaa !7
  %or849.i = call i32 @llvm.fshr.i32(i32 %2034, i32 %2034, i32 %2027) #7
  br label %cleanup.cont867.i

sw.bb850.i:                                       ; preds = %cleanup.cont820.i
  %2035 = load i32, i32* %add.ptr831.i, align 4, !tbaa !7
  %or857.i = call i32 @llvm.fshl.i32(i32 %2035, i32 %2035, i32 %2027) #7
  br label %cleanup.cont867.i

sw.bb858.i:                                       ; preds = %cleanup.cont820.i
  %2036 = load i32, i32* %add.ptr831.i, align 4, !tbaa !7
  %xor859.i = xor i32 %2036, %2027
  br label %cleanup.cont867.i

sw.default861.i:                                  ; preds = %cleanup.cont820.i
  unreachable

cleanup.cont867.i:                                ; preds = %sw.bb858.i, %sw.bb850.i, %sw.bb842.i, %sw.bb840.i, %sw.bb836.i, %sw.bb834.i
  %xor859.i.sink = phi i32 [ %xor859.i, %sw.bb858.i ], [ %or857.i, %sw.bb850.i ], [ %or849.i, %sw.bb842.i ], [ %sub841.i, %sw.bb840.i ], [ %add839.i, %sw.bb836.i ], [ %mul835.i, %sw.bb834.i ]
  store i32 %xor859.i.sink, i32* %add.ptr831.i, align 4, !tbaa !7
  %2037 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 19, i32 1), align 1, !tbaa !17
  %idxprom873.i = zext i8 %2037 to i32
  %arrayidx874.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom873.i
  %2038 = load i32, i32* %arrayidx874.i, align 4, !tbaa !7
  %2039 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 19, i32 0), align 8, !tbaa !16
  %conv877.i = zext i8 %2039 to i32
  %add.ptr878.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv877.i
  %2040 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 19, i32 2), align 2, !tbaa !14
  switch i8 %2040, label %sw.default908.i [
    i8 0, label %sw.bb881.i
    i8 1, label %sw.bb883.i
    i8 2, label %sw.bb887.i
    i8 3, label %sw.bb889.i
    i8 4, label %sw.bb897.i
    i8 5, label %sw.bb905.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb881.i:                                       ; preds = %cleanup.cont867.i
  %2041 = load i32, i32* %add.ptr878.i, align 4, !tbaa !7
  %mul882.i = mul i32 %2041, %2038
  br label %cleanup.cont914.i

sw.bb883.i:                                       ; preds = %cleanup.cont867.i
  %2042 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 19, i32 3), align 4, !tbaa !18
  %add885.i = add i32 %2042, %2038
  %2043 = load i32, i32* %add.ptr878.i, align 4, !tbaa !7
  %add886.i = add i32 %add885.i, %2043
  br label %cleanup.cont914.i

sw.bb887.i:                                       ; preds = %cleanup.cont867.i
  %2044 = load i32, i32* %add.ptr878.i, align 4, !tbaa !7
  %sub888.i = sub i32 %2044, %2038
  br label %cleanup.cont914.i

sw.bb889.i:                                       ; preds = %cleanup.cont867.i
  %2045 = load i32, i32* %add.ptr878.i, align 4, !tbaa !7
  %or896.i = call i32 @llvm.fshr.i32(i32 %2045, i32 %2045, i32 %2038) #7
  br label %cleanup.cont914.i

sw.bb897.i:                                       ; preds = %cleanup.cont867.i
  %2046 = load i32, i32* %add.ptr878.i, align 4, !tbaa !7
  %or904.i = call i32 @llvm.fshl.i32(i32 %2046, i32 %2046, i32 %2038) #7
  br label %cleanup.cont914.i

sw.bb905.i:                                       ; preds = %cleanup.cont867.i
  %2047 = load i32, i32* %add.ptr878.i, align 4, !tbaa !7
  %xor906.i = xor i32 %2047, %2038
  br label %cleanup.cont914.i

sw.default908.i:                                  ; preds = %cleanup.cont867.i
  unreachable

cleanup.cont914.i:                                ; preds = %sw.bb905.i, %sw.bb897.i, %sw.bb889.i, %sw.bb887.i, %sw.bb883.i, %sw.bb881.i
  %xor906.i.sink = phi i32 [ %xor906.i, %sw.bb905.i ], [ %or904.i, %sw.bb897.i ], [ %or896.i, %sw.bb889.i ], [ %sub888.i, %sw.bb887.i ], [ %add886.i, %sw.bb883.i ], [ %mul882.i, %sw.bb881.i ]
  store i32 %xor906.i.sink, i32* %add.ptr878.i, align 4, !tbaa !7
  %2048 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 20, i32 1), align 1, !tbaa !17
  %idxprom920.i = zext i8 %2048 to i32
  %arrayidx921.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom920.i
  %2049 = load i32, i32* %arrayidx921.i, align 4, !tbaa !7
  %2050 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 20, i32 0), align 16, !tbaa !16
  %conv924.i = zext i8 %2050 to i32
  %add.ptr925.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv924.i
  %2051 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 20, i32 2), align 2, !tbaa !14
  switch i8 %2051, label %sw.default955.i [
    i8 0, label %sw.bb928.i
    i8 1, label %sw.bb930.i
    i8 2, label %sw.bb934.i
    i8 3, label %sw.bb936.i
    i8 4, label %sw.bb944.i
    i8 5, label %sw.bb952.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb928.i:                                       ; preds = %cleanup.cont914.i
  %2052 = load i32, i32* %add.ptr925.i, align 4, !tbaa !7
  %mul929.i = mul i32 %2052, %2049
  br label %cleanup.cont961.i

sw.bb930.i:                                       ; preds = %cleanup.cont914.i
  %2053 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 20, i32 3), align 4, !tbaa !18
  %add932.i = add i32 %2053, %2049
  %2054 = load i32, i32* %add.ptr925.i, align 4, !tbaa !7
  %add933.i = add i32 %add932.i, %2054
  br label %cleanup.cont961.i

sw.bb934.i:                                       ; preds = %cleanup.cont914.i
  %2055 = load i32, i32* %add.ptr925.i, align 4, !tbaa !7
  %sub935.i = sub i32 %2055, %2049
  br label %cleanup.cont961.i

sw.bb936.i:                                       ; preds = %cleanup.cont914.i
  %2056 = load i32, i32* %add.ptr925.i, align 4, !tbaa !7
  %or943.i = call i32 @llvm.fshr.i32(i32 %2056, i32 %2056, i32 %2049) #7
  br label %cleanup.cont961.i

sw.bb944.i:                                       ; preds = %cleanup.cont914.i
  %2057 = load i32, i32* %add.ptr925.i, align 4, !tbaa !7
  %or951.i = call i32 @llvm.fshl.i32(i32 %2057, i32 %2057, i32 %2049) #7
  br label %cleanup.cont961.i

sw.bb952.i:                                       ; preds = %cleanup.cont914.i
  %2058 = load i32, i32* %add.ptr925.i, align 4, !tbaa !7
  %xor953.i = xor i32 %2058, %2049
  br label %cleanup.cont961.i

sw.default955.i:                                  ; preds = %cleanup.cont914.i
  unreachable

cleanup.cont961.i:                                ; preds = %sw.bb952.i, %sw.bb944.i, %sw.bb936.i, %sw.bb934.i, %sw.bb930.i, %sw.bb928.i
  %xor953.i.sink = phi i32 [ %xor953.i, %sw.bb952.i ], [ %or951.i, %sw.bb944.i ], [ %or943.i, %sw.bb936.i ], [ %sub935.i, %sw.bb934.i ], [ %add933.i, %sw.bb930.i ], [ %mul929.i, %sw.bb928.i ]
  store i32 %xor953.i.sink, i32* %add.ptr925.i, align 4, !tbaa !7
  %2059 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 21, i32 1), align 1, !tbaa !17
  %idxprom967.i = zext i8 %2059 to i32
  %arrayidx968.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom967.i
  %2060 = load i32, i32* %arrayidx968.i, align 4, !tbaa !7
  %2061 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 21, i32 0), align 8, !tbaa !16
  %conv971.i = zext i8 %2061 to i32
  %add.ptr972.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv971.i
  %2062 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 21, i32 2), align 2, !tbaa !14
  switch i8 %2062, label %sw.default1002.i [
    i8 0, label %sw.bb975.i
    i8 1, label %sw.bb977.i
    i8 2, label %sw.bb981.i
    i8 3, label %sw.bb983.i
    i8 4, label %sw.bb991.i
    i8 5, label %sw.bb999.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb975.i:                                       ; preds = %cleanup.cont961.i
  %2063 = load i32, i32* %add.ptr972.i, align 4, !tbaa !7
  %mul976.i = mul i32 %2063, %2060
  br label %cleanup.cont1008.i

sw.bb977.i:                                       ; preds = %cleanup.cont961.i
  %2064 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 21, i32 3), align 4, !tbaa !18
  %add979.i = add i32 %2064, %2060
  %2065 = load i32, i32* %add.ptr972.i, align 4, !tbaa !7
  %add980.i = add i32 %add979.i, %2065
  br label %cleanup.cont1008.i

sw.bb981.i:                                       ; preds = %cleanup.cont961.i
  %2066 = load i32, i32* %add.ptr972.i, align 4, !tbaa !7
  %sub982.i = sub i32 %2066, %2060
  br label %cleanup.cont1008.i

sw.bb983.i:                                       ; preds = %cleanup.cont961.i
  %2067 = load i32, i32* %add.ptr972.i, align 4, !tbaa !7
  %or990.i = call i32 @llvm.fshr.i32(i32 %2067, i32 %2067, i32 %2060) #7
  br label %cleanup.cont1008.i

sw.bb991.i:                                       ; preds = %cleanup.cont961.i
  %2068 = load i32, i32* %add.ptr972.i, align 4, !tbaa !7
  %or998.i = call i32 @llvm.fshl.i32(i32 %2068, i32 %2068, i32 %2060) #7
  br label %cleanup.cont1008.i

sw.bb999.i:                                       ; preds = %cleanup.cont961.i
  %2069 = load i32, i32* %add.ptr972.i, align 4, !tbaa !7
  %xor1000.i = xor i32 %2069, %2060
  br label %cleanup.cont1008.i

sw.default1002.i:                                 ; preds = %cleanup.cont961.i
  unreachable

cleanup.cont1008.i:                               ; preds = %sw.bb999.i, %sw.bb991.i, %sw.bb983.i, %sw.bb981.i, %sw.bb977.i, %sw.bb975.i
  %xor1000.i.sink = phi i32 [ %xor1000.i, %sw.bb999.i ], [ %or998.i, %sw.bb991.i ], [ %or990.i, %sw.bb983.i ], [ %sub982.i, %sw.bb981.i ], [ %add980.i, %sw.bb977.i ], [ %mul976.i, %sw.bb975.i ]
  store i32 %xor1000.i.sink, i32* %add.ptr972.i, align 4, !tbaa !7
  %2070 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 22, i32 1), align 1, !tbaa !17
  %idxprom1014.i = zext i8 %2070 to i32
  %arrayidx1015.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1014.i
  %2071 = load i32, i32* %arrayidx1015.i, align 4, !tbaa !7
  %2072 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 22, i32 0), align 16, !tbaa !16
  %conv1018.i = zext i8 %2072 to i32
  %add.ptr1019.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1018.i
  %2073 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 22, i32 2), align 2, !tbaa !14
  switch i8 %2073, label %sw.default1049.i [
    i8 0, label %sw.bb1022.i
    i8 1, label %sw.bb1024.i
    i8 2, label %sw.bb1028.i
    i8 3, label %sw.bb1030.i
    i8 4, label %sw.bb1038.i
    i8 5, label %sw.bb1046.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1022.i:                                      ; preds = %cleanup.cont1008.i
  %2074 = load i32, i32* %add.ptr1019.i, align 4, !tbaa !7
  %mul1023.i = mul i32 %2074, %2071
  br label %cleanup.cont1055.i

sw.bb1024.i:                                      ; preds = %cleanup.cont1008.i
  %2075 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 22, i32 3), align 4, !tbaa !18
  %add1026.i = add i32 %2075, %2071
  %2076 = load i32, i32* %add.ptr1019.i, align 4, !tbaa !7
  %add1027.i = add i32 %add1026.i, %2076
  br label %cleanup.cont1055.i

sw.bb1028.i:                                      ; preds = %cleanup.cont1008.i
  %2077 = load i32, i32* %add.ptr1019.i, align 4, !tbaa !7
  %sub1029.i = sub i32 %2077, %2071
  br label %cleanup.cont1055.i

sw.bb1030.i:                                      ; preds = %cleanup.cont1008.i
  %2078 = load i32, i32* %add.ptr1019.i, align 4, !tbaa !7
  %or1037.i = call i32 @llvm.fshr.i32(i32 %2078, i32 %2078, i32 %2071) #7
  br label %cleanup.cont1055.i

sw.bb1038.i:                                      ; preds = %cleanup.cont1008.i
  %2079 = load i32, i32* %add.ptr1019.i, align 4, !tbaa !7
  %or1045.i = call i32 @llvm.fshl.i32(i32 %2079, i32 %2079, i32 %2071) #7
  br label %cleanup.cont1055.i

sw.bb1046.i:                                      ; preds = %cleanup.cont1008.i
  %2080 = load i32, i32* %add.ptr1019.i, align 4, !tbaa !7
  %xor1047.i = xor i32 %2080, %2071
  br label %cleanup.cont1055.i

sw.default1049.i:                                 ; preds = %cleanup.cont1008.i
  unreachable

cleanup.cont1055.i:                               ; preds = %sw.bb1046.i, %sw.bb1038.i, %sw.bb1030.i, %sw.bb1028.i, %sw.bb1024.i, %sw.bb1022.i
  %xor1047.i.sink = phi i32 [ %xor1047.i, %sw.bb1046.i ], [ %or1045.i, %sw.bb1038.i ], [ %or1037.i, %sw.bb1030.i ], [ %sub1029.i, %sw.bb1028.i ], [ %add1027.i, %sw.bb1024.i ], [ %mul1023.i, %sw.bb1022.i ]
  store i32 %xor1047.i.sink, i32* %add.ptr1019.i, align 4, !tbaa !7
  %2081 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 23, i32 1), align 1, !tbaa !17
  %idxprom1061.i = zext i8 %2081 to i32
  %arrayidx1062.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1061.i
  %2082 = load i32, i32* %arrayidx1062.i, align 4, !tbaa !7
  %2083 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 23, i32 0), align 8, !tbaa !16
  %conv1065.i = zext i8 %2083 to i32
  %add.ptr1066.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1065.i
  %2084 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 23, i32 2), align 2, !tbaa !14
  switch i8 %2084, label %sw.default1096.i [
    i8 0, label %sw.bb1069.i
    i8 1, label %sw.bb1071.i
    i8 2, label %sw.bb1075.i
    i8 3, label %sw.bb1077.i
    i8 4, label %sw.bb1085.i
    i8 5, label %sw.bb1093.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1069.i:                                      ; preds = %cleanup.cont1055.i
  %2085 = load i32, i32* %add.ptr1066.i, align 4, !tbaa !7
  %mul1070.i = mul i32 %2085, %2082
  br label %cleanup.cont1102.i

sw.bb1071.i:                                      ; preds = %cleanup.cont1055.i
  %2086 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 23, i32 3), align 4, !tbaa !18
  %add1073.i = add i32 %2086, %2082
  %2087 = load i32, i32* %add.ptr1066.i, align 4, !tbaa !7
  %add1074.i = add i32 %add1073.i, %2087
  br label %cleanup.cont1102.i

sw.bb1075.i:                                      ; preds = %cleanup.cont1055.i
  %2088 = load i32, i32* %add.ptr1066.i, align 4, !tbaa !7
  %sub1076.i = sub i32 %2088, %2082
  br label %cleanup.cont1102.i

sw.bb1077.i:                                      ; preds = %cleanup.cont1055.i
  %2089 = load i32, i32* %add.ptr1066.i, align 4, !tbaa !7
  %or1084.i = call i32 @llvm.fshr.i32(i32 %2089, i32 %2089, i32 %2082) #7
  br label %cleanup.cont1102.i

sw.bb1085.i:                                      ; preds = %cleanup.cont1055.i
  %2090 = load i32, i32* %add.ptr1066.i, align 4, !tbaa !7
  %or1092.i = call i32 @llvm.fshl.i32(i32 %2090, i32 %2090, i32 %2082) #7
  br label %cleanup.cont1102.i

sw.bb1093.i:                                      ; preds = %cleanup.cont1055.i
  %2091 = load i32, i32* %add.ptr1066.i, align 4, !tbaa !7
  %xor1094.i = xor i32 %2091, %2082
  br label %cleanup.cont1102.i

sw.default1096.i:                                 ; preds = %cleanup.cont1055.i
  unreachable

cleanup.cont1102.i:                               ; preds = %sw.bb1093.i, %sw.bb1085.i, %sw.bb1077.i, %sw.bb1075.i, %sw.bb1071.i, %sw.bb1069.i
  %xor1094.i.sink = phi i32 [ %xor1094.i, %sw.bb1093.i ], [ %or1092.i, %sw.bb1085.i ], [ %or1084.i, %sw.bb1077.i ], [ %sub1076.i, %sw.bb1075.i ], [ %add1074.i, %sw.bb1071.i ], [ %mul1070.i, %sw.bb1069.i ]
  store i32 %xor1094.i.sink, i32* %add.ptr1066.i, align 4, !tbaa !7
  %2092 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 24, i32 1), align 1, !tbaa !17
  %idxprom1108.i = zext i8 %2092 to i32
  %arrayidx1109.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1108.i
  %2093 = load i32, i32* %arrayidx1109.i, align 4, !tbaa !7
  %2094 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 24, i32 0), align 16, !tbaa !16
  %conv1112.i = zext i8 %2094 to i32
  %add.ptr1113.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1112.i
  %2095 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 24, i32 2), align 2, !tbaa !14
  switch i8 %2095, label %sw.default1143.i [
    i8 0, label %sw.bb1116.i
    i8 1, label %sw.bb1118.i
    i8 2, label %sw.bb1122.i
    i8 3, label %sw.bb1124.i
    i8 4, label %sw.bb1132.i
    i8 5, label %sw.bb1140.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1116.i:                                      ; preds = %cleanup.cont1102.i
  %2096 = load i32, i32* %add.ptr1113.i, align 4, !tbaa !7
  %mul1117.i = mul i32 %2096, %2093
  br label %cleanup.cont1149.i

sw.bb1118.i:                                      ; preds = %cleanup.cont1102.i
  %2097 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 24, i32 3), align 4, !tbaa !18
  %add1120.i = add i32 %2097, %2093
  %2098 = load i32, i32* %add.ptr1113.i, align 4, !tbaa !7
  %add1121.i = add i32 %add1120.i, %2098
  br label %cleanup.cont1149.i

sw.bb1122.i:                                      ; preds = %cleanup.cont1102.i
  %2099 = load i32, i32* %add.ptr1113.i, align 4, !tbaa !7
  %sub1123.i = sub i32 %2099, %2093
  br label %cleanup.cont1149.i

sw.bb1124.i:                                      ; preds = %cleanup.cont1102.i
  %2100 = load i32, i32* %add.ptr1113.i, align 4, !tbaa !7
  %or1131.i = call i32 @llvm.fshr.i32(i32 %2100, i32 %2100, i32 %2093) #7
  br label %cleanup.cont1149.i

sw.bb1132.i:                                      ; preds = %cleanup.cont1102.i
  %2101 = load i32, i32* %add.ptr1113.i, align 4, !tbaa !7
  %or1139.i = call i32 @llvm.fshl.i32(i32 %2101, i32 %2101, i32 %2093) #7
  br label %cleanup.cont1149.i

sw.bb1140.i:                                      ; preds = %cleanup.cont1102.i
  %2102 = load i32, i32* %add.ptr1113.i, align 4, !tbaa !7
  %xor1141.i = xor i32 %2102, %2093
  br label %cleanup.cont1149.i

sw.default1143.i:                                 ; preds = %cleanup.cont1102.i
  unreachable

cleanup.cont1149.i:                               ; preds = %sw.bb1140.i, %sw.bb1132.i, %sw.bb1124.i, %sw.bb1122.i, %sw.bb1118.i, %sw.bb1116.i
  %xor1141.i.sink = phi i32 [ %xor1141.i, %sw.bb1140.i ], [ %or1139.i, %sw.bb1132.i ], [ %or1131.i, %sw.bb1124.i ], [ %sub1123.i, %sw.bb1122.i ], [ %add1121.i, %sw.bb1118.i ], [ %mul1117.i, %sw.bb1116.i ]
  store i32 %xor1141.i.sink, i32* %add.ptr1113.i, align 4, !tbaa !7
  %2103 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 25, i32 1), align 1, !tbaa !17
  %idxprom1155.i = zext i8 %2103 to i32
  %arrayidx1156.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1155.i
  %2104 = load i32, i32* %arrayidx1156.i, align 4, !tbaa !7
  %2105 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 25, i32 0), align 8, !tbaa !16
  %conv1159.i = zext i8 %2105 to i32
  %add.ptr1160.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1159.i
  %2106 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 25, i32 2), align 2, !tbaa !14
  switch i8 %2106, label %sw.default1190.i [
    i8 0, label %sw.bb1163.i
    i8 1, label %sw.bb1165.i
    i8 2, label %sw.bb1169.i
    i8 3, label %sw.bb1171.i
    i8 4, label %sw.bb1179.i
    i8 5, label %sw.bb1187.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1163.i:                                      ; preds = %cleanup.cont1149.i
  %2107 = load i32, i32* %add.ptr1160.i, align 4, !tbaa !7
  %mul1164.i = mul i32 %2107, %2104
  br label %cleanup.cont1196.i

sw.bb1165.i:                                      ; preds = %cleanup.cont1149.i
  %2108 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 25, i32 3), align 4, !tbaa !18
  %add1167.i = add i32 %2108, %2104
  %2109 = load i32, i32* %add.ptr1160.i, align 4, !tbaa !7
  %add1168.i = add i32 %add1167.i, %2109
  br label %cleanup.cont1196.i

sw.bb1169.i:                                      ; preds = %cleanup.cont1149.i
  %2110 = load i32, i32* %add.ptr1160.i, align 4, !tbaa !7
  %sub1170.i = sub i32 %2110, %2104
  br label %cleanup.cont1196.i

sw.bb1171.i:                                      ; preds = %cleanup.cont1149.i
  %2111 = load i32, i32* %add.ptr1160.i, align 4, !tbaa !7
  %or1178.i = call i32 @llvm.fshr.i32(i32 %2111, i32 %2111, i32 %2104) #7
  br label %cleanup.cont1196.i

sw.bb1179.i:                                      ; preds = %cleanup.cont1149.i
  %2112 = load i32, i32* %add.ptr1160.i, align 4, !tbaa !7
  %or1186.i = call i32 @llvm.fshl.i32(i32 %2112, i32 %2112, i32 %2104) #7
  br label %cleanup.cont1196.i

sw.bb1187.i:                                      ; preds = %cleanup.cont1149.i
  %2113 = load i32, i32* %add.ptr1160.i, align 4, !tbaa !7
  %xor1188.i = xor i32 %2113, %2104
  br label %cleanup.cont1196.i

sw.default1190.i:                                 ; preds = %cleanup.cont1149.i
  unreachable

cleanup.cont1196.i:                               ; preds = %sw.bb1187.i, %sw.bb1179.i, %sw.bb1171.i, %sw.bb1169.i, %sw.bb1165.i, %sw.bb1163.i
  %xor1188.i.sink = phi i32 [ %xor1188.i, %sw.bb1187.i ], [ %or1186.i, %sw.bb1179.i ], [ %or1178.i, %sw.bb1171.i ], [ %sub1170.i, %sw.bb1169.i ], [ %add1168.i, %sw.bb1165.i ], [ %mul1164.i, %sw.bb1163.i ]
  store i32 %xor1188.i.sink, i32* %add.ptr1160.i, align 4, !tbaa !7
  %2114 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 26, i32 1), align 1, !tbaa !17
  %idxprom1202.i = zext i8 %2114 to i32
  %arrayidx1203.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1202.i
  %2115 = load i32, i32* %arrayidx1203.i, align 4, !tbaa !7
  %2116 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 26, i32 0), align 16, !tbaa !16
  %conv1206.i = zext i8 %2116 to i32
  %add.ptr1207.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1206.i
  %2117 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 26, i32 2), align 2, !tbaa !14
  switch i8 %2117, label %sw.default1237.i [
    i8 0, label %sw.bb1210.i
    i8 1, label %sw.bb1212.i
    i8 2, label %sw.bb1216.i
    i8 3, label %sw.bb1218.i
    i8 4, label %sw.bb1226.i
    i8 5, label %sw.bb1234.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1210.i:                                      ; preds = %cleanup.cont1196.i
  %2118 = load i32, i32* %add.ptr1207.i, align 4, !tbaa !7
  %mul1211.i = mul i32 %2118, %2115
  br label %cleanup.cont1243.i

sw.bb1212.i:                                      ; preds = %cleanup.cont1196.i
  %2119 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 26, i32 3), align 4, !tbaa !18
  %add1214.i = add i32 %2119, %2115
  %2120 = load i32, i32* %add.ptr1207.i, align 4, !tbaa !7
  %add1215.i = add i32 %add1214.i, %2120
  br label %cleanup.cont1243.i

sw.bb1216.i:                                      ; preds = %cleanup.cont1196.i
  %2121 = load i32, i32* %add.ptr1207.i, align 4, !tbaa !7
  %sub1217.i = sub i32 %2121, %2115
  br label %cleanup.cont1243.i

sw.bb1218.i:                                      ; preds = %cleanup.cont1196.i
  %2122 = load i32, i32* %add.ptr1207.i, align 4, !tbaa !7
  %or1225.i = call i32 @llvm.fshr.i32(i32 %2122, i32 %2122, i32 %2115) #7
  br label %cleanup.cont1243.i

sw.bb1226.i:                                      ; preds = %cleanup.cont1196.i
  %2123 = load i32, i32* %add.ptr1207.i, align 4, !tbaa !7
  %or1233.i = call i32 @llvm.fshl.i32(i32 %2123, i32 %2123, i32 %2115) #7
  br label %cleanup.cont1243.i

sw.bb1234.i:                                      ; preds = %cleanup.cont1196.i
  %2124 = load i32, i32* %add.ptr1207.i, align 4, !tbaa !7
  %xor1235.i = xor i32 %2124, %2115
  br label %cleanup.cont1243.i

sw.default1237.i:                                 ; preds = %cleanup.cont1196.i
  unreachable

cleanup.cont1243.i:                               ; preds = %sw.bb1234.i, %sw.bb1226.i, %sw.bb1218.i, %sw.bb1216.i, %sw.bb1212.i, %sw.bb1210.i
  %xor1235.i.sink = phi i32 [ %xor1235.i, %sw.bb1234.i ], [ %or1233.i, %sw.bb1226.i ], [ %or1225.i, %sw.bb1218.i ], [ %sub1217.i, %sw.bb1216.i ], [ %add1215.i, %sw.bb1212.i ], [ %mul1211.i, %sw.bb1210.i ]
  store i32 %xor1235.i.sink, i32* %add.ptr1207.i, align 4, !tbaa !7
  %2125 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 27, i32 1), align 1, !tbaa !17
  %idxprom1249.i = zext i8 %2125 to i32
  %arrayidx1250.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1249.i
  %2126 = load i32, i32* %arrayidx1250.i, align 4, !tbaa !7
  %2127 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 27, i32 0), align 8, !tbaa !16
  %conv1253.i = zext i8 %2127 to i32
  %add.ptr1254.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1253.i
  %2128 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 27, i32 2), align 2, !tbaa !14
  switch i8 %2128, label %sw.default1284.i [
    i8 0, label %sw.bb1257.i
    i8 1, label %sw.bb1259.i
    i8 2, label %sw.bb1263.i
    i8 3, label %sw.bb1265.i
    i8 4, label %sw.bb1273.i
    i8 5, label %sw.bb1281.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1257.i:                                      ; preds = %cleanup.cont1243.i
  %2129 = load i32, i32* %add.ptr1254.i, align 4, !tbaa !7
  %mul1258.i = mul i32 %2129, %2126
  br label %cleanup.cont1290.i

sw.bb1259.i:                                      ; preds = %cleanup.cont1243.i
  %2130 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 27, i32 3), align 4, !tbaa !18
  %add1261.i = add i32 %2130, %2126
  %2131 = load i32, i32* %add.ptr1254.i, align 4, !tbaa !7
  %add1262.i = add i32 %add1261.i, %2131
  br label %cleanup.cont1290.i

sw.bb1263.i:                                      ; preds = %cleanup.cont1243.i
  %2132 = load i32, i32* %add.ptr1254.i, align 4, !tbaa !7
  %sub1264.i = sub i32 %2132, %2126
  br label %cleanup.cont1290.i

sw.bb1265.i:                                      ; preds = %cleanup.cont1243.i
  %2133 = load i32, i32* %add.ptr1254.i, align 4, !tbaa !7
  %or1272.i = call i32 @llvm.fshr.i32(i32 %2133, i32 %2133, i32 %2126) #7
  br label %cleanup.cont1290.i

sw.bb1273.i:                                      ; preds = %cleanup.cont1243.i
  %2134 = load i32, i32* %add.ptr1254.i, align 4, !tbaa !7
  %or1280.i = call i32 @llvm.fshl.i32(i32 %2134, i32 %2134, i32 %2126) #7
  br label %cleanup.cont1290.i

sw.bb1281.i:                                      ; preds = %cleanup.cont1243.i
  %2135 = load i32, i32* %add.ptr1254.i, align 4, !tbaa !7
  %xor1282.i = xor i32 %2135, %2126
  br label %cleanup.cont1290.i

sw.default1284.i:                                 ; preds = %cleanup.cont1243.i
  unreachable

cleanup.cont1290.i:                               ; preds = %sw.bb1281.i, %sw.bb1273.i, %sw.bb1265.i, %sw.bb1263.i, %sw.bb1259.i, %sw.bb1257.i
  %xor1282.i.sink = phi i32 [ %xor1282.i, %sw.bb1281.i ], [ %or1280.i, %sw.bb1273.i ], [ %or1272.i, %sw.bb1265.i ], [ %sub1264.i, %sw.bb1263.i ], [ %add1262.i, %sw.bb1259.i ], [ %mul1258.i, %sw.bb1257.i ]
  store i32 %xor1282.i.sink, i32* %add.ptr1254.i, align 4, !tbaa !7
  %2136 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 28, i32 1), align 1, !tbaa !17
  %idxprom1296.i = zext i8 %2136 to i32
  %arrayidx1297.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1296.i
  %2137 = load i32, i32* %arrayidx1297.i, align 4, !tbaa !7
  %2138 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 28, i32 0), align 16, !tbaa !16
  %conv1300.i = zext i8 %2138 to i32
  %add.ptr1301.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1300.i
  %2139 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 28, i32 2), align 2, !tbaa !14
  switch i8 %2139, label %sw.default1331.i [
    i8 0, label %sw.bb1304.i
    i8 1, label %sw.bb1306.i
    i8 2, label %sw.bb1310.i
    i8 3, label %sw.bb1312.i
    i8 4, label %sw.bb1320.i
    i8 5, label %sw.bb1328.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1304.i:                                      ; preds = %cleanup.cont1290.i
  %2140 = load i32, i32* %add.ptr1301.i, align 4, !tbaa !7
  %mul1305.i = mul i32 %2140, %2137
  br label %cleanup.cont1337.i

sw.bb1306.i:                                      ; preds = %cleanup.cont1290.i
  %2141 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 28, i32 3), align 4, !tbaa !18
  %add1308.i = add i32 %2141, %2137
  %2142 = load i32, i32* %add.ptr1301.i, align 4, !tbaa !7
  %add1309.i = add i32 %add1308.i, %2142
  br label %cleanup.cont1337.i

sw.bb1310.i:                                      ; preds = %cleanup.cont1290.i
  %2143 = load i32, i32* %add.ptr1301.i, align 4, !tbaa !7
  %sub1311.i = sub i32 %2143, %2137
  br label %cleanup.cont1337.i

sw.bb1312.i:                                      ; preds = %cleanup.cont1290.i
  %2144 = load i32, i32* %add.ptr1301.i, align 4, !tbaa !7
  %or1319.i = call i32 @llvm.fshr.i32(i32 %2144, i32 %2144, i32 %2137) #7
  br label %cleanup.cont1337.i

sw.bb1320.i:                                      ; preds = %cleanup.cont1290.i
  %2145 = load i32, i32* %add.ptr1301.i, align 4, !tbaa !7
  %or1327.i = call i32 @llvm.fshl.i32(i32 %2145, i32 %2145, i32 %2137) #7
  br label %cleanup.cont1337.i

sw.bb1328.i:                                      ; preds = %cleanup.cont1290.i
  %2146 = load i32, i32* %add.ptr1301.i, align 4, !tbaa !7
  %xor1329.i = xor i32 %2146, %2137
  br label %cleanup.cont1337.i

sw.default1331.i:                                 ; preds = %cleanup.cont1290.i
  unreachable

cleanup.cont1337.i:                               ; preds = %sw.bb1328.i, %sw.bb1320.i, %sw.bb1312.i, %sw.bb1310.i, %sw.bb1306.i, %sw.bb1304.i
  %xor1329.i.sink = phi i32 [ %xor1329.i, %sw.bb1328.i ], [ %or1327.i, %sw.bb1320.i ], [ %or1319.i, %sw.bb1312.i ], [ %sub1311.i, %sw.bb1310.i ], [ %add1309.i, %sw.bb1306.i ], [ %mul1305.i, %sw.bb1304.i ]
  store i32 %xor1329.i.sink, i32* %add.ptr1301.i, align 4, !tbaa !7
  %2147 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 29, i32 1), align 1, !tbaa !17
  %idxprom1343.i = zext i8 %2147 to i32
  %arrayidx1344.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1343.i
  %2148 = load i32, i32* %arrayidx1344.i, align 4, !tbaa !7
  %2149 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 29, i32 0), align 8, !tbaa !16
  %conv1347.i = zext i8 %2149 to i32
  %add.ptr1348.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1347.i
  %2150 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 29, i32 2), align 2, !tbaa !14
  switch i8 %2150, label %sw.default1378.i [
    i8 0, label %sw.bb1351.i
    i8 1, label %sw.bb1353.i
    i8 2, label %sw.bb1357.i
    i8 3, label %sw.bb1359.i
    i8 4, label %sw.bb1367.i
    i8 5, label %sw.bb1375.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1351.i:                                      ; preds = %cleanup.cont1337.i
  %2151 = load i32, i32* %add.ptr1348.i, align 4, !tbaa !7
  %mul1352.i = mul i32 %2151, %2148
  br label %cleanup.cont1384.i

sw.bb1353.i:                                      ; preds = %cleanup.cont1337.i
  %2152 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 29, i32 3), align 4, !tbaa !18
  %add1355.i = add i32 %2152, %2148
  %2153 = load i32, i32* %add.ptr1348.i, align 4, !tbaa !7
  %add1356.i = add i32 %add1355.i, %2153
  br label %cleanup.cont1384.i

sw.bb1357.i:                                      ; preds = %cleanup.cont1337.i
  %2154 = load i32, i32* %add.ptr1348.i, align 4, !tbaa !7
  %sub1358.i = sub i32 %2154, %2148
  br label %cleanup.cont1384.i

sw.bb1359.i:                                      ; preds = %cleanup.cont1337.i
  %2155 = load i32, i32* %add.ptr1348.i, align 4, !tbaa !7
  %or1366.i = call i32 @llvm.fshr.i32(i32 %2155, i32 %2155, i32 %2148) #7
  br label %cleanup.cont1384.i

sw.bb1367.i:                                      ; preds = %cleanup.cont1337.i
  %2156 = load i32, i32* %add.ptr1348.i, align 4, !tbaa !7
  %or1374.i = call i32 @llvm.fshl.i32(i32 %2156, i32 %2156, i32 %2148) #7
  br label %cleanup.cont1384.i

sw.bb1375.i:                                      ; preds = %cleanup.cont1337.i
  %2157 = load i32, i32* %add.ptr1348.i, align 4, !tbaa !7
  %xor1376.i = xor i32 %2157, %2148
  br label %cleanup.cont1384.i

sw.default1378.i:                                 ; preds = %cleanup.cont1337.i
  unreachable

cleanup.cont1384.i:                               ; preds = %sw.bb1375.i, %sw.bb1367.i, %sw.bb1359.i, %sw.bb1357.i, %sw.bb1353.i, %sw.bb1351.i
  %xor1376.i.sink = phi i32 [ %xor1376.i, %sw.bb1375.i ], [ %or1374.i, %sw.bb1367.i ], [ %or1366.i, %sw.bb1359.i ], [ %sub1358.i, %sw.bb1357.i ], [ %add1356.i, %sw.bb1353.i ], [ %mul1352.i, %sw.bb1351.i ]
  store i32 %xor1376.i.sink, i32* %add.ptr1348.i, align 4, !tbaa !7
  %2158 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 30, i32 1), align 1, !tbaa !17
  %idxprom1390.i = zext i8 %2158 to i32
  %arrayidx1391.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1390.i
  %2159 = load i32, i32* %arrayidx1391.i, align 4, !tbaa !7
  %2160 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 30, i32 0), align 16, !tbaa !16
  %conv1394.i = zext i8 %2160 to i32
  %add.ptr1395.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1394.i
  %2161 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 30, i32 2), align 2, !tbaa !14
  switch i8 %2161, label %sw.default1425.i [
    i8 0, label %sw.bb1398.i
    i8 1, label %sw.bb1400.i
    i8 2, label %sw.bb1404.i
    i8 3, label %sw.bb1406.i
    i8 4, label %sw.bb1414.i
    i8 5, label %sw.bb1422.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1398.i:                                      ; preds = %cleanup.cont1384.i
  %2162 = load i32, i32* %add.ptr1395.i, align 4, !tbaa !7
  %mul1399.i = mul i32 %2162, %2159
  br label %cleanup.cont1431.i

sw.bb1400.i:                                      ; preds = %cleanup.cont1384.i
  %2163 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 30, i32 3), align 4, !tbaa !18
  %add1402.i = add i32 %2163, %2159
  %2164 = load i32, i32* %add.ptr1395.i, align 4, !tbaa !7
  %add1403.i = add i32 %add1402.i, %2164
  br label %cleanup.cont1431.i

sw.bb1404.i:                                      ; preds = %cleanup.cont1384.i
  %2165 = load i32, i32* %add.ptr1395.i, align 4, !tbaa !7
  %sub1405.i = sub i32 %2165, %2159
  br label %cleanup.cont1431.i

sw.bb1406.i:                                      ; preds = %cleanup.cont1384.i
  %2166 = load i32, i32* %add.ptr1395.i, align 4, !tbaa !7
  %or1413.i = call i32 @llvm.fshr.i32(i32 %2166, i32 %2166, i32 %2159) #7
  br label %cleanup.cont1431.i

sw.bb1414.i:                                      ; preds = %cleanup.cont1384.i
  %2167 = load i32, i32* %add.ptr1395.i, align 4, !tbaa !7
  %or1421.i = call i32 @llvm.fshl.i32(i32 %2167, i32 %2167, i32 %2159) #7
  br label %cleanup.cont1431.i

sw.bb1422.i:                                      ; preds = %cleanup.cont1384.i
  %2168 = load i32, i32* %add.ptr1395.i, align 4, !tbaa !7
  %xor1423.i = xor i32 %2168, %2159
  br label %cleanup.cont1431.i

sw.default1425.i:                                 ; preds = %cleanup.cont1384.i
  unreachable

cleanup.cont1431.i:                               ; preds = %sw.bb1422.i, %sw.bb1414.i, %sw.bb1406.i, %sw.bb1404.i, %sw.bb1400.i, %sw.bb1398.i
  %xor1423.i.sink = phi i32 [ %xor1423.i, %sw.bb1422.i ], [ %or1421.i, %sw.bb1414.i ], [ %or1413.i, %sw.bb1406.i ], [ %sub1405.i, %sw.bb1404.i ], [ %add1403.i, %sw.bb1400.i ], [ %mul1399.i, %sw.bb1398.i ]
  store i32 %xor1423.i.sink, i32* %add.ptr1395.i, align 4, !tbaa !7
  %2169 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 31, i32 1), align 1, !tbaa !17
  %idxprom1437.i = zext i8 %2169 to i32
  %arrayidx1438.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1437.i
  %2170 = load i32, i32* %arrayidx1438.i, align 4, !tbaa !7
  %2171 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 31, i32 0), align 8, !tbaa !16
  %conv1441.i = zext i8 %2171 to i32
  %add.ptr1442.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1441.i
  %2172 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 31, i32 2), align 2, !tbaa !14
  switch i8 %2172, label %sw.default1472.i [
    i8 0, label %sw.bb1445.i
    i8 1, label %sw.bb1447.i
    i8 2, label %sw.bb1451.i
    i8 3, label %sw.bb1453.i
    i8 4, label %sw.bb1461.i
    i8 5, label %sw.bb1469.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1445.i:                                      ; preds = %cleanup.cont1431.i
  %2173 = load i32, i32* %add.ptr1442.i, align 4, !tbaa !7
  %mul1446.i = mul i32 %2173, %2170
  br label %cleanup.cont1478.i

sw.bb1447.i:                                      ; preds = %cleanup.cont1431.i
  %2174 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 31, i32 3), align 4, !tbaa !18
  %add1449.i = add i32 %2174, %2170
  %2175 = load i32, i32* %add.ptr1442.i, align 4, !tbaa !7
  %add1450.i = add i32 %add1449.i, %2175
  br label %cleanup.cont1478.i

sw.bb1451.i:                                      ; preds = %cleanup.cont1431.i
  %2176 = load i32, i32* %add.ptr1442.i, align 4, !tbaa !7
  %sub1452.i = sub i32 %2176, %2170
  br label %cleanup.cont1478.i

sw.bb1453.i:                                      ; preds = %cleanup.cont1431.i
  %2177 = load i32, i32* %add.ptr1442.i, align 4, !tbaa !7
  %or1460.i = call i32 @llvm.fshr.i32(i32 %2177, i32 %2177, i32 %2170) #7
  br label %cleanup.cont1478.i

sw.bb1461.i:                                      ; preds = %cleanup.cont1431.i
  %2178 = load i32, i32* %add.ptr1442.i, align 4, !tbaa !7
  %or1468.i = call i32 @llvm.fshl.i32(i32 %2178, i32 %2178, i32 %2170) #7
  br label %cleanup.cont1478.i

sw.bb1469.i:                                      ; preds = %cleanup.cont1431.i
  %2179 = load i32, i32* %add.ptr1442.i, align 4, !tbaa !7
  %xor1470.i = xor i32 %2179, %2170
  br label %cleanup.cont1478.i

sw.default1472.i:                                 ; preds = %cleanup.cont1431.i
  unreachable

cleanup.cont1478.i:                               ; preds = %sw.bb1469.i, %sw.bb1461.i, %sw.bb1453.i, %sw.bb1451.i, %sw.bb1447.i, %sw.bb1445.i
  %xor1470.i.sink = phi i32 [ %xor1470.i, %sw.bb1469.i ], [ %or1468.i, %sw.bb1461.i ], [ %or1460.i, %sw.bb1453.i ], [ %sub1452.i, %sw.bb1451.i ], [ %add1450.i, %sw.bb1447.i ], [ %mul1446.i, %sw.bb1445.i ]
  store i32 %xor1470.i.sink, i32* %add.ptr1442.i, align 4, !tbaa !7
  %2180 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 32, i32 1), align 1, !tbaa !17
  %idxprom1484.i = zext i8 %2180 to i32
  %arrayidx1485.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1484.i
  %2181 = load i32, i32* %arrayidx1485.i, align 4, !tbaa !7
  %2182 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 32, i32 0), align 16, !tbaa !16
  %conv1488.i = zext i8 %2182 to i32
  %add.ptr1489.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1488.i
  %2183 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 32, i32 2), align 2, !tbaa !14
  switch i8 %2183, label %sw.default1519.i [
    i8 0, label %sw.bb1492.i
    i8 1, label %sw.bb1494.i
    i8 2, label %sw.bb1498.i
    i8 3, label %sw.bb1500.i
    i8 4, label %sw.bb1508.i
    i8 5, label %sw.bb1516.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1492.i:                                      ; preds = %cleanup.cont1478.i
  %2184 = load i32, i32* %add.ptr1489.i, align 4, !tbaa !7
  %mul1493.i = mul i32 %2184, %2181
  br label %cleanup.cont1525.i

sw.bb1494.i:                                      ; preds = %cleanup.cont1478.i
  %2185 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 32, i32 3), align 4, !tbaa !18
  %add1496.i = add i32 %2185, %2181
  %2186 = load i32, i32* %add.ptr1489.i, align 4, !tbaa !7
  %add1497.i = add i32 %add1496.i, %2186
  br label %cleanup.cont1525.i

sw.bb1498.i:                                      ; preds = %cleanup.cont1478.i
  %2187 = load i32, i32* %add.ptr1489.i, align 4, !tbaa !7
  %sub1499.i = sub i32 %2187, %2181
  br label %cleanup.cont1525.i

sw.bb1500.i:                                      ; preds = %cleanup.cont1478.i
  %2188 = load i32, i32* %add.ptr1489.i, align 4, !tbaa !7
  %or1507.i = call i32 @llvm.fshr.i32(i32 %2188, i32 %2188, i32 %2181) #7
  br label %cleanup.cont1525.i

sw.bb1508.i:                                      ; preds = %cleanup.cont1478.i
  %2189 = load i32, i32* %add.ptr1489.i, align 4, !tbaa !7
  %or1515.i = call i32 @llvm.fshl.i32(i32 %2189, i32 %2189, i32 %2181) #7
  br label %cleanup.cont1525.i

sw.bb1516.i:                                      ; preds = %cleanup.cont1478.i
  %2190 = load i32, i32* %add.ptr1489.i, align 4, !tbaa !7
  %xor1517.i = xor i32 %2190, %2181
  br label %cleanup.cont1525.i

sw.default1519.i:                                 ; preds = %cleanup.cont1478.i
  unreachable

cleanup.cont1525.i:                               ; preds = %sw.bb1516.i, %sw.bb1508.i, %sw.bb1500.i, %sw.bb1498.i, %sw.bb1494.i, %sw.bb1492.i
  %xor1517.i.sink = phi i32 [ %xor1517.i, %sw.bb1516.i ], [ %or1515.i, %sw.bb1508.i ], [ %or1507.i, %sw.bb1500.i ], [ %sub1499.i, %sw.bb1498.i ], [ %add1497.i, %sw.bb1494.i ], [ %mul1493.i, %sw.bb1492.i ]
  store i32 %xor1517.i.sink, i32* %add.ptr1489.i, align 4, !tbaa !7
  %2191 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 33, i32 1), align 1, !tbaa !17
  %idxprom1531.i = zext i8 %2191 to i32
  %arrayidx1532.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1531.i
  %2192 = load i32, i32* %arrayidx1532.i, align 4, !tbaa !7
  %2193 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 33, i32 0), align 8, !tbaa !16
  %conv1535.i = zext i8 %2193 to i32
  %add.ptr1536.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1535.i
  %2194 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 33, i32 2), align 2, !tbaa !14
  switch i8 %2194, label %sw.default1566.i [
    i8 0, label %sw.bb1539.i
    i8 1, label %sw.bb1541.i
    i8 2, label %sw.bb1545.i
    i8 3, label %sw.bb1547.i
    i8 4, label %sw.bb1555.i
    i8 5, label %sw.bb1563.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1539.i:                                      ; preds = %cleanup.cont1525.i
  %2195 = load i32, i32* %add.ptr1536.i, align 4, !tbaa !7
  %mul1540.i = mul i32 %2195, %2192
  br label %cleanup.cont1572.i

sw.bb1541.i:                                      ; preds = %cleanup.cont1525.i
  %2196 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 33, i32 3), align 4, !tbaa !18
  %add1543.i = add i32 %2196, %2192
  %2197 = load i32, i32* %add.ptr1536.i, align 4, !tbaa !7
  %add1544.i = add i32 %add1543.i, %2197
  br label %cleanup.cont1572.i

sw.bb1545.i:                                      ; preds = %cleanup.cont1525.i
  %2198 = load i32, i32* %add.ptr1536.i, align 4, !tbaa !7
  %sub1546.i = sub i32 %2198, %2192
  br label %cleanup.cont1572.i

sw.bb1547.i:                                      ; preds = %cleanup.cont1525.i
  %2199 = load i32, i32* %add.ptr1536.i, align 4, !tbaa !7
  %or1554.i = call i32 @llvm.fshr.i32(i32 %2199, i32 %2199, i32 %2192) #7
  br label %cleanup.cont1572.i

sw.bb1555.i:                                      ; preds = %cleanup.cont1525.i
  %2200 = load i32, i32* %add.ptr1536.i, align 4, !tbaa !7
  %or1562.i = call i32 @llvm.fshl.i32(i32 %2200, i32 %2200, i32 %2192) #7
  br label %cleanup.cont1572.i

sw.bb1563.i:                                      ; preds = %cleanup.cont1525.i
  %2201 = load i32, i32* %add.ptr1536.i, align 4, !tbaa !7
  %xor1564.i = xor i32 %2201, %2192
  br label %cleanup.cont1572.i

sw.default1566.i:                                 ; preds = %cleanup.cont1525.i
  unreachable

cleanup.cont1572.i:                               ; preds = %sw.bb1563.i, %sw.bb1555.i, %sw.bb1547.i, %sw.bb1545.i, %sw.bb1541.i, %sw.bb1539.i
  %xor1564.i.sink = phi i32 [ %xor1564.i, %sw.bb1563.i ], [ %or1562.i, %sw.bb1555.i ], [ %or1554.i, %sw.bb1547.i ], [ %sub1546.i, %sw.bb1545.i ], [ %add1544.i, %sw.bb1541.i ], [ %mul1540.i, %sw.bb1539.i ]
  store i32 %xor1564.i.sink, i32* %add.ptr1536.i, align 4, !tbaa !7
  %2202 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 34, i32 1), align 1, !tbaa !17
  %idxprom1578.i = zext i8 %2202 to i32
  %arrayidx1579.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1578.i
  %2203 = load i32, i32* %arrayidx1579.i, align 4, !tbaa !7
  %2204 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 34, i32 0), align 16, !tbaa !16
  %conv1582.i = zext i8 %2204 to i32
  %add.ptr1583.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1582.i
  %2205 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 34, i32 2), align 2, !tbaa !14
  switch i8 %2205, label %sw.default1613.i [
    i8 0, label %sw.bb1586.i
    i8 1, label %sw.bb1588.i
    i8 2, label %sw.bb1592.i
    i8 3, label %sw.bb1594.i
    i8 4, label %sw.bb1602.i
    i8 5, label %sw.bb1610.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1586.i:                                      ; preds = %cleanup.cont1572.i
  %2206 = load i32, i32* %add.ptr1583.i, align 4, !tbaa !7
  %mul1587.i = mul i32 %2206, %2203
  br label %cleanup.cont1619.i

sw.bb1588.i:                                      ; preds = %cleanup.cont1572.i
  %2207 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 34, i32 3), align 4, !tbaa !18
  %add1590.i = add i32 %2207, %2203
  %2208 = load i32, i32* %add.ptr1583.i, align 4, !tbaa !7
  %add1591.i = add i32 %add1590.i, %2208
  br label %cleanup.cont1619.i

sw.bb1592.i:                                      ; preds = %cleanup.cont1572.i
  %2209 = load i32, i32* %add.ptr1583.i, align 4, !tbaa !7
  %sub1593.i = sub i32 %2209, %2203
  br label %cleanup.cont1619.i

sw.bb1594.i:                                      ; preds = %cleanup.cont1572.i
  %2210 = load i32, i32* %add.ptr1583.i, align 4, !tbaa !7
  %or1601.i = call i32 @llvm.fshr.i32(i32 %2210, i32 %2210, i32 %2203) #7
  br label %cleanup.cont1619.i

sw.bb1602.i:                                      ; preds = %cleanup.cont1572.i
  %2211 = load i32, i32* %add.ptr1583.i, align 4, !tbaa !7
  %or1609.i = call i32 @llvm.fshl.i32(i32 %2211, i32 %2211, i32 %2203) #7
  br label %cleanup.cont1619.i

sw.bb1610.i:                                      ; preds = %cleanup.cont1572.i
  %2212 = load i32, i32* %add.ptr1583.i, align 4, !tbaa !7
  %xor1611.i = xor i32 %2212, %2203
  br label %cleanup.cont1619.i

sw.default1613.i:                                 ; preds = %cleanup.cont1572.i
  unreachable

cleanup.cont1619.i:                               ; preds = %sw.bb1610.i, %sw.bb1602.i, %sw.bb1594.i, %sw.bb1592.i, %sw.bb1588.i, %sw.bb1586.i
  %xor1611.i.sink = phi i32 [ %xor1611.i, %sw.bb1610.i ], [ %or1609.i, %sw.bb1602.i ], [ %or1601.i, %sw.bb1594.i ], [ %sub1593.i, %sw.bb1592.i ], [ %add1591.i, %sw.bb1588.i ], [ %mul1587.i, %sw.bb1586.i ]
  store i32 %xor1611.i.sink, i32* %add.ptr1583.i, align 4, !tbaa !7
  %2213 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 35, i32 1), align 1, !tbaa !17
  %idxprom1625.i = zext i8 %2213 to i32
  %arrayidx1626.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1625.i
  %2214 = load i32, i32* %arrayidx1626.i, align 4, !tbaa !7
  %2215 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 35, i32 0), align 8, !tbaa !16
  %conv1629.i = zext i8 %2215 to i32
  %add.ptr1630.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1629.i
  %2216 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 35, i32 2), align 2, !tbaa !14
  switch i8 %2216, label %sw.default1660.i [
    i8 0, label %sw.bb1633.i
    i8 1, label %sw.bb1635.i
    i8 2, label %sw.bb1639.i
    i8 3, label %sw.bb1641.i
    i8 4, label %sw.bb1649.i
    i8 5, label %sw.bb1657.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1633.i:                                      ; preds = %cleanup.cont1619.i
  %2217 = load i32, i32* %add.ptr1630.i, align 4, !tbaa !7
  %mul1634.i = mul i32 %2217, %2214
  br label %cleanup.cont1666.i

sw.bb1635.i:                                      ; preds = %cleanup.cont1619.i
  %2218 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 35, i32 3), align 4, !tbaa !18
  %add1637.i = add i32 %2218, %2214
  %2219 = load i32, i32* %add.ptr1630.i, align 4, !tbaa !7
  %add1638.i = add i32 %add1637.i, %2219
  br label %cleanup.cont1666.i

sw.bb1639.i:                                      ; preds = %cleanup.cont1619.i
  %2220 = load i32, i32* %add.ptr1630.i, align 4, !tbaa !7
  %sub1640.i = sub i32 %2220, %2214
  br label %cleanup.cont1666.i

sw.bb1641.i:                                      ; preds = %cleanup.cont1619.i
  %2221 = load i32, i32* %add.ptr1630.i, align 4, !tbaa !7
  %or1648.i = call i32 @llvm.fshr.i32(i32 %2221, i32 %2221, i32 %2214) #7
  br label %cleanup.cont1666.i

sw.bb1649.i:                                      ; preds = %cleanup.cont1619.i
  %2222 = load i32, i32* %add.ptr1630.i, align 4, !tbaa !7
  %or1656.i = call i32 @llvm.fshl.i32(i32 %2222, i32 %2222, i32 %2214) #7
  br label %cleanup.cont1666.i

sw.bb1657.i:                                      ; preds = %cleanup.cont1619.i
  %2223 = load i32, i32* %add.ptr1630.i, align 4, !tbaa !7
  %xor1658.i = xor i32 %2223, %2214
  br label %cleanup.cont1666.i

sw.default1660.i:                                 ; preds = %cleanup.cont1619.i
  unreachable

cleanup.cont1666.i:                               ; preds = %sw.bb1657.i, %sw.bb1649.i, %sw.bb1641.i, %sw.bb1639.i, %sw.bb1635.i, %sw.bb1633.i
  %xor1658.i.sink = phi i32 [ %xor1658.i, %sw.bb1657.i ], [ %or1656.i, %sw.bb1649.i ], [ %or1648.i, %sw.bb1641.i ], [ %sub1640.i, %sw.bb1639.i ], [ %add1638.i, %sw.bb1635.i ], [ %mul1634.i, %sw.bb1633.i ]
  store i32 %xor1658.i.sink, i32* %add.ptr1630.i, align 4, !tbaa !7
  %2224 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 36, i32 1), align 1, !tbaa !17
  %idxprom1672.i = zext i8 %2224 to i32
  %arrayidx1673.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1672.i
  %2225 = load i32, i32* %arrayidx1673.i, align 4, !tbaa !7
  %2226 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 36, i32 0), align 16, !tbaa !16
  %conv1676.i = zext i8 %2226 to i32
  %add.ptr1677.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1676.i
  %2227 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 36, i32 2), align 2, !tbaa !14
  switch i8 %2227, label %sw.default1707.i [
    i8 0, label %sw.bb1680.i
    i8 1, label %sw.bb1682.i
    i8 2, label %sw.bb1686.i
    i8 3, label %sw.bb1688.i
    i8 4, label %sw.bb1696.i
    i8 5, label %sw.bb1704.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1680.i:                                      ; preds = %cleanup.cont1666.i
  %2228 = load i32, i32* %add.ptr1677.i, align 4, !tbaa !7
  %mul1681.i = mul i32 %2228, %2225
  br label %cleanup.cont1713.i

sw.bb1682.i:                                      ; preds = %cleanup.cont1666.i
  %2229 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 36, i32 3), align 4, !tbaa !18
  %add1684.i = add i32 %2229, %2225
  %2230 = load i32, i32* %add.ptr1677.i, align 4, !tbaa !7
  %add1685.i = add i32 %add1684.i, %2230
  br label %cleanup.cont1713.i

sw.bb1686.i:                                      ; preds = %cleanup.cont1666.i
  %2231 = load i32, i32* %add.ptr1677.i, align 4, !tbaa !7
  %sub1687.i = sub i32 %2231, %2225
  br label %cleanup.cont1713.i

sw.bb1688.i:                                      ; preds = %cleanup.cont1666.i
  %2232 = load i32, i32* %add.ptr1677.i, align 4, !tbaa !7
  %or1695.i = call i32 @llvm.fshr.i32(i32 %2232, i32 %2232, i32 %2225) #7
  br label %cleanup.cont1713.i

sw.bb1696.i:                                      ; preds = %cleanup.cont1666.i
  %2233 = load i32, i32* %add.ptr1677.i, align 4, !tbaa !7
  %or1703.i = call i32 @llvm.fshl.i32(i32 %2233, i32 %2233, i32 %2225) #7
  br label %cleanup.cont1713.i

sw.bb1704.i:                                      ; preds = %cleanup.cont1666.i
  %2234 = load i32, i32* %add.ptr1677.i, align 4, !tbaa !7
  %xor1705.i = xor i32 %2234, %2225
  br label %cleanup.cont1713.i

sw.default1707.i:                                 ; preds = %cleanup.cont1666.i
  unreachable

cleanup.cont1713.i:                               ; preds = %sw.bb1704.i, %sw.bb1696.i, %sw.bb1688.i, %sw.bb1686.i, %sw.bb1682.i, %sw.bb1680.i
  %xor1705.i.sink = phi i32 [ %xor1705.i, %sw.bb1704.i ], [ %or1703.i, %sw.bb1696.i ], [ %or1695.i, %sw.bb1688.i ], [ %sub1687.i, %sw.bb1686.i ], [ %add1685.i, %sw.bb1682.i ], [ %mul1681.i, %sw.bb1680.i ]
  store i32 %xor1705.i.sink, i32* %add.ptr1677.i, align 4, !tbaa !7
  %2235 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 37, i32 1), align 1, !tbaa !17
  %idxprom1719.i = zext i8 %2235 to i32
  %arrayidx1720.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1719.i
  %2236 = load i32, i32* %arrayidx1720.i, align 4, !tbaa !7
  %2237 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 37, i32 0), align 8, !tbaa !16
  %conv1723.i = zext i8 %2237 to i32
  %add.ptr1724.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1723.i
  %2238 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 37, i32 2), align 2, !tbaa !14
  switch i8 %2238, label %sw.default1754.i [
    i8 0, label %sw.bb1727.i
    i8 1, label %sw.bb1729.i
    i8 2, label %sw.bb1733.i
    i8 3, label %sw.bb1735.i
    i8 4, label %sw.bb1743.i
    i8 5, label %sw.bb1751.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1727.i:                                      ; preds = %cleanup.cont1713.i
  %2239 = load i32, i32* %add.ptr1724.i, align 4, !tbaa !7
  %mul1728.i = mul i32 %2239, %2236
  br label %cleanup.cont1760.i

sw.bb1729.i:                                      ; preds = %cleanup.cont1713.i
  %2240 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 37, i32 3), align 4, !tbaa !18
  %add1731.i = add i32 %2240, %2236
  %2241 = load i32, i32* %add.ptr1724.i, align 4, !tbaa !7
  %add1732.i = add i32 %add1731.i, %2241
  br label %cleanup.cont1760.i

sw.bb1733.i:                                      ; preds = %cleanup.cont1713.i
  %2242 = load i32, i32* %add.ptr1724.i, align 4, !tbaa !7
  %sub1734.i = sub i32 %2242, %2236
  br label %cleanup.cont1760.i

sw.bb1735.i:                                      ; preds = %cleanup.cont1713.i
  %2243 = load i32, i32* %add.ptr1724.i, align 4, !tbaa !7
  %or1742.i = call i32 @llvm.fshr.i32(i32 %2243, i32 %2243, i32 %2236) #7
  br label %cleanup.cont1760.i

sw.bb1743.i:                                      ; preds = %cleanup.cont1713.i
  %2244 = load i32, i32* %add.ptr1724.i, align 4, !tbaa !7
  %or1750.i = call i32 @llvm.fshl.i32(i32 %2244, i32 %2244, i32 %2236) #7
  br label %cleanup.cont1760.i

sw.bb1751.i:                                      ; preds = %cleanup.cont1713.i
  %2245 = load i32, i32* %add.ptr1724.i, align 4, !tbaa !7
  %xor1752.i = xor i32 %2245, %2236
  br label %cleanup.cont1760.i

sw.default1754.i:                                 ; preds = %cleanup.cont1713.i
  unreachable

cleanup.cont1760.i:                               ; preds = %sw.bb1751.i, %sw.bb1743.i, %sw.bb1735.i, %sw.bb1733.i, %sw.bb1729.i, %sw.bb1727.i
  %xor1752.i.sink = phi i32 [ %xor1752.i, %sw.bb1751.i ], [ %or1750.i, %sw.bb1743.i ], [ %or1742.i, %sw.bb1735.i ], [ %sub1734.i, %sw.bb1733.i ], [ %add1732.i, %sw.bb1729.i ], [ %mul1728.i, %sw.bb1727.i ]
  store i32 %xor1752.i.sink, i32* %add.ptr1724.i, align 4, !tbaa !7
  %2246 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 38, i32 1), align 1, !tbaa !17
  %idxprom1766.i = zext i8 %2246 to i32
  %arrayidx1767.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1766.i
  %2247 = load i32, i32* %arrayidx1767.i, align 4, !tbaa !7
  %2248 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 38, i32 0), align 16, !tbaa !16
  %conv1770.i = zext i8 %2248 to i32
  %add.ptr1771.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1770.i
  %2249 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 38, i32 2), align 2, !tbaa !14
  switch i8 %2249, label %sw.default1801.i [
    i8 0, label %sw.bb1774.i
    i8 1, label %sw.bb1776.i
    i8 2, label %sw.bb1780.i
    i8 3, label %sw.bb1782.i
    i8 4, label %sw.bb1790.i
    i8 5, label %sw.bb1798.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1774.i:                                      ; preds = %cleanup.cont1760.i
  %2250 = load i32, i32* %add.ptr1771.i, align 4, !tbaa !7
  %mul1775.i = mul i32 %2250, %2247
  br label %cleanup.cont1807.i

sw.bb1776.i:                                      ; preds = %cleanup.cont1760.i
  %2251 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 38, i32 3), align 4, !tbaa !18
  %add1778.i = add i32 %2251, %2247
  %2252 = load i32, i32* %add.ptr1771.i, align 4, !tbaa !7
  %add1779.i = add i32 %add1778.i, %2252
  br label %cleanup.cont1807.i

sw.bb1780.i:                                      ; preds = %cleanup.cont1760.i
  %2253 = load i32, i32* %add.ptr1771.i, align 4, !tbaa !7
  %sub1781.i = sub i32 %2253, %2247
  br label %cleanup.cont1807.i

sw.bb1782.i:                                      ; preds = %cleanup.cont1760.i
  %2254 = load i32, i32* %add.ptr1771.i, align 4, !tbaa !7
  %or1789.i = call i32 @llvm.fshr.i32(i32 %2254, i32 %2254, i32 %2247) #7
  br label %cleanup.cont1807.i

sw.bb1790.i:                                      ; preds = %cleanup.cont1760.i
  %2255 = load i32, i32* %add.ptr1771.i, align 4, !tbaa !7
  %or1797.i = call i32 @llvm.fshl.i32(i32 %2255, i32 %2255, i32 %2247) #7
  br label %cleanup.cont1807.i

sw.bb1798.i:                                      ; preds = %cleanup.cont1760.i
  %2256 = load i32, i32* %add.ptr1771.i, align 4, !tbaa !7
  %xor1799.i = xor i32 %2256, %2247
  br label %cleanup.cont1807.i

sw.default1801.i:                                 ; preds = %cleanup.cont1760.i
  unreachable

cleanup.cont1807.i:                               ; preds = %sw.bb1798.i, %sw.bb1790.i, %sw.bb1782.i, %sw.bb1780.i, %sw.bb1776.i, %sw.bb1774.i
  %xor1799.i.sink = phi i32 [ %xor1799.i, %sw.bb1798.i ], [ %or1797.i, %sw.bb1790.i ], [ %or1789.i, %sw.bb1782.i ], [ %sub1781.i, %sw.bb1780.i ], [ %add1779.i, %sw.bb1776.i ], [ %mul1775.i, %sw.bb1774.i ]
  store i32 %xor1799.i.sink, i32* %add.ptr1771.i, align 4, !tbaa !7
  %2257 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 39, i32 1), align 1, !tbaa !17
  %idxprom1813.i = zext i8 %2257 to i32
  %arrayidx1814.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1813.i
  %2258 = load i32, i32* %arrayidx1814.i, align 4, !tbaa !7
  %2259 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 39, i32 0), align 8, !tbaa !16
  %conv1817.i = zext i8 %2259 to i32
  %add.ptr1818.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1817.i
  %2260 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 39, i32 2), align 2, !tbaa !14
  switch i8 %2260, label %sw.default1848.i [
    i8 0, label %sw.bb1821.i
    i8 1, label %sw.bb1823.i
    i8 2, label %sw.bb1827.i
    i8 3, label %sw.bb1829.i
    i8 4, label %sw.bb1837.i
    i8 5, label %sw.bb1845.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1821.i:                                      ; preds = %cleanup.cont1807.i
  %2261 = load i32, i32* %add.ptr1818.i, align 4, !tbaa !7
  %mul1822.i = mul i32 %2261, %2258
  br label %cleanup.cont1854.i

sw.bb1823.i:                                      ; preds = %cleanup.cont1807.i
  %2262 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 39, i32 3), align 4, !tbaa !18
  %add1825.i = add i32 %2262, %2258
  %2263 = load i32, i32* %add.ptr1818.i, align 4, !tbaa !7
  %add1826.i = add i32 %add1825.i, %2263
  br label %cleanup.cont1854.i

sw.bb1827.i:                                      ; preds = %cleanup.cont1807.i
  %2264 = load i32, i32* %add.ptr1818.i, align 4, !tbaa !7
  %sub1828.i = sub i32 %2264, %2258
  br label %cleanup.cont1854.i

sw.bb1829.i:                                      ; preds = %cleanup.cont1807.i
  %2265 = load i32, i32* %add.ptr1818.i, align 4, !tbaa !7
  %or1836.i = call i32 @llvm.fshr.i32(i32 %2265, i32 %2265, i32 %2258) #7
  br label %cleanup.cont1854.i

sw.bb1837.i:                                      ; preds = %cleanup.cont1807.i
  %2266 = load i32, i32* %add.ptr1818.i, align 4, !tbaa !7
  %or1844.i = call i32 @llvm.fshl.i32(i32 %2266, i32 %2266, i32 %2258) #7
  br label %cleanup.cont1854.i

sw.bb1845.i:                                      ; preds = %cleanup.cont1807.i
  %2267 = load i32, i32* %add.ptr1818.i, align 4, !tbaa !7
  %xor1846.i = xor i32 %2267, %2258
  br label %cleanup.cont1854.i

sw.default1848.i:                                 ; preds = %cleanup.cont1807.i
  unreachable

cleanup.cont1854.i:                               ; preds = %sw.bb1845.i, %sw.bb1837.i, %sw.bb1829.i, %sw.bb1827.i, %sw.bb1823.i, %sw.bb1821.i
  %xor1846.i.sink = phi i32 [ %xor1846.i, %sw.bb1845.i ], [ %or1844.i, %sw.bb1837.i ], [ %or1836.i, %sw.bb1829.i ], [ %sub1828.i, %sw.bb1827.i ], [ %add1826.i, %sw.bb1823.i ], [ %mul1822.i, %sw.bb1821.i ]
  store i32 %xor1846.i.sink, i32* %add.ptr1818.i, align 4, !tbaa !7
  %2268 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 40, i32 1), align 1, !tbaa !17
  %idxprom1860.i = zext i8 %2268 to i32
  %arrayidx1861.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1860.i
  %2269 = load i32, i32* %arrayidx1861.i, align 4, !tbaa !7
  %2270 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 40, i32 0), align 16, !tbaa !16
  %conv1864.i = zext i8 %2270 to i32
  %add.ptr1865.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1864.i
  %2271 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 40, i32 2), align 2, !tbaa !14
  switch i8 %2271, label %sw.default1895.i [
    i8 0, label %sw.bb1868.i
    i8 1, label %sw.bb1870.i
    i8 2, label %sw.bb1874.i
    i8 3, label %sw.bb1876.i
    i8 4, label %sw.bb1884.i
    i8 5, label %sw.bb1892.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1868.i:                                      ; preds = %cleanup.cont1854.i
  %2272 = load i32, i32* %add.ptr1865.i, align 4, !tbaa !7
  %mul1869.i = mul i32 %2272, %2269
  br label %cleanup.cont1901.i

sw.bb1870.i:                                      ; preds = %cleanup.cont1854.i
  %2273 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 40, i32 3), align 4, !tbaa !18
  %add1872.i = add i32 %2273, %2269
  %2274 = load i32, i32* %add.ptr1865.i, align 4, !tbaa !7
  %add1873.i = add i32 %add1872.i, %2274
  br label %cleanup.cont1901.i

sw.bb1874.i:                                      ; preds = %cleanup.cont1854.i
  %2275 = load i32, i32* %add.ptr1865.i, align 4, !tbaa !7
  %sub1875.i = sub i32 %2275, %2269
  br label %cleanup.cont1901.i

sw.bb1876.i:                                      ; preds = %cleanup.cont1854.i
  %2276 = load i32, i32* %add.ptr1865.i, align 4, !tbaa !7
  %or1883.i = call i32 @llvm.fshr.i32(i32 %2276, i32 %2276, i32 %2269) #7
  br label %cleanup.cont1901.i

sw.bb1884.i:                                      ; preds = %cleanup.cont1854.i
  %2277 = load i32, i32* %add.ptr1865.i, align 4, !tbaa !7
  %or1891.i = call i32 @llvm.fshl.i32(i32 %2277, i32 %2277, i32 %2269) #7
  br label %cleanup.cont1901.i

sw.bb1892.i:                                      ; preds = %cleanup.cont1854.i
  %2278 = load i32, i32* %add.ptr1865.i, align 4, !tbaa !7
  %xor1893.i = xor i32 %2278, %2269
  br label %cleanup.cont1901.i

sw.default1895.i:                                 ; preds = %cleanup.cont1854.i
  unreachable

cleanup.cont1901.i:                               ; preds = %sw.bb1892.i, %sw.bb1884.i, %sw.bb1876.i, %sw.bb1874.i, %sw.bb1870.i, %sw.bb1868.i
  %xor1893.i.sink = phi i32 [ %xor1893.i, %sw.bb1892.i ], [ %or1891.i, %sw.bb1884.i ], [ %or1883.i, %sw.bb1876.i ], [ %sub1875.i, %sw.bb1874.i ], [ %add1873.i, %sw.bb1870.i ], [ %mul1869.i, %sw.bb1868.i ]
  store i32 %xor1893.i.sink, i32* %add.ptr1865.i, align 4, !tbaa !7
  %2279 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 41, i32 1), align 1, !tbaa !17
  %idxprom1907.i = zext i8 %2279 to i32
  %arrayidx1908.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1907.i
  %2280 = load i32, i32* %arrayidx1908.i, align 4, !tbaa !7
  %2281 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 41, i32 0), align 8, !tbaa !16
  %conv1911.i = zext i8 %2281 to i32
  %add.ptr1912.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1911.i
  %2282 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 41, i32 2), align 2, !tbaa !14
  switch i8 %2282, label %sw.default1942.i [
    i8 0, label %sw.bb1915.i
    i8 1, label %sw.bb1917.i
    i8 2, label %sw.bb1921.i
    i8 3, label %sw.bb1923.i
    i8 4, label %sw.bb1931.i
    i8 5, label %sw.bb1939.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1915.i:                                      ; preds = %cleanup.cont1901.i
  %2283 = load i32, i32* %add.ptr1912.i, align 4, !tbaa !7
  %mul1916.i = mul i32 %2283, %2280
  br label %cleanup.cont1948.i

sw.bb1917.i:                                      ; preds = %cleanup.cont1901.i
  %2284 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 41, i32 3), align 4, !tbaa !18
  %add1919.i = add i32 %2284, %2280
  %2285 = load i32, i32* %add.ptr1912.i, align 4, !tbaa !7
  %add1920.i = add i32 %add1919.i, %2285
  br label %cleanup.cont1948.i

sw.bb1921.i:                                      ; preds = %cleanup.cont1901.i
  %2286 = load i32, i32* %add.ptr1912.i, align 4, !tbaa !7
  %sub1922.i = sub i32 %2286, %2280
  br label %cleanup.cont1948.i

sw.bb1923.i:                                      ; preds = %cleanup.cont1901.i
  %2287 = load i32, i32* %add.ptr1912.i, align 4, !tbaa !7
  %or1930.i = call i32 @llvm.fshr.i32(i32 %2287, i32 %2287, i32 %2280) #7
  br label %cleanup.cont1948.i

sw.bb1931.i:                                      ; preds = %cleanup.cont1901.i
  %2288 = load i32, i32* %add.ptr1912.i, align 4, !tbaa !7
  %or1938.i = call i32 @llvm.fshl.i32(i32 %2288, i32 %2288, i32 %2280) #7
  br label %cleanup.cont1948.i

sw.bb1939.i:                                      ; preds = %cleanup.cont1901.i
  %2289 = load i32, i32* %add.ptr1912.i, align 4, !tbaa !7
  %xor1940.i = xor i32 %2289, %2280
  br label %cleanup.cont1948.i

sw.default1942.i:                                 ; preds = %cleanup.cont1901.i
  unreachable

cleanup.cont1948.i:                               ; preds = %sw.bb1939.i, %sw.bb1931.i, %sw.bb1923.i, %sw.bb1921.i, %sw.bb1917.i, %sw.bb1915.i
  %xor1940.i.sink = phi i32 [ %xor1940.i, %sw.bb1939.i ], [ %or1938.i, %sw.bb1931.i ], [ %or1930.i, %sw.bb1923.i ], [ %sub1922.i, %sw.bb1921.i ], [ %add1920.i, %sw.bb1917.i ], [ %mul1916.i, %sw.bb1915.i ]
  store i32 %xor1940.i.sink, i32* %add.ptr1912.i, align 4, !tbaa !7
  %2290 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 42, i32 1), align 1, !tbaa !17
  %idxprom1954.i = zext i8 %2290 to i32
  %arrayidx1955.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom1954.i
  %2291 = load i32, i32* %arrayidx1955.i, align 4, !tbaa !7
  %2292 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 42, i32 0), align 16, !tbaa !16
  %conv1958.i = zext i8 %2292 to i32
  %add.ptr1959.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv1958.i
  %2293 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 42, i32 2), align 2, !tbaa !14
  switch i8 %2293, label %sw.default1989.i [
    i8 0, label %sw.bb1962.i
    i8 1, label %sw.bb1964.i
    i8 2, label %sw.bb1968.i
    i8 3, label %sw.bb1970.i
    i8 4, label %sw.bb1978.i
    i8 5, label %sw.bb1986.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb1962.i:                                      ; preds = %cleanup.cont1948.i
  %2294 = load i32, i32* %add.ptr1959.i, align 4, !tbaa !7
  %mul1963.i = mul i32 %2294, %2291
  br label %cleanup.cont1995.i

sw.bb1964.i:                                      ; preds = %cleanup.cont1948.i
  %2295 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 42, i32 3), align 4, !tbaa !18
  %add1966.i = add i32 %2295, %2291
  %2296 = load i32, i32* %add.ptr1959.i, align 4, !tbaa !7
  %add1967.i = add i32 %add1966.i, %2296
  br label %cleanup.cont1995.i

sw.bb1968.i:                                      ; preds = %cleanup.cont1948.i
  %2297 = load i32, i32* %add.ptr1959.i, align 4, !tbaa !7
  %sub1969.i = sub i32 %2297, %2291
  br label %cleanup.cont1995.i

sw.bb1970.i:                                      ; preds = %cleanup.cont1948.i
  %2298 = load i32, i32* %add.ptr1959.i, align 4, !tbaa !7
  %or1977.i = call i32 @llvm.fshr.i32(i32 %2298, i32 %2298, i32 %2291) #7
  br label %cleanup.cont1995.i

sw.bb1978.i:                                      ; preds = %cleanup.cont1948.i
  %2299 = load i32, i32* %add.ptr1959.i, align 4, !tbaa !7
  %or1985.i = call i32 @llvm.fshl.i32(i32 %2299, i32 %2299, i32 %2291) #7
  br label %cleanup.cont1995.i

sw.bb1986.i:                                      ; preds = %cleanup.cont1948.i
  %2300 = load i32, i32* %add.ptr1959.i, align 4, !tbaa !7
  %xor1987.i = xor i32 %2300, %2291
  br label %cleanup.cont1995.i

sw.default1989.i:                                 ; preds = %cleanup.cont1948.i
  unreachable

cleanup.cont1995.i:                               ; preds = %sw.bb1986.i, %sw.bb1978.i, %sw.bb1970.i, %sw.bb1968.i, %sw.bb1964.i, %sw.bb1962.i
  %xor1987.i.sink = phi i32 [ %xor1987.i, %sw.bb1986.i ], [ %or1985.i, %sw.bb1978.i ], [ %or1977.i, %sw.bb1970.i ], [ %sub1969.i, %sw.bb1968.i ], [ %add1967.i, %sw.bb1964.i ], [ %mul1963.i, %sw.bb1962.i ]
  store i32 %xor1987.i.sink, i32* %add.ptr1959.i, align 4, !tbaa !7
  %2301 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 43, i32 1), align 1, !tbaa !17
  %idxprom2001.i = zext i8 %2301 to i32
  %arrayidx2002.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2001.i
  %2302 = load i32, i32* %arrayidx2002.i, align 4, !tbaa !7
  %2303 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 43, i32 0), align 8, !tbaa !16
  %conv2005.i = zext i8 %2303 to i32
  %add.ptr2006.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2005.i
  %2304 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 43, i32 2), align 2, !tbaa !14
  switch i8 %2304, label %sw.default2036.i [
    i8 0, label %sw.bb2009.i
    i8 1, label %sw.bb2011.i
    i8 2, label %sw.bb2015.i
    i8 3, label %sw.bb2017.i
    i8 4, label %sw.bb2025.i
    i8 5, label %sw.bb2033.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2009.i:                                      ; preds = %cleanup.cont1995.i
  %2305 = load i32, i32* %add.ptr2006.i, align 4, !tbaa !7
  %mul2010.i = mul i32 %2305, %2302
  br label %cleanup.cont2042.i

sw.bb2011.i:                                      ; preds = %cleanup.cont1995.i
  %2306 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 43, i32 3), align 4, !tbaa !18
  %add2013.i = add i32 %2306, %2302
  %2307 = load i32, i32* %add.ptr2006.i, align 4, !tbaa !7
  %add2014.i = add i32 %add2013.i, %2307
  br label %cleanup.cont2042.i

sw.bb2015.i:                                      ; preds = %cleanup.cont1995.i
  %2308 = load i32, i32* %add.ptr2006.i, align 4, !tbaa !7
  %sub2016.i = sub i32 %2308, %2302
  br label %cleanup.cont2042.i

sw.bb2017.i:                                      ; preds = %cleanup.cont1995.i
  %2309 = load i32, i32* %add.ptr2006.i, align 4, !tbaa !7
  %or2024.i = call i32 @llvm.fshr.i32(i32 %2309, i32 %2309, i32 %2302) #7
  br label %cleanup.cont2042.i

sw.bb2025.i:                                      ; preds = %cleanup.cont1995.i
  %2310 = load i32, i32* %add.ptr2006.i, align 4, !tbaa !7
  %or2032.i = call i32 @llvm.fshl.i32(i32 %2310, i32 %2310, i32 %2302) #7
  br label %cleanup.cont2042.i

sw.bb2033.i:                                      ; preds = %cleanup.cont1995.i
  %2311 = load i32, i32* %add.ptr2006.i, align 4, !tbaa !7
  %xor2034.i = xor i32 %2311, %2302
  br label %cleanup.cont2042.i

sw.default2036.i:                                 ; preds = %cleanup.cont1995.i
  unreachable

cleanup.cont2042.i:                               ; preds = %sw.bb2033.i, %sw.bb2025.i, %sw.bb2017.i, %sw.bb2015.i, %sw.bb2011.i, %sw.bb2009.i
  %xor2034.i.sink = phi i32 [ %xor2034.i, %sw.bb2033.i ], [ %or2032.i, %sw.bb2025.i ], [ %or2024.i, %sw.bb2017.i ], [ %sub2016.i, %sw.bb2015.i ], [ %add2014.i, %sw.bb2011.i ], [ %mul2010.i, %sw.bb2009.i ]
  store i32 %xor2034.i.sink, i32* %add.ptr2006.i, align 4, !tbaa !7
  %2312 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 44, i32 1), align 1, !tbaa !17
  %idxprom2048.i = zext i8 %2312 to i32
  %arrayidx2049.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2048.i
  %2313 = load i32, i32* %arrayidx2049.i, align 4, !tbaa !7
  %2314 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 44, i32 0), align 16, !tbaa !16
  %conv2052.i = zext i8 %2314 to i32
  %add.ptr2053.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2052.i
  %2315 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 44, i32 2), align 2, !tbaa !14
  switch i8 %2315, label %sw.default2083.i [
    i8 0, label %sw.bb2056.i
    i8 1, label %sw.bb2058.i
    i8 2, label %sw.bb2062.i
    i8 3, label %sw.bb2064.i
    i8 4, label %sw.bb2072.i
    i8 5, label %sw.bb2080.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2056.i:                                      ; preds = %cleanup.cont2042.i
  %2316 = load i32, i32* %add.ptr2053.i, align 4, !tbaa !7
  %mul2057.i = mul i32 %2316, %2313
  br label %cleanup.cont2089.i

sw.bb2058.i:                                      ; preds = %cleanup.cont2042.i
  %2317 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 44, i32 3), align 4, !tbaa !18
  %add2060.i = add i32 %2317, %2313
  %2318 = load i32, i32* %add.ptr2053.i, align 4, !tbaa !7
  %add2061.i = add i32 %add2060.i, %2318
  br label %cleanup.cont2089.i

sw.bb2062.i:                                      ; preds = %cleanup.cont2042.i
  %2319 = load i32, i32* %add.ptr2053.i, align 4, !tbaa !7
  %sub2063.i = sub i32 %2319, %2313
  br label %cleanup.cont2089.i

sw.bb2064.i:                                      ; preds = %cleanup.cont2042.i
  %2320 = load i32, i32* %add.ptr2053.i, align 4, !tbaa !7
  %or2071.i = call i32 @llvm.fshr.i32(i32 %2320, i32 %2320, i32 %2313) #7
  br label %cleanup.cont2089.i

sw.bb2072.i:                                      ; preds = %cleanup.cont2042.i
  %2321 = load i32, i32* %add.ptr2053.i, align 4, !tbaa !7
  %or2079.i = call i32 @llvm.fshl.i32(i32 %2321, i32 %2321, i32 %2313) #7
  br label %cleanup.cont2089.i

sw.bb2080.i:                                      ; preds = %cleanup.cont2042.i
  %2322 = load i32, i32* %add.ptr2053.i, align 4, !tbaa !7
  %xor2081.i = xor i32 %2322, %2313
  br label %cleanup.cont2089.i

sw.default2083.i:                                 ; preds = %cleanup.cont2042.i
  unreachable

cleanup.cont2089.i:                               ; preds = %sw.bb2080.i, %sw.bb2072.i, %sw.bb2064.i, %sw.bb2062.i, %sw.bb2058.i, %sw.bb2056.i
  %xor2081.i.sink = phi i32 [ %xor2081.i, %sw.bb2080.i ], [ %or2079.i, %sw.bb2072.i ], [ %or2071.i, %sw.bb2064.i ], [ %sub2063.i, %sw.bb2062.i ], [ %add2061.i, %sw.bb2058.i ], [ %mul2057.i, %sw.bb2056.i ]
  store i32 %xor2081.i.sink, i32* %add.ptr2053.i, align 4, !tbaa !7
  %2323 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 45, i32 1), align 1, !tbaa !17
  %idxprom2095.i = zext i8 %2323 to i32
  %arrayidx2096.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2095.i
  %2324 = load i32, i32* %arrayidx2096.i, align 4, !tbaa !7
  %2325 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 45, i32 0), align 8, !tbaa !16
  %conv2099.i = zext i8 %2325 to i32
  %add.ptr2100.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2099.i
  %2326 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 45, i32 2), align 2, !tbaa !14
  switch i8 %2326, label %sw.default2130.i [
    i8 0, label %sw.bb2103.i
    i8 1, label %sw.bb2105.i
    i8 2, label %sw.bb2109.i
    i8 3, label %sw.bb2111.i
    i8 4, label %sw.bb2119.i
    i8 5, label %sw.bb2127.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2103.i:                                      ; preds = %cleanup.cont2089.i
  %2327 = load i32, i32* %add.ptr2100.i, align 4, !tbaa !7
  %mul2104.i = mul i32 %2327, %2324
  br label %cleanup.cont2136.i

sw.bb2105.i:                                      ; preds = %cleanup.cont2089.i
  %2328 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 45, i32 3), align 4, !tbaa !18
  %add2107.i = add i32 %2328, %2324
  %2329 = load i32, i32* %add.ptr2100.i, align 4, !tbaa !7
  %add2108.i = add i32 %add2107.i, %2329
  br label %cleanup.cont2136.i

sw.bb2109.i:                                      ; preds = %cleanup.cont2089.i
  %2330 = load i32, i32* %add.ptr2100.i, align 4, !tbaa !7
  %sub2110.i = sub i32 %2330, %2324
  br label %cleanup.cont2136.i

sw.bb2111.i:                                      ; preds = %cleanup.cont2089.i
  %2331 = load i32, i32* %add.ptr2100.i, align 4, !tbaa !7
  %or2118.i = call i32 @llvm.fshr.i32(i32 %2331, i32 %2331, i32 %2324) #7
  br label %cleanup.cont2136.i

sw.bb2119.i:                                      ; preds = %cleanup.cont2089.i
  %2332 = load i32, i32* %add.ptr2100.i, align 4, !tbaa !7
  %or2126.i = call i32 @llvm.fshl.i32(i32 %2332, i32 %2332, i32 %2324) #7
  br label %cleanup.cont2136.i

sw.bb2127.i:                                      ; preds = %cleanup.cont2089.i
  %2333 = load i32, i32* %add.ptr2100.i, align 4, !tbaa !7
  %xor2128.i = xor i32 %2333, %2324
  br label %cleanup.cont2136.i

sw.default2130.i:                                 ; preds = %cleanup.cont2089.i
  unreachable

cleanup.cont2136.i:                               ; preds = %sw.bb2127.i, %sw.bb2119.i, %sw.bb2111.i, %sw.bb2109.i, %sw.bb2105.i, %sw.bb2103.i
  %xor2128.i.sink = phi i32 [ %xor2128.i, %sw.bb2127.i ], [ %or2126.i, %sw.bb2119.i ], [ %or2118.i, %sw.bb2111.i ], [ %sub2110.i, %sw.bb2109.i ], [ %add2108.i, %sw.bb2105.i ], [ %mul2104.i, %sw.bb2103.i ]
  store i32 %xor2128.i.sink, i32* %add.ptr2100.i, align 4, !tbaa !7
  %2334 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 46, i32 1), align 1, !tbaa !17
  %idxprom2142.i = zext i8 %2334 to i32
  %arrayidx2143.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2142.i
  %2335 = load i32, i32* %arrayidx2143.i, align 4, !tbaa !7
  %2336 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 46, i32 0), align 16, !tbaa !16
  %conv2146.i = zext i8 %2336 to i32
  %add.ptr2147.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2146.i
  %2337 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 46, i32 2), align 2, !tbaa !14
  switch i8 %2337, label %sw.default2177.i [
    i8 0, label %sw.bb2150.i
    i8 1, label %sw.bb2152.i
    i8 2, label %sw.bb2156.i
    i8 3, label %sw.bb2158.i
    i8 4, label %sw.bb2166.i
    i8 5, label %sw.bb2174.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2150.i:                                      ; preds = %cleanup.cont2136.i
  %2338 = load i32, i32* %add.ptr2147.i, align 4, !tbaa !7
  %mul2151.i = mul i32 %2338, %2335
  br label %cleanup.cont2183.i

sw.bb2152.i:                                      ; preds = %cleanup.cont2136.i
  %2339 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 46, i32 3), align 4, !tbaa !18
  %add2154.i = add i32 %2339, %2335
  %2340 = load i32, i32* %add.ptr2147.i, align 4, !tbaa !7
  %add2155.i = add i32 %add2154.i, %2340
  br label %cleanup.cont2183.i

sw.bb2156.i:                                      ; preds = %cleanup.cont2136.i
  %2341 = load i32, i32* %add.ptr2147.i, align 4, !tbaa !7
  %sub2157.i = sub i32 %2341, %2335
  br label %cleanup.cont2183.i

sw.bb2158.i:                                      ; preds = %cleanup.cont2136.i
  %2342 = load i32, i32* %add.ptr2147.i, align 4, !tbaa !7
  %or2165.i = call i32 @llvm.fshr.i32(i32 %2342, i32 %2342, i32 %2335) #7
  br label %cleanup.cont2183.i

sw.bb2166.i:                                      ; preds = %cleanup.cont2136.i
  %2343 = load i32, i32* %add.ptr2147.i, align 4, !tbaa !7
  %or2173.i = call i32 @llvm.fshl.i32(i32 %2343, i32 %2343, i32 %2335) #7
  br label %cleanup.cont2183.i

sw.bb2174.i:                                      ; preds = %cleanup.cont2136.i
  %2344 = load i32, i32* %add.ptr2147.i, align 4, !tbaa !7
  %xor2175.i = xor i32 %2344, %2335
  br label %cleanup.cont2183.i

sw.default2177.i:                                 ; preds = %cleanup.cont2136.i
  unreachable

cleanup.cont2183.i:                               ; preds = %sw.bb2174.i, %sw.bb2166.i, %sw.bb2158.i, %sw.bb2156.i, %sw.bb2152.i, %sw.bb2150.i
  %xor2175.i.sink = phi i32 [ %xor2175.i, %sw.bb2174.i ], [ %or2173.i, %sw.bb2166.i ], [ %or2165.i, %sw.bb2158.i ], [ %sub2157.i, %sw.bb2156.i ], [ %add2155.i, %sw.bb2152.i ], [ %mul2151.i, %sw.bb2150.i ]
  store i32 %xor2175.i.sink, i32* %add.ptr2147.i, align 4, !tbaa !7
  %2345 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 47, i32 1), align 1, !tbaa !17
  %idxprom2189.i = zext i8 %2345 to i32
  %arrayidx2190.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2189.i
  %2346 = load i32, i32* %arrayidx2190.i, align 4, !tbaa !7
  %2347 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 47, i32 0), align 8, !tbaa !16
  %conv2193.i = zext i8 %2347 to i32
  %add.ptr2194.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2193.i
  %2348 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 47, i32 2), align 2, !tbaa !14
  switch i8 %2348, label %sw.default2224.i [
    i8 0, label %sw.bb2197.i
    i8 1, label %sw.bb2199.i
    i8 2, label %sw.bb2203.i
    i8 3, label %sw.bb2205.i
    i8 4, label %sw.bb2213.i
    i8 5, label %sw.bb2221.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2197.i:                                      ; preds = %cleanup.cont2183.i
  %2349 = load i32, i32* %add.ptr2194.i, align 4, !tbaa !7
  %mul2198.i = mul i32 %2349, %2346
  br label %cleanup.cont2230.i

sw.bb2199.i:                                      ; preds = %cleanup.cont2183.i
  %2350 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 47, i32 3), align 4, !tbaa !18
  %add2201.i = add i32 %2350, %2346
  %2351 = load i32, i32* %add.ptr2194.i, align 4, !tbaa !7
  %add2202.i = add i32 %add2201.i, %2351
  br label %cleanup.cont2230.i

sw.bb2203.i:                                      ; preds = %cleanup.cont2183.i
  %2352 = load i32, i32* %add.ptr2194.i, align 4, !tbaa !7
  %sub2204.i = sub i32 %2352, %2346
  br label %cleanup.cont2230.i

sw.bb2205.i:                                      ; preds = %cleanup.cont2183.i
  %2353 = load i32, i32* %add.ptr2194.i, align 4, !tbaa !7
  %or2212.i = call i32 @llvm.fshr.i32(i32 %2353, i32 %2353, i32 %2346) #7
  br label %cleanup.cont2230.i

sw.bb2213.i:                                      ; preds = %cleanup.cont2183.i
  %2354 = load i32, i32* %add.ptr2194.i, align 4, !tbaa !7
  %or2220.i = call i32 @llvm.fshl.i32(i32 %2354, i32 %2354, i32 %2346) #7
  br label %cleanup.cont2230.i

sw.bb2221.i:                                      ; preds = %cleanup.cont2183.i
  %2355 = load i32, i32* %add.ptr2194.i, align 4, !tbaa !7
  %xor2222.i = xor i32 %2355, %2346
  br label %cleanup.cont2230.i

sw.default2224.i:                                 ; preds = %cleanup.cont2183.i
  unreachable

cleanup.cont2230.i:                               ; preds = %sw.bb2221.i, %sw.bb2213.i, %sw.bb2205.i, %sw.bb2203.i, %sw.bb2199.i, %sw.bb2197.i
  %xor2222.i.sink = phi i32 [ %xor2222.i, %sw.bb2221.i ], [ %or2220.i, %sw.bb2213.i ], [ %or2212.i, %sw.bb2205.i ], [ %sub2204.i, %sw.bb2203.i ], [ %add2202.i, %sw.bb2199.i ], [ %mul2198.i, %sw.bb2197.i ]
  store i32 %xor2222.i.sink, i32* %add.ptr2194.i, align 4, !tbaa !7
  %2356 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 48, i32 1), align 1, !tbaa !17
  %idxprom2236.i = zext i8 %2356 to i32
  %arrayidx2237.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2236.i
  %2357 = load i32, i32* %arrayidx2237.i, align 4, !tbaa !7
  %2358 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 48, i32 0), align 16, !tbaa !16
  %conv2240.i = zext i8 %2358 to i32
  %add.ptr2241.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2240.i
  %2359 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 48, i32 2), align 2, !tbaa !14
  switch i8 %2359, label %sw.default2271.i [
    i8 0, label %sw.bb2244.i
    i8 1, label %sw.bb2246.i
    i8 2, label %sw.bb2250.i
    i8 3, label %sw.bb2252.i
    i8 4, label %sw.bb2260.i
    i8 5, label %sw.bb2268.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2244.i:                                      ; preds = %cleanup.cont2230.i
  %2360 = load i32, i32* %add.ptr2241.i, align 4, !tbaa !7
  %mul2245.i = mul i32 %2360, %2357
  br label %cleanup.cont2277.i

sw.bb2246.i:                                      ; preds = %cleanup.cont2230.i
  %2361 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 48, i32 3), align 4, !tbaa !18
  %add2248.i = add i32 %2361, %2357
  %2362 = load i32, i32* %add.ptr2241.i, align 4, !tbaa !7
  %add2249.i = add i32 %add2248.i, %2362
  br label %cleanup.cont2277.i

sw.bb2250.i:                                      ; preds = %cleanup.cont2230.i
  %2363 = load i32, i32* %add.ptr2241.i, align 4, !tbaa !7
  %sub2251.i = sub i32 %2363, %2357
  br label %cleanup.cont2277.i

sw.bb2252.i:                                      ; preds = %cleanup.cont2230.i
  %2364 = load i32, i32* %add.ptr2241.i, align 4, !tbaa !7
  %or2259.i = call i32 @llvm.fshr.i32(i32 %2364, i32 %2364, i32 %2357) #7
  br label %cleanup.cont2277.i

sw.bb2260.i:                                      ; preds = %cleanup.cont2230.i
  %2365 = load i32, i32* %add.ptr2241.i, align 4, !tbaa !7
  %or2267.i = call i32 @llvm.fshl.i32(i32 %2365, i32 %2365, i32 %2357) #7
  br label %cleanup.cont2277.i

sw.bb2268.i:                                      ; preds = %cleanup.cont2230.i
  %2366 = load i32, i32* %add.ptr2241.i, align 4, !tbaa !7
  %xor2269.i = xor i32 %2366, %2357
  br label %cleanup.cont2277.i

sw.default2271.i:                                 ; preds = %cleanup.cont2230.i
  unreachable

cleanup.cont2277.i:                               ; preds = %sw.bb2268.i, %sw.bb2260.i, %sw.bb2252.i, %sw.bb2250.i, %sw.bb2246.i, %sw.bb2244.i
  %xor2269.i.sink = phi i32 [ %xor2269.i, %sw.bb2268.i ], [ %or2267.i, %sw.bb2260.i ], [ %or2259.i, %sw.bb2252.i ], [ %sub2251.i, %sw.bb2250.i ], [ %add2249.i, %sw.bb2246.i ], [ %mul2245.i, %sw.bb2244.i ]
  store i32 %xor2269.i.sink, i32* %add.ptr2241.i, align 4, !tbaa !7
  %2367 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 49, i32 1), align 1, !tbaa !17
  %idxprom2283.i = zext i8 %2367 to i32
  %arrayidx2284.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2283.i
  %2368 = load i32, i32* %arrayidx2284.i, align 4, !tbaa !7
  %2369 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 49, i32 0), align 8, !tbaa !16
  %conv2287.i = zext i8 %2369 to i32
  %add.ptr2288.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2287.i
  %2370 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 49, i32 2), align 2, !tbaa !14
  switch i8 %2370, label %sw.default2318.i [
    i8 0, label %sw.bb2291.i
    i8 1, label %sw.bb2293.i
    i8 2, label %sw.bb2297.i
    i8 3, label %sw.bb2299.i
    i8 4, label %sw.bb2307.i
    i8 5, label %sw.bb2315.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2291.i:                                      ; preds = %cleanup.cont2277.i
  %2371 = load i32, i32* %add.ptr2288.i, align 4, !tbaa !7
  %mul2292.i = mul i32 %2371, %2368
  br label %cleanup.cont2324.i

sw.bb2293.i:                                      ; preds = %cleanup.cont2277.i
  %2372 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 49, i32 3), align 4, !tbaa !18
  %add2295.i = add i32 %2372, %2368
  %2373 = load i32, i32* %add.ptr2288.i, align 4, !tbaa !7
  %add2296.i = add i32 %add2295.i, %2373
  br label %cleanup.cont2324.i

sw.bb2297.i:                                      ; preds = %cleanup.cont2277.i
  %2374 = load i32, i32* %add.ptr2288.i, align 4, !tbaa !7
  %sub2298.i = sub i32 %2374, %2368
  br label %cleanup.cont2324.i

sw.bb2299.i:                                      ; preds = %cleanup.cont2277.i
  %2375 = load i32, i32* %add.ptr2288.i, align 4, !tbaa !7
  %or2306.i = call i32 @llvm.fshr.i32(i32 %2375, i32 %2375, i32 %2368) #7
  br label %cleanup.cont2324.i

sw.bb2307.i:                                      ; preds = %cleanup.cont2277.i
  %2376 = load i32, i32* %add.ptr2288.i, align 4, !tbaa !7
  %or2314.i = call i32 @llvm.fshl.i32(i32 %2376, i32 %2376, i32 %2368) #7
  br label %cleanup.cont2324.i

sw.bb2315.i:                                      ; preds = %cleanup.cont2277.i
  %2377 = load i32, i32* %add.ptr2288.i, align 4, !tbaa !7
  %xor2316.i = xor i32 %2377, %2368
  br label %cleanup.cont2324.i

sw.default2318.i:                                 ; preds = %cleanup.cont2277.i
  unreachable

cleanup.cont2324.i:                               ; preds = %sw.bb2315.i, %sw.bb2307.i, %sw.bb2299.i, %sw.bb2297.i, %sw.bb2293.i, %sw.bb2291.i
  %xor2316.i.sink = phi i32 [ %xor2316.i, %sw.bb2315.i ], [ %or2314.i, %sw.bb2307.i ], [ %or2306.i, %sw.bb2299.i ], [ %sub2298.i, %sw.bb2297.i ], [ %add2296.i, %sw.bb2293.i ], [ %mul2292.i, %sw.bb2291.i ]
  store i32 %xor2316.i.sink, i32* %add.ptr2288.i, align 4, !tbaa !7
  %2378 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 50, i32 1), align 1, !tbaa !17
  %idxprom2330.i = zext i8 %2378 to i32
  %arrayidx2331.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2330.i
  %2379 = load i32, i32* %arrayidx2331.i, align 4, !tbaa !7
  %2380 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 50, i32 0), align 16, !tbaa !16
  %conv2334.i = zext i8 %2380 to i32
  %add.ptr2335.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2334.i
  %2381 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 50, i32 2), align 2, !tbaa !14
  switch i8 %2381, label %sw.default2365.i [
    i8 0, label %sw.bb2338.i
    i8 1, label %sw.bb2340.i
    i8 2, label %sw.bb2344.i
    i8 3, label %sw.bb2346.i
    i8 4, label %sw.bb2354.i
    i8 5, label %sw.bb2362.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2338.i:                                      ; preds = %cleanup.cont2324.i
  %2382 = load i32, i32* %add.ptr2335.i, align 4, !tbaa !7
  %mul2339.i = mul i32 %2382, %2379
  br label %cleanup.cont2371.i

sw.bb2340.i:                                      ; preds = %cleanup.cont2324.i
  %2383 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 50, i32 3), align 4, !tbaa !18
  %add2342.i = add i32 %2383, %2379
  %2384 = load i32, i32* %add.ptr2335.i, align 4, !tbaa !7
  %add2343.i = add i32 %add2342.i, %2384
  br label %cleanup.cont2371.i

sw.bb2344.i:                                      ; preds = %cleanup.cont2324.i
  %2385 = load i32, i32* %add.ptr2335.i, align 4, !tbaa !7
  %sub2345.i = sub i32 %2385, %2379
  br label %cleanup.cont2371.i

sw.bb2346.i:                                      ; preds = %cleanup.cont2324.i
  %2386 = load i32, i32* %add.ptr2335.i, align 4, !tbaa !7
  %or2353.i = call i32 @llvm.fshr.i32(i32 %2386, i32 %2386, i32 %2379) #7
  br label %cleanup.cont2371.i

sw.bb2354.i:                                      ; preds = %cleanup.cont2324.i
  %2387 = load i32, i32* %add.ptr2335.i, align 4, !tbaa !7
  %or2361.i = call i32 @llvm.fshl.i32(i32 %2387, i32 %2387, i32 %2379) #7
  br label %cleanup.cont2371.i

sw.bb2362.i:                                      ; preds = %cleanup.cont2324.i
  %2388 = load i32, i32* %add.ptr2335.i, align 4, !tbaa !7
  %xor2363.i = xor i32 %2388, %2379
  br label %cleanup.cont2371.i

sw.default2365.i:                                 ; preds = %cleanup.cont2324.i
  unreachable

cleanup.cont2371.i:                               ; preds = %sw.bb2362.i, %sw.bb2354.i, %sw.bb2346.i, %sw.bb2344.i, %sw.bb2340.i, %sw.bb2338.i
  %xor2363.i.sink = phi i32 [ %xor2363.i, %sw.bb2362.i ], [ %or2361.i, %sw.bb2354.i ], [ %or2353.i, %sw.bb2346.i ], [ %sub2345.i, %sw.bb2344.i ], [ %add2343.i, %sw.bb2340.i ], [ %mul2339.i, %sw.bb2338.i ]
  store i32 %xor2363.i.sink, i32* %add.ptr2335.i, align 4, !tbaa !7
  %2389 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 51, i32 1), align 1, !tbaa !17
  %idxprom2377.i = zext i8 %2389 to i32
  %arrayidx2378.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2377.i
  %2390 = load i32, i32* %arrayidx2378.i, align 4, !tbaa !7
  %2391 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 51, i32 0), align 8, !tbaa !16
  %conv2381.i = zext i8 %2391 to i32
  %add.ptr2382.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2381.i
  %2392 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 51, i32 2), align 2, !tbaa !14
  switch i8 %2392, label %sw.default2412.i [
    i8 0, label %sw.bb2385.i
    i8 1, label %sw.bb2387.i
    i8 2, label %sw.bb2391.i
    i8 3, label %sw.bb2393.i
    i8 4, label %sw.bb2401.i
    i8 5, label %sw.bb2409.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2385.i:                                      ; preds = %cleanup.cont2371.i
  %2393 = load i32, i32* %add.ptr2382.i, align 4, !tbaa !7
  %mul2386.i = mul i32 %2393, %2390
  br label %cleanup.cont2418.i

sw.bb2387.i:                                      ; preds = %cleanup.cont2371.i
  %2394 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 51, i32 3), align 4, !tbaa !18
  %add2389.i = add i32 %2394, %2390
  %2395 = load i32, i32* %add.ptr2382.i, align 4, !tbaa !7
  %add2390.i = add i32 %add2389.i, %2395
  br label %cleanup.cont2418.i

sw.bb2391.i:                                      ; preds = %cleanup.cont2371.i
  %2396 = load i32, i32* %add.ptr2382.i, align 4, !tbaa !7
  %sub2392.i = sub i32 %2396, %2390
  br label %cleanup.cont2418.i

sw.bb2393.i:                                      ; preds = %cleanup.cont2371.i
  %2397 = load i32, i32* %add.ptr2382.i, align 4, !tbaa !7
  %or2400.i = call i32 @llvm.fshr.i32(i32 %2397, i32 %2397, i32 %2390) #7
  br label %cleanup.cont2418.i

sw.bb2401.i:                                      ; preds = %cleanup.cont2371.i
  %2398 = load i32, i32* %add.ptr2382.i, align 4, !tbaa !7
  %or2408.i = call i32 @llvm.fshl.i32(i32 %2398, i32 %2398, i32 %2390) #7
  br label %cleanup.cont2418.i

sw.bb2409.i:                                      ; preds = %cleanup.cont2371.i
  %2399 = load i32, i32* %add.ptr2382.i, align 4, !tbaa !7
  %xor2410.i = xor i32 %2399, %2390
  br label %cleanup.cont2418.i

sw.default2412.i:                                 ; preds = %cleanup.cont2371.i
  unreachable

cleanup.cont2418.i:                               ; preds = %sw.bb2409.i, %sw.bb2401.i, %sw.bb2393.i, %sw.bb2391.i, %sw.bb2387.i, %sw.bb2385.i
  %xor2410.i.sink = phi i32 [ %xor2410.i, %sw.bb2409.i ], [ %or2408.i, %sw.bb2401.i ], [ %or2400.i, %sw.bb2393.i ], [ %sub2392.i, %sw.bb2391.i ], [ %add2390.i, %sw.bb2387.i ], [ %mul2386.i, %sw.bb2385.i ]
  store i32 %xor2410.i.sink, i32* %add.ptr2382.i, align 4, !tbaa !7
  %2400 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 52, i32 1), align 1, !tbaa !17
  %idxprom2424.i = zext i8 %2400 to i32
  %arrayidx2425.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2424.i
  %2401 = load i32, i32* %arrayidx2425.i, align 4, !tbaa !7
  %2402 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 52, i32 0), align 16, !tbaa !16
  %conv2428.i = zext i8 %2402 to i32
  %add.ptr2429.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2428.i
  %2403 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 52, i32 2), align 2, !tbaa !14
  switch i8 %2403, label %sw.default2459.i [
    i8 0, label %sw.bb2432.i
    i8 1, label %sw.bb2434.i
    i8 2, label %sw.bb2438.i
    i8 3, label %sw.bb2440.i
    i8 4, label %sw.bb2448.i
    i8 5, label %sw.bb2456.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2432.i:                                      ; preds = %cleanup.cont2418.i
  %2404 = load i32, i32* %add.ptr2429.i, align 4, !tbaa !7
  %mul2433.i = mul i32 %2404, %2401
  br label %cleanup.cont2465.i

sw.bb2434.i:                                      ; preds = %cleanup.cont2418.i
  %2405 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 52, i32 3), align 4, !tbaa !18
  %add2436.i = add i32 %2405, %2401
  %2406 = load i32, i32* %add.ptr2429.i, align 4, !tbaa !7
  %add2437.i = add i32 %add2436.i, %2406
  br label %cleanup.cont2465.i

sw.bb2438.i:                                      ; preds = %cleanup.cont2418.i
  %2407 = load i32, i32* %add.ptr2429.i, align 4, !tbaa !7
  %sub2439.i = sub i32 %2407, %2401
  br label %cleanup.cont2465.i

sw.bb2440.i:                                      ; preds = %cleanup.cont2418.i
  %2408 = load i32, i32* %add.ptr2429.i, align 4, !tbaa !7
  %or2447.i = call i32 @llvm.fshr.i32(i32 %2408, i32 %2408, i32 %2401) #7
  br label %cleanup.cont2465.i

sw.bb2448.i:                                      ; preds = %cleanup.cont2418.i
  %2409 = load i32, i32* %add.ptr2429.i, align 4, !tbaa !7
  %or2455.i = call i32 @llvm.fshl.i32(i32 %2409, i32 %2409, i32 %2401) #7
  br label %cleanup.cont2465.i

sw.bb2456.i:                                      ; preds = %cleanup.cont2418.i
  %2410 = load i32, i32* %add.ptr2429.i, align 4, !tbaa !7
  %xor2457.i = xor i32 %2410, %2401
  br label %cleanup.cont2465.i

sw.default2459.i:                                 ; preds = %cleanup.cont2418.i
  unreachable

cleanup.cont2465.i:                               ; preds = %sw.bb2456.i, %sw.bb2448.i, %sw.bb2440.i, %sw.bb2438.i, %sw.bb2434.i, %sw.bb2432.i
  %xor2457.i.sink = phi i32 [ %xor2457.i, %sw.bb2456.i ], [ %or2455.i, %sw.bb2448.i ], [ %or2447.i, %sw.bb2440.i ], [ %sub2439.i, %sw.bb2438.i ], [ %add2437.i, %sw.bb2434.i ], [ %mul2433.i, %sw.bb2432.i ]
  store i32 %xor2457.i.sink, i32* %add.ptr2429.i, align 4, !tbaa !7
  %2411 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 53, i32 1), align 1, !tbaa !17
  %idxprom2471.i = zext i8 %2411 to i32
  %arrayidx2472.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2471.i
  %2412 = load i32, i32* %arrayidx2472.i, align 4, !tbaa !7
  %2413 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 53, i32 0), align 8, !tbaa !16
  %conv2475.i = zext i8 %2413 to i32
  %add.ptr2476.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2475.i
  %2414 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 53, i32 2), align 2, !tbaa !14
  switch i8 %2414, label %sw.default2506.i [
    i8 0, label %sw.bb2479.i
    i8 1, label %sw.bb2481.i
    i8 2, label %sw.bb2485.i
    i8 3, label %sw.bb2487.i
    i8 4, label %sw.bb2495.i
    i8 5, label %sw.bb2503.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2479.i:                                      ; preds = %cleanup.cont2465.i
  %2415 = load i32, i32* %add.ptr2476.i, align 4, !tbaa !7
  %mul2480.i = mul i32 %2415, %2412
  br label %cleanup.cont2512.i

sw.bb2481.i:                                      ; preds = %cleanup.cont2465.i
  %2416 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 53, i32 3), align 4, !tbaa !18
  %add2483.i = add i32 %2416, %2412
  %2417 = load i32, i32* %add.ptr2476.i, align 4, !tbaa !7
  %add2484.i = add i32 %add2483.i, %2417
  br label %cleanup.cont2512.i

sw.bb2485.i:                                      ; preds = %cleanup.cont2465.i
  %2418 = load i32, i32* %add.ptr2476.i, align 4, !tbaa !7
  %sub2486.i = sub i32 %2418, %2412
  br label %cleanup.cont2512.i

sw.bb2487.i:                                      ; preds = %cleanup.cont2465.i
  %2419 = load i32, i32* %add.ptr2476.i, align 4, !tbaa !7
  %or2494.i = call i32 @llvm.fshr.i32(i32 %2419, i32 %2419, i32 %2412) #7
  br label %cleanup.cont2512.i

sw.bb2495.i:                                      ; preds = %cleanup.cont2465.i
  %2420 = load i32, i32* %add.ptr2476.i, align 4, !tbaa !7
  %or2502.i = call i32 @llvm.fshl.i32(i32 %2420, i32 %2420, i32 %2412) #7
  br label %cleanup.cont2512.i

sw.bb2503.i:                                      ; preds = %cleanup.cont2465.i
  %2421 = load i32, i32* %add.ptr2476.i, align 4, !tbaa !7
  %xor2504.i = xor i32 %2421, %2412
  br label %cleanup.cont2512.i

sw.default2506.i:                                 ; preds = %cleanup.cont2465.i
  unreachable

cleanup.cont2512.i:                               ; preds = %sw.bb2503.i, %sw.bb2495.i, %sw.bb2487.i, %sw.bb2485.i, %sw.bb2481.i, %sw.bb2479.i
  %xor2504.i.sink = phi i32 [ %xor2504.i, %sw.bb2503.i ], [ %or2502.i, %sw.bb2495.i ], [ %or2494.i, %sw.bb2487.i ], [ %sub2486.i, %sw.bb2485.i ], [ %add2484.i, %sw.bb2481.i ], [ %mul2480.i, %sw.bb2479.i ]
  store i32 %xor2504.i.sink, i32* %add.ptr2476.i, align 4, !tbaa !7
  %2422 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 54, i32 1), align 1, !tbaa !17
  %idxprom2518.i = zext i8 %2422 to i32
  %arrayidx2519.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2518.i
  %2423 = load i32, i32* %arrayidx2519.i, align 4, !tbaa !7
  %2424 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 54, i32 0), align 16, !tbaa !16
  %conv2522.i = zext i8 %2424 to i32
  %add.ptr2523.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2522.i
  %2425 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 54, i32 2), align 2, !tbaa !14
  switch i8 %2425, label %sw.default2553.i [
    i8 0, label %sw.bb2526.i
    i8 1, label %sw.bb2528.i
    i8 2, label %sw.bb2532.i
    i8 3, label %sw.bb2534.i
    i8 4, label %sw.bb2542.i
    i8 5, label %sw.bb2550.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2526.i:                                      ; preds = %cleanup.cont2512.i
  %2426 = load i32, i32* %add.ptr2523.i, align 4, !tbaa !7
  %mul2527.i = mul i32 %2426, %2423
  br label %cleanup.cont2559.i

sw.bb2528.i:                                      ; preds = %cleanup.cont2512.i
  %2427 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 54, i32 3), align 4, !tbaa !18
  %add2530.i = add i32 %2427, %2423
  %2428 = load i32, i32* %add.ptr2523.i, align 4, !tbaa !7
  %add2531.i = add i32 %add2530.i, %2428
  br label %cleanup.cont2559.i

sw.bb2532.i:                                      ; preds = %cleanup.cont2512.i
  %2429 = load i32, i32* %add.ptr2523.i, align 4, !tbaa !7
  %sub2533.i = sub i32 %2429, %2423
  br label %cleanup.cont2559.i

sw.bb2534.i:                                      ; preds = %cleanup.cont2512.i
  %2430 = load i32, i32* %add.ptr2523.i, align 4, !tbaa !7
  %or2541.i = call i32 @llvm.fshr.i32(i32 %2430, i32 %2430, i32 %2423) #7
  br label %cleanup.cont2559.i

sw.bb2542.i:                                      ; preds = %cleanup.cont2512.i
  %2431 = load i32, i32* %add.ptr2523.i, align 4, !tbaa !7
  %or2549.i = call i32 @llvm.fshl.i32(i32 %2431, i32 %2431, i32 %2423) #7
  br label %cleanup.cont2559.i

sw.bb2550.i:                                      ; preds = %cleanup.cont2512.i
  %2432 = load i32, i32* %add.ptr2523.i, align 4, !tbaa !7
  %xor2551.i = xor i32 %2432, %2423
  br label %cleanup.cont2559.i

sw.default2553.i:                                 ; preds = %cleanup.cont2512.i
  unreachable

cleanup.cont2559.i:                               ; preds = %sw.bb2550.i, %sw.bb2542.i, %sw.bb2534.i, %sw.bb2532.i, %sw.bb2528.i, %sw.bb2526.i
  %xor2551.i.sink = phi i32 [ %xor2551.i, %sw.bb2550.i ], [ %or2549.i, %sw.bb2542.i ], [ %or2541.i, %sw.bb2534.i ], [ %sub2533.i, %sw.bb2532.i ], [ %add2531.i, %sw.bb2528.i ], [ %mul2527.i, %sw.bb2526.i ]
  store i32 %xor2551.i.sink, i32* %add.ptr2523.i, align 4, !tbaa !7
  %2433 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 55, i32 1), align 1, !tbaa !17
  %idxprom2565.i = zext i8 %2433 to i32
  %arrayidx2566.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2565.i
  %2434 = load i32, i32* %arrayidx2566.i, align 4, !tbaa !7
  %2435 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 55, i32 0), align 8, !tbaa !16
  %conv2569.i = zext i8 %2435 to i32
  %add.ptr2570.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2569.i
  %2436 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 55, i32 2), align 2, !tbaa !14
  switch i8 %2436, label %sw.default2600.i [
    i8 0, label %sw.bb2573.i
    i8 1, label %sw.bb2575.i
    i8 2, label %sw.bb2579.i
    i8 3, label %sw.bb2581.i
    i8 4, label %sw.bb2589.i
    i8 5, label %sw.bb2597.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2573.i:                                      ; preds = %cleanup.cont2559.i
  %2437 = load i32, i32* %add.ptr2570.i, align 4, !tbaa !7
  %mul2574.i = mul i32 %2437, %2434
  br label %cleanup.cont2606.i

sw.bb2575.i:                                      ; preds = %cleanup.cont2559.i
  %2438 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 55, i32 3), align 4, !tbaa !18
  %add2577.i = add i32 %2438, %2434
  %2439 = load i32, i32* %add.ptr2570.i, align 4, !tbaa !7
  %add2578.i = add i32 %add2577.i, %2439
  br label %cleanup.cont2606.i

sw.bb2579.i:                                      ; preds = %cleanup.cont2559.i
  %2440 = load i32, i32* %add.ptr2570.i, align 4, !tbaa !7
  %sub2580.i = sub i32 %2440, %2434
  br label %cleanup.cont2606.i

sw.bb2581.i:                                      ; preds = %cleanup.cont2559.i
  %2441 = load i32, i32* %add.ptr2570.i, align 4, !tbaa !7
  %or2588.i = call i32 @llvm.fshr.i32(i32 %2441, i32 %2441, i32 %2434) #7
  br label %cleanup.cont2606.i

sw.bb2589.i:                                      ; preds = %cleanup.cont2559.i
  %2442 = load i32, i32* %add.ptr2570.i, align 4, !tbaa !7
  %or2596.i = call i32 @llvm.fshl.i32(i32 %2442, i32 %2442, i32 %2434) #7
  br label %cleanup.cont2606.i

sw.bb2597.i:                                      ; preds = %cleanup.cont2559.i
  %2443 = load i32, i32* %add.ptr2570.i, align 4, !tbaa !7
  %xor2598.i = xor i32 %2443, %2434
  br label %cleanup.cont2606.i

sw.default2600.i:                                 ; preds = %cleanup.cont2559.i
  unreachable

cleanup.cont2606.i:                               ; preds = %sw.bb2597.i, %sw.bb2589.i, %sw.bb2581.i, %sw.bb2579.i, %sw.bb2575.i, %sw.bb2573.i
  %xor2598.i.sink = phi i32 [ %xor2598.i, %sw.bb2597.i ], [ %or2596.i, %sw.bb2589.i ], [ %or2588.i, %sw.bb2581.i ], [ %sub2580.i, %sw.bb2579.i ], [ %add2578.i, %sw.bb2575.i ], [ %mul2574.i, %sw.bb2573.i ]
  store i32 %xor2598.i.sink, i32* %add.ptr2570.i, align 4, !tbaa !7
  %2444 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 56, i32 1), align 1, !tbaa !17
  %idxprom2612.i = zext i8 %2444 to i32
  %arrayidx2613.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2612.i
  %2445 = load i32, i32* %arrayidx2613.i, align 4, !tbaa !7
  %2446 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 56, i32 0), align 16, !tbaa !16
  %conv2616.i = zext i8 %2446 to i32
  %add.ptr2617.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2616.i
  %2447 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 56, i32 2), align 2, !tbaa !14
  switch i8 %2447, label %sw.default2647.i [
    i8 0, label %sw.bb2620.i
    i8 1, label %sw.bb2622.i
    i8 2, label %sw.bb2626.i
    i8 3, label %sw.bb2628.i
    i8 4, label %sw.bb2636.i
    i8 5, label %sw.bb2644.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2620.i:                                      ; preds = %cleanup.cont2606.i
  %2448 = load i32, i32* %add.ptr2617.i, align 4, !tbaa !7
  %mul2621.i = mul i32 %2448, %2445
  br label %cleanup.cont2653.i

sw.bb2622.i:                                      ; preds = %cleanup.cont2606.i
  %2449 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 56, i32 3), align 4, !tbaa !18
  %add2624.i = add i32 %2449, %2445
  %2450 = load i32, i32* %add.ptr2617.i, align 4, !tbaa !7
  %add2625.i = add i32 %add2624.i, %2450
  br label %cleanup.cont2653.i

sw.bb2626.i:                                      ; preds = %cleanup.cont2606.i
  %2451 = load i32, i32* %add.ptr2617.i, align 4, !tbaa !7
  %sub2627.i = sub i32 %2451, %2445
  br label %cleanup.cont2653.i

sw.bb2628.i:                                      ; preds = %cleanup.cont2606.i
  %2452 = load i32, i32* %add.ptr2617.i, align 4, !tbaa !7
  %or2635.i = call i32 @llvm.fshr.i32(i32 %2452, i32 %2452, i32 %2445) #7
  br label %cleanup.cont2653.i

sw.bb2636.i:                                      ; preds = %cleanup.cont2606.i
  %2453 = load i32, i32* %add.ptr2617.i, align 4, !tbaa !7
  %or2643.i = call i32 @llvm.fshl.i32(i32 %2453, i32 %2453, i32 %2445) #7
  br label %cleanup.cont2653.i

sw.bb2644.i:                                      ; preds = %cleanup.cont2606.i
  %2454 = load i32, i32* %add.ptr2617.i, align 4, !tbaa !7
  %xor2645.i = xor i32 %2454, %2445
  br label %cleanup.cont2653.i

sw.default2647.i:                                 ; preds = %cleanup.cont2606.i
  unreachable

cleanup.cont2653.i:                               ; preds = %sw.bb2644.i, %sw.bb2636.i, %sw.bb2628.i, %sw.bb2626.i, %sw.bb2622.i, %sw.bb2620.i
  %xor2645.i.sink = phi i32 [ %xor2645.i, %sw.bb2644.i ], [ %or2643.i, %sw.bb2636.i ], [ %or2635.i, %sw.bb2628.i ], [ %sub2627.i, %sw.bb2626.i ], [ %add2625.i, %sw.bb2622.i ], [ %mul2621.i, %sw.bb2620.i ]
  store i32 %xor2645.i.sink, i32* %add.ptr2617.i, align 4, !tbaa !7
  %2455 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 57, i32 1), align 1, !tbaa !17
  %idxprom2659.i = zext i8 %2455 to i32
  %arrayidx2660.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2659.i
  %2456 = load i32, i32* %arrayidx2660.i, align 4, !tbaa !7
  %2457 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 57, i32 0), align 8, !tbaa !16
  %conv2663.i = zext i8 %2457 to i32
  %add.ptr2664.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2663.i
  %2458 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 57, i32 2), align 2, !tbaa !14
  switch i8 %2458, label %sw.default2694.i [
    i8 0, label %sw.bb2667.i
    i8 1, label %sw.bb2669.i
    i8 2, label %sw.bb2673.i
    i8 3, label %sw.bb2675.i
    i8 4, label %sw.bb2683.i
    i8 5, label %sw.bb2691.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2667.i:                                      ; preds = %cleanup.cont2653.i
  %2459 = load i32, i32* %add.ptr2664.i, align 4, !tbaa !7
  %mul2668.i = mul i32 %2459, %2456
  br label %cleanup.cont2700.i

sw.bb2669.i:                                      ; preds = %cleanup.cont2653.i
  %2460 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 57, i32 3), align 4, !tbaa !18
  %add2671.i = add i32 %2460, %2456
  %2461 = load i32, i32* %add.ptr2664.i, align 4, !tbaa !7
  %add2672.i = add i32 %add2671.i, %2461
  br label %cleanup.cont2700.i

sw.bb2673.i:                                      ; preds = %cleanup.cont2653.i
  %2462 = load i32, i32* %add.ptr2664.i, align 4, !tbaa !7
  %sub2674.i = sub i32 %2462, %2456
  br label %cleanup.cont2700.i

sw.bb2675.i:                                      ; preds = %cleanup.cont2653.i
  %2463 = load i32, i32* %add.ptr2664.i, align 4, !tbaa !7
  %or2682.i = call i32 @llvm.fshr.i32(i32 %2463, i32 %2463, i32 %2456) #7
  br label %cleanup.cont2700.i

sw.bb2683.i:                                      ; preds = %cleanup.cont2653.i
  %2464 = load i32, i32* %add.ptr2664.i, align 4, !tbaa !7
  %or2690.i = call i32 @llvm.fshl.i32(i32 %2464, i32 %2464, i32 %2456) #7
  br label %cleanup.cont2700.i

sw.bb2691.i:                                      ; preds = %cleanup.cont2653.i
  %2465 = load i32, i32* %add.ptr2664.i, align 4, !tbaa !7
  %xor2692.i = xor i32 %2465, %2456
  br label %cleanup.cont2700.i

sw.default2694.i:                                 ; preds = %cleanup.cont2653.i
  unreachable

cleanup.cont2700.i:                               ; preds = %sw.bb2691.i, %sw.bb2683.i, %sw.bb2675.i, %sw.bb2673.i, %sw.bb2669.i, %sw.bb2667.i
  %xor2692.i.sink = phi i32 [ %xor2692.i, %sw.bb2691.i ], [ %or2690.i, %sw.bb2683.i ], [ %or2682.i, %sw.bb2675.i ], [ %sub2674.i, %sw.bb2673.i ], [ %add2672.i, %sw.bb2669.i ], [ %mul2668.i, %sw.bb2667.i ]
  store i32 %xor2692.i.sink, i32* %add.ptr2664.i, align 4, !tbaa !7
  %2466 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 58, i32 1), align 1, !tbaa !17
  %idxprom2706.i = zext i8 %2466 to i32
  %arrayidx2707.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2706.i
  %2467 = load i32, i32* %arrayidx2707.i, align 4, !tbaa !7
  %2468 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 58, i32 0), align 16, !tbaa !16
  %conv2710.i = zext i8 %2468 to i32
  %add.ptr2711.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2710.i
  %2469 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 58, i32 2), align 2, !tbaa !14
  switch i8 %2469, label %sw.default2741.i [
    i8 0, label %sw.bb2714.i
    i8 1, label %sw.bb2716.i
    i8 2, label %sw.bb2720.i
    i8 3, label %sw.bb2722.i
    i8 4, label %sw.bb2730.i
    i8 5, label %sw.bb2738.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2714.i:                                      ; preds = %cleanup.cont2700.i
  %2470 = load i32, i32* %add.ptr2711.i, align 4, !tbaa !7
  %mul2715.i = mul i32 %2470, %2467
  br label %cleanup.cont2747.i

sw.bb2716.i:                                      ; preds = %cleanup.cont2700.i
  %2471 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 58, i32 3), align 4, !tbaa !18
  %add2718.i = add i32 %2471, %2467
  %2472 = load i32, i32* %add.ptr2711.i, align 4, !tbaa !7
  %add2719.i = add i32 %add2718.i, %2472
  br label %cleanup.cont2747.i

sw.bb2720.i:                                      ; preds = %cleanup.cont2700.i
  %2473 = load i32, i32* %add.ptr2711.i, align 4, !tbaa !7
  %sub2721.i = sub i32 %2473, %2467
  br label %cleanup.cont2747.i

sw.bb2722.i:                                      ; preds = %cleanup.cont2700.i
  %2474 = load i32, i32* %add.ptr2711.i, align 4, !tbaa !7
  %or2729.i = call i32 @llvm.fshr.i32(i32 %2474, i32 %2474, i32 %2467) #7
  br label %cleanup.cont2747.i

sw.bb2730.i:                                      ; preds = %cleanup.cont2700.i
  %2475 = load i32, i32* %add.ptr2711.i, align 4, !tbaa !7
  %or2737.i = call i32 @llvm.fshl.i32(i32 %2475, i32 %2475, i32 %2467) #7
  br label %cleanup.cont2747.i

sw.bb2738.i:                                      ; preds = %cleanup.cont2700.i
  %2476 = load i32, i32* %add.ptr2711.i, align 4, !tbaa !7
  %xor2739.i = xor i32 %2476, %2467
  br label %cleanup.cont2747.i

sw.default2741.i:                                 ; preds = %cleanup.cont2700.i
  unreachable

cleanup.cont2747.i:                               ; preds = %sw.bb2738.i, %sw.bb2730.i, %sw.bb2722.i, %sw.bb2720.i, %sw.bb2716.i, %sw.bb2714.i
  %xor2739.i.sink = phi i32 [ %xor2739.i, %sw.bb2738.i ], [ %or2737.i, %sw.bb2730.i ], [ %or2729.i, %sw.bb2722.i ], [ %sub2721.i, %sw.bb2720.i ], [ %add2719.i, %sw.bb2716.i ], [ %mul2715.i, %sw.bb2714.i ]
  store i32 %xor2739.i.sink, i32* %add.ptr2711.i, align 4, !tbaa !7
  %2477 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 59, i32 1), align 1, !tbaa !17
  %idxprom2753.i = zext i8 %2477 to i32
  %arrayidx2754.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2753.i
  %2478 = load i32, i32* %arrayidx2754.i, align 4, !tbaa !7
  %2479 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 59, i32 0), align 8, !tbaa !16
  %conv2757.i = zext i8 %2479 to i32
  %add.ptr2758.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2757.i
  %2480 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 59, i32 2), align 2, !tbaa !14
  switch i8 %2480, label %sw.default2788.i [
    i8 0, label %sw.bb2761.i
    i8 1, label %sw.bb2763.i
    i8 2, label %sw.bb2767.i
    i8 3, label %sw.bb2769.i
    i8 4, label %sw.bb2777.i
    i8 5, label %sw.bb2785.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2761.i:                                      ; preds = %cleanup.cont2747.i
  %2481 = load i32, i32* %add.ptr2758.i, align 4, !tbaa !7
  %mul2762.i = mul i32 %2481, %2478
  br label %cleanup.cont2794.i

sw.bb2763.i:                                      ; preds = %cleanup.cont2747.i
  %2482 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 59, i32 3), align 4, !tbaa !18
  %add2765.i = add i32 %2482, %2478
  %2483 = load i32, i32* %add.ptr2758.i, align 4, !tbaa !7
  %add2766.i = add i32 %add2765.i, %2483
  br label %cleanup.cont2794.i

sw.bb2767.i:                                      ; preds = %cleanup.cont2747.i
  %2484 = load i32, i32* %add.ptr2758.i, align 4, !tbaa !7
  %sub2768.i = sub i32 %2484, %2478
  br label %cleanup.cont2794.i

sw.bb2769.i:                                      ; preds = %cleanup.cont2747.i
  %2485 = load i32, i32* %add.ptr2758.i, align 4, !tbaa !7
  %or2776.i = call i32 @llvm.fshr.i32(i32 %2485, i32 %2485, i32 %2478) #7
  br label %cleanup.cont2794.i

sw.bb2777.i:                                      ; preds = %cleanup.cont2747.i
  %2486 = load i32, i32* %add.ptr2758.i, align 4, !tbaa !7
  %or2784.i = call i32 @llvm.fshl.i32(i32 %2486, i32 %2486, i32 %2478) #7
  br label %cleanup.cont2794.i

sw.bb2785.i:                                      ; preds = %cleanup.cont2747.i
  %2487 = load i32, i32* %add.ptr2758.i, align 4, !tbaa !7
  %xor2786.i = xor i32 %2487, %2478
  br label %cleanup.cont2794.i

sw.default2788.i:                                 ; preds = %cleanup.cont2747.i
  unreachable

cleanup.cont2794.i:                               ; preds = %sw.bb2785.i, %sw.bb2777.i, %sw.bb2769.i, %sw.bb2767.i, %sw.bb2763.i, %sw.bb2761.i
  %xor2786.i.sink = phi i32 [ %xor2786.i, %sw.bb2785.i ], [ %or2784.i, %sw.bb2777.i ], [ %or2776.i, %sw.bb2769.i ], [ %sub2768.i, %sw.bb2767.i ], [ %add2766.i, %sw.bb2763.i ], [ %mul2762.i, %sw.bb2761.i ]
  store i32 %xor2786.i.sink, i32* %add.ptr2758.i, align 4, !tbaa !7
  %2488 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 60, i32 1), align 1, !tbaa !17
  %idxprom2800.i = zext i8 %2488 to i32
  %arrayidx2801.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2800.i
  %2489 = load i32, i32* %arrayidx2801.i, align 4, !tbaa !7
  %2490 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 60, i32 0), align 16, !tbaa !16
  %conv2804.i = zext i8 %2490 to i32
  %add.ptr2805.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2804.i
  %2491 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 60, i32 2), align 2, !tbaa !14
  switch i8 %2491, label %sw.default2835.i [
    i8 0, label %sw.bb2808.i
    i8 1, label %sw.bb2810.i
    i8 2, label %sw.bb2814.i
    i8 3, label %sw.bb2816.i
    i8 4, label %sw.bb2824.i
    i8 5, label %sw.bb2832.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2808.i:                                      ; preds = %cleanup.cont2794.i
  %2492 = load i32, i32* %add.ptr2805.i, align 4, !tbaa !7
  %mul2809.i = mul i32 %2492, %2489
  br label %cleanup.cont2841.i

sw.bb2810.i:                                      ; preds = %cleanup.cont2794.i
  %2493 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 60, i32 3), align 4, !tbaa !18
  %add2812.i = add i32 %2493, %2489
  %2494 = load i32, i32* %add.ptr2805.i, align 4, !tbaa !7
  %add2813.i = add i32 %add2812.i, %2494
  br label %cleanup.cont2841.i

sw.bb2814.i:                                      ; preds = %cleanup.cont2794.i
  %2495 = load i32, i32* %add.ptr2805.i, align 4, !tbaa !7
  %sub2815.i = sub i32 %2495, %2489
  br label %cleanup.cont2841.i

sw.bb2816.i:                                      ; preds = %cleanup.cont2794.i
  %2496 = load i32, i32* %add.ptr2805.i, align 4, !tbaa !7
  %or2823.i = call i32 @llvm.fshr.i32(i32 %2496, i32 %2496, i32 %2489) #7
  br label %cleanup.cont2841.i

sw.bb2824.i:                                      ; preds = %cleanup.cont2794.i
  %2497 = load i32, i32* %add.ptr2805.i, align 4, !tbaa !7
  %or2831.i = call i32 @llvm.fshl.i32(i32 %2497, i32 %2497, i32 %2489) #7
  br label %cleanup.cont2841.i

sw.bb2832.i:                                      ; preds = %cleanup.cont2794.i
  %2498 = load i32, i32* %add.ptr2805.i, align 4, !tbaa !7
  %xor2833.i = xor i32 %2498, %2489
  br label %cleanup.cont2841.i

sw.default2835.i:                                 ; preds = %cleanup.cont2794.i
  unreachable

cleanup.cont2841.i:                               ; preds = %sw.bb2832.i, %sw.bb2824.i, %sw.bb2816.i, %sw.bb2814.i, %sw.bb2810.i, %sw.bb2808.i
  %xor2833.i.sink = phi i32 [ %xor2833.i, %sw.bb2832.i ], [ %or2831.i, %sw.bb2824.i ], [ %or2823.i, %sw.bb2816.i ], [ %sub2815.i, %sw.bb2814.i ], [ %add2813.i, %sw.bb2810.i ], [ %mul2809.i, %sw.bb2808.i ]
  store i32 %xor2833.i.sink, i32* %add.ptr2805.i, align 4, !tbaa !7
  %2499 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 61, i32 1), align 1, !tbaa !17
  %idxprom2847.i = zext i8 %2499 to i32
  %arrayidx2848.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2847.i
  %2500 = load i32, i32* %arrayidx2848.i, align 4, !tbaa !7
  %2501 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 61, i32 0), align 8, !tbaa !16
  %conv2851.i = zext i8 %2501 to i32
  %add.ptr2852.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2851.i
  %2502 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 61, i32 2), align 2, !tbaa !14
  switch i8 %2502, label %sw.default2882.i [
    i8 0, label %sw.bb2855.i
    i8 1, label %sw.bb2857.i
    i8 2, label %sw.bb2861.i
    i8 3, label %sw.bb2863.i
    i8 4, label %sw.bb2871.i
    i8 5, label %sw.bb2879.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2855.i:                                      ; preds = %cleanup.cont2841.i
  %2503 = load i32, i32* %add.ptr2852.i, align 4, !tbaa !7
  %mul2856.i = mul i32 %2503, %2500
  br label %cleanup.cont2888.i

sw.bb2857.i:                                      ; preds = %cleanup.cont2841.i
  %2504 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 61, i32 3), align 4, !tbaa !18
  %add2859.i = add i32 %2504, %2500
  %2505 = load i32, i32* %add.ptr2852.i, align 4, !tbaa !7
  %add2860.i = add i32 %add2859.i, %2505
  br label %cleanup.cont2888.i

sw.bb2861.i:                                      ; preds = %cleanup.cont2841.i
  %2506 = load i32, i32* %add.ptr2852.i, align 4, !tbaa !7
  %sub2862.i = sub i32 %2506, %2500
  br label %cleanup.cont2888.i

sw.bb2863.i:                                      ; preds = %cleanup.cont2841.i
  %2507 = load i32, i32* %add.ptr2852.i, align 4, !tbaa !7
  %or2870.i = call i32 @llvm.fshr.i32(i32 %2507, i32 %2507, i32 %2500) #7
  br label %cleanup.cont2888.i

sw.bb2871.i:                                      ; preds = %cleanup.cont2841.i
  %2508 = load i32, i32* %add.ptr2852.i, align 4, !tbaa !7
  %or2878.i = call i32 @llvm.fshl.i32(i32 %2508, i32 %2508, i32 %2500) #7
  br label %cleanup.cont2888.i

sw.bb2879.i:                                      ; preds = %cleanup.cont2841.i
  %2509 = load i32, i32* %add.ptr2852.i, align 4, !tbaa !7
  %xor2880.i = xor i32 %2509, %2500
  br label %cleanup.cont2888.i

sw.default2882.i:                                 ; preds = %cleanup.cont2841.i
  unreachable

cleanup.cont2888.i:                               ; preds = %sw.bb2879.i, %sw.bb2871.i, %sw.bb2863.i, %sw.bb2861.i, %sw.bb2857.i, %sw.bb2855.i
  %xor2880.i.sink = phi i32 [ %xor2880.i, %sw.bb2879.i ], [ %or2878.i, %sw.bb2871.i ], [ %or2870.i, %sw.bb2863.i ], [ %sub2862.i, %sw.bb2861.i ], [ %add2860.i, %sw.bb2857.i ], [ %mul2856.i, %sw.bb2855.i ]
  store i32 %xor2880.i.sink, i32* %add.ptr2852.i, align 4, !tbaa !7
  %2510 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 62, i32 1), align 1, !tbaa !17
  %idxprom2894.i = zext i8 %2510 to i32
  %arrayidx2895.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2894.i
  %2511 = load i32, i32* %arrayidx2895.i, align 4, !tbaa !7
  %2512 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 62, i32 0), align 16, !tbaa !16
  %conv2898.i = zext i8 %2512 to i32
  %add.ptr2899.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2898.i
  %2513 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 62, i32 2), align 2, !tbaa !14
  switch i8 %2513, label %sw.default2929.i [
    i8 0, label %sw.bb2902.i
    i8 1, label %sw.bb2904.i
    i8 2, label %sw.bb2908.i
    i8 3, label %sw.bb2910.i
    i8 4, label %sw.bb2918.i
    i8 5, label %sw.bb2926.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2902.i:                                      ; preds = %cleanup.cont2888.i
  %2514 = load i32, i32* %add.ptr2899.i, align 4, !tbaa !7
  %mul2903.i = mul i32 %2514, %2511
  br label %cleanup.cont2935.i

sw.bb2904.i:                                      ; preds = %cleanup.cont2888.i
  %2515 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 62, i32 3), align 4, !tbaa !18
  %add2906.i = add i32 %2515, %2511
  %2516 = load i32, i32* %add.ptr2899.i, align 4, !tbaa !7
  %add2907.i = add i32 %add2906.i, %2516
  br label %cleanup.cont2935.i

sw.bb2908.i:                                      ; preds = %cleanup.cont2888.i
  %2517 = load i32, i32* %add.ptr2899.i, align 4, !tbaa !7
  %sub2909.i = sub i32 %2517, %2511
  br label %cleanup.cont2935.i

sw.bb2910.i:                                      ; preds = %cleanup.cont2888.i
  %2518 = load i32, i32* %add.ptr2899.i, align 4, !tbaa !7
  %or2917.i = call i32 @llvm.fshr.i32(i32 %2518, i32 %2518, i32 %2511) #7
  br label %cleanup.cont2935.i

sw.bb2918.i:                                      ; preds = %cleanup.cont2888.i
  %2519 = load i32, i32* %add.ptr2899.i, align 4, !tbaa !7
  %or2925.i = call i32 @llvm.fshl.i32(i32 %2519, i32 %2519, i32 %2511) #7
  br label %cleanup.cont2935.i

sw.bb2926.i:                                      ; preds = %cleanup.cont2888.i
  %2520 = load i32, i32* %add.ptr2899.i, align 4, !tbaa !7
  %xor2927.i = xor i32 %2520, %2511
  br label %cleanup.cont2935.i

sw.default2929.i:                                 ; preds = %cleanup.cont2888.i
  unreachable

cleanup.cont2935.i:                               ; preds = %sw.bb2926.i, %sw.bb2918.i, %sw.bb2910.i, %sw.bb2908.i, %sw.bb2904.i, %sw.bb2902.i
  %xor2927.i.sink = phi i32 [ %xor2927.i, %sw.bb2926.i ], [ %or2925.i, %sw.bb2918.i ], [ %or2917.i, %sw.bb2910.i ], [ %sub2909.i, %sw.bb2908.i ], [ %add2907.i, %sw.bb2904.i ], [ %mul2903.i, %sw.bb2902.i ]
  store i32 %xor2927.i.sink, i32* %add.ptr2899.i, align 4, !tbaa !7
  %2521 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 63, i32 1), align 1, !tbaa !17
  %idxprom2941.i = zext i8 %2521 to i32
  %arrayidx2942.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2941.i
  %2522 = load i32, i32* %arrayidx2942.i, align 4, !tbaa !7
  %2523 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 63, i32 0), align 8, !tbaa !16
  %conv2945.i = zext i8 %2523 to i32
  %add.ptr2946.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2945.i
  %2524 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 63, i32 2), align 2, !tbaa !14
  switch i8 %2524, label %sw.default2976.i [
    i8 0, label %sw.bb2949.i
    i8 1, label %sw.bb2951.i
    i8 2, label %sw.bb2955.i
    i8 3, label %sw.bb2957.i
    i8 4, label %sw.bb2965.i
    i8 5, label %sw.bb2973.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2949.i:                                      ; preds = %cleanup.cont2935.i
  %2525 = load i32, i32* %add.ptr2946.i, align 4, !tbaa !7
  %mul2950.i = mul i32 %2525, %2522
  br label %cleanup.cont2982.i

sw.bb2951.i:                                      ; preds = %cleanup.cont2935.i
  %2526 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 63, i32 3), align 4, !tbaa !18
  %add2953.i = add i32 %2526, %2522
  %2527 = load i32, i32* %add.ptr2946.i, align 4, !tbaa !7
  %add2954.i = add i32 %add2953.i, %2527
  br label %cleanup.cont2982.i

sw.bb2955.i:                                      ; preds = %cleanup.cont2935.i
  %2528 = load i32, i32* %add.ptr2946.i, align 4, !tbaa !7
  %sub2956.i = sub i32 %2528, %2522
  br label %cleanup.cont2982.i

sw.bb2957.i:                                      ; preds = %cleanup.cont2935.i
  %2529 = load i32, i32* %add.ptr2946.i, align 4, !tbaa !7
  %or2964.i = call i32 @llvm.fshr.i32(i32 %2529, i32 %2529, i32 %2522) #7
  br label %cleanup.cont2982.i

sw.bb2965.i:                                      ; preds = %cleanup.cont2935.i
  %2530 = load i32, i32* %add.ptr2946.i, align 4, !tbaa !7
  %or2972.i = call i32 @llvm.fshl.i32(i32 %2530, i32 %2530, i32 %2522) #7
  br label %cleanup.cont2982.i

sw.bb2973.i:                                      ; preds = %cleanup.cont2935.i
  %2531 = load i32, i32* %add.ptr2946.i, align 4, !tbaa !7
  %xor2974.i = xor i32 %2531, %2522
  br label %cleanup.cont2982.i

sw.default2976.i:                                 ; preds = %cleanup.cont2935.i
  unreachable

cleanup.cont2982.i:                               ; preds = %sw.bb2973.i, %sw.bb2965.i, %sw.bb2957.i, %sw.bb2955.i, %sw.bb2951.i, %sw.bb2949.i
  %xor2974.i.sink = phi i32 [ %xor2974.i, %sw.bb2973.i ], [ %or2972.i, %sw.bb2965.i ], [ %or2964.i, %sw.bb2957.i ], [ %sub2956.i, %sw.bb2955.i ], [ %add2954.i, %sw.bb2951.i ], [ %mul2950.i, %sw.bb2949.i ]
  store i32 %xor2974.i.sink, i32* %add.ptr2946.i, align 4, !tbaa !7
  %2532 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 64, i32 1), align 1, !tbaa !17
  %idxprom2988.i = zext i8 %2532 to i32
  %arrayidx2989.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom2988.i
  %2533 = load i32, i32* %arrayidx2989.i, align 4, !tbaa !7
  %2534 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 64, i32 0), align 16, !tbaa !16
  %conv2992.i = zext i8 %2534 to i32
  %add.ptr2993.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv2992.i
  %2535 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 64, i32 2), align 2, !tbaa !14
  switch i8 %2535, label %sw.default3023.i [
    i8 0, label %sw.bb2996.i
    i8 1, label %sw.bb2998.i
    i8 2, label %sw.bb3002.i
    i8 3, label %sw.bb3004.i
    i8 4, label %sw.bb3012.i
    i8 5, label %sw.bb3020.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb2996.i:                                      ; preds = %cleanup.cont2982.i
  %2536 = load i32, i32* %add.ptr2993.i, align 4, !tbaa !7
  %mul2997.i = mul i32 %2536, %2533
  br label %cleanup.cont3029.i

sw.bb2998.i:                                      ; preds = %cleanup.cont2982.i
  %2537 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 64, i32 3), align 4, !tbaa !18
  %add3000.i = add i32 %2537, %2533
  %2538 = load i32, i32* %add.ptr2993.i, align 4, !tbaa !7
  %add3001.i = add i32 %add3000.i, %2538
  br label %cleanup.cont3029.i

sw.bb3002.i:                                      ; preds = %cleanup.cont2982.i
  %2539 = load i32, i32* %add.ptr2993.i, align 4, !tbaa !7
  %sub3003.i = sub i32 %2539, %2533
  br label %cleanup.cont3029.i

sw.bb3004.i:                                      ; preds = %cleanup.cont2982.i
  %2540 = load i32, i32* %add.ptr2993.i, align 4, !tbaa !7
  %or3011.i = call i32 @llvm.fshr.i32(i32 %2540, i32 %2540, i32 %2533) #7
  br label %cleanup.cont3029.i

sw.bb3012.i:                                      ; preds = %cleanup.cont2982.i
  %2541 = load i32, i32* %add.ptr2993.i, align 4, !tbaa !7
  %or3019.i = call i32 @llvm.fshl.i32(i32 %2541, i32 %2541, i32 %2533) #7
  br label %cleanup.cont3029.i

sw.bb3020.i:                                      ; preds = %cleanup.cont2982.i
  %2542 = load i32, i32* %add.ptr2993.i, align 4, !tbaa !7
  %xor3021.i = xor i32 %2542, %2533
  br label %cleanup.cont3029.i

sw.default3023.i:                                 ; preds = %cleanup.cont2982.i
  unreachable

cleanup.cont3029.i:                               ; preds = %sw.bb3020.i, %sw.bb3012.i, %sw.bb3004.i, %sw.bb3002.i, %sw.bb2998.i, %sw.bb2996.i
  %xor3021.i.sink = phi i32 [ %xor3021.i, %sw.bb3020.i ], [ %or3019.i, %sw.bb3012.i ], [ %or3011.i, %sw.bb3004.i ], [ %sub3003.i, %sw.bb3002.i ], [ %add3001.i, %sw.bb2998.i ], [ %mul2997.i, %sw.bb2996.i ]
  store i32 %xor3021.i.sink, i32* %add.ptr2993.i, align 4, !tbaa !7
  %2543 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 65, i32 1), align 1, !tbaa !17
  %idxprom3035.i = zext i8 %2543 to i32
  %arrayidx3036.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom3035.i
  %2544 = load i32, i32* %arrayidx3036.i, align 4, !tbaa !7
  %2545 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 65, i32 0), align 8, !tbaa !16
  %conv3039.i = zext i8 %2545 to i32
  %add.ptr3040.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv3039.i
  %2546 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 65, i32 2), align 2, !tbaa !14
  switch i8 %2546, label %sw.default3070.i [
    i8 0, label %sw.bb3043.i
    i8 1, label %sw.bb3045.i
    i8 2, label %sw.bb3049.i
    i8 3, label %sw.bb3051.i
    i8 4, label %sw.bb3059.i
    i8 5, label %sw.bb3067.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb3043.i:                                      ; preds = %cleanup.cont3029.i
  %2547 = load i32, i32* %add.ptr3040.i, align 4, !tbaa !7
  %mul3044.i = mul i32 %2547, %2544
  br label %cleanup.cont3076.i

sw.bb3045.i:                                      ; preds = %cleanup.cont3029.i
  %2548 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 65, i32 3), align 4, !tbaa !18
  %add3047.i = add i32 %2548, %2544
  %2549 = load i32, i32* %add.ptr3040.i, align 4, !tbaa !7
  %add3048.i = add i32 %add3047.i, %2549
  br label %cleanup.cont3076.i

sw.bb3049.i:                                      ; preds = %cleanup.cont3029.i
  %2550 = load i32, i32* %add.ptr3040.i, align 4, !tbaa !7
  %sub3050.i = sub i32 %2550, %2544
  br label %cleanup.cont3076.i

sw.bb3051.i:                                      ; preds = %cleanup.cont3029.i
  %2551 = load i32, i32* %add.ptr3040.i, align 4, !tbaa !7
  %or3058.i = call i32 @llvm.fshr.i32(i32 %2551, i32 %2551, i32 %2544) #7
  br label %cleanup.cont3076.i

sw.bb3059.i:                                      ; preds = %cleanup.cont3029.i
  %2552 = load i32, i32* %add.ptr3040.i, align 4, !tbaa !7
  %or3066.i = call i32 @llvm.fshl.i32(i32 %2552, i32 %2552, i32 %2544) #7
  br label %cleanup.cont3076.i

sw.bb3067.i:                                      ; preds = %cleanup.cont3029.i
  %2553 = load i32, i32* %add.ptr3040.i, align 4, !tbaa !7
  %xor3068.i = xor i32 %2553, %2544
  br label %cleanup.cont3076.i

sw.default3070.i:                                 ; preds = %cleanup.cont3029.i
  unreachable

cleanup.cont3076.i:                               ; preds = %sw.bb3067.i, %sw.bb3059.i, %sw.bb3051.i, %sw.bb3049.i, %sw.bb3045.i, %sw.bb3043.i
  %xor3068.i.sink = phi i32 [ %xor3068.i, %sw.bb3067.i ], [ %or3066.i, %sw.bb3059.i ], [ %or3058.i, %sw.bb3051.i ], [ %sub3050.i, %sw.bb3049.i ], [ %add3048.i, %sw.bb3045.i ], [ %mul3044.i, %sw.bb3043.i ]
  store i32 %xor3068.i.sink, i32* %add.ptr3040.i, align 4, !tbaa !7
  %2554 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 66, i32 1), align 1, !tbaa !17
  %idxprom3082.i = zext i8 %2554 to i32
  %arrayidx3083.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom3082.i
  %2555 = load i32, i32* %arrayidx3083.i, align 4, !tbaa !7
  %2556 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 66, i32 0), align 16, !tbaa !16
  %conv3086.i = zext i8 %2556 to i32
  %add.ptr3087.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv3086.i
  %2557 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 66, i32 2), align 2, !tbaa !14
  switch i8 %2557, label %sw.default3117.i [
    i8 0, label %sw.bb3090.i
    i8 1, label %sw.bb3092.i
    i8 2, label %sw.bb3096.i
    i8 3, label %sw.bb3098.i
    i8 4, label %sw.bb3106.i
    i8 5, label %sw.bb3114.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb3090.i:                                      ; preds = %cleanup.cont3076.i
  %2558 = load i32, i32* %add.ptr3087.i, align 4, !tbaa !7
  %mul3091.i = mul i32 %2558, %2555
  br label %cleanup.cont3123.i

sw.bb3092.i:                                      ; preds = %cleanup.cont3076.i
  %2559 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 66, i32 3), align 4, !tbaa !18
  %add3094.i = add i32 %2559, %2555
  %2560 = load i32, i32* %add.ptr3087.i, align 4, !tbaa !7
  %add3095.i = add i32 %add3094.i, %2560
  br label %cleanup.cont3123.i

sw.bb3096.i:                                      ; preds = %cleanup.cont3076.i
  %2561 = load i32, i32* %add.ptr3087.i, align 4, !tbaa !7
  %sub3097.i = sub i32 %2561, %2555
  br label %cleanup.cont3123.i

sw.bb3098.i:                                      ; preds = %cleanup.cont3076.i
  %2562 = load i32, i32* %add.ptr3087.i, align 4, !tbaa !7
  %or3105.i = call i32 @llvm.fshr.i32(i32 %2562, i32 %2562, i32 %2555) #7
  br label %cleanup.cont3123.i

sw.bb3106.i:                                      ; preds = %cleanup.cont3076.i
  %2563 = load i32, i32* %add.ptr3087.i, align 4, !tbaa !7
  %or3113.i = call i32 @llvm.fshl.i32(i32 %2563, i32 %2563, i32 %2555) #7
  br label %cleanup.cont3123.i

sw.bb3114.i:                                      ; preds = %cleanup.cont3076.i
  %2564 = load i32, i32* %add.ptr3087.i, align 4, !tbaa !7
  %xor3115.i = xor i32 %2564, %2555
  br label %cleanup.cont3123.i

sw.default3117.i:                                 ; preds = %cleanup.cont3076.i
  unreachable

cleanup.cont3123.i:                               ; preds = %sw.bb3114.i, %sw.bb3106.i, %sw.bb3098.i, %sw.bb3096.i, %sw.bb3092.i, %sw.bb3090.i
  %xor3115.i.sink = phi i32 [ %xor3115.i, %sw.bb3114.i ], [ %or3113.i, %sw.bb3106.i ], [ %or3105.i, %sw.bb3098.i ], [ %sub3097.i, %sw.bb3096.i ], [ %add3095.i, %sw.bb3092.i ], [ %mul3091.i, %sw.bb3090.i ]
  store i32 %xor3115.i.sink, i32* %add.ptr3087.i, align 4, !tbaa !7
  %2565 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 67, i32 1), align 1, !tbaa !17
  %idxprom3129.i = zext i8 %2565 to i32
  %arrayidx3130.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom3129.i
  %2566 = load i32, i32* %arrayidx3130.i, align 4, !tbaa !7
  %2567 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 67, i32 0), align 8, !tbaa !16
  %conv3133.i = zext i8 %2567 to i32
  %add.ptr3134.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv3133.i
  %2568 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 67, i32 2), align 2, !tbaa !14
  switch i8 %2568, label %sw.default3164.i [
    i8 0, label %sw.bb3137.i
    i8 1, label %sw.bb3139.i
    i8 2, label %sw.bb3143.i
    i8 3, label %sw.bb3145.i
    i8 4, label %sw.bb3153.i
    i8 5, label %sw.bb3161.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb3137.i:                                      ; preds = %cleanup.cont3123.i
  %2569 = load i32, i32* %add.ptr3134.i, align 4, !tbaa !7
  %mul3138.i = mul i32 %2569, %2566
  br label %cleanup.cont3170.i

sw.bb3139.i:                                      ; preds = %cleanup.cont3123.i
  %2570 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 67, i32 3), align 4, !tbaa !18
  %add3141.i = add i32 %2570, %2566
  %2571 = load i32, i32* %add.ptr3134.i, align 4, !tbaa !7
  %add3142.i = add i32 %add3141.i, %2571
  br label %cleanup.cont3170.i

sw.bb3143.i:                                      ; preds = %cleanup.cont3123.i
  %2572 = load i32, i32* %add.ptr3134.i, align 4, !tbaa !7
  %sub3144.i = sub i32 %2572, %2566
  br label %cleanup.cont3170.i

sw.bb3145.i:                                      ; preds = %cleanup.cont3123.i
  %2573 = load i32, i32* %add.ptr3134.i, align 4, !tbaa !7
  %or3152.i = call i32 @llvm.fshr.i32(i32 %2573, i32 %2573, i32 %2566) #7
  br label %cleanup.cont3170.i

sw.bb3153.i:                                      ; preds = %cleanup.cont3123.i
  %2574 = load i32, i32* %add.ptr3134.i, align 4, !tbaa !7
  %or3160.i = call i32 @llvm.fshl.i32(i32 %2574, i32 %2574, i32 %2566) #7
  br label %cleanup.cont3170.i

sw.bb3161.i:                                      ; preds = %cleanup.cont3123.i
  %2575 = load i32, i32* %add.ptr3134.i, align 4, !tbaa !7
  %xor3162.i = xor i32 %2575, %2566
  br label %cleanup.cont3170.i

sw.default3164.i:                                 ; preds = %cleanup.cont3123.i
  unreachable

cleanup.cont3170.i:                               ; preds = %sw.bb3161.i, %sw.bb3153.i, %sw.bb3145.i, %sw.bb3143.i, %sw.bb3139.i, %sw.bb3137.i
  %xor3162.i.sink = phi i32 [ %xor3162.i, %sw.bb3161.i ], [ %or3160.i, %sw.bb3153.i ], [ %or3152.i, %sw.bb3145.i ], [ %sub3144.i, %sw.bb3143.i ], [ %add3142.i, %sw.bb3139.i ], [ %mul3138.i, %sw.bb3137.i ]
  store i32 %xor3162.i.sink, i32* %add.ptr3134.i, align 4, !tbaa !7
  %2576 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 68, i32 1), align 1, !tbaa !17
  %idxprom3176.i = zext i8 %2576 to i32
  %arrayidx3177.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom3176.i
  %2577 = load i32, i32* %arrayidx3177.i, align 4, !tbaa !7
  %2578 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 68, i32 0), align 16, !tbaa !16
  %conv3180.i = zext i8 %2578 to i32
  %add.ptr3181.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv3180.i
  %2579 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 68, i32 2), align 2, !tbaa !14
  switch i8 %2579, label %sw.default3211.i [
    i8 0, label %sw.bb3184.i
    i8 1, label %sw.bb3186.i
    i8 2, label %sw.bb3190.i
    i8 3, label %sw.bb3192.i
    i8 4, label %sw.bb3200.i
    i8 5, label %sw.bb3208.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb3184.i:                                      ; preds = %cleanup.cont3170.i
  %2580 = load i32, i32* %add.ptr3181.i, align 4, !tbaa !7
  %mul3185.i = mul i32 %2580, %2577
  br label %cleanup.cont3217.i

sw.bb3186.i:                                      ; preds = %cleanup.cont3170.i
  %2581 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 68, i32 3), align 4, !tbaa !18
  %add3188.i = add i32 %2581, %2577
  %2582 = load i32, i32* %add.ptr3181.i, align 4, !tbaa !7
  %add3189.i = add i32 %add3188.i, %2582
  br label %cleanup.cont3217.i

sw.bb3190.i:                                      ; preds = %cleanup.cont3170.i
  %2583 = load i32, i32* %add.ptr3181.i, align 4, !tbaa !7
  %sub3191.i = sub i32 %2583, %2577
  br label %cleanup.cont3217.i

sw.bb3192.i:                                      ; preds = %cleanup.cont3170.i
  %2584 = load i32, i32* %add.ptr3181.i, align 4, !tbaa !7
  %or3199.i = call i32 @llvm.fshr.i32(i32 %2584, i32 %2584, i32 %2577) #7
  br label %cleanup.cont3217.i

sw.bb3200.i:                                      ; preds = %cleanup.cont3170.i
  %2585 = load i32, i32* %add.ptr3181.i, align 4, !tbaa !7
  %or3207.i = call i32 @llvm.fshl.i32(i32 %2585, i32 %2585, i32 %2577) #7
  br label %cleanup.cont3217.i

sw.bb3208.i:                                      ; preds = %cleanup.cont3170.i
  %2586 = load i32, i32* %add.ptr3181.i, align 4, !tbaa !7
  %xor3209.i = xor i32 %2586, %2577
  br label %cleanup.cont3217.i

sw.default3211.i:                                 ; preds = %cleanup.cont3170.i
  unreachable

cleanup.cont3217.i:                               ; preds = %sw.bb3208.i, %sw.bb3200.i, %sw.bb3192.i, %sw.bb3190.i, %sw.bb3186.i, %sw.bb3184.i
  %xor3209.i.sink = phi i32 [ %xor3209.i, %sw.bb3208.i ], [ %or3207.i, %sw.bb3200.i ], [ %or3199.i, %sw.bb3192.i ], [ %sub3191.i, %sw.bb3190.i ], [ %add3189.i, %sw.bb3186.i ], [ %mul3185.i, %sw.bb3184.i ]
  store i32 %xor3209.i.sink, i32* %add.ptr3181.i, align 4, !tbaa !7
  %2587 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 69, i32 1), align 1, !tbaa !17
  %idxprom3223.i = zext i8 %2587 to i32
  %arrayidx3224.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %idxprom3223.i
  %2588 = load i32, i32* %arrayidx3224.i, align 4, !tbaa !7
  %2589 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 69, i32 0), align 8, !tbaa !16
  %conv3227.i = zext i8 %2589 to i32
  %add.ptr3228.i = getelementptr inbounds [9 x i32], [9 x i32]* @r, i32 0, i32 %conv3227.i
  %2590 = load i8, i8* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 69, i32 2), align 2, !tbaa !14
  switch i8 %2590, label %sw.default3258.i [
    i8 0, label %sw.bb3231.i
    i8 1, label %sw.bb3233.i
    i8 2, label %sw.bb3237.i
    i8 3, label %sw.bb3239.i
    i8 4, label %sw.bb3247.i
    i8 5, label %sw.bb3255.i
    i8 6, label %v4_random_math.exit
  ]

sw.bb3231.i:                                      ; preds = %cleanup.cont3217.i
  %2591 = load i32, i32* %add.ptr3228.i, align 4, !tbaa !7
  %mul3232.i = mul i32 %2591, %2588
  store i32 %mul3232.i, i32* %add.ptr3228.i, align 4, !tbaa !7
  br label %v4_random_math.exit

sw.bb3233.i:                                      ; preds = %cleanup.cont3217.i
  %2592 = load i32, i32* getelementptr inbounds ([71 x %struct.V4_Instruction], [71 x %struct.V4_Instruction]* @code, i32 0, i32 69, i32 3), align 4, !tbaa !18
  %add3235.i = add i32 %2592, %2588
  %2593 = load i32, i32* %add.ptr3228.i, align 4, !tbaa !7
  %add3236.i = add i32 %add3235.i, %2593
  store i32 %add3236.i, i32* %add.ptr3228.i, align 4, !tbaa !7
  br label %v4_random_math.exit

sw.bb3237.i:                                      ; preds = %cleanup.cont3217.i
  %2594 = load i32, i32* %add.ptr3228.i, align 4, !tbaa !7
  %sub3238.i = sub i32 %2594, %2588
  store i32 %sub3238.i, i32* %add.ptr3228.i, align 4, !tbaa !7
  br label %v4_random_math.exit

sw.bb3239.i:                                      ; preds = %cleanup.cont3217.i
  %2595 = load i32, i32* %add.ptr3228.i, align 4, !tbaa !7
  %or3246.i = call i32 @llvm.fshr.i32(i32 %2595, i32 %2595, i32 %2588) #7
  store i32 %or3246.i, i32* %add.ptr3228.i, align 4, !tbaa !7
  br label %v4_random_math.exit

sw.bb3247.i:                                      ; preds = %cleanup.cont3217.i
  %2596 = load i32, i32* %add.ptr3228.i, align 4, !tbaa !7
  %or3254.i = call i32 @llvm.fshl.i32(i32 %2596, i32 %2596, i32 %2588) #7
  store i32 %or3254.i, i32* %add.ptr3228.i, align 4, !tbaa !7
  br label %v4_random_math.exit

sw.bb3255.i:                                      ; preds = %cleanup.cont3217.i
  %2597 = load i32, i32* %add.ptr3228.i, align 4, !tbaa !7
  %xor3256.i = xor i32 %2597, %2588
  store i32 %xor3256.i, i32* %add.ptr3228.i, align 4, !tbaa !7
  br label %v4_random_math.exit

sw.default3258.i:                                 ; preds = %cleanup.cont3217.i
  unreachable

v4_random_math.exit:                              ; preds = %if.then1252, %cleanup.cont.i, %cleanup.cont68.i, %cleanup.cont115.i, %cleanup.cont162.i, %cleanup.cont209.i, %cleanup.cont256.i, %cleanup.cont303.i, %cleanup.cont350.i, %cleanup.cont397.i, %cleanup.cont444.i, %cleanup.cont491.i, %cleanup.cont538.i, %cleanup.cont585.i, %cleanup.cont632.i, %cleanup.cont679.i, %cleanup.cont726.i, %cleanup.cont773.i, %cleanup.cont820.i, %cleanup.cont867.i, %cleanup.cont914.i, %cleanup.cont961.i, %cleanup.cont1008.i, %cleanup.cont1055.i, %cleanup.cont1102.i, %cleanup.cont1149.i, %cleanup.cont1196.i, %cleanup.cont1243.i, %cleanup.cont1290.i, %cleanup.cont1337.i, %cleanup.cont1384.i, %cleanup.cont1431.i, %cleanup.cont1478.i, %cleanup.cont1525.i, %cleanup.cont1572.i, %cleanup.cont1619.i, %cleanup.cont1666.i, %cleanup.cont1713.i, %cleanup.cont1760.i, %cleanup.cont1807.i, %cleanup.cont1854.i, %cleanup.cont1901.i, %cleanup.cont1948.i, %cleanup.cont1995.i, %cleanup.cont2042.i, %cleanup.cont2089.i, %cleanup.cont2136.i, %cleanup.cont2183.i, %cleanup.cont2230.i, %cleanup.cont2277.i, %cleanup.cont2324.i, %cleanup.cont2371.i, %cleanup.cont2418.i, %cleanup.cont2465.i, %cleanup.cont2512.i, %cleanup.cont2559.i, %cleanup.cont2606.i, %cleanup.cont2653.i, %cleanup.cont2700.i, %cleanup.cont2747.i, %cleanup.cont2794.i, %cleanup.cont2841.i, %cleanup.cont2888.i, %cleanup.cont2935.i, %cleanup.cont2982.i, %cleanup.cont3029.i, %cleanup.cont3076.i, %cleanup.cont3123.i, %cleanup.cont3170.i, %cleanup.cont3217.i, %sw.bb3231.i, %sw.bb3233.i, %sw.bb3237.i, %sw.bb3239.i, %sw.bb3247.i, %sw.bb3255.i
  %2598 = load i32, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 2), align 8, !tbaa !7
  %conv1290 = zext i32 %2598 to i64
  %2599 = load i32, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 3), align 4, !tbaa !7
  %conv1291 = zext i32 %2599 to i64
  %shl1292 = shl nuw i64 %conv1291, 32
  %or1293 = or i64 %shl1292, %conv1290
  %xor1295 = xor i64 %or1293, %1816
  %2600 = load i32, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 0), align 16, !tbaa !7
  %conv1296 = zext i32 %2600 to i64
  %2601 = load i32, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @r, i32 0, i32 1), align 4, !tbaa !7
  %conv1297 = zext i32 %2601 to i64
  %shl1298 = shl nuw i64 %conv1297, 32
  %or1299 = or i64 %shl1298, %conv1296
  %xor1301 = xor i64 %or1299, %1817
  store i64 %xor1295, i64* %75, align 16
  store i64 %xor1301, i64* %83, align 8
  br label %do.end1306

do.end1306:                                       ; preds = %do.end1106.do.end1306_crit_edge, %v4_random_math.exit
  %d.sroa.0.sroa.0.0.extract.trunc5269.pre-phi = phi i32 [ %.pre5789, %do.end1106.do.end1306_crit_edge ], [ %c.sroa.0.sroa.0.0.extract.trunc, %v4_random_math.exit ]
  %.pre-phi5788 = phi i64* [ %.phi.trans.insert5776, %do.end1106.do.end1306_crit_edge ], [ %t1253.sroa.0.0.arrayidx1255.sroa_cast, %v4_random_math.exit ]
  %2602 = phi i64 [ %1816, %do.end1106.do.end1306_crit_edge ], [ %xor1295, %v4_random_math.exit ]
  %2603 = phi i64 [ %1817, %do.end1106.do.end1306_crit_edge ], [ %xor1301, %v4_random_math.exit ]
  %2604 = phi i64 [ %.pre5777, %do.end1106.do.end1306_crit_edge ], [ %xor1263, %v4_random_math.exit ]
  %and.i2678 = and i64 %xor1236, 4294967295
  %and2.i = and i64 %2604, 4294967295
  %mul.i = mul nuw i64 %and2.i, %and.i2678
  %and3.i = and i64 %mul.i, 4294967295
  %shr.i = lshr i64 %mul.i, 32
  %shr4.i = lshr i64 %xor1236, 32
  %mul5.i = mul nuw i64 %and2.i, %shr4.i
  %add.i2679 = add nuw i64 %shr.i, %mul5.i
  %and6.i = and i64 %add.i2679, 4294967295
  %shr7.i = lshr i64 %add.i2679, 32
  %shr8.i = lshr i64 %2604, 32
  %mul9.i = mul nuw i64 %shr8.i, %and.i2678
  %add10.i = add nuw i64 %and6.i, %mul9.i
  %shr11.i = lshr i64 %add10.i, 32
  %mul12.i = mul nuw i64 %shr8.i, %shr4.i
  %add13.i = add nuw i64 %shr7.i, %mul12.i
  %add14.i = add nuw i64 %add13.i, %shr11.i
  %shl.i2680 = shl i64 %add10.i, 32
  %add15.i = or i64 %shl.i2680, %and3.i
  %xor1312 = xor i32 %and1246, 16
  %add.ptr1313 = getelementptr inbounds i8, i8* %call, i32 %xor1312
  %2605 = bitcast i8* %add.ptr1313 to i64*
  %xor1315 = xor i32 %and1246, 32
  %add.ptr1316 = getelementptr inbounds i8, i8* %call, i32 %xor1315
  %2606 = bitcast i8* %add.ptr1316 to i64*
  %xor1318 = xor i32 %and1246, 48
  %add.ptr1319 = getelementptr inbounds i8, i8* %call, i32 %xor1318
  %2607 = bitcast i8* %add.ptr1319 to i64*
  %2608 = load i64, i64* %2605, align 8, !tbaa !2
  %arrayidx1325 = getelementptr inbounds i8, i8* %add.ptr1313, i32 8
  %2609 = bitcast i8* %arrayidx1325 to i64*
  %2610 = load i64, i64* %2609, align 8, !tbaa !2
  %2611 = load i64, i64* %2606, align 8, !tbaa !2
  %arrayidx1329 = getelementptr inbounds i8, i8* %add.ptr1316, i32 8
  %2612 = bitcast i8* %arrayidx1329 to i64*
  %2613 = load i64, i64* %2612, align 8, !tbaa !2
  %2614 = load i64, i64* %2607, align 8, !tbaa !2
  %arrayidx1333 = getelementptr inbounds i8, i8* %add.ptr1319, i32 8
  %2615 = bitcast i8* %arrayidx1333 to i64*
  %2616 = load i64, i64* %2615, align 8, !tbaa !2
  %add1336 = add i64 %2614, %965
  store i64 %add1336, i64* %2605, align 8, !tbaa !2
  %add1340 = add i64 %2616, %966
  store i64 %add1340, i64* %2609, align 8, !tbaa !2
  %add1344 = add i64 %2611, %xor.i2712
  store i64 %add1344, i64* %2607, align 8, !tbaa !2
  %add1348 = add i64 %2613, %xor8.i2714
  store i64 %add1348, i64* %2615, align 8, !tbaa !2
  %add1352 = add i64 %2608, %xor1165
  store i64 %add1352, i64* %2606, align 8, !tbaa !2
  %add1356 = add i64 %2610, %xor1167
  store i64 %add1356, i64* %2612, align 8, !tbaa !2
  %xor1358 = xor i64 %2611, %2608
  %xor1359 = xor i64 %2613, %2610
  %xor1361 = xor i64 %xor1236, %2614
  %xor1363 = xor i64 %xor1238, %2616
  %xor1365 = xor i64 %xor1358, %xor1361
  store i64 %xor1365, i64* %76, align 16, !tbaa !2
  %xor1367 = xor i64 %xor1359, %xor1363
  store i64 %xor1367, i64* %86, align 8, !tbaa !2
  %add.i2675 = add i64 %2603, %add15.i
  %add4.i = add i64 %add14.i, %2602
  %2617 = load i64, i64* %.pre-phi5788, align 8, !tbaa !2
  %xor.i2676 = xor i64 %2617, %add4.i
  store i64 %xor.i2676, i64* %75, align 16, !tbaa !2
  %arrayidx7.i2677 = getelementptr inbounds i8, i8* %arrayidx1108, i32 %and1246
  %2618 = bitcast i8* %arrayidx7.i2677 to i64*
  %2619 = load i64, i64* %2618, align 8, !tbaa !2
  %xor8.i = xor i64 %2619, %add.i2675
  store i64 %xor8.i, i64* %83, align 8, !tbaa !2
  store i64 %add4.i, i64* %.pre-phi5788, align 8, !tbaa !2
  store i64 %add.i2675, i64* %2618, align 8, !tbaa !2
  %d.sroa.0.sroa.23.0.extract.shift5312 = lshr i64 %xor1165, 32
  %d.sroa.0.sroa.23.0.extract.trunc5313 = trunc i64 %d.sroa.0.sroa.23.0.extract.shift5312 to i32
  %inc1376 = add nuw nsw i32 %i.65717, 1
  %exitcond5769 = icmp eq i32 %inc1376, %iter.0
  %2620 = trunc i64 %xor.i2676 to i32
  %2621 = lshr i64 %xor.i2676, 32
  %2622 = trunc i64 %2621 to i32
  %2623 = trunc i64 %xor8.i to i32
  br i1 %exitcond5769, label %if.end1380, label %for.body980

if.end1380.loopexit:                              ; preds = %for.body109
  store i64 %xor.i4793, i64* %75, align 16, !tbaa !2
  br label %if.end1380

if.end1380.loopexit5793:                          ; preds = %for.body154
  store i64 %xor.i4590, i64* %75, align 16, !tbaa !2
  br label %if.end1380

if.end1380.loopexit5794:                          ; preds = %for.body611
  store i64 %xor.i4147, i64* %75, align 16, !tbaa !2
  br label %if.end1380

if.end1380.loopexit5795:                          ; preds = %for.body256
  store i64 %xor.i4369, i64* %75, align 16, !tbaa !2
  br label %if.end1380

if.end1380:                                       ; preds = %do.end1306, %if.end1380.loopexit5795, %if.end1380.loopexit5794, %if.end1380.loopexit5793, %if.end1380.loopexit
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 16 dereferenceable(128) getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 0), i8* nonnull align 8 dereferenceable(128) %arraydecay6, i32 128, i1 false)
  %call1383 = call i32 @oaes_free(i8** nonnull %5) #7
  %call1384 = call i8* @oaes_alloc() #7
  store i8* %call1384, i8** %5, align 4, !tbaa !9
  %2624 = bitcast i64* %arrayidx85 to i8*
  %call1388 = call i32 @oaes_key_import_data(i8* %call1384, i8* nonnull %2624, i32 32) #7
  %2625 = load %struct._oaes_ctx*, %struct._oaes_ctx** %aes_ctx, align 4, !tbaa !9
  %key1414 = getelementptr inbounds %struct._oaes_ctx, %struct._oaes_ctx* %2625, i32 0, i32 0
  %2626 = load %struct._oaes_key*, %struct._oaes_key** %key1414, align 4, !tbaa !19
  %exp_data1415 = getelementptr inbounds %struct._oaes_key, %struct._oaes_key* %2626, i32 0, i32 3
  %2627 = load i8*, i8** %exp_data1415, align 4, !tbaa !22
  br label %for.body1392

for.body1392:                                     ; preds = %if.end1380, %for.inc1421
  %i.75699 = phi i32 [ 0, %if.end1380 ], [ %add1422, %for.inc1421 ]
  %arrayidx1394 = getelementptr inbounds i8, i8* %call, i32 %i.75699
  %2628 = bitcast i8* %arrayidx1394 to i64*
  %2629 = load i64, i64* %2628, align 8, !tbaa !2
  %2630 = load i64, i64* bitcast ([128 x i8]* @text to i64*), align 16, !tbaa !2
  %xor.i2670 = xor i64 %2630, %2629
  store i64 %xor.i2670, i64* bitcast ([128 x i8]* @text to i64*), align 16, !tbaa !2
  %arrayidx2.i2671 = getelementptr inbounds i8, i8* %arrayidx1394, i32 8
  %2631 = bitcast i8* %arrayidx2.i2671 to i64*
  %2632 = load i64, i64* %2631, align 8, !tbaa !2
  %2633 = load i64, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 8) to i64*), align 8, !tbaa !2
  %xor4.i2672 = xor i64 %2633, %2632
  store i64 %xor4.i2672, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 8) to i64*), align 8, !tbaa !2
  %add1395 = or i32 %i.75699, 16
  %arrayidx1396 = getelementptr inbounds i8, i8* %call, i32 %add1395
  %2634 = bitcast i8* %arrayidx1396 to i64*
  %2635 = load i64, i64* %2634, align 8, !tbaa !2
  %2636 = load i64, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 16) to i64*), align 16, !tbaa !2
  %xor.i2667 = xor i64 %2636, %2635
  store i64 %xor.i2667, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 16) to i64*), align 16, !tbaa !2
  %arrayidx2.i2668 = getelementptr inbounds i8, i8* %arrayidx1396, i32 8
  %2637 = bitcast i8* %arrayidx2.i2668 to i64*
  %2638 = load i64, i64* %2637, align 8, !tbaa !2
  %2639 = load i64, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 24) to i64*), align 8, !tbaa !2
  %xor4.i2669 = xor i64 %2639, %2638
  store i64 %xor4.i2669, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 24) to i64*), align 8, !tbaa !2
  %add1397 = or i32 %i.75699, 32
  %arrayidx1398 = getelementptr inbounds i8, i8* %call, i32 %add1397
  %2640 = bitcast i8* %arrayidx1398 to i64*
  %2641 = load i64, i64* %2640, align 8, !tbaa !2
  %2642 = load i64, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 32) to i64*), align 16, !tbaa !2
  %xor.i2664 = xor i64 %2642, %2641
  store i64 %xor.i2664, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 32) to i64*), align 16, !tbaa !2
  %arrayidx2.i2665 = getelementptr inbounds i8, i8* %arrayidx1398, i32 8
  %2643 = bitcast i8* %arrayidx2.i2665 to i64*
  %2644 = load i64, i64* %2643, align 8, !tbaa !2
  %2645 = load i64, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 40) to i64*), align 8, !tbaa !2
  %xor4.i2666 = xor i64 %2645, %2644
  store i64 %xor4.i2666, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 40) to i64*), align 8, !tbaa !2
  %add1399 = or i32 %i.75699, 48
  %arrayidx1400 = getelementptr inbounds i8, i8* %call, i32 %add1399
  %2646 = bitcast i8* %arrayidx1400 to i64*
  %2647 = load i64, i64* %2646, align 8, !tbaa !2
  %2648 = load i64, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 48) to i64*), align 16, !tbaa !2
  %xor.i2661 = xor i64 %2648, %2647
  store i64 %xor.i2661, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 48) to i64*), align 16, !tbaa !2
  %arrayidx2.i2662 = getelementptr inbounds i8, i8* %arrayidx1400, i32 8
  %2649 = bitcast i8* %arrayidx2.i2662 to i64*
  %2650 = load i64, i64* %2649, align 8, !tbaa !2
  %2651 = load i64, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 56) to i64*), align 8, !tbaa !2
  %xor4.i2663 = xor i64 %2651, %2650
  store i64 %xor4.i2663, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 56) to i64*), align 8, !tbaa !2
  %add1401 = or i32 %i.75699, 64
  %arrayidx1402 = getelementptr inbounds i8, i8* %call, i32 %add1401
  %2652 = bitcast i8* %arrayidx1402 to i64*
  %2653 = load i64, i64* %2652, align 8, !tbaa !2
  %2654 = load i64, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 64) to i64*), align 16, !tbaa !2
  %xor.i2658 = xor i64 %2654, %2653
  store i64 %xor.i2658, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 64) to i64*), align 16, !tbaa !2
  %arrayidx2.i2659 = getelementptr inbounds i8, i8* %arrayidx1402, i32 8
  %2655 = bitcast i8* %arrayidx2.i2659 to i64*
  %2656 = load i64, i64* %2655, align 8, !tbaa !2
  %2657 = load i64, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 72) to i64*), align 8, !tbaa !2
  %xor4.i2660 = xor i64 %2657, %2656
  store i64 %xor4.i2660, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 72) to i64*), align 8, !tbaa !2
  %add1403 = or i32 %i.75699, 80
  %arrayidx1404 = getelementptr inbounds i8, i8* %call, i32 %add1403
  %2658 = bitcast i8* %arrayidx1404 to i64*
  %2659 = load i64, i64* %2658, align 8, !tbaa !2
  %2660 = load i64, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 80) to i64*), align 16, !tbaa !2
  %xor.i2655 = xor i64 %2660, %2659
  store i64 %xor.i2655, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 80) to i64*), align 16, !tbaa !2
  %arrayidx2.i2656 = getelementptr inbounds i8, i8* %arrayidx1404, i32 8
  %2661 = bitcast i8* %arrayidx2.i2656 to i64*
  %2662 = load i64, i64* %2661, align 8, !tbaa !2
  %2663 = load i64, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 88) to i64*), align 8, !tbaa !2
  %xor4.i2657 = xor i64 %2663, %2662
  store i64 %xor4.i2657, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 88) to i64*), align 8, !tbaa !2
  %add1405 = or i32 %i.75699, 96
  %arrayidx1406 = getelementptr inbounds i8, i8* %call, i32 %add1405
  %2664 = bitcast i8* %arrayidx1406 to i64*
  %2665 = load i64, i64* %2664, align 8, !tbaa !2
  %2666 = load i64, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 96) to i64*), align 16, !tbaa !2
  %xor.i2652 = xor i64 %2666, %2665
  store i64 %xor.i2652, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 96) to i64*), align 16, !tbaa !2
  %arrayidx2.i2653 = getelementptr inbounds i8, i8* %arrayidx1406, i32 8
  %2667 = bitcast i8* %arrayidx2.i2653 to i64*
  %2668 = load i64, i64* %2667, align 8, !tbaa !2
  %2669 = load i64, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 104) to i64*), align 8, !tbaa !2
  %xor4.i2654 = xor i64 %2669, %2668
  store i64 %xor4.i2654, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 104) to i64*), align 8, !tbaa !2
  %add1407 = or i32 %i.75699, 112
  %arrayidx1408 = getelementptr inbounds i8, i8* %call, i32 %add1407
  %2670 = bitcast i8* %arrayidx1408 to i64*
  %2671 = load i64, i64* %2670, align 8, !tbaa !2
  %2672 = load i64, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 112) to i64*), align 16, !tbaa !2
  %xor.i2651 = xor i64 %2672, %2671
  store i64 %xor.i2651, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 112) to i64*), align 16, !tbaa !2
  %arrayidx2.i = getelementptr inbounds i8, i8* %arrayidx1408, i32 8
  %2673 = bitcast i8* %arrayidx2.i to i64*
  %2674 = load i64, i64* %2673, align 8, !tbaa !2
  %2675 = load i64, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 120) to i64*), align 8, !tbaa !2
  %xor4.i = xor i64 %2675, %2674
  store i64 %xor4.i, i64* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 120) to i64*), align 8, !tbaa !2
  %2676 = lshr i64 %xor.i2670, 24
  %2677 = trunc i64 %2676 to i8
  %2678 = lshr i64 %xor4.i2672, 24
  %2679 = trunc i64 %2678 to i8
  %2680 = lshr i64 %xor4.i2672, 16
  %2681 = trunc i64 %2680 to i8
  %2682 = lshr i64 %xor4.i2672, 56
  %2683 = trunc i64 %2682 to i8
  %2684 = lshr i64 %xor.i2667, 24
  %2685 = trunc i64 %2684 to i8
  %2686 = lshr i64 %xor.i2667, 16
  %2687 = trunc i64 %2686 to i8
  br label %for.body1412

for.body1412:                                     ; preds = %for.body1412.for.body1412_crit_edge, %for.body1392
  %2688 = phi i8 [ %2687, %for.body1392 ], [ %.pre5787, %for.body1412.for.body1412_crit_edge ]
  %2689 = phi i8 [ %2685, %for.body1392 ], [ %.pre5786, %for.body1412.for.body1412_crit_edge ]
  %2690 = phi i8 [ %2683, %for.body1392 ], [ %.pre5785, %for.body1412.for.body1412_crit_edge ]
  %2691 = phi i8 [ %2681, %for.body1392 ], [ %.pre5784, %for.body1412.for.body1412_crit_edge ]
  %2692 = phi i8 [ %2679, %for.body1392 ], [ %.pre5783, %for.body1412.for.body1412_crit_edge ]
  %2693 = phi i8 [ %2677, %for.body1392 ], [ %.pre5782, %for.body1412.for.body1412_crit_edge ]
  %j.15698 = phi i32 [ 0, %for.body1392 ], [ %inc1419, %for.body1412.for.body1412_crit_edge ]
  %shl1416 = shl nuw nsw i32 %j.15698, 4
  %arrayidx1417 = getelementptr inbounds i8, i8* %2627, i32 %shl1416
  %2694 = bitcast i8* %arrayidx1417 to i32*
  %2695 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 2), align 2, !tbaa !6
  %2696 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 7), align 1, !tbaa !6
  %2697 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 1), align 1, !tbaa !6
  %2698 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 6), align 2, !tbaa !6
  %2699 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 0), align 16, !tbaa !6
  %idxprom.i2600 = zext i8 %2699 to i32
  %arrayidx14.i2601 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i2600
  %2700 = load i32, i32* %arrayidx14.i2601, align 4, !tbaa !7
  %2701 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 5), align 1, !tbaa !6
  %idxprom16.i2602 = zext i8 %2701 to i32
  %arrayidx17.i2603 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom16.i2602
  %2702 = load i32, i32* %arrayidx17.i2603, align 4, !tbaa !7
  %xor.i2604 = xor i32 %2702, %2700
  %idxprom19.i2605 = zext i8 %2691 to i32
  %arrayidx20.i2606 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom19.i2605
  %2703 = load i32, i32* %arrayidx20.i2606, align 4, !tbaa !7
  %xor21.i2607 = xor i32 %xor.i2604, %2703
  %idxprom23.i2608 = zext i8 %2690 to i32
  %arrayidx24.i2609 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom23.i2608
  %2704 = load i32, i32* %arrayidx24.i2609, align 4, !tbaa !7
  %xor25.i2610 = xor i32 %xor21.i2607, %2704
  %2705 = load i32, i32* %2694, align 4, !tbaa !7
  %xor27.i2611 = xor i32 %xor25.i2610, %2705
  store i32 %xor27.i2611, i32* bitcast ([128 x i8]* @text to i32*), align 16, !tbaa !7
  %idxprom30.i2612 = zext i8 %2693 to i32
  %arrayidx31.i2613 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom30.i2612
  %2706 = load i32, i32* %arrayidx31.i2613, align 4, !tbaa !7
  %2707 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 4), align 4, !tbaa !6
  %idxprom33.i2614 = zext i8 %2707 to i32
  %arrayidx34.i2615 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom33.i2614
  %2708 = load i32, i32* %arrayidx34.i2615, align 4, !tbaa !7
  %xor35.i2616 = xor i32 %2708, %2706
  %2709 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 9), align 1, !tbaa !6
  %idxprom37.i2617 = zext i8 %2709 to i32
  %arrayidx38.i2618 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom37.i2617
  %2710 = load i32, i32* %arrayidx38.i2618, align 4, !tbaa !7
  %xor39.i2619 = xor i32 %xor35.i2616, %2710
  %2711 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 14), align 2, !tbaa !6
  %idxprom41.i2620 = zext i8 %2711 to i32
  %arrayidx42.i2621 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom41.i2620
  %2712 = load i32, i32* %arrayidx42.i2621, align 4, !tbaa !7
  %xor43.i2622 = xor i32 %xor39.i2619, %2712
  %arrayidx44.i2623 = getelementptr inbounds i8, i8* %arrayidx1417, i32 4
  %2713 = bitcast i8* %arrayidx44.i2623 to i32*
  %2714 = load i32, i32* %2713, align 4, !tbaa !7
  %xor45.i2624 = xor i32 %xor43.i2622, %2714
  store i32 %xor45.i2624, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 4) to i32*), align 4, !tbaa !7
  %idxprom48.i2625 = zext i8 %2695 to i32
  %arrayidx49.i2626 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom48.i2625
  %2715 = load i32, i32* %arrayidx49.i2626, align 4, !tbaa !7
  %idxprom51.i2627 = zext i8 %2696 to i32
  %arrayidx52.i2628 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom51.i2627
  %2716 = load i32, i32* %arrayidx52.i2628, align 4, !tbaa !7
  %xor53.i2629 = xor i32 %2716, %2715
  %2717 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 8), align 8, !tbaa !6
  %idxprom55.i2630 = zext i8 %2717 to i32
  %arrayidx56.i2631 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom55.i2630
  %2718 = load i32, i32* %arrayidx56.i2631, align 4, !tbaa !7
  %xor57.i2632 = xor i32 %xor53.i2629, %2718
  %2719 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 13), align 1, !tbaa !6
  %idxprom59.i2633 = zext i8 %2719 to i32
  %arrayidx60.i2634 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom59.i2633
  %2720 = load i32, i32* %arrayidx60.i2634, align 4, !tbaa !7
  %xor61.i2635 = xor i32 %xor57.i2632, %2720
  %arrayidx62.i2636 = getelementptr inbounds i8, i8* %arrayidx1417, i32 8
  %2721 = bitcast i8* %arrayidx62.i2636 to i32*
  %2722 = load i32, i32* %2721, align 4, !tbaa !7
  %xor63.i2637 = xor i32 %xor61.i2635, %2722
  store i32 %xor63.i2637, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 8) to i32*), align 8, !tbaa !7
  %idxprom66.i2638 = zext i8 %2697 to i32
  %arrayidx67.i2639 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom66.i2638
  %2723 = load i32, i32* %arrayidx67.i2639, align 4, !tbaa !7
  %idxprom69.i2640 = zext i8 %2698 to i32
  %arrayidx70.i2641 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom69.i2640
  %2724 = load i32, i32* %arrayidx70.i2641, align 4, !tbaa !7
  %xor71.i2642 = xor i32 %2724, %2723
  %idxprom73.i2643 = zext i8 %2692 to i32
  %arrayidx74.i2644 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom73.i2643
  %2725 = load i32, i32* %arrayidx74.i2644, align 4, !tbaa !7
  %xor75.i2645 = xor i32 %xor71.i2642, %2725
  %2726 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 12), align 4, !tbaa !6
  %idxprom77.i2646 = zext i8 %2726 to i32
  %arrayidx78.i2647 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom77.i2646
  %2727 = load i32, i32* %arrayidx78.i2647, align 4, !tbaa !7
  %xor79.i2648 = xor i32 %xor75.i2645, %2727
  %arrayidx80.i2649 = getelementptr inbounds i8, i8* %arrayidx1417, i32 12
  %2728 = bitcast i8* %arrayidx80.i2649 to i32*
  %2729 = load i32, i32* %2728, align 4, !tbaa !7
  %xor81.i2650 = xor i32 %xor79.i2648, %2729
  store i32 %xor81.i2650, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 12) to i32*), align 4, !tbaa !7
  %2730 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 23), align 1, !tbaa !6
  %2731 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 17), align 1, !tbaa !6
  %2732 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 22), align 2, !tbaa !6
  %2733 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 27), align 1, !tbaa !6
  %2734 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 16), align 16, !tbaa !6
  %idxprom.i2549 = zext i8 %2734 to i32
  %arrayidx14.i2550 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i2549
  %2735 = load i32, i32* %arrayidx14.i2550, align 4, !tbaa !7
  %2736 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 21), align 1, !tbaa !6
  %idxprom16.i2551 = zext i8 %2736 to i32
  %arrayidx17.i2552 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom16.i2551
  %2737 = load i32, i32* %arrayidx17.i2552, align 4, !tbaa !7
  %xor.i2553 = xor i32 %2737, %2735
  %2738 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 26), align 2, !tbaa !6
  %idxprom19.i2554 = zext i8 %2738 to i32
  %arrayidx20.i2555 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom19.i2554
  %2739 = load i32, i32* %arrayidx20.i2555, align 4, !tbaa !7
  %xor21.i2556 = xor i32 %xor.i2553, %2739
  %2740 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 31), align 1, !tbaa !6
  %idxprom23.i2557 = zext i8 %2740 to i32
  %arrayidx24.i2558 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom23.i2557
  %2741 = load i32, i32* %arrayidx24.i2558, align 4, !tbaa !7
  %xor25.i2559 = xor i32 %xor21.i2556, %2741
  %2742 = load i32, i32* %2694, align 4, !tbaa !7
  %xor27.i2560 = xor i32 %xor25.i2559, %2742
  store i32 %xor27.i2560, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 16) to i32*), align 16, !tbaa !7
  %idxprom30.i2561 = zext i8 %2689 to i32
  %arrayidx31.i2562 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom30.i2561
  %2743 = load i32, i32* %arrayidx31.i2562, align 4, !tbaa !7
  %2744 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 20), align 4, !tbaa !6
  %idxprom33.i2563 = zext i8 %2744 to i32
  %arrayidx34.i2564 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom33.i2563
  %2745 = load i32, i32* %arrayidx34.i2564, align 4, !tbaa !7
  %xor35.i2565 = xor i32 %2745, %2743
  %2746 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 25), align 1, !tbaa !6
  %idxprom37.i2566 = zext i8 %2746 to i32
  %arrayidx38.i2567 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom37.i2566
  %2747 = load i32, i32* %arrayidx38.i2567, align 4, !tbaa !7
  %xor39.i2568 = xor i32 %xor35.i2565, %2747
  %2748 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 30), align 2, !tbaa !6
  %idxprom41.i2569 = zext i8 %2748 to i32
  %arrayidx42.i2570 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom41.i2569
  %2749 = load i32, i32* %arrayidx42.i2570, align 4, !tbaa !7
  %xor43.i2571 = xor i32 %xor39.i2568, %2749
  %2750 = load i32, i32* %2713, align 4, !tbaa !7
  %xor45.i2573 = xor i32 %xor43.i2571, %2750
  store i32 %xor45.i2573, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 20) to i32*), align 4, !tbaa !7
  %idxprom48.i2574 = zext i8 %2688 to i32
  %arrayidx49.i2575 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom48.i2574
  %2751 = load i32, i32* %arrayidx49.i2575, align 4, !tbaa !7
  %idxprom51.i2576 = zext i8 %2730 to i32
  %arrayidx52.i2577 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom51.i2576
  %2752 = load i32, i32* %arrayidx52.i2577, align 4, !tbaa !7
  %xor53.i2578 = xor i32 %2752, %2751
  %2753 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 24), align 8, !tbaa !6
  %idxprom55.i2579 = zext i8 %2753 to i32
  %arrayidx56.i2580 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom55.i2579
  %2754 = load i32, i32* %arrayidx56.i2580, align 4, !tbaa !7
  %xor57.i2581 = xor i32 %xor53.i2578, %2754
  %2755 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 29), align 1, !tbaa !6
  %idxprom59.i2582 = zext i8 %2755 to i32
  %arrayidx60.i2583 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom59.i2582
  %2756 = load i32, i32* %arrayidx60.i2583, align 4, !tbaa !7
  %xor61.i2584 = xor i32 %xor57.i2581, %2756
  %2757 = load i32, i32* %2721, align 4, !tbaa !7
  %xor63.i2586 = xor i32 %xor61.i2584, %2757
  store i32 %xor63.i2586, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 24) to i32*), align 8, !tbaa !7
  %idxprom66.i2587 = zext i8 %2731 to i32
  %arrayidx67.i2588 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom66.i2587
  %2758 = load i32, i32* %arrayidx67.i2588, align 4, !tbaa !7
  %idxprom69.i2589 = zext i8 %2732 to i32
  %arrayidx70.i2590 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom69.i2589
  %2759 = load i32, i32* %arrayidx70.i2590, align 4, !tbaa !7
  %xor71.i2591 = xor i32 %2759, %2758
  %idxprom73.i2592 = zext i8 %2733 to i32
  %arrayidx74.i2593 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom73.i2592
  %2760 = load i32, i32* %arrayidx74.i2593, align 4, !tbaa !7
  %xor75.i2594 = xor i32 %xor71.i2591, %2760
  %2761 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 28), align 4, !tbaa !6
  %idxprom77.i2595 = zext i8 %2761 to i32
  %arrayidx78.i2596 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom77.i2595
  %2762 = load i32, i32* %arrayidx78.i2596, align 4, !tbaa !7
  %xor79.i2597 = xor i32 %xor75.i2594, %2762
  %2763 = load i32, i32* %2728, align 4, !tbaa !7
  %xor81.i2599 = xor i32 %xor79.i2597, %2763
  store i32 %xor81.i2599, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 28) to i32*), align 4, !tbaa !7
  %2764 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 35), align 1, !tbaa !6
  %2765 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 34), align 2, !tbaa !6
  %2766 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 39), align 1, !tbaa !6
  %2767 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 33), align 1, !tbaa !6
  %2768 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 38), align 2, !tbaa !6
  %2769 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 43), align 1, !tbaa !6
  %2770 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 32), align 16, !tbaa !6
  %idxprom.i2498 = zext i8 %2770 to i32
  %arrayidx14.i2499 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i2498
  %2771 = load i32, i32* %arrayidx14.i2499, align 4, !tbaa !7
  %2772 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 37), align 1, !tbaa !6
  %idxprom16.i2500 = zext i8 %2772 to i32
  %arrayidx17.i2501 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom16.i2500
  %2773 = load i32, i32* %arrayidx17.i2501, align 4, !tbaa !7
  %xor.i2502 = xor i32 %2773, %2771
  %2774 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 42), align 2, !tbaa !6
  %idxprom19.i2503 = zext i8 %2774 to i32
  %arrayidx20.i2504 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom19.i2503
  %2775 = load i32, i32* %arrayidx20.i2504, align 4, !tbaa !7
  %xor21.i2505 = xor i32 %xor.i2502, %2775
  %2776 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 47), align 1, !tbaa !6
  %idxprom23.i2506 = zext i8 %2776 to i32
  %arrayidx24.i2507 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom23.i2506
  %2777 = load i32, i32* %arrayidx24.i2507, align 4, !tbaa !7
  %xor25.i2508 = xor i32 %xor21.i2505, %2777
  %2778 = load i32, i32* %2694, align 4, !tbaa !7
  %xor27.i2509 = xor i32 %xor25.i2508, %2778
  store i32 %xor27.i2509, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 32) to i32*), align 16, !tbaa !7
  %idxprom30.i2510 = zext i8 %2764 to i32
  %arrayidx31.i2511 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom30.i2510
  %2779 = load i32, i32* %arrayidx31.i2511, align 4, !tbaa !7
  %2780 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 36), align 4, !tbaa !6
  %idxprom33.i2512 = zext i8 %2780 to i32
  %arrayidx34.i2513 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom33.i2512
  %2781 = load i32, i32* %arrayidx34.i2513, align 4, !tbaa !7
  %xor35.i2514 = xor i32 %2781, %2779
  %2782 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 41), align 1, !tbaa !6
  %idxprom37.i2515 = zext i8 %2782 to i32
  %arrayidx38.i2516 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom37.i2515
  %2783 = load i32, i32* %arrayidx38.i2516, align 4, !tbaa !7
  %xor39.i2517 = xor i32 %xor35.i2514, %2783
  %2784 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 46), align 2, !tbaa !6
  %idxprom41.i2518 = zext i8 %2784 to i32
  %arrayidx42.i2519 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom41.i2518
  %2785 = load i32, i32* %arrayidx42.i2519, align 4, !tbaa !7
  %xor43.i2520 = xor i32 %xor39.i2517, %2785
  %2786 = load i32, i32* %2713, align 4, !tbaa !7
  %xor45.i2522 = xor i32 %xor43.i2520, %2786
  store i32 %xor45.i2522, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 36) to i32*), align 4, !tbaa !7
  %idxprom48.i2523 = zext i8 %2765 to i32
  %arrayidx49.i2524 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom48.i2523
  %2787 = load i32, i32* %arrayidx49.i2524, align 4, !tbaa !7
  %idxprom51.i2525 = zext i8 %2766 to i32
  %arrayidx52.i2526 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom51.i2525
  %2788 = load i32, i32* %arrayidx52.i2526, align 4, !tbaa !7
  %xor53.i2527 = xor i32 %2788, %2787
  %2789 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 40), align 8, !tbaa !6
  %idxprom55.i2528 = zext i8 %2789 to i32
  %arrayidx56.i2529 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom55.i2528
  %2790 = load i32, i32* %arrayidx56.i2529, align 4, !tbaa !7
  %xor57.i2530 = xor i32 %xor53.i2527, %2790
  %2791 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 45), align 1, !tbaa !6
  %idxprom59.i2531 = zext i8 %2791 to i32
  %arrayidx60.i2532 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom59.i2531
  %2792 = load i32, i32* %arrayidx60.i2532, align 4, !tbaa !7
  %xor61.i2533 = xor i32 %xor57.i2530, %2792
  %2793 = load i32, i32* %2721, align 4, !tbaa !7
  %xor63.i2535 = xor i32 %xor61.i2533, %2793
  store i32 %xor63.i2535, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 40) to i32*), align 8, !tbaa !7
  %idxprom66.i2536 = zext i8 %2767 to i32
  %arrayidx67.i2537 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom66.i2536
  %2794 = load i32, i32* %arrayidx67.i2537, align 4, !tbaa !7
  %idxprom69.i2538 = zext i8 %2768 to i32
  %arrayidx70.i2539 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom69.i2538
  %2795 = load i32, i32* %arrayidx70.i2539, align 4, !tbaa !7
  %xor71.i2540 = xor i32 %2795, %2794
  %idxprom73.i2541 = zext i8 %2769 to i32
  %arrayidx74.i2542 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom73.i2541
  %2796 = load i32, i32* %arrayidx74.i2542, align 4, !tbaa !7
  %xor75.i2543 = xor i32 %xor71.i2540, %2796
  %2797 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 44), align 4, !tbaa !6
  %idxprom77.i2544 = zext i8 %2797 to i32
  %arrayidx78.i2545 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom77.i2544
  %2798 = load i32, i32* %arrayidx78.i2545, align 4, !tbaa !7
  %xor79.i2546 = xor i32 %xor75.i2543, %2798
  %2799 = load i32, i32* %2728, align 4, !tbaa !7
  %xor81.i2548 = xor i32 %xor79.i2546, %2799
  store i32 %xor81.i2548, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 44) to i32*), align 4, !tbaa !7
  %2800 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 51), align 1, !tbaa !6
  %2801 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 50), align 2, !tbaa !6
  %2802 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 55), align 1, !tbaa !6
  %2803 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 49), align 1, !tbaa !6
  %2804 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 54), align 2, !tbaa !6
  %2805 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 59), align 1, !tbaa !6
  %2806 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 48), align 16, !tbaa !6
  %idxprom.i2447 = zext i8 %2806 to i32
  %arrayidx14.i2448 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i2447
  %2807 = load i32, i32* %arrayidx14.i2448, align 4, !tbaa !7
  %2808 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 53), align 1, !tbaa !6
  %idxprom16.i2449 = zext i8 %2808 to i32
  %arrayidx17.i2450 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom16.i2449
  %2809 = load i32, i32* %arrayidx17.i2450, align 4, !tbaa !7
  %xor.i2451 = xor i32 %2809, %2807
  %2810 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 58), align 2, !tbaa !6
  %idxprom19.i2452 = zext i8 %2810 to i32
  %arrayidx20.i2453 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom19.i2452
  %2811 = load i32, i32* %arrayidx20.i2453, align 4, !tbaa !7
  %xor21.i2454 = xor i32 %xor.i2451, %2811
  %2812 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 63), align 1, !tbaa !6
  %idxprom23.i2455 = zext i8 %2812 to i32
  %arrayidx24.i2456 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom23.i2455
  %2813 = load i32, i32* %arrayidx24.i2456, align 4, !tbaa !7
  %xor25.i2457 = xor i32 %xor21.i2454, %2813
  %2814 = load i32, i32* %2694, align 4, !tbaa !7
  %xor27.i2458 = xor i32 %xor25.i2457, %2814
  store i32 %xor27.i2458, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 48) to i32*), align 16, !tbaa !7
  %idxprom30.i2459 = zext i8 %2800 to i32
  %arrayidx31.i2460 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom30.i2459
  %2815 = load i32, i32* %arrayidx31.i2460, align 4, !tbaa !7
  %2816 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 52), align 4, !tbaa !6
  %idxprom33.i2461 = zext i8 %2816 to i32
  %arrayidx34.i2462 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom33.i2461
  %2817 = load i32, i32* %arrayidx34.i2462, align 4, !tbaa !7
  %xor35.i2463 = xor i32 %2817, %2815
  %2818 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 57), align 1, !tbaa !6
  %idxprom37.i2464 = zext i8 %2818 to i32
  %arrayidx38.i2465 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom37.i2464
  %2819 = load i32, i32* %arrayidx38.i2465, align 4, !tbaa !7
  %xor39.i2466 = xor i32 %xor35.i2463, %2819
  %2820 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 62), align 2, !tbaa !6
  %idxprom41.i2467 = zext i8 %2820 to i32
  %arrayidx42.i2468 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom41.i2467
  %2821 = load i32, i32* %arrayidx42.i2468, align 4, !tbaa !7
  %xor43.i2469 = xor i32 %xor39.i2466, %2821
  %2822 = load i32, i32* %2713, align 4, !tbaa !7
  %xor45.i2471 = xor i32 %xor43.i2469, %2822
  store i32 %xor45.i2471, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 52) to i32*), align 4, !tbaa !7
  %idxprom48.i2472 = zext i8 %2801 to i32
  %arrayidx49.i2473 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom48.i2472
  %2823 = load i32, i32* %arrayidx49.i2473, align 4, !tbaa !7
  %idxprom51.i2474 = zext i8 %2802 to i32
  %arrayidx52.i2475 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom51.i2474
  %2824 = load i32, i32* %arrayidx52.i2475, align 4, !tbaa !7
  %xor53.i2476 = xor i32 %2824, %2823
  %2825 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 56), align 8, !tbaa !6
  %idxprom55.i2477 = zext i8 %2825 to i32
  %arrayidx56.i2478 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom55.i2477
  %2826 = load i32, i32* %arrayidx56.i2478, align 4, !tbaa !7
  %xor57.i2479 = xor i32 %xor53.i2476, %2826
  %2827 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 61), align 1, !tbaa !6
  %idxprom59.i2480 = zext i8 %2827 to i32
  %arrayidx60.i2481 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom59.i2480
  %2828 = load i32, i32* %arrayidx60.i2481, align 4, !tbaa !7
  %xor61.i2482 = xor i32 %xor57.i2479, %2828
  %2829 = load i32, i32* %2721, align 4, !tbaa !7
  %xor63.i2484 = xor i32 %xor61.i2482, %2829
  store i32 %xor63.i2484, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 56) to i32*), align 8, !tbaa !7
  %idxprom66.i2485 = zext i8 %2803 to i32
  %arrayidx67.i2486 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom66.i2485
  %2830 = load i32, i32* %arrayidx67.i2486, align 4, !tbaa !7
  %idxprom69.i2487 = zext i8 %2804 to i32
  %arrayidx70.i2488 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom69.i2487
  %2831 = load i32, i32* %arrayidx70.i2488, align 4, !tbaa !7
  %xor71.i2489 = xor i32 %2831, %2830
  %idxprom73.i2490 = zext i8 %2805 to i32
  %arrayidx74.i2491 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom73.i2490
  %2832 = load i32, i32* %arrayidx74.i2491, align 4, !tbaa !7
  %xor75.i2492 = xor i32 %xor71.i2489, %2832
  %2833 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 60), align 4, !tbaa !6
  %idxprom77.i2493 = zext i8 %2833 to i32
  %arrayidx78.i2494 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom77.i2493
  %2834 = load i32, i32* %arrayidx78.i2494, align 4, !tbaa !7
  %xor79.i2495 = xor i32 %xor75.i2492, %2834
  %2835 = load i32, i32* %2728, align 4, !tbaa !7
  %xor81.i2497 = xor i32 %xor79.i2495, %2835
  store i32 %xor81.i2497, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 60) to i32*), align 4, !tbaa !7
  %2836 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 67), align 1, !tbaa !6
  %2837 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 66), align 2, !tbaa !6
  %2838 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 71), align 1, !tbaa !6
  %2839 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 65), align 1, !tbaa !6
  %2840 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 70), align 2, !tbaa !6
  %2841 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 75), align 1, !tbaa !6
  %2842 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 64), align 16, !tbaa !6
  %idxprom.i2396 = zext i8 %2842 to i32
  %arrayidx14.i2397 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i2396
  %2843 = load i32, i32* %arrayidx14.i2397, align 4, !tbaa !7
  %2844 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 69), align 1, !tbaa !6
  %idxprom16.i2398 = zext i8 %2844 to i32
  %arrayidx17.i2399 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom16.i2398
  %2845 = load i32, i32* %arrayidx17.i2399, align 4, !tbaa !7
  %xor.i2400 = xor i32 %2845, %2843
  %2846 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 74), align 2, !tbaa !6
  %idxprom19.i2401 = zext i8 %2846 to i32
  %arrayidx20.i2402 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom19.i2401
  %2847 = load i32, i32* %arrayidx20.i2402, align 4, !tbaa !7
  %xor21.i2403 = xor i32 %xor.i2400, %2847
  %2848 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 79), align 1, !tbaa !6
  %idxprom23.i2404 = zext i8 %2848 to i32
  %arrayidx24.i2405 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom23.i2404
  %2849 = load i32, i32* %arrayidx24.i2405, align 4, !tbaa !7
  %xor25.i2406 = xor i32 %xor21.i2403, %2849
  %2850 = load i32, i32* %2694, align 4, !tbaa !7
  %xor27.i2407 = xor i32 %xor25.i2406, %2850
  store i32 %xor27.i2407, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 64) to i32*), align 16, !tbaa !7
  %idxprom30.i2408 = zext i8 %2836 to i32
  %arrayidx31.i2409 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom30.i2408
  %2851 = load i32, i32* %arrayidx31.i2409, align 4, !tbaa !7
  %2852 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 68), align 4, !tbaa !6
  %idxprom33.i2410 = zext i8 %2852 to i32
  %arrayidx34.i2411 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom33.i2410
  %2853 = load i32, i32* %arrayidx34.i2411, align 4, !tbaa !7
  %xor35.i2412 = xor i32 %2853, %2851
  %2854 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 73), align 1, !tbaa !6
  %idxprom37.i2413 = zext i8 %2854 to i32
  %arrayidx38.i2414 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom37.i2413
  %2855 = load i32, i32* %arrayidx38.i2414, align 4, !tbaa !7
  %xor39.i2415 = xor i32 %xor35.i2412, %2855
  %2856 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 78), align 2, !tbaa !6
  %idxprom41.i2416 = zext i8 %2856 to i32
  %arrayidx42.i2417 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom41.i2416
  %2857 = load i32, i32* %arrayidx42.i2417, align 4, !tbaa !7
  %xor43.i2418 = xor i32 %xor39.i2415, %2857
  %2858 = load i32, i32* %2713, align 4, !tbaa !7
  %xor45.i2420 = xor i32 %xor43.i2418, %2858
  store i32 %xor45.i2420, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 68) to i32*), align 4, !tbaa !7
  %idxprom48.i2421 = zext i8 %2837 to i32
  %arrayidx49.i2422 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom48.i2421
  %2859 = load i32, i32* %arrayidx49.i2422, align 4, !tbaa !7
  %idxprom51.i2423 = zext i8 %2838 to i32
  %arrayidx52.i2424 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom51.i2423
  %2860 = load i32, i32* %arrayidx52.i2424, align 4, !tbaa !7
  %xor53.i2425 = xor i32 %2860, %2859
  %2861 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 72), align 8, !tbaa !6
  %idxprom55.i2426 = zext i8 %2861 to i32
  %arrayidx56.i2427 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom55.i2426
  %2862 = load i32, i32* %arrayidx56.i2427, align 4, !tbaa !7
  %xor57.i2428 = xor i32 %xor53.i2425, %2862
  %2863 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 77), align 1, !tbaa !6
  %idxprom59.i2429 = zext i8 %2863 to i32
  %arrayidx60.i2430 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom59.i2429
  %2864 = load i32, i32* %arrayidx60.i2430, align 4, !tbaa !7
  %xor61.i2431 = xor i32 %xor57.i2428, %2864
  %2865 = load i32, i32* %2721, align 4, !tbaa !7
  %xor63.i2433 = xor i32 %xor61.i2431, %2865
  store i32 %xor63.i2433, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 72) to i32*), align 8, !tbaa !7
  %idxprom66.i2434 = zext i8 %2839 to i32
  %arrayidx67.i2435 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom66.i2434
  %2866 = load i32, i32* %arrayidx67.i2435, align 4, !tbaa !7
  %idxprom69.i2436 = zext i8 %2840 to i32
  %arrayidx70.i2437 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom69.i2436
  %2867 = load i32, i32* %arrayidx70.i2437, align 4, !tbaa !7
  %xor71.i2438 = xor i32 %2867, %2866
  %idxprom73.i2439 = zext i8 %2841 to i32
  %arrayidx74.i2440 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom73.i2439
  %2868 = load i32, i32* %arrayidx74.i2440, align 4, !tbaa !7
  %xor75.i2441 = xor i32 %xor71.i2438, %2868
  %2869 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 76), align 4, !tbaa !6
  %idxprom77.i2442 = zext i8 %2869 to i32
  %arrayidx78.i2443 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom77.i2442
  %2870 = load i32, i32* %arrayidx78.i2443, align 4, !tbaa !7
  %xor79.i2444 = xor i32 %xor75.i2441, %2870
  %2871 = load i32, i32* %2728, align 4, !tbaa !7
  %xor81.i2446 = xor i32 %xor79.i2444, %2871
  store i32 %xor81.i2446, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 76) to i32*), align 4, !tbaa !7
  %2872 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 83), align 1, !tbaa !6
  %2873 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 82), align 2, !tbaa !6
  %2874 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 87), align 1, !tbaa !6
  %2875 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 81), align 1, !tbaa !6
  %2876 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 86), align 2, !tbaa !6
  %2877 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 91), align 1, !tbaa !6
  %2878 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 80), align 16, !tbaa !6
  %idxprom.i2345 = zext i8 %2878 to i32
  %arrayidx14.i2346 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i2345
  %2879 = load i32, i32* %arrayidx14.i2346, align 4, !tbaa !7
  %2880 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 85), align 1, !tbaa !6
  %idxprom16.i2347 = zext i8 %2880 to i32
  %arrayidx17.i2348 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom16.i2347
  %2881 = load i32, i32* %arrayidx17.i2348, align 4, !tbaa !7
  %xor.i2349 = xor i32 %2881, %2879
  %2882 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 90), align 2, !tbaa !6
  %idxprom19.i2350 = zext i8 %2882 to i32
  %arrayidx20.i2351 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom19.i2350
  %2883 = load i32, i32* %arrayidx20.i2351, align 4, !tbaa !7
  %xor21.i2352 = xor i32 %xor.i2349, %2883
  %2884 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 95), align 1, !tbaa !6
  %idxprom23.i2353 = zext i8 %2884 to i32
  %arrayidx24.i2354 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom23.i2353
  %2885 = load i32, i32* %arrayidx24.i2354, align 4, !tbaa !7
  %xor25.i2355 = xor i32 %xor21.i2352, %2885
  %2886 = load i32, i32* %2694, align 4, !tbaa !7
  %xor27.i2356 = xor i32 %xor25.i2355, %2886
  store i32 %xor27.i2356, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 80) to i32*), align 16, !tbaa !7
  %idxprom30.i2357 = zext i8 %2872 to i32
  %arrayidx31.i2358 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom30.i2357
  %2887 = load i32, i32* %arrayidx31.i2358, align 4, !tbaa !7
  %2888 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 84), align 4, !tbaa !6
  %idxprom33.i2359 = zext i8 %2888 to i32
  %arrayidx34.i2360 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom33.i2359
  %2889 = load i32, i32* %arrayidx34.i2360, align 4, !tbaa !7
  %xor35.i2361 = xor i32 %2889, %2887
  %2890 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 89), align 1, !tbaa !6
  %idxprom37.i2362 = zext i8 %2890 to i32
  %arrayidx38.i2363 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom37.i2362
  %2891 = load i32, i32* %arrayidx38.i2363, align 4, !tbaa !7
  %xor39.i2364 = xor i32 %xor35.i2361, %2891
  %2892 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 94), align 2, !tbaa !6
  %idxprom41.i2365 = zext i8 %2892 to i32
  %arrayidx42.i2366 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom41.i2365
  %2893 = load i32, i32* %arrayidx42.i2366, align 4, !tbaa !7
  %xor43.i2367 = xor i32 %xor39.i2364, %2893
  %2894 = load i32, i32* %2713, align 4, !tbaa !7
  %xor45.i2369 = xor i32 %xor43.i2367, %2894
  store i32 %xor45.i2369, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 84) to i32*), align 4, !tbaa !7
  %idxprom48.i2370 = zext i8 %2873 to i32
  %arrayidx49.i2371 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom48.i2370
  %2895 = load i32, i32* %arrayidx49.i2371, align 4, !tbaa !7
  %idxprom51.i2372 = zext i8 %2874 to i32
  %arrayidx52.i2373 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom51.i2372
  %2896 = load i32, i32* %arrayidx52.i2373, align 4, !tbaa !7
  %xor53.i2374 = xor i32 %2896, %2895
  %2897 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 88), align 8, !tbaa !6
  %idxprom55.i2375 = zext i8 %2897 to i32
  %arrayidx56.i2376 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom55.i2375
  %2898 = load i32, i32* %arrayidx56.i2376, align 4, !tbaa !7
  %xor57.i2377 = xor i32 %xor53.i2374, %2898
  %2899 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 93), align 1, !tbaa !6
  %idxprom59.i2378 = zext i8 %2899 to i32
  %arrayidx60.i2379 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom59.i2378
  %2900 = load i32, i32* %arrayidx60.i2379, align 4, !tbaa !7
  %xor61.i2380 = xor i32 %xor57.i2377, %2900
  %2901 = load i32, i32* %2721, align 4, !tbaa !7
  %xor63.i2382 = xor i32 %xor61.i2380, %2901
  store i32 %xor63.i2382, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 88) to i32*), align 8, !tbaa !7
  %idxprom66.i2383 = zext i8 %2875 to i32
  %arrayidx67.i2384 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom66.i2383
  %2902 = load i32, i32* %arrayidx67.i2384, align 4, !tbaa !7
  %idxprom69.i2385 = zext i8 %2876 to i32
  %arrayidx70.i2386 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom69.i2385
  %2903 = load i32, i32* %arrayidx70.i2386, align 4, !tbaa !7
  %xor71.i2387 = xor i32 %2903, %2902
  %idxprom73.i2388 = zext i8 %2877 to i32
  %arrayidx74.i2389 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom73.i2388
  %2904 = load i32, i32* %arrayidx74.i2389, align 4, !tbaa !7
  %xor75.i2390 = xor i32 %xor71.i2387, %2904
  %2905 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 92), align 4, !tbaa !6
  %idxprom77.i2391 = zext i8 %2905 to i32
  %arrayidx78.i2392 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom77.i2391
  %2906 = load i32, i32* %arrayidx78.i2392, align 4, !tbaa !7
  %xor79.i2393 = xor i32 %xor75.i2390, %2906
  %2907 = load i32, i32* %2728, align 4, !tbaa !7
  %xor81.i2395 = xor i32 %xor79.i2393, %2907
  store i32 %xor81.i2395, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 92) to i32*), align 4, !tbaa !7
  %2908 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 99), align 1, !tbaa !6
  %2909 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 98), align 2, !tbaa !6
  %2910 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 103), align 1, !tbaa !6
  %2911 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 97), align 1, !tbaa !6
  %2912 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 102), align 2, !tbaa !6
  %2913 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 107), align 1, !tbaa !6
  %2914 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 96), align 16, !tbaa !6
  %idxprom.i2294 = zext i8 %2914 to i32
  %arrayidx14.i2295 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i2294
  %2915 = load i32, i32* %arrayidx14.i2295, align 4, !tbaa !7
  %2916 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 101), align 1, !tbaa !6
  %idxprom16.i2296 = zext i8 %2916 to i32
  %arrayidx17.i2297 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom16.i2296
  %2917 = load i32, i32* %arrayidx17.i2297, align 4, !tbaa !7
  %xor.i2298 = xor i32 %2917, %2915
  %2918 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 106), align 2, !tbaa !6
  %idxprom19.i2299 = zext i8 %2918 to i32
  %arrayidx20.i2300 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom19.i2299
  %2919 = load i32, i32* %arrayidx20.i2300, align 4, !tbaa !7
  %xor21.i2301 = xor i32 %xor.i2298, %2919
  %2920 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 111), align 1, !tbaa !6
  %idxprom23.i2302 = zext i8 %2920 to i32
  %arrayidx24.i2303 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom23.i2302
  %2921 = load i32, i32* %arrayidx24.i2303, align 4, !tbaa !7
  %xor25.i2304 = xor i32 %xor21.i2301, %2921
  %2922 = load i32, i32* %2694, align 4, !tbaa !7
  %xor27.i2305 = xor i32 %xor25.i2304, %2922
  store i32 %xor27.i2305, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 96) to i32*), align 16, !tbaa !7
  %idxprom30.i2306 = zext i8 %2908 to i32
  %arrayidx31.i2307 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom30.i2306
  %2923 = load i32, i32* %arrayidx31.i2307, align 4, !tbaa !7
  %2924 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 100), align 4, !tbaa !6
  %idxprom33.i2308 = zext i8 %2924 to i32
  %arrayidx34.i2309 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom33.i2308
  %2925 = load i32, i32* %arrayidx34.i2309, align 4, !tbaa !7
  %xor35.i2310 = xor i32 %2925, %2923
  %2926 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 105), align 1, !tbaa !6
  %idxprom37.i2311 = zext i8 %2926 to i32
  %arrayidx38.i2312 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom37.i2311
  %2927 = load i32, i32* %arrayidx38.i2312, align 4, !tbaa !7
  %xor39.i2313 = xor i32 %xor35.i2310, %2927
  %2928 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 110), align 2, !tbaa !6
  %idxprom41.i2314 = zext i8 %2928 to i32
  %arrayidx42.i2315 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom41.i2314
  %2929 = load i32, i32* %arrayidx42.i2315, align 4, !tbaa !7
  %xor43.i2316 = xor i32 %xor39.i2313, %2929
  %2930 = load i32, i32* %2713, align 4, !tbaa !7
  %xor45.i2318 = xor i32 %xor43.i2316, %2930
  store i32 %xor45.i2318, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 100) to i32*), align 4, !tbaa !7
  %idxprom48.i2319 = zext i8 %2909 to i32
  %arrayidx49.i2320 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom48.i2319
  %2931 = load i32, i32* %arrayidx49.i2320, align 4, !tbaa !7
  %idxprom51.i2321 = zext i8 %2910 to i32
  %arrayidx52.i2322 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom51.i2321
  %2932 = load i32, i32* %arrayidx52.i2322, align 4, !tbaa !7
  %xor53.i2323 = xor i32 %2932, %2931
  %2933 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 104), align 8, !tbaa !6
  %idxprom55.i2324 = zext i8 %2933 to i32
  %arrayidx56.i2325 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom55.i2324
  %2934 = load i32, i32* %arrayidx56.i2325, align 4, !tbaa !7
  %xor57.i2326 = xor i32 %xor53.i2323, %2934
  %2935 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 109), align 1, !tbaa !6
  %idxprom59.i2327 = zext i8 %2935 to i32
  %arrayidx60.i2328 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom59.i2327
  %2936 = load i32, i32* %arrayidx60.i2328, align 4, !tbaa !7
  %xor61.i2329 = xor i32 %xor57.i2326, %2936
  %2937 = load i32, i32* %2721, align 4, !tbaa !7
  %xor63.i2331 = xor i32 %xor61.i2329, %2937
  store i32 %xor63.i2331, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 104) to i32*), align 8, !tbaa !7
  %idxprom66.i2332 = zext i8 %2911 to i32
  %arrayidx67.i2333 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom66.i2332
  %2938 = load i32, i32* %arrayidx67.i2333, align 4, !tbaa !7
  %idxprom69.i2334 = zext i8 %2912 to i32
  %arrayidx70.i2335 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom69.i2334
  %2939 = load i32, i32* %arrayidx70.i2335, align 4, !tbaa !7
  %xor71.i2336 = xor i32 %2939, %2938
  %idxprom73.i2337 = zext i8 %2913 to i32
  %arrayidx74.i2338 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom73.i2337
  %2940 = load i32, i32* %arrayidx74.i2338, align 4, !tbaa !7
  %xor75.i2339 = xor i32 %xor71.i2336, %2940
  %2941 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 108), align 4, !tbaa !6
  %idxprom77.i2340 = zext i8 %2941 to i32
  %arrayidx78.i2341 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom77.i2340
  %2942 = load i32, i32* %arrayidx78.i2341, align 4, !tbaa !7
  %xor79.i2342 = xor i32 %xor75.i2339, %2942
  %2943 = load i32, i32* %2728, align 4, !tbaa !7
  %xor81.i2344 = xor i32 %xor79.i2342, %2943
  store i32 %xor81.i2344, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 108) to i32*), align 4, !tbaa !7
  %2944 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 115), align 1, !tbaa !6
  %2945 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 114), align 2, !tbaa !6
  %2946 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 119), align 1, !tbaa !6
  %2947 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 113), align 1, !tbaa !6
  %2948 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 118), align 2, !tbaa !6
  %2949 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 123), align 1, !tbaa !6
  %2950 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 112), align 16, !tbaa !6
  %idxprom.i2243 = zext i8 %2950 to i32
  %arrayidx14.i2244 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom.i2243
  %2951 = load i32, i32* %arrayidx14.i2244, align 4, !tbaa !7
  %2952 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 117), align 1, !tbaa !6
  %idxprom16.i2245 = zext i8 %2952 to i32
  %arrayidx17.i2246 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom16.i2245
  %2953 = load i32, i32* %arrayidx17.i2246, align 4, !tbaa !7
  %xor.i2247 = xor i32 %2953, %2951
  %2954 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 122), align 2, !tbaa !6
  %idxprom19.i2248 = zext i8 %2954 to i32
  %arrayidx20.i2249 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom19.i2248
  %2955 = load i32, i32* %arrayidx20.i2249, align 4, !tbaa !7
  %xor21.i2250 = xor i32 %xor.i2247, %2955
  %2956 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 127), align 1, !tbaa !6
  %idxprom23.i2251 = zext i8 %2956 to i32
  %arrayidx24.i2252 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom23.i2251
  %2957 = load i32, i32* %arrayidx24.i2252, align 4, !tbaa !7
  %xor25.i2253 = xor i32 %xor21.i2250, %2957
  %2958 = load i32, i32* %2694, align 4, !tbaa !7
  %xor27.i2254 = xor i32 %xor25.i2253, %2958
  store i32 %xor27.i2254, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 112) to i32*), align 16, !tbaa !7
  %idxprom30.i2255 = zext i8 %2944 to i32
  %arrayidx31.i2256 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom30.i2255
  %2959 = load i32, i32* %arrayidx31.i2256, align 4, !tbaa !7
  %2960 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 116), align 4, !tbaa !6
  %idxprom33.i2257 = zext i8 %2960 to i32
  %arrayidx34.i2258 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom33.i2257
  %2961 = load i32, i32* %arrayidx34.i2258, align 4, !tbaa !7
  %xor35.i2259 = xor i32 %2961, %2959
  %2962 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 121), align 1, !tbaa !6
  %idxprom37.i2260 = zext i8 %2962 to i32
  %arrayidx38.i2261 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom37.i2260
  %2963 = load i32, i32* %arrayidx38.i2261, align 4, !tbaa !7
  %xor39.i2262 = xor i32 %xor35.i2259, %2963
  %2964 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 126), align 2, !tbaa !6
  %idxprom41.i2263 = zext i8 %2964 to i32
  %arrayidx42.i2264 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom41.i2263
  %2965 = load i32, i32* %arrayidx42.i2264, align 4, !tbaa !7
  %xor43.i2265 = xor i32 %xor39.i2262, %2965
  %2966 = load i32, i32* %2713, align 4, !tbaa !7
  %xor45.i2267 = xor i32 %xor43.i2265, %2966
  store i32 %xor45.i2267, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 116) to i32*), align 4, !tbaa !7
  %idxprom48.i2268 = zext i8 %2945 to i32
  %arrayidx49.i2269 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom48.i2268
  %2967 = load i32, i32* %arrayidx49.i2269, align 4, !tbaa !7
  %idxprom51.i2270 = zext i8 %2946 to i32
  %arrayidx52.i2271 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom51.i2270
  %2968 = load i32, i32* %arrayidx52.i2271, align 4, !tbaa !7
  %xor53.i2272 = xor i32 %2968, %2967
  %2969 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 120), align 8, !tbaa !6
  %idxprom55.i2273 = zext i8 %2969 to i32
  %arrayidx56.i2274 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom55.i2273
  %2970 = load i32, i32* %arrayidx56.i2274, align 4, !tbaa !7
  %xor57.i2275 = xor i32 %xor53.i2272, %2970
  %2971 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 125), align 1, !tbaa !6
  %idxprom59.i2276 = zext i8 %2971 to i32
  %arrayidx60.i2277 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom59.i2276
  %2972 = load i32, i32* %arrayidx60.i2277, align 4, !tbaa !7
  %xor61.i2278 = xor i32 %xor57.i2275, %2972
  %2973 = load i32, i32* %2721, align 4, !tbaa !7
  %xor63.i2280 = xor i32 %xor61.i2278, %2973
  store i32 %xor63.i2280, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 120) to i32*), align 8, !tbaa !7
  %idxprom66.i2281 = zext i8 %2947 to i32
  %arrayidx67.i2282 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable2, i32 0, i32 %idxprom66.i2281
  %2974 = load i32, i32* %arrayidx67.i2282, align 4, !tbaa !7
  %idxprom69.i2283 = zext i8 %2948 to i32
  %arrayidx70.i2284 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable3, i32 0, i32 %idxprom69.i2283
  %2975 = load i32, i32* %arrayidx70.i2284, align 4, !tbaa !7
  %xor71.i2285 = xor i32 %2975, %2974
  %idxprom73.i2286 = zext i8 %2949 to i32
  %arrayidx74.i2287 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable4, i32 0, i32 %idxprom73.i2286
  %2976 = load i32, i32* %arrayidx74.i2287, align 4, !tbaa !7
  %xor75.i2288 = xor i32 %xor71.i2285, %2976
  %2977 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 124), align 4, !tbaa !6
  %idxprom77.i2289 = zext i8 %2977 to i32
  %arrayidx78.i2290 = getelementptr inbounds [256 x i32], [256 x i32]* @TestTable1, i32 0, i32 %idxprom77.i2289
  %2978 = load i32, i32* %arrayidx78.i2290, align 4, !tbaa !7
  %xor79.i2291 = xor i32 %xor75.i2288, %2978
  %2979 = load i32, i32* %2728, align 4, !tbaa !7
  %xor81.i2293 = xor i32 %xor79.i2291, %2979
  store i32 %xor81.i2293, i32* bitcast (i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 124) to i32*), align 4, !tbaa !7
  %inc1419 = add nuw nsw i32 %j.15698, 1
  %exitcond = icmp eq i32 %inc1419, 10
  br i1 %exitcond, label %for.inc1421, label %for.body1412.for.body1412_crit_edge

for.body1412.for.body1412_crit_edge:              ; preds = %for.body1412
  %.pre5782 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 3), align 1, !tbaa !6
  %.pre5783 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 11), align 1, !tbaa !6
  %.pre5784 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 10), align 2, !tbaa !6
  %.pre5785 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 15), align 1, !tbaa !6
  %.pre5786 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 19), align 1, !tbaa !6
  %.pre5787 = load i8, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 18), align 2, !tbaa !6
  br label %for.body1412

for.inc1421:                                      ; preds = %for.body1412
  %add1422 = add nuw nsw i32 %i.75699, 128
  %cmp1390 = icmp ult i32 %add1422, %memory.0
  br i1 %cmp1390, label %for.body1392, label %for.end1423

for.end1423:                                      ; preds = %for.inc1421
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* nonnull align 8 dereferenceable(128) %arraydecay6, i8* nonnull align 16 dereferenceable(128) getelementptr inbounds ([128 x i8], [128 x i8]* @text, i32 0, i32 0), i32 128, i1 false)
  call void @keccakf(i64* nonnull %arrayidx81, i32 24) #7
  %2980 = load i8, i8* %1, align 8, !tbaa !6
  %2981 = and i8 %2980, 3
  %and1433 = zext i8 %2981 to i32
  %arrayidx1434 = getelementptr inbounds [4 x void (i8*, i32, i8*)*], [4 x void (i8*, i32, i8*)*]* @extra_hashes, i32 0, i32 %and1433
  %2982 = load void (i8*, i32, i8*)*, void (i8*, i32, i8*)** %arrayidx1434, align 4, !tbaa !9
  call void %2982(i8* nonnull %1, i32 200, i8* %output) #7
  %call1435 = call i32 @oaes_free(i8** nonnull %5) #7
  call void @free(i8* %call)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #7
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %2) #7
  call void @llvm.lifetime.end.p0i8(i64 200, i8* nonnull %1) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #7
  ret void
}

; Function Attrs: nofree nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #4

declare i8* @oaes_alloc() local_unnamed_addr #1

declare void @keccak(i8*, i32, i8*, i32) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #3

declare i32 @oaes_key_import_data(i8*, i8*, i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.sqrt.f64(double) #5

declare i32 @oaes_free(i8**) local_unnamed_addr #1

declare void @keccakf(i64*, i32) local_unnamed_addr #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #6

; Function Attrs: nounwind
define hidden void @cryptonight(i8* %output, i8* %input, i32 %len, i32 %algo, i32 %variant, i32 %height) local_unnamed_addr #0 {
entry:
  tail call void @cryptonight_hash_ctx(i8* %output, i8* %input, i32 %len, i32 %algo, i32 %variant, i32 %height)
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #5

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #5

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone speculatable willreturn }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (/b/s/w/ir/cache/git/chromium.googlesource.com-external-github.com-llvm-llvm--project 3774bcf9f84520a8c35bf765d9a528040d68a14b)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"long long", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!4, !4, i64 0}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !4, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"any pointer", !4, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"_Bool", !4, i64 0}
!13 = !{i8 0, i8 2}
!14 = !{!15, !4, i64 2}
!15 = !{!"V4_Instruction", !4, i64 0, !4, i64 1, !4, i64 2, !8, i64 4}
!16 = !{!15, !4, i64 0}
!17 = !{!15, !4, i64 1}
!18 = !{!15, !8, i64 4}
!19 = !{!20, !10, i64 0}
!20 = !{!"_oaes_ctx", !10, i64 0, !21, i64 4, !4, i64 6}
!21 = !{!"short", !4, i64 0}
!22 = !{!23, !10, i64 12}
!23 = !{!"_oaes_key", !24, i64 0, !10, i64 4, !24, i64 8, !10, i64 12, !24, i64 16, !24, i64 20}
!24 = !{!"long", !4, i64 0}
