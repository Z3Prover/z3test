
# Copyright (c) 2015 Microsoft Corporation
from z3 import *
set_option(auto_config=True)

X = [ [ Int("x_%s_%s" % (i+1, j+1)) for j in range(9) ] for i in range(9) ]
# Create a solver that converts linear integer arithmetic into SAT
S = Solver()

# Each cell has a value between 1 and 9
for i in range(9):
    for j in range(9):
        S.add(1 <= X[i][j], X[i][j] <= 9)

# The elements in each row are distinct
for i in range(9):
    S.add(Distinct(X[i]))

# The elements in each column are distinct
for j in range(9):
    column = [ X[i][j] for i in range(9) ]
    S.add(Distinct(column))

# The elements in each 3X3 square are distinct
for sq_i in range(3):
    for sq_j in range(3):
        square = []
        for i in range(3):
            for j in range(3):
                square.append(X[3*sq_i + i][3*sq_j + j])
        S.add(Distinct(square))

# Auxiliary functions for setting the value of known positions. 
def set(i, j, v):
    """Function for adding a constraint that fixes the value of cell i, j with v."""
    assert 1 <= i and i <= 9
    assert 1 <= j and j <= 9
    assert 1 <= v and v <= 9
    global S, X
    S.add(X[i-1][j-1] == v)

def setrow(i, r):
    """r is a vector of integers, if the value at r[j] is between 1 and 9, then we assume this Cell i,j has a fixed value."""
    assert len(r) == 9
    for j in range(9):
        if 1 <= r[j] and r[j] <= 9:
            set(i, j+1, r[j])

def setmatrix(m):
    """m is a matrix (aka vector of vectors of integers), if m[i][j] is in [1,9], we assume the value of cell is fixed and has value m[i][j]."""
    assert len(m) == 9
    for i in range(9):
        setrow(i+1, m[i])

# 
setmatrix(((0,0,0,1,0,5,0,6,8),
           (0,0,0,0,0,0,7,0,1),
           (9,0,1,0,0,0,0,3,0),
           (0,0,7,0,2,6,0,0,0),
           (5,0,0,0,0,0,0,0,3),
           (0,0,0,8,7,0,4,0,0),
           (0,3,0,0,0,0,8,0,5),
           (1,0,5,0,0,0,0,0,0),
           (7,9,0,4,0,1,0,0,0)))

r = S.check()
if r == unsat:
    print("no solution")
elif r == unknown:
    print("failed")
    print S.reason_unknown()
else:
    print("found solution")
    m = S.model()
    for i in range(9):
        print [ m.eval(X[i][j]) for j in range(9) ]
