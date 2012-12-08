"""
>>> from z3 import *
>>> set_option(auto_config=True)
>>> x, y, z = Bools('x y z')
>>> set_html_mode()
>>> And(x, And(y, z))
x &and; y &and; z
>>> And(And(x, y), z)
x &and; y &and; z
>>> Or(x, Or(y, z))
x &or; y &or; z
>>> Or(Or(x, y), z)
x &or; y &or; z
>>> And(Or(x, y), z)
(x &or; y) &and; z
>>> Or(And(x, y), z)
x &and; y &or; z
"""

if __name__ == "__main__":
    import doctest
    if doctest.testmod().failed:
        exit(1)

