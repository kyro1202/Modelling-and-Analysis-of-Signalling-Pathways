function [tot,visited] = util2( id,visited,d,n,A,tot )
%DSF depth first search
%   utility function for countallpaths by using adjacency matrix
    visited(id) = 1; % marking the node visited for current path
    if(id == d) %if destination is found total is increased by one
        %disp(path(1:ind));
        tot = tot+1;
    else
        for i=1:n %try exploring every neighbour of id
            if(A(id,i) == 1 && visited(i) == 0)
                [tot,visited] = util2(i,visited,d,n,A,tot);
            end
        end
    end
    visited(id) = 0; % marking the node unvisited so that it can used in other paths
end

