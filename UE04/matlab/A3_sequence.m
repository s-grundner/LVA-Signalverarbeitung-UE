close all; 

n = linspace(0, 40, 41);

%% Stable

a = 0.9;
yp = 3*(-1).^(n) / (1 + a);
yh = 3*a.^(n+1) / (1 + a);
y = yh + yp;

subplot(2, 3, 1);
plotSignal(n, yp);
ylabel('y_p')
title('Stationärer Anteil')

subplot(2, 3, 2);
plotSignal(n, y);
ylabel('y')
title(['Stabil mit a = ', num2str(a)])

subplot(2, 3, 3);
plotSignal(n, yh);
ylabel('y_h')
title('Transienter Anteil')

%% Unstable

a = 1.05;
yp = 3*(-1).^(n) / (1 + a);
yh = 3*a.^(n+1) / (1 + a);
y = yh + yp;

subplot(2, 3, 4);
plotSignal(n, yp);
ylabel('y_p')
title('Stationärer Anteil')

subplot(2, 3, 5);
plotSignal(n, y);
ylabel('y')
title(['Stabil mit a = ', num2str(a)])

subplot(2, 3, 6);
plotSignal(n, yh);
ylabel('y_h')
title('Transienter Anteil')

function plotSignal(n, s)
    stem(n,s,'o--','filled')
    set(gca,'fontsize', 20) 
    xlabel('n')
end
