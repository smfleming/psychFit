function paramDist = psychBoot(boot, x, N, params, method)
% Bootstraps psychometric function parameter estimates by sampling from the binomial
%
% SF 2012

mu = params(1);
sig = params(2);

switch method
    case 'normal'
        pred = cumNormPred(x, mu, sig);
    case 'normlapse'
        lamda = params(3);
        pred = cumNormLapsePred(x, mu, sig, lamda);
    case 'logistic'
        pred = cumLogPred(x, mu, sig);
end

for i = 1:boot
    sampData = binornd(N,pred);
    paramDist(i,:) = psychFit(x, sampData, N, params, method);
end