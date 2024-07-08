%SS2TF  State-space to transfer function conversion.
%   [NUM,DEN] = SS2TF(A,B,C,D,iu)  calculates the transfer function:
%
%               NUM(s)          -1
%       H(s) = -------- = C(sI-A) B + D
%               DEN(s)
%   of the system:
%       .
%       x = Ax + Bu
%       y = Cx + Du
%
%   from the iu'th input.  Vector DEN contains the coefficients of the
%   denominator in descending powers of s.  The numerator coefficients
%   are returned in matrix NUM with as many rows as there are 
%   outputs y.
%
%   See also TF2SS, ZP2TF, ZP2SS.
%%   Documentation for ss2tf
%      doc ss2tf
%%   Other functions named ss2tf
%%      frac_ss/ss2tf
%