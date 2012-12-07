from z3 import *

# We represent graphs as a list of pair of non-negative integers.

def clique(edges, n):
    assert all(map(lambda e: isinstance(e[0], int) and isinstance(e[1], int), edges))
    assert all(map(lambda e: e[0] >= 0 and e[1] >= 0, edges))
    num = 0
    for e in edges:
        if e[0] >= num:
            num = e[0] + 1
        if e[1] >= num:
            num = e[1] + 1
    assert num <= 128, "too many nodes for demo"
    S = Solver()
    # Create a 0-1 variable in_i for each node, in_i is 1 if node i is in the clique
    In = [ Int('in_%s' % i) for i in range(num) ]
    for i in range(num):
        S.add(0 <= In[i], In[i] <= 1)
    # The number of nodes in the clique must be greater or equal to n
    S.add(simplify(reduce(lambda a, b: a + b, In, 0)) >= n)
    # Create a matrix from the edges
    matrix = [ [ 0 for j in range(i)] for i in range(num)]
    for e in edges:
        s = e[0]
        t = e[1]
        if s < t:
            s = e[1]
            t = e[0]
        matrix[s][t] = 1
    # For each non-existing edge (i, j) Add constraint In[i] == 0 or In[j] == 0
    for i in range(num):
        for j in range(i):
            if i != j:
                if matrix[i][j] == 0:
                    S.add(Or(In[i] == 0, In[j] == 0))
    r = S.check()
    if r == unsat:
        print("no solution")
    elif r == unknown:
        print("failed")
        print S.reason_unknown()
    else:
        print("found solution")
        m = S.model()
        print filter(lambda a: eq(m.eval(In[a]), IntVal(1)), range(num))

clique([(0, 1), (2, 3), (1, 2), (2, 3), (1, 4), (1, 5), (2, 5)], 3)
clique([(0, 1), (2, 3), (1, 2), (2, 3), (1, 4), (1, 5), (2, 5)], 4)


            
