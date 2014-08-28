function pmf = cumNormBinoPMF(x, mu, sig, lamda, N, k)
% Gets binomial probability masses for fitting the cumulative normal psychometric function
%
% Uses Prins' iAPLE method, assumes erroneous responses at
% asymptote are lapses
% SF 2012

for i = 1:length(x)
    
    % get predicted pc for this parameter setting
    rho = 1./(sqrt(2.*pi).*sig);
    
    pc = ((1-lamda).*0.5.*(1 + erf((x(i) - mu).*sqrt(pi).*rho))) + 0.5.*lamda;
    % get binomial pmf relating choices to predicted pc
    pmf(i) = nchoosek(N(i),k(i)).*(pc.^k(i)).*((1-pc).^(N(i)-k(i)));
    
end