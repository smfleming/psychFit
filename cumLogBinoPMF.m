function pmf = cumLogBinoPMF(x, mu, slope, N, k)
% Gets binomial probability masses for fitting the logistic psychometric function
%
% SF 2014

for i = 1:length(x)
    
    % get predicted prob for this parameter setting
    pc = 1/(1+exp(-slope.*(x(i)-mu)));
    % get binomial pmf relating choices to predicted pc
    pmf(i) = nchoosek(N(i),k(i)).*(pc.^k(i)).*((1-pc).^(N(i)-k(i)));
    
end