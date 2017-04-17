from setuptools import setup

from Cython.Build.Dependencies import cythonize

setup(
    name="cytime",
    author="Robert Bradshaw",
    author_email="robertwb@gmail.com",
    version='0.1',
    url="https://github.com/robertwb/cytime",
    description="Cdef wrappings of functions from Python's time module.",
    long_description=open("README.md").read(),
    license="Apache",
    ext_modules=cythonize("**/*.pyx"),
    packages=["cytime"],
    package_data={"cytime": ["*.pxd"]},
    include_package_data=True,
    test_suite="cytime_test",
)
