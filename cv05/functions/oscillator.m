function [t, y] = oscillator(duration, fs, f, num_harmonics, gain, type, phi)
    %OSCILLATOR Generate sinusoidal signal
    %   This function takes signal duration, amplitude, initial phase,
    %   sample rate and signal frequency to generate a sinusoidal signal.
    %   Returns signal timescale and sample data.
    %
    %   For more information, see <a href="matlab: 
    %   web('https://karolinaas.github.io/FEKT-notes/BPC-CZS/Dokumentace/#calculate_sqnr')">the online documentation</a>.
    %
    %   See also QUANTIZE_SIGNAL, CALCULATE_SQNR.

    % duration - abychom mohli generovat signál s různou délkou
    % fs - vzorkovací kmitočet
    % f - základní kmitočet signálu
    % num_harmonics - kolik kmitočtových složek se má sečíst
    % gain - určuje výslednou hlasitost/ zesílení toho signálu pro
    % přehrávání aby to nebylo příliš hlasité
    % type - který ze třech průběhu se zvolí a vygeneruje

    arguments
        duration (1, 1) double {mustBePositive}
        fs (1, 1) double {mustBePositive}
        f (1, 1) double {mustBePositive}
        num_harmonics (1, 1) {mustBeInteger, mustBePositive} = 1
        gain (1, 1) double {mustBeInRange(gain, 0, 1)} = 0.25
        type {mustBeMember(type,{'square','triangle','sawtooth'})} = 'sawtooth'
        phi (1, 1) double = 0
    end
    
    % Declare an array of zeros with the lenght depending on the duration
    % and the sample rate of the signal
    y = zeros(1, fs * duration);

    switch type
        case "sawtooth"
            for k = 1:num_harmonics
                A = (-1)^k / k;
                harm_freq = f * k;
                [t, y_harm] = generate_sine(duration, A, phi, fs, harm_freq);
                y = y + y_harm;
            end

            y = -(2 / pi) * y * gain;

        case "triangle"
            for k = 1:num_harmonics
                A = (-1)^k / (2 * k - 1)^2;
                harm_freq = f * (2 * k - 1);
                [t, y_harm] = generate_sine(duration, A, phi, fs, harm_freq);
                y = y + y_harm;
            end

            y = -(8 / pi^2) * y * gain;

        case "square"
            for k = 1:num_harmonics
                A = 1 / (2 * k - 1);
                harm_freq = f * (2 * k - 1);
                [t, y_harm] = generate_sine(duration, A, phi, fs, harm_freq);
                y = y + y_harm;
            end

            y = (4 / pi) * y * gain;

    end
end