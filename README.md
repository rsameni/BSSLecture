# BSS Lecture Codes
## Reza Sameni
## Emory University Department of Biomedical Informatics

A short lecture of blind-source separation algorithms with practical examples in Matlab

## Question 4

### Ex1

This program is about PCA on signal. Using PCA on the signal to keep energy of the signal. The cut-off threshold is set as 99.9, which means can keep 99.9% energy of the signal. PCA is only interested in keeping the energy of the signal and find the linear computation of the observation. This method can keep the best signal of the energy. However, the dimensionality reduction will also loss some important information about the signal.
In this program, I change the example1 to example2. And I found the results are almost same. PCA can keep most of the energy of the signal, but the shapes are a little bit different, which means may loss some important information.

### Ex2

The power method for eigenvalue decomposition is another way to calculate eigenvalue and eigen vector. In this method, it given a diagonalizable matrix A, the algorithm will produce a number λ, which is the greatest (in absolute value) eigenvalue of A, and a nonzero vector v, which is a corresponding eigenvector of λ, that is, Av=λv. As the iteration, the λ will decrease, closer and closer to the real λ. In this program, I add calculation to calculate lambda4. And I found the λ is decreasing.

### Ex3

For the third program, which is about Independent component analysis using classical methods,  there are three methods to do the comparision: fastica, JADE and SOBI. ICA method is different from PCA method. Independent component analysis attempts to decompose a multivariate signal into independent non-Gaussian signals. Mixing weights for constructing the M observed signals from the N components can be placed in an M×N matrix. An important thing to consider is that if N sources are present, at least N observations are needed to recover the original signals. In this program, I changed the approach in fastica from symm to defl. The results of the three methods fastica, JADE and SOBI are almost same. However, the order of results are different, and amplitude is also different. It is because ICA cannot guarantee the order and amplitude.

### Ex4

A common problem in EEG applications is that the EEG is susceptible to artifacts in the data acquisition. In this program, it is trying to remove EOG artifacts from EEG signals. There are three methods for channel denoising: JADE, NSCA and advanced method from OSET package. After independent component analysis, each electrode can be decomposed into different components through the algorithm, and then extract and remove EOG artifacts from EEG signals. Here, I change fs from 250 to 500. After running the program, there is slight difference between these methods.

### Ex5

This script is imported form the OSET. Running testPCAICAPiCAfECGDenoising, this script compares different methods on fetal ECG denoising methods, like JADE, SOBI and PiCA. They try to separate fetal and mother activity. Signals of the ECG are decomposed, and the performances of PCA, ICA and PiCA are different. The order of the decomposing signal is different, which is the feature of these methods.