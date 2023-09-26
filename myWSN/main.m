% close and clear everything running in the command window
clc;
clear all;
close all;


transRange = 250; % Initialize transmission range
numNodes = 100; % Initialize number of nodes
% Initialize minimum range of x,yco-ordinates of the network plot00000
minn.x = 0;
minn.y = 0;
% Initialize maximum range of x,y co-ordinates of the network plot
maxx.x = 1000;
maxx.y = 1000;

% embedded BS and CH 1
BS.x=500;
BS.y=500;


numCH = 2;
CH = createNodes(minn, maxx, numCH);
% Plot nodes randomly using createNodes function
node = createNodes(minn, maxx, numNodes);
% for i=1:length(node)
%     x(i)=node(i).x;
%     y(i)=node(i).y;
% end
for i=1:length(CH)
    chx(i)=CH(i).x;
    chy(i)=CH(i).y;
end

for i=1:length(node)
    jarak=[];
    for j=1:length(CH)
        jarak(j)=distance(node(i),CH(j));
    end
    [~,ind] = min(jarak);
    node(i).CH = ind;
end

inc = 1;
for i=1:length(CH)
    for j=1:length(node)
        if node(j).CH == i
           arr_node(inc,1)=node(j).x;
           arr_node(inc,2)=node(j).y;
           arr_node(inc,3)=node(j).CH;
           inc = inc +1;
        end
    end
end

plot(chx,chy, 'S','MarkerFaceColor', 'Y')
hold on
plot(BS.x,BS.y, 'P','MarkerFaceColor', 'R')

for i=1:length(CH)
    temp=[];
    inc = 1;
    for j=1:length(arr_node)
       if arr_node(j,3)==i
           temp(inc,1) = arr_node(j,1);
           temp(inc,2) = arr_node(j,2);
           inc=inc+1;
        end
    end
    plot(temp(:,1),temp(:,2),'x')
end
% 
% plot(x,y, 'x','MarkerFaceColor', 'G')
% hold on



% hold on
% plot(BS(1, 1), BS(1, 2), 'S', 'MarkerFaceColor', 'G');
% plot(CH(1, 1), CH(1, 2), 'S', 'MarkerFaceColor', 'R');