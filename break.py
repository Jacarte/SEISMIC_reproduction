import joblib
import numpy as np

breaker = [
[27355601,	3177018,	5012465,	643765,	86091]
,]
breaker = np.array(breaker)

svm  = joblib.load("svm.pkl")

s = svm.predict(breaker)

# 0 for non-miner
if any([t == 0 for t in s]):
    print("Broken")


print(s)