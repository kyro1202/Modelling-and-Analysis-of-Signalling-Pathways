function on = isKthBitSet( n,k )
% Function checks whether the k(th) bit of n is on or off
    if (bitand(n-1,bitsll(1,(k - 1))))
        on = 1;
    else
        on = 0;
    end
end