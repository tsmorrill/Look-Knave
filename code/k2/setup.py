# run python3 setup.py build_ext --inplace

from setuptools import setup
from Cython.Build import cythonize

import Cython.Compiler.Options
Cython.Compiler.Options.annotate = True

setup(
    name='S Odd Expansion',
    ext_modules=cythonize("odd.pyx"),
    zip_safe=False,
)
