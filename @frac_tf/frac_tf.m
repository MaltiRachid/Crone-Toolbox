%
% sys = frac_tf(num,den)
%   creates a fractional transfer function 'sys'
%   - num (numerator): is either a scalar, a cell, or a frac_poly_exp object
%   - den (denominator): is either a scalar, a cell, or a frac_poly_exp object
%
% sys = frac_tf(num,den,N,band,variable,Ts,sim)
%   creates a fractionnal transfer function 'sys'
%   - num (numerator): is either a scalar, a cell, or a frac_poly_exp object
%   - den (denominator): is either a scalar, a cell, or a frac_poly_exp object
%   - N (optional): is a scalar corresponding to the number of cells
%        (number of poles and zeros) used in Oustaloup's and Trigeassou's
%        approximations of fractional differentiator and/or integrator.
%        This parameter is not used if sim = 'Grunwald',
%   - band (optional)=[wb  wh]: is a 1x2 matrix which contains the lower wb,
%        and the upper frequencies for Oustaloup's and Trigeassou's
%        approximations of fractional differentiator and/or integrator.
%        This parameter is not used if sim = 'Grunwald',
%   - variable (optional): a character corresponding to the laplace variable.
%        Defaults is 's',
%   - Ts (optional): a scalar specifying the sampling time. Default is 0.
%        This attribute is not used for the time being.
%   - sim (optional): a string specifying which method to use in time-domain
%        simulations of fractional systems:
%        * 'Grunwald' ==> Grünwald method (default method when N and band are left
%                     empty),
%        * 'Oustaloup' ==> Oustaloup's approximation (default method when N and
%                     band are entered),
%        * 'OustaloupTrigeassou' ==> Oustaloup's approximation with Trigeassou's variation.
%
% sys = frac_tf(sys)
%   converts:
%    - sys: frac_zpk, frac_ss, or frac_tf        to frac_tf
%
% Argument out:
%       sys: fractionnal transfer function (frac_tf object)
%
% Example :
%       sys = frac_tf(1, frac_poly_exp([1 1 1], [1.2  0.5  0]))
%       or
%       sys = frac_tf(frac_poly_exp(1, 0), frac_poly_exp([1 1 1], [1.2  0.5  0]))
%
%       defines the following transfer function with attribute sim='Grunwald'
%       (default simulation method when N and w are empty)
%               ( 1 )
%           -----------------
%         ( s^1.2 + s^0.5 + 1 )
%
%       sys = frac_tf(1, frac_poly_exp([1 1 1], [1.2  0.5  0]), 5, [1e-3  1e3])
%       sys = frac_tf(frac_poly_exp(1, 0), frac_poly_exp([1 1 1], [1.2  0.5
%       0]), 5, [1e-3  1e3])
%           defines the same transfer function with attribute sim = 'Oustaloup'
%           (default simulation method when N and w are entered).
%
%       sys = frac_tf(1, frac_poly_exp([1 1 1], [1.2  0.5  0]), 5, [1e-3  1e3], [], [], 'Grunwald')
%       sys = frac_tf(frac_poly_exp(1, 0), frac_poly_exp([1 1 1], [1.2  0.5 0]), 5, [1e-3  1e3], [], [], 'Grunwald')
%           defines the same transfer function with sim = 'Grunwald'
%
%   Copyright (C) CRONE - Last modified on 06/09/2021 by D. Loo
%%   Documentation for frac_tf
%      doc frac_tf
%%