import math
import sys
import time
import unittest

cimport cytime


class CyTimeTest(unittest.TestCase):

    @staticmethod
    def exp_range(min, max, steps):
        log_min = math.log(min)
        log_range = math.log(max) - log_min
        for k in range(steps):
            yield math.exp(log_min + log_range * k / (steps - 1))

    def assertAllClose(self, as, bs, epsilon=1e-10):
        as = list(as)
        bs = list(bs)
        max_diff = max(abs(a-b)/min(a, b) for a, b in zip(as, bs))
        self.assertLess(max_diff, epsilon, (as, bs))

    def test_exp_range(self):
        self.assertAllClose(self.exp_range(1, 8, 4), [1, 2, 4, 8])
        self.assertAllClose(
            self.exp_range(1, 8, 7),
            [1, math.sqrt(2), 2, math.sqrt(8), 4, math.sqrt(32), 8])
        self.assertAllClose(
            self.exp_range(.01, 100, 5),
            [.01, .1, 1, 10, 100])

    def test_sleep(self):
        for secs in self.exp_range(.001, 2, 17):
            t = time.time()
            cytime.sleep(secs)
            actual = time.time() - t
            print secs, actual
            self.assertLess(abs(actual - secs), 1e-2)

    def test_time(self):
        # Python 3 rounds differently.
        epsilon = 0 if sys.version_info[0] < 3 else 1e-6
        t1 = time.time()
        t2 = cytime.time()
        t3 = time.time()
        t4 = cytime.time()
        self.assertLessEqual(t1, t2 + epsilon)
        self.assertLessEqual(t2, t3 + epsilon)
        self.assertLessEqual(t3, t4 + epsilon)
