function [nodePositions]= createNodes(min, max,numNodes)
    for i=1:numNodes
    nodePositions(i).x = (rand) * (max.x);
    nodePositions(i).y = (rand) * (max.y);
    end
end


