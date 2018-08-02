%% Initialization
% Utility for the target distribution to be used in sampling through
% metropolis algorithm
S = [0.1195    0.2035    0.2282    0.0783    0.0372    0.0269    0.3064];
p            = @(t) S(t); % target distribution
% function which returns the number of iterations required for a particular
% alpha and beta
num_iter     = @(alpha,beta) ceil((alpha*beta*(2 - alpha - beta) / (alpha + beta)^3) * ((1.96/0.05)^2));
% function which returns the burn in period required for a particular
% alpha and beta
burn_in      = @(alpha,beta) ceil((log(0.001*(alpha + beta) / max(alpha,beta))) / (log(1 - alpha - beta)));

Steady_State = zeros(1,10000);

for si=1:10000
    
    tran_a_to_b = 0;          % total transitions from state a to b
    tran_b_to_a = 0;          % total transitions from state b to a
    total_tran = 0;           % total transitions
    total_a = 0;              % total transitions from state a
    total_b = 0;              % total transitions from state b
    local_tran = 0;           % transitions in a particular loop
    current_meta_state = 0;   % current state in 2 state markov chain
    previous_meta_state = 1;  % previous state in 2 state markov chain
    current_state = 1;        % current state in normal markov chain

    n = 0;
    Result{1,1} = previous_meta_state; % Stores the states in meta state format
    States{1,1} = current_state;       % Stores the states in normal markov chain format

    %% Initial estimation of alpha and beta
    % atleast 3 transitions from a to b and 3 transitions from b to a are
    % required 
    while(tran_a_to_b < 3 || tran_b_to_a < 3)
        n = n + 2136;
        while(local_tran < n)
            % metropolis algorithm
            prop_state = prop(current_state);
            acc     = p(prop_state)/p(current_state);
            if rand <= min(acc,1)
                current_state = prop_state;
                States{1,total_tran+1} = prop_state;
            else
                States{1,total_tran+1} = current_state;
            end

            % converting normal state to meta state
            if(isKthBitSet(current_state,2) && ~isKthBitSet(current_state,1) && isKthBitSet(current_state,3))
                current_meta_state = 1;
            else
                current_meta_state = 0;
            end

            % updating the variables
            if(previous_meta_state == 0 && current_meta_state == 1)
                tran_a_to_b = tran_a_to_b + 1;
            end
            if(previous_meta_state == 1 && current_meta_state == 0)
                tran_b_to_a = tran_b_to_a + 1;
            end
            total_tran = total_tran + 1;
            if(previous_meta_state == 0)
                total_a = total_a + 1;
            else
                total_b = total_b + 1;
            end

            % Storing the Result
            Result{1,total_tran+1} = current_meta_state;
            local_tran = local_tran + 1;
            previous_meta_state = current_meta_state;
        end
    end

    % Calculation for alpha and beta
    alpha = tran_a_to_b/total_a;
    beta = tran_b_to_a/total_b;

    % Calculation for N and M
    N = num_iter(alpha,beta);
    M = burn_in(alpha,beta);
    if(alpha+beta >= 1)
        M = 2;
    end

    %% Main loop
    % loop runs untill the value of N+M is smaller than the total transitions
    while(total_tran < N+M)

        while(total_tran < N+M)
            % metropolis algorithm
            prop_state = prop(current_state);
            acc     = p(prop_state)/p(current_state);
            if rand <= min(acc,1)
                current_state = prop_state;
            end

            % converting into meta state
            if(isKthBitSet(current_state,2) && ~isKthBitSet(current_state,1) && isKthBitSet(current_state,3))
                current_meta_state = 1;
            else
                current_meta_state = 0;
            end

            % updating parameters and storing the results
            total_tran = total_tran + 1;
            Result{1,total_tran+1} = current_meta_state;
            local_tran = local_tran + 1;
            previous_meta_state = current_meta_state;
        end

        % Resetting the variables
        tran_a_to_b = 0; tran_b_to_a = 0; total_a = 0; total_b = 0;
        % updating the variables for recalculation of alpha and beta
        for i = M:N
            if(Result{1,i-1} == 0 && Result{1,i} == 1)
                tran_a_to_b = tran_a_to_b + 1;
            end
            if(Result{1,i-1} == 1 && Result{1,i} == 0)
                tran_b_to_a = tran_b_to_a + 1;
            end
            if(Result{1,i-1} == 0)
                total_a = total_a + 1;
            else
                total_b = total_b + 1;
            end
        end

        % Calculation for alpha and beta
        alpha = tran_a_to_b/total_a;
        beta = tran_b_to_a/total_b;

        % Recalculating M and N for the updated alpha and beta 
        N = num_iter(alpha,beta);
        M = burn_in(alpha,beta);
        if(alpha+beta >= 1)
            M = 2;
        end

        %disp(N); disp(M); disp(total_tran); % for debugging purposes
    end

    %% Final Evaluation
    % Resetting the variables
    tran_a_to_b = 0; tran_b_to_a = 0; total_a = 0; total_b = 0;
    % Updating the variables according to the final N and M
    for i = M:max(N,2136)
        if(Result{1,i-1} == 0 && Result{1,i} == 1)
            tran_a_to_b = tran_a_to_b + 1;
        end
        if(Result{1,i-1} == 1 && Result{1,i} == 0)
            tran_b_to_a = tran_b_to_a + 1;
        end
        if(Result{1,i-1} == 0)
            total_a = total_a + 1;
        else
            total_b = total_b + 1;
        end
    end

    % Calculation for alpha and beta
    alpha = tran_a_to_b/total_a;
    beta = tran_b_to_a/total_b;

    % Calculation for Steady State    
    Steady_State(1,si) = alpha / (alpha + beta);
    disp(Steady_State(1,si));
end

%% Plot
plot(1:10000,Steady_State(1,1:10000));

