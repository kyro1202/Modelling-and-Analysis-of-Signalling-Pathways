%% To calculate the steady state distribution of every state

%load('STAL2STP','stp');     % loading the state transition probabilities

n = size(stp,1);            % number of states
Steady_State_distribution = zeros(1,n); %this will store the Steady State distribution of the states

for i = 1:n
    Steady_State_distribution(i) = twostatedtmcconverge(stp,i); % calling twostatedtmcconverge 
end

save('STEADY STATE DISTRIBUTION','Steady_State_distribution');  % saving the steady state distribution