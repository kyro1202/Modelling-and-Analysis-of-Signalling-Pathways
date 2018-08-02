function stm = stal2stm( stal,count )
%STAL2STM   function to convert state transition adjacency list into a state
%           transition matrix

    n = size(stal,1); % the number of nodes
    stm = zeros(n);
    
    for i = 1:n % iterating the adjacency list
        for j = 1:count(i)
            stm(i,stal{i,j}) = 1; % storing the adjacency matrix
        end
    end

end

