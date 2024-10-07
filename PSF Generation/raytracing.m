% Define the coordinates of the objects, exit pupil, and image plane
x0 = [0, 1, 2];  % x-coordinates of object points
y0 = [0, 1, 2];  % y-coordinates of object points
z0 = [0, 0, 0];  % z-coordinates of object points
z_exit_pupil = 5;  % Exit pupil coordinate on the z-axis
z_image_plane = 10;  % Image plane coordinate on the z-axis

% Define the sample range on the virtual exit pupil
x_r = 2;
y_r = 3;

% Plotting the object points
scatter(x0, y0, 'red', 'filled');
hold on

% Plotting the exit pupil
scatter(0, 0, 'blue', 'filled');

% Plotting the image plane
scatter(0, 0, 'green', 'filled');

% Connecting object points to the exit pupil and image plane
for i = 1:numel(x0)
    plot([x0(i), 0], [y0(i), 0], 'k--');
end
plot([0, 0], [0, z_image_plane], 'g--');

% Plotting the sample range on the virtual exit pupil
rectangle('Position', [-x_r, -y_r, 2*x_r, 2*y_r], 'EdgeColor', 'blue', 'FaceColor', 'none', 'LineStyle', '--');

% Adding labels and legend
xlabel('x-axis');
ylabel('y-axis');
legend('Object Points', 'Exit Pupil', 'Image Plane', 'Sample Range');

% Set the aspect ratio to equal
axis equal;

hold off
