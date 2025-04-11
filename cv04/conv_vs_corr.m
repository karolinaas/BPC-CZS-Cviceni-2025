%% Příklad porovnání konvoluce a korelace sinusového signálu a bílého šumu

clc;
clear all;
close all;

% parametry signálu
fs = 1000;
t = 0:1/fs:1;
f = 5;
A = 1;

% generování sin
sinusoidal_signal = A * sin(2 * pi * f * t);

% generování bílého šumu
white_noise = randn(size(t));

% konvoluce
conv_result = conv(sinusoidal_signal, white_noise);

% normalizovaná korelace
corr_result = xcorr(sinusoidal_signal, white_noise, 'coeff');

% časové průběhy
conv_time = linspace(min(t), max(t), length(conv_result));
corr_time = linspace(-max(t), max(t), length(corr_result));

% graf sinusového signálu
figure(1);
subplot(3, 2, 1);
plot(t, sinusoidal_signal);
title("Sinusový signál");
xlabel("t [s]");
ylabel("s(t)");

% graf bílého šumu
subplot(3, 2, 2);
plot(t, white_noise);
title("Bílý šum");
xlabel("t [s]");
ylabel("s(t)");

% graf konvoluce
subplot(3, 2, 3);
plot(conv_time, conv_result);
title("Výsledek konvoluce");
xlabel("t [s]");
ylabel("s(t)");

% graf korelace
subplot(3, 2, 4);
plot(corr_time, corr_result);
title("Výsledek korelace");
xlabel("lag [s]");
ylabel("corr");

% overlay obou signálů
subplot(3, 2, 5);
plot(t, sinusoidal_signal);
hold on;
plot(t, white_noise);
hold off;
title("Oba signály");
xlabel("t [s]");
ylabel("s(t)")
legend("sin", "noise", "Location", "northeast");


% overlay konvoluce a korelace
subplot(3, 2, 6);
plot(conv_time, conv_result);
hold on;
plot(corr_time, corr_result);
hold off;
title("Konvoluce vs. Korelace");
xlabel("t / lag [s]");
ylabel("corr a conv");
legend("conv", "corr", "Location","northeast");
legend.FontSize = 5;