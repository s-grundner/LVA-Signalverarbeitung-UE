clc;
evalFFTvsDFT(1024)

function evalFFTvsDFT(N)
    xInit = randn(1,N,"like",1i);

    % --- DFT ---
    tic;
    xDFT = myDFT(xInit);
    xIDFT = myIDFT(xDFT);
    tDFT = toc;

    % --- FFT ---
    tic;
    xFFT = fft(xInit);
    xIFFT = ifft(xFFT);
    tFFT = toc;

    % --- Errors ---
    errFFT = rms(xInit - xIFFT);
    errDFT = rms(xInit - xIDFT);
    errFT = rms(xFFT - xDFT);
    errIFT = rms(xIFFT - xIDFT);

    disp("Results:");
    fprintf("DFT: t=%f, err=%.2e\n", tDFT, errDFT);
    fprintf("FFT: t=%f, err=%.2e\n", tFFT, errFFT);

    fprintf("Forward FT: err=%.2e\n", errFT);
    fprintf("Inverse FT: err=%.2e\n", errIFT);
end

function X = myDFT(x)
    N = length(x);
    X = zeros(1, N);
    for k=0:N-1
        for n=0:N-1
            X(k+1) = X(k+1) + x(n+1) * W(N)^(k*n);
        end
    end
end

function x = myIDFT(X)
    N = length(X);
    x = zeros(1, N);
    for n=0:N-1
        for k=0:N-1
            x(n+1) = x(n+1) + X(k+1) * W(N)^(-k*n);
        end
    end
    x = x./N;
end

% Twiddle Factor
function w = W(N)
    w = exp(-1i*2*pi/N);
end

