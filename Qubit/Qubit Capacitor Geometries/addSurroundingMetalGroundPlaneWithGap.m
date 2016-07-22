function [] = addSurroundingMetalGroundPlaneWithGap(Project, level, recCenter, recSize, gapSize, boxSize, boxGap)
%Adds a metal ground plane with gap around a rectangular metal

c1=[boxGap; boxGap];
c2=[recCenter(1) - recSize(1)/2 - gapSize(1); recCenter(2) - recSize(2)/2 - gapSize(2)];
addMetalRectangleEasy(Project, level, c1, c2);

c1=[boxGap; recCenter(2) - recSize(2)/2 - gapSize(2)];
c2=[recCenter(1) - recSize(1)/2 - gapSize(1); recCenter(2) + recSize(2)/2 + gapSize(2)];
addMetalRectangleEasy(Project, level, c1, c2);

c1=[boxGap; recCenter(2) + recSize(2)/2 + gapSize(2)];
c2=[recCenter(1) - recSize(1)/2 - gapSize(1); boxSize(2) - boxGap];
addMetalRectangleEasy(Project, level, c1, c2);

c1=[boxSize(1) - boxGap; recCenter(2) + recSize(2)/2 + gapSize(2)];
c2=[boxSize(1) - (recCenter(1) - recSize(1)/2 - gapSize(1)); boxSize(2) - boxGap];
addMetalRectangleEasy(Project, level, c1, c2);

c1=[boxSize(1) - boxGap; recCenter(2) + recSize(2)/2 + gapSize(2)];
c2=[boxSize(1) - (recCenter(1) - recSize(1)/2 - gapSize(1)); recCenter(2) - recSize(2)/2 - gapSize(2)];
addMetalRectangleEasy(Project, level, c1, c2);

c1=[boxSize(1) - boxGap; recCenter(2) - recSize(2)/2 - gapSize(2)];
c2=[boxSize(1) - (recCenter(1) - recSize(1)/2 - gapSize(1)); boxGap];
addMetalRectangleEasy(Project, level, c1, c2);

c1=[recCenter(1) - recSize(1)/2 - gapSize(1); boxGap];
c2=[boxSize(1) - (recCenter(1) - recSize(1)/2 - gapSize(1)); recCenter(2) - recSize(2)/2 - gapSize(2)];
addMetalRectangleEasy(Project, level, c1, c2);

c1=[recCenter(1) - recSize(1)/2 - gapSize(1); boxSize(2) - boxGap];
c2=[boxSize(1) - (recCenter(1) - recSize(1)/2 - gapSize(1)); boxSize(2) - (recCenter(2) - recSize(2)/2 - gapSize(2))];
addMetalRectangleEasy(Project, level, c1, c2);
end

