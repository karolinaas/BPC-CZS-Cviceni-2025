function [t, y] = generate_sine(duration, A, phi, fs, f)
    %GENERATE_SINE Generate sinusoidal signal
    %   This function takes signal duration, amplitude, initial phase,
    %   sample rate and signal frequency to generate a sinusoidal signal.
    %   Returns signal timescale and sample data.
    %
    %   For more information, see <a href="matlab: 
    %   web('https://karolinaas.github.io/FEKT-notes/BPC-CZS/Dokumentace/#calculate_sqnr')">the online documentation</a>.
    %
    %   See also QUANTIZE_SIGNAL, CALCULATE_SQNR.

    t = (0:(fs * duration) - 1) / fs;
    y = A * sin(2 * pi * f * t + phi);
end