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
% Modified by Hope Mumme (hmumme@emory.edu) for homework 11 of BMI-500

close all;
clear
clc;

% load ECG signal_01 from TokarevData
load signal_01.mat
fs = 1000; % 
x = s; 
x_demeaned = x - mean(x, 2) * ones(1, size(x, 2));
% Covariance matrix of the input
Cx = cov(x_demeaned');

% Apply eigenvalue decomposition
% Read 'eig' help and compare with 'eigs'
[V,D] = eig(Cx)

Itr = 100; % The number of power method iterations

% apply loop to calculate eigenvalues 1 to 8
lams = 1:8; % create vector that we will replace with predicted values
C = Cx; % will be changing every loop
for i = 1:8
    v0 = rand(8,1);
    v = EigenAnalysisPowerMethod(C, v0, Itr);
    scale = (Cx*v)./v;
    lams(i) = mean(scale); % add into lambda vector
    C = C - lams(i) * (v * v'); % change C
end

% predicted lambdas
lams