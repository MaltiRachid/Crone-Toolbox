%STEP  Step response of dynamic systems.
%
%   [Y,T] = STEP(SYS) computes the step response Y of the dynamic system SYS. 
%   The time vector T is expressed in the time units of SYS and the time 
%   step and final time are chosen automatically. For multi-input systems,
%   independent step commands are applied to each input channel. If SYS has 
%   NY outputs and NU inputs, Y is an array of size [LENGTH(T) NY NU] where 
%   Y(:,:,j) contains the step response of the j-th input channel.
%
%   For state-space models, 
%      [Y,T,X] = STEP(SYS) 
%   also returns the state trajectory X, an array of size [LENGTH(T) NX NU] 
%   for a system with NX states and NU inputs.
%
%   For identified models (see IDMODEL),
%      [Y,T,X,YSD] = STEP(SYS) 
%   also computes the standard deviation YSD of the response Y (YSD is empty 
%   if SYS does not contain parameter covariance information).
%
%   [Y,...] = STEP(SYS,TFINAL) simulates the step response from t=0 to the 
%   final time t=TFINAL (expressed in the time units of SYS). For discrete-
%   time models with unspecified sample time, TFINAL is interpreted as  
%   the number of sampling periods.
%
%   [Y,...] = STEP(SYS,T) specifies the time vector T for simulation (in 
%   the time units of SYS). For discrete-time models, T should be of the  
%   form 0:Ts:Tf where Ts is the sample time. For continuous-time models, 
%   T should be of the form 0:dt:Tf where dt is the sampling period for the 
%   discrete approximation of SYS. 
%
%   [Y,...] = STEP(SYS,...,OPTIONS) specifies additional options such as the
%   step amplitude or input offset. Use stepDataOptions to create the option
%   set OPTIONS.
%
%   When called without output arguments, STEP(SYS,...) plots the step 
%   response of SYS and is equivalent to STEPPLOT(SYS,...). See STEPPLOT 
%   for additional graphical options for step response plots.
%
%   See also STEPPLOT, stepDataOptions, IMPULSE, INITIAL, LSIM, LTIVIEW, 
%   DYNAMICSYSTEM, IDLTI.
%%   Documentation for step
%      doc step
%%   Other functions named step
%%      DynamicSystem/step    frac_lti/step    iddata/step    system/step
%