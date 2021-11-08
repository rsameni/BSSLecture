%problem 2a 
%adapted from the sample code given to the class 

C = [5,1;1,2];
Itr=100; 

v0 = rand(2, 1);
v1 = EigenAnalysisPowerMethod(C, v0, Itr)
scale1 = (C*v1)./v1;
lambda1 = mean(scale1)

C_sub = C - lambda1 * (v1 * v1');
v2 = EigenAnalysisPowerMethod(C_sub, v0, Itr)
scale2 = (C*v2)./v2;
lambda2 = mean(scale2)



