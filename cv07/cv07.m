clc;
clear all;
close all;

N = 1024; % pocet vzorků (délka signálu)
fs = 2048; %vzorkovací kmitočet
f_axis = (-N / 2:N / 2 - 1) * (fs / N);

a1 = 1;
a2 = 0.5;
f1 = 20;
f2 = 50;
phi1 = 0;
phi2 = 0;

[x, t] = gen_signal(N, fs, [a1, a2], [f1, f2], [phi1, phi2]);

tic;
X_dft = custom_DFT(x);
end_time = toc;

fprintf("DFT: %0.7f\n", end_time);

tic;
X_dft2 = custom_DFT2(x);
end_time = toc;

fprintf("DFT2: %0.7f\n", end_time);

tic;
X_builtin = fft(x);
end_time = toc;

fprintf("FFT: %0.7f\n", end_time);

% preprocessing spekter
X_dft = X_dft / length(X_dft);
X_dft2 = X_dft2 / length(X_dft2);
X_builtin = X_builtin / length(X_builtin);

% Jednostranné spektrum
figure(1);

subplot(3, 1, 1);
stem(abs(X_dft), "filled");
title("Modulové spektrum, custom\_DFT");
xlabel("f [Hz]");
ylabel("|X(k)|");

subplot(3, 1, 2);
stem(abs(X_dft2), "filled");
title("Modulové spektrum, custom\_DFT2");
xlabel("f [Hz]");
ylabel("|X(k)|");

subplot(3, 1, 3);
stem(abs(X_builtin), "filled");
title("Modulové spektrum, builtin FFT");
xlabel("f [Hz]");
ylabel("|X(k)|");

% Dvoustranné spektrum
figure(2);

subplot(3, 1, 1);
stem(f_axis, abs(fftshift(X_dft)), "filled");
title("Modulové spektrum, custom\_DFT");
xlabel("f [Hz]");
ylabel("|X(k)|");

subplot(3, 1, 2);
stem(f_axis, abs(fftshift(X_dft2)), "filled");
title("Modulové spektrum, custom\_DFT2");
xlabel("f [Hz]");
ylabel("|X(k)|");

subplot(3, 1, 3);
stem(f_axis, abs(fftshift(X_builtin)), "filled");
title("Modulové spektrum, builtin FFT");
xlabel("f [Hz]");
ylabel("|X(k)|");