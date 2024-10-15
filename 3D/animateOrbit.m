% Function to animate the plot of a planet's orbit trail
% Claudio Vestini

% Inputs:
% CoM_pol      - A 1x3 array containing [phi, R, z] in polar coordinates (center of mass in polar coordinates)
% trailColour  - A 1x3 array specifying the RGB values of the trail colour ([R G B])
% alpha        - The angle subtended by the trail (in radians)
% beta         - Orbital inclination angle (in radians)
% nSteps       - Number of steps in the orbit (resolution of the trail)

% Output:
% trailPlot    - Handle to the plot object representing the orbit trail

function trailPlot = animateOrbit(CoM_pol, trailColour, alpha, beta, nSteps)

    % Compute the number of points (k) in the trail based on the angle alpha
    k = round((alpha / (2 * pi)) * nSteps);
    
    % Extract orbital radius and current angle (phi1) from CoM_pol
    R = CoM_pol(2);    % Orbital radius
    phi1 = CoM_pol(1); % Final angle of the trail
    
    % Calculate the start angle of the trail (phi0)
    phi0 = phi1 - alpha;
    
    % Generate a vector of angles (gamma) for the trail, from phi0 to phi1
    gamma = linspace(phi0, phi1, k);
    
    % Create the trail as a kx3 array of coordinates using the createOrbit function
    trail = createOrbit(R, gamma, beta, k);
    
    % Plot the trail in 3D and return the plot handle
    trailPlot = plot3(trail(:,1), trail(:,2), trail(:,3), ...
                      'Color', trailColour, 'LineWidth', 1.8);
end