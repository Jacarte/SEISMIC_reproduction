#!/usr/bin/env python3
"""
Needs a file server to be running at port 800
"""
import os
import shutil
from glob import glob

import joblib

from exec_selenium import main

model = joblib.load("svm.pkl")
for js in glob("*.js"):
    try:
        num = int(js.rstrip(".js"))
    except ValueError:
        continue
    shutil.copy(js, "cn.js")
    shutil.copy(f"{num}.profiled.wasm", "cn.wasm")

    lines = main(cli=False, observations=100)
    os.rename("geckodriver.log", f"geckodriver{num}.log")
    print(lines)
    print(sum(x < 1 for x in model.predict(lines)))
