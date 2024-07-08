% idsys = frac_idtf(sys,'P', P, 'J', J, 'sigma_2', sigma_2, 'Phi', Phi)
%     create a fractional identified transfer function object
%
%     Input arguments
%       sys:                frac_tf object, identified transfer
%                           function
%       P (optional):       covariance matrix
%       J (optional):       squared-2 norm of the residuals
%       sigma_2 (optional): variance of the residuals
%       Phi (optional):     I/O regression matrix (at last iteration) for lssvf
%                           I/O instrumental matrix for ivsvf, oosrivcf (coef)
%                           I/O approximated Hessian for oe, oosrivcf (all)
%       Name (optional):    Name of the frac_idtf model
%
%     Output arguments
%       idsys:      fractional identified transfer function object
%
%
% Copyright (c) CRONE - Loo 20/07/2021
% Last modification 13/10/2021
%%   Documentation for frac_idtf
%      doc frac_idtf
%%