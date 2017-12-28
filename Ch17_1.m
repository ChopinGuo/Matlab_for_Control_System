% Ex17_1

[a, b, c, d] = linmod2('mx1701_1');
sys = ss(a,b,c,d);
step(sys)

[a, b, c, d] = linmod2('mx1701_2');
figure(1);
sys = ss(a,b,c,d);
step(sys)

hold on
[a, b, c, d] = linmod2('mx1701_3');
figure(2);
sys = ss(a,b,c,d);
impulse(sys);

