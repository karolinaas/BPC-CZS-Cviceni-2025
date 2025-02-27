clc % Vymazání konzole
clear all % Vymazání všech proměnných

A = zeros(3, 3); % matice s rozmerem 3x3

for i = 1:length(A)
    A(i, i) = i;
    disp(i);
end