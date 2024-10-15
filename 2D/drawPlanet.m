% Planet drawing function, planet is made up of outline and filler
% Claudio Vestini

function [outlinePlot,planetPlot] = drawPlanet(planet,planetColour)
outlinePlot = plot(planet(1,:),planet(2,:),"Color", ...
    planetColour(1,:),"linewidth",3);
planetPlot = fill(planet(1,:),planet(2,:),hex2rgb(planetColour(2,:)));
end