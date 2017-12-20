% Ex19_12

F = [0.9048 0 0; 0.1338 0.4651 -0.2337; 0.0243 0.2237 0.9602];
G = [0.0952; 0.0784; 0.0135];
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