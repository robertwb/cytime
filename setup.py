from setuptools import setup

from Cython.Build.Dependencies import cythonize


setup(
    name="cytime",
    author="Robert Bradshaw",
    author_email="robertwb@gmail.com",
    version="0.2",
    url="https://github.com/robertwb/cytime",
    description="Cdef wrappings of functions from Python's time module.",
    long_description=open("README.md").read(),
    license="Apache",
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "Topic :: Software Development",
        "Topic :: System",
        "License :: OSI Approved :: Apache Software License",
        "Programming Language :: C",
        "Programming Language :: Cython",
        "Programming Language :: Python :: 2",
        "Programming Language :: Python :: 2.7",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.4",
        "Programming Language :: Python :: 3.5",
        "Programming Language :: Python :: 3.6",
    ],
    keywords="time",
    ext_modules=cythonize("**/*.pyx"),
    packages=["cytime"],
    package_data={"cytime": ["*.pxd"]},
    include_package_data=True,
    test_suite="cytime_test",
)
