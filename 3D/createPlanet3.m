% Function to create the shape of a planet (sphere) in a (nFaces+1)x(nFaces+1)x3 array
% Claudio Vestini

% This function generates a 3D sphere using the built-in sphere function.
% The sphere is scaled to the specified planetSize and returned as a 3D array.

% Inputs:
% planetSize - Size (radius) of the planet
% nFaces     - Number of faces for the sphere (smoothness)

% Output:
% planet     - A (nFaces+1)x(nFaces+1)x3 array containing the x, y, z coordinates

function planet = createPlanet3(planetSize, nFaces)

    % Generate the XYZ coordinates for a unit sphere with nFaces faces
    [X, Y, Z] = sphere(nFaces);
    
    % Scale the sphere to the specified planetSize
    % Store the scaled coordinates in a 3D array:
    planet(:,:,1) = X * planetSize; % X-coordinates
    planet(:,:,2) = Y * planetSize; % Y-coordinates
    planet(:,:,3) = Z * planetSize; % Z-coordinates
    
end