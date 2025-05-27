close all;

b = [1/3, -1/8, 0];
a = [1, 1/6, 1/4];

z = roots(b);
p = roots(a);

% Customized zplane 
% https://de.mathworks.com/matlabcentral/answers/2042466-change-intensity-of-zplane-figure

figure
zplane(b, a);
getgca = get(gca);
Kids = getgca.Children;
hold on
plot(Kids(1).XData, Kids(1).YData, ':', 'LineWidth', 2)
plot(Kids(2).XData, Kids(2).YData, 'xr', 'LineWidth', 3, 'MarkerSize', 16)
plot(Kids(3).XData, Kids(3).YData, 'og', 'LineWidth', 3, 'MarkerSize', 16)

% Region of Convergence
roc = max(abs(p));
phi = linspace(0, 2*pi, 50);
plot(roc*cos(phi), roc*sin(phi), 'b--', 'LineWidth', 2);

title('Pol-Nullstellen Diagramm')
xlabel('Re z')
ylabel('Im z')
set(gca, 'FontSize', 20)
hold off
axis([[-1 1]*1.5  [-1 1]*1.25])
grid

% From Matlab zplane documentation
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
view(35,40)
grid

%% Show some Vaules

display(p); % Show poles
display(roc); % Show region of Convergence radius

