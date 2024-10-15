% This function the [X Y Z] coordinates of the Center of Mass of a planet
% Claudio Vestini

function CoM = getCenter(orbitalRadius,phi,beta,orbitalVelocity)
% Whereas phi (azimuthal angle) varies linearly the same way for all
% planets, the deltaphi and deltatheta steps are generated 
% according to the value of orbitalVelocity
% The equations used are the same as in createOrbit()
deltaphi = orbitalVelocity*phi;
deltatheta = beta*sin(phi*orbitalVelocity);
CoM = orbitalRadius*[cos(deltaphi) sin(deltaphi) sin(deltatheta)];
end