from z3 import *

# Create 3 integer variables
dog, cat, mouse = Ints('dog cat mouse')

solve(dog >= 1,   # at least one dog
      cat >= 1,   # at least one cat
      mouse >= 1, # at least one mouse
      dog + cat + mouse == 100,  # we want to buy 100 animals
      1500 * dog + 100 * cat + 25 * mouse == 10000 # We have 100 dollars (10000 cents), dogs cost 15 dollars (1500 cents), cats 1 dollar (100 cents), and mice 25 cents 
      )

