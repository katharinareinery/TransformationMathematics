function [] = skalierungCube(lambda)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Scaling of a cube with scaling matrices.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear 
% clc
% Determine the rotation axis coordinates of the cube.
xyz = [0, 0, 0];

% Drawing the center of rotation axis.
plot3(xyz(1), xyz(2), xyz(3)); 

hold on 

% Scaling factor. The factor by which the cube should be increased.
% In this case, only lambda = 2.5, because the cube then fills the 
% entire coordinate system.
% lambda = 1.5;
% Scaling matrix.
s = [lambda 0 0; 0 lambda 0; 0 0 lambda];

% Defining cube vertices and determining their size.
edgeLength = 4; 
d = edgeLength/2; 

% Define the coordinate origin for the vertices.
XYZ = [0, 0, 0];

% Determine the coordinates of the vertices.
vertices(:,1,:)=[XYZ(1)-d; XYZ(1)+d; XYZ(1)+d; XYZ(1)-d; XYZ(1)-d; XYZ(1)+d; XYZ(1)+d; XYZ(1)-d]; 
vertices(:,2,:)=[XYZ(2)-d; XYZ(2)-d; XYZ(2)+d; XYZ(2)+d; XYZ(2)-d ;XYZ(2)-d; XYZ(2)+d; XYZ(2)+d]; 
vertices(:,3,:)=[XYZ(3)-d; XYZ(3)-d; XYZ(3)-d; XYZ(3)-d; XYZ(3)+d; XYZ(3)+d; XYZ(3)+d; XYZ(3)+d]; 

% Enlarge all vertices with scaling.
for k = 1:8 
    vertices(k,:,:) = s*vertices(k,:,:)'; 
end 

% Define surface cube.
faces = [1 2 6 5; 2 3 7 6; 3 4 8 7; 4 1 5 8; 1 2 3 4; 5 6 7 8]; 

% Draw the Cube.
patch('Vertices',vertices,'Faces',faces,'FaceAlpha',0.5,'FaceColor', ...
    'flat','FaceVertexCData',hsv(6))

% Define coordinate system.
axis([-5, 5, -5, 5, -5, 5]) 
xlabel('X-Axis') 
ylabel('Y-Axis') 
zlabel('Z-Axis') 
grid on 

hold off

end
