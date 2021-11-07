
% Q1 a
A = [5,1;1,2];
[V,D] = eig(A);

%Q1 b
ite = 20;
x_int = [0.5;-1];
max_eigen_value=[];
max_eigen_vect = [];
for ind = 1:ite
    x_int = A*x_int;
    max_eigen_value(ind) = abs(max(x_int));
    x_int = x_int/abs(max(x_int));
    max_eigen_vect(ind,:) = x_int/sum(x_int.^2);
end

figure
hold on
plot(max_eigen_value)
plot(max_eigen_vect(:,1))
plot(max_eigen_vect(:,2))
legend('Eigen value','The first element of eigenvector','The second element of eigenvector')
xlabel('Iteration')
ylabel('value')


% Q2 c