% HW11 BMI500 - Blind Source Separation
% Created by: Daniela Chanci Arrubla
% Date: 11/07/2021

close all; clear; clc;

%% Problem 1 - Part B

% Create C
C = [5 1; 1 2];

% Calculate eigenvalues and eigenvectors
[V,D] = eig(C);

%% Problem 2 - Part A

% Calculate eigenvalues using the Power Method
Itr = 50;
v0 = rand(2, 1);
v1 = EigenAnalysisPowerMethod(C, v0, Itr);
scale1 = (C*v1)./v1;
lambda1 = mean(scale1);

Cx = C - lambda1 * (v1 * v1');
v2 = EigenAnalysisPowerMethod(Cx, v0, Itr);
scale2 = (C*v2)./v2;
lambda2 = mean(scale2);

%% Problem 2 - Part B

% Plot entries of principal vector and leading eigenvalue
Itr = 20;
v0 = rand(2, 1);
v1 = EigenAnalysisPowerMethodPlot(C, v0, Itr);
