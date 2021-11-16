
%problem 2b 

vec1 = 1:20; 
vec2 = 1:20;
lambdav = 1:20;

%  20 iterations as specified 
for i = 1:20
    output = EigenAnalysisPowerMethod(C,randn(2,1),i); 
    vec1(i) = output(1); 
    vec2(i) = output(2);
    lambdav(i) = mean((C*output)./output);
end

% plot two entries of principal vector and leading eigenvalu the 20 iterations specified
plot(1:20,vec1)
hold on
plot(1:20,vec2)
hold on
plot(1:20,lambdav)
legend('Primary Vector 1','Primary Vector 2','Leading Eigenvalue')
title("the two entries of the principal vector and the leading eigenvalue in the first twenty iterations of the Power Meth")
xlabel("iteration")
ylabel("value")
hold off
