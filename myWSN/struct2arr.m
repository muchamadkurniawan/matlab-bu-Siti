function [x,y] = struct2arr(list)
x=[];
y=[];
for i=1:length(list)
    x(i)=list.x;
    y(i)=list.y;
end
end

