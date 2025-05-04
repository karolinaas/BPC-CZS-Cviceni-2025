function [t, y] = fm(duration, fs, fc, f_mod, f_dev, gain)
    %FM Summary of this function goes here
    %   Detailed explanation goes here
    %
    % Argumenty
    %   duration - test
    %   sdf - safddsa

    t = (0:(fs * duration) - 1) / fs;

    % modulační index
    m = f_dev / f_mod;

    y = gain * cos((2 * pi * fc * t) + m * sin(2 * pi * f_mod * t));
end