% Independent component analysis using classical methods
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

clc
clear
close all

% load ECG signal_01 from TokarevData
load signal_01.mat
fs = 1000; % 
x = s; 

N = size(x, 1); % The number of channels
T = size(x, 2); % The number of samples per channel

% Plot the channels
PlotECG(x, 8, 'b', fs, 'Raw data channels');

% Run fastica
approach = 'symm'; % 'symm' or 'defl'
g = 'tanh'; % 'pow3', 'tanh', 'gauss', 'skew'
lastEigfastica = N; % PCA stage
numOfIC = N; % ICA stage
interactivePCA = 'off';
[s_fastica, A_fatsica, W_fatsica] = fastica (x, 'approach', approach, 'g', g, 'lastEig', lastEigfastica, 'numOfIC', numOfIC, 'interactivePCA', interactivePCA, 'verbose', 'off', 'displayMode', 'off');

% Check the covariance matrix
Cs = cov(s_fastica');

% Run JADE
lastEigJADE = N; % PCA stage
W_JADE = jadeR(x, lastEigJADE);
s_jade = W_JADE * x;

% Run SOBI
lastEigSOBI = N; % PCA stage
num_cov_matrices = 100;
[W_SOBI, s_sobi] = sobi(x, lastEigSOBI, num_cov_matrices);

% Plot the sources
PlotECG(s_fastica, 8, 'r', fs, 'Sources extracted by fatsica');

% Plot the sources
PlotECG(s_jade, 8, 'k', fs, 'Sources extracted by JADE');

% Plot the sources
PlotECG(s_sobi, 8, 'm', fs, 'Sources extracted by SOBI');
