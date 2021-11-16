# Frank Chien BSS Lab
## Assigned by Reza Sameni
## Emory University Department of Biomedical Informatics
## 11/8/2021

Question 1A:
Please find scanned file named Question 1A scan for the hand-derived Eigenvalues and Eigenvectors of the 2x2 matrix [5 1 ; 1 2]
This was confirmed using matlab on the file BMI_500_Week11.m
The eigenvalues computed were lambda = 1.69 corresponding to the eigenvector [0.29; -0.96], and lambda = 5.30 corresponding to eigenvector [-0.96; -0.29]

Question 2A:
A 2x1 columnar vector [1;0] was used to iteratively estimate the dominant eigenvalue. After 20 iterations, a lambda of 5.3028 was computed. 
Please find the attached matlab file

Question 3
ex01 -> Principal component analysis using both eegdata and sampleeegdata2. 34 figures are produced showing tracings from 26 channels. Each are reviewed. Raw data chanels were are also plotted and given in figure 2-8. Figure 9 shows channel 1 with periodic high amplitude tracings, otherwise the remaining appeared noisy without noticeable pattern. In case number 2 corresponding to sampleECG2 data, 20 figures were produced with 15 channels compressed. On case 1, fs was originally 250. A fs of 50 was tried. The notable difference here is the compressed tracings had much higher amplitude than at fs of 250

ex02 -> power method for eignevalue. Number of iterations were changed, starting from the default 500. At 500 interations, the eigenvalues computed were identical to the computed eigenvalues using eig() function to 4 significant figures. At 10 iterations, this continued to be true, however, at 9 iterations the eigenvalues estimated by the power method started to become different at the second significant figure. 8 or fewer iterations yielded very poor estimates.

ex03 -> ICA using classical methods. Ex03 was run using each of the 3 examples and results visualized. The samples visualized were from the OSET package eegdata and sampleecg2 data, as well as case 3 being defined sine wave with noise added. For example 3, the raw data including 3 data channels were visualized. Sources were extracted by SOBI, fatsica and JADE overall showing similar results. Each was able to distinguish 2 sine waves of different frequency, which at a glance one can recognize will sum into a sine wave within another sine wave pattern. For SOBI method, the number of covariance matrixes was changed from 500 to 5, without significant change in output. of note, a 3rd channel with a jagged-appearance to the periodic wave pattern ramped to the right with a steep dropoff in SOBI and JADE, but had a steep incline with declining ramp to the right on the fatsica pattern.

ex04 -> with EOG noise removal. EOG is electrooculagram movement and represents noise in the ECG. Channel denoising was performed by Jade and NSCA. The program was run and resultings plots visualized.

ex05 -> fetal ecg signals using ICA algorithms. The first commented OSET script was uncommented and ran (testECGICAPCAPiCAPlot1). The resulting 17 figures were reviewed. On Figure 13-16, tracings labelled piC1 through piC15. On piC1-4, recognizable ECG tracings are seen, whereas as we get to higher C-numbered tracings more and more noise appears to be added until individual tracings are unrecognizable by the higher numbers. Figures 9-12 shows a similar pattern, where lower number PCs show recognizable traces whereas later ones are noisy. Plots 5-8 show the same tracings using IC instead of PC. Figures 1-3 show the original 12 ECG tracings.

Question 4: Summary of the paper cited below
A comparison of PCA, KPCA and ICA for dimensionality reduction in support vector machine
Cao, L. J., et al. "A comparison of PCA, KPCA and ICA for dimensionality reduction in support vector machine." Neurocomputing 55.1-2 (2003): 321-336.

This paper explores the efficacy of using principal component analysis (PCA), kernel principal component analysis (KPCA), and independent component analysis (ICA) as methods for feature extraction prior to their application in a support vector machine (SVM) algorithm. These three methods of feature extraction serve to reduce the dimensionality of the dataspace, with the goal of decreasing the contribution of irrelevant or correlated attributes. Principal component analysis calculates the eigen vectors of the covariance matrix to produce a set of uncorrelated vectors. KPCA generalizes the kernel method into PCA and allows for nonlinear PCA. Finally, ICA is another linear transformation which attempts to identify statistically independent components, and is widely used in the context of blind source separation. 

Following feature extraction with one of the three methods, data was then used as input for an SVM algorithm. These combined algorithms were then implemented on a diverse array of datasets, including the Sunspot dataset, Santa Fe A dataset, as well as financial data from 5 sets of financial futures obtained from the Chicago Mercantile Market. Performance for of each algorithm was measured using the residual mean square error (RMSE). Parameters for each strategy were optimized until the minimum RMSE could be obtained, and compared across algorithms. Additionally, RMSE was computed using SVM without dimensionality reduction. The authors compared resulting RMSEs, with lower values indicating increased algorithm performance. In review of the data, the authors show that using any feature extraction algorithm yielded lower RMSE (and thus superior performance) than applying SVM to the dataset alone. Additionally, KPCA+SVM consistently outperformed ICA+SVM, which in turn outperformed PCA+SVM. However, KPCA was also more computationally expensive, requiring orders of magnitude more CPU use time compared to the other methods of feature extraction. In concluding remarks, the authors speculate that KPCA and ICA can use higher order information from the original input, whereas the covariance matrix used in PCA uses second order information.

Pseudocode

For each of datasets [Sunspot, Santa Fe A, Financial set 1, financial set 2, financial set 3, financial set 4, financial set 4]
    Separate dataset into training set and validation set
    For each feature extraction method [PCA, KPCA, ICA]
        Compute feature extraction on dataset
        Compute RMSE
        Iteratively adjust parameters of feature extraction method to minimize RMSE

FastICA
    Let x = (x1, x2, ... x_m)^T, a m dimensional observed variable
    Let s = (S1, s2... x_n)^% a n dimensional transform
    let W be a weight matrix
    S=Wx
    
ICA - FastICA was implemented by authors as a means of BSS per the following citation:
A. Hyvarinen, "Fast and robust fixed-point algorithms for independent component analysis," in IEEE Transactions on Neural Networks, vol. 10, no. 3, pp. 626-634, May 1999, doi: 10.1109/72.761722.