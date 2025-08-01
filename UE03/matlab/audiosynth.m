% Audio signal prelude by Marc-Antoine Charpentier (1634-1704)

clear all
close all

set(gca,'fontsize', 28) 

% pitch in Hz
A = 220;
Dhigh = A*2^(5/12); % high
C   = A*2^(3/12);
B   = A*2^(2/12);
G   = A*2^(-2/12);
Fis = A*2^(-3/12);
E   = A*2^(-5/12);
D   = A*2^(-7/12);
pitch = [D G G A B G Dhigh B B C Dhigh C B C Dhigh A G A B A];

% duration of the individual tones
duration = [1/4 1/4 1/8 1/8 1/4 1/4 1/2 3/8 1/8 1/4 ...
    1/8 1/8 1/8 1/8 1/4 1/8 1/8 1/8 1/8 1/4];

% parameters and generation of the audio signal
T = 2;                          % duration of a whole tone
fs = 8000;                      % sampling frequency
Ts = 1/fs;                      % sampling time
music = [];                     % define variable for audio signal

nHarmonics = 12;

for k=1:length(pitch)           % for loop
    L = T/Ts*duration(k);         % number of samples per tone
    n = 0:L-1;                    % normalized time
    Omega = 2*pi*pitch(k)/fs;     % normalized radian frequency

    s = 0;
    for i = 1:nHarmonics
        s = 1/i * sin(i*Omega*n) + s; % tone
    end

    sAdsr = adsr_profile(s);
    music = [music sAdsr];        % concatenated audio signal

    % determine time section of current pitch in music signal
    len = length(music); 
    tSegment = len-L+1:len;

    % Plot Signals
    c = colorSignal(pitch, k);    % color Signal according to pitch
    hold on
    plot(tSegment, sAdsr, 'Color', c);
end

% pc sound card output
% soundsc(music,fs,16);
% audiowrite("Aufgabe4.wav", music, fs);

% Linearly interpolate between min and max frequency in pitch list p
function c = colorSignal(p, k)
    cmap = colormap("jet");
    c = 255*(1 - (p(k)-min(p))/(max(p)-min(p))) + 1;
    c = cmap(round(c),:);
end
