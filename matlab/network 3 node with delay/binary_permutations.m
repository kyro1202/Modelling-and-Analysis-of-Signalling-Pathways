% x = 6; %number of nodes
% nn = zeros(1,x);
% for i = 1:2^x
%     a = dec2bin(i-1);
%     n = [];
%     k=x;
%     j= length(a);
%     while j>=1
%      n(k)= str2num(a(j));
%      k=k-1;
%      j=j-1;
%     end 
%     nn(i,:)=n;
% end
% save('StateSpace.mat','nn');        


% clear all
% close all
% clc
% 
% x = 3; %number of nodes
% nn = zeros(1,x);
% for i = 1:2^x
%     a = dec2bin(i-1);
%     n = [];
%     k=x;
%     j= length(a);
%     while j>=1
%      n(k)= str2num(a(j));
%      k=k-1;
%      j=j-1;
%     end 
%     nn(i,:)=n;
% end
% save('StateSpace.mat','nn'); 





clear all
close all
clc



x = 3; %number of nodes
nn = zeros(1,x);
for i = 1:2^x
    a = dec2bin(i-1);
    n = [];
    k=x;
    j= length(a);
    while j>=1
     n(k)= str2num(a(j));
     k=k-1;
     j=j-1;
    end 
    nn(i,:)=n;
end
save('StateSpace.mat','nn'); 



% clear all
% close all
% clc



% x = 17; %number of nodes
% nn = zeros(1,x);
% for i = 1:2^x
%     a = dec2bin(i-1);
%     n = [];
%     k=x;
%     j= length(a);
%     while j>=1
%      n(k)= str2num(a(j));
%      k=k-1;
%      j=j-1;
%     end 
%     nn(i,:)=n;
% end
% save('StateSpace.mat','nn'); 

