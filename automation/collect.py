from subprocess import Popen
import inline_counter64
import subprocess
import instrument_js
import os
import shutil
import signal

WAIT_FOR=600 # 10 minutes
CHROME = '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'

def openChromeHeadless():
    p2 = Popen([CHROME, "--no-sandbox", "-user-data-dir=tmp", "http://localhost:8888"])

    return p2

def processPool(poolFolder):
    
    OUT = "yazec/static"
    # Instrument code
    wasms = [w for w in os.listdir(poolFolder) if w.endswith(".wasm")]
    p1 = None
    for w in wasms:
        print(w)
        preffix = w.split("jazecminer.wasm")[0].replace("-", ".")
        try:
            w1, wt1 = inline_counter64.process(poolFolder, w, OUT)
        except Exception as e:
            print("ERROR")
            print(e)
            print("ERROR")
            continue
        instrument_js.process(poolFolder, "jazecminer.js", OUT, preffix)

        # Reset server
        if p1 != None:
            p1.communicate(timeout=0)

        print("Opening server...")
        p1 = Popen(["perl", "server.pl"], cwd="yazec")
        # Collect traces

        p2 = openChromeHeadless()

        # Remove pool
        try:
            p1.communicate(timeout=WAIT_FOR)
        except:
            pass
        print("Killing server")
        os.kill(p1.pid, signal.SIGTERM)


        try:
            o2.communicate(timeout=0)
        except:
            pass
        os.kill(p2.pid, signal.SIGTERM)
    
        os.remove(w1)
        os.remove(wt1)

        break
        

if __name__ == "__main__":
    processPool("pool")