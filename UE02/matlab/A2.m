clear
clc
close all

o = linspace(-3*pi, 3*pi, 4001);
H = 2*(-cos(o)+cos(2*o)-cos(3*o)) - 2i*(-sin(o)+sin(2*o)-sin(3*o));

h1 = figure;
set(h1, 'WindowStyle', 'Docked');

subplot(2,1,1);
plot(o, abs(H))
title("Bode Plot")
xlabel("\Omega")
ylabel("|H(\Omega)|")
xlim([-2*pi 2*pi])
xticks([-2*pi -pi 0 pi 2*pi])
xticklabels({'-2\pi','-\pi','0','\pi','2\pi'})

subplot(2,1,2);
plot(o, angle(H))
xlabel("\Omega")
ylabel("arg(H(\Omega))")
xlim([-2*pi 2*pi])
xticks([-2*pi -pi 0 pi 2*pi])
xticklabels({'-2\pi','-\pi','0','\pi','2\pi'})

h2 = figure;
set(h2, 'WindowStyle', 'Docked');
subplot(2,1,1);
plot(o+pi, abs(H))
title("Bode Plot")
xlabel("\Omega")
ylabel("|H_1(\Omega)|")
xlim([-2*pi 2*pi])
xticks([-2*pi -pi 0 pi 2*pi])
xticklabels({'-2\pi','-\pi','0','\pi','2\pi'})

subplot(2,1,2);
plot(o+pi, angle(H))
xlabel("\Omega")
ylabel("arg(H_1(\Omega))")
xlim([-2*pi 2*pi])
xticks([-2*pi -pi 0 pi 2*pi])
xticklabels({'-2\pi','-\pi','0','\pi','2\pi'})