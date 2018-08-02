function [f,memo] = F_k( memo,A,k,s,d )
%Fk(s, d) returns the probability that starting in state s, the first time the
%PBN will reach some given state d will be at time k
%   for k == 1, Fk = A
    if(k == 1)
        f = A(s,d);
    else
        f = 0;
        for z = 1:8 %for all possible states
            if(z ~= d) %other than d  
                %d is already included in the Fk function with k = k-1
                if(memo(z,d,k-1) == -1) 
                    [temp,memo] = F_k(memo,A,k-1,z,d);
                    f = f + A(s,z)*temp;
                else %if we have already calculated this F(k) value
                    f = f + A(s,z)*memo(z,d,k-1);
                end
            end
        end
        memo(s,d,k) = f;
    end
end


