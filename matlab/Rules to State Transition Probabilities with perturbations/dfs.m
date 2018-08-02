function [tot,visited] = dfs( id,visited,d,n,A,tot,count )
%DSF depth first search
%   utility function for countallpaths
    visited(id) = 1; % marking the current node visited so that we dont count it again
    if(id == d) %if we reach the destination total is increased 
        %disp(path(1:ind));
        tot = tot+1;
    else
        i = 1;
        while(i <= count(id)) %visiting every unvisited vertex of id
            if(visited(A{id,i}) == 0)
                [tot,visited] = dfs(A{id,i},visited,d,n,A,tot,count); %calling dfs from the current node
            end
            i = i + 1;
        end
    end
    visited(id) = 0; % marking the node unvisited so that it can be used in other paths
end

