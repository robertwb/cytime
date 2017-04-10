# cytime

Cdef equivalents of functions from Python's time module.

This allows one to call time-related functions from Cython retaining
the platform-independence one is used to from Python.

As the C-level functions are not exposed, this is simply a re-distribution
of the required portions of timemodule.c.
