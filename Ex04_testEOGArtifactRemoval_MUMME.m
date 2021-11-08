% Removing EOG artifacts from EEG signals
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
t = (0 : T - 1)/fs;

% Plot the channels
PlotECG(x, 8, 'b', fs, 'Raw data channels');

% Run JADE
lastEigJADE = N; % PCA stage
W_JADE = jadeR(x, lastEigJADE);
s_jade = W_JADE * x;
A_jade = pinv(W_JADE); % The mixing matrix

% Plot the sources
% PlotECG(s_jade, 4, 'k', fs, 'Sources extracted by JADE');

% Channel denoising by JADE
eog_channel = [2 3]; % check from the plots to visually detect the EOG
s_jade_denoised = s_jade;
s_jade_denoised(eog_channel, :) = 0;
x_denoised_jade = A_jade * s_jade_denoised;

% Channel denoising by NSCA
eog_channel = 8;
eog_ref = x(eog_channel, :);
energy_envelope_len = round(0.25*fs);
eog_envelope = sqrt(filtfilt(ones(1, energy_envelope_len), energy_envelope_len, eog_ref.^2));
med = median(eog_envelope);
mx = max(eog_envelope);
eog_detection_threshold = 0.95 * med + 0.05 * mx;

J = eog_envelope >= eog_detection_threshold;
I = 1 : T;

[s_nsca, W_nsca, A_nsca] = NSCA(x,J, I);
% Channel denoising by JADE
eog_channel = [1 2]; % check from the plots to visually detect the EOG
s_nsca_denoised = s_nsca;
s_nsca_denoised(eog_channel, :) = 0;
x_denoised_nsca = A_nsca * s_nsca_denoised;
% PlotECG(s_nsca, 4, 'r', fs, 'Sources extracted by NSCA');

figure
hold on
plot(t, eog_ref);
plot(t, eog_envelope);
plot(t, eog_detection_threshold(ones(1, T)));
grid
legend('EOG reference channel', 'EOG envelope');

% Plot the denoised signals
for ch = 1 : N
    subplot(8,1,ch)
    plot(t, x(ch, :)); % plot in blue
    hold on
    plot(t, x_denoised_jade(ch, :)); % plot in red
    hold on
    plot(t, x_denoised_nsca(ch, :)); % plot in yellow
    hold off
    grid
end

% Run the following script from the OSET package for a more advanced method
testEOGRemoval

