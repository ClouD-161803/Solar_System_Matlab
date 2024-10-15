% This function creates a background with nStars white stars
% Claudio Vestini

function drawStarryBackground(xstars, ystars, nStars)
    % Draw n stars on canvas
    for i = 1:nStars
        % Plot stars and make them white
        fill(xstars(i,:), ystars(i,:), 'w');
    end
end