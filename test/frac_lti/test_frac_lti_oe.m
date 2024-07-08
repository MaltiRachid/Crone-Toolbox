%% Function-based unit test for frac_lti oe method
% Last revision 24/09/2021

function tests = test_frac_lti_oe
    tests = functiontests(localfunctions);
end

function  testOe(testCase)
%% Data generation
nu = 0.44;
sys = frac_tf(frac_poly_exp([1/50  1], [nu  0]), ...
              frac_poly_exp([1/100  -0.7/10  1], [2*nu   nu  0]), 'N', 24, 'band', [1e-4  1e5]);
% Frequency analysis of true model sys
    sysEnt = frac2int(sys);
    w = logspace(-4, 4, 100);
    Fe = 1e4;  we = 2*pi*Fe;  w_shanon = we/2;
    [G, ph] = bode(sys, w);
    GG = zeros(length(w), 1); GG(:,1) = 20*log10(G(1, 1, :));
    phG= zeros(length(w), 1); phG(:,1) = ph(1, 1, :);
    [Gr, phr] = bode(sysEnt, w);
    GGr = zeros(length(w), 1); GGr(:,1) = 20*log10(Gr(1, 1, :));
    phGr= zeros(length(w), 1); phGr(:,1) = phr(1, 1, :);
    figure(1), subplot(211), semilogx(w, GG, w, GGr),
           hold on
              ax = axis();  semilogx([w_shanon, w_shanon], [ax(3) ax(4)], 'r');
           hold off
           legend('Fractional system', 'Rational approximation', 'Shanon frequency \omega_e/2')
        subplot(212), semilogx(w, phG, w, phGr);
           hold on
              ax = axis();  semilogx([w_shanon, w_shanon], [ax(3) ax(4)], 'r');
           hold off

% Time analysis of true sys
u_tmp = prbs(7, 250, [0 1]);   % prbs function of the ContSid toolbox
u = u_tmp(1700:end);         % Only 8000 points are kept
t = (0:length(u)-1) / Fe  ;    % Sampling period Te = 1e-4
y = lsim(sys, u, t);
ddata = iddata(y, u, t(2)-t(1));
figure(2), subplot(211), plot(t, u), title('Input-vector u');
           subplot(212), plot(t,y), title('True Output')
           
%  sys_init = 1e-6*frac_tf(frac_poly_exp([1  5  1] , [0.75  0.5   0]), ...
%      frac_poly_exp([1  5  1] , [1  0.5   0]), 25, [1e-3  1e3]) 
 % sys_init(2) = frac_tf(2, frac_poly_exp([2  1] , [0.75   0])) ;

%% Function calls

nu = 0.5;
% Setting of the initial model for oe algorithm
sys_init = frac_tf(frac_poly_exp([1/50  1], [nu  0]), ...
              frac_poly_exp([1/100 -0.7/10  1], [2*nu  nu  0]), 'N', 24, 'band', [1e-4  1e5]);

%% Figures with different arguments for oe function

sys2 = oe(sys_init, ddata, [], 'Coefficients');                    % On peut refaire une estimation ici
figure(3), plot(t, y, 'b', t, lsim(sys2, u, t), 'r', t, lsim(sys_init, u, t), 'g')
   legend('True Output', 'OE identified output', 'Initial model')
   title('With the option static coef')
   assertFalse(testCase,isempty(sys2),'sys2 is empty');

sys2 = oe(sys_init, ddata, [], 'static_gain'); % On peut refaire une estimation ici
figure(4), plot(t, y, 'b', t, lsim(sys2, u, t), 'r', t, lsim(sys_init, u, t), 'g')
   legend('True Output', 'OE identified output', 'Initial model')
   title('With the static gain option')   
   assertFalse(testCase,isempty(sys2),'sys2 is empty');
   
sys2 = oe(sys_init, ddata, [], 'Commensurate');
figure(5), plot(t, y, 'b', t, lsim(sys2, u, t), 'r', t, lsim(sys_init, u, t), 'g')
   legend('True Output', 'OE identified output', 'Initial model')
   title('With the comm option')
   assertFalse(testCase,isempty(sys2),'sys2 is empty');

sys2 = oe(sys_init, ddata, [], 'All');
figure(6), plot(t, y, 'b', t, lsim(sys2, u, t), 'r', t, lsim(sys_init, u, t), 'g')
   legend('True Output', 'OE identified output', 'Initial model')
   title('With the all option')
   assertFalse(testCase,isempty(sys2),'sys2 is empty');

sys2 = oe(sys2, ddata, [], 'Commensurate');
figure(7), plot(t, y, 'b', t, lsim(sys2, u, t), 'r', t, lsim(sys_init, u, t), 'g')
   legend('True Output', 'OE identified output', 'Initial model')
   title('With the comm option after having done the all option')
   assertFalse(testCase,isempty(sys2),'sys2 is empty');

   
%% Option settings
%  It is possible to select different options with an optimset as presented
%  below:

options = optimset('Algorithm','levenberg-marquardt','LargeScale','off', ...
           'Jacobian','off','Diagnostics','','Display','iter','MaxIter', 40); 
       
sys2 = oe(sys_init, ddata, options);
figure(8), plot(t, y, 'b', t, lsim(sys2, u, t), 'r', t, lsim(sys_init, u, t), 'g')
   legend('True Output', 'OE identified output', 'Initial model')
   title('With the options set')
   assertFalse(testCase,isempty(sys2),'sys2 is empty');
   
sys2 = oe(sys_init, ddata, options, 'Commensurate');
figure(9), plot(t, y, 'b', t, lsim(sys2, u, t), 'r', t, lsim(sys_init, u, t), 'g')
   legend('True Output', 'OE identified output', 'Initial model')
   title('With options set and comm option')
   assertFalse(testCase,isempty(sys2),'sys2 is empty');

%%
disp('Comparison between true system, initial hit and the identified one')
sys, sys_init, sys2

end
