function out=initializenetwork()

% initializes a vector of length 331 first to zeros. Identifies Endogenous
% nodes and initializes them to 1. For the rest of the
% non-endogenous nodes, randomly assigns a value of 0 or 1.

load('housekeeping_nodes');


Node = zeros(423,1);
non_up_node=non_updated_node';
up_node = updated_node';
Node([up_node; non_up_node])= ones(146,1);
x= Node==0; 
Node(x)=randint(277,1);
% Node(301)= 0;
% Node(43)= 0;
% Node(336)= 0;
% Node(164)= 0;
% Node(168)= 0;
% Node(382)=0;
Node(336)=1;
Node(206)=1;
% Node(402)=0;
out=Node;