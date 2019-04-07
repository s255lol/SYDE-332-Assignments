clear all;
close all;

% Create 100x100 grid of 0's 
grid = zeros(100,100);

% Create q(i) function to record pixels that reached value of 4 or more 
q = [];

% Iterate ## number of times 
iterations = 100000;
for i = (1:iterations)
    % Generate random location
    random_location = randsample(100,2);
    random_x = random_location(1);
    random_y = random_location(2);

    % Add 1 to input
    grid(random_x,random_y) = grid(random_x,random_y) + 1;
    
    % Initialize counter 
    count = 0;

    % If it reaches 4 or greater 
    if grid(random_x,random_y) >= 4
        % Record the number of different pixels that reached 4 or more 
        count = count + 1;        
       
        % Check if each value (and neighbours) is >= 4  
        [grid, count] = checkNeighbours(grid, random_x, random_y, count);
    end
    
    % Add record of # of pixels greater or more than 4
    if (count > 0)
        q = [q; i, count];
    end
end

% Plot q as a function of i 
figure;
plot(q(:,1), q(:,2));
title('Plot of q as a function of i');
xlabel('i (iterations)');
ylabel('q (count of pixels per iteration)'); 

% Identify range of iterations to build-up and equilibrium
initial_buildup = q(1,1);
equilibrium = sum(sum(grid));

% Find the various bins for the log-log plot 
frequency = zeros(100000,1);
for j = (1:equilibrium)
    value = q(j,2);
    frequency(value) = frequency(value) + 1;    
end

% Plot the log-log plot
figure;
loglog(frequency);
title('Log-log plot of the frequency of events of q WRT event size');
xlabel('Frequency of Event of Q');
ylabel('Frequency'); 