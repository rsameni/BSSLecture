%% Problem 2A - Recalculate eigenvalues using power method
% Following Ex02_testEigenAnalysisPowerMethod.m --
C = [5,1 ; 1,2]; % create matrix
v1 = EigenAnalysisPowerMethod(C, randn(2,1), 100); % calculate leading eigenvector 1
lambda1 = mean((C*v1)./v1); % find eigenvalue 1
C2 = C - lambda1 * (v1 * v1');
v2 = EigenAnalysisPowerMethod(C2,randn(2,1),100); % calculate leading eigenvector 2
lambda2 = mean((C*v2)./v2); % find eigenvalue 1
%% Problem 2B -  Plot the two entries of the principal vector and the leading eigenvalue
% create vector to store each 20 iteration values
v11_vec = 1:20; 
v12_vec = 1:20;
lambda_vec = 1:20;

% use for loop to produce values from 1:20 iterations
for i = 1:20
    out_i = EigenAnalysisPowerMethod(C,randn(2,1),i); % get output with i iterations
    % add into value vectors
    v11_vec(i) = out_i(1); 
    v12_vec(i) = out_i(2);
    lambda_vec(i) = mean((C*out_i)./out_i);
end

% plot two entries of principal vector and leading eigenvalue for 20 it
plot(1:20,v11_vec)
hold on
plot(1:20,v12_vec)
hold on
plot(1:20,lambda_vec)
legend('v1,1','v1,2','leading eigenvalue')
title("Two entries of principal vector and leading eigenvalue for 20 iterations")
xlabel("iterations used in power method")
ylabel("value from power method")
hold off