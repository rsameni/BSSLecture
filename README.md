# BSS Lecture Codes
## Reza Sameni
## Emory University Department of Biomedical Informatics

A short lecture of blind-source separation algorithms with practical examples in Matlab

### Student Name: Daniela Chanci Arrubla
### Student Email: dchanci@emory.edu

### Question 1
#### Part A
![](/Figures/Q1_partA_1.jpg)
![](/Figures/Q1_partA_2.jpg)

### Part B
Matlab code:
```matlab
% Create C
C = [5 1; 1 2];

% Calculate eigenvalues and eigenvectors
[V,D] = eig(C);
```

Output:
```
C =

     5     1
     1     2


V =

    0.2898   -0.9571
   -0.9571   -0.2898


D =

    1.6972         0
         0    5.3028
```

### Question 2
#### Part A
Matlab code using the original EigenAnalysisPowerMethod function:
```matlab
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
```

Output:
```
lambda1 =

    5.3028


lambda2 =

    1.6972
```

#### Part B
Matlab code using modified EigenAnalysisPowerMethod function (Named EigenAnalysisPowerMethodPlot):
```matlab
% Plot entries of principal vector and leading eigenvalue
Itr = 20;
v0 = rand(2, 1);
v1 = EigenAnalysisPowerMethodPlot(C, v0, Itr);
```

EigenAnalysisPowerMethodPlot function:
```matlab
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
```

Output:

![](/Figures/Q2_partB.jpg)

### Question 3
#### Part A
* ```Ex01_testPCA.m```: Changed the example parameter from 1 to 2. The input signal is SampleECG2.
* ```Ex02_testEigenAnalysisPowerMethod.m```: Changed iterations to 50 and then 15. Commented the code. 
* ```Ex03_testICAmethods.m```: Changed the value of example from 3 to 2. The input signal is SampleECG2, as in Ex01.
* ```Ex04_testEOGArtifactRemoval.m```: Changed the EOG detection threshold for 0.90 * med + 0.05 * mx.

#### Part B
* ```Ex01_testPCA.m```: This code receives a 15 channel ECG signal as an input. This signal is then filtered to reduce the low frequency noise, and normalized by making all channels have a zero mean. The eigenvalues and eigenvectors of this preprocessed signal are calculated using the covariance matrix. Then, the code analyses which are the most significative eigenvalues, and outputs a compressed version for each raw channel based on a determined threshold, which in this case is 99.9. There is one plot for each channel displaying the raw signal and the compressed version; however, they are very similar and it is difficult to identify them. Therefore, the threshold used for the PCA in this example did not result in the loss of important information.
* ```Ex02_testEigenAnalysisPowerMethod.m```: This code finds the eigenvalues and eigenvectors using the eig built-in MATLAB function and the power method for eigenvalue decomposition. Both of them are applied on a random signal for which the covariance was previously calculated with the cov function. To analyze this code, I compared the results obtained with the MATLAB function, which are the ground truth, to the results obtained with the power methods, which are an approximation. First, I changed the number of iterations to 50 to see how good the approximation was. The three obtained eigenvalues were extremely similar to the ground truth, which shows that reducing the number of iterations to 50 can still produce satisfactory results. Last, I changed the number of iterations to 15 and the obtained eigenvalues were far from the ground truth. We can conclude that the incrementing the number of iterations results in better approximations.  
* ```Ex03_testICAmethods.m```: This code receives a 15 channel ECG signal as an input, the same that was used for Ex01. First, this signal is filtered to reduce the low frequency noise. Then, three different methods to apply independent component analysis (ICA) are tested. These are the MATLAB implementations of: SOBI, FastICA, and JADE. The objective is to obtain the sources of the ECG signal used as an input. For each of the 15 channel and for each of the three tested methods, a plot with the extracted sources is produced. Based on these plots, the results obtained with the three different algorithms are very similar. However, it is possible to observe that the sources obtained with the SOBI algorithm appear to be less noisy.
* ```Ex04_testEOGArtifactRemoval.m```: This code addresses the EOG removal task. This denoising task is an important task for EEG analysis and in this code it is achieved using two different mothods: JADE and NSCA. In this case, the signal is not normalized and is not filtered like in the previous examples that worked with the ECG data. The EOG data is identified for each electrode, then it is removed, and the artifact-free EEG signal can then be observed. It is possible to identify differences in the results obtained with each method; however, from the plots, I would not be able to tell which leads to better results.
* ```Ex05_testFetalECGExtraction.m```: In this code, there are different methods for the obtention of the fetal ECG with no artifacts. The artifacts addressed by these methods is the ECG from the mother. When attemting to record the ECG of a fetus, it is impossible not to capture the ECG from the mother as well. I tried the different methods without changing anything in the source codes. The results from all of them look satisfactory given that the reduction in the noise is evident. Additionally, the obtained results look very similar.

### Question 4
#### Part A

Paper: Extended leA Removes Artifacts from Electroencephalographic Recordings (URL: https://proceedings.neurips.cc/paper/1997/file/674bfc5f6b72706fb769f5e93667bd23-Paper.pdf)

In this paper, the authors proposed an extended version of Independent Component Analysis (ICA) algorithm to perform blind source separation (BSS) to obtain an artifact-free EEG signal while trying not to discard the contaminated segments. More specifically, the goal was to isolate this signal from artifacts produced by different body organs such as the eyes, muscle, and heart. 
The ICA algorithm is suitable for this task given that the volume conduction of EEG signals is assumed to be linear and instantaneous; and the time courses of the eye, muscle, and heart activity are independent from the EEG activity. These two are assumptions required for the ICA algorithm to work properly. Additionally, there is another assumption that this task does not meet: having the same number of sensors and sources. However, it has been demonstrated with simulations that ICA is able to recognize time courses of different sources captured in the EEG recording.
The algorithm was applied to two different EEG datasets at a sampling rate of 256 Hz, one with 20 channels and the other one with 19 channels. For the eye artifacts, two ICA components were identified and removed. For the muscle artifacts, another two ICA components were identified and removed, revealing EEG activity that was masked by these artifacts. Additionally, for another EEG time series, 4 ICA components that corresponded to eye activity, muscle activity, and line noise were identified and removed. The last artifact (line) was not successfully removed in previous versions of the ICA algorithm.
They concluded that the proposed algorithm achieves a satisfactory performance for large EEG signals and can remove different types of sources.

