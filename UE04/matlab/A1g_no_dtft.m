%% System with no DTFT

b = [1/3, -1/8, 0];
a = [1, 1, 1];
p = roots(a);
z = roots(b);

H = @(z) (1/3 - 1/8*z.^(-1)) ./ (1 + 1*z.^(-1) + 1*z.^(-2));

re = linspace(-2, 2, 201);
im = linspace(-2, 2, 201);
[Re, Im] = meshgrid(re, im);

Z = Re + 1i*Im;
absHz = abs(H(Z));

%% Contour

n = linspace(0, 2*pi, 50); % To show Unit Circle
figure;
contourf(Re, Im, absHz, 0:0.1:1.5);
hold on
plot(cos(n), sin(n), 'y--', 'Linewidth', 3);
xlabel('Re z');
ylabel('Im z');
axis equal
colorbar();
set(gca, 'FontSize', 20)

%% DTFT divergence

figure;
[hw,fw] = zerophase(b, a, 1024, "whole");

plot3(cos(fw), sin(fw), hw, 'LineWidth', 2)
hold on
plot3(cos(fw), sin(fw), zeros(size(fw)) ,'--', 'LineWidth', 2)
plot3(real(z), imag(z), zeros(size(z)) ,'o', 'LineWidth', 2, 'MarkerSize', 16)
plot3(real(p), imag(p), zeros(size(p)) ,'x', 'LineWidth', 2, 'MarkerSize', 16)
hold off

xlabel('Re z')
ylabel('Im z')
zlabel('|H(e^{j\Omega})|')
title('Frequenzgang über der z-Ebene')
set(gca, 'FontSize', 20)
view(45,45)
grid

