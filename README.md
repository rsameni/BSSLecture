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
However, we need to confirm that the eigenvectors from MATLAB are within the null space vectors that are manually calculated. The confirmation is below:

![image](https://user-images.githubusercontent.com/61863714/140797310-90d3a714-3f0b-4038-9117-b4da195dd91c.png)

From this calculation, we can conclude that the MATLAB calculated eigenvectors are within the manually calculated null space vectors.

***
### Question 2
#### Part A
[Your report]
… 
