%ARX  Compute least squares estimate of ARX models.
%   
%  SYS = ARX(DATA, ORDERS)
%   estimates an ARX model SYS using input-output or time series data DATA.
%   SYS is an IDPOLY model representing the equation:
%     A(q) y(t) = B(q) u(t-nk) + e(t)
%   ARX estimates the coefficients of A and B polynomials along with their
%   standard deviations. The sample time of SYS is equal to that of DATA.
%
%   DATA is time- or frequency domain estimation data represented by an
%   IDDATA or IDFRD object. See HELP IDDATA or HELP IDFRD.
%
%   ORDERS = [na nb nk], the orders of A and B polynomials in the ARX model.
%   For multi-output systems, ORDERS has as many rows as there are outputs
%   na is then an ny|ny matrix whose i-j entry gives the order of the
%   polynomial (in the delay operator) relating the j:th output to the
%   i:th output. Similarly nb and nk are ny|nu matrices. (ny:# of outputs,
%   nu:# of inputs). For a time series, ORDERS = na only.
%
%  SYS = ARX(DATA, ORDER, 'Name1', Value1, 'Name2', Value2, ...) 
%   uses name-value pairs to specify input delay and flag for
%   adding a noise integrator. The supported names are:
%       'InputDelay': Specify the input delay in number of samples.
%   'IntegrateNoise': Specify whether the noise source e(t) should contain
%                     an integrator. Addition of an integrator creates an
%                     "ARIX" model represented by: A(q) y(t) = B(q) u(t-nk) +
%                     e(t)/(1-q^-1) Specify as a logical vector of length
%                     equal to the number of outputs (NY). Default:
%                     false(NY,1).
%  
%  SYS =  ARX(DATA, ORDERS, ..., OPTIONS)
%   specifies the estimation option set OPTIONS that facilitate various
%   options affecting the estimation results such as data offsets, output
%   weight and regularization options. Use the "arxOptions" command to
%   configure OPTIONS. Use the "arxRegul" function to generate useful
%   regularization data to use in OPTIONS.
% 
%   In the multi-output case, ARX minimizes the norm (E'*E), where E are
%   the prediction errors. This can be changed to an arbitrary quadratic
%   norm E'*W*E by specifying W using the OutputWeight estimation option.
%
%  [SYS, IC] = ARX(DATA, ...)
%    returns the estimated initial conditions IC as an @initialCondition
%    object. If DATA is multiple experiments, IC is an object array with
%    one value for each data experiement. Type "help initialCondition" for
%    more information.
%
%  Example: Obtain a regularized estimate of a 20th order ARX model  
%  using 'DC' as the regularization kernel.
%     load iddata3 z3 % estimation data
%     Orders = [20 20 1]; 
%     [Lambda, R] = arxRegul(z3, Orders, 'DC');
%     Opt = arxOptions;
%     Opt.Regularization.Lambda = Lambda;
%     Opt.Regularization.R = R;
%     model1 = arx(z3, Orders)      % unregularized estimate 
%     model2 = arx(z3, Orders, Opt) % regularized estimate
%     % Compare fits and confidence bounds on frequency response
%     compare(z3, model1, model2)
%     showConfidence(bodeplot(model1,model2))
%
% See also ARXOPTIONS, ARXREGUL, ARXSTRUC, AR, ARMAX, BJ, IV4, IV4, N4SID,
% OE, NLARX, initialCondition.
%%   Documentation for arx
%      doc arx
%%   Other functions named arx
%%      frac_lti/arx
%