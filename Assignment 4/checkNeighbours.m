function [grid, count] = checkNeighbours(grid, x, y, count)
    grid = addToNeighbours(grid, x, y); 
    count = count + 1;
    
    if (x+1 <= 100 && grid(x+1, y) >= 4) 
       [grid, count] = checkNeighbours(grid, x+1, y, count);
    end
    if (x-1 > 0 && grid(x-1, y) >= 4) 
        [grid, count] = checkNeighbours(grid, x-1, y, count);
    end
    if (y+1 <= 100 && grid(x, y+1) >= 4) 
       [grid, count] = checkNeighbours(grid, x, y+1, count);
    end
    if (y-1 > 0 && grid(x, y-1) >= 4) 
       [grid, count] = checkNeighbours(grid, x, y-1, count);
    end
end