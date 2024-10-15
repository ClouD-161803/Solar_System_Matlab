% This function animates the plot of the planet's orbits
% Claudio Vestini

% The passed array orbit must be (nSteps)x3
% The passed array phi is 1x(nSteps)
% The passed array planetColour is 1x3 ([R G B])
% alpha is the angle subtended by the trail (bigger trail for larger orbits)
% beta is the orbital inclination angle in radians
function trailPlot = animateOrbit(CoM_pol,trailColour,alpha,beta,nSteps)
% k outputs the index of the coordinate of the planet with respect to gamma
k = round((alpha/(2*pi))*nSteps);
% Orbital radius
R = CoM_pol(2);
% Final angle of trail
phi1 = CoM_pol(1);
% Start angle of trail
phi0 = phi1 - alpha;
% Vector of angles of circular arc (trail)
gamma = linspace(phi0,phi1,k);
% kx3 array of trail
trail = createOrbit(R,gamma,beta,k);
trailPlot = plot3(trail(:,1),trail(:,2), ...
    trail(:,3),"Color",trailColour,"LineWidth",1.8);
end