function [] = translationCube(v)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Translation of a cube with translation matrices.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clear 
%clc
%clf
% Determine the rotation axis coordinates of the cube.
xyz = [0, 0, 0];

% Drawing the center of rotation axis.
plot3(xyz(1), xyz(2), xyz(3)); 

hold on 

% Translation vector. The vector by which the cube should be moved.
%v = [1.0 1.0 1.0];

% Translation matrix.
t = [1 0 0 v(1); 0 1 0 v(2); 0 0 1 v(3); 0 0 0 1];

% Defining cube vertices and determining their size.
lengthEdge = 4; 
d = lengthEdge/2; 

% Define the coordinate origin for the vertices.
XYZ = [0, 0, 0, 0];

% Determine the coordinates of the vertices.
vertices(:,1,:)=[XYZ(1)-d; XYZ(1)+d; XYZ(1)+d; XYZ(1)-d; XYZ(1)-d; XYZ(1)+d; XYZ(1)+d; XYZ(1)-d]; 
vertices(:,2,:)=[XYZ(2)-d; XYZ(2)-d; XYZ(2)+d; XYZ(2)+d; XYZ(2)-d ;XYZ(2)-d; XYZ(2)+d; XYZ(2)+d]; 
vertices(:,3,:)=[XYZ(3)-d; XYZ(3)-d; XYZ(3)-d; XYZ(3)-d; XYZ(3)+d; XYZ(3)+d; XYZ(3)+d; XYZ(3)+d]; 
% Create homogeneous coordinates with w = 1. w is for explanation only and 
% represents the homogeneous coordinates.
vertices(:,4,:)=[1;1;1;1;1;1;1;1]; 

% Move all vertices with the translation.
for k = 1:8 
    vertices(k,:,:) = t*vertices(k,:,:)';   
end 

% At this point, the coordinates of the vertices are converted back 
% to cartesian coordinates
vertices(:,4,:) = [];

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
