function [y_quantized, quant_levels] = quantize_signal(x, B, quant_type)
    L = 2^B;
    A = 1;
    delta = 2 * A / L;

    switch quant_type
        case "mid_rise"
            quant_levels = -A + delta / 2 + (0 : (L - 1)) * delta;
        case "mid_thread"
            quant_levels = -A + (0 : (L - 1)) * delta;
    end

    mid_points = (quant_levels(1 : end - 1) + quant_levels(2 : end)) / 2;
    y_quantized = quant_levels(discretize(x, []))
end