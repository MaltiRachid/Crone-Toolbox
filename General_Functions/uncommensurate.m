% Computes de fractional transfer from an LTI system.
% 
% Syntax
% [New_tf]= uncommensurate(poly,commensurate_order)
% 
% Arguments
%  Argument in:
% 	poly : integer or fractional polynomial (tf, frac_poly_exp object or row vector)
% 	commensurate_order : the commensurate order (scalar)
% 
%  Argument out:
% 	frac_poly_exp object
%
% Examples:
%
% [P]= uncommensurate([1 0 2.3 4.2 0.6],0.5)
% P=s^2+2.3 s^1 +4.2 s^0.5 +0.6.
%
% P=frac_poly_exp([1,1],[0.2,0]) creates
% P=s^0.2 + 1.
%
% [P]= uncommensurate(P,0.5)
% P=s^(0.2*0.5) + 1
% P=s^0.1 + 1
%