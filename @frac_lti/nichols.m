%NICHOLS  Nichols frequency response of dynamic systems.
%
%   NICHOLS(SYS) draws the Nichols plot of the dynamic system SYS. The 
%   The frequency range and number of points are chosen automatically.  
%   See BODE for details on the notion of frequency in discrete-time.
%
%   NICHOLS(SYS,{WMIN,WMAX}) draws the Nichols plot for frequencies between 
%   WMIN and WMAX in radians/TimeUnit (relative to the time units specified 
%   in SYS.TimeUnit, the default being seconds).
%
%   NICHOLS(SYS,W) uses the vector W of frequencies (in radians/TimeUnit) to
%   evaluate the frequency response. See LOGSPACE to generate logarithmically 
%   spaced frequency vectors.
%
%   NICHOLS(SYS1,SYS2,...,W) plots the Nichols plot of several systems
%   SYS1,SYS2,... on a single plot. The frequency vector W is optional.
%   You can specify a color, line style, and marker for each model, for
%   example:
%      nichols(sys1,'r',sys2,'y--',sys3,'gx').
%
%   [MAG,PHASE] = NICHOLS(SYS,W) and [MAG,PHASE,W] = NICHOLS(SYS) return
%   the response magnitudes and phases in degrees (along with the 
%   frequency vector W if unspecified). No plot is drawn on the screen.  
%   If SYS has NY outputs and NU inputs, MAG and PHASE are arrays of 
%   size [NY NU LENGTH(W)] where MAG(:,:,k) and PHASE(:,:,k) determine 
%   the response at the frequency W(k). The frequencies W are in rad/TimeUnit.
%
%   See NICHOLSPLOT for additional graphical options for Nichols plots.
%
%   See also NICHOLSPLOT, BODE, NYQUIST, SIGMA, FREQRESP, LTIVIEW, DYNAMICSYSTEM.
%%   Documentation for nichols
%      doc nichols
%%   Other functions named nichols
%%      DynamicSystem/nichols    frac_lti/nichols
%