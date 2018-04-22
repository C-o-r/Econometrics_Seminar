function [parameters, tvalues]=totaal_student(n, T, const, beta, pi, u )
%n number of times we simulate element of [500, 1000, 10000]
%T sample size element of [150, 250, 500]
%const constant to simulate data
%b b element of [0,2,4,12]
%pi pi element of [0, 0.2, 0.4, 0.6, 0.8]
%beta+pi <1

v= 1/u;
if( beta + pi >= 1 || pi<0 || beta < 0 || const <=0 )
    error('Warning: coefficients not according GARCH assumptions')
end

parameters = zeros(4,n);
tvalues = zeros(4,n);
par = [const; beta; pi; v];
for i = 1:n
    errors = tarch_simulate(T,par,1,0,1,'STUDENTST');
    [parameter, LL, ht, VCVrobust, VCV, scores] = tarch(errors, 1, 0, 1, 'STUDENTST');
    tvalues(:,i) = [parameter(1,1)/sqrt(VCV(1,1)); parameter(2,1)/sqrt(VCV(2,2)); parameter(3,1)/sqrt(VCV(3,3));  parameters(4,1)/sqrt(VCV(4,4))];
    parameters(:,i) = parameter; 
end

parameters = parameters';
tvalues = tvalues';
