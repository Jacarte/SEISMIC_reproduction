#!/usr/bin/env python3
import joblib
import numpy as np
from sklearn import datasets, svm
from sklearn.model_selection import cross_val_score, train_test_split

# Miners
from data import astart as astar
from data import asteroids as asteroids
from data import basic4gl as basic4gl
from data import bullets as bullets
from data import coinhive as coinhive
from data import creature_pack as cpack
from data import cryptonight as cryptonight
from data import funkykarts as funky
from data import tanks as tanks
from data import yazec_original as yazec

noMiners = astar + asteroids + funky + cpack + bullets + tanks + basic4gl
miners = yazec + coinhive + cryptonight.tolist()

X = np.array(noMiners + miners)
y = np.array([0] * len(noMiners) + [1] * len(miners))
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

# we create an instance of SVM and fit out data. We do not scale our
# data since we want to plot the support vectors
C = 10.0  # SVM regularization parameter
model = svm.SVC(kernel="linear", C=C)
model = model.fit(X_train, y_train)

joblib.dump(model, "svm.pkl")

for score in ["accuracy ", "precision", "recall   "]:
    print(score, end=" ")

    values = cross_val_score(
        model, X_test, y_test, cv=10, scoring=score.strip()
    )
    mean = values.mean()

    print(" (mean %.5f)" % mean, end=" ")
    print(" : ", end=" ")
    print(" ".join("%.7f " % v for v in values))
