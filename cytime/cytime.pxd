"""
Cdef wrappings of functions from Python's time module.

This allows one to call time-related functions from Cython retaining
the platform-independence one is used to from Python.
"""

cdef void sleep(double secs) nogil
cdef double time() nogil
