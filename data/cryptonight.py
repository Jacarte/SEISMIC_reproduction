import numpy as np

data = [[44763928,	44756694,	44752168,	44752168,	44752168,	44752168,	44756694,	44751271,	44763946,	44752168,	44756694,	44756694,	44751271,	44751271,	44752168,	44756694,	44751271,	44751271,	44751271,	44756694,	44752168,	44752168,	44756694,	44751271,	44752168,	44756694,	44751271,	44756694,	44756694,	44751271,	44763946,	44763946,	44763946,	44756694,	44763946,	44756694,	44752168,	44763946,	44756694,	44763946,	44763946,	44752168,	44756694,	44756694,	44763946,	44752168,	44763946,	44756694,	44756694,	44756694,	44763946,	44751271,	44752168,	44752168,	44756694,	44752168,	44751271,	44763946,	44763946,	44763946,	44752168,	44751271,	44763946,	44756694,	44763946,	44756694,	44752168,	44756694,	44763946,	44756694,	44763946,	44752168,	44751271,	44751271,	44763946,	44763946,	44751271,	44752168,	44756694,	44751271,	44752168,	44763946,	44763946,	44756694,	44752168,	44756694,	44752168,	44752168,	44763946,	44751271,	44756694,	44751271,	44756694,	44756694,	44756694,	44751271,	44756694,	44751271,	44751271,	44763946,	44756327,	4913,	12675],
[40370798,	40370816,	40370814,	40371074,	40370816,	40370809,	40371074,	40370814,	40371074,	40371074,	40371074,	40370814,	40370816,	40371074,	40370809,	40370814,	40370809,	40371074,	40370809,	40370814,	40370809,	40370814,	40370809,	40370816,	40370809,	40370809,	40370816,	40370816,	40371074,	40370814,	40370816,	40370816,	40370814,	40371074,	40370814,	40370814,	40370809,	40370809,	40370816,	40370814,	40371074,	40370809,	40371074,	40370816,	40371074,	40370809,	40370814,	40370814,	40370809,	40371074,	40370809,	40370816,	40370809,	40370809,	40371074,	40370814,	40370816,	40370814,	40370809,	40370814,	40371074,	40370814,	40370809,	40370814,	40370814,	40371074,	40371074,	40370809,	40370814,	40371074,	40370814,	40371074,	40371074,	40371074,	40370814,	40370814,	40370816,	40370816,	40370814,	40370816,	40370809,	40370814,	40370809,	40370809,	40370809,	40370814,	40370816,	40370809,	40370809,	40370814,	40370809,	40370809,	40370814,	40370814,	40370809,	40370809,	40370816,	40371074,	40370814,	40370809,	40370870,	109,	276],
[50864858,	50864861,	50861028,	50861028,	50861028,	50885925,	50860187,	50860187,	50864861,	50864861,	50861028,	50861028,	50860187,	50861028,	50885925,	50861028,	50860187,	50864861,	50860187,	50864861,	50861028,	50864861,	50861028,	50860187,	50864861,	50864861,	50864861,	50861028,	50860187,	50885925,	50861028,	50860187,	50864861,	50885925,	50861028,	50861028,	50885925,	50861028,	50864861,	50864861,	50860187,	50861028,	50885925,	50860187,	50861028,	50860187,	50860187,	50864861,	50864861,	50885925,	50864861,	50864861,	50860187,	50864861,	50885925,	50860187,	50885925,	50864861,	50861028,	50864861,	50860187,	50861028,	50861028,	50864861,	50860187,	50860187,	50885925,	50861028,	50864861,	50861028,	50885925,	50861028,	50860187,	50864861,	50885925,	50861028,	50885925,	50885925,	50860187,	50861028,	50864861,	50864861,	50860187,	50860187,	50860187,	50864861,	50860187,	50885925,	50861028,	50861028,	50861028,	50861028,	50861028,	50885925,	50864861,	50885925,	50885925,	50861028,	50860187,	50885925,	50866591,	9585,	25738],
[38282391,	38275280,	38273462,	38282393,	38273459,	38282393,	38273462,	38273462,	38275280,	38282393,	38275280,	38273459,	38282393,	38273459,	38282393,	38275280,	38273459,	38275280,	38273462,	38273459,	38282393,	38275280,	38282393,	38275280,	38275280,	38275280,	38275280,	38273459,	38282393,	38273459,	38282393,	38273462,	38273462,	38273462,	38273459,	38273459,	38273459,	38273462,	38273459,	38273462,	38273462,	38273459,	38273462,	38282393,	38275280,	38282393,	38273459,	38273462,	38282393,	38273459,	38282393,	38273459,	38273459,	38282393,	38282393,	38275280,	38282393,	38282393,	38282393,	38275280,	38275280,	38273459,	38282393,	38273462,	38275280,	38273459,	38282393,	38273459,	38275280,	38275280,	38273459,	38275280,	38275280,	38282393,	38275280,	38273462,	38273459,	38273459,	38273462,	38273459,	38273459,	38273459,	38282393,	38273459,	38275280,	38273459,	38273462,	38273459,	38273462,	38273462,	38273459,	38282393,	38282393,	38275280,	38275280,	38282393,	38282393,	38273459,	38282393,	38273462,	38276380,	3838,	8934],
[50859184,	50859185,	50868367,	50859185,	50859185,	50856370,	50856369,	50859185,	50868367,	50868367,	50868367,	50856370,	50868367,	50856369,	50859185,	50859185,	50868367,	50868367,	50856370,	50868367,	50856369,	50856369,	50856369,	50859185,	50868367,	50868367,	50856370,	50856370,	50868367,	50868367,	50859185,	50868367,	50856370,	50856370,	50856370,	50868367,	50868367,	50856370,	50856370,	50856369,	50868367,	50859185,	50856370,	50856369,	50856370,	50868367,	50859185,	50856370,	50856370,	50859185,	50859185,	50859185,	50859185,	50859185,	50868367,	50856370,	50856369,	50856370,	50868367,	50859185,	50856369,	50856370,	50856369,	50856370,	50856370,	50856369,	50856369,	50856369,	50859185,	50859185,	50868367,	50856369,	50868367,	50859185,	50856369,	50859185,	50868367,	50856369,	50856370,	50856370,	50856370,	50868367,	50859185,	50856369,	50856370,	50856370,	50856370,	50856370,	50856369,	50859185,	50859185,	50868367,	50859185,	50856370,	50859185,	50856369,	50856369,	50859185,	50868367,	50859185,	50860157,	4909,	11998]]

data = np.transpose(data)
