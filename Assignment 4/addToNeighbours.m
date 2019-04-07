function [grid] = addToNeighbours(grid, x, y)
    % Subtract 4 to input
    grid(x,y) = grid(x,y) - 4;

    % Add 1 to each of its neighbours
    % x + 1
    if (x + 1 <= 100)
        grid(x+1, y) = grid(x+1, y) + 1;
    end
    % x - 1
    if (x - 1 > 0)
        grid(x-1, y) = grid(x-1, y) + 1;
    end
    % y + 1
    if (y + 1 <= 100)
        grid(x, y+1) = grid(x, y+1) + 1;
    end
    % y - 1
    if (y - 1 > 0)
        grid(x, y-1) = grid(x, y-1) + 1;
    end
end