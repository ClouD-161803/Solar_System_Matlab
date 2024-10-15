% 2D Solar System Animation
% Claudio Vestini
clc; clear;
% 1) Planet Attributes (Sun is last) and stars' coordinates generation

% Planetary data (https://nssdc.gsfc.nasa.gov/planetary/factsheet/)
% Column 1: radius (km)
% Column 2: semi-major axis (m)
% Cloumn 3: orbital tangential velocity (km/s)
planetData = [2439.7   5.7909e10      47.4
              6051.8   1.0820893e11   35.0
              6371.0   1.49598023e11  29.8
              3389.5   2.2793966e11   24.1
              69911    7.785472e11    13.1
              58232    1.42714869e12  9.7
              25362    2.87098290e12  6.8 
              24622    4.49825292e12  5.4
              695700   0              0    ];

% Planet sizes (m): to scale 1:500000 (except Sun which is 1:2500000)
planetSizes(1:8) = planetData(1:8,1)/500;
planetSizes(9) = planetData(9,1)/2500;

% Positions: x distances (m) from the Sun to scale 1:10e8 (offset from Sun)
planetPositions(1:8) = 1.3*planetSizes(9) + planetData(1:8,2)/8e8;
planetPositions(9) = planetData(9,2);
% Planet colours: hex values from https://www.schemecolor.com/tag/solar-system
% and converted to [r/255 g/255 b/255] format  using own made hex2rgb()
% First value is for Outline, second value is for Filler
planetColours = [ ['#504E51';'#CECCD1'] ; % mercury
                  ['#BBB7AB';'#8B91A1'] ; % venus
                  ['#3B5D38';'#8CB1DE'] ; % earth
                  ['#663926';'#E27B58'] ; % mars
                  ['#90614D';'#D39C7E'] ; % jupiter
                  ['#7B7869';'#A49B72'] ; % saturn
                  ['#65868B';'#93B8BE'] ; % uranus
                  ['#212354';'#3E54E8'] ; % neptune
                  ['#FC9601';'#FFCC33']]; % Sun

% Planet angular velocities (km/s) (exact) 
planetOrbitalVelocities(1:9) = planetData(1:9,3);

% Create a 2x50x9 array that stores each planet's (+ Sun) coordinates
% Preallocate planets array into computer memory
planets = zeros(2,50,9);
% Create array
for i = 1:9
    planets(:,:,i) = createPlanet(planetSizes(i),planetPositions(i));
end

% Pre-generate star coordinate nx10x2 matrix
% RandomMatrix() is nested within randomStarCoordinates() 
% These lines are outside of loop so that the n random number
% generation operation is only carried out once 
% (I didn't want to pre-generare the numbers in an excel document
% so that every time you run the code the background is unique, 
% with nxn possible available backgrounds)
axisDimension = 6200;
numberofStars = input("Select how many stars: ");
starSize = 20;
xy_stars = randomStarCoordinates(starSize,numberofStars,axisDimension);
% Pre generate surface arrays
planetPlots = zeros(1,9);
outlinePlots = zeros(1,9);

% 2) Main section of code

% Create animation using rotateShape (created in lab session2)
% and RandomMatrix, randomStarCoordinates, drawStarryBackrgound,
% hex2rgb, createPlanet, drawPlanet, functions (of my own design)

% Set the figure in the middle of the screen and make it 1000x1000 pixels
f = figure('Name','Solar System Animation 2D','NumberTitle','off');
f.Position = [(1920-1080)/2 0 1000 1000]; hold on;
% Set black background
set(gca,'Color','k');
% Fix axes
axis([-axisDimension axisDimension -axisDimension axisDimension]);
axis square;
% Draw starry background (user must input how many stars)
drawStarryBackground(xy_stars(:,:,1),xy_stars(:,:,2),numberofStars);
% Increasing angle a and plotting new planets at every iteration
for a = linspace(0,2*pi,3000)
    % Each planet's new position is updated based on their angular velocity
    for p = 1:9
        [planetPlots(p),outlinePlots(p)] = drawPlanet(rotateShape( ...
            planets(:,:,p),a*planetOrbitalVelocities(p)), ...
            planetColours((2*p-1):(2*p),:));
    end
    drawnow; pause(0.01);
    % Delete planets to plot them at new location
    if a ~= 2*pi
        delete(planetPlots)
        delete(outlinePlots)
    end
end