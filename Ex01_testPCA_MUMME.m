% Principal component analysis
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
% PlotECG(data, L, color, fs, title)
% inputs:
% data: the input data matrix
% L: number of panels per figure
% color: the color of the plots: 'b','r','g',etc. (blue by default)
% fs: sampling rate (1 by default)
% title: empty by default

PlotECG(x, 8, 'b', fs, 'Raw data channels');

% Remove the channel means
x_demeaned = x - mean(x, 2) * ones(1, size(x, 2));

% Plot the zero-mean channels
% PlotECG(x_demeaned, 4, 'r', fs, 'Zero-mean data channels');

% Covariance matrix of the input
Cx = cov(x_demeaned')

% Eigenvalue decomposition
[V, D] = eig(Cx, 'vector');

figure
subplot(121)
plot(D(end:-1:1));
grid
xlabel('Index');
ylabel('Eigenvalue');
title('Eigenvalues in linear scale');
subplot(122)
plot(10*log10(D(end:-1:1)/D(end)));
grid
xlabel('Index');
ylabel('Eigenvalue ratios in dB');
title('Normalized eigenvalues in log scale');

% Check signal evergy
x_var = var(x_demeaned, [], 2) % Formula 1
x_var2 = diag(Cx) % formula 2

% Decorrelate the channels
y = V' * x_demeaned;
Cy = cov(y')
y_var = diag(Cy)

PlotECG(y, 8, 'r', fs, 'Decorrelated data channels');

% Check total energy match
x_total_energy = sum(x_var)
Cx_trace = trace(Cx)
eigenvale_sum = sum(D)
Cy_trace = trace(Cy)

% partial energy in eigenvalues
x_partial_energy = 100.0 * cumsum(D(end : -1 : 1))./x_total_energy

% set a cut off threshold for the eigenvalues
th = 99.9;
N_eigs_to_keep = find(x_partial_energy <= th, 1, 'last')

% find a compressed version of x
x_compressed = V(:, N - N_eigs_to_keep + 1 : N) * y(N - N_eigs_to_keep + 1 : N, :);
% eig(cov(x_compressed'))

t = (0 : T - 1)/fs;
% plot in a summarized figure, all channels together
for ch = 1 : N
    subplot(8,1,ch)
    plot(t, x(ch, :));
    hold on
    plot(t, x_compressed(ch, :));
    hold off
    grid
end
