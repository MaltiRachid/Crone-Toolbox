%FREQRESP  Frequency response of dynamic systems.
%
%   [H,W] = FREQRESP(SYS) computes the frequency response H of the dynamic
%   system SYS at default frequencies W determined from the dynamics of the
%   model.
%
%   H = FREQRESP(SYS,W) explicitly specifies the frequency grid W. Frequency
%   values should be real and expressed in radians/TimeUnit (relative to the
%   time units specified in SYS.TimeUnit, the default being seconds).
%
%   H = FREQRESP(SYS,W,UNITS) explicitly specifies the frequency units of W.
%   The string UNITS must be among the following: 'rad/TimeUnit',
%   'cycles/TimeUnit', 'rad/s', 'Hz', 'kHz', 'MHz', 'GHz', or 'rpm'.
%
%   If SYS has NY outputs and NU inputs, and W contains NW frequencies, H is
%   a NY-by-NU-by-NW array and H(:,:,k) gives the response at the frequency
%   W(k). If SYS is a S1-by-...-Sp array of models with NY outputs and NU
%   inputs, then H is of size [NY NU NW S1 ... Sp].
%
%   For linear identified models (see IDLTI),
%      [H,W,covH] = FREQRESP(SYS,...)
%   also computes the covariance covH of the response H. This is a 5D-array
%   where covH(i,j,k,:,:) contains the 2-by-2 covariance matrix of the
%   response from i-th input to j-th output at frequency W(k). The (1,1)
%   element is the variance of the real part, the (2,2) element the variance
%   of the imaginary part and the (1,2) and (2,1) elements the covariance
%   between the real and imaginary parts.
%
%   Note: FREQRESP is optimized for medium-to-large vectors of frequencies.
%   Use EVALFR for a handful of frequencies.
%
%   See also DYNAMICSYSTEM/EVALFR, BODE, SIGMA, NYQUIST, NICHOLS,
%   DYNAMICSYSTEM, IDLTI.
%%   Documentation for freqresp
%      doc freqresp
%%   Other functions named freqresp
%%      DynamicSystem/freqresp    frac_poly_exp/freqresp
%      frac_lti/freqresp
%