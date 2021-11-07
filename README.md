# BSS Lecture Codes
## Reza Sameni
## Emory University Department of Biomedical Informatics

A short lecture of blind-source separation algorithms with practical examples in Matlab
### Student Name: Sina Dabiri
### Student Email: sdabiri@emory.edu
***
### Question 1
#### Part A
![Eigen Values](problem_1A_eigVal0.jpg)
![Eigen Vectors](problem_1A_eigVal.jpg)
#### Part B
The Matlab implementation:
```install
>> C = [[5,1];[1,2]]
>> [vec,val]=eig(C)
vec =
    0.2898   -0.9571
   -0.9571   -0.2898
val =
    1.6972         0
         0    5.3028

```
Note the ratio of 0.9571/0.2898=3.3026 and 0.2898/0.9571=0.30279 are similar to the ratios we got (3.30278, and 0.302776). This is because the results are not unique but their ratio is.

***
### Question 2
#### Part A
```install
>> v0 = rand(2, 1);
>> v20 = EigenAnalysisPowerMethod([[5,1];[1,2]], v0, 20)
v20 =
    0.9571
    0.2898
```
#### Part B
This is an adaptation of Dr. Sameni's EigenAnalysisPowerMethod for N=20:
```install
[n,~] = size(A);
v0 = rand(n,1);

V = zeros(n,N);
v = v0(:); % initial vector

for k = 1 : N
    v = A * v;
    v = v / sqrt(v' * v);
    V(:,k) = v;
end


%% Plotting
figure(1)
% plot(1:N,V(:,1:N))
hold on
for p=1:N
    plot(V(:,p));
    legend();
end
hold off
title('The power method for Eigen');
xlabel('lambda 2');
ylabel('lambda 1');

```
![Power Method](Power_method.jpg)
***
### Question 2
#### Part A
[Your report]
