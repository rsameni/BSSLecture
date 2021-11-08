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

***
