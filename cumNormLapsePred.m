function pred = cumNormLapsePred(x, mu, sig, lamda)
% Gets predicted values for cumulative normal psychometric function with lapse rate lamda
%
% SF 2012

for i = 1:length(x)
    
    % get predicted pc for this parameter setting
    rho = 1./(sqrt(2.*pi).*sig);
        
    pred(i) = ((1-lamda).*0.5.*(1 + erf((x(i) - mu).*sqrt(pi).*rho))) + 0.5.*lamda;

end