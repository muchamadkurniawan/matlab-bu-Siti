% close and clear everything running in the command window
clc;
clear all;
close all;
% Initialize transmission range
transRange = 250;
% Initialize number of nodes
numNodes = 100;
% Initialize minimum range of x,y,z co-ordinates of the network plot00000
min.x = 0;
min.y = 0;
% Initialize maximum range of x,y,z co-ordinates of the network plot
max.x = 1000;
max.y = 1000;
% Initialize x,y,z co-ordinates for six sinks including two embedded sinks
% embedded sink 1
BS(1,1)=500;
BS(1,2)=200;
CH(1,1)=500;
CH(1,2)=500;

% Plot nodes randomly using createNodes function
node = createNodes(min, max, numNodes);
for i=1:length(node)
    x(i)=node(i).x;
    y(i)=node(i).y;
end
node(1).energi=123;
% plot(x,y, 'x','MarkerFaceColor', 'G')

% hold on
% plot(BS(1, 1), BS(1, 2), 'S', 'MarkerFaceColor', 'G');
% plot(CH(1, 1), CH(1, 2), 'S', 'MarkerFaceColor', 'R');