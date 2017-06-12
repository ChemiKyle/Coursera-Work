function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

% Problem can be solved with vectorization, may be size dependent like Normal
use_vector_method = 0;
if m < 10000
  use_vector_method = 1;
end


for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta.
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %

    % Same method from binary data set works since it's a vector
    if logical(use_vector_method)
      d_J_d_theta = ((((X*theta) - y)')*X)';
      theta = theta - (1/m)*(alpha)*d_J_d_theta;
    else
      % TODO: iterative implementation for arbitrarily sized theta
    end
    % ============================================================

    % Save the cost J in every iteration
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
