% BMI 500 HW 11 Blind Source Separation

C = [5 1; 1 2];
[V,D] = eig(C);

V;                % eigenvectors
e = nonzeros(D);  % eigenvalues

%% Q2 EigenAnalysis Power method

C = [5 1; 1 2];
v0 = rand(2,1);
v = EigenAnalysisPowerMethod(C,v0,50);
scale = (C*v)./v;
lambda = mean(scale);

%% Q2B

C = [5 1; 1 2];
v0 = rand(2,1);
v = v0(:); % initial vector
N = 20;    % number of iterations
for k = 1 : N
    v = C * v;
    v = v / sqrt(v' * v);
    v_all(k,:) = v;
    val(k) = mean((C*v)./v);
end

figure; 
subplot(1,2,1)
plot(1:N,v_all(:,1));
hold on; plot(1:N,v_all(:,2));
xlabel('Iteration')
title('Principle vector');
legend('v(1)','v(2)');

subplot(1,2,2)
plot(1:N,val);
xlabel('Iteration')
title('Leading eigenvalue')
