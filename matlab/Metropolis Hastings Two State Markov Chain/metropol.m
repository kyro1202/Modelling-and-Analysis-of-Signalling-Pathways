%% Initial data

S = [0.1195    0.2035    0.2282    0.0783    0.0372    0.0269    0.3064];
% Distributions 
p            = @(t) S(t);       % Target "PDF"
                     
% Parameters
N        = 100000;              % Number of samples (iterations)           
theta    = zeros(1,N);          % Samples drawn form the target "PDF"        
theta(1) = 7;                   % Initial state of the chain
count = zeros(1,7);
%% Procedure
for i = 1:N
    count(theta(i)) = count(theta(i)) + 1;
    theta_ast = prop(theta(i));            % Sampling from the proposal PDF
    alpha     = p(theta_ast)/p(theta(i));  % for acceptance probability 
    if rand <= min(alpha,1)
      % Accept the sample with prob = min(alpha,1)
      theta(i+1) = theta_ast;
    else
      % Reject the sample with prob = 1 - min(alpha,1)
      theta(i+1) = theta(i);
    end
end

%% Plots

subplot(2,1,1);
histogram(theta(1,1:N));
title('Metropolis Sample');
subplot(2,1,2);
plot(S);
title('Steady State via Transition Matrix');
count = count/N;
disp(count);

