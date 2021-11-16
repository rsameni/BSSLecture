% The power method for eigenvalue decomposition
%
% BMI500 Course
% Lecture:  An Introduction to Blind Source Separation and Independent Component Analysis
%           By: R. Sameni
%           Department of Biomedical Informatics, Emory University, Atlanta, GA, USA
%           Fall 2020
%
% Dependency: The open-source electrophysiological toolbox (OSET):
%       https://github.com/alphanumericslab/OSET.git
%   OR
%       https://gitlab.com/rsameni/OSET.git
%

close all;
clear
clc;

% Build a random signal
N = 3;
T = 1000;
a = randn(1, N);
x = diag(a) * randn(N, T);
% Cx = x * x';
Cx = cov(x');

% Apply eigenvalue decomposition
% Read 'eig' help and compare with 'eigs'
[V,D] = eig(Cx)

Itr = 100; % The number of power method iterations

v0 = rand(N, 1);
v1 = EigenAnalysisPowerMethod(Cx, v0, Itr);
scale1 = (Cx*v1)./v1;
lambda1 = mean(scale1)

C = Cx - lambda1 * (v1 * v1');
v2 = EigenAnalysisPowerMethod(C, v0, Itr);
scale2 = (Cx*v2)./v2;
lambda2 = mean(scale2)

C = C - mean(lambda2) * (v2 * v2');
v3 = EigenAnalysisPowerMethod(C, v0, Itr);
scale3 = (Cx*v3)./v3;
lambda3 = mean(scale3)

%% Question 1:
% part 2: Check and compare your results with the “eig” function in MATLAB and report the values in your report
C=[5 1; 1 2];
[V,D]=eig(C)
%% Question 2:
% part 1:  Recalculate the eigenvalues of Question 1 by using the Power Method
C=[5 1; 1 2];

Itr = 20; % The number of power method iterations

v0 = rand(2, 1);
[v1,vec1, scale1a] = EigenAnalysisPowerMethod(C, v0, Itr);
scale1 = (C*v1)./v1;
lambda1 = mean(scale1)

Cx = C - lambda1 .* (v1 * v1');
[v2,vec2, scale2a] = EigenAnalysisPowerMethod(Cx, v0, Itr);
scale2 = (Cx*v2)./v2;
lambda2 = mean(scale2)
%% Part 2: Plot the two entries of the principal vector and the leading eigenvalue in the first twenty iterations of the Power Method
% plotting the two entries of the principal vector of both the first eigenvalue: 
figure()
plot(scale1a(1,:))
hold on 
plot(scale1a(2,:))
plot(lambda1,'*')
title('The principal vector of lambda = 5.3028')
% plotting the two entries of the principal vector of both the second eigenvalue: 
figure()
plot(scale2a(1,:))
hold on
plot(scale2a(2,:))
plot(lambda2,'*')
title('The principal vector of lambda = 1.6972')
