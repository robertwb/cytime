cdef extern from "timemodule.c" nogil:
    double floattime()
    void floatsleep(double secs)

cdef double time() nogil:
    return floattime()

cdef void sleep(double secs) nogil:
    floatsleep(secs)
