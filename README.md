# BSS Lecture Codes
## Reza Sameni
## Emory University Department of Biomedical Informatics

A short lecture of blind-source separation algorithms with practical examples in Matlab

### Student Name: SARTHAK SATPATHY
### Student Email: sarthak.satpathy@emory.edu
***
### Question 1
#### Part A
[Your report]
#### Part B
[Your report]
#### Part C
[Your report]
…
***
### Question 2
#### Part A
[Your report]
…
***
### Question 3
#### Part A
[Your report]
#### Part B
[Your report]
#### Part C
[Your report]
#### Part D
[Your report]
#### Part E
[Your report]

…
***
### Question 4
#### Part A

Article: Cao, L. J., Chua, K. S., Chong, W. K., Lee, H. P., & Gu, Q. M. (2003). A comparison of PCA, KPCA and ICA for dimensionality reduction in
support vector machine. Neurocomputing, 55(1-2), 321-336. DOI: https://doi.org/10.1016/S0925-2312(03)00433-8

Topic: Relationship between ICA and machine learning algorithms

Report:
Support Vector Machine is a supervised learning algorithm for classification and regression analysis. It is now commonplace in time-series forecasting. The paper hypothesizes that the SVM with feature extraction using principal component analysis (PCA), kernel principal component analysis (KPCA) and independent component analysis (ICA) outperforms the SVM without these steps. They were also successful in establishing that for their experiments KPCA and ICA are more efficient than PCA. The PCA algorithm involves the linear transformation of each of the input vectors x<sub>t</sub>. using an orthogonal matrix whose columns are eigenvectors of the covariance matrix. The eigenvectors are arranged in descending order and the first few principal components are of interest. KPCA method maps the input vector to a high dimensional feature space. The linear PCA in this high dimensional feature space would be equivalent to a non-linear PCA in the input vectors. Blind source separation (BSS) methods are developed to identify unknown source signals that are mutually independent of their linear mixtures without the knowledge of their mixing coefficients. Hence, ICA, a BSS example, involves two preprocessing steps: making input vectors zero mean and whitening the input variable.  The un-mixing matrix is calculated by maximizing negentropy. The advantage of ICA over PCA is that the components are statistically independent and not merely uncorrelated and the use of unmixing matrix rather than the orthogonal matrix. The authors used sunspot, Santa Fe and a couple of financial datasets. The performance was evaluated primarily by normalized mean square error(NMSE) and eventually also by CPU usage. The key takebacks are that NMSE was lower for ICA and KPCA than PCA. However, the reduced error for KPCA was at the cost of computation. 

