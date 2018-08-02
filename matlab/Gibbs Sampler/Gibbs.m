% Function implementing Gibb's Sampler

M2 = 100000;                          
M1 = M2 / 2;                        
eta     = .99;                    
theta   = .97;                      
gamma   = .4024;                   
delta   = .9998;                   


Disease = zeros(1,M2);             
Test    = zeros(1,M2);             
Pi.prop = zeros(1,M2);              
Sum     = 0;                      
Disease(1,1) = 0;                    
                                   
for m = 2:M2
      if (Disease(1,m-1) == 1)
            Test(1,m-1) = binornd(1,eta);
      else
            Test(1,m-1) = binornd(1,1-theta);
      end
      if (Test(1,m-1) == 1) 
            Disease(1,m) = binornd(1,gamma);
      else
            Disease(1,m) = binornd(1,1-delta);
      end         
      Sum = Sum + Disease(1,m);
      Pi.prop(1,m) = Sum / m;
end

D1count = sum(Disease(1,M1+1:M2));            
Pi.post = D1count / (M2 - M1);

Pi.post
plot(Pi.prop);
     
     