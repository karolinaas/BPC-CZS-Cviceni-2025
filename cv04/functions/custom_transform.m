function [output_vector] = custom_transform(input_vector, transform)
    %CUSTOM_TRANSFORM Transform vector using selected parameter
    %   This function takes an input vector and applies a transform
    %   specified by the transform parameter to it.
    % 
    %   Available transforms (transform param) are:
    %       "multiply", "addition", "square", "add_zero"
    %
    %   input_vector must be a row vector.
    %
    %   For more information, see <a href="matlab: 
    %   web('https://karolinaas.github.io/FEKT-notes/BPC-CZS/Dokumentace/#custom_transform')">the online documentation</a>.

    % Check množství argumentů při voláni funkce
    if nargin ~= 2
        error("Špatné množství argumentů, mají být 2");
    end

    % Check zda je input_vector řádkovým vektorem
    if ~isrow(input_vector)
        error("Argument musí být řádkový vektor!");
    end 

    % Aplikace transformace dle výběru uživatele
    switch transform
        case "multiply"
            % y[n] = 2*x[n]
            output_vector = input_vector .* 2;
        case "addition"
            % y[n] = x[n] + 1
            output_vector = input_vector + 1;
        case "square"
            % y[n] = x[n]^2
            output_vector = input_vector .^ 2;
        case "add_zero"
            % y[n] = x{1:end, 0}
            input_vector(length(input_vector) + 1) = 0;
            output_vector = input_vector;
        otherwise
            error("Neznámy argument (transform)!");
    end

end