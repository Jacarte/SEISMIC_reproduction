#!/usr/bin/env python3
import itertools
import os
import random
from glob import glob
from subprocess import run
from multiprocessing import cpu_count, Pool
from tqdm import tqdm


dirs = filter(os.path.isdir, os.listdir("."))
bcs = {k: [os.path.abspath(x) for x in glob(f"{k}/*.bc")] for k in dirs}
print(bcs.values())
combinations = list(itertools.product(*list(filter(None, bcs.values()))))
assert combinations
print(len(combinations))
# random.shuffle(combinations)


# emcc -O3 -s NO_FILESYSTEM=1 -s 'EXTRA_EXPORTED_RUNTIME_METHODS=["ccall", "cwrap"]' -s TOTAL_MEMORY=67108864 -s WASM=1 -s "EXPORTED_FUNCTIONS=['_hash_cn']" --shell-file /workdir/shell_minimal.html /workdir/blake/blake.bc /workdir/cryptonight/cryptonight.bc /workdir/jh_ansi_opt64/jh_ansi_opt64.bc /workdir/groestl/groestl.bc /workdir/keccak/keccak.bc /workdir/main/main.bc /workdir/oaes_lib/oaes_lib.bc /workdir/skein/skein.bc -lm -o cn.html
SHELL_FILE = os.path.abspath("shell_minimal.html")


def emcc(args):
    idx, c = args
    os.mkdir(str(idx))
    os.chdir(str(idx))
    run(
        [
            "emcc",
            "-O3",
            "-s",
            "NO_FILESYSTEM=1",
            "-s",
            'EXTRA_EXPORTED_RUNTIME_METHODS=["ccall", "cwrap"]',
            "-s",
            "TOTAL_MEMORY=67108864",
            "-s",
            "WASM=1",
            "-s",
            "EXPORTED_FUNCTIONS=['_hash_cn']",
            "--shell-file",
            SHELL_FILE,
            *c,
            "-lm",
            "-o",
            "cn.html",
        ],
        check=True,
    )
    os.chdir("..")


with Pool(cpu_count()) as p:
    for _ in tqdm(
        p.imap_unordered(emcc, list(enumerate(combinations))), total=len(combinations)
    ):
        pass
