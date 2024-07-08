%FRAC_SS - CRONE toolbox
%
%
% sys=FRAC_SS(A,B,C,D,order) creates a continuous-time fractional state-space system.
%        n
%       D (x) = Ax + Bu
%           y = Cx + Du
%
%   Input arguments:
%	- A,B,C,D: state-space matrices,
%	- order: order (scalar)
%
%   Output argument:
%	- sys: frac_ss object
%
% sys=FRAC_SS(A,B,C,D,order,N,band,variable,Ts,sim)
% creates a continuous-time fractional state-space
% with fractional orders on inputs and outputs and with the parameters
%
%   Input arguments:
%	- A,B,C,D: state-space matrices
%	- order: order (scalar)
%	- N: number of cells for zero and pole approximation (Oustaloup's approximation), set [] if it does
%	not apply
%	- band: frequency band for Oustaloup's approximation band = [wb wh], set [] if it does not apply
%	- variable: variable used in the representation
%       va = 's' (default)
%       va = 'p'
%       va = [], if va needs not be changed
%	- Ts: sampling time. ts = 0 if continuous-time models are used (default),
%   - sim: simulation method used
%       sim = 'Grunwald' ==> Grünwald method (Default when N and band are not
%                        specified or left empty),
%       sim = 'grunimp' ==> Improved Grunwald method (DOES NOT WORK FOR
%                           THE TIME BEING),
%       sim = 'Oustaloup' ==> Oustaloup's Approx method (Default when N
%                       and band are specified).
%       sim = 'OustaloupTrigeassou' ==> Trigeassou Approx method
%
% Copyright (c) CRONE - Dancla 07/06/2000
% Last revision: 28/09/2021
%%   Documentation for frac_ss
%      doc frac_ss
%%