%FRAC_LTI - CRONE toolbox
%
% sys = frac_lti('N', N, 'band', band,va,Ts,sim)
% returns a frac_lti object
%
% Input arguments:
%   - N (optinal): is a scalar corresponding to the number of cells
%        (number of poles and zeros) used in Oustaloup's and OustaloupTrigeassou's
%        approximations of fractional differentiator and/or integrator.
%        This parameter is not used if sim = 'Grunwald',
%   - band (optinal)=[wb  wh]: is a 1x2 matrix which contains the lower wb,
%        and the upper frequencies for Oustaloup's and OustaloupTrigeassou's
%        approximations of fractional differentiator and/or integrator.
%        This parameter is not used if sim = 'Grunwald',
%   - variable (optimal): a character corresponding to the laplace variable.
%        Defaults is 's',
%   - Ts (optimal): a scalar specifying the sampling time. Default is 0.
%        This attribute is not used for the time being.
%   - sim (optimal): a string specifying which method to use in time-domain
%        simulations of fractional systems:
%        * 'Grunwald' ==> Grünwald method (default method when N and band are left
%                     empty),
%        * 'Oustaloup' ==> Oustaloup's approximation (default method when N and
%                     band are entered),
%        * 'OustaloupTrigeassou' ==> Oustaloup's approximation with Trigessou's variation.
%
% Ouput arguments :
%	sys : frac-lti object
%
% Example
%   a = frac_lti(5, [1e-3  1e3], 's', 0);
%
% Copyright (c) CRONE - Gabes 14/06/2004
% Last revision : 17/06/2021
%%   Documentation for frac_lti
%      doc frac_lti
%%