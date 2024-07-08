%FSR_demo1 - CRONE Toolbox
% 
% Demo file for Fractional System Representations
%
% Copyright (c) CRONE -	18/11/2014
% Last revision: 29/10/2021

clc
disp(' ')
disp(' ')
disp('             System Identification for coefficient estimation')
disp('                     with the CRONE toolbox')
disp('               --------------------------------------')
disp(' ')

disp('   This demo will illustrate the use of the CRONE Toolbox')
disp('   in System Identification for Fractional Systems.');
disp(' ')
disp(' ')
disp('   Hit any key to continue')
pause

clc
echo on
%%%%%%%%%%%%%%% A data generating example %%%%%%%%%%%%%%%%%%%%
%   
%   Consider a continuous-time SISO fractional transfer function
%   described by the following transfer function:
%	
%	               0.5
%	 G(s) =  ------------------------
%	          0.5 s^3 + 1.5 s^1.5 + 1
% 
%   Create first a frac_tf object describing the model from fractional
%   explicit polynomials (frac_poly_exp objects):
    NUM=frac_poly_exp(0.5, 0);
    DEN=frac_poly_exp([0.5 1.5 1],[3  1.5  0]);
    
    sys_id = frac_tf(NUM,DEN);


%   data generate
    Ts = 0.01;
    u = [ones(100, 1); zeros(200,1); ones(500,1); zeros(800,1)]-1; 
    t = (0:length(u)-1)'*Ts;
    e = 0.2*randn(size(u));
    y = lsim(sys_id, u, t);
    yb = y + e; 
    
    
%   We then create an IDDATA object for the input signal with output yb 
%   the input u and sampling interval Ts. 
    ddata = iddata(yb, u,Ts);
   
    figure(1), idplot(ddata), 

%   For more info on DATA object, type HELP IDDATA.
    

%   Hit any key
    pause
    clc
% The step response and the Bode diagram of the data-generating system
    figure(2),step(sys_id,t);
    bode(sys_id,{1e-2,1e2});
     
%   Hit any key
    pause
    clc
%   We will first identify a fractional model for this system sys_id from 
%   the data object ddata with the traditional Least-Squares-based 
%   State-Variable Filter (LSSVF) method 
%   
%   The extra information required are:
%     - the initializing model which specifies the number of coefficients 
%       of the numerator and of the denominator: sys_init
%     - the "cut-off frequency (in rad/sec) and the order of the SVF filter": [wf, N] = [1, 2]
%                                  1
%               filter(s)  = ------------
%                             (s/wf+1)^N 
%       
%   The continuous-time model identification algorithm can now be used as follows:
% 
    sys_init = frac_tf(frac_poly_exp([1], [0]), frac_poly_exp([1 1 1],[3  1.5  0]))

    
    sys_lssvf = lssvf(sys_init, ddata, [1e0  4]);
    get(sys_lssvf,'sys')

%   Hit any key
    pause
    clc
%   As you can see, the original 
    sys_id,
%   and the identified system are not exactly the same because the output is 
%   corrupted by a significant additive white noise.
%   The noise to signal ratio is:
    NSR = 10*log10((y'*y)/(e'*e))
    

%   The identified parameters are therefore biased.


%   Hit any key
    pause
    clc
%   An iterative bias reduction algorithm based on the instrumental 
%   variable technique built from an auxiliary model (IVSVF) can also be 
%   used instead of the simple Least-Squares based SVF algorithm which is 
%   known to be always asymptotically biased 
    sys_ivsvf = ivsvf(sys_init, ddata,[20,1e-4],[1e0  3]);
    get(sys_ivsvf,'sys')

%   It can happen that an unstable model may be obtained. A stabilization
%   procedure has been implemented in order to help the convergence of the
%   IV mechanism.

%   Hit any key
    pause
    clc
%   Let us now compare the model output for the input signal with the
%   measured output. Since we generated the data, we enjoy the luxury of 
%   comparing the model output to the noise-free system output.

    figure(4), plot(t, y, t, lsim(sys_lssvf, u, t), ...
    t, lsim(sys_ivsvf, u, t),'r--')
    legend('True Output', 'LSSVF output', 'IVSVF identified output')
    title('Comparison between LSSVF and IVSVF')


%   The IVSVF model output coincides quite well with the system noise-free 
%   output. 
%   Hit any key
    pause
    clc   
%   However this basic IV-based SVF method suffers from two drawbacks even 
%   if it is asymptotically unbiased:
%   - it is suboptimal, in the sense that the variance of the estimates is 
%   not minimal 
%   - it requires the a priori knowledge of the cut-off frequency of the 
%     SVF filter
%   
%   It is therefore better to use the optimal (in a white noise context)
%   iterative IV method (srivc) which solves the two latter problems and 
%   which is advised to use as a first choice in practice.
%   The identified model takes now the form of a continuous-time OE model.
%   The srivcf algorithm can now be used as follows:

    sys_srivcf = srivcf(sys_init, ddata, '0');
    get(sys_srivcf,'sys')
    
%   Hit any key
    pause    
    clc
%   Let us now compare the SRIVCF model output for the input signal with the
%   measured output. 

    figure(5), plot(t, y, t, lsim(sys_lssvf, u, t),'k', ...
    t, lsim(sys_ivsvf, u, t),'r--',...
    t, lsim(sys_srivcf, u, t),'g-.')
    legend('True Output', 'LSSVF output', 'IVSVF output', 'SRIVCF output')
    title('Comparison between LSSVF, IVSVF and SRIVCF')

%   The SRIVCF algorithm gives consistent estimates with parameter
%   estimation without bias and with minimum variance.
    
%   Hit any key
    pause 
    clc
%   There exist an order way to identify a fractional system as continuous-
%   time OE model.
%   The OE algorithm can now be used as follows for coefficient estimation:
    sys_oe_coef = oe(sys_init, ddata,[],'Coefficients');
    get(sys_oe_coef,'sys')

    
%   Let us now compare the OE model output for the input signal with the
%   measured output. 

    figure(6), plot(t, y, t, lsim(sys_lssvf, u, t),'k', ...
    t, lsim(sys_ivsvf, u, t),'r--',...
    t, lsim(sys_srivcf, u, t),'g-.',...
    t, lsim(sys_oe_coef, u, t),'c-.')
    legend('True Output', 'LSSVF output', 'IVSVF output', ...
        'SRIVCF output','OE output')
    title('Comparison between LSSVF, IVSVF, SRIVCF and OE')
    
    
    
%   See the help of lssvf, ivsvf, srivcf and oe functions for more
%   explanations.

%   Hit any key
    pause    

    close 

echo off
close all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% v0.1 Victor   02/02/2015  Creation de la fonction
% v2.0 Loo      29/10/2021  Corrections pour option de oe et affichage sys