from docplex.mp.model import Model

mdl = Model(name='binary_lp')

x1 = mdl.binary_var(name='x1')
x2 = mdl.binary_var(name='x2')
x3 = mdl.binary_var(name='x3')
x4 = mdl.binary_var(name='x4')
x5 = mdl.binary_var(name='x5')
x6 = mdl.binary_var(name='x6')
x7 = mdl.binary_var(name='x7')
x8 = mdl.binary_var(name='x8')
x9 = mdl.binary_var(name='x9')

mdl.add_constraint(x1 + x2 + x3 <= 1)
mdl.add_constraint(x2 + x3 + x4 + x5 + x6 + x7 + x8 <= 1)
mdl.add_constraint(x3 + x4 + x5 + x6 + x7 + x8 + x9 <= 1)
mdl.add_constraint(x4 + x5 + x6 + x7 + x8 + x9 <= 1)
mdl.add_constraint(x5 + x6 + x7 + x8 + x9 <= 1)
mdl.add_constraint(x6 + x7 + x8 + x9 <= 1)
mdl.add_constraint(x7 + x8 + x9 <= 1)
mdl.add_constraint(x8 + x9 <= 1)
mdl.add_constraint(x9 <= 1)

mdl.maximize(x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9)

solution = mdl.solve()

print(solution)

mdl = Model(name='binary_lp')

x1 = mdl.binary_var(name='x1')
x2 = mdl.binary_var(name='x2')
x3 = mdl.binary_var(name='x3')
x4 = mdl.binary_var(name='x4')
x5 = mdl.binary_var(name='x5')
x6 = mdl.binary_var(name='x6')
x7 = mdl.binary_var(name='x7')
x8 = mdl.binary_var(name='x8')
x9 = mdl.binary_var(name='x9')

mdl.add_constraint(x1 + x8 + x9 <= 1)
mdl.add_constraint(x1 + x2 + x9 <= 1)
mdl.add_constraint(x2 + x3 + x9 <= 1)
mdl.add_constraint(x3 + x4 <= 1)
mdl.add_constraint(x4 + x5 <= 1)
mdl.add_constraint(x4 + x5 + x6 <= 1)
mdl.add_constraint(x5 + x6 + x7 <= 1)
mdl.add_constraint(x6 + x7 + x8 <= 1)
mdl.add_constraint(x7 + x8 + x9 <= 1)

mdl.maximize(x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9)

solution = mdl.solve()

print(solution)

from docplex.mp.model import Model

mdl = Model()

x1 = mdl.continuous_var(name='x1', lb=0)
x2 = mdl.continuous_var(name='x2', lb=0)
x3 = mdl.continuous_var(name='x3', lb=0)
x4 = mdl.continuous_var(name='x4', lb=0)
gamma = mdl.continuous_var(name='gamma')

mdl.minimize(gamma)

mdl.add_constraint(3*x1 + 4*x2 + 2*x3 + 2*x4 <= 2*gamma)
mdl.add_constraint(3*x1 + 4*x2 + 5*x3 + 3*x4 <= 3*gamma)
mdl.add_constraint(3*x1 + 4*x2 + 5*x3 + 6*x4 <= 3*gamma)
mdl.add_constraint(x1 + x2 + x3 + x4 == 1)

solution = mdl.solve()
print(solution)

best_gamma = mdl.solution.objective_value

mdl.add_constraint(gamma<=best_gamma+0.003)

mdl.maximize(x4)

solution = mdl.solve()
print(mdl)
print(solution)


mdl = Model()

x = [None] * 9

cA = [(1,2),(1,3),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(4,5),(4,6),(4,7),(4,8),(4,9),(5,6),(5,7),(5,8),(5,9),(6,7),(6,8),(6,9),(7,8),(7,9),(8,9)]

for i in range(9):
  x[i] = mdl.binary_var_list(9, name=f'x_{i}')

y = mdl.binary_var_list(9, name='y')

mdl.minimize(mdl.sum(y))

for i in range(9):
  for h in range(9):
    mdl.add_constraint(x[i][h] <= y[h])
  mdl.add_constraint(mdl.sum(x[i]) == 1)
for i,j in cA:
  for h in range(9):
    mdl.add_constraint(x[i-1][h] + x[j-1][h] <= 1)

solution = mdl.solve()
print(solution)

mdl = Model()

x = [None] * 9

cA = [(1,2),(1,8),(1,9),(2,3),(2,9),(3,4),(3,9),
(4,5),(4,6),(5,6),(5,7),(6,7),(6,8),(7,8),(7,9),
(8,9)]

for i in range(9):
  x[i] = mdl.binary_var_list(9, name=f'x_{i}')

y = mdl.binary_var_list(9, name='y')

mdl.minimize(mdl.sum(y))

for i in range(9):
  for h in range(9):
    mdl.add_constraint(x[i][h] <= y[h])
  mdl.add_constraint(mdl.sum(x[i]) == 1)
for i,j in cA:
  for h in range(9):
    mdl.add_constraint(x[i-1][h] + x[j-1][h] <= 1)

solution = mdl.solve()
print(solution)

print(mdl.export_as_lp_string())
