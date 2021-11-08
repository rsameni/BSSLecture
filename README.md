# BSS Lecture Codes
## Reza Sameni
## Emory University Department of Biomedical Informatics

A short lecture of blind-source separation algorithms with practical examples in Matlab

### Student Name: Daniela Chanci Arrubla
### Student Email: dchanci@emory.edu

### Question 1
#### Part A
![](/Figures/Q1_partA_1.jpg)

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