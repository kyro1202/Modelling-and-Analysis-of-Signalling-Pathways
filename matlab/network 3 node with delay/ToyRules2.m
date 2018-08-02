function out = ToyRules2(States,ind,delay)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
% Node1 = zeros(1,length(Node));
% Node1(1)= Node(2);
% Node1(2)= Node(1) & (~Node(3));
% Node1(3)= Node(2);
% out = Node1';

out = States;
out(:,ind) = States(:,mod(ind-2,3)+1); %for now out(ind) is same as states(ind-1)

% A
out(1,ind) = States(2,mod(ind-2,3)+1); %no delay, depends on ind-1

% B
if(delay > 0)
    out(2,ind) = (States(1,mod(ind,3)+1) && (~States(3,mod(ind,3)+1))); %delay of 1, depends on ind-2
end

% C
if(delay > 1)
    out(3,ind) = States(2,ind); %delay of 2, depends on ind-3
end

end