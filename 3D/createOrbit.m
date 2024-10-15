% This function creates a (nSteps)x3 orbital array
% Claudio Vestini

% The orbit will be a 3D circle tilted by inclination angle beta
% I will use 3D Cylindrical Polar Coordinates:
% x = rho*cos(phi)
% y = rho*sin(phi)
% z = z
function orbit = createOrbit(orbitalRadius,phi,beta,nSteps)
% Pre allocate array into computer memory
orbit = zeros(nSteps,3);
% x coordinates
orbit(:,1) = orbitalRadius*cos(phi);
% y coordinates
orbit(:,2) = orbitalRadius*sin(phi);
% z coordinates - I am using nested sin() for orbital inclination
theta = beta*sin(phi); % Vector of values ranging from -beta to +beta
orbit(:,3) = orbitalRadius*sin(theta); % I am effectively taking sin of sin
end