
function out = ROA( node, order, t)
%function inputs initial node state and random update order
boolRule = zeros(423,1); 
for i = 1:length(order)
    boolRule = feval(@april_28_tnf_time_new, node, t); %first we update rules
    node(order(i))= boolRule(order(i)); %whichever element is to be update is equated with the corressponding updated element in the rules 
end
out = node; 
end