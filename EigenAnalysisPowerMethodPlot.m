function v = EigenAnalysisPowerMethodPlot(A, v0, N)
% An implementation of the Power method for eigenvalue decomposition
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
% Modified by Daniela Chanci Nov 2021
 
v = v0(:); % initial vector
V1 = zeros(1,20);
V2 = zeros(1,20);
D1 = zeros(1,20);
x = 1:N;
figure;
for k = 1 : N
    v = A * v;
    v = v / sqrt(v' * v);
    scale = (A*v)./v;
    lambda = mean(scale);
    V1(k) = v(1);
    V2(k) = v(2);
    D1(k) = lambda;
end

% Create plot 
plot(x, V1, 'LineWidth', 2);
hold on
plot(x, V2, 'LineWidth', 2);
hold on
plot(x, D1, 'LineWidth', 2);
xlabel('Iteration');
ylabel('Value');
legend('1st entry vector', '2st entry vector', 'Leading eigenvalue');


