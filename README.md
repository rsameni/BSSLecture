# HW11
Shaoyan Pan
shaoyank@gmail.com

####Question 1
###Part A
![IMG_2491](https://user-images.githubusercontent.com/89927506/140651823-3158749b-6e49-4615-906a-914bbb9246ea.jpg)

###Part B
The own results equal to the MALTBA's result


####Question 2
###Part A and B
The dominant eigenvalue is 5.3, the dominant eigenvector is [-1, -0.34].

![Q2B](https://user-images.githubusercontent.com/89927506/140651978-118536ca-0fe2-40c1-8dfc-27c63ce8b815.jpg)

####Question 3
###Part A
The testPCA (file 1) project the singal into other dimensions, and only extract the dominant features. We can see after the extraction, the recovered signal is very similar to the original singal. And if we decrease the PCA threshold, we can see the recovered singal is even more similar. That means, with more PCA components, the recovered singal is more similar to the original singal. But we don't really need to have so many PCA component to have an acceptable accuracy. This is the PCA's functionality. We don't need to have too many features but only a few important feature then we can have a approximately similar singal. Then we can reduce the dimensinoality so have more efficient computation.

###Part B
This method uses a power method to approximate the eigen value and eigen vector. The power method can be used to efficiently approximate the eigen features, but it can only approximate the extreme eigne values and its dominant eigenvectore. That means the power method is a very efficient method. Compare to the MATLAB's eig function, we can see the power method is faster. However, the power method can only gain the dominant eigen value and feature. In addition, if we increase the power iteration, we can see the eigen value and vector will be more similar to the correct eigen value and vector.

###Part C
ICA method is also very important signal algorithm to extract important features. ICA is extracting the features while maximize the independence between different features extracted by the ICA algorithm. We can see the independence between the different features are calculated by the convariance matrix calculated by the PCA then mutual information. Large cov matrix can result in more similar signals. We can also see the ICA components can approximately equal to the original signal. But since the ICA method can maximize the indepedence between different features, we can have a better featres to improve some classification, but it all depend on the task.

###Part D
We remove the noise by using various methods. This time, we mainly focus on analyze the NSCA method. We can see the NSCA method provide a very accurate and efficient method for us to denoise the signal. The NSCA method is really powerful. We analyze the NSCA method by setting different noise threholds. We can see by decrease the threshold, we can have a more dissimilar signal. That could means two aspects: first, more noises are removed. Secondly, maybe more original information from the signal is also removed. We need more time and experiment to figure whether the noise or the signal itself were removed. 

###Part E
This time we analyze the signal by a lot of different methods and then compare their performance. The different methods including the PCA, the JADE, SOBI, FastICA and PiCA with maternal-based, Fetal-based and Maternal-Fetal based. We can see each method provide a really good approximation signal with the original signal. That means we all provide a very similar signal with the original signal. Then we can say each method is a good method to provide very similar signal with the original signal. In my opinion, I think the PCA method provide the most recovered signal. But we don't know whether it is the best algorithm since the other method could provide better performance if we apply them in real application.

####Q3
This report analyze the algorithm from paper "Equivariant adaptive source separation". This is an algorithm analyze source separation by using Equivariant Adaptive Separation via Independence (EASI) algorithm. This algorithm define a serial update algorithm consists in specifying an matrix function y=H(x), which uses updating B <- B-gamma*H(x)B. This algorithm is to optimize an objective function loss(B). Then the function H and B can be obtained to blind identification. The paper present the stability and the algorithm convergence and it provide a good performance in more complex cases. This EASI including several steps to finish the algorithm: first, using a equivalent source separation (or other separation method) to create a equivalent estimator. Second, we update the serial matrix to update B <- B-gamma*H(x)B. Then we set up the loss function and compute the relative gradient to the B. Then we update the corresponding whitening matrix. Notice the update also have a orthogonal contrasts contraint so we whiltening the singal again. Then we can update the orthogonal matrix after the contrast function is minimized. (The paper also introduce a one stage solution so we can update the function H instead of updateing the whitening and orthogonal matrix by using athe above two stages.) Then we start to use the EASI algorithm (look at the equation. 32); or we can use the normalized EASI algorithm to further ignore the outliers.  The paper also shows the EASI algorithm have good stability and relatively fast convergence. Furthermore, it discuss the nonlinearlity.

