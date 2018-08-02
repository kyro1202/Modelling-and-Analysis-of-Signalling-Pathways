function tot = countallpathsadj_mat( s,d,A,n ) %uses adjacency matrix
%COUNTALLPATHS returns the total number of paths from s to d
%   the function uses depth first search to count all 
%   possible paths from s to d
    tot = 0;
    visited = zeros(1,n); %to keep track of visited nodes
    
    for i=1:n
        if(A(s,i) == 1 && visited(i) == 0)
            [tot,visited] = util2(i,visited,d,n,A,tot); % simple dfs
        end
    end

end

