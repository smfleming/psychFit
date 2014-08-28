function pred = cumLogPred(x, mu, slope)
% Gets predicted values for logistic psychometric function
% pred = cumLogPred(x, mu, sig)
%
% SF 2012

for i = 1:length(x)
    
    % get predicted pc for this parameter setting
    pred(i) = 1/(1+exp(-slope.*(x(i)-mu)));

end