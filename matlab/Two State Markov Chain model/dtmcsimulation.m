load('STAL2STP');       % loading the state transition matrix

chain_length = 10000;   % length of the random walk
starting_value = 4;     % starting value of the walk (can be any state)
chain = zeros(1,chain_length); % to store the states obtained
chain(1)=starting_value;
for i=2:chain_length
    this_step_distribution = stp(chain(i-1),:); % state transition probabilities of this state 
    cumulative_distribution = cumsum(this_step_distribution); % cummulative sum row wise
    r = rand();
    chain(i) = find(cumulative_distribution>r,1);
end

%% Plots for the random walk
subplot(2,1,1);
plot(chain);
subplot(2,1,2);
histogram(chain);