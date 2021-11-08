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
I changed the number of iterations for the power method from 100 to 10. With only 10 iterations the method has not yet converged upon the eigenvalues and vectors. 

Example 2 performs eigenvalue decomposition by using the Power Method approximation of eigenvalues and eigenvectors. First, a random signal is created that has 3 inputs and 1000 time points. The covariance matrix is calculated and then eigen values and vectors are extracted using the MATLAB eig function for comparison. Then EVD is performed using the Power Method through 100 iterations. 
##### Example 3: testICAmethods.m
