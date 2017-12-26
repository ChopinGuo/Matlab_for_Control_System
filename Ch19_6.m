% Ex19_23

A = [0 1; 2 -1];
d = eig(A);

Q = eye(2);

syms p11 p12 p21 p22;
P = [p11 p12; p21 p22];
FQ = -Q;
APPA = A'*P + P*A;

if det(A)~=0
    [p11, p12, p22] = solve('4*p12=-1', 'p11-p12+2*p22=0','2*p12-2*p22=-1');
    p21 = p12;
    P = [p11 p12; p21 p22]
    detp11 = det(P(1,1))
    detP = det(P)
end

