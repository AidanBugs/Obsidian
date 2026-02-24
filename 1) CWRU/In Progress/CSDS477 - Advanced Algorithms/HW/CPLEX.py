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
