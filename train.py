
import numpy as np
import matplotlib.pyplot as plt
from sklearn import svm, datasets
from sklearn.model_selection import cross_val_score

from data import astart as astar
from data import asteroids as asteroids
from data import funkykarts as funky
from data import creature_pack as cpack
from data import bullets  as bullets
from data import basic4gl  as basic4gl
from data import tanks  as tanks

# Miners
from data import yazec_original as yazec
from data import coinhive as coinhive
from data import cryptonight as cryptonight



# import some data to play with
iris = datasets.load_iris()
# Take the first two features. We could avoid this by using a two-dim dataset
#print(iris)

noMiners = astar + asteroids + funky + cpack + bullets + tanks + basic4gl
miners = yazec + coinhive + cryptonight.tolist()

X = np.array(noMiners + miners)
y = np.array([0]*len(noMiners) + [1]*len(miners))



# we create an instance of SVM and fit out data. We do not scale our
# data since we want to plot the support vectors
C = 10.0  # SVM regularization parameter
model = svm.SVC(kernel='linear', C=C)
model = model.fit(X, y)

t = cross_val_score(model, X, y, cv=200, scoring='recall')

print(t)

import joblib

joblib.dump(model,"svm.pkl")