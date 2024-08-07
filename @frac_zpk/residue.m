%RESIDUE Partial-fraction expansion (residues).
%   [R,P,K] = RESIDUE(B,A) finds the residues, poles and direct term of
%   a partial fraction expansion of the ratio of two polynomials B(s)/A(s).
%   If there are no multiple roots,
%      B(s)       R(1)       R(2)             R(n)
%      ----  =  -------- + -------- + ... + -------- + K(s)
%      A(s)     s - P(1)   s - P(2)         s - P(n)
%   Vectors B and A specify the coefficients of the numerator and
%   denominator polynomials in descending powers of s.  The residues
%   are returned in the column vector R, the pole locations in column
%   vector P, and the direct terms in row vector K.  The number of
%   poles is n = length(A)-1 = length(R) = length(P). The direct term
%   coefficient vector is empty if length(B) < length(A), otherwise
%   length(K) = length(B)-length(A)+1.
%
%   If P(j) = ... = P(j+m-1) is a pole of multplicity m, then the
%   expansion includes terms of the form
%                R(j)        R(j+1)                R(j+m-1)
%              -------- + ------------   + ... + ------------
%              s - P(j)   (s - P(j))^2           (s - P(j))^m
%
%   [B,A] = RESIDUE(R,P,K), with 3 input arguments and 2 output arguments,
%   converts the partial fraction expansion back to the polynomials with
%   coefficients in B and A.
%
%   Warning: Numerically, the partial fraction expansion of a ratio of
%   polynomials represents an ill-posed problem.  If the denominator
%   polynomial, A(s), is near a polynomial with multiple roots, then
%   small changes in the data, including roundoff errors, can make
%   arbitrarily large changes in the resulting poles and residues.
%   Problem formulations making use of state-space or zero-pole
%   representations are preferable.
%
%   Class support for inputs B,A,R:
%      float: double, single
%
%   See also POLY, ROOTS, DECONV.
%%   Documentation for residue
%      doc residue
%%   Other functions named residue
%%      frac_zpk/residue
%