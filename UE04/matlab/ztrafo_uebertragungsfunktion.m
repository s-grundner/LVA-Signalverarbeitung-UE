clear all; close all; clc;
%% Z-Ebene definiern

imag_int = -1:0.01:1; %Bereich der imaginären Achse 
real_int = -1:0.01:1; %Bereich der realen Achse 

%% Datenmatrizen initieren

H_abs = []; %leere Matrix 

%%

for imag_c = imag_int
    z = real_int + imag_c*i;
    H_c = (1/3*z.^2 - 1/8*z)./(1/6*z + 1/4 + z.^2);
    H_abs(:, end+1) = abs(H_c); 
end
%%

figure;
surf(imag_int,real_int,H_abs);
xlabel("Imag")
ylabel("Real")
zlabel("H_abs")
zlim([0 1])

%%
figure;
contour(imag_int,real_int,H_abs)
xlabel("Imag")
ylabel("Real")
zlabel("H_abs")

%
figure;
cutoff = 1.5;
H_abs_cut = H_abs;
H_abs_cut(H_abs_cut>cutoff) = cutoff;
contour(imag_int,real_int,H_abs_cut)
xlabel("Imag")
ylabel("Real")
zlabel("H_abs")

%% DTFT

w = -pi:0.1:pi; 
z = exp(i*w)
H_dtft = (1/3*z.^2 - 1/8*z)./(1/6*z + 1/4 + z.^2);
figure; 
xlabel("\omega")
ylabel("Real")
plot(w, H_dtft) 





