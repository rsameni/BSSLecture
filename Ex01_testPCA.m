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

clc
clear
close all

example = 1;
switch example
    case 1 % Load a sample EEG signal
        load EEGdata textdata data % A sample EEG from the OSET package
        fs = 250;
        x = data'; % make the data in (channels x samples) format
        % Check the channel names
        disp(textdata)
    case 2 % Load a sample ECG signal
        load SampleECG2 data % A sample ECG from the OSET package
        fs = 1000;
        x = data(:, 2:end)'; % make the data in (channels x samples) format
        x = x - LPFilter(x, 1.0/fs); % remove the lowpass baseline
    otherwise
        error('unknown example');
end

N = size(x, 1); % The number of channels
T = size(x, 2); % The number of samples per channel

% Plot the channels
PlotECG(x, 4, 'b', fs, 'Raw data channels');

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

% PlotECG(y, 4, 'r', fs, 'Decorrelated data channels');

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
for ch = 1 : N
    figure
    hold on
    plot(t, x(ch, :));
    plot(t, x_compressed(ch, :));
    legend(['channel ' num2str(ch)], 'compressed');
    grid
end

