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
PCA or Principal Component Analysis is a very important analysis tool in dealing with large data sets with a lot of variables. It aims to reduce the number of variables without losing a lot of accuracies while trying to simplify the dataset. In my research area medical imaging using MRI, such tools are very helpful in analyzing large datasets. Before changing any parameters in the code, I had to understand how does PCA work and as a summary the pipeline include data standardization (rescaling the data to have a mean of 0 and a standard deviation of 1) includes how many channels we have, calculating the covariance of the input and Eigenvalue decomposition 
In the updated code I changed the sampling frequency and used another sample ECG signal to see how these parameters affect PCA. The sampling frequency is a very important aspect since a lower sampling frequency can affect the results.

- Code 2: Ex02_Ex02_testEigenAnalysisPowerMethod.m
The script was updated in question 2 where the eigenvalues of a C matrix were calculated. The updated scripts also has a plot of the principle vector iteration for each of the values. 
- Code 3: Ex03_testICAmethods.m
This code used the different Independent component analyses using classical methods. Based on the resulting figures we see that the signal, the order, and the amplitude of the 3 methods are different, which is what we would expect since none of these methods can guarantee the order, the sign, nor the amplitude of the signal. 
We see very good results with the different methods but usually Jade is good for noisy data. 
Two things I tested in this code is when changing the interavtivePCA from off to on we get to choose which eigenvalue to use by entering the index. Another thing I change is the amount of noise from a small amount of 0.01 to 0.1 noise to see how Jade which method will be the best with noisy data. After looking at the figure below we see jade resolves the noise from the signal in a better manner than the other methods.  
![JadeNoise](https://user-images.githubusercontent.com/64221087/140817896-5232e1ce-9458-4a6e-80a2-9b45f8694efd.JPG)
- Code 4: Ex04_testEOGArtifactRemoval.m
This code tested the removal of the EOG artifact using Jade and NSCA. Both methods show very good results for the denoising of each channel. For this specific code, I decided to test the different parameters of NSCA (nonstationary component analysis) by changing J desired time windows to be less than the threshold and I also observed how the welch power spectral changed.
- Code 5: Ex05_testFetalECGExtraction.m
This code was very interesting to test and see the different demos provide. The code performed fetal ECG extraction using different ICA algorithms (JADE, SOBI, PiPC). The difference between Pseudo-Periodic Component Analysis in fetal and maternal-fetal based was interesting to analyze. I also tested the rest of the demos. 
***

### Question 4
#### Part A
 Choose one of the following papers and write a summary of the paper in 250 words or more
including the pseudo-code of the BSS algorithm of the paper:

The paper I choose is: Lu, Wei, and Jagath C. Rajapakse. "Approach and applications of constrained ICA." IEEE transactions on neural networks 16.1 (2005): 203-212. DOI: https://doi.org/10.1109/TNN.2004.836795 Constrained ICA with image processing applications

Summary: 
This work investigated constrained independent component analysis (cICA), due to the need for a systematic and flexible method to incorporate more assumptions and prior information in the data set. This work aims to provide constraints to reduce the dimensionality of the output of the ICA. 
 cICA framework includes the use of Lagrange multipliers to find an optimal solution.  cICA consistency, asymptotic variance, robustness depend on the constraints in the objective function. therefore, parameters should be and adjusted to keep both independence criteria and constraint properties valid all the time.
This paper tested the cICA with two cICA applications by extracting real face images and fMRI data. The face images data were recovered using different algorithms showing where the total performance index and peak signal to noise ratios were calculated. This method using the less complete ICA  showed better results in comparison to other algorithms. For the FMRI data, the data was preprocessed by denoising, applying smoothing filters, and correcting for artifacts. The brain activation was detected using the ICA with postselection, ICA-R, and the SPM technique, where the ON-OFF stimulation was used as the reference signal.
Overall, cICA technique is more useful than traditional ICA methods when reference signals and useful constraints are incorporated. Both face detection and fMRI results showed good results including the separation of the signal and reduction of dimensionality. The main challenges are choosing the proper threshold and the correct type of constraints. 

***
