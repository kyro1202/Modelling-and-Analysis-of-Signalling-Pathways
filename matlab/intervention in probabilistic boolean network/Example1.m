% State transition Matrix (8*8)
A = [1 0 0 0 0 0 0 0;
    0.0 0 0.000 0.0 0.000 0.0 1 0.000;
    0.00 0.000 0 0.0 0.000 0.00000 1 0.000;
    0.2 0.2 0.0 0 0.3 0.3 0.000 0.0;
    0.0 0.000 1 0.00000 0 0.0 0.0 0.000;
    0.000 0.0 0.00000 0.000 0.0 0 0.5 0.5;
    0.000 0.00000 0.0 0.000 0.5 0.5 0 0.0;
    0.00000 0.000 0.000 0.0 0.000 0.0 0.0 1];

%perturbation probability 
p = 0.01;

%stores the hamming distance
hamdist = zeros(8);

%decimal to binary
d2b = de2bi(0:7);

%calculating the hamming distance
for i = 1:8
    for j = i:8
        c = sum(abs(d2b(i,:) - d2b(j,:)));        
        hamdist(i,j) = c;
        hamdist(j,i) = c;
    end
end

%modifying A according to the perturbation probability
pstp = A*((1-p)^3);
temp = 3-hamdist;
P = (p.^hamdist).*((1-p).^(temp));
P(1:9:end) = 0;
pstp = pstp + P;
A = pstp;

% no need for this step
%modifying A such that every column adds to 1
%As = sum(A,2);
%for i = 1:8
 %   A(i,:) = A(i,:)./As(i);
%end

%memo stores the values of already calculated Fk
global memo;
memo = -1*ones(8,8,20);
memo(:,:,1) = A; %Fk with k == 1 is equal to A

k0 = 1:20;
h0 = zeros(3,20);
for i = 1:20
    [h0(1,i),memo] = F_k(memo,A,i,4,1); %stores the Fk values for state 4
    [h0(2,i),memo] = F_k(memo,A,i,6,1); %stores the Fk values for state 5
    [h0(3,i),memo] = F_k(memo,A,i,7,1); %stores the Fk values for state 6
end

%for real h0 values we need the cummulative sum of Fk values

h0 = cumsum(h0,2);

% plot shows highest probability of going from state 8 to 1 is to perturb
% gene 3
plot(k0,h0(1,:),k0,h0(2,:),k0,h0(3,:));
title('Graph of Hk0(x,y) for states 4,6,7 with k0 varying from 1 to 20');
xlabel('K0');
ylabel('H0(x,y) values for respective K0');
legend('for state 4','for state 6','for state 7');