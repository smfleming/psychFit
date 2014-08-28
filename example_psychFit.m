% Example of using psychFit; demonstrates how lapse rate improves estimation of slope
%
% SF 2014

% Create toy data
x = [-1:0.25:1]; % stimulus axis
N = repmat(30,1,length(x)); % total trials at each stimulus level
k = [4 4 6 8 14 20 24 26 26]; % counts of responses associated with more +ve stimulus (e.g. "yes", "rightward", etc)

% Fit using different methods, plot fits
figure;
set(gcf, 'Position', [200 200 600 250]);

pArray = [0 0.5];   % initialise parameter search
params = psychFit(x,k,N,pArray,'normal');
subplot(1,3,1);
psychPlot(x,k,N,params,'normal');

pArray = [0 1];   % initialise parameter search
params = psychFit(x,k,N,pArray,'logistic');
subplot(1,3,2);
psychPlot(x,k,N,params,'logistic');

pArray = [0 1 0.1];   % initialise parameter search
params = psychFit(x,k,N,pArray,'normlapse');
subplot(1,3,3);
psychPlot(x,k,N,params,'normlapse');