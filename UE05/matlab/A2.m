close all;

b = [1, 2, 0, 1];
a = [1, -3/4, 0, 1/4];

[b_min, a_min, b_all, a_all] = decomposeLTI(b, a);

%% Pole Zero Plots

figure;
subplot(2,3,1)
zAbsOverlay(b, a);
title('Gesamtsystem')
subplot(2,3,4)
zPhaseOverlay(b, a);
title('')

subplot(2,3,2)
zAbsOverlay(b_min, a_min);
title('Minimalphasensystem')
zlabel('|H_m(e^{j\Omega})|')
subplot(2,3,5)
zPhaseOverlay(b_min, a_min);
title('')
zlabel('\angle H_m(e^{j\Omega})')

subplot(2,3,3)
zAbsOverlay(b_all, a_all);
title('Allpasssystem')
zlabel('|H_a(e^{j\Omega})|')
subplot(2,3,6)
zPhaseOverlay(b_all, a_all);
title('')
zlabel('\angle H_a(e^{j\Omega})')

figure;
zAbsOverlay(a_min, b_min);
title('inverses Minimalphasensystem')
zlabel('|H_m(e^{j\Omega})|')

figure;
subplot(1,2,1)
myzplane(b, a)
title('Pol-Nullstellen Diagramm', 'Gesamtsystem')
subplot(1,2,2)
myzplane(a_min, b_min)
title('Pol-Nullstellen Diagramm', 'inverse Minimalphasensystem')

%% Spectrum

h = figure;
myfreqz(b, a);
title('Gesamtsystem')
set(h, 'WindowStyle', 'Docked');
hm = figure;
myfreqz(b_min, a_min);
title('Minimalphasensystem')
set(hm, 'WindowStyle', 'Docked');
ha = figure;
myfreqz(b_all, a_all);
title('Allpasssystem')
set(ha, 'WindowStyle', 'Docked');
