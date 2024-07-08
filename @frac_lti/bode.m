%BODE  Bode frequency response of dynamic systems.
%
%   BODE(SYS) draws the Bode plot of the dynamic system SYS. The frequency 
%   range and number of points are chosen automatically.
%
%   BODE(SYS,{WMIN,WMAX}) draws the Bode plot for frequencies between WMIN 
%   and WMAX in radians/TimeUnit (relative to the time units specified in 
%   SYS.TimeUnit, the default being seconds).
%
%   BODE(SYS,W) uses the vector W of frequencies (in radians/TimeUnit) to
%   evaluate the frequency response. See LOGSPACE to generate logarithmically 
%   spaced frequency vectors.
%
%   BODE(SYS1,SYS2,...,W) graphs the Bode response of several systems
%   SYS1,SYS2,... on a single plot. The frequency vector W is optional. 
%   You can specify a color, line style, and marker for each model, for
%   example:
%      bode(sys1,'r',sys2,'y--',sys3,'gx').
%
%   [MAG,PHASE] = BODE(SYS,W) and [MAG,PHASE,W] = BODE(SYS) return the
%   response magnitudes and phases in degrees (along with the frequency 
%   vector W if unspecified).  No plot is drawn on the screen.  
%   If SYS has NY outputs and NU inputs, MAG and PHASE are arrays of 
%   size [NY NU LENGTH(W)] where MAG(:,:,k) and PHASE(:,:,k) determine 
%   the response at the frequency W(k). To get the magnitudes in dB, 
%   type MAGDB = 20*log10(MAG). The frequencies W are in rad/TimeUnit.
%
%   [MAG,PHASE,W,SDMAG,SDPHASE] = BODE(SYS) also returns the estimated
%   standard deviations of the magnitude and phase of the identified system
%   SYS.
%
%   For discrete-time models with sample time Ts, BODE uses the
%   transformation Z = exp(j*W*Ts) to map the unit circle to the real 
%   frequency axis.  The frequency response is only plotted for 
%   frequencies smaller than the Nyquist frequency pi/Ts, and the default 
%   value 1 (time unit) is assumed when Ts is unspecified.
%
%   See BODEPLOT for additional graphical options for Bode plots.
%
%   See also DYNAMICSYSTEM/BODEPLOT, BODEMAG, NICHOLS, NYQUIST, SIGMA, 
%   FREQRESP, LTIVIEW, DYNAMICSYSTEM, IDMODEL.
%%   Documentation for bode
%      doc bode
%%   Other functions named bode
%%      DynamicSystem/bode    frac_lti/bode
%