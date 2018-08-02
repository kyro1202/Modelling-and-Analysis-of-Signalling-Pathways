function [vis,components,column,row] = util(i,components,column,row,root,vis,adj_mat)
%UTIL utility function to find the connected components of a graph
%   the function uses depth first search for graph traversal
    vis(i) = 1;
    if(i == root)% if it is a new component - the current node is tha root of this components
        row = row + 1;
        column = 1;
    end
    components{row,column} = i;% add the vertex to the specific component
    column = column + 1;
    for j=1:10652
        if((adj_mat(j,i) == 1 || adj_mat(i,j) == 1) && vis(j) == 0) %condition to check if it is connected and not included in any other components
            [vis,components,column,row] = util(j,components,column,row,root,vis,adj_mat); %calling util on neighbours of current node
        end
    end
end

