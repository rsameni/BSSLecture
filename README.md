# BSS Lecture Codes
## Reza Sameni
## Emory University Department of Biomedical Informatics

A short lecture of blind-source separation algorithms with practical examples in Matlab
### Student Name: Retta El Sayed
### Student Email: relsay2@emory.edu
***
### Question 1
#### Part A
Image of handwritten calculation of eigenvalues and eigenvectors:![q1p1](https://user-images.githubusercontent.com/64221087/140610263-2ec08f55-c7d7-4ab1-8ec7-b355457eeef9.JPG)
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

- Code 4: Ex04_testEOGArtifactRemoval.m
- Code 5: Ex05_testFetalECGExtraction.m
***

### Question 4
#### Part A
[Your report]

#### Part B
[Your report]
***
