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