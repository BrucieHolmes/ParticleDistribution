function [] = plotParticles(xy, R, theCol)

n = length(R);
for i=1:n
    pos = [xy(i,:)-R(i) 2*R(i) 2*R(i)];
    rectangle('Position',pos,'Curvature',[1 1], ...
              'LineWidth', 0.25, ...
              'EdgeColor', theCol, ...
              'FaceColor', theCol );
    hold on;
end
hold off;