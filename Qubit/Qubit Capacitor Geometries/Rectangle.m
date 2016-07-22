filenameTS = 'RectCap.s1p'; 
% Parameters
boxSize = [1000, 1000];
cellSize = [1, 1];
capSize = [24, 500];
capCenter = boxSize/2;
gapSize = [24, 24];
boxGap = 10;

% Make a Sonnet Project
Project=SonnetProject();

% Write the project to the file
Project.saveAs('Rectangle.son');

% % Add the top air dielectric layer
% Project.addDielectricLayer('Air', 1000, 1, 1, 0, 0, 0);

% Change length unit to microns
Project.changeLengthUnit('UM');
Project.changeFrequencyUnit('GHZ');

% Change the size of box
Project.changeBoxSize(boxSize(1),boxSize(2));

% Change numbers of cells for a given cell size
Project.changeCellSizeUsingNumberOfCells(cellSize(1), cellSize(2));

% Set the dielectric layer thicknesses
Project.replaceDielectricLayer(2,'Silicon (low T)', 500, 11.9, 1, 5E-6, 0, 0);
Project.replaceDielectricLayer(1,'Air', 1000, 1, 1, 0, 0, 0);
% Project.openInSonnet();

% Ground Metal
addSurroundingMetalGroundPlaneWithGap(Project, 0, capCenter, capSize, gapSize, boxSize, boxGap)

% Qubit Capacitor
c1=[capCenter(1) - capSize(1)/2; capCenter(2) - capSize(2)/2];
c2=[capCenter(1) + capSize(1)/2; capCenter(2) + capSize(2)/2];
qubitCap = addMetalRectangleEasy(Project, 0, c1, c2);
% Project.openInSonnet();

% Make capacitor port
Project.addPortAutoGrounded(qubitCap, 3, 50, 0, 0, 0, 'FIX', 0, 1);

% Make box ports and set reference plane
c1 = [0, boxSize(2)/2 - boxGap];
c2 = [boxGap, boxSize(2)/2 + boxGap];
leftWallPort = addMetalRectangleEasy(Project, 0, c1, c2);
Project.addPortStandard(leftWallPort, 4, 50, 0, 0, 0, 2);
Project.addReferencePlane('LEFT', 'FIX', boxGap)

c1 = [boxSize(1), boxSize(2)/2 - boxGap];
c2 = [boxSize(1) - boxGap, boxSize(2)/2 + boxGap];
rightWallPort = addMetalRectangleEasy(Project, 0, c1, c2);
Project.addPortStandard(rightWallPort, 2, 50, 0, 0, 0, 2);
Project.addReferencePlane('RIGHT', 'FIX', boxGap)

% Snap the polygons to the grid
Project.snapPolygonsToGrid();
% Project.openInSonnet();

% Choose an analysis type
%Project.addAbsFrequencySweep(0.1,18);
% Analyse single frequency at 100 MHz
Project.addStepFrequencySweep(0.1);


% Project.openInSonnet();

% Add an output file and then resimulate
% Project.addTouchstoneOutput;
% Touchstone, Network Name, De-embedded, ABS Adaptive, filename, Include
% Comments, High Precision, Y- Parameters, Real-Imaginary, Real PortType, 50 Ohm
Project.addFileOutput('TS','D','Y',filenameTS,'IC','Y','Y','RI','R',50); 
Project.save();
Project.simulate();

% Extract capacitance from Y-matrix
Y21Data = TouchstoneParser(filenameTS,2,1);
freqGHz = Y21Data(:,1);
Y21 = Y21Data(:,2);
% Calculate Capacitance
cap_pF = 1E12./(2.*pi.*freqGHz*1E9.*imag(1./Y21)) %Capacitance Equation (Obtained from the equation in Sonnet)
