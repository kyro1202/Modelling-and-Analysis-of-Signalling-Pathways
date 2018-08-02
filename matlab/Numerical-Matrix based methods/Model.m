%State Transition Matrix
A = zeros(8);
A(1,6) = 1; A(2,2) = 1; A(3,6) = 1; A(4,2) = 1; A(5,5) = 1; A(6,3) = 1; A(7,5) = 1; A(8,3) =1;

%perturbation probability
p = 0.01;

%stores the hamming distance between the nodes
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


%S stores the current probabilities of states
S = zeros(1,8); S(1) = 1;  

%S_prev stores the previous probabilities of states
S_prev = S;

%to store the number of iterations
n = 0;

%updating the transition matrix according to p
pstp = A*((1-p)^3);
temp = 3-hamdist;
P = (p.^hamdist).*((1-p).^(temp));
P(1:9:end) = 0;
pstp = pstp + P;
A = pstp;
%updating A such that column sum is one
%{
As = sum(A,2);
for i = 1:8
    A(i,:) = A(i,:)./As(i);
end
%}

while(n < 100000)
    n = n + 1;
    S_prev = S;
    S = S*A;
    temp = (S-S_prev).^2;
    if(sum(temp) <= 1e-8)
        disp(S);
        break;
    end
end