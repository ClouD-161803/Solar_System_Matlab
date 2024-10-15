% Simple rotation Function
% This was created in labs session2
% Claudio Vestini

function newshape = rotateShape(shape,a)
newshape = [cos(a) -sin(a) ; sin(a) cos(a)] * shape ;
end