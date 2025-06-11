n = linspace(0,40,41);

%% Stabil

a = 0.9;
yp = 3*(-1).^(n) / (1+a);
yh = 3*a.^(n+1) / (1+a);
y = yh + yp;

subplot(2,3,1);
plotSignal(yp, n)
title('Stationärer Anteil')
ylabel('y_p')

subplot(2,3,2)
plotSignal(y, n)
title(['Stabil mit a = ' num2str(a)])
ylabel('y')

subplot(2,3,3)
plotSignal(yh, n)
title('Transienter Anteil')
ylabel('y_h')

%% Instabil

a = 1.05;
yp = 3*(-1).^(n) / (1+a);
yh = 3*a.^(n+1) / (1+a);
y = yh + yp;

subplot(2,3,4);
plotSignal(yp, n)
title('Stationärer Anteil')
ylabel('y_p')
ylim([-2 2])

subplot(2,3,5)
plotSignal(y, n)
ylabel('y')
title(['Instabil mit a = ' num2str(a)])

subplot(2,3,6)
plotSignal(yh, n)
title('Transienter Anteil')
ylabel('y_h')

function plotSignal(y, n)
    stem(n, y, 'o--', 'filled', 'LineWidth', 1)
    xlabel('n')
    set(gca,'fontsize', 20) 
end