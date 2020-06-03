
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

noMiners = astar + asteroids + funky + cpack + bullets + tanks + basic4gl
miners = yazec + coinhive + cryptonight.tolist()

X = np.array(noMiners + miners)
y = np.array([0]*len(noMiners) + [1]*len(miners))

from sklearn.decomposition import PCA

pca = PCA(n_components=2).fit(X)
pca_2d = pca.transform(X)

for i in range(0, pca_2d.shape[0]):
    if y[i] == 0: # non-miner
        c1 = plt.scatter(pca_2d[i, 0], pca_2d[i, 1], c='r', marker='+')
    if y[i] == 1: # non-miner
        c2 = plt.scatter(pca_2d[i, 0], pca_2d[i, 1], c='b', marker='*')
# we create an instance of SVM and fit out data. We do not scale our
# data since we want to plot the support vectors
C = 10.0  # SVM regularization parameter
model = svm.SVC(kernel='linear', C=C)
model = model.fit(X, y)

import joblib

joblib.dump(model,"svm.pkl")

# Plot decision hyperplanes
'''
x_min, x_max = pca_2d[:, 0].min() - 1,   pca_2d[:,0].max() + 1
y_min, y_max = pca_2d[:, 1].min() - 1,   pca_2d[:, 1].max() + 1
xx, yy = np.meshgrid(np.arange(0, 100, 1),   np.arange(0, 100, 1))
svmClassifier_2d =   svm.LinearSVC(random_state=111).fit(pca_2d, y)
Z = svmClassifier_2d.predict(np.c_[xx.ravel(),  yy.ravel()])
Z = Z.reshape(xx.shape)
plt.contour(xx, yy, Z)'''
plt.savefig("hyperplanes.png")

for score in ["accuracy ", "precision", "recall   "]:
    print(score, end=" ")
    
    values = cross_val_score(model, X, y, cv=10, scoring=score.replace(" ", ""))
    mean = values.mean()

    print(" (mean %.5f)"%mean, end= " ")
    print(" : ", end=" ")
    print(" ".join("%.7f "%v for v in values))


