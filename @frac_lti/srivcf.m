%-- help for frac_lti/srivcf ---
%%SRIVCF - CRONE toolbox
%
% idsys = SRIVCF(sys_init, data, method, [iter, epsilon], [wf  N], WS);
%
% Identification by non integer ARX model with simplified refined
% instrumental variable for continuous-time fractional models.
%
%           B0 s^0 + B1 s^v ... +BM s^(M*v)
%  F(s)=______________________________________
%        1+ A1 s^v + A2 s^(2v) ... +AN s^(N*v)
%
% SRIVCF is an iterative algorithm where a regression vector is formed
% using filtered input and output signals.
% The filter is formed from the auxiliary model denominator and is then convolved with input (respectively output) signals to form a
% regression matrix.
%
% Input arguments:
%   - sys_init as a frac_tf object;
%       o differentiation orders are used all along,
%       o band = [wA wB] and N are used for simulations with an equivalent
%         rational model,
%   - data as an iddata object with u, y and Ts necessary arguments.
%   - method :    'lssvf' applies lssvf before srivcf (default), 
%                 'ivsvf' applies ivsvf before srivcf,
%                 '0' applies srivcf by initializing with sys_init;
%   Whatever the method used "sys_init" must contain the differentiation
%   orders to be used.
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