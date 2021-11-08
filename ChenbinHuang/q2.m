clc;clear; 

C = [5,1;1,2];

%% Q2A
% code from function  EigenAnalysisPowerMethod

v0 = rand(2, 1);
v1 = EigenAnalysisPowerMethod(C, v0, 100)
scale1 = (C*v1)./v1;
lambda1 = mean(scale1)

C_sub = C - lambda1 * (v1 * v1');
v2 = EigenAnalysisPowerMethod(C_sub, v0, 100)
scale2 = (C*v2)./v2;
lambda2 = mean(scale2)

%% Q2B
v = rand(2, 1);
vectors = zeros(20,2);
values = zeros(20,1);
for k = 1 : 20
    v = C * v;
    v = v / sqrt(v' * v);
    vectors(k,:) = v;
    scale = (C*v)./v;
    values(k) = mean(scale);
end
p1 = plot(1:20, vectors(:,1));
hold on;
p2 = plot(1:20, vectors(:,2));
legend([p1,p2],["First Entry of EigenVector","Second Entry of EigenVector"]);
title("Entries of EigenVector by iteration")
hold off;
f = gcf;
exportgraphics(f,"./ChenbinHuang/figs/q2b1.png");

plot(1:20, values);
title("Leading EigenValue by iteration")
f = gcf;
exportgraphics(f,"./ChenbinHuang/figs/q2b2.png");