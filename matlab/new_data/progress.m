% program returns upto which state the path taken by different simulations
% were same

Result = zeros(5,800);

for i=1:800    
    for j=1:5
        k = 1;
        while(k <= size(total{1,i+j*800},2) && k <= size(input{1,i},2))
            if(sum(total{1,i+j*800}(:,k) == input{1,i}(:,k)) ~= 423) % if the columns are not same - break
                break;
            end
            k = k+1; % else increase k by 1
        end
        Result(j,i) = k;
    end
end

    
    