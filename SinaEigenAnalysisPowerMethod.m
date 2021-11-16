function v = SinaEigenAnalysisPowerMethod(A, N)
% An implementation of the Power method for eigenvalue decomposition
% This is an adaptaion of Dr. Sameni's EigenAnalysisPowerMethod. 
% 
% Inputs:
%   A: A square matrix
%   v0: An initial non-zero (random) vector, which matches in dimension with A
%   N: The number of power iterations
% Output:
%   v: An estimate of the leading eigenvalue after N iterations
%
% Reza Sameni (reza.sameni@gmail.com)
% Oct 2020
[n,~] = size(A);
v0 = rand(n,1);

V = zeros(n,N);
v = v0(:); % initial vector

for k = 1 : N
    v = A * v;
    v = v / sqrt(v' * v);
    V(:,k) = v;
end


%% Plotting
figure(1)
% plot(1:N,V(:,1:N))
hold on
for p=1:N
    plot(V(:,p));
    legend();
end
hold off
title('The power method for Eigen');
xlabel('lambda 2');
ylabel('lambda 1');