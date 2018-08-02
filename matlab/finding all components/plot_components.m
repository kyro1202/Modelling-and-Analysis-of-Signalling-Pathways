%% To plot individual graphs of the components

%load('output.mat');
%load('COMPONENTS.mat');

for component_no = 1:16

    size = 1; % to calculate the size of each component
    while(isempty(components{component_no,size}) ~= 1) % till the end
        size = size + 1;
        if(size == 1068) % the max size
            break;
        end
    end

    size = size - 1;
    
    small_adj_mat = zeros(size); % the adjacency matrix for each individual component

    for i = 1:size %calculating the adjacency matrix of the component
        for j = 1:size
            if(adj_mat(components{component_no,i},components{component_no,j}) == 1) % if the edge is in the adjacency matrix of the bigger network 
                small_adj_mat(i,j) = 1;
            end
            if(adj_mat(components{component_no,j},components{component_no,i}) == 1)
                small_adj_mat(j,i) = 1;
            end
        end
    end

    G = digraph(small_adj_mat,'OmitSelfLoops'); %plot of the component
    figure(component_no);
    p = plot(G);

    t = cell(1,size); %node labels
    for i = 1:size
        t{i} = int2str(components{component_no,i}); % node labels according to the components
    end

     p.NodeLabel = t;
     %filename = int2str(component_no);
     %savefig(filename);
end
