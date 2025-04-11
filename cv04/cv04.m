% Cvičení 04
% Linearita, časová invariance, kauzalita, stabilita

%% Linearita
% Superpozice

clc
clear all
close all

% Definice x[n]
x1 = [1 2 3];
x2 = [2 4 6];

% Definice konstant
a = 2;
b = 3;

c = 4;

% První případ
x_cobined = c*(a*x1 + b*x2);

% Druhý případ
% Definice výstupu y1[n] a y2[n] a funkce c
y1 = c*x1; % transformace c provedena na první části výstupu (y1[n])
y2 = c*x2; % transformace c provedena na druhé části výstupu (y2[n])

y_combined = a*y1 + b*y2; % sečteme části y1[n] a y2[n]

if x_cobined == y_combined
    fprintf("Systém je lineární");
else
    fprintf("Systém není lineární");
end

%%
clc;
clear all;
close all;

% Definice x1[n] a x2[n]
x1 = [1 2 3];
x2 = [2 4 6];

% Definice konstant
a = 2;
b = 3;

% Volba transformace
transform = "add_zero";

% Definice výstupu systému y1[n] a y2[n]
y1 = custom_transform(x1, transform);
y2 = custom_transform(x2, transform);

y_combined = a * y1 + b * y2; % pak sečteme části y1[n] a y2[n]
x_cobined = custom_transform(a * x1 + b * x2, transform);

if x_cobined == y_combined
    fprintf("Systém je lineární");
else
    fprintf("Systém není lineární");
end

%% Časová invariance

clc;
clear all;
close all;

% Definice vstupního signálu
x = [1 2 3 4];
n0 = 3; % Veliksot posunutí v čase (vzorcích);
transform = "add_zero";

y_transformed = custom_transform(x, transform);
y_transformed_shifted = circshift(y_transformed, n0);

x_shifted = circshift(x, n0);
x_shifted_transformed = custom_transform(x_shifted, transform);

% Porovnávání
if x_shifted_transformed == y_transformed_shifted
    fprintf("Systém je časově invariantní");
else
    fprintf("Systém není časově invariantní");
end

%% Kauzalita

clc;
clear all;
close all;

x = [1 2 3 4];

% Příklad systému: y[n] = x[n+1]
y_nonc = circshift(x, -1);

%% Stabilita

clc;
clear all;
close all;

x = ones(1, 10);

% Stabilní systém y[n] = 0.5 * x[n]
y1 = 0.5 * x;

% Nestabilní systém
n = 0:length(x) - 1;
y2 = n .* x;

%% Lineární diskrétní konvoluce

clc;
clear all;
close all;

x = [1 2 3 4];
h = [1 -1 1];

y = conv(x, h)

%% Korelace

clc;
clear all;
close all;

x = [2 4 5];
g = [3 2 7];

y = xcorr(x, g)

