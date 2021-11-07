function [v,lambda] = EigenAnalysisPowerMethod(A, v0, N)
% An implementation of the Power method for eigenvalue decomposition and
% visualization
%
% Inputs:
%   A: A square matrix
%   v0: An initial non-zero (random) vector, which matches in dimension with A
%   N: The number of power iterations
% Output:
%   v: An estimate of the leading eigenvalue after N iterations
%
% Mingzhe Hu
% Nov 2021

%initial vector
v = v0(:);
f1 = figure;
f2 = figure;
for k = 1 : N
    set(0, 'CurrentFigure', f2)
    %figure(2)
    txt = ['Iteration = ',num2str(k)];
    plot(v, 'DisplayName', txt);
    title("Principle  Eigenvector")
    legend("show", "Location", "eastoutside");
    hold on;
    v = A * v;
    y = A*v;
    l=y'*v;
    m=v'*v;
    % eigenvalue
    lambda =l/m;
    % approximate the next eigenvectvor
    %figure(1)
    set(0, 'CurrentFigure', f1)
    plot(k,lambda,'*b');
    title("Principle Eigenvalue")
    hold on;
    v = v / sqrt(v' * v);
end
disp(["Principle Eigenvalue:", num2str(lambda)]);
disp("Principle Eigenvector:");
disp(-v);