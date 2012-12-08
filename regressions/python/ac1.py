"""
Testing  AC
>>> from z3 import *
>>> x, y = Reals('x y')
>>> 2 - (x - y)
2 - (x - y)
>>> 2 + (x - y)
2 + x - y
>>> 2 - (x + y)
2 - (x + y)
>>> 2 + (x + (y + y))
2 + x + y + y
>>> 2 - (x - (y - y))
2 - (x - (y - y))
>>> 2 + (x - (y + y))
2 + x - (y + y)
>>> x * (x * x)
x*x*x
>>> x/(y/y)
x/(y/y)
>>> x + -x
x + -x
>>> -(x + y)
-(x + y)
>>> x, y = BitVecs('x y', 16)
>>> 2 - (x - y)
2 - (x - y)
>>> 2 + (x - y)
2 + x - y
>>> 2 - (x + y)
2 - (x + y)
>>> 2 + (x + (y + y))
2 + x + y + y
>>> 2 - (x - (y - y))
2 - (x - (y - y))
>>> 2 + (x - (y + y))
2 + x - (y + y)
>>> x * (x * x)
x*x*x
>>> x/(y/y)
x/(y/y)
"""

if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)
    
