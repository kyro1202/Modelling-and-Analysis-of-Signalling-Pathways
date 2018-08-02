function out = ROA2( node, order )
%function inputs initial node state and random update order
boolRule = zeros(11,1); 
for i = 1:length(order)
    boolRule = feval(@ToyRules2, node); %first we update rules
    node(order(i))= boolRule(order(i)); %whichever element is to be update is equated with the corressponding updated element in the rules 
end
out = node; 
end