%FRAC_POLY_EXP - CRONE toolbox
%
% fpe=FRAC_POLY_EXP(coef,order) creates an explicit fractional polynomial
% object.
% It is the constructor of the class frac_poly_exp.
%
%   Input arguments:
%   - coef: coefficients of the fractional polynomial (row vector  or cell array of row vector)
%   - order: orders of the fractional polynomial (row vector  or cell array of row vector)
%
%
%   Output arguments:
%   - fpe: frac_poly_exp object
%
%
% In the usual case two arguments are passed :
% frac_poly_exp(coef,order) creates an explicit fractionnal polynomial with
%                           the coeficiants coef and orders order.
%
%
% If only one argument is given it is supposed to be the coeficients
% frac_poly_exp(coef,order) creates an explicit fractionnal polynomial with
%                           the coeficients coef and orders 0.
%
%
% Exemples:
% P=frac_poly_exp  creates the nul polynomial.
%
% P=frac_poly_ex(NaN) creates
% P = NaN x s^0
%
% P=frac_poly_exp([1,1],[NaN,0]) calls P=frac_poly_ex(NaN)
%
% P=frac_poly_exp(3) creates
% P= 3s^0
%
% P=frac_poly_exp([1,1],[0.2,0]) creates
% P=s^0.2 + 1.
%
%
% P=frac_poly_exp({[1,1] [1 1]},{[0.2,0]  [2.1 1]}) creates
% P={s^0.2 + 1,s^2.1 + s}.
%
% Q=frac_poly_exp(P) creates
% Q={s^0.2 + 1,s^2.1 + s}.
%
%
% Copyright (c) CRONE - Smaiti 15/06/2003
% Last revision : 18/04/2014
%%   Documentation for frac_poly_exp
%      doc frac_poly_exp
%%