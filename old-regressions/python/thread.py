from z3 import *
from threading import Thread

class Tst(Thread):
    def __init__(self, idx, num):
        Thread.__init__(self)
        self.idx = idx
        self.num = num
        self.ctx = Context()
        
    def run(self):
        self.result = []
        for i in range(self.num):
            self.result.append(Int("x:%s:%s" % (self.idx, i), self.ctx))
        for i in range(self.num):
            assert self.result[i].decl().name() == "x:%s:%s" % (self.idx, i)

threads = []
for i in range(4):
    t = Tst(i, 50)
    threads.append(t)
    t.start()

for t in threads:
    t.join()

for t in threads:
    print t.result

print "done"
