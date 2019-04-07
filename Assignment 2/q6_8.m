%% Question 6.8 - Part A: Zeta = 0
zeta = 0;

% Create a meshgrid to visualize 2D array 
z_linspace = linspace(-200, 200, 401); % Array with stepsize 1
theta_linspace = linspace(-200, 200, 401); % Array with stepsize 1
[theta, z] = meshgrid(theta_linspace, z_linspace);

% Calculate z_dot 
% Must use dot operator (because doing arithmetic element-by-element)
z_dot = zeta + theta.*z - z.^3;

% Plot contour map
figure;
contour(theta, z, z_dot);
title('2D Pitchfork Bifurcation plot');
xlabel('Theta');
ylabel('Z');

%% Question 6.8 - Part B: Zeta != 0
zeta_linspace = linspace(-200, 200, 401); % Array with stepsize 1
[theta, z, zeta] = meshgrid(theta_linspace, z_linspace, zeta_linspace);

% Calculate z_dot 
z_dot = zeta + theta.*z - z.^3;

% Plot isosurface plot
figure;
isosurface(theta,z,zeta,z_dot,0);
title('3D Isosurface Plot of Pitchfork Bifurcation');
xlabel('Theta');
ylabel('Z');
zlabel('dz/dt');