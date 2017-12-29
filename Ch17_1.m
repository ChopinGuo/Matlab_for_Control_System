% % Ex17_1
% 
% % [a, b, c, d] = linmod2('mx1701_1');
% % sys = ss(a,b,c,d);
% % [y, t] = step(sys)
% 
% [a, b, c, d] = linmod2('mx1701_2');
% figure(1);
% sys = ss(a,b,c,d);
% step(sys)
% 
% hold on
% [a, b, c, d] = linmod2('mx1701_3');
% figure(2);
% sys = ss(a,b,c,d);
% impulse(sys);

clear
clc

[a,b,c,d] = linmod2('mx1701_1');
sys = ss(a,b,c,d);
% [y,t] = step(sys);
% step(sys)
t = 0:10^(-4):0.5;
c = step(sys,t);
plot(t,c)
grid
% [y,x,t] = step(sys,t);
maxy = max(c);
ys = c(length(t));
pos = (maxy-ys)/ys % 求取超调量
n = 1;
while c(n)<0.5*ys
    n = n+1;
end
td = t(n) % 求取延迟时间

n = 1;
while c(n)<maxy
    n = n+1
end
tp = t(n) % 求取峰值时间

L = length(t);
while c(L)>0.98*ys & c(L)<1.02*ys
    L = L-1;
end
ts = t(L) % 求取调节时间 2%

L = length(t);
while c(L)>0.95*ys & c(L)<1.05*ys
    L = L-1;
end
ts = t(L) % 求取调节时间 5%
