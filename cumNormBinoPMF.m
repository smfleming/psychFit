function pmf = cumNormBinoPMF(x, mu, sig, N, k)
% Gets binomial probability masses for fitting the cumulative normal psychometric function
%
% SF 2012

for i = 1:length(x)
    
    % get predicted pc for this parameter setting
    pc = 0.5.*(1 + erf((x(i) - mu)./sqrt(2.*(sig.^2))));
    % get binomial pmf relating choices to predicted pc
    pmf(i) = nchoosek(N(i),k(i)).*(pc.^k(i)).*((1-pc).^(N(i)-k(i)));
end