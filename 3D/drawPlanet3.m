% Function to draw a 3D planet using a surface mesh
% Claudio Vestini

% Inputs:
% planet             - A (nFaces+1)x(nFaces+1)x3 array containing the x, y, z coordinates of the planet
% planetCenterOfMass - A 3x1 array specifying the planet's center of mass [X Y Z]
% planetColour       - A 1x3 array specifying the RGB color of the planet

% Output:
% planetPlot         - Handle to the surface plot object representing the planet

function planetPlot = drawPlanet3(planet, planetCenterOfMass, planetColour)

    % Shift the planet's coordinates based on its center of mass
    X = planetCenterOfMass(1) + planet(:,:,1);  % X-coordinates
    Y = planetCenterOfMass(2) + planet(:,:,2);  % Y-coordinates
    Z = planetCenterOfMass(3) + planet(:,:,3);  % Z-coordinates

    % Plot the planet using a surface plot with the specified color
    planetPlot = surf(X, Y, Z, 'FaceColor', planetColour, ...
                      'LineStyle', 'none', 'EdgeAlpha', 0);  % No edges, fully opaque surface
    
end