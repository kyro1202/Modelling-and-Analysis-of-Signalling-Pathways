% program compares whether we reach the same attractors from the same input
% or not

ct = 0;
for i=1:800
    if(isempty(find(~any(bsxfun(@minus, attractors,fifth{1,i}(:,size(fifth{1,i},2)))),1)) == 0)
        ct = ct + 1;
    end
end
% 
% fifth = ROAfp_I_S;
% save('RESULTS','fifth','-append');


% attractors = zeros(423,800);
% for i=1:800
%     attractors(:,i) = INPUT{1,i}(:,size(INPUT{1,i},2));
% end