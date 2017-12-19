% Ex19_4

clear;

syms s t;

A = [0 1; -2 -3];
E = eye(2);
B = s*E - A
C = factor(det(B))
E = collect(inv(B))
phit = ilaplace(E)

% Ex19_5

clear;

syms s t x0 tao phi phi0 a

A = [-1  1  0;
      0 -1  0;
      0  0 -2]
B = [0; 1; 4]
E = eye(3)
C = s*E - A
D = det(C)
F = inv(C)
phi0 = ilaplace(F)
x0 = [1; 2; 1];
x = phi0 * x0
a = tao;
phi = subs(phi0, 't', a)
f = phi*B
bu = int(f, 0, t)
xbu = collect(x + bu)
