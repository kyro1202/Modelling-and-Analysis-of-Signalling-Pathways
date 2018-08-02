%load('output2.mat');
%load('TRAN_PROB_30093.mat');
%load('HAMMING_DIST_30093.mat');
%load('STP_CONNECTED_COMPONENTS2.mat');
%load('COMPONENTS2.mat');
ham = zeros(1067);
p = 0.1;

% Aim - To introduce perturbations in the transition matrix
%disp('1');
% pstp = perturbed state transition probability
pstp = stp_connected_comp{1,11}*((1-p)^423); % multiplying the transition matrix with (1-p)^n
%disp('0');
for i = 1:1067 %calculating the hamming distance between every state
    for j = i+1:1067
        c = sum(abs(uniq(:,components{11,i}) - uniq(k,components{11,j}))); % for hamming distance
        ham(i,j) = c;
        ham(j,i) = c;
    end
end
% save('HAMMING_DIST_10652.mat','ham','-v7.3');

temp = 423-ham;
%disp('0');
P = (p.^ham).*((1-p).^(temp)); % The perturbation factor
%disp('0');
P(1:1068:end) = 0; % Perturbation factor for the main diagonal elements is zero
%disp('0');
pstp = pstp + P; % adding the perturbation factor to the state transition matrix



%save('PERTURB_10652_STP','pstp','-v7.3');