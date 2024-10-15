% Function to create the shape of planets (circles) in a [x,y] x 50 array
% Claudio Vestini

% This function generates a circular shape representing a planet, based on 
% a specified size and position using 50 theta values for smoothness.
% The output 'planet' is a 2x50 array containing the x and y coordinates.

function planet = createPlanet(planetSize, position)

    % Define 50 theta values between 0 and 2*pi
    theta = linspace(0, 2*pi, 50);
    
    % Compute x and y coordinates of the planet (circle)
    % x-coordinates: planetSize*cos(theta) + x-position
    % y-coordinates: planetSize*sin(theta)
    planet = [planetSize * cos(theta) + position;  % X-values
              planetSize * sin(theta)];            % Y-values
end