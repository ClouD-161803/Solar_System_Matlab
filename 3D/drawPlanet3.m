% 3D Planet drawing function using surface mesh
% Claudio Vestini

% The passed array planet must be (nFaces+1)x(nFaces+1)x3
% The passed array planetCenterOfMass is 3x1 ([X Y Z])
% The passed array planetColour is 1x3 ([R G B])
function planetPlot = drawPlanet3(planet,planetCenterOfMass,planetColour)
X = planetCenterOfMass(1) + planet(:,:,1);
Y = planetCenterOfMass(2) + planet(:,:,2);
Z = planetCenterOfMass(3) + planet(:,:,3);
planetPlot = surf(X,Y,Z,'FaceColor',planetColour, ...
    'LineStyle','none','EdgeAlpha',0);
end