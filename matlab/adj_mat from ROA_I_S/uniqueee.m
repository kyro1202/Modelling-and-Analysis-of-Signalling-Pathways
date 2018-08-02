%% Aim :- to find all the unique states(column) from the matrix

%load('data_total.mat');

n = 4800;
ants = zeros(423,50000); % assuming the total number of states will be less than 50000 at max
ct = 1;

for i=1:4800
    t = total{1,i}; % the matrix at the cell
    m = size(t,2);
    for j=1:m
        if(isempty(find(~any(bsxfun(@minus, ants(:,1:ct),t(:,j))),1)) == 1)%if we can't find this column in already visited columns
            ants(:,ct) = t(:,j);
            ct = ct + 1;
            if(ct > 50000) % size overflow
                disp(i); disp(j);
                break;
            end
        end
    end
end


        