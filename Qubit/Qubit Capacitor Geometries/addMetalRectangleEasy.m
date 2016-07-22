function [ Polygon ] = addMetalRectangleEasy(Project, level, corner1, corner2, type)
%Adds a metal rectangle to the polygon array
%   0) Project object
%   1) metallization Level Index (The level the polygon is on)
%   2) [x,y] coordinate for first rectangle corner
%   3) [x,y] coordinate for second rectangle corner
%   4) (Optional) The type of metal used for the polybon.
%       This may either be the index for the metal type in the array of
%       metal types, or the name of the type (Ex: 'Copper'). If this value
%       is not specified then lossless metal will be used.

% X coordinates
if corner1(1) < corner2(1)
    x = [corner1(1), corner2(1), corner2(1), corner1(1)];
else
    x = [corner2(1), corner1(1), corner1(1), corner2(1)];
end
% Y coordinates
if corner1(2) < corner2(2)
    y = [corner1(2), corner1(2), corner2(2), corner2(2)];
else
    y = [corner2(2), corner2(2), corner1(2), corner1(2)];
end
% Add rectangle
if nargin == 5
    Polygon = Project.addMetalPolygonEasy(level,x,y,type);
elseif nargin == 4
    Polygon = Project.addMetalPolygonEasy(level,x,y);
end

end

