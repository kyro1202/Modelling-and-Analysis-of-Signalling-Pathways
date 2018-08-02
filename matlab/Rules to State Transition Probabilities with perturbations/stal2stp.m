load('RULES2STAL');     % loading the adjacency list

perturbations = 0;      % 1 for perturbations 
n = size(adj_list,1);   % n = number of states

stp = zeros(n);         % stp = state transition matrix
for i = 1:n
    totalpaths = 0;                                     % total paths from state i to every other state
    for j = 1:n
        stp(i,j) = countallpaths(i,j,adj_list,n,count); % for all possible paths between state i to state j
        totalpaths = totalpaths + stp(i,j);             % updating total paths
    end
    for j = 1:n
        stp(i,j) = stp(i,j) / totalpaths;               % stp(i,j) = paths between i and j / total paths
    end
end

if(perturbations == 1)      % if we want perturbations 
    p = 0.0;                % perturbation probability
    e = log(n)/log(2);      % number of nodes
    
    %stores the hamming distance between the nodes
    hamdist = zeros(n);

    %decimal to binary
    d2b = de2bi(0:n-1);

%   The perturbation process can be vectorised - see perturb.m
    
    %calculating the hamming distance
    for i = 1:n
        for j = i:n
            c = 0;
            for k = 1:e
                if(d2b(i,k) ~= d2b(j,k))
                    c = c+1;
                end
            end
            hamdist(i,j) = c;
            hamdist(j,i) = c;
        end
    end

    %updating the transition matrix according to p
    for i = 1:n
        for j = 1:n
            if(i ~= j)
                stp(i,j) = stp(i,j)*(1-p)^e + (p^hamdist(i,j) * (1-p)^(e-hamdist(i,j)));
            else
                stp(i,j) = stp(i,j)*(1-p)^e;
            end
        end
    end

    %updating A such that column sum is one
    As = sum(A,2);
    for i = 1:n
        stp(i,:) = stp(i,:)./As(i);
    end
end

save('STAL2STP','stp');     % saving the transition matrix in STAL2STP