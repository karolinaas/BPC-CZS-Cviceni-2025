function [y_quantized, quant_levels] = quantize_signal(x, B, quant_type)
    %QUANTIZE_SIGNAL Quantize a signal
    %   This function takes a signal to be quantized, bit depth and
    %   quantization type to be used and returns quantized signal together
    %   with quantization levels.
    %
    %   For more information, see <a href="matlab: 
    %   web('https://karolinaas.github.io/FEKT-notes/BPC-CZS/Dokumentace/#quantize_signal')">the online documentation</a>.
    %
    %   See also GENERATE_SINE.
    
    % Calculate number of quantization levels
    L = 2 ^ B;
    % Maximum amplitude of input signal
    A = 1;
    % Calculate quantization step size
    delta = 2 * A / L;

    % Calculate quantization levels according to the selected type of
    % quantization
    switch quant_type
        case "mid_rise"
            quant_levels = -A + delta / 2 + (0 : (L - 1)) * delta;
        case "mid_tread"
            quant_levels = -A + (0 : (L - 1)) * delta;
    end

    % Calculate mid points between quantization levels
    mid_points = (quant_levels(1 : end - 1) + quant_levels(2 : end)) / 2;
    % Select quantization level for each sample
    y_quantized = quant_levels(discretize(x, [-inf, mid_points, inf]));
end