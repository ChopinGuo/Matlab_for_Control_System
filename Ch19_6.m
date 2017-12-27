% Ex19_23

% A = [0 1; 2 -1];
% d = eig(A);
% 
% Q = eye(2);
% 
% syms p11 p12 p21 p22;
% P = [p11 p12; p21 p22];
% FQ = -Q;
% APPA = A'*P + P*A;
% 
% if det(A)~=0
%     [p11, p12, p22] = solve('4*p12=-1', 'p11-p12+2*p22=0','2*p12-2*p22=-1');
%     p21 = p12;
%     P = [p11 p12; p21 p22]
%     detp11 = det(P(1,1))
%     detP = det(P)
% end

% Ex19_24

% A = [-1 1; 2 -3];
% if det(A)~=0
%     disp('A is nosingular,and the origin is the only equilibrium state.')
% else
%     disp('A is singular.')
% end
% 
% Q = eye(2);
% 
% syms p11 p12 p21 p22 x1 x2;
% P = [p11 p12; p21 p22];
% FQ = -Q;
% APPA = A'*P + P*A;
% 
% if det(A)~=0
%     [p11 p12 p21 p22] = solve('2*p12 - 2*p11 + 2*p21 = -1',...
%         'p11 - 4*p12 + 2*p22 = 0',...
%         'p11 - 4*p21 + 2*p22 = 0',...
%         'p12 + p21 - 6*p22 = -1');
% end
% 
% P = [p11 p12; p21 p22];
% detP11 = det(P(1,1))
% detP = det(P)
% 
% x = [x1; x2];
% vPx = collect(x.'*P*x)
% vQx = x.' * (-Q) * x

% Ex19_25

syms k positive;
A = [0 1 0; 0 -2 1; -k 0 -1];
B = [0 0 k];
detA = det(A);

syms p11 p12 p13 p21 p22 p23 p31 p32 p33
P = [p11 p12 p13; p21 p22 p23; p31 p32 p33];

Q = [0 0 0; 0 0 0; 0 0 1];
FQ = -Q;
APPA = A'*P + P*A;

if detA~=0
    [p11, p12, p13, p21, p22, p23, p31, p32, p33] = ...
        solve('- k*p13 - k*p31 = 0', ...
        'p11 - 2*p12 - k*p32 = 0', ...
        'p12 - p13 - k*p33 = 0', ...
        'p11 - 2*p21 - k*p23 = 0', ...
        'p12 + p21 - 4*p22 = 0', ...
        'p13 + p22 - 3*p23 = 0', ...
        'p21 - p31 - k*p33 = 0', ...
        'p22 + p31 - 3*p32 = 0', ...
        'p23 + p32 - 2*p33 = -1');
    P = [p11 p12 p13; p21 p22 p23; p31 p32 p33];
    detp11 = det(P(1,1))
    detp2 = det(P(2,2))
    detP = det(P)
end
