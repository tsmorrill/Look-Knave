# run python3 setup.py build_ext --inplace

from setuptools import setup
from Cython.Build import cythonize

import Cython.Compiler.Options
Cython.Compiler.Options.annotate = True

setup(
    name='Look Knave',
    ext_modules=cythonize("knave.pyx"),
    zip_safe=False,
)
