% close and clear everything running in the command window
clc;
clear all;
close all;


transRange = 250; % Initialize transmission range
numNodes = 100; % Initialize number of nodes
% Initialize minimum range of x,yco-ordinates of the network plot00000
min.x = 0;
min.y = 0;
% Initialize maximum range of x,y co-ordinates of the network plot
max.x = 1000;
max.y = 1000;

% embedded BS and CH 1
BS.x=500;
BS.y=500;


numCH = 2;
CH = createNodes(min, max, numCH);
% Plot nodes randomly using createNodes function
node = createNodes(min, max, numNodes);
for i=1:length(node)
    x(i)=node(i).x;
    y(i)=node(i).y;
end
for i=1:length(CH)
    chx(i)=CH(i).x;
    chy(i)=CH(i).y;
end

plot(x,y, 'x','MarkerFaceColor', 'G')
hold on
plot(chx,chy, 'S','MarkerFaceColor', 'Y')
hold on
plot(BS.x,BS.y, 'P','MarkerFaceColor', 'R')


% hold on
% plot(BS(1, 1), BS(1, 2), 'S', 'MarkerFaceColor', 'G');
% plot(CH(1, 1), CH(1, 2), 'S', 'MarkerFaceColor', 'R');