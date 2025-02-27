clear all; % Clear workspace (all variables)
close all; % Close all figures
clc; % Clear command line

% Používáme snake_case
% Block comment -> CTRL + R
% Block uncomment -> CTRL + T
% Dvojité procento %% na oddělování sekcí, vhodné pro krokování

A1 = [1 2 3 4 5]; % Začíná se řádky a poté sloupce, vždy v matlabu

A2 = [1, 2, 3, 4, 5]; % Hodnoty ve vektorech se oddělují čárkami nebo pouze mezerami

B1 = [1 2; 2 0; 3 0; 4 0; 5 0]; % Řádky oddělujeme středníky

%%
B2 = [B1 B1]; % Lze řetězit i matice (vložit matici do matice)
B3 = [B1; B1];

b4 = B3(2); % Matice kze indexovat
%%

B5 = B3(:); % operátor : vráti všechny prvky po sloupcích

C1 = 1:2:8;

% & a && není to samé; | a || není to samé -> Ištvánek říká ať si zjistíme rozdíl sami lol

G1 = [1 2 3];
G2 = [1 2 3];

% G3 = G1 * G2; % Matlab se snaží násobit maticově, což  v tomto případě nejde kvůli rozměrům matic

% pro násobení po prvcích používáme operátor .*

G4 = G1 .* G2

% Dělit se dá zleva ./ nebo zprava .\

% Násobení matice skalárem (napŕ. G1 * 5) vždy probíhá po prvcích, je však
% pro přehlednost dobré psát tečky, t.j. G1 .* 5

string1 = "ahoj";
string2 = "pepo";

string3 = string1 + string2

%% Kreslení grafů
x = linspace(0,4*pi);
y = sin(x);

figure(1)
plot(x, y)
figure(2)
stem(x, y, MArker="*", Color="r"

%% 3D graf
figure(3)
[x, y, z] = sphere;
surf(x, y, z)
hold on
surf(x+2, y, z)
hold on
[x, y, z] = cylinder;
surf(x+1, y, z*5)
hold on
[x, y, z] = sphere;
surf(x+1, y, z+5)
axis equal
xlabel("osa x")
ylabel("osa y")
zlabel("osa z")