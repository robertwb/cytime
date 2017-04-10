cdef extern from "timemodule.c" nogil:
    double floattime()
    int floatsleep(double secs)

cdef double time() nogil:
    return floattime()

cdef int sleep(double secs) nogil:
    return floatsleep(secs)
