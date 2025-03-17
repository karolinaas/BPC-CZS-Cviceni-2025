function [sqnr] = calculate_sqnr(signal, noise)
    %CALCULATE_SQNR Calculate Signal to Quantization Noise Ratio
    %   This function takes a signal and quantization noise signal. It then
    %   calculates and returns Signal to Quantization Noise Ratio (SQNR) in
    %   decibels (dB).
    %
    %   For more information, see <a href="matlab: 
    %   web('https://karolinaas.github.io/FEKT-notes/BPC-CZS/Dokumentace/#calculate_sqnr')">the online documentation</a>.
    %
    %   See also GENERATE_SINE, QUANTIZE_SIGNAL.

    sqnr = 10 * log10(mean(signal.^2) / mean(noise.^2));
end