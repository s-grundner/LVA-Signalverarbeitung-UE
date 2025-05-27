%% System with no DTFT

a = [1, 1, 2];
abs(roots(a))

H = @(z) (1/3 - 1/8*z.^(-1)) ./ (1 + 1*z.^(-1) + 2*z.^(-2));

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
