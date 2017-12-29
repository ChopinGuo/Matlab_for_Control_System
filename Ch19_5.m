% Ex19_20

n1 = 10;
d1 = conv(conv([1,1], [1,2]), [1,3]);
sys = tf(n1, d1);
[A, B, C, D] = tf2ss(n1, d1);
N = size(A);
n = N(1);
CAM = ctrb(A, B);
rcam = rank(CAM);

if rcam == n
    disp('System is controlled')
elseif n >rcam
    disp('System is no controlled')
end

p = [-2+2*sqrt(3)*1i -2-2*sqrt(3)*1i -10];
k = place(A, B, p);

ob = obsv(A, C);
roam = rank(ob);

if roam == n
    disp('System is observable')
elseif roam ~= n
    disp('System is no observable')
end

K = place(A', C', p);
K1 = acker(A', C', p);

% Ex19_21

a = [0 1; -2 -3];
b = [0; 1];
c = [2 0];
n = 2;
ob = obsv(a, c);
roam = rank(ob);

if roam == n
    disp('System is controlled.')
elseif roam ~= n
    disp('System is no controlled.')
end

a1 = a';
c1 = c';
p = [-10 -10];
k = acker(a1, c1, p);
size(k);
K = k';
A = a - K*c;

% Ex19_22

A = [0 1 0 0; 0 0 -1 0; 0 0 0 1; 0 0 11 0];
B = [0; 1; 0; -1];
C = [1 0 0 0];

p = [-2 -3 -2+1i -2-1i];
CAM = ctrb(A, B);
N = size(A);
n = N(1);
ob = obsv(A, C);
roam = rank(ob);

if roam == n
    disp('System is observable.')
elseif roam < n
    disp('System is no observable.')
end

K = acker(A', C', p);
H = K'
AHC = A - H*C;

E3 = eye(3);
D1 = [0; 0; 0];
D = [D1, E3];

Q = [D; C];
Q1 = inv(Q);
A1 = Q*A*Q1;
A11 = A1(1:3, 1:3);
A21 = A1(4, 1:3);

syms h1 h2 h3 s
H1 = [h3; h2; h1];
eq = collect(det(s*E3 - (A11 - H1*A21)), s);

eq1 = expand((s+3)*(s-(-2+1i))*(s-(-2-1i)));

[h1, h2, h3] = solve('h3=7', '-h2-11=17', '-h1-11*h3=15', 'h1,h2,h3');

A1 = A;
B1 = B;
C1 = C;
Q = [0 0 0 1; 0 0 1 0; 0 1 0 0; C]
Q1 = inv(Q);
A = Q * A1 * Q1;
A11 = A(1:3, 1:3);
A21 = [A(4, 1:3)];
A12 = A(1:3, 4);
A22 = A(4, 4);

QB1 = Q*B1;
B11 = QB1(1:3, 1);
B12 = QB1(4, 1);

C1 = C1*Q1;

H = [-92; -28; 7];
AHAW = (A11 - H*A21)
BHBU = (B11 - H*B12)
AHAY = (A11 - H*A21)*H + A12 - H*A22