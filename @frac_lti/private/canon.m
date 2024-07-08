%-- help for DynamicSystem/canon ---
%%CANON  Canonical state-space realizations.
%
%   CSYS = CANON(SYS,TYPE) computes a canonical state-space 
%   realization CSYS for the LTI model SYS.  The string TYPE
%   selects the type of realization:
%     'modal'       Modal decomposition where the state matrix A 
%                   is block diagonal, each block corresponding 
%                   to a cluster of nearby modes.
%     'companion'   Companion form where the characteristic
%                   polynomial appears in the rightmost column.
%
%   [CSYS,T] = CANON(SYS,TYPE) also returns the state transformation 
%   matrix T relating the canonical state vector z to the original 
%   state vector x by z = Tx.  This syntax is only meaningful when 
%   SYS is a state-space model.
%
%   CSYS = CANON(SYS,'modal',CONDT) specifies an upper bound CONDT on
%   the condition number of the block-diagonalizing transformation T. 
%   The default value is 1/SQRT(EPS).  Increase CONDT to reduce the
%   size of the eigenvalue clusters (setting CONDT=Inf amounts to 
%   diagonalizing A).
%
%   The modal form is useful for determining the relative contribution
%   of each system mode.  The companion form is ill-conditioned and 
%   should be avoided if possible.
%
%   See also SS, POLE, SS2SS, CTRB, CTRBF.
%%   Other functions named canon
%%      frac_lti/canon    frac_ss/canon
%