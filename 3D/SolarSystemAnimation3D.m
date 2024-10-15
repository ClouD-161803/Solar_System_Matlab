% 3D Solar System Animation to scale
% Claudio Vestini
clc; clear;

% Define animation parameters
nSteps = 3000; % Smaller number makes planets go faster
phi = linspace(0, 2*pi, nSteps); % Vector of small angle steps
nFaces = 20; % Number of sphere faces for each planet (2 for funny squares)
axDim = 5000; % Axis Dimensions
alpha = pi/6; % Angle subtended by orbit's trail
gamma = phi - alpha; % Vector of angles shifted by alpha

% 1) Planet Attributes (Sun is last)

% Planetary data (https://nssdc.gsfc.nasa.gov/planetary/factsheet/)
% Column 1: radius (km)
% Column 2: semi-major axis (m)
% Column 3: orbital tangential velocity (km/s)
% Column 4: orbital inclination (degrees)
planetData = [2439.7   5.7909e10       47.4    7.00487
              6051.8   1.0820893e11    35.0    3.39471
              6371.0   1.49598023e11   29.8    0.00005
              3389.5   2.2793966e11    24.1    1.85061
              69911    7.785472e11     13.1    1.30530
              58232    1.42714869e12   9.7     2.49087
              25362    2.87098290e12   6.8     0.76986
              24622    4.49825292e12   5.4     1.76917
              695700   0               0       0      ];

% Planet sizes (m): to scale 1:500000 (except Sun which is 1:2500000)
planetSizes(1:8) = planetData(1:8,1)/500;
planetSizes(9) = planetData(9,1)/2500;

% Positions: x distances (m) from the Sun to scale 1:10e8 (offset from Sun)
% this is the only data that is not to scale: if I had the Sun-mercury
% distance to scale I would not be able to fit all 8 planets and the Sun
% on a 1920x1080 display. Everything else is to scale.
planetPositions(1:8) = 1.3*planetSizes(9) + planetData(1:8,2)/10e8;
planetPositions(9) = planetData(9,2);

% Planet angular velocities (km/s) (exact) 
planetOrbitalVelocities(1:9) = planetData(1:9,3);

% Planet orbital inclinations (radians) (exact)
planetOrbitalAngles(1:9) = deg2rad(planetData(:,4));

% Planet colours: hex values from https://www.schemecolor.com/tag/solar-system
% and converted to [r/255 g/255 b/255] format  using own made hex2rgb()
% First value is for Orbit trail, second value is for Planet
planetHex = [ ['#504E51';'#CECCD1'] ; % mercury
              ['#BBB7AB';'#8B91A1'] ; % venus
              ['#3B5D38';'#8CB1DE'] ; % earth
              ['#90614D';'#D39C7E'] ; % jupiter
              ['#663926';'#E27B58'] ; % mars
              ['#7B7869';'#A49B72'] ; % saturn
              ['#65868B';'#93B8BE'] ; % uranus
              ['#212354';'#3E54E8'] ; % neptune
              ['#FC9601';'#FFCC33']]; % Sun

% Store data in multidimensional arrays

% 1) planets = (nFaces+1)x(nFaces+1)x3x9 double containing sphere meshes
% 2) planetOrbits = (nSteps)x3x9 double containing planets' 3D orbital paths
% 3) planetRGBs: 9x6 double containing the planet's colour values in RGB
%    the 1:3 vaues are [R G B] of orbits, the 4:6 are [R G B] of planets
% 4) planetPlots = 1x8 surface of spheres
% 5) orbitPlots = 1x8 surface of orbits
% Preallocate arrays into computer memory
planets = zeros(nFaces+1, nFaces+1, 3, 9);
planetOrbits = zeros(nSteps, 3, 9); 
planetRGBs = zeros(9, 6); 
planetPlots = zeros(1, 8); 
orbitPlots = zeros(1, 8);

% Create arrays
for p = 1:9
    planets(:,:,:,p) = createPlanet3(planetSizes(p), nFaces);
    planetOrbits(:,:,p) = createOrbit(planetPositions(p), ...
                          phi, planetOrbitalAngles(p), nSteps);
    planetColour = planetHex((2*p-1):(2*p), :);
    planetRGBs(p,1:3) = hex2rgb(planetColour(1,:));
    planetRGBs(p,4:6) = hex2rgb(planetColour(2,:));
end

% 2) Main section of code

% I will animate the planets by changing their centres of mass at each
% iteration, then plotting all planets and deleting them shortly after
% I also added a function that animates the orbits of planets

% Set the figure in the middle of the screen and make it maximized
f = figure('Name', 'Solar System Animation 3D', 'NumberTitle', 'off', ...
    'Windowstate', 'Maximized');
% Title
text(-1650, 0, axDim*0.35, 'Solar System (sizes to scale 1:500000)', ...
    'FontSize', 20, 'Color', 'W');
% Set the Oxyz axes and make them invisible (z-axis is less relevant)
axis([-axDim, axDim, -axDim, axDim, -axDim/4, axDim/4]); axis equal;
set(gca, 'xtick', []); set(gca, 'ytick', []); 
set(gca, 'ztick', []); set(gca, 'Visible', 'off');
% Set black background
set(gca, 'color', 'k'); set(gcf, 'color', 'k');
% Set view angle
view(0, 10);
hold on;

% Plot the Sun, which corresponds to planets(:,:,:,9)
Sun = drawPlanet3(planets(:,:,:,9), planetOrbits(1,:,9), planetRGBs(9,4:6));

% Plot the planets' orbits
for p = 1:8
    plot3(planetOrbits(:,1,p), planetOrbits(:,2,p), ...
        planetOrbits(:,3,p), 'Color', hex2rgb('#696969')); % Comedy colour
end

% Main for loop
for i = 1:nSteps
    for p = 1:8
        % Find center of mass, this is outside as it is used by 2 functions
        CoM_cart = getCenter(planetPositions(p), phi(i), ...
            planetOrbitalAngles(p), planetOrbitalVelocities(p)); % [X Y Z]
        [theta, rho, z] = cart2pol(CoM_cart(1), CoM_cart(2), CoM_cart(3)); 
        CoM_pol = [theta, rho, z]; % Cylindrical polar [phi r z] 
        
        % Add the moving orbit trail
        orbitPlots(p) = animateOrbit(CoM_pol, planetRGBs(p,1:3), ...
            alpha, planetOrbitalAngles(p), nSteps);
        
        % Plot the planets
        planetPlots(p) = drawPlanet3(planets(:,:,:,p), ...
            CoM_cart, planetRGBs(p,4:6));
    end
    drawnow;
    pause(0.01);
    
    % This deletes the old planet plots at every iteration
    if i ~= nSteps
        delete(planetPlots);
        delete(orbitPlots);
    end
end