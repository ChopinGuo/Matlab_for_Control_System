%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ex9_1: Transform system state-space model into its equivalent transfer
% function model.
% Ex9-3: Transform the system into its equivalent zero-pole gain model.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = [0.3  0.1   0.05;
       1  0.1      0;
     1.5  8.9   0.05;];
 
B = [2; 0; 4];
 
C = [1, 2, 3];

D = 0;

sys1 = ss(A, B, C, D);

G1 = tf(sys1);
G3 = zpk(sys1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ex9_2: Transform the system zero-pole gain model into its equivalent
% transform fynction model.
% Ex9_4: Transform the system into its equivalent zero-pole gain model. 
% Ex9_5: Transform the system into its equivalent state-space model.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

z = [-1 -2];
p = [0 -3 -4 -5];
k = 8;
sys2 = zpk(z, p, k);
G2 = tf(sys2);

num = G2.num{1};
den = G2.den{1};

sys4 = tf(num, den);
G4 = zpk(sys4);

G5 = ss(sys2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ex9_6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
syms s R0 R1 C1 Uin Uex;

Uex = Uin * (R1 + 1/(s*C1)) / R0;
G = simplify(Uex/Uin);

k = 30; z = -0.0167; p = 0;
sys = zpk(z, p, k);
sys1 = tf(sys);



