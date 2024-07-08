%-- help for frac_lti/lssvf ---
%%SVF - CRONE toolbox
%
% idsys = SVF(sys_init, data, [wf  N]);
%
% Fractional system identification using State Variable Filters.
% A regression vector is formed using filtered input and output signals.
% Poisson filters are implemented as SVF: 
% F(s) = num/(s/wf+1)^N
% num is replaced by (s^diff) where diff is any numerator (respectively 
% denominator) differentiation order used to form the regressor.
% The filter is then convolved with input (respectively output) signals to form a 
% regression matrix.
%
% Input arguments:
%   - sys_init as a frac_tf object; 
%       o differentiation orders are used all along,
%       o band = [wA wB] and N are used for simulations with an equivalent
%         rational model,
%   - data as an iddata object with u, y and Ts necessary arguments.
%   - [wf N] (optional) with :
%       o wf : desired cut-off frequency of the SVF,
%       o N  : desired order of the SVF.
%     in case [wf N] are not precised, then wf is set to wB and N is set to
%     the (max(of all diff orders) + 1) /nu ==> so that at high frequencies
%     there is at least a first order diff. order
%
% Output arguments:
%	- idsys: frac_idtf object, identified system with updated coefficients and parameters
%       - P: covariance matrice
%       - sigma_2: variance
%       - Phi: regression vector
%
% Copyright (c) CRONE - Malti 28/05/2008
% Last revision : 14/09/2021
%