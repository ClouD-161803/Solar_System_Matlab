% Function to compute the [X, Y, Z] coordinates of the Center of Mass (CoM) of a planet
% Claudio Vestini

% Inputs:
% orbitalRadius    - Radius of the planet's orbit
% phi              - Azimuthal angle (varies linearly for all planets)
% beta             - Orbital inclination angle in radians
% orbitalVelocity  - Velocity of the planet in its orbit

% Output:
% CoM              - A 1x3 array containing the X, Y, Z coordinates of the planet's Center of Mass

function CoM = getCenter(orbitalRadius, phi, beta, orbitalVelocity)

    % Adjust the azimuthal angle phi based on the planet's orbital velocity
    deltaphi = orbitalVelocity * phi;
    
    % Adjust the inclination angle based on beta and the orbital velocity
    deltatheta = beta * sin(phi * orbitalVelocity);
    
    % Compute the Center of Mass (CoM) using cylindrical polar coordinates
    CoM = orbitalRadius * [cos(deltaphi), sin(deltaphi), sin(deltatheta)];
    
end