% This function pre-generates the stars' random coordinates
% this is so that the computer does not have to do this at each iteration
% when drawing the new planet frames
% Claudio Vestini

% Function returns an nStarsx10x2 array 
function xy_stars = randomStarCoordinates(starSize,nStars,axisDimensions)
% Use RandomMatrix function to create 1000x10 arrays of random number
% (using a for loop would have used up more lines as you would have needed
% to preallocate xy_stars to memory as well)
xy_rand(:,:,1) = RandomMatrix(nStars,10,axisDimensions);
xy_rand(:,:,2) = RandomMatrix(nStars,10,axisDimensions);
% Pre allocate stars xy position array to computer memory
xy_stars = zeros(nStars,10,2);
% Create 1000 stars randomly positioned in the plane
for i = 1:nStars
    % This generates the x coordinates of a vietnamese-flag-syle-star
    % shifted by the random numbers contained within xrand
    xy_stars(i,:,1) = starSize*[cos(pi/2),2/5*cos(pi/2+pi/5),cos(pi/2+2*pi/5),...
        2/5*cos(pi/2+3*pi/5),cos(pi/2+4*pi/5),2/5*cos(3*pi/2),...
        cos(pi/2+6*pi/5),2/5*cos(pi/2+7*pi/5),...
        cos(pi/2+8*pi/5),2/5*cos(pi/2+9*pi/5)] + xy_rand(i,:,1);
    % This generates the y coordinates of a vietnamese-flag-syle-star
    % shifted by the random numbers contained within yrand
    xy_stars(i,:,2) = starSize*[sin(pi/2),2/5*sin(pi/2+pi/5),sin(pi/2+2*pi/5),...
        2/5*sin(pi/2+3*pi/5),sin(pi/2+4*pi/5),2/5*sin(3*pi/2),...
        sin(pi/2+6*pi/5),2/5*sin(pi/2+7*pi/5),...
        sin(pi/2+8*pi/5),2/5*sin(pi/2+9*pi/5)] + xy_rand(i,:,2);
% Credit to Christophre Dennen on matlabcentral for the formulas
end
end