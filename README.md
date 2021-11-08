# BSS Lecture Codes
## Reza Sameni
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
#### Part A
##### Example 1: testPCA.m
I changed the cutoff threshold from 99.9 to 95 to observe the change in signal. 

This example loads in a continuous signal and performs PCA to compress the signal; it can be applied to multi-channel data from EEG or ECG signals. The data are first de-meaned for all input channels, the covariance of the de-meaned data is calculated, and then eigenvalue decomposition is performed to extract the eigenvalues and eigenvectors of the input. The eigenvalues are then sorted by energy and thresholding is applied to retain only the eigenvalues with partial energy greater than the indicated threshold. The final compressed data is then plotted. 

![image](https://user-images.githubusercontent.com/64104699/140767192-b3fc8cb7-0147-4134-8fa5-0cce219623f9.png)
##### Example 2: testEigenAnalysisPowerMethod.m
I changed the number of iterations for the power method from 100 to 10. With only 10 iterations the method has not yet converged upon the eigenvalues and vectors. I found that with 100 iterations the lambda values = 9.262, 2.3709, and 0.4372. At 10 iterations the lambda values =  6.9724, 0.0401, 0.0071. 

Example 2 performs eigenvalue decomposition by using the Power Method approximation of eigenvalues and eigenvectors. First, a random signal is created that has 3 inputs and 1000 time points. The covariance matrix is calculated and then eigen values and vectors are extracted using the MATLAB eig function for comparison. Then EVD is performed using the Power Method through 100 iterations. 
##### Example 3: testICAmethods.m
I changed the script to apply the three ICA methods on the EEGdata rather than the synthetically produced data. The differences between the three algorithms are more apparent on the EEG channel data. 
![image](https://user-images.githubusercontent.com/64104699/140812753-52e85408-a5da-4d5a-baf2-066d7b633208.png)

This example implements and compares three different algorithms for independent component analysis (ICA). The three approaches are FastICA, JADE, and SOBI; the results of each of the three methods are plotted and compared for sample ECG data. ICA is a computational method which separates linearly mixed multivariate signals transforming it into another set where the components are the independent and approximate of the original signal. FastICA searches for the components one by one with whitening performed on the data first; this method is very fast and is possible to implement in a parallel fashion, but it may require more computational memory. The SOBI algorithm uses second order statistics and first whitening is performed, then computation of lagged correlation matrices, and finally joint diagonalization. JADE performs similar steps as SOBI using both whitening and joint diagonalization but on fourth order signals; this method is temporally disadvantageous, however it is memory efficient. The results from the three algorithms on the given example look similar with the differences being more apparent in channels 2 and 3. 
![image](https://user-images.githubusercontent.com/64104699/140812067-46a038f9-7c9f-4404-995c-7b66721b762b.png)
##### Example 4: testEOGArtifactRemoval.m
Example 4 removes EOG artifacts from EEG signals
