# BSS Lecture Codes
## Reza Sameni
## Emory University Department of Biomedical Informatics

A short lecture of blind-source separation algorithms with practical examples in Matlab

### Student Name: Daniela Chanci Arrubla
### Student Email: dchanci@emory.edu

### Question 1
#### Part A
![](/Figures/Q1_partA_1.jpg)
![](/Figures/Q1_partA_2.jpg)

### Part B
Matlab code:
```matlab
% Create C
C = [5 1; 1 2];

% Calculate eigenvalues and eigenvectors
[V,D] = eig(C);
```

Output:
```
C =

     5     1
     1     2


V =

    0.2898   -0.9571
   -0.9571   -0.2898


D =

    1.6972         0
         0    5.3028
```

### Question 2
#### Part A
Matlab code using the original EigenAnalysisPowerMethod function:
```matlab
% Calculate eigenvalues using the Power Method
Itr = 50;
v0 = rand(2, 1);
v1 = EigenAnalysisPowerMethod(C, v0, Itr);
scale1 = (C*v1)./v1;
lambda1 = mean(scale1);

Cx = C - lambda1 * (v1 * v1');
v2 = EigenAnalysisPowerMethod(Cx, v0, Itr);
scale2 = (C*v2)./v2;
lambda2 = mean(scale2);
```

Output:
```
lambda1 =

    5.3028


lambda2 =

    1.6972
```

#### Part B
Matlab code using modified EigenAnalysisPowerMethod function (Named EigenAnalysisPowerMethodPlot):
```matlab
% Plot entries of principal vector and leading eigenvalue
Itr = 20;
v0 = rand(2, 1);
v1 = EigenAnalysisPowerMethodPlot(C, v0, Itr);
```

EigenAnalysisPowerMethodPlot function:
```matlab
function v = EigenAnalysisPowerMethodPlot(A, v0, N)
% An implementation of the Power method for eigenvalue decomposition
%
% Inputs:
%   A: A square matrix
%   v0: An initial non-zero (random) vector, which matches in dimension with A
%   N: The number of power iterations
% Output:
%   v: An estimate of the leading eigenvalue after N iterations
%
% Reza Sameni (reza.sameni@gmail.com)
% Oct 2020
% Modified by Daniela Chanci Nov 2021
 
v = v0(:); % initial vector
V1 = zeros(1,20);
V2 = zeros(1,20);
D1 = zeros(1,20);
x = 1:N;
figure;
for k = 1 : N
    v = A * v;
    v = v / sqrt(v' * v);
    scale = (A*v)./v;
    lambda = mean(scale);
    V1(k) = v(1);
    V2(k) = v(2);
    D1(k) = lambda;
end

% Create plot 
plot(x, V1, 'LineWidth', 2);
hold on
plot(x, V2, 'LineWidth', 2);
hold on
plot(x, D1, 'LineWidth', 2);
xlabel('Iteration');
ylabel('Value');
legend('1st entry vector', '2st entry vector', 'Leading eigenvalue');
```

Output:

![](/Figures/Q2_partB.jpg)

### Question 3
#### Part A
* ```Ex01_testPCA.m```: Changed the example parameter from 1 to 2. The input signal is SampleECG2.
* ```Ex02_testEigenAnalysisPowerMethod.m```: Changed iterations to 50 and then 15. Commented the code. 
* ```Ex03_testICAmethods.m``` 
* ```Ex04_testEOGArtifactRemoval.m``` 
* ```Ex05_testFetalECGExtraction.m``` 

#### Part B
* ```Ex01_testPCA.m```: This code receives a 15 channel ECG signal as an input. This signal is then filtered to reduce the low frequency noise, and normalized by making all channels have a zero mean. The eigenvalues and eigenvectors of this preprocessed signal are calculated using the covariance matrix. Then, the code analyses which are the most significative eigenvalues, and outputs a compressed version for each raw channel based on a determined threshold, which in this case is 99.9. There is one plot for each channel displaying the raw signal and the compressed version; however, they are very similar and it is difficult to identify them. Therefore, the threshold used for the PCA in this example did not result in the loss of important information.
* ```Ex02_testEigenAnalysisPowerMethod.m```: This code finds the eigenvalues and eigenvectors using the eig built-in MATLAB function and the power method for eigenvalue decomposition. Both of them are applied on a random signal for which the covariance was previously calculated with the cov function. To analyze this code, I compared the results obtained with the MATLAB function, which are the ground truth, to the results obtained with the power methods, which are an approximation. First, I changed the number of iterations to 50 to see how good the approximation was. The three obtained eigenvalues were extremely similar to the ground truth, which shows that reducing the number of iterations to 50 can still produce satisfactory results. Last, I changed the number of iterations to 15 and the obtained eigenvalues were far from the ground truth. We can conclude that the incrementing the number of iterations results in better approximations.  
* ```Ex03_testICAmethods.m``` 
* ```Ex04_testEOGArtifactRemoval.m``` 
* ```Ex05_testFetalECGExtraction.m``` 