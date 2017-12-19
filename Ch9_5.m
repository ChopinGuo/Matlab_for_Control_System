%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ex9_12: RLC Network System
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
syms ai aip ur ul ucpp ucp uc R L C
aip = C * ucpp;
ul = L * aip;
ur = R*ai + ul + uc;
ur = subs(ur, ai, C*ucp);

clear;
syms R C L s Ur Uc;
Uc = simplify(Ur*(1/(s*C))/(R+s*L+1/(s*C)));
G = (Uc/Ur);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ex9_13: 弹簧-质量-阻尼器动力系统
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
syms F F1 F2 m y yp ypp k f;
F1 = -k * y;
F2 = -f * yp;
[y] = solve('m*ypp = F - k*y - f*yp');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ex9_14: 机械-液压阻尼器
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
syms A p1 p2 q R k xi xo xip xop;
x = p2 - p1;
[x] = solve('k * xo = A * x')

clear;
syms A p1 p2 q R k xi xo xip xop;
x = p2 - p1;
[x] = solve('(A*(xip-xop)) = (x/R)');

clear;
syms A p1 p2 q R k xi xo xip xop;
[xip] = solve('k*xo/A = A*(xip-xop)*R');

clear;
syms s A R T k G x r;
T = (A^2*R)/k;
[x] = solve('s*r = s*x + x/T');
G = x/r