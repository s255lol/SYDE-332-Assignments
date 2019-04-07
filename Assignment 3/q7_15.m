% a) Competing Dynamics Model
true_set = [];
for n = 1:5 
    
    x = 3*rand(100,1);
    y = 2*rand(100,1);
    sets = [x,y];
    delta_t = 0.1;

    for col=1:size(sets)
        x = sets(col,1);
        y = sets(col,2);

        x_dot = ((3-x-2*y)*x) + delta_t*((3-x-2*y)*x);
        y_dot = ((3-x-2*y)*x) + delta_t*((2-y-x)*y);
        new_set(col,:) = [x_dot,y_dot];
    end
    figure
    hold on;
    plot(new_set(:,1),new_set(:,2));
    hold on;
%     true_set = [true_set, new_set];
%     s = new_set(1)
%     true_set = ([new_set(:,1),new_set(:,2)]);
%     m2 = m([1,2,4],:); % Extract rows 1, 2, and 4;
%     m2 = m2(:, [1, 2, 4, 6]); Now extract columns 1,2,4,& 6

end


figure;
hold on;
% for v = 1:2:200
% % for col=1:100
%     plot(true_set(:,v), true_set(:,v+1));
% end
% h = cellfun(@(x) plot(x), true_set);
% scatter(true_set(:,1), true_set(:,2));
xlabel('x_dot');
ylabel('y_dot');
grid;
axis equal;

% fplot(x_dot,y_dot);

% Discretizing into discrete time using t_s = 0.1
% Hd = c2d(x_dot,0.1,'foh');


% % b) Classic Predator-Prey Model 
% x = rand(100,100);
% y = rand(100,100);
% theta = 2;
% x_dot = (1-y).*x;
% y_dot = theta.*(x-1).*y;
% 
% % NOT SURE IF THIS IS RIGHT...
% figure;
% % quiver(x, y, x_dot, y_dot);
% plot(x_dot, y_dot);
% xlabel('x_dot');
% ylabel('y_dot');
% grid;
% axis equal;
% 
% 
% % c) Selkov Model 
% x = rand(100,100);
% y = rand(100,100);
% theta = 1;
% x_dot = -x + 0.1.*y + y.*x.^2;
% y_dot = theta - 0.1.*y - y.*x.^2;