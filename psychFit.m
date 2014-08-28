function params = psychFit(x, k, N, pArray, method)
% Wrapper code for maximum likelihood fitting of the psychometric function
%
% params = psychFit(x, k, N, pArray)
%
% x - x-axis bin values
% k - counts of response "A" in bin x(i)
% N - total number of responses in each bin
%
% pArray - starting values for parameters
% pArray(1) - mu
% pArray(2) - sig
% pArray(3) - lapse rate (only for normal + lapse model)
%
% method = 'normal', 'normlapse' or 'logistic'
%
% params - fitted values of mu and sig (and lamda)
%
% Steve Fleming 2014 sf102@nyu.edu

options = optimset;
[params fVal] = fminsearch(@fitfunc, pArray, options);

    function negLL = fitfunc(pArray)
                
                mu = pArray(1);
                sig = pArray(2);
                
                switch method
                    case 'normal'
                        pmf = cumNormBinoPMF(x, mu, sig, N, k);
                    case 'normlapse'
                        lamda = pArray(3);
                        pmf = cumNormLapseBinoPMF(x, mu, sig, lamda, N, k);
                    case 'logistic'
                        pmf = cumLogBinoPMF(x, mu, sig, N, k);
                end
                
                negLL = -sum(log(pmf));
                
    end

end