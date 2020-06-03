
import numpy as np
import matplotlib.pyplot as plt
from sklearn import svm, datasets
from sklearn.model_selection import cross_val_score

from data import astart as astar
from data import asteroids as asteroids
from data import funkykarts as funky
from data import creature_pack as cpack

# Miners
from data import yazec_original as yazec
from data import coinhive as coinhive

def make_meshgrid(x, y, h=.02):
    
    x_min, x_max = x.min() - 1, x.max() + 1
    y_min, y_max = y.min() - 1, y.max() + 1
    xx, yy = np.meshgrid(np.arange(x_min, x_max, h),
                         np.arange(y_min, y_max, h))
    return xx, yy


def plot_contours(ax, clf, xx, yy, **params):
    """Plot the decision boundaries for a classifier.

    Parameters
    ----------
    ax: matplotlib axes object
    clf: a classifier
    xx: meshgrid ndarray
    yy: meshgrid ndarray
    params: dictionary of params to pass to contourf, optional
    """
    Z = clf.predict(np.c_[xx.ravel(), yy.ravel()])
    Z = Z.reshape(xx.shape)
    out = ax.contourf(xx, yy, Z, **params)
    return out


# import some data to play with
iris = datasets.load_iris()
# Take the first two features. We could avoid this by using a two-dim dataset
#print(iris)
X = np.array(astar + asteroids + funky + cpack + yazec + coinhive)
y = np.array([0]*(len(astar) + len(asteroids) +  len(funky) + len(cpack)) + [1]*(len(yazec) + len(coinhive)))



# we create an instance of SVM and fit out data. We do not scale our
# data since we want to plot the support vectors
C = 10.0  # SVM regularization parameter
model = svm.SVC(kernel='linear', C=C)
model = model.fit(X, y)

t = cross_val_score(model, X, y, cv=200, scoring='recall')

print(t)
# call predict to say

import joblib

joblib.dump(model,"svm.pkl")