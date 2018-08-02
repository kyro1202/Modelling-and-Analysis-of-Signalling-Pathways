n = 3;                              % number of nodes
nodestate = zeros(1,n);             % stores the current state of nodes

% boolean rules of update 
rule{1} = @(x) ~x(1,3);
rule{2} = @(x) x(1,1) && x(1,3);
rule{3} = @(x) ~x(1,1);

adj_list = {};                      % adjacency list
count = zeros(1,bitsll(1,n));       % stores the count of neighbours of every node

for i = 1:bitsll(1,n)                                   % bitsll(1,n) = total number of states
    state_from = i;                                     % current state                
    nodestate = de2bi(state_from-1,n);                  % decimal to binary
    temp2 = zeros(1,n);                                 % for next state
    for j = 1:n
        temp2(j) = rule{j}(nodestate);                  % updating temp2 according to the rules                      
    end
    state_to = bi2de(temp2) + 1;                        % binary to decimal
    count(1,state_from) = count(1,state_from) + 1;      % updating the count
    adj_list{state_from,count(1,state_from)} = state_to;% updating the adjacency list
end

save('RULES2STAL','adj_list','count');  % saving the adj_list and count