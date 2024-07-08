%-- help for frac_poly_imp/multi ---
%%MTIMES - CRONE toolbox
%
% varargout = multi(fun_name, nbrout, varargin) deals with multi-dimensional systems. It catches the size of
% the system and fills in cells with the results of the function called on a
% unidimensional system.
% This function is private and is always called when a function is applied
% on multi-dimensionnal polynome.
%
%   Input arguments:
%	- fun_name: name of the function called
%   - nbrout: number of argout expected
%   - nbrout_fpe: number of fpe expected in the argout
%	- varargin: contain the arguments needed by the function "fun_name"
%
%   Output arguments:
%	- varargout : result depends on the function called
%
%
% Example
%   Consider a polynomial of size 2x2
%     frac poly imp from input 1 to output:
%
%       #1 : (s^3 + 2 s^2 + 1)^1
%
%       #2 : (s^4 +  s^3 + 4)^1 
%
%     frac poly exp from input 2 to output:
%
%       #1 : (s^2 + 2 s^1)^1 
%
%       #2 : (6 s^2 + 4)^1 
%
%   
%   The command  a = char(poly) will result a cell array (2x2) containing :
%
%   a  =  {  char((s^3 + 2 s^2 + 1)^1)       char((s^2 + 2 s^1)^1)
%           
%            char((s^4 +  s^3 + 4)^1)        char((6 s^2 + 4)^1)   }
%   
%   (char resulting in a string that contains the polynomial) 
%   see also char
%
%
% Copyright (c) CRONE - Scamps	11/06/2008
% Last revision : 13/11/2014
%%   Other functions named multi
%%      frac_poly_exp/multi
%