%% AIM - to see the relationship between perturbation probability and the number of iterations required to reach Steady State

% The process of introducing perturbations can be simplified - perturb.m

% State transition Matrix (8*8)
A = zeros(8);
A(1,6) = 1;A(2,2) = 1;A(3,6) = 1;A(4,2) = 1;A(5,5) = 1;A(6,3) = 1;A(7,5) = 1;A(8,3) = 1;

%perturbation probability
p = 0.01:0.01:0.99;

%stores the hamming distance between the states
hamdist = zeros(8);

%decimal to binary
d2b = de2bi(0:7);

%calculating the hamming distance
for i = 1:8
    for j = i:8
        c = 0;
        for k = 1:3
            if(d2b(i,k) ~= d2b(j,k))
                c = c+1;
            end
        end
        hamdist(i,j) = c;
        hamdist(j,i) = c;
    end
end

Result = zeros(1,size(p,2));

for t = 1:size(p,2)
    %S stores the current concentration of states
    S = 0.125*ones(1,8); S(1) = 1;

    %S_prev stores the previous concentration of states
    S_prev = S;

    %to store the number of iteration
    n = 0;
    pt = p(t);
    while(n < 100000)
        n = n + 1;
        S_prev = S;
        S = S*A;
        temp = (S-S_prev).^2;
        if(sum(temp) <= 1e-8)
            Result(t) = n; 
            break;
        end

        %updating A according to the perturbation probability
        for i = 1:8
            for j = 1:8
                if(i ~= j)
                    A(i,j) = A(i,j)*(1-pt^3) + (pt^hamdist(i,j) * (1-pt)^(3-hamdist(i,j)));
                else
                    A(i,j) = A(i,j)*(1-pt^3);
                end
            end
        end

        %updating A such that column sum is one
        As = sum(A,2);
        for i = 1:8
            A(i,:) = A(i,:)./As(i);
        end
    end

    if(n > 99999)
        Result(t) = 100000;
    end
end

% to plot the final perturbation probability vs n graph
plot(p,Result);
title('perturbation probability vs n');
xlabel('iteration at which steady state was found');
ylabel('perturbation probability');