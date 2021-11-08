# BSS Lecture Codes
## Reza Sameni
## Emory University Department of Biomedical Informatics

A short lecture of blind-source separation algorithms with practical examples in Matlab
### Student Name: Retta El Sayed
### Student Email: relsay2@emory.edu
***
### Question 1
#### Part A
Image of handwritten calculation of eigenvalues and eigenvectors:!![q1p1](https://user-images.githubusercontent.com/64221087/140815124-d2035bab-2925-44c9-8e6c-868ac3a11204.JPG)

#### Part B
Eigenvalues and eignvectors calculated based on the eig matlab function and power method for eigenvalue decomposition. The test below was added to the E02_testEigenAnalysisPowerMethod.m Matlab script:
![q1p2](https://user-images.githubusercontent.com/64221087/140633004-f3a5ab57-d168-479d-81d0-20435f292591.JPG)
***

### Question 2
#### Part A
Below is updated code for the calculation of eigenvalues using the power method:
![q2p1](https://user-images.githubusercontent.com/64221087/140633022-87ae92a6-2f08-45da-a2d9-c64b607c2e46.JPG)
#### Part B
In order to export the principal vector iteration, the Eigen Analysis Power Method matlab function was updated and the principle vectors of each of the values was plotted: 
![q2p2](https://user-images.githubusercontent.com/64221087/140633026-7793ddd5-9d5f-4ae5-801f-45cb7d9cd9d1.JPG)
***

### Question 3
#### Part A
updated scripts are in the folder and commented: 
#### Part B
- Code 1: Ex01_testPCA.m
PCA or Principal Component Analysis is very important analysis tool in dealing with large data sets with a lot of variables. It aim to reduce the number of the variables without losing a lot of acuracy while trying to simplify the dataset. In my research area medical imaging using MRI, such tools are very helpful in analysing large datasets. Before changing any parameters in the code, i had to understand how does PCA work and as a summary the pipline include data standardization (rescaleing the data to have a mean of 0 and a standard deviation of 1) includes how many channales we have, calculating the convariance of the input and Eigenvalue decomposition 
In the updated code I changed the sampling frequency and used another samole ECG signal to see how these parameters effect PCA. The sampling frequency is a very important aspect since lower sampling frequency can effect the results.

- Code 2: Ex02_Ex02_testEigenAnalysisPowerMethod.m
The script was updated in question 2 where the eigenvalues of a C matrix were calculated. The updated scripts also has a plot of the principle vector iteration for each of the values. 
- Code 3: Ex03_testICAmethods.m
This code used the different Independent component analysis using classical methods. Based on the resulted figures we see that the signal, the order, and the amplitude of the 3 methods are different, which is what we would expect since non of these methods can guarantee the order, the sign, nor the amplitude of the signal. 
We see very good results with the different methods but usually Jade is good for  noisy data. 
Two things I tested in this code is when changing the interavtivePCA from off to on we get to choose which eigenvalue to use by entering the index. Another thing i change is the amount of noise from small amount of 0.01 to 0.1 noise to see how Jade which method will be the best with noisy data. After looking at the figure below we see jade resolve the noise from the signal in a better mannar than the other methods. 
![JadeNoise](https://user-images.githubusercontent.com/64221087/140817896-5232e1ce-9458-4a6e-80a2-9b45f8694efd.JPG)
- Code 4: Ex04_testEOGArtifactRemoval.m
This code tested the removing of the EOG artifact using Jade and NSCA. Both methods show very good results for the denoising of each channel. For this specific code I decided to test the different parameters of NSCA (nonstationary component analysis) by changing J desired time windows to be less than the threshold and i also observed how the welch power spectral changed. 
- Code 5: Ex05_testFetalECGExtraction.m
This code was very intersting testing the fetal ECG extration using different ICA algorithms. The difference between Pseudo-Periodic Component Analysis in fetal and maternal fetal based was intersting to analyze. I also tested the rest of the demos. 
***

### Question 4
#### Part A
 Choose one of the following papers and write a summary of the paper in 250 words or more
including the pseudo-code of the BSS algorithm of the paper:

The paper I choose is: Lu, Wei, and Jagath C. Rajapakse. "Approach and applications of constrained ICA." IEEE transactions on neural networks 16.1 (2005): 203-212. DOI: https://doi.org/10.1109/TNN.2004.836795 Constrained ICA with image processing applications

Summary:

***
