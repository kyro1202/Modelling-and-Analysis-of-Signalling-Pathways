 %RANDOM ORDER ASYNCHRONOUS
tic
ROAfpdb = zeros(3,1); %initialize databases
ROAcydb = zeros(3,1);
ROAfpdb2 = zeros(3,1);
ROAcydb2 = zeros(3,1);
ROAcydb3= zeros(3,1);
ROAcylength = zeros(1,1);
cutoffsize=500;        % switch to database 2 after this size
load('StateSpace');
rules= [];

for i=1:2^3
%Random Order Asynchronous update, Randomized some nodes, some nodes known to be ON
%initially
clear s
       
% Boolean Simulation                                                 

States = zeros(3,3); %to store 3 consecutive states
ind = 2; %starting index (ind ~= 1 because states stores input at 1)
initial_delay = 0;
stg=zeros(3,1);       %State Transition Graph
%input=feval(@initializenetwork, stg(i,:), order); %initial condition
order = zeros(3,1);
stg(:,1) = nn(i,:)';
States(:,1) = nn(i,:)'; %input
rules(1,:)= stg(:,1);

    for j=1:30
        order = randperm(3); %a random order is generated at each time step
        % Node1= feval(@ROA2, stg(:,j),order);              % update step
        States = feval(@ToyRules2,States,ind,initial_delay); %new state of nodes
        Node1 = States(:,ind);
        ind = ind + 1; %increasing index
        if(ind == 4)
            ind = 1; %to prevent overflow
        end
        initial_delay = initial_delay + 1;
        if(initial_delay > 4) %once delay > 4 it will always remain 4
            initial_delay = 4; %to prevent overflow
        end
        if Node1==stg(:,j)                                  % if s(t+1) = s(t) i.e. if fixed point attractor reached
            if (ismember(Node1',ROAfpdb','rows')==0)&&(ismember(Node1',ROAfpdb2','rows')==0)      %filter for repeated attractor
                if size(ROAfpdb,2)<cutoffsize
                    i1= size(ROAfpdb,2)+1;
                    ROAfpdb(:,i1) = Node1;     % save attractor to database
                    save('ROAfixedpointdatabase','ROAfpdb')
                                
                else
                    i1= size(ROAfpdb2,2)+1;
                    ROAfpdb2(:,i1) = Node1;
                    save('ROAfixedpointdatabase 2','ROAfpdb2')
                                      
                end
                
            end
        %sprintf('steady state')

            abstime(i) = j;
            break %break main (for j=1:100) loop
        end
        
        %if not steady state, check for cycle
        if j>1                                  % check if s(t+1) is a point already reached in this trajectory. i.e. if it is a cycle
            for k=1:j-1
                if norm(Node1-stg(:,k))==0
                    s=1;                    % marker to break loop
                    l=j-k+1; % length of cycle

         %sprintf('limit cycle l = %d',j-k+1)

                    cycle = stg(:,k:j);         % n x l matrix of l cyclic attractor states
                                       
                    
                        if (ismember(Node1',ROAcydb','rows')==0)&&(ismember(Node1',ROAcydb2','rows')==0)      %filter for repeated cycles
                            if size(ROAcydb,2)<cutoffsize
                            ROAcydb(:,(end+1):(end+l))= cycle;     % save cycle to database
                            ROAcydb(:,end+1)=zeros(3,1);           % separate 2 cycles by a vector of zeros
                            ROAcylength(end+1)=j-k+1;
                            save('ROA cycle database','ROAcydb')
                            elseif size(ROAcydb2,2)<cutoffsize
                                ROAcydb2(:,(end+1):(end+l))= cycle;
                                ROAcydb2(:,end+1)=zeros(3,1);
                                ROAcylength=[ROAcylength; j-k+1];
                                save('ROA cycle database 2','ROAcydb2')
                            else
                                ROAcydb3(:,(end+1):(end+l))= cycle;
                                ROAcydb3(:,end+1)=zeros(3,1);
                                ROAcylength=[ROAcylength; j-k+1];
                                save('ROA cycle database 3','ROAcydb3')
                            end
                        end
                        

                    break
                 end
            end
        end
            if exist('s','var')==1
                break
            end

            stg(:,j+1)=Node1;           % for next iteration if none of the above conditions are met
% z=1:530; plot(z, stg(:,j)-Node1, 's')
            rules(j+1,:)= stg(:,j+1);

    end
    A{i}=rules;
end

% fpdb(:,1)=[];
% fpdb2(:,1)=[];

toc

% fpdb(:,1)=[];
% M=mean(fpdb,2);
% find(M==0)







%  %RANDOM ORDER ASYNCHRONOUS
% tic
% ROAfpdb = zeros(11,1); %initialize databases
% ROAcydb = zeros(11,1);
% ROAfpdb2 = zeros(11,1);
% ROAcydb2 = zeros(11,1);
% ROAcydb3= zeros(11,1);
% ROAcylength = zeros(1,1);
% cutoffsize=5000;        % switch to database 2 after this size
% 
% load('StateSpace')
% 
% for i=1:2^11
% %Random Order Asynchronous update, Randomized some nodes, some nodes known to be ON
% %initially
% clear s
%        
% % Boolean Simulation                                                 
% 
% stg=zeros(11,1);       %State Transition Graph
% input=nn(i,:)'; %initial condition
% order = zeros(11,1);
% stg(:,1) = input;
% 
%     for j=1:100
%         order = randperm(11); %a random order is generated at each time step
%         Node1= feval(@ToyRules,stg(:,j));              % update step
%         if Node1==stg(:,j)                                  % if s(t+1) = s(t) i.e. if fixed point attractor reached
%             if (ismember(Node1',ROAfpdb','rows')==0)&&(ismember(Node1',ROAfpdb2','rows')==0)      %filter for repeated attractor
%                 if size(ROAfpdb,2)<cutoffsize
%                     i1= size(ROAfpdb,2)+1;
%                     ROAfpdb(:,i1) = Node1;     % save attractor to database
%                     save('ROAfixedpointdatabase','ROAfpdb')
%                                 
%                 else
%                     i1= size(ROAfpdb2,2)+1;
%                     ROAfpdb2(:,i1) = Node1;
%                     save('ROAfixedpointdatabase 2','ROAfpdb2')
%                                       
%                 end
%                 
%             end
%         %sprintf('steady state')
% 
%             abstime(i) = j;
%             break %break main (for j=1:100) loop
%         end
%         
%         %if not steady state, check for cycle
%         if j>1                                  % check if s(t+1) is a point already reached in this trajectory. i.e. if it is a cycle
%             for k=1:j-1
%                 if norm(Node1-stg(:,k))==0
%                     s=1;                    % marker to break loop
%                     l=j-k+1; % length of cycle
% 
%          %sprintf('limit cycle l = %d',j-k+1)
% 
%                     cycle = stg(:,k:j);         % n x l matrix of l cyclic attractor states
%                                        
%                     
%                         if (ismember(Node1',ROAcydb','rows')==0)&&(ismember(Node1',ROAcydb2','rows')==0)      %filter for repeated cycles
%                             if size(ROAcydb,2)<cutoffsize
%                             ROAcydb(:,(end+1):(end+l))= cycle;     % save cycle to database
%                             ROAcydb(:,end)=zeros(11,1);           % separate 2 cycles by a vector of zeros
%                             ROAcylength(end+1)=j-k+1;
%                             save('ROA cycle database','ROAcydb')
%                             elseif size(ROAcydb2,2)<cutoffsize
%                                 ROAcydb2(:,(end+1):(end+l))= cycle;
%                                 ROAcydb2(:,end)=zeros(11,1);
%                                 ROAcylength=[ROAcylength; j-k+1];
%                                 save('ROA cycle database 2','ROAcydb2')
%                             else
%                                 ROAcydb3(:,(end+1):(end+l))= cycle;
%                                 ROAcydb3(:,end)=zeros(11,1);
%                                 ROAcylength=[ROAcylength; j-k+1];
%                                 save('ROA cycle database 3','ROAcydb3')
%                             end
%                         end
%                         
% 
%                     break
%                  end
%             end
%         end
%             if exist('s','var')==1
%                 break
%             end
% 
%             stg(:,j+1)=Node1;           % for next iteration if none of the above conditions are met
% % z=1:530; plot(z, stg(:,j)-Node1, 's')
% 
%     end
% end
% 
% % fpdb(:,1)=[];
% % fpdb2(:,1)=[];
% 
% toc
% 
% % fpdb(:,1)=[];
% % M=mean(fpdb,2);
% % find(M==0)