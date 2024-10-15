% Function to create a (nSteps)x3 array representing an orbital path
% Claudio Vestini

% The orbit is a 3D circle with an inclination defined by angle beta.
% Cylindrical polar coordinates are used:
% x = rho * cos(phi)
% y = rho * sin(phi)
% z = function of orbital inclination (beta)

function orbit = createOrbit(orbitalRadius, phi, beta, nSteps)

    % Pre-allocate the array for better performance
    orbit = zeros(nSteps, 3);
    
    % Compute x-coordinates of the orbit using polar coordinates
    orbit(:,1) = orbitalRadius * cos(phi);
    
    % Compute y-coordinates of the orbit using polar coordinates
    orbit(:,2) = orbitalRadius * sin(phi);
    
    % Compute z-coordinates based on the orbital inclination angle beta
    % Using nested sin() for inclination effects
    theta = beta * sin(phi);  % Theta ranges from -beta to +beta
    orbit(:,3) = orbitalRadius * sin(theta);  % Apply sin(theta) for z-axis variation
end