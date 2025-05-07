function [x, t] = gen_signal(N, fs, A, F, PHI)
    %GEN_SIGNAL Funkce pro generování harmonického signálu složeného z
    %libovolného množství cosinů
    %   Detailed explanation goes here

    arguments
        N % delka signálu ve vzorcích
        fs % vzorkovací frekvence
        A % vektor amplitud
        F % vektor frekvencí
        PHI % vektor počátečních fází
    end

    % Chech that input arguments are the same length
    if length(A) ~= length(F) || length(A) ~= length(PHI)
        error("Input arguments A, F and PHI must be the same length")
    end
    
    % inicializace časové zákaldy
    t = (0 : N - 1) / fs;

    % inicializace výstupbího vektoru x
    x = zeros(1, N);
    
    % generování výstupního signálu součtem všech cosinu
    for i = 1:length(A)
        x = x + A(i) * cos(2 * pi * F(i) * t + PHI(i));
    end 
end