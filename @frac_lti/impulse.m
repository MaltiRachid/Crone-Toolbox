%IMPULSE  Impulse response of dynamic systems.
%
%   IMPULSE(SYS) plots the impulse response of the dynamic system SYS. For 
%   systems with more than one input, independent impulse commands are 
%   applied to each input channel. The time range and number of points are 
%   chosen automatically. For continuous-time systems with direct feedthrough, 
%   the infinite pulse at t=0 is ignored.
%
%   IMPULSE(SYS,TFINAL) simulates the impulse response from t=0 to the final 
%   time t=TFINAL (expressed in the time units specified in SYS.TimeUnit). For 
%   discrete-time models with unspecified sample time, TFINAL is interpreted 
%   as the number of sampling periods.
%
%   IMPULSE(SYS,T) uses the time vector T for simulation (expressed in the 
%   time units of SYS). For discrete-time models, T should be of the form 
%   Ti:Ts:Tf where Ts is the sample time. For continuous-time models, T 
%   should be of the form Ti:dt:Tf where dt is the sampling period for the 
%   discrete approximation of SYS. The impulse is always assumed to arise  
%   at t=0 (regardless of Ti).
%
%   IMPULSE(SYS1,SYS2,...,T) plots the impulse response of several systems
%   SYS1,SYS2,... on a single plot. The time vector T is optional. You can 
%   also specify a color, line style, and marker for each system, for 
%   example:
%      impulse(sys1,'r',sys2,'y--',sys3,'gx').
%
%   When invoked with left-hand arguments,
%      [Y,T] = IMPULSE(SYS) 
%   returns the output response Y and the time vector T used for simulation. 
%   No plot is drawn on the screen. If SYS has NY outputs and NU inputs, 
%   and LT=length(T), Y is an array of size [LT NY NU] where Y(:,:,j) gives 
%   the impulse response of the j-th input channel. The time vector T is 
%   expressed in the time units of SYS. 
%
%   For state-space models, 
%      [Y,T,X] = IMPULSE(SYS, ...) 
%   also returns the state trajectory X which is an LT-by-NX-by-NU array if 
%   SYS has NX states.
%
%   Response uncertainty computation: 
%   [Y,T,X,YSD] = IMPULSE(SYS) returns the standard deviation YSD of the
%   response Y of an identified system SYS. YSD is empty if SYS does not
%   contain parameter covariance information.
%
%   See IMPULSEPLOT for additional options for impulse response plots.
%
%   Note: In discrete time, IMPULSE computes the response to a unit-area 
%   pulse of length Ts and height 1/Ts where Ts is the sample time. This
%   pulse approaches the continuous-time Dirac impulse delta(t) as Ts goes
%   to zero.
%
%   See also IMPULSEPLOT, STEP, INITIAL, LSIM, LTIVIEW, DYNAMICSYSTEM,
%   IDMODEL.
%%   Documentation for impulse
%      doc impulse
%%   Other functions named impulse
%%      arima/impulse            frac_lti/impulse    regARIMA/impulse
%      DynamicSystem/impulse    iddata/impulse
%