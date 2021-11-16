# BSS Lecture Codes
## Reza Sameni
## Emory University Department of Biomedical Informatics

A short lecture of blind-source separation algorithms with practical examples in Matlab

### Student Name: Hope Mumme
### Student Email: hmumme@emory.edu
***
### Question 1 (image files also included in problem1 folder)
#### Part A
Eigenvalue calculation:

![Alt text](/problem1/hw11-problem1a1.png?raw=true "Eigenvalue Calculation")

Eigenvector calculation:

![Alt text](/problem1/hw11-problem1a2.png?raw=true "Eigenvector Calculation")

#### Part B
Matlab calculation:

![Alt text](/problem1/hw11-problem1b.png?raw=true "Matlab Calculation")

The matlab calculated eigenvalues are almost exactly equal to my calculated eigenvalues. The matlab calculated eigenvectors are in the same ratio as my calculated vectors. 

For example, v1 = (0.2989,-0.9571) in matlab and this ratio (v1,1 / v1,2) is equal to -0.3123 ... my calculated eigenvector is (-0.303,1) and this ratio is -0.303

***
### Question 2 (image files and code are in problem2 folder)
#### Part A 
Eigenvalue calculation using power method:

Code:

![Alt text](/problem2/hw11-problem2a.png?raw=true "Matlab eigenvalue prediction")

Results:

lambda1 estimate = 5.3028

lambda2 estimate = 1.6972

#### Part B
Plot of two entries in principal vector and leading eigenvalue for 1 to 20 iterations of power method:

![Alt text](/problem2/hw11-problem2b.png?raw=true "Matlab Power Plot")

***

### Question 3
#### Part A
I chose to analyze the following file in the OSET repository: OSET/Databases/TokarevData/signal_01.mat , from the fetal cardiac signals database.

##### Ex01_testPCA_MUMME.m Results (images in problem3/ex01/ folder)
The data contained signal from 8 channels at a sampling frequency of 1000 Hz. Here is the raw signal:

![Alt text](/problem3/ex01/ex01-raw.png?raw=true "ex01 Raw")

Here are the eigenvalues in linear and log scale from the covariance matrix of the input signal:

![Alt text](/problem3/ex01/ex01-eigenvalue.png?raw=true "ex01 eigenvalues")

Here is the compressed signals from each channel:

![Alt text](/problem3/ex01/ex01-compressed.png?raw=true "ex01 compressed")

##### Ex02_testEigenAnalysisPowerMethod_MUMME.m Results (images in problem3/ex02/ folder)

Acutal Eigenvalues from covariance matrix of input signal channels:

![Alt text](/problem3/ex02/ex02-actualE.png?raw=true "ex02 actual eigenvalues")

Predicted Eigenvalues from power method:

![Alt text](/problem3/ex02/ex02-predictedE.png?raw=true "ex02 predicted eigenvalues")

##### Ex03_testICAMethods_MUMME.m Results (images in problem3/ex03/ folder)

Results from FastICA decomposition:

![Alt text](/problem3/ex03/ex03-fatsica.png?raw=true "ex03 fastICA")

Results from JADE decompostion:

![Alt text](/problem3/ex03/ex03-jade.png?raw=true "ex03 JADE")

Results from SOBI decomposition:

![Alt text](/problem3/ex03/ex03-sobi.png?raw=true "ex03 SOBI")

##### Ex04_testEOGArtifactRemoval_MUMME.m Results (images in problem3/ex04/ folder)

EOG reference channel and EOG envelope from channel 8:

![Alt text](/problem3/ex04/ex04-ref.png?raw=true "ex04 ref")

Denoised Signals:

legend: blue = raw signal, red = JADE, yellow = NSCA

![Alt text](/problem3/ex04/ex04-denoised.png?raw=true "ex04 denoised")

##### Ex05_testFetalECGExtraction_MUMME.m Results (images in problem3/ex05/ folder)

Results from testPCAICAPiCAfECGDenoising demo:

Maternal and Fetal R peak detection:

![Alt text](/problem3/ex05/ex05-fetal.png?raw=true "ex05 fetal") ![Alt text](/problem3/ex05/ex05-maternal.png?raw=true "ex05 maternal")

Fetal Results from PiCA, JADE, SOBI:

![Alt text](/problem3/ex05/ex05-fetal_denoised.png?raw=true "ex05 fetal PiCA")
![Alt text](/problem3/ex05/ex05-fetal_jade.png?raw=true "ex05 fetal JADE")
![Alt text](/problem3/ex05/ex05-fetal_sobi.png?raw=true "ex05 fetal SOBI")

#### Part B

I used the fetal cardiac signal database from OSET TokarevData contains cardiac signals from 8 channels. I input the ECG signal_01.m data into the test scripts from the BSSLecture Repository. Here are my interpretations of the functionality of the code and the results. 

##### Ex01_testPCA_MUMME.m Interpretation

From the raw signal of the 8 channel ECG, we see 8 sets of data with the same time span, but with different ranges of amplitudes. There doesn’t seem to be any common time (s) along the x-axis of where the ECG peaks are located among the 8 channels. The testPCA code removes the channel means and calculates the covariance of the de-meaned matrix. This is used to calculate the eigenvalues of the 8 channel dataset, one per channel. From the eigenvalues plotted in log scale, we can see that the eigenvalues rapidly decrease with increasing index in the covariance matrix (increasing channel number). These eigenvalues are used to form a compressed version of the data (red shows the compressed signal, blue shows the raw signal). The PCA compression doesn’t seem to have much of an effect, the raw and compressed signals are mostly overlapping.  

##### Ex02_testEigenAnalysisPowerMethod_MUMME.m Interpretation

The same demeaned matrix from ex01 is used to create the covariance matrix in ex02. The Ex02 code finds the eigenvalues through two methods, the built-in Matlab function eig() and through the power method. The results of the Matlab function are shown above, with V showing the eigenvectors and D showing the eigenvalues for the covariance matrix (one for each channel). Next, 100 power iterations are performed to calculate each eigenvalue using EigenAnalysisPowerMethod function from the OSET repository. The input covariance matrix is recalculated with each eigenvalue, using the eigenvector calculated from the previous use of the function. The eigenvalues are stored in a vector lams, and printed above. The eigenvalues from the Matlab function and the Power Method function are equal, showing that the Power method is an accurate way of estimating the eigenvalues for this data when a high number of iterations are used.  

##### Ex03_testICAMethods_MUMME.m Interpretation 

The same raw signal of the 8 channel ECG is used in Ex03 analysis. The code runs FastICA, JADE, and SOBI to test different independent component analysis (ICA) methods ability at deconstructing the ECG signal. The ICA deconstruction of the data was calculated using the fastica function from Matlab, the JADE deconstruction was calculated using the jadeR function from Matlab, and the SOBI deconstruction was calculated using the sobi function from Matlab. The sources extracted by each method are plotted above for comparison. Overall, FastICA and SOBI sources seem to be similar, with JADE sources being different from the other two methods. Channels 4,7,8 seem to produce the clearest and least-noisy extracted sources in all methods. The JADE method looks to do the worst job at deconstructing in channels 1, 2, 6, with the extracted signal being very noisy.  

##### Ex04_testEOGArtifactRemoval_MUMME.m Interpretation 

The same raw signal of the 8 channel ECG is used in Ex04 analysis. The code runs JADE and NSCA as methods to denoise the input signal. It first extracts the sources using JADE like in Ex03, then multiplies the sources from jade by the mixing matrix calculated using the inverse of the jadeR output. For the NSCA (non-stationary component analysis) algorithm, the code uses the NSCA function from OSET to calculate the sources and then the denoised signal from NSCA. The EOG reference channel plot above shows an example of the reference channel (blue), envelope (orange), and detection threshold (yellow) used in calculating the denoised signal from NSCA in channel 1. The denoised signals from JADE (red) and NSCA (yellow) along with the raw signal (blue) are plotted above. From the plot, we can see that the NSCA and JADE mostly have similar denoising outputs, except in channels 2, 4, 7, and 8. At some points the NSCA signal is positive when the JADE and raw signals are negative. This could affect the signal analysis downstream. Also, in channel 2, the NSCA signal has lower overall amplitude than the JADE signal.  

##### Ex05_testFetalECGExtraction_MUMME.m Interpretation  

I ran the demo testPCAICAPiCAfECGDenoising in this part of the analysis. The purpose of this demo is to compare denoising methods’ results on the multichannel fetal ECG. The code of this demo can be found in OSET/testPrograms directory. The code first outputs the fetal and maternal R-peak detection and plots red circles where it estimates the peaks to be. It does very well at estimating the R-peaks in this snapshot of the signal for both fetal and maternal ECGs. It uses these detected peaks when applying the denoising methods. For the PiCA method, the code inputs the data with the detected fetal peaks (from PeakDetection function) into the PiCA function. The sources are found and applied to the signal to produce the denoised signal. For the JADE and SOBI methods, fetal peaks are not used but the sources produced by the methods are used to denoise the fetal ECG signal. The results shown above are of the denoised signal from PiCA, JADE, and SOBI. Overall, the signals from each method look similar, with the JADE method producing the clearest signal with least noise.  

***

### Question 4
#### Part A
Summary of “EEG signal classification using PCA, ICA, LDA and support vector machines” 

Citation: 

 Subasi, A., & Ismail Gursoy, M. (2010). EEG signal classification using PCA, ICA, LDA and support vector machines. Expert Systems with Applications, 37(12), 8659–8666. https://doi.org/10.1016/j.eswa.2010.06.065

Summary:

This paper used EEG signals to classify a signal as epileptic seizure or not an epileptic seizure. They used discrete wavelet transform (DWT) to extract the time and frequency information from the EEG signal, they used PCA, ICA, and LDA as dimensionality reduction methods to produce features, and they used SVM as the supervised machine learning classifier that used the features. The independent component analysis (ICA) part of the study can be summarized with the following steps (they did not provide any code, only method description); the authors used ICA to produce mutually independent components from the EEG signal. First, they assume that each signal c is independent, and they group all signals at t into vector x(t). This produces a multivariate density function which they then use to form an estimate, z(t), of the sources x(t) through determination of matrix A (dimensions c x d) by maximum-likelihood method. They estimate the density and find the parameter a that has the minimum difference between z(t) and x(t). The authors tried each dimensionality reduction method (PCA, ICA, LDA) with the SVM and found that the LDA and SVM combination produced the best performance of the predictive classifier (performance based on specificity and sensitivity). The training and testing splits were 50/50 with epileptic dataset having 800 total signals, and the normal dataset having 800 total signals. The PCA with SVM method produced a 98.75 % accuracy, 98.5 % specificity, and 99% sensitivity of the classifier. The ICA with SVM method produced a 99.5% accuracy, 99% specificity, and 100% sensitivity. The LDA and SVM method produced 100% accuracy, specificity, and sensitivity. Overall, the 3 feature extraction methods produced very similar results, but LDA method won overall.  
