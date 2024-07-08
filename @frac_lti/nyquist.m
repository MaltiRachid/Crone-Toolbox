%NYQUIST  Nyquist frequency response of dynamic systems.
%
%   NYQUIST(SYS) draws the Nyquist plot of the dynamic system SYS.  The 
%   frequency range and number of points are chosen automatically. See BODE   
%   for details on the notion of frequency in discrete-time.
%
%   NYQUIST(SYS,{WMIN,WMAX}) draws the Nyquist plot for frequencies between
%   WMIN and WMAX in radians/TimeUnit (relative to the time units specified in 
%   SYS.TimeUnit, the default being seconds).
%
%   NYQUIST(SYS,W) uses the vector W of frequencies (in radians/TimeUnit) to
%   evaluate the frequency response. See LOGSPACE to generate logarithmically 
%   spaced frequency vectors.
%
%   NYQUIST(SYS1,SYS2,...,W) plots the Nyquist response of several systems
%   SYS1,SYS2,... on a single plot. The frequency vector W is optional. 
%   You can specify a color, line style, and marker for each model, for
%   example:
%      nyquist(sys1,'r',sys2,'y--',sys3,'gx').
%
%   [RE,IM] = NYQUIST(SYS,W) and [RE,IM,W] = NYQUIST(SYS) return the real
%   parts RE and imaginary parts IM of the frequency response (along with 
%   the frequency vector W if unspecified).  No plot is drawn on the screen.  
%   If SYS has NY outputs and NU inputs, RE and IM are arrays of size 
%   [NY NU LENGTH(W)] and the response at the frequency W(k) is given by 
%   RE(:,:,k)+j*IM(:,:,k). The frequencies W are in rad/TimeUnit.
%
%   Response uncertainty computation: 
%   [RE,IM,W,SDRE,SDIM] = NYQUIST(SYS) also returns the standard deviations
%   of RE and IM for the identified system SYS.
%     
%   See also NYQUISTPLOT, BODE, NICHOLS, SIGMA, FREQRESP, LTIVIEW, DYNAMICSYSTEM.
%%   Documentation for nyquist
%      doc nyquist
%%   Other functions named nyquist
%%      DynamicSystem/nyquist    frac_lti/nyquist
%