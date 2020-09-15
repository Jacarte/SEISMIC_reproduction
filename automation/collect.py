import os
import signal
import time
from subprocess import Popen

import exec_selenium
import inline_counter64
import instrument_js
import try_to_break


def processPool(poolFolder):
    OUT = "yazec/static"
    # Instrument code
    wasms = [w for w in os.listdir(poolFolder) if w.endswith(".wasm")]
    p1 = None
    try:
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
            if p1 is not None:
                p1.communicate(timeout=0)

            print("Opening server...")
            p1 = Popen(["perl", "server.pl"], cwd="yazec")
            # Just to be sure
            time.sleep(1)

            # Collect traces
            lines = exec_selenium.main(False, 7)

            # Save collect
            f = open("out/data.py", "a")
            sanitizedName = w.replace(".wasm", "").replace("-", "_")
            f.write(f"d_{sanitizedName} = {lines}\n")
            f.close()

            broken, labels = try_to_break.tryToBreak(lines) 
            if broken:
                print(f"\n\n--------------\n{w} breaks the classifier !!!\n\n {labels}")

                f = open("out/class.txt", "a")
                f.write(f"{w} breaks the classifier\n")
                f.close()

            print("Killing server...")
            p1.terminate()

            os.remove(w1)
            os.remove(wt1)

    except KeyboardInterrupt:
        if p1 is not None:
            p1.terminate()


if __name__ == "__main__":
    processPool("pool")
