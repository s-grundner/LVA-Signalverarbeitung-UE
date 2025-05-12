clear
clc
close all

o = linspace(-4*pi, 4*pi, 4001);
H = 1./(1-0.5*exp(-1i*o));

figure
subplot(2,1,1);
plot(o, abs(H))
title("Bode Plot")
xlabel("\Omega")
ylabel("|H_1(\Omega)|")
subplot(2,1,2);
plot(o, angle(H))
xlabel("\Omega")
ylabel("arg(H_1(\Omega))")

figure
subplot(2,1,1);
plot(o, real(H))
title("Realteil")
xlabel("\Omega")
ylabel("\Re(H_1(\Omega))")

subplot(2,1,2);
plot(o, imag(H))
title("Imaginärteil")
xlabel("\Omega")
ylabel("\Im(H_1(\Omega))")

