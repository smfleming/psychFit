function pred = cumNormPred(x, mu, sig)
% Gets predicted values for cumulative normal psychometric function
% pred = cumNormPred(x, mu, sig)
%
% SF 2012

for i = 1:length(x)
    
    % get predicted pc for this parameter setting
    pred(i) = 0.5.*(1 + erf((x(i) - mu)./sqrt(2.*(sig.^2))));

end