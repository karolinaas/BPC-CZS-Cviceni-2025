function X = custom_DFT2(x)
    %CUSTOM_DFT Summary of this function goes here
    %   Detailed explanation goes here
    
    N = length(x);

    n = 0:N-1;
    k = 0:N-1;

    X = x * exp(-1i * 2 * pi * k' * n / N);
end