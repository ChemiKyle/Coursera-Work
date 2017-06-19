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

% Run the non regularized function first
[J, grad] = costFunction(theta, X, y);

% Perform math on all but theta 1
J_theta = (lambda/(2*m))*(theta(2:end).**2);
grad_theta = (lambda/m)*(theta(2:end));

% Prepend theta(1)
J_theta = cat(1, theta(1), J_theta);
grad_theta = cat(1, 0, grad_theta); % Putting back theta(1) leads to an error

J = J + J_theta;
grad = grad + grad_theta'; % Oddly, this makes a 28*28 matrix if not using grad_theta'


% =============================================================

end
