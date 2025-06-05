close all
r = [1/2, -3/5];
p = [-1/2, 1/5];
k = 1.2;

[b, a] = residuez(r, p, k);
[b_min, a_min, b_all, a_all] = decomposeLTI(b, a);

b_csc = conv(b, a_min);
a_csc = conv(a, b_min);

figure;
impz(b, a, 50);

figure;
impz(a_min, b_min, 50);

figure;
impz(b_csc, a_csc, 50);
