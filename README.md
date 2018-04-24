# Econometrics_Seminar

Identification problems in workhorse econometric models: the case of the GARCH model

This ﬁle contains the replication ﬁle for ”Identiﬁcation problems in workhorse Econometric models: The case of the GARCH model” 
All calculations carried out using MATLAB (R2016b).

Programs Figures: all density estimators are made the same way. the number of bins are changed.



Functions: 
The functions below are used in the programs that plot ﬁgures. The functions are organized by category.

Finite-sample Distributions for the GARCH(1,1) Model

(1) density simulation.m: This function simulates all the parameters and histograms.
(2) garchsimulate.m: This function simulates a GARCH(P,Q) time series.
(3) garchpg.m: This function includes the GARCH(P,Q) parameter estimation with normal innovations using analytic derivatives.
(4) garchlikelihood.m: Likelihood and analytic derivatives for garchpq.
(5) garchcore.m: Forward recursion to construct h’s, used in the garchlikelihood.m
(6) garchgrad.m: analytic gradient m ﬁle fo garchpq(use MEX ﬁle), used in garchlikelihood.m

Finite-sample Distributions for the GARCH(1,1)-t Model

(1) totaal student.m: This function simulates all the parameters and t-values.
(2) tarch simulate.m: TARCH(P,O,Q) time series simulation with multiple error distributions.
(3) tarch.m: This is a TARCH(P,O,Q) parameter estimation function with diﬀerent error distributions. If O = 0, it is a GARCH(P,Q) model.
(4) tarch core.m: Conditional variance computation for a TARCH(P,O,Q) process.
(5) hessian 2sided.m: Computes 2-sided ﬁnite diﬀerence Hessian.
(6) iscompatible.m: Check whether a set of input parameters is compatible with a requested output size.
(7) tarch starting values.m: Perform a grid search to ﬁnd decent starting values for TARCH(P,O,Q) estimation. If starting values are user supplied (and thus nonempty), reformats starting values depending on error type.
(8) tarch transform.m: TARCH(P,O,Q) parameter transformation. Used to map parameters from a TARCH process to the positive unit simplex. Used in the estimation of TARCH.
(9) tarch itransform.m: TARCH(P,O,Q) inverse parameter transformation. Used to map parameters from the real line to a set of parameters appropriate for a TARCH model. Used in the estimation of TARCH.
(10) tarch likelihood.m: Log likelihood for TARCH(P,O,Q) estimation.
(11) tarch parameter check.m: TARCH(P,O,Q) input validation. Ensures that the input parameters are conformable to what is expected.
(12) normloglik.m: Log-likelihood for the normal distribution.
(13) robustvcv.m: Compute Robust Variance Covariance matrix numerically, including Newey-West style score covariance using 2-sided derivatives.
(14) stdtloglik.m: Log likelihood of the Standardized T distribution.
(15) stdtrnd.m: Generate random variables from a Standardized T distribution with V degrees of freedom.

