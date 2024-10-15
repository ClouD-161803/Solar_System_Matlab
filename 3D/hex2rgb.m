% Function to Convert Hexadecimal color values to MatLab RGB triplets
% Claudio Vestini

function rgb = hex2rgb(hexString)
    if size(hexString,2) == 7
		r = double(hex2dec(hexString(2:3)))/255;
		g = double(hex2dec(hexString(4:5)))/255;
		b = double(hex2dec(hexString(6:7)))/255;
		rgb = [r, g, b];
    elseif size(hexString,2) == 6
		r = double(hex2dec(hexString(1:2)))/255;
		g = double(hex2dec(hexString(3:4)))/255;
		b = double(hex2dec(hexString(5:6)))/255;
		rgb = [r, g, b];
    else
		error('invalid input');
    end
end