function tot = countallpaths( s,d,A,n,count ) %uses adjacency list
%COUNTALLPATHS returns the total number of paths from s to d
%   the function uses depth first search to count all 
%   possible paths from s to d
    tot = 0;
    visited = zeros(1,n); % to keep track of already visited node
    visited(s) = 1; % source 

    i = 1;
    while(i <= count(s))
        %tic();
        [tot,visited] = dfs(A{s,i},visited,d,n,A,tot,count); % simple dfs from source
        i = i+1;
        %toc();
    end

end

