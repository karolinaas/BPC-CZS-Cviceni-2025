function [output_row_vector] = add_zeros(input_row_vector, num_of_zeros)
    %ADD_ZEROS Pad row vector with zeros
    %   This function takes a row vector and a number of zeros for the
    %   vector to be padded with. Returns a vector padded with zeros.
    %
    %   For more information, see <a href="matlab: 
    %   web('https://karolinaas.github.io/FEKT-notes/BPC-CZS/Dokumentace/#add_zeros')">the online documentation</a>.
    %
    %   See also LOAD_MUSIC.

    % Check if the first argument is a row vector, otherwise throw an
    % error.
    if ~isrow(input_row_vector)
	    error("First argument must be a row vector!")
    end

    % Check if the second argument is a scalar value. Then check if it is
    % an integer (actual data type is double, check is done by rounding the
    % value and comparing it with itself). Then check that the value is
    % greater than zero. Throw an error if any of the checks fails.
    if ~isscalar(num_of_zeros)
        error("Second argument must be a scalar value!")
    elseif num_of_zeros ~= round(num_of_zeros) 
        error("Second argument must be a natural number!")
    elseif num_of_zeros <= 0
        error("Second argument must be greater than 0!")
    end

    % Allocate output vector. First get the size of the input vector. Then
    % caculate the expected size of the output vector. Allocate the output
    % vector to zeros.
    input_num_of_cols = size(input_row_vector, 2); % Get input vector size
    output_num_of_cols = input_num_of_cols * num_of_zeros + ...
        input_num_of_cols;
    output_row_vector = zeros(1, output_num_of_cols);
    
    % Loop through the lenght of the input vector. Write input vector
    % values to appropriate coords in output row vector.
    for i = 1:input_num_of_cols
        output_row_vector(i + num_of_zeros * (i - 1)) = ...
            input_row_vector(i);
    end