function [t, y] = am(duration, fs, fc, f_mod, m, gain, type, num_harmonics)
    %AM Generate sinusoidal signal
    %   This function takes signal duration, amplitude, initial phase,
    %   sample rate and signal frequency to generate a sinusoidal signal.
    %   Returns signal timescale and sample data.
    %
    %   For more information, see <a href="matlab: 
    %   web('https://karolinaas.github.io/FEKT-notes/BPC-CZS/Dokumentace/#calculate_sqnr')">the online documentation</a>.
    %
    %   See also QUANTIZE_SIGNAL, CALCULATE_SQNR.

    % duration - délka signálu
    % fs - vzorkovací kmitočet
    % fc - kmitočet nosné
    % f_mod - kmitočet modulačního signálu
    % m - modulační index
    % type - to samé jako na oscilátoru + sinus

    arguments
        duration (1, 1) double {mustBePositive}
        fs (1, 1) double {mustBePositive}
        fc (1, 1) double {mustBePositive}
        f_mod (1, 1) double {mustBePositive}
        m (1, 1) double {mustBeInRange(m, 0, 1)}
        gain (1, 1) double {mustBeInRange(gain, 0, 1)} = 0.25
        type {mustBeMember(type,{'sine','square','triangle','sawtooth'})} = 'sine'
        num_harmonics (1, 1) {mustBeInteger, mustBePositive} = 1
    end
    
    [t, y_c] = generate_sine(duration, 1, pi / 2, fs, fc); % počáteční fáze pi/2 nám z nosné vytvoří kosinus

    if type == "sine"
        [~, y_mod] = generate_sine(duration, 1, pi / 2, fs, f_mod);
    else
        [~, y_mod] = oscillator(duration, fs, f_mod, num_harmonics, 1, type); 
    end
    
    y = (y_c / (1 + m)) .* (1 + m * y_mod) .* gain;
end