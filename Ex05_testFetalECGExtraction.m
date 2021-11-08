% Code and comments edited by Gulay Bengu Ulukaya
% For BMI 500 Week 11 Assignment
% 11/8/2021
%
% Extracting fetal ECG signals using various ICA algorithms
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

% Uncomment the following lines to run advanced demos
% testPCAICAPiCAfECGExtraction % Call this demo from the OSET package
% testECGICAPCAPiCAPlot1
% testECGICAPCAPiCAPlot1
% testAveragefECGbyDeflationAndKF
%uncommented the line below
 testICAPiCAAfterMECGCancellation % (using the deflation algorithm + Kalman filter)
% testPCAICAPiCAfECGDenoising % (denoising using BSS and semi-BSS methods) %uncommented