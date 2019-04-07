import random
import matplotlib
import matplotlib.pyplot as plot

del_t = 0.1
A = 1

# Function: Plot 
def plotGraph(sets, title, axes, fixedPoints):
    # Draw the lines
    collections = matplotlib.collections.LineCollection(sets)

    # Generate plot
    plot.gca().add_collection(collections)

    # Plot the fixed points for reference
    for x in fixedPoints: 
        plot.plot(x[0], x[1], marker='o', markersize=5, color="red")

    # Print the plot 
    plot.title(title)
    plot.xlabel("x")
    plot.ylabel("y")
    plot.axis([axes[0], axes[1], axes[2], axes[3]])
    plot.draw()
    plot.show()


# Part A - Competing Dynamics Model"
# Create random points
points = [(3*random.uniform(0,1), 2*random.uniform(0,1)) for i in range(0,100)]
sets = [[pt] + 100*[None] for idx, pt in enumerate(points)] # Do this 100 times (as per question)

for i, pt_1 in enumerate(sets):
    for j in range(0, len(sets[i])):

        x = sets[i][j][0]
        y = sets[i][j][1]
        x_dot = (3-x-2*y)*x
        y_dot = (2-y-x)*y

        # Calculate new x and y values (via Forward Euler)
        new_x = x + del_t*A*x_dot 
        new_y = y + del_t*A*y_dot

        # Replace the new discretized values to the next point 
        if (j+1 < len(sets[i])):            
            sets[i][j+1] = (new_x, new_y)
fixedPoints = [[0,0], [0,2], [3,0], [1,1]]
plotGraph(sets, "Part A - Competing Dynamics Model", [-0.5,3.5,-0.5,2.5], fixedPoints)

# Part B - Classic Predator–Prey Model
# Create random points 
points_b = [(random.uniform(0,1), random.uniform(0,1)) for i in range(0,100)]
sets_b = [[pt] + 100*[None] for idx, pt in enumerate(points_b)] # Do this 100 times (as per question)
theta = 2

for i, pt_1 in enumerate(sets_b):
    for j in range(0, len(sets_b[i])):

        x = sets_b[i][j][0]
        y = sets_b[i][j][1]
        x_dot = (1-y)*x
        y_dot = theta*(x-1)*y

        # Calculate new x and y values (via Forward Euler)
        new_x = x + del_t*A*x_dot 
        new_y = y + del_t*A*y_dot

        # Replace the new discretized values to the next point 
        if (j+1 < len(sets_b[i])):            
            sets_b[i][j+1] = (new_x, new_y)

fixedPoints = [[0,0], [1,1]]
plotGraph(sets_b, "Part B - Classic Predator–Prey Model", [0,6,0,6], fixedPoints)

# Part C - Selkov Model
# Create random points 
points_c = [(random.uniform(0,1), random.uniform(0,1)) for i in range(0,5)]
sets_c = [[pt] + 100*[None] for idx, pt in enumerate(points_c)] # Do this 100 times (as per question)
thetas = [0.1, 0.5, 1]

# Do this for Theta = 0.1, 0.5, and 1
for theta in thetas: 
    for i, pt_1 in enumerate(sets_c):
        for j in range(0, len(sets_c[i])):

            x = sets_c[i][j][0]
            y = sets_c[i][j][1]
            x_dot = -x+0.1*y+(x**2)*y
            y_dot = theta-0.1*y-(x**2)*y

            # Calculate new x and y values (via Forward Euler)
            new_x = x + del_t*A*x_dot 
            new_y = y + del_t*A*y_dot

            # Replace the new discretized values to the next point 
            if (j+1 < len(sets_c[i])):            
                sets_c[i][j+1] = (new_x, new_y)

    fixedPoints=[]
    plotGraph(sets_c, "Part C - Selkov Model with theta =  %s" % theta, [0,3,0,3], fixedPoints)

