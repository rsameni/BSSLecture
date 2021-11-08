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
[Your report] 
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


