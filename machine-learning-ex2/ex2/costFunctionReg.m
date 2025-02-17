function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta





for i = 1:m
	xi = X(i,:);
	hi = sigmoid(theta'*xi');
	costi = -y(i) * log(hi) - (1-y(i)) * log (1-hi);
	J = J + costi;
	grad = grad + (hi - y(i)).*xi';
endfor

J = J/m;
grad = grad/m;

%adding regularized components.
theta_reg = theta(2:end);
J = J + (theta_reg' * theta_reg) * lambda / 2 / m;

%remove grad(0)
grad_reg = grad(2:end);
grad_reg = grad_reg + lambda/m .* theta_reg;
grad (2:end) =  grad_reg;


% =============================================================

end
