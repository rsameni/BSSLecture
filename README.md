# BSS Lecture Codes
## Emory University Department of Biomedical Informatics

A short lecture of blind-source separation algorithms with practical examples in Matlab

### Vicki Huang
### vicki.huang@emory.edu
Code for questions 1 and 2 are included in Huang_HW11.m
***
### Question 1
#### Part A
![image](https://user-images.githubusercontent.com/64104699/140809087-dede1c15-848b-4241-84aa-880c59679ced.png)
### Part B
![image](https://user-images.githubusercontent.com/64104699/140745544-dfa82532-3243-4c08-9bea-9d9b4d412d8e.png)
***
### Question 2
#### Part A
![image](https://user-images.githubusercontent.com/64104699/140755258-89cebc07-6fea-43e4-b4eb-5838d30c9b60.png)
### Part B
![image](https://user-images.githubusercontent.com/64104699/140758491-7811add4-2841-462a-859a-c4fcf187a3d4.png)
The values from the hand calculation vs the MATLAB eig function are equivalent. 
***
### Question 3
Altered scripts are included with \_Huang.m
#### Part A and B
##### Example 1: testPCA.m
I changed the cutoff threshold from 99.9 to 95 to observe the change in signal. 

This example loads in a continuous signal and performs PCA to compress the signal; it can be applied to multi-channel data from EEG or ECG signals. The data are first de-meaned for all input channels, the covariance of the de-meaned data is calculated, and then eigenvalue decomposition is performed to extract the eigenvalues and eigenvectors of the input. The eigenvalues are then sorted by energy and thresholding is applied to retain only the eigenvalues with partial energy greater than the indicated threshold. The final compressed data is then plotted. 

![image](https://user-images.githubusercontent.com/64104699/140767192-b3fc8cb7-0147-4134-8fa5-0cce219623f9.png)
##### Example 2: testEigenAnalysisPowerMethod.m
I changed the number of iterations for the power method from 100 to 10. With only 10 iterations the method has not yet converged upon the eigenvalues and vectors. I found that with 100 iterations the lambda values = 9.262, 2.3709, and 0.4372. At 10 iterations the lambda values =  6.9724, 0.0401, 0.0071. 

Example 2 performs eigenvalue decomposition by using the Power Method approximation of eigenvalues and eigenvectors. First, a random signal is created that has 3 inputs and 1000 time points. The covariance matrix is calculated and then eigen values and vectors are extracted using the MATLAB eig function for comparison. Then EVD is performed using the Power Method through 100 iterations. 
##### Example 3: testICAmethods.m
I changed the script to apply the three ICA methods on the ECGdata rather than the synthetically produced data. The differences between the three algorithms are more apparent on the EEG channel data. 
![image](https://user-images.githubusercontent.com/64104699/140812753-52e85408-a5da-4d5a-baf2-066d7b633208.png)

This example implements and compares three different algorithms for independent component analysis (ICA). The three approaches are FastICA, JADE, and SOBI; the results of each of the three methods are plotted and compared for sample ECG data. ICA is a computational method which separates linearly mixed multivariate signals transforming it into another set where the components are the independent and approximate of the original signal. FastICA searches for the components one by one with whitening performed on the data first; this method is very fast and is possible to implement in a parallel fashion, but it may require more computational memory. The SOBI algorithm uses second order statistics and first whitening is performed, then computation of lagged correlation matrices, and finally joint diagonalization. JADE performs similar steps as SOBI using both whitening and joint diagonalization but on fourth order signals; this method is temporally disadvantageous, however it is memory efficient. The results from the three algorithms on the given example look similar with the differences being more apparent in channels 2 and 3. 
![image](https://user-images.githubusercontent.com/64104699/140812067-46a038f9-7c9f-4404-995c-7b66721b762b.png)
##### Example 4: testEOGArtifactRemoval.m
I changed the script to apply the example on the EEGdata2 rather than EEGdata1. 

Example 4 removes EOG (electro-oculugram) signals from the EEG signal. The EOG artifacts arise from eye-blinks that occur during the EEG data acqusition. The two types of denoising algorithms it compares are JADE and NSCA for removing the EOG artifact. The principle is that the EOG and true EEG signals are separable to individual components in each electrode and the artifactual signal can be removed. The signal coming from the EOG should be weaker than the EEG. After applying the algorithms only the EEG signal should be left. The example plots the denoised singlas from both JADE and NSCA and compares them; they show different results, and from a qualitative evaulation it appears that NSCA removes more of the signal while JADE is more conservative. 
##### Example 5: testFetalECGExtraction.m
There was no place to alter the parameters or test on a different dataset for this example. Rather than running the original ECG extraction, I tested the ECG denoising using the BSS and semi-BSS method. 

This example tests different methods (PiCA, JADE, SOBI) of denoising on the fetal ECG data. The fetal data is acquired via ECG electrodes from the mother, therefore the data consists of fetal ECG signal as well as the mother's ECG signal. The data is decomposed using PCA, then denoising algorithms are applied and compared. The PiCA method detects the fetal peaks and uses them as inputs for the denoising algorithm. JADE and SOBI are based only on the maternal peak signal without using fetal peaks as input before the denoising. Qualitatively looking at the results of the denoised fetal ECG it appears that SOBI may be slightly noisier than JADE or PiCA.
***
### Question 4
#### Part A: Lu, Wei, and Jagath C. Rajapakse. "Approach and applications of constrained ICA." _IEEE transactions on neural networks_ 
##### Summary
