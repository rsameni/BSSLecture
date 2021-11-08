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