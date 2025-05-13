clear all;

%% Angabe
N = 128;   %Signallänge
n = 0:N-1; %Signalsamples
w1 = 2*pi*0.1; %Frequenz der ersten Schwingung
w2 = 2*pi*0.15;  %Frequenz der zweiten Schwingung
x = cos(w1*n) + cos(w2*n); %Summe der Signale

%% Rechteck gefenstertes Signal
spectrum = fft(x); %Komplexes Spektrum
magSpectsum = abs(spectrum); %Betragsspektrum

%% Hamming Fensterung
w = hamming(N).'; %Erstelle Hamming-Fenster Funktion
xHamming = w.*x; %Führe Hamming- Fensterung durch

spectrumHamming = fft(xHamming); %Komplexes Spektrum vom Hamming-gefensterten Zeitsignal
magSpectsumHamming = abs(spectrumHamming); %Betragsspektrum vom Hamming-gefensterten Zeitsignal

%% "Herumspielen" für exaktes Ergebnis im Spektrum
w1_exact = 2*pi*1/N; %Frequenz der ersten Schwingung
w2_exact = 2*pi*2/N;  %Frequenz der zweiten Schwingung
x_exact = cos(w1_exact*n) + cos(w2_exact*n); %Summe der Signale

exactMagSpectrum = abs(fft(x_exact));

%% Stelle Ergebnisse dar
f = (0:N-1)/N; %Erzeugung der Frequenzachse für Spektrum-Plots

figure(1)
subplot(3,2,1)
stem(x)
xlabel("Samples/n")
ylabel("Amplitude")
title("Zeitsignal")
grid on;

subplot(3,2,2)
stem(f,magSpectsum)
xlabel("frequency bin")
ylabel("Amplitude")
title("Betragsspektrum mit Rechteck")
grid on;

subplot(3,2,3)
stem(xHamming)
xlabel("Samples/n")
ylabel("Amplitude")
title("Gefenstertes Zeitsignal")
grid on;

subplot(3,2,4)
stem(f,magSpectsumHamming)
xlabel("frequency bin")
ylabel("Amplitude")
title("Betragsspektrum mit Hamming")
grid on;

subplot(3,2,5)
stem(w);
xlabel("Samples/n")
ylabel("Amplitude")
title("Hamming - Fensterfunktion")
grid on;

subplot(3,2,6)
stem(f,exactMagSpectrum)
xlabel("frequency bin")
ylabel("Amplitude")
title("Betragsspektrum mit ganzzahligen Frequenzanteilen")
grid on;