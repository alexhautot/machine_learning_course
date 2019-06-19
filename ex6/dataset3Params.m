function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = .1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
vals = zeros(8,8);

for i = 1:8,
  C=C*2^i;
  sigma = 0.3;
  for j = 1:8,
    sigma = sigma*i;
    sim = gaussianKernel(sigma)
    tetra = svmTrain(X, y, C, @(x1, x2)gaussianKernel(x1, x2, sigma))   
    hyp = svmPredict(tetra, Xval);
    cost = 0;
    for k= 1:length(hyp),
      if hyp(k) != yval(k),
        cost = cost + 1;
      endif
    end
    vals(i,j) = cost;
  end
end



[minval, row] = min(min(vals,[],2));
C = (2^row)*0.1; 
[minval, col] = min(min(vals,[],1));     
sigma = 0.3*col;




% =========================================================================

end
