%TF2SS  Transfer function to state-space conversion.
%   [A,B,C,D] = TF2SS(NUM,DEN)  calculates the state-space
%   representation:
%       .
%       x = Ax + Bu
%       y = Cx + Du
%
%   of the system:
%               NUM(s)
%       H(s) = --------
%               DEN(s)
%
%   from a single input.  Vector DEN must contain the coefficients of
%   the denominator in descending powers of s.  Matrix NUM must
%   contain the numerator coefficients with as many rows as there are
%   outputs y.  The A,B,C,D matrices are returned in controller
%   canonical form.  This calculation also works for discrete systems.
%
%   For discrete-time transfer functions, it is highly recommended to
%   make the length of the numerator and denominator equal to ensure
%   correct results.  You can do this using the function EQTFLENGTH in
%   the Signal Processing Toolbox.  However, this function only handles
%   single-input single-output systems.
%
%   See also TF2ZP, SS2TF, ZP2SS, ZP2TF.
%%   Documentation for tf2ss
%      doc tf2ss
%%   Other functions named tf2ss
%%      frac_tf/tf2ss
%