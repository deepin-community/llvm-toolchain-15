# Autogenerated from /home/sylvestre/dev/debian/pkg-llvm/llvm-toolchain/branches/llvm-project/mlir/test/Unit/lit.site.cfg.py.in
# Do not edit!

# Allow generated file to be relocatable.
from pathlib import Path
def path(p):
    if not p: return ''
    return str((Path(__file__).parent / p).resolve())


import sys

config.llvm_tools_dir = lit_config.substitute("/home/sylvestre/dev/debian/pkg-llvm/llvm-toolchain/branches/llvm-project/build/./bin")
config.llvm_build_mode = lit_config.substitute(".")
config.mlir_obj_root = "/home/sylvestre/dev/debian/pkg-llvm/llvm-toolchain/branches/llvm-project/build/tools/mlir"

# Let the main config do the real work.
lit_config.load_config(config, "/home/sylvestre/dev/debian/pkg-llvm/llvm-toolchain/branches/llvm-project/mlir/test/Unit/lit.cfg.py")