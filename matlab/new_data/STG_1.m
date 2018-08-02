%RANDOM ORDER ASYNCHRONOUS
tic
ROAfpdb = zeros(423,1); %initialize databases
ROAcydb = zeros(423,1);
ROAfpdb2 = zeros(423,1);
ROAcydb2 = zeros(423,1);
ROAcydb3= zeros(423,1);
ROAcylength = zeros(1,1);
cutoffsize=5000;        % switch to database 2 after this size

ROAcy_I_S={};
ROAfp_I_S={};

fps=1;
cylcs=1;

for i=1:800
%Random Order Asynchronous update, Randomized some nodes, some nodes known to be ON
%initially
clear s
       
% Boolean Simulation                                                 

stg=zeros(423,1);       %State Transition Graph
input=INPUT{1,i}(:,1); %initial condition
order = zeros(423,1);
stg(:,1) = input;
var=1;

    for j=1:300
        t=j;
        order = randperm(423); %a random order is generated at each time step
        Node1= feval(@ROA, stg(:,j),order, t);              % update step
        
        if Node1==stg(:,j)                                  % if s(t+1) = s(t) i.e. if fixed point attractor reached
        var=var+1;
        if var==30
            ROAfp_I_S{i}= stg;
            save('ROAinputsteadystate', 'ROAfp_I_S')
            if (ismember(Node1',ROAfpdb','rows')==0)&&(ismember(Node1',ROAfpdb2','rows')==0)      %filter for repeated attractor
                save('fpcount','fps')
                fps=fps+1;
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
        end
        %if not steady state, check for cycle
        if j>1                                  % check if s(t+1) is a point already reached in this trajectory. i.e. if it is a cycle
            if Node1 ~= stg(:,j)
            for k=1:j-1
                if norm(Node1-stg(:,k))==0
                    s=1;                    % marker to break loop
                    l=j-k+1; % length of cycle

         %sprintf('limit cycle l = %d',j-k+1)

                    cycle = stg(:,k:j);         % n x l matrix of l cyclic attractor states
                    ROAcy_I_S{i}= stg;                   
                    save('ROAinputsteadystate2', 'ROAcy_I_S')
                    
                        if (ismember(Node1',ROAcydb','rows')==0)&&(ismember(Node1',ROAcydb2','rows')==0)      %filter for repeated cycles
                            save('cylcount','cylcs')
                            cylcs=cylcs+1;
                            
                            if size(ROAcydb,2)<cutoffsize
                            ROAcydb(:,(end+1):(end+l))= cycle;     % save cycle to database
                            ROAcydb(:,end+1)=zeros(423,1);           % separate 2 cycles by a vector of zeros
                            ROAcylength(end+1)=j-k+1;
                            save('ROA cycle database','ROAcydb')
                            elseif size(ROAcydb2,2)<cutoffsize
                                ROAcydb2(:,(end+1):(end+l))= cycle;
                                ROAcydb2(:,end+1)=zeros(423,1);
                                ROAcylength=[ROAcylength; j-k+1];
                                save('ROA cycle database 2','ROAcydb2')
                            else
                                ROAcydb3(:,(end+1):(end+l))= cycle;
                                ROAcydb3(:,end+1)=zeros(423,1);
                                ROAcylength=[ROAcylength; j-k+1];
                                save('ROA cycle database 3','ROAcydb3')
                            end
                        end
                        

                    break
                 end
            end
            end
        end
              
            if exist('s','var')==1
                break
            end
        
            stg(:,j+1)=Node1;           % for next iteration if none of the above conditions are met
% z=1:530; plot(z, stg(:,j)-Node1, 's')

    end
    A{i}=stg;
end

% fpdb(:,1)=[];
% fpdb2(:,1)=[];

toc

% fpdb(:,1)=[];
% M=mean(fpdb,2);
% find(M==0)