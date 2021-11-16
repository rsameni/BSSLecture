# BSS Lecture Codes
## Reza Sameni
## Emory University Department of Biomedical Informatics

A short lecture of blind-source separation algorithms with practical examples in Matlab
### BMI 500 Week 11 Assignment
### Student Name: Gulay Bengu Ulukaya
### Student Email: gulukay@emory.edu
***
### Question 1
#### Part A
Below is the calculation of the eigenvalues and eigenvectors of the matrix 𝐶 = (5 1;1 2) by mathematical derivation. 
The first image shows the calculation of eigenvalues of this matrix to be 1.6972 and 5.3028.
The second image shows the calculation of eigenvectors of this matrix to be [-(-3+sqrt(13))/2 1] and (3+sqrt(13))/2 1]. 
These are the null space vectors derived from each eigenvalue of this matrix.

![image](https://user-images.githubusercontent.com/61863714/140797215-66fdf257-21e4-4b58-9f17-1fdfe76e85e3.png)
![image](https://user-images.githubusercontent.com/61863714/140797251-1eedf3bc-cee6-44a3-af27-48c8e29abe79.png)

#### Part B
Below is the calculation of the eigenvalues and eigenvectors of the matrix 𝐶 = (5 1;1 2) by MATLAB function eig().
The columns of V present eigenvectors of A. The diagonal matrix D contains eigenvalues.

![image](https://user-images.githubusercontent.com/61863714/140797943-f5446c9a-0ea3-4851-be13-deac4ebdc244.png)

From the diagonal matrix D, we can visually confirm that the manual and MATLAB computations of the two eigenvalues are equal to be 1.6972 and 5.3028.
However, we need to confirm that the eigenvectors from MATLAB, [0.2898 -0.9571] and [-0.9571 -0.2898], are within the null space vectors that are manually calculated. The confirmation is below:

![image](https://user-images.githubusercontent.com/61863714/140797310-90d3a714-3f0b-4038-9117-b4da195dd91c.png)

From this calculation, we can conclude that the MATLAB calculated eigenvectors are within the manually calculated null space vectors.
***
### Question 2
#### Part A
I have manipulated the Ex02 m. file to calculate the eigenvalues and eigenvectors of the matrix 𝐶 = (5 1;1 2) by using the Power Method.
The screenshot of the edited script is below:

![image](https://user-images.githubusercontent.com/61863714/140798950-b4db21e9-f07f-4aa3-a709-c3631c2a2121.png)

The result is below:

![image](https://user-images.githubusercontent.com/61863714/140799091-f19289d2-efc6-4bcb-a308-52f3ea9643c4.png)

From this calculation, we can conclude that by using the Power Method with 100 iterations calculated eigenvectors, [0.2898 -0.9571] and [-0.9571 -0.2898], and eigenvalues, 1.6972 and 5.3028, are the same as the eig() function.

#### Part B
I have manipulated the Ex02 m. file to calculate the eigenvalues and eigenvectors of the matrix 𝐶 = (5 1;1 2) by using the Power Method.
The screenshot of the edited script is below:

![image](https://user-images.githubusercontent.com/61863714/140799255-8f709e27-276a-4656-800a-8d02b53db099.png)

The resulting leading eigenvalue and two entries of the principal vector for each of the first 20 iterations of the Power Method are in a table below:

![image](https://user-images.githubusercontent.com/61863714/140800383-7890b761-c2f0-4a22-9b40-2a8a649ad245.png)

Plot of the leading eigenvalue and two entries of the principal vector for each of the first 20 iterations of the Power Method are plotted below:

![image](https://user-images.githubusercontent.com/61863714/140800613-4a7d9ccd-d4af-4029-8edc-4a5fc3febf6f.png)
***
### Question 3
#### Part A
I have revised (by change of parameters or input signals and adding comments) and rerun the MATLAB sample m-files Ex01 to Ex05 from the BSS lecture repository.
The edited m-files Ex01 to Ex05 are commited to this fork.

#### Part B
#### Ex01
testPCA method in this Matlab script is used to reduce components from the original data and compressing the data by extracting the most prominent features to best represent the data. Depending on the PCA threshold, the reduced component signal gets closer or further away from the original data. The method calculates covariance matrix, and gets all eigenvalues and eigenvectors, while eventually keeping the most descriptive eigenvalues. Functionality of this function, PCA in general, is that by using the most representative features, we can get a signal very close to the original signal for efficiency in computing.
#### Ex02
This script calculates the eigenvalues and eigenvectors of a matrix by using the power method. As the number of iterations increase, the result from the power function gets closer to the actual eigenvalues and eigenvectors of the matrix, and at some iteration converges to these values. After convergence, the power method approximation of all values remain constant, no matter how many more iterations are performed. Functionality of this function arises from its efficiency, especially compared to the eig() function in Matlab. However, excessive iterations after convergence can reduce this efficiency. 
#### Ex03
This script runs three different methods for independent component analysis, which are FactICA, SOBI and JADE and by applying these methods on an EEG dataset, compares the results. Independent component analysis is an essential method for compressing signals by extracting dominant features and keeping the compressed signal close to the original signal with all features, while increasing efficiency. The independent component analysis results from all three methods looks similar when comparing the most important features, where in the top ranks the order changes but the selected signals are the same. And the resulting compressed data is very similar to the original data.
#### Ex04
This script is used to remove electrooculographic (EOG) signals from EEG signals. EOG signals are treated as noise and JADE and NSCA methods are used for this procedure and results are compared. The script assumes that the electrode is picking up both EEG and EOG signals and their independence from each other. The script separates the signal from electrodes into different components, removes detected EOG and reconstructs a de-noised signal with the intended EEG signal.  The component selection for EOG is critical because when done right it is de-noising the EEG signal however with incorrectly selected components, it can remove essential parts of the EEG signal. The script also plots the reconstructed signals when JADE is utilized and when NSCA is utilized. We can see that there are differences between the two methods, so we can conclude that this is a delicate process and the optimal method should be used to remove the intended signals.
#### Ex05
This script is from OSET/testPrograms. The input data is ECG monitoring of fetus by having electrodes on the mother’s stomach. However, the input data has signals from both the fetus and the mother. The algorithm aims to separate fetal signals from the maternal signals. Many methods are used for blind source separation such as PCA, ICA, PiCA, FastICA, JADE and SOBI. The results from the signals all look similar to each other. It is difficult to assess which method provides the best separated fetal ECG, but from the plots it seems like PiCA method shows the least noisy signal compared to others.

***
### Question 4
#### Part A
Paper selected: Lee, T. W., & Lewicki, M. S. (2002). Unsupervised image classification, segmentation, and enhancement using ICA mixture models. IEEE Trans Image Process, 11(3), 270-279. https://doi.org/10.1109/83.988960

This paper works on learning algorithms of blind source separation by independent component analysis mixture model. Methods are benchmarked on real world data sets and also synthetically produced data sets. These data sets are classified using blind source separation by independent component analysis mixture model and accuracy of classification is measured to benchmark the method.

Blind source separation by independent component analysis is a currently used method for processing signals like medical signals and enhancing speech. The aim for this method is to make the variables less statistically dependent from each other by finding a linear nonorthogonal coordinate system and re-structuring the data.

Independent component analysis is limited in the way that it assumes independence of sources. However, by implementing mixture models, the stress on this assumption is reduced. In independent component analysis mixture model, the data is categorized into separate classes and then independent component analysis is applied. This means that after separation into these mutually exclusive classes, data in each class separately is assumed to have been generated by a linear combination of independent and non-Gaussian sources. 

Independent component analysis mixture model pseudo-code based on (Lee & Lewicki, 2002):

•	Assume data are independent and generated by mixture density model

•	Calculate joint density

•	Separation into mutually exclusive classes

•	Calculate mixture density

•	Compute log-likelihood for each class

•	Compute probability of each class given the data vector

•	Adapt basis functions and bias terms for each class using gradient ascent

•	Adaptation with mixture density model is applied, proceed with unsupervised classification

Resource:
Lee, T. W., & Lewicki, M. S. (2002). Unsupervised image classification, segmentation, and enhancement using ICA mixture models. IEEE Trans Image Process, 11(3), 270-279. https://doi.org/10.1109/83.988960 


