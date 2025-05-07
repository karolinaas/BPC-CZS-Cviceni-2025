function X = custom_DFT(x)
    %CUSTOM_DFT Summary of this function goes here
    %   Detailed explanation goes here
    
    N = length(x);
    X = zeros(1, N);

    for k = 0:N-1
        for n = 0:N-1
            X(k + 1) = X(k + 1) + x(n + 1) * exp(2 * pi * -1i * k * n / N);
        end
    end
end