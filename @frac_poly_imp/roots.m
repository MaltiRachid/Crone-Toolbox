%ROOTS  Find polynomial roots.
%   ROOTS(C) computes the roots of the polynomial whose coefficients
%   are the elements of the vector C. If C has N+1 components,
%   the polynomial is C(1)*X^N + ... + C(N)*X + C(N+1).
%
%   Note:  Leading zeros in C are discarded first.  Then, leading relative
%   zeros are removed as well.  That is, if division by the leading
%   coefficient results in overflow, all coefficients up to the first
%   coefficient where overflow occurred are also discarded.  This process is
%   repeated until the leading coefficient is not a relative zero.
%
%   Class support for input c: 
%      float: double, single
%
%   See also POLY, RESIDUE, FZERO.
%%   Documentation for roots
%      doc roots
%%   Other functions named roots
%%      frac_poly_exp/roots    gpuArray/roots    localpoly/roots
%      frac_poly_imp/roots
%