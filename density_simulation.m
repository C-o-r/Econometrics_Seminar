function [result, tvalues]= density_simulation(n, T, const, b, pi )
%n number of times we simulate element of [500, 1000, 10000]
%T sample size element of [150, 250, 500]
%const constant to simulate data
%b b element of [0,2,4,12]
%pi pi element of [0, 0.2, 0.4, 0.6, 0.8]
%beta+pi <1

% PURPOSE:
%     Finding density functions for the GARCH(P,Q) coefficients; alpha,
%     beta and pi
% 
% USAGE:
%     [est_alpha, est_beta, est_pi, alpha_hist, beta_hist, pi_hist]= density_simulation(n, T,  p, q, const, b, pi )
% 
% INPUTS:
%    n:       number of times we simulate element of [500, 1000, 10000]
%    T:       sample size element of [150, 250, 500]
%    p:       Non-negative, scalar integer representing a model order of the ARCH 
%             process
%    q:       Positive, scalar integer representing a model order of the GARCH 
%             process: Q is the number of lags of the lagged conditional variances included
%             Can be empty([]) for ARCH process
%    const:   true value of the constant alpha
%    b:       b element of [0,2,4,12], where the true value of beta is
%             equal to sqrt(T)*b
%    pi:      true value of the coefficient pi element of [0, 0.2, 0.4, 0.6, 0.8]
%    beta+pi <1
% 
% OUTPUTS:
%    est_alpha: A [n X 1] vector of parameter coefficients of alpha
%    est_beta:  A [n X p] matrix of parameter coefficients of beta
%    est_pi     A [n X q] matrix of parameter coefficients of pi
%    alpha_hist:Histogram of the alpha coefficients
%    beta_hist: Histogram of the beta coefficients
%    pi_hist:   Histogram of the pi coefficients
% 
% COMMENTS:
% 
%   GARCH(P,Q) the following(wrong) constratins are used(they are right for the (1,1) case or any Arch case
%     (1) Omega > 0
%     (2) Alpha(i) >= 0 for i = 1,2,...P
%     (3) Beta(i)  >= 0 for i = 1,2,...Q
%     (4) sum(Alpha(i) + Beta(j)) < 1 for i = 1,2,...P and j = 1,2,...Q
%  
% Authors: Jan Jakob Heijenga, Alexander Kiel, Casper Witlox, Sander van Veen
% Revision: 1    Date: 03/18/2018

beta = b/sqrt(T);     
% calculate the true value of beta
if( beta + pi >= 1 || pi<0 || beta < 0 || const <=0 )
    error('Warning: coefficients not according GARCH assumptions')
end

%check if GARCH conditions hold
parameters = zeros(3,n);
tvalues = zeros(n,3);
par = [const; beta; pi];
for i = 1:n
    errors = garchsimulate(T,par ,1,1);
    [parameter, likelihood, ht, stderrors, robustSE, scores, grad] = garchpq(errors , 1 , 1);
    tvalues(i,:) = [parameter(1,1)/stderrors(1,1), parameter(2,1)/stderrors(2,2), parameter(3,1)/stderrors(3,3)];
    parameters(:,i) = parameter;
end
%find n times the parameter coefficients
result = [parameters(1, :)', parameters(2, :)', parameters(3, :)'];

