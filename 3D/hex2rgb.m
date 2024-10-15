% Function to convert a hexadecimal color value to a MATLAB RGB triplet
% Claudio Vestini

% Input:
% hexString - A string representing the hex color value (e.g., '#FFFFFF' or 'FFFFFF')

% Output:
% rgb       - A 1x3 array representing the RGB triplet (values between 0 and 1)

function rgb = hex2rgb(hexString)

    % Check if the input hex string is in the format '#RRGGBB' (7 characters)
    if size(hexString, 2) == 7
        r = double(hex2dec(hexString(2:3))) / 255;
        g = double(hex2dec(hexString(4:5))) / 255;
        b = double(hex2dec(hexString(6:7))) / 255;
        rgb = [r, g, b];
    
    % Check if the input hex string is in the format 'RRGGBB' (6 characters)
    elseif size(hexString, 2) == 6
        r = double(hex2dec(hexString(1:2))) / 255;
        g = double(hex2dec(hexString(3:4))) / 255;
        b = double(hex2dec(hexString(5:6))) / 255;
        rgb = [r, g, b];
    
    % Throw an error if the input is not valid
    else
        error('Invalid input: hexString must be 6 or 7 characters long.');
    end

end