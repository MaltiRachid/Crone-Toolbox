%% Description
%
% Test function on :
%          - function : roots
%          - class    : frac_poly_imp
%
% Prototype :
%        [root,eigen_value,order_step]=roots(p)            
%
% Argument in : 
%   p : Frac_poly_imp object
%   
% 
% Argument out :
% 	root		: polynomial roots (cell array)
%	order_step	: order (cell array)
%	eigen_value : vector of the eigen value (cell array)
% 
% This function computes roots of fractional polynomial.
% As the roots of an explicit and implicit polynomial are the same, this
% function run on the frac_poly_exp contained in the frac_poly_imp.
% See frac_poly_exp/roots
% 
%   Copyright © CRONE