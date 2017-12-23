% Ex19_12

F = [0.9048 0 0; 0.1338 0.4651 -0.2337; 0.0243 0.2237 0.9602];
G = [0.0952; 0.0784; 0.0135];
C = [0 0 2.5928];
D = 0;
A = F;
B = G;
CAM = ctrb(A,B)
CO = [G F*G F*F*G];
rcam = rank(CAM)
n = 3;

if rcam == n
    disp('System is controlled')
elseif rcam < n
    disp('System is no controlled')
end

OB = obsv(F, C)
OB1 = [C; C*F; C*F*F]
OB2 = [C' F'*C' F'*F'*C']
N = size(F);
n = N(1);
rob = rank(OB);

if rob == n
    disp('System is observable')
elseif rob ~= n
    disp('System is no observable')
end

% Ex19_16

% Ex19_13

A = [-1 1 0; 0 -1 0; 0 0 -2];
B = [0; 4; 3];
CO = [B A*B A*A*B];
CAM = ctrb(A, B);
N = size(A);
n = N(1);
rcam = rank(CAM);

if rcam == n
    disp('System is controlled.')
elseif rcam < n
    disp('System is no controlled.')
end

% Ex19_14

A = [0 1 -1; -6 -11 6; -6 -11 5];
B = [0; 1; 1];
CAM = ctrb(A, B);
N = size(A);
n = N(1);
s = inv(CAM)
P = [s(3,:); s(3,:)*A; s(3,:)*A*A]
A1 = P * A * inv(P);

% Ex19_15

A = [2 0 0; 0 2 0; 0 3 1];
B = [1; 1; 0];
C = [1 1 1; 1 2 3];
D = [0; 0];

CAM = ctrb(A, B);
N = size(A);
n = N(1);
rcam = rank(CAM);

if det(CAM) ~= 0
    if n == rcam
        disp('System is controlled.')
    elseif n > rcam
        disp('System is no controlled.')
    end
elseif  det(CAM) == 0
    disp('System is no controlled.')
end

t1 = C*B;
t2 = C*A*B;
t3 = C*A*A*B;
T = [t1 t2 t3 D];

M = size(C);
q = M(1);
rcap = rank(T);

if rcap == q
    disp('System output is controlled.')
elseif rcap ~= q
    disp('System output is no controlled.')
end

% Ex19_17

A = [-2 2 -1; 0 -2 0; 1 -4 0];
B = [0 1; 0 0; 1 0];
C = [1 0 0; 0 1 0];
D = [0];

CAM = ctrb(A, B);
rcam = rank(CAM);
N = size(A);
n = N(1);

if rcam == n
    disp('System is controlled')
elseif rcam < n
    disp('System is no controlled')
end

ob = obsv(A, C);
rob = rank(ob);

if rob == n
    disp('System is observable')
elseif rob ~= n
    disp('System is no observable')
end