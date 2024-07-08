%-- help for frac_lti/oosrivcf ---
%% idsys = oosrivcf(sys_init, data, method, [iter, epsilon], [wf  N]);
%
% @frac_lti/oosrivcf function of the CRONE Toolbox
% Identification by fractional model using the simplified refined
% instrumental variable for continuous-time fractional models for 
% coefficient estimation, combined with gradient-based optimization 
% for differentiation order estimation, represented by:
%
%  y(t)=  sys(s) u(t)+e(t)/A(s)
%     
% where
%   
%          B(s)      b0 s^0 + b1 s^beta1 + ... +bM s^betaM
%  sys(s)=------ = ----------------------------s--------------
%          A(s)    s^alpha0 + a1 s^alpha1 + ... + aN s^alphaN
%
%
% Input Argument
%   - sys_init as a frac_tf object;
%       o differentiation orders are used all along,
%       o band = [wA wB] and N are used for simulations with an equivalent
%         rational model,
%   - data is an iddata object with u, y and Ts necessary arguments.
%   - order_optimization : specifies one of the following options
%       o 'All' (default) : all parameters (coefficients and diff 
%             orders) are estimated. For identifiability purposes a 
%             denominator parameter is set to 1 (constant coef = 1 and 
%             diff_order = 0);
%       o 'Commensurate': all coefficients and the commensurate order are estimated when sys(s) is assumed commensurate.
%       o 'Coefficients': only coefficients are estimated, the orders bieng fixed;
%                   it is equivalent to apply the srivcf algorithm;
%   - [iter, epsilon](optional) with;
%       o iter: number of maximum iteration (optional); (default iter=20)
%       o epsilon : precision of the parametric estimation (optional): 
%           'max(abs(theta(i)-theta(i-1)))<epsilon'; (default epsilon='1e-3')
%   - [wf N] (optional) with :
%       o wf : desired cut-off frequency of the SVF or IVSVF,
%       o N  : desired order of the SVF or IVSVF.
%     in case [wf N] are not precised, then wf is set to wB and N is set to
%     the (max(of all diff orders) + 1) /nu ==> so that at high frequencies
%     there is at least a first order diff. order
%
%
% Output Argument
%   - idsys: frac_idtf object, identified system with updated coefficients and parameters
%       - P: covariance matrix according to order_optimization option 
%           (numerator and denominator coefficients,  non-zero numerator and denominator diff orders)
%       - sigma_2: variance
%       - Hessian: approximated Hessian
%
% Copyright (c) CRONE  2008
% Function created on 2008-06-04 by S. VICTOR
% Last revision: 06/09/2021
%