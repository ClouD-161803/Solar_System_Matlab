% This function creates the shape of planets (spheres) in a 21x21x3 array
% Claudio Vestini

% To create the planet array, I will use the in-built sphere function:
% [X,Y,Z] = sphere returns the x-, y-, and z- coordinates of a sphere 
% without drawing it. The returned sphere has a radius equal to 1 
% and consists of n-by-n faces. The function returns the x-, y-, 
% and z- coordinates as three (n+1)-by-(n+1) matrices

function planet =  createPlanet3(planetSize,nFaces)
% XYZ coordinates of a 3D sphere with 50 faces
[X,Y,Z] = sphere(nFaces);
% Planet is a 51x51x3 3dimensional array
planet(:,:,1) = X*planetSize;
planet(:,:,2) = Y*planetSize;
planet(:,:,3) = Z*planetSize;
end