from sympy import *
import numpy as np

# creating our symbolic variables
x = Symbol('x')

y = Symbol('y')

z = Symbol('z')

# Initial Guess Vector
x0 = 2
y0 = 2
z0 = 2
# a0 = 2
# b0 = 2
# c0 = 2
guess = np.array([2, 2, 2])
# sol1 = np.array([])
# sol2 = np.array([])
# sol3 = np.array([])

# our functions in the non-linear system
function1 = x**2 + y**3
function2 = x**2 + y**3 + z**2
function3 = 2*x**3 + y**2 + 3*z**3

solutionVect = np.array([[function1.evalf(subs={x: x0, y: y0, z: z0})],
                         [function2.evalf(subs={x: x0, y: y0, z: z0})],
                         [function3.evalf(subs={x: x0, y: y0, z: z0})]], dtype='double')

# Function 1 Partial Derivatives
partialDerivXf1 = (Derivative(function1, x)).doit()

partialDerivYf1 = (Derivative(function1, y)).doit()

partialDerivZf1 = (Derivative(function1, z)).doit()

# Function 2 partial derivatives
partialDerivXf2 = (Derivative(function2, x)).doit()

partialDerivYf2 = (Derivative(function2, y)).doit()

partialDerivZf2 = (Derivative(function2, z)).doit()

# Function 3 Partial Derivatives
partialDerivXf3 = (Derivative(function3, x)).doit()

partialDerivYf3 = (Derivative(function3, y)).doit()

partialDerivZf3 = (Derivative(function3, z)).doit()

# printing partials from function 1
print("\nPartial of function 1 with Respect to x:")
print(partialDerivXf1)
print("Partial of function 1 with Respect to y:")
print(partialDerivYf1)
print("Partial of function 1 with Respect to z:")
print(partialDerivZf1)
print("\n")
# Printing partials from function 2
print("Partial of function 2 with Respect to x:")
print(partialDerivXf2)
print("Partial of function 2 with Respect to y:")
print(partialDerivYf2)
print("Partial of function 2 with Respect to z:")
print(partialDerivZf2)
print("\n")

# Printing Partials from function 3
print("Partial of function 3 with Respect to x:")
print(partialDerivXf3)
print("Partial of function 3 with Respect to y:")
print(partialDerivYf3)
print("Partial of function 3 with Respect to z:")
print(partialDerivZf3)
print("\n")

print("The Jacobian Matrix is:")
JacobMatrixSymbolic = np.array([[partialDerivXf1, partialDerivYf1, partialDerivZf1],
                                [partialDerivXf2, partialDerivYf2, partialDerivZf2],
                                [partialDerivXf3, partialDerivYf3, partialDerivZf3]])

print(JacobMatrixSymbolic)
print("\n")

tol = 0.000001
overtol = 10000000

for JacobianMatrix in range (10):
    # Evaluating each partial of each function at the new x, y, and z values
    print("Each Partial of Function 1 evaluated at the new values:")
    print(partialDerivXf1.evalf(subs={x: x0, y: y0, z: z0}))
    comp1 = partialDerivXf1.evalf(subs={x: x0, y: y0, z: z0})
    print(partialDerivYf1.evalf(subs={x: x0, y: y0, z: z0}))
    comp2 = partialDerivYf1.evalf(subs={x: x0, y: y0, z: z0})
    print(partialDerivZf1.evalf(subs={x: x0, y: y0, z: z0}))
    comp3 = partialDerivZf1.evalf(subs={x: x0, y: y0, z: z0})
    print("\nEach partial of function 2 evaluated at the new values:")
    print(partialDerivXf2.evalf(subs={x: x0, y: y0, z: z0}))
    comp4 = partialDerivXf2.evalf(subs={x: x0, y: y0, z: z0})
    print(partialDerivYf2.evalf(subs={x: x0, y: y0, z: z0}))
    comp5 = partialDerivYf2.evalf(subs={x: x0, y: y0, z: z0})
    print(partialDerivZf2.evalf(subs={x: x0, y: y0, z: z0}))
    comp6 = partialDerivZf2.evalf(subs={x: x0, y: y0, z: z0})
    print("\nEach partial of function 3 evaluated at the new values:")
    print(partialDerivXf3.evalf(subs={x: x0, y: y0, z: z0}))
    comp7 = partialDerivXf3.evalf(subs={x: x0, y: y0, z: z0})
    print(partialDerivYf3.evalf(subs={x: x0, y: y0, z: z0}))
    comp8 = partialDerivYf3.evalf(subs={x: x0, y: y0, z: z0})
    print(partialDerivZf3.evalf(subs={x: x0, y: y0, z: z0}))
    comp9 = partialDerivZf3.evalf(subs={x: x0, y: y0, z: z0})


    JacobianMatrix = np.array([[comp1, comp2, comp3],
                         [comp4, comp5, comp6],
                         [comp7, comp8, comp9]], dtype='double')


    InvJacobianMatrix = np.linalg.inv(JacobianMatrix)

    Part = InvJacobianMatrix.dot(solutionVect)

    NewSolutionVect = solutionVect - Part

    convergence = abs(NewSolutionVect-solutionVect)

    print("\nThe Solution Vector at x in beginning of iteration:")
    print(solutionVect)

    print("\nThe Inverse of the Jacobian at entered solution vector:")
    print(InvJacobianMatrix)

    print("\nThe product of the solution vector and the inverse Jacobian:")
    print(Part)

    print("\nOur New X for the next iteration:")
    print(NewSolutionVect)

    '''
    print("\nThe Residual of this Iteration is:")
    print(residual)
    '''

    print("\nThe Iterative Convergence of this Iteration is:")
    print(convergence)

    print("Note: The Residual is the absolute value of the largest component of the solution vector")

    if convergence > overtol:
        print("This bitch Diverging. YEET")
        converge = false
    else:
        converge = true



solutionVect = guess

#print("The inverse of the Jacobian Matrix is:")
# print(np.linalg.inv(JacobianMatrix))
