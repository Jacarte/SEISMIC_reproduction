import joblib


def tryToBreak(data):

    model = joblib.load("../svm.pkl")

    labels = model.predict(data)

    classes = [c == 0 for c in labels]

    return any(classes), labels




if __name__ == "__main__":
    print(tryToBreak([(4179901816,2544270468,2618739325,1454726538,1505444676),
 (65799619,3115536679,723775148,1934853887,1989318198),
 (87445704,3697281192,3136148452,2424807294,2482105688),
 (4134140950,4259130173,1124227288,2896811203,2959838120),
 (55323057,542056712,3519234373,3383206668,3450003206),
 (4134140950,0,0,1,2),
 (4153470393,1679416656,3926245440,44109192,119585620),
 (203900727,2255680635,2102417035,528747063,606825368),
 (53098226,2829829676,201561134,1011452712,1092867462),
 (50372064,3402646121,2593600072,1493156269,1578484734),
 (137461161,3978604284,735927427,1977826588,2066026552),
 (8661150,254245045,3106683110,2457745237,2550057810),
 (4201243207,831816522,1130580839,2944641880,3041698716),
 (4290336039,1408403267,3494963260,3430372619,3531545746),
 (4122736311,1975023136,1477950572,3906875586,4013413734),
 (119083582,2550278135,3905410232,95597737,205450372),
 (20150387,3122581958,1987455182,576868620,690600452),
 (143972749,3694725393,132336475,1057862429,1174910800),
 (71831527,4265916448,2535478832,1537917196,1658609244),
 (4237584962,537801655,576690536,2014461277,2140214310),
 (199222323,1108569958,3044885837,2493820370,2622345796),
 (4153360052,1673689463,1043456507,2968424067,3102025272),
 (225836665,2243919186,3525313720,3446941824,3582877096),
 (128862112,2826872403,1663577873,3937618189,4076465216),
 (45166221,3401452834,4053056834,126249490,269107590),
 (128973221,3981553637,2190597386,615121471,761698986),
 (2781448083,61871915,3725884623,930307365,1080254306),
 (2898390456,450719465,1027010553,1258205887,1410674292),
 (2853291799,836759163,2599690123,1583608803,1739040036),
 (2829334821,1221740795,4159798218,1908170387,2066973896),
 (2711408232,1591696529,1363731037,2218451929,2381391800),
 (4141458069,2163112476,3651533360,2699431050,2867588788),
 (2783395042,2540774584,892766014,3017087584,3188902444),
 (2888294118,2920903696,2482736074,3336754968,3511509668),
 (2718535884,3299214792,3985857058,3655388780,3834201338),
 (2794704748,3678928016,1233103444,3975027676,4157343998),
 (4265120733,4254848303,3584248886,164964779,351834926),
 (4147981783,531549958,1580010915,646497966,839037524),
 (2842404447,915624270,3147030991,969995344,1165497242),
 (2908268149,1298082814,452330624,1291605748,1489916266),
 (2797897436,1682249614,1996840564,1615217282,1816526160),
 (2768056445,2060157032,3525221578,1932944962,2137937208),
 (2902529168,2448335946,828105220,2260279580,2468041718),
 (2769912311,2823865122,2357606767,2575594266,2786656720),
 (3002472447,3211114230,4006578481,2901467746,3114473084),
 (2697398890,3581155340,1203654047,3211925638,3428852796),
 (2815552832,3965871452,2756823503,3536014580,3756240774),
 (2922609165,56800254,70071677,3861004800,4083592004),
 (2828592866,442825352,1630260795,4186555130,117246460),
 (3033788426,827055986,3295879296,214414596,440956356),
 (2859307258,1208130536,576073881,535018836,764699422),
 (2838319996,1593426502,2140952342,859791162,1092651636)]))