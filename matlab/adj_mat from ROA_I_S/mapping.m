% load('data2');

M = containers.Map;
% M maps all the unique states of the network to a unique integer

for i=1:ct-1
    temp = ants(:,i);
    temp = temp'; % to convert the column vector into row vector
    temp = mat2str(temp); % converting the row into a string
    M(temp) = i; % mapping the string to its identity number
end

