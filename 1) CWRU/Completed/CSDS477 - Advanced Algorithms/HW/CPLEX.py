from docplex.mp.model import Model

mdl = Model()

y1 = mdl.continuous_var(name='y1', lb=0)
y2 = mdl.continuous_var(name='y2', lb=0)
y3 = mdl.continuous_var(name='y3', lb=0)

mdl.add_constraint(2*y1 + y2 >= 1)
mdl.add_constraint(y1 + y3 >= 1)

mdl.minimize(3*y1 + y2 + y3)

solution = mdl.solve()

print(mdl.export_as_lp_string())

print(solution)

mdl = Model()

y1 = mdl.continuous_var(name='y1', lb=0)
y2 = mdl.continuous_var(name='y2', lb=0)
y3 = mdl.continuous_var(name='y3', lb=0)
y4 = mdl.continuous_var(name='y4', lb=0)
y5 = mdl.continuous_var(name='y5', lb=-mdl.infinity, ub=mdl.infinity)

mdl.add_constraint(3*y1 + 3*y2 + 3*y3 + 3*y4 + y5 >= 0)
mdl.add_constraint(1*y1 + 4*y2 + 4*y3 + 4*y4 + y5 >= 0)
mdl.add_constraint(1*y1 + 2*y2 + 5*y3 + 5*y4 + y5 >= 0)
mdl.add_constraint(1*y1 + 2*y2 + 3*y3 + 6*y4 + y5 >= 0)
mdl.add_constraint(-y1 - 2*y2 - 3*y3 - 3*y4  == -1)

mdl.minimize(y5)

solution = mdl.solve()

print(mdl.export_as_lp_string())

print(solution)


mdl = Model()

x = [None] * 9

cA = [(1,2),(1,4),(2,3),(3,4),(2,4)]

for i in range(4):
  x[i] = mdl.continuous_var_list(4, ub=1, name=f'x_{i+1}')

x[0] = mdl.binary_var_list(4, name=f'x_{1}')
x[2] = mdl.binary_var_list(4, name=f'x_{3}')


y = mdl.continuous_var_list(4, ub=1, name='y')

mdl.minimize(mdl.sum(y))

for i in range(4):
  for h in range(4):
    mdl.add_constraint(x[i][h] <= y[h])
  mdl.add_constraint(mdl.sum(x[i]) == 1)
for i,j in cA:
  for h in range(4):
    mdl.add_constraint(x[i-1][h] + x[j-1][h] <= 1)

solution = mdl.solve()
print(solution)

