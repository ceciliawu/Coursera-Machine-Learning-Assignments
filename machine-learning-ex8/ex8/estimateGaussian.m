function [mu sigma2] = estimateGaussian(X)
%ESTIMATEGAUSSIAN This function estimates the parameters of a 
%Gaussian distribution using the data in X
%   [mu sigma2] = estimateGaussian(X), 
%   The input X is the dataset with each n-dimensional data point in one row
%   The output is an n-dimensional vector mu, the mean of the data set
%   and the variances sigma^2, an n x 1 vector
% 

% Useful variables
[m, n] = size(X);

% You should return these values correctly
mu = zeros(n, 1);
sigma2 = zeros(n, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the mean of the data and the variances
%               In particular, mu(i) should contain the mean of
%               the data for the i-th feature and sigma2(i)
%               should contain variance of the i-th feature.
%
sum_col = sum(X,1);
mu = sum_col ./ m;

mu = mu';

mu_expanded = reshape(repmat(mu',1,m),n,m)';
difference = X - mu_expanded;
difference_squared = power(difference,2);
sum_col_sigma2 = sum(difference_squared,1);
sigma2 = sum_col_sigma2 ./ m;
sigma2 = sigma2';











% =============================================================


end
