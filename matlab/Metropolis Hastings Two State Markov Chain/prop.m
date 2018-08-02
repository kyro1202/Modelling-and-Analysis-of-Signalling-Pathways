function s = prop( a )
%PROP propasal distribution in mcmc methods
%   Function returns the next/previous state with probability 0.5 each
    if(rand() < 0.5)
        s = a-1;
        if(s == 0)
            s = 7;
        end
    else
        s = a + 1;
        if(s == 8)
            s = 1;
        end
    end
end

