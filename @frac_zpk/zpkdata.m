%-- help for DynamicSystem/zpkdata ---
%%ZPKDATA  Quick access to zero-pole-gain data.
%
%   [Z,P,K] = ZPKDATA(SYS) returns the zeros, poles, and gain for each 
%   I/O channel of the dynamic system SYS. The cell arrays Z,P and the 
%   matrix K have as many rows as outputs and as many columns as inputs, 
%   and their (I,J) entries specify the zeros, poles, and gain of the 
%   transfer function from input J to output I. SYS is first converted to 
%   zero-pole-gain format if necessary.
%
%   [Z,P,K,TS] = ZPKDATA(SYS) also returns the sample time TS. Other
%   properties of SYS can be accessed using struct-like dot syntax (for
%   example, SYS.Variable).
%
%   [Z,P,K,TS,COVZ,COVP,COVK] = ZPKDATA(SYS) also returns the covariances
%   of the zeros, poles and gain of the identified model SYS. COVZ is a
%   cell array such that COVZ{ky,ku} contains the covariance information
%   about the zeros in the vector Z{ky,ku}. COVZ{ky,ku} is a 3-D array of
%   dimension 2-by-2-by-Nz, where Nz is the length of Z{ky,ku}, so that the
%   (1,1) element is the variance of the real part, the (2,2) element is
%   the variance of the imaginary part, and the (1,2) and (2,1) elements
%   contain the covariance between the real and imaginary parts. COVP has a
%   similar relationship to P. COVK is a matrix containing the variances of
%   the elements of K.
%%   Other functions named zpkdata
%%      frac_zpk/zpkdata
%