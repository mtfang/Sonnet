function [] = addSurroundingMetalGroundPlane(Project, level, recCenter, recSize, gapSize, boxSize, boxGap)
%Adds a metal ground plane with gap around a rectangular metal

c1=[0; 0];
c2=[recCenter(1) - recSize(1)/2 - gapSize(1); recCenter(2) - recSize(2)/2 - gapSize(2)];
addMetalRectangleEasy(Project, level, c1, c2);

c1=[0; recCenter(2) - recSize(2)/2 - gapSize(2)];
c2=[recCenter(1) - recSize(1)/2 - gapSize(1); recCenter(2) + recSize(2)/2 + gapSize(2)];
addMetalRectangleEasy(Project, level, c1, c2);

c1=[0; recCenter(2) + recSize(2)/2 + gapSize(2)];
c2=[recCenter(1) - recSize(1)/2 - gapSize(1); boxSize(2)];
addMetalRectangleEasy(Project, level, c1, c2);

c1=[boxSize(1); recCenter(2) + recSize(2)/2 + gapSize(2)];
c2=[boxSize(1) - (recCenter(1) - recSize(1)/2 - gapSize(1)); boxSize(2)];
addMetalRectangleEasy(Project, level, c1, c2);

c1=[boxSize(1); recCenter(2) + recSize(2)/2 + gapSize(2)];
c2=[boxSize(1) - (recCenter(1) - recSize(1)/2 - gapSize(1)); recCenter(2) - recSize(2)/2 - gapSize(2)];
addMetalRectangleEasy(Project, level, c1, c2);

c1=[boxSize(1); recCenter(2) - recSize(2)/2 - gapSize(2)];
c2=[boxSize(1) - (recCenter(1) - recSize(1)/2 - gapSize(1)); 0];
addMetalRectangleEasy(Project, level, c1, c2);

c1=[recCenter(1) - recSize(1)/2 - gapSize(1); 0];
c2=[boxSize(1) - (recCenter(1) - recSize(1)/2 - gapSize(1)); recCenter(2) - recSize(2)/2 - gapSize(2)];
addMetalRectangleEasy(Project, level, c1, c2);

c1=[recCenter(1) - recSize(1)/2 - gapSize(1); boxSize(2)];
c2=[boxSize(1) - (recCenter(1) - recSize(1)/2 - gapSize(1)); boxSize(2) - (recCenter(2) - recSize(2)/2 - gapSize(2))];
addMetalRectangleEasy(Project, level, c1, c2);
end

