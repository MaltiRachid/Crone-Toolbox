%-- help for frac_tf/poles ---
%%
% Cette fonction doit ï¿½tre rï¿½ï¿½crite entiï¿½rement.
% ! D'abord on doit transformer en systï¿½me commensurable, car l'ordre
% Commensurable du den n'est pas forcï¿½ment celui du num.
% [Poles,poles_sn,eigen_order]=poles(system,phi)
%
% This function computes the pole of a system [cois98].
%
% [Poles,poles_sn,eigen_order,...]=poles(system) computes eigen values and corresponding orders,
% and poles of the non integer transfer function system.
%
% Argument in : 
%	system : fractional transfer function system (frac_tf object of
%	explicit form)
%
% Argument out :
%	Poles : poles (cell array)
%	Poles_sn	: vector of eigen values (vector)
%	eigen_order : order (vector)
%
% Global variable
%	none
%
%   Copyright ï¿½ CRONE - Dancla 07/06/2000
% Last revision : 07/02/2001
%
% [Poles,eigen_value,eigen_order]=poles(system)
%%   Other functions named poles
%%      sym/poles
%