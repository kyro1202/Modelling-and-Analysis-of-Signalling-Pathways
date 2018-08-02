%load('output.mat');
%load('COMPONENTS.mat');

%stp_connected_comp = cell(1,16);

for component_no = 14:16 % to calculate the transition probabilities of individual components

    size = 1; % to calculate the size of each component
    while(isempty(components{component_no,size}) ~= 1)
        size = size + 1;
        if(size == 1068)
            break;
        end
    end

    size = size - 1;

    small_adj_mat = zeros(size); % adjacency matrix of the component

    % there exist an edge in small adjacency matrix only if there is an
    % edge in the adj_matrix of the original network
    for i = 1:size
        for j = 1:size
            if(adj_mat(components{component_no,i},components{component_no,j}) == 1)
                small_adj_mat(i,j) = 1;
            end
            if(adj_mat(components{component_no,j},components{component_no,i}) == 1)
                small_adj_mat(j,i) = 1;
            end
        end
    end

    stp = zeros(size);                                      % stp = state transition matrix

    % transition probability (a,b) = number of ways of going to b from a /
    % number of ways of going to any state from a
    for i = 1:size
        totalpaths = 0;                                     % total paths from state i to every other state
        for j = 1:size
            stp(i,j) = countallpathsadj_mat(i,j,small_adj_mat,size); % for all possible paths between state i to state j
            totalpaths = totalpaths + stp(i,j);             % updating total paths
        end
        for j = 1:size
            stp(i,j) = stp(i,j) / totalpaths;               % stp(i,j) = paths between i and j / total paths
        end
    end

    stp_connected_comp{1,component_no} = stp;
end
