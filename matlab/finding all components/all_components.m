%load('output.mat');
 
% Aim :- to calculate all the connected components of the network
n = size(adj_mat,2); % the number of nodes
vis = zeros(1,n); % array to store if a node has been visited or not
components = {}; % to store the components
column = 1; % column index of the cell components
row = 0; % row index of the cell components

for i = 1:n
    if(vis(i) == 0) %visit only the unvisited vertices
        [vis,components,column,row] = util(i,components,column,row,i,vis,adj_mat); % DFS
    end
end