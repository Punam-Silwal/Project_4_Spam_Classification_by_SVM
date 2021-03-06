function [C, sigma_] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma_ = 0.3;

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
%min_err = 1000;
val = [0.01,0.03,0.1,0.3,1,3,10,30];
results = [];
len = numel(val);
for i = 1:len;
    for j = 1:len;
        C_test = val(i);
        sigma_test = val(j);
        
        model= svmTrain(X, y, C_test, @(x1, x2) gaussianKernel(x1, x2, sigma_test));
        predictions = svmPredict(model, Xval);
        err = mean(double(predictions ~= yval));
        
        %err_min = min(err);
        results = [results; C_test sigma_test err];
        %if err < min_err
            %max_accuracy = err;
            %bestC = C_test;
            %bestsigma = sigma_test;
        %end
        %save all prediction histroy
       
        
        %results = [results; C_temp, sigma_temp, err];
        
        end
end
    
%[minColumnErr, minColumnErrIdx] = min(err);
%[minErr, minErrIdx] = min(minColumnErr);
%result
%fprintf(['best fit values for C = %f, sigma = %f, max_accuracy = %f\n'], bestC, bestsigma, max_accuracy);
[min_err, idx] = min(results(:, 3));
C = results(idx, 1);
sigma = results(idx, 2);
fprintf(['best fit values for C = %f, sigma = %f, max_accuracy = %f\n'], C, sigma, min_err);
     





% =========================================================================

end
