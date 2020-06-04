import joblib


def tryToBreak(data):

    model = joblib.load("../svm.pkl")

    classes = model.predict(data)

    classes = [c == 0 for c in classes]

    return any(classes)


