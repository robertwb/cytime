from setuptools import setup

from Cython.Build.Dependencies import cythonize

setup(
    name="cytime",
    author="Robert Bradshaw",
    version='0.1',
    url="https://github.com/robertwb/cytime",
    ext_modules=cythonize("**/*.pyx"),
    packages=['cytime'],
    package_data={"cytime": ["*.pxd"]},
    include_package_data=True,
    test_suite='cytime_test',
)
