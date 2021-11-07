function [v, vec , scale]= EigenAnalysisPowerMethod(A, v0, N)
% An implementation of the Power method for eigenvalue decomposition
%
% Inputs:
%   A: A square matrix
%   v0: An initial non-zero (random) vector, which matches in dimension with A
%   N: The number of power iterations
% Output:
%   v: An estimate of the leading eigenvalue after N iterations
%   vec: the principle vector after each iteration 
%   scale:
%
% Reza Sameni (reza.sameni@gmail.com)
% Oct 2020
% The code was updated to an additional output for the estimated vector
% after each iteration and the scale 

v = v0(:); % initial vector
vec=zeros(2,N);
scale=zeros(2,N);
for k = 1 : N
    v = A * v;
    v = v / sqrt(v' * v);
    scale(:,k)=(A*v)./v;
    vec(:,k)=v;
end

