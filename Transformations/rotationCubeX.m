function [] = rotationCubeX(alpha)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rotation of a cube with rotation matrices.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear 
% clc
% Determine the rotation axis coordinates of the cube.
xyz = [0, 0, 0];

% Drawing the center of rotation axis.
plot3(xyz(1), xyz(2), xyz(3)); 
hold on 

% Angle by how many degrees the cube should be rotated.
% alpha = 90; 

% Rotation matrices.
Rx = [1 0 0; 0 cos(alpha) -sin(alpha); 0 sin(alpha) cos(alpha)]; 
Ry = [cos(alpha) 0 sin(alpha); 0 1 0; -sin(alpha) 0 cos(alpha)]; 
Rz = [cos(alpha) -sin(alpha) 0; sin(alpha) cos(alpha) 0; 0 0 1];

% Rotation around all three axes.
%rotation = Rx*Ry*Rz; 
% Rotation around the individual axes.
rotation = Rx;
%rotation = Ry;
%rotation = Rz;

% Defining cube vertices and determining their size.
edgeLength = 6; 
d = edgeLength/2; 

% Define the coordinate origin for the vertices.
XYZ = [0, 0, 0];

% Determine the coordinates of the vertices.
vertices(:,1,:)=[XYZ(1)-d; XYZ(1)+d; XYZ(1)+d; XYZ(1)-d; XYZ(1)-d; XYZ(1)+d; XYZ(1)+d; XYZ(1)-d]; 
vertices(:,2,:)=[XYZ(2)-d; XYZ(2)-d; XYZ(2)+d; XYZ(2)+d; XYZ(2)-d; XYZ(2)-d; XYZ(2)+d; XYZ(2)+d]; 
vertices(:,3,:)=[XYZ(3)-d; XYZ(3)-d; XYZ(3)-d; XYZ(3)-d; XYZ(3)+d; XYZ(3)+d; XYZ(3)+d; XYZ(3)+d]; 

% Rotate all vertices with the rotation.
for k = 1:8 
    vertices(k,:,:) = rotation*vertices(k,:,:)'; 
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

