function [sample_rate, duration] = load_music(path_to_wave_file)
    %LOAD_MUSIC Get sample rate and duration of audio file
    %   This function takes path to audio file and return its sample rate
    %   and duration in seconds. It then also plots the waveform of the
    %   file.
    %
    %   For more information, see <a href="matlab: 
    %   web('https://karolinaas.github.io/FEKT-notes/BPC-CZS/Dokumentace/#load_music')">the online documentation</a>.
    %
    %   See also ADD_ZEROS.
    
    % Check if input argument is a string, otherwise throw an error.
    if ~isstring(path_to_wave_file)
        error("Input argument must be a string!")
    end
    
    %% Read the audio file. 
    % Get the sampled data and sample rate of the loaded file.
    [sampled_data,sample_rate] = audioread(path_to_wave_file);

    %% Calculate duration of the audio file
    % First get the number of samples (number of rows) of the audio file.
    % Then divide this number by sample rate to get the duration of the
    % file in seconds.
    num_of_samples = size(sampled_data, 1);
    duration = num_of_samples / sample_rate;

    %% Plot waveform
    % First get time indexes of each sample by creating a row vector the
    % size of the number of samples and dividing it by the sample rate.
    % Then plot the sampled data as a function of time.
    time = (0:num_of_samples - 1) / sample_rate;

    figure(1);
    plot(time, sampled_data);

    title("Audio file waveform");
    xlabel("$t$ [s]", "Interpreter","latex");
    ylabel("$s(t)$ [-]", "Interpreter","latex");
end