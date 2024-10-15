% This function creates the shape of planets (circles) in a [x,y]x50 array
% Claudio Vestini

% I am using 50 values of theta and basic trig functions to create the array
function planet =  createPlanet(planetSize,position)
theta = linspace(0,2*pi,50);
planet = [planetSize*cos(theta) + position;
          planetSize*sin(theta) ];
end