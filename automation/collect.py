from subprocess import Popen
import inline_counter64
import subprocess
import instrument_js
import os
import shutil
import signal

WAIT_FOR=10 # 10 seconds

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

        # Remove pool
        try:
            p1.communicate(timeout=WAIT_FOR)
        except:
            pass
        print("Killing server")
        os.kill(p1.pid, signal.SIGTERM)

        os.remove(w1)
        os.remove(wt1)

        

if __name__ == "__main__":
    processPool("pool")