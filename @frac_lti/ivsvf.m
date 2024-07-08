%-- help for frac_lti/ivsvf ---
%%IVSVF - CRONE toolbox
%
% idsys = IVSVF(sys_init, data, [iter, epsilon], [wf  N]);
%
% Identification by non integer ARX model with instrumental variable 
% for continuous-time fractional models for coefficient estimation 
% represented by:
%
%  y(t)=  sys(s) u(t)+e(t)/A(s)
%     
% where
%   
%          B(s)      b0 s^0 + b1 s^beta1 + ... +bM s^betaM
%  sys(s)=------ = ------------------------------------------
%          A(s)    s^alpha0 + a1 s^alpha1 + ... + aN s^alphaN
%
% A regression vector is formed using filtered input and output signals.
% Poisson filters are implemented as SVF: 
% F(s) = num/((s/wf)^nu+1)^N
% num is replaced by (s^diff) where diff is any numerator (respectively 
% denominator) differentiation order used to form the regressor.
% The filter is then convolved with input (respectively output) signals to form a 
% regression matrix.
%
%
% Input arguments:
%   - sys_init as a frac_tf object;
%       o differentiation orders are used all along,
%       o band = [wA wB] and N are used for simulations with an equivalent
%         rational model,
%   - data as an iddata object with u, y and Ts necessary arguments.
%   - [iter, epsilon] (optional);
%       o iter: number of maximum iteration (optional); (default iter=20)
%       o epsilon : precision of the parametric estimation (optional): 
%           'max(abs(theta(i)-theta(i-1)))<epsilon'; (default epsilon='1e-3')
%   - [wf N] (optional) with :
%       o wf : desired cut-off frequency of the SVF,
%       o N  : desired order of the SVF.
%     in case [wf N] are not precised, then wf is set to wB and N is set to
%     the (max(of all diff orders) + 1) /nu ==> so that at high frequencies
%     there is at least a first order diff. order
%   - WS (without stabilization) : when dealing with non commensurate model, the stabilizing
%   procedure should be omitted (WS=1), otherwise take WS=0 (default).
%
% Output arguments:
%   - idsys: frac_idtf object, identified system with updated coefficients and parameters
%       - P: covariance matrice
%       - sigma_2: variance of the residuals
%       - Phi: I/O filtered regression matrix (at last iteration)
%
%   Copyright (c) CRONE - Victor 04/06/2008
%   Last revision : 06/09/2021
%