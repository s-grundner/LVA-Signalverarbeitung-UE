close all

H = @(z) (1/3 - 1/8*z.^(-1)) ./ (1 + 1/6*z.^(-1) + 1/4*z.^(-2));

re = linspace(-1.1, 1.1, 201);
im = linspace(-1.2, 1.1, 201);
[Re, Im] = meshgrid(re, im);

Z = Re + 1i*Im;
absHz = abs(H(Z));

range = [0, 2];

figure;
surf(Re, Im, absHz);
zlim([0 2])
clim([0 2])
xlabel('Re z');
ylabel('Im z');
zlabel('|H(z)|');
title('|H(z)| in der z-Ebene');
shading interp;
set(gca, 'FontSize', 20)
view(45,45)

n = linspace(0, 2*pi, 50);
figure;
contourf(Re, Im, absHz, 0:0.1:1.5);
hold on
plot(cos(n), sin(n), 'y--', 'Linewidth', 3);
xlabel('Re z');
ylabel('Im z');
axis equal
colorbar();
set(gca, 'FontSize', 20)

omega = linspace(0, 2*pi, 101);
zDtft = exp(1i*omega);
H_dtft = abs(H(zDtft));
figure;
plot(omega, H_dtft, 'Linewidth', 3);
xlabel('\Omega')
ylabel('|H(e^{j\Omega})|')
grid on
set(gca, 'FontSize', 20)
