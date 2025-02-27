function [t, y] = generate_sine(duration, A, phi, fs, f)
    t = (0 : (fs * duration) - 1) / fs;
    y = A * sin(2 * pi * f * t + phi);
end