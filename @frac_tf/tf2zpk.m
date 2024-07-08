%TF2ZPK  Discrete-time transfer function to zero-pole conversion.
%   [Z,P,K] = TF2ZPK(NUM,DEN)  finds the zeros, poles, and gain:
%
%                 (z-Z(1))(z-Z(2))...(z-Z(n))
%       H(z) =  K ---------------------------
%                 (z-P(1))(z-P(2))...(z-P(n))
%
%   from a single-input, single-output transfer function in polynomial form:
%
%               NUM(z)
%       H(z) = --------
%               DEN(z)
%
%   EXAMPLE:
%     [b,a] = butter(3,.4);
%     [z,p,k] = tf2zpk(b,a)
%
%   See also TF2ZP, ZPLANE.
%%   Documentation for tf2zpk
%      doc tf2zpk
%%   Other functions named tf2zpk
%%      frac_tf/tf2zpk
%