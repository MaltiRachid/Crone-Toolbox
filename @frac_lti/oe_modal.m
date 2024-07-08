%-- help for frac_lti/oe_modal ---
%%OE_MODAL - CRONE toolbox
%
% sys = OE_MODAL(sys_init, data);
%
% Fractional system identification using direct differentiation of
% input/output signals. 
%
% Input arguments:
%   - sys_init as a frac_tf object; 
%       o differentiation orders are used all along,
%       o if band an N are defined, simulations are done using Oustaloup's
%       approximation of each derivative in that frequency band.
%       
%   - data is an iddata object with u, y and Ts necessary arguments.
%
% Output arguments:
%	- sys : identified system with updated coefficients
%
%   Copyright (c) CRONE - Malti	28/05/2008
%   Last revision : 18/04/2014%
%