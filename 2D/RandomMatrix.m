% This function generates an n x m matrix of random numbers
% The nth row will hold in its 10 columns the same random number
% (so only different rows have different numbers)
% Claudio Vestini

% I wrote this function such that each generated background of stars
% is unique (there are n*n = n^2 possible backgrounds),
% but the background does not have to be generated at each iteration
% of drawing the new planet frames (e.g. there is one background 
% for every instance the "Run" button is pressed)
% My value for axisDimension will be 500

function matrix = RandomMatrix(n, m, axisDimensions)
    % Preallocate array in computer memory
    matrix = zeros(n, m);
    
    % Generate matrix
    for i = 1:n
        % This line generates a random number in range [-axisDimensions, axisDimensions]
        num = axisDimensions * (2 * (rand() - 1/2)); 
        matrix(i, :) = num(1);
    end
end