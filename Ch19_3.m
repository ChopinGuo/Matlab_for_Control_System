% Ex19_11
A = [0 1 0; 0 0 1; 2 -5 4]
[V D] = eig(A);
P = [1 0 1; 1 1 2; 1 2 4];
P1 = inv(P);
J = P1*A*P
J1 = jordan(A)