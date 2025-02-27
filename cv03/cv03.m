clc % smaže konzoli
close all % zavře všechny grafy
clear all % smaže všechny proměnné

duration = 1; % trvání
A = 1; % amplituda
phi = 0; % počáteční fáze
fs = 100; % vzorkovací kmitočet
f = 10; % kmitočet signálu

fs_continuous  = 192000; % jmenuje se continuous, ale je to lež, není to spojitý signál

[t_continuous, y_continuous] = generate_sine(duration, A, phi, ...
    fs_continuous, f);

[t_discrete, y_discrete] = generate_sine(duration, A, phi, ...
    fs, f);

figure(1);
plot(t_continuous, y_continuous);
hold on;
scatter(t_discrete, y_discrete, "white")
hold on;
stairs(t_discrete, y_discrete);
hold off;
title("Spojitý a diskrétní signál");
xlabel("Čas [s]");
ylabel("Velikost signálu [-]");
legend(["Spojitý signál", "Vzorky", "Diskrétní signál"], ...
    location="southeast");
xlim([0, 1]);
ylim([-1, 1]);
grid on;