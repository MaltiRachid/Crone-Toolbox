%LSIM  Simulate time response of dynamic systems to arbitrary inputs.
%
%   LSIM(SYS,U,T) plots the time response of the dynamic system SYS to the
%   input signal described by U and T. The time vector T is expressed in the
%   time units of SYS and consists of regularly spaced time samples. The 
%   matrix U has as many columns as inputs in SYS and its i-th row specifies 
%   the input value at time T(i). For example, 
%           t = 0:0.01:5;   u = sin(t);   lsim(sys,u,t)  
%   simulates the response of a single-input model SYS to the input 
%   u(t)=sin(t) during 5 time units.
%
%   For discrete-time models, U should be sampled at the same rate as SYS
%   (T is then redundant and can be omitted or set to the empty matrix).
%   For continuous-time models, choose the sampling period T(2)-T(1) small 
%   enough to accurately describe the input U.  LSIM issues a warning when
%   U is undersampled and hidden oscillations may occur.
%         
%   LSIM(SYS,U,T,X0) specifies the initial state vector X0 at time T(1) 
%   (for state-space models only). X0 is set to zero when omitted.
%
%   LSIM(SYS1,SYS2,...,U,T,X0) simulates the response of several systems
%   SYS1,SYS2,... on a single plot. The initial condition X0 is optional.
%   You can also specify a color, line style, and marker for each system, 
%   for example
%      lsim(sys1,'r',sys2,'y--',sys3,'gx',u,t).
%
%   Y = LSIM(SYS,U,T) returns the output history Y. No plot is drawn on 
%   the screen. The matrix Y has LENGTH(T) rows and as many columns as 
%   outputs in SYS. For state-space models, 
%      [Y,T,X] = LSIM(SYS,U,T,X0) 
%   also returns the state trajectory X, a matrix with LENGTH(T) rows
%   and as many columns as states.
%
%   For continuous-time models,
%      LSIM(SYS,U,T,X0,'zoh')  or  LSIM(SYS,U,T,X0,'foh') 
%   explicitly specifies how the input values should be interpolated 
%   between samples (zero-order hold or linear interpolation). By default, 
%   LSIM selects the interpolation method automatically based on the 
%   smoothness of the signal U. For sparse models LSIM always uses 'foh'.
%
%   See LSIMPLOT for additional graphical options for LSIM plots.
%
%   See also LSIMPLOT, GENSIG, STEP, IMPULSE, INITIAL, DYNAMICSYSTEM.
%%   Documentation for lsim
%      doc lsim
%%   Other functions named lsim
%%      DynamicSystem/lsim    frac_lti/lsim    frac_ss/lsim
%