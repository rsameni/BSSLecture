# BSS Lecture Codes
## Reza Sameni
## Emory University Department of Biomedical Informatics

A short lecture of blind-source separation algorithms with practical examples in Matlab

### Student Name: Nichole Etienne 
### Student Email: Nichole.etienne@emory.edu
***
### Question 1
#### Part A
![image](https://user-images.githubusercontent.com/90157048/140821936-c12d791c-4c3d-48f0-944c-0e8fe2159ebb.png)
![image](https://user-images.githubusercontent.com/90157048/140822014-50af773a-eb9e-480c-b230-0b6cacafefe2.png)

#### Part B
![image](https://user-images.githubusercontent.com/90157048/140822054-43de1bb6-a7e4-47f1-a4d1-fccffb5b4661.png)
The results are the same. 

***
### Question 2
#### Part A
![image](https://user-images.githubusercontent.com/90157048/140822166-7ffe07b3-f0ab-4eb7-80d9-df0fd960ddc8.png)

#### Part B
![image](https://user-images.githubusercontent.com/90157048/140822235-8a1e829b-e905-40cd-bc7b-41e23e3d61ed.png)
![image](https://user-images.githubusercontent.com/90157048/140822247-561c27a7-675e-43e9-b94a-9e8486487dc7.png)

***
### Question 3
#### Part A
EX01
![image](https://user-images.githubusercontent.com/90157048/140822354-ae981e68-8e88-46f6-b741-b65bd85805b8.png)
![image](https://user-images.githubusercontent.com/90157048/140822371-e1c61a13-2477-43f6-9f4c-c9058e5d279a.png)
![image](https://user-images.githubusercontent.com/90157048/140822419-a7383082-64ac-4dfd-aacc-e67509bb58ec.png)

In ex01, a change was made in the cut off threshold for the eigenvalues. It was reduced significantly from 99.9 to 50 .Interestingly changing the cut off threshold for the eigenvalues did not cause significant changes the results. Changes can however be seen in the results columns where numerous columns were populated with the value of zero. It is important to note that 1 extra channel was computed but the compressed data is no longer visible!

***
Ex02

Changes were made in the in the number of iterations, reducing it 50 . 
Results prior to reduction : 
![image](https://user-images.githubusercontent.com/90157048/140822573-4d1688ac-39d1-4b35-8e93-4e357543d267.png)

Results after reduction :
![image](https://user-images.githubusercontent.com/90157048/140825871-37a11bb1-c8c8-4913-8ce9-bb529b4113d4.png)

In Ex02 , lambda 1 and 2 have increased. However, the values on the diagonal  of the eigenvalues and eigenvectors. 

***
### Question 4
#### Part A
The article selected is EG signal classification using PCA, ICA, LDA and support vector machines. The authors aimed to address the issue of complexity, fluctuation and the need for doctors to evaluate the EGG signals. The authors created a signal processing and analysis framework for Electroencephalogram (EEG).  The signals were decomposed into the frequency sub-bands using Discrete wavelet transform (DWT). The sub-bands to represent the distribution of wavelet coefficients was also used to extract features. Their data was reduced using Principal Component Analysis and linear discriminant analysis. With the dimension reduced the authors, used the features and an input for a support vector machine with epileptic seizure or not as the output. 
***





