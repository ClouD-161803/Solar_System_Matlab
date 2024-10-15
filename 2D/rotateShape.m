% Simple rotation function
% This was created in labs session 2
% Claudio Vestini

function newshape = rotateShape(shape, a)
    % Create the rotation matrix
    rotationMatrix = [cos(a), -sin(a); 
                      sin(a),  cos(a)];
    
    % Apply the rotation to the shape
    newshape = rotationMatrix * shape;
end