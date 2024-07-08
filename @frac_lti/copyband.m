%-- help for frac_lti/copyband ---
%%copyband - CRONE toolbox
%
% Function copyband
%
% [sys1] = copyband(sys1, sys2);
%
% Copy bandwidth, N (number of cells), and sim from sys2 into sys1 without
% affecting numerator and denominator characteristics
%
% Input arguments:
% 	- sys1
%	- sys2
%
% Output argument:
%	- sys1 contains num and den of sys1 and contains N and wawb of sys2
%
%   Copyright (c) CRONE  2008
% Last revision : 18/02/2010
%