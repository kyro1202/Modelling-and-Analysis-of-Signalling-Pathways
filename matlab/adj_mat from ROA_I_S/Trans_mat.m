% Function returns adjacency matrix from the given data
% load('800_run_new_new_rules.mat','A');
% load('data2');
% load('Map2');

adj_mat = zeros(70);

for i = 1:6
    for j = 1:size(total{1,8+(i-1)*800},2)-1  % we process the last column separately 
        temp1 = total{1,8+(i-1)*800}(:,j); % there is an edge between two consecutive columns
        temp2 = total{1,8+(i-1)*800}(:,j+1);
        temp1 = temp1'; % converting the column to row vector 
        temp2 = temp2';
        temp1 = mat2str(temp1); % converting the row vector into a string
        temp2 = mat2str(temp2);
        % Map M is used to provide a unique identity to every state
        adj_mat(M(temp1),M(temp2)) = 1; % edge between every consecutive columns
    end
    temp1 = total{1,8+(i-1)*800}(:,size(total{1,8+(i-1)*800},2)); %last column is connected to itself
    temp1 = temp1'; %edge from this state to its self
    temp1 = mat2str(temp1); %last state is an attractor
    adj_mat(M(temp1),M(temp1)) = 1;
end
 
% save('output2','uniq','adj_mat','M','-v7.3');

