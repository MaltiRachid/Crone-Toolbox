%-- help for frac_lti/freqgen ---
%%FREQGEN - CRONE toolbox
%
% w=FREQGEN(sys) creates a frequency vector from the dynamic system sys to be used for the plot.The frequency range is 
%               determined automatically if not specified based on the 
%               system poles and zeros.
%
%
% w=FREQGEN(sys,w) returns the frequency range or frequency points to be used
%               for the plot. To focus on a particular frequency interval 
%               [wmin,wmax], set w={wmin,wmax}.To use particular frequency 
%               points, set w to the vector of desired frequencies.
%            
%
%  Input arguments:
%   - sys: fractionnal transfer function (frac_tf object)
%   - w: frequency range (cell or vector)
%
%  Output argument:
%   - w : frequency range ( = entry if specified)
%
% Copyright (c) CRONE - Bezine	23/06/2009
% Last revision : 24/01/2014
%