%% Function-based unit test for lsim method
% Last revision 23/09/2021

function tests = test_frac_lti_lsim
    tests = functiontests(localfunctions);
end

%% Test Number 1 - No output ; 
% Compared to the Grünwald simulation
function testLsimArgout0(testCase)
sys = frac_tf(1, frac_poly_exp(1, 1.5), 'N', 30, 'band', [1e-5, 1e5]);
% Definition of time vector t and sampling period Te
u = ones(1,5000);
Te = 0.005;
t = (0:length(u)-1)*Te;
set(sys,'sim','Oustaloup');
figure, lsim(sys, u, t);
        legend('Oustaloup''s approx.') 
set(sys,'sim','OustaloupTrigeassou');
figure, lsim(sys, u, t);
        legend('Trigeassou''s approx.')    
set(sys,'sim','Grunwald');
figure, lsim(sys, u, t);
        legend('Grunwald''s approx.') 
% set(sys,'sim','grunimp');
% figure, lsim(sys, u, t);
%         legend('Improved Grunwald''s approx.')
end      
        
%% Test Number 1 -  with output ; 
% Compared to the Grünwald simulation
function testLsimArgout1(testCase)
sys = frac_tf(1, frac_poly_exp(1, 1.5), 'N', 30, 'band', [1e-5, 1e5]);
% Definition of time vector t and sampling period Te
u = ones(1,5000);
Te = 0.005;
t = (0:length(u)-1)*Te;
set(sys,'sim','Oustaloup');
yOust = lsim(sys, u, t);
set(sys,'sim','OustaloupTrigeassou');
yTrig = lsim(sys, u, t);
set(sys,'sim','Grunwald');
yGrun = lsim(sys, u, t);
% set(sys,'sim','grunimp');
% yGrunImp = lsim(sys, u, t);
if isempty(yTrig)
    figure(1), plot(t,yOust,t,yGrun)%,t,yGrunImp)
        legend('Oustaloup''s approx.', ...
        'Grunwald''s approx.')%,'Improved Grunwald''s approx.')
else
     figure(1), plot(t,yOust,t,yTrig,'g:',t,yGrun,'r-.')%,t,yGrunImp,'c--')
                
        legend('Oustaloup''s approx.', 'Trigeassou''s approx.', ...
        'Grunwald''s approx.')%,'Improved Grunwald''s approx.')
end

    assertFalse(testCase,isempty(yOust),'yOust is empty');
    assertFalse(testCase,isempty(yGrun),'yGrun is empty');
    assertFalse(testCase,isempty(yTrig),'yTrig is empty');
end

%% Test Number 2 - Monodimensional ;
% Compared to the Grünwald simulation
function testLsimSISO(testCase)
sys = frac_tf(5, frac_poly_exp([5 1], [1.75  0]), 'N', 30, 'band', [1e-5, 1e5]);
% Definition of time vector t and sampling period Te
Te = 0.01;
u = ones(1,5000);
t = (0:length(u)-1)*Te;
set(sys,'sim','Oustaloup');
yOust2 = lsim(sys, u, t);
set(sys,'sim','OustaloupTrigeassou');
yTrig2 = lsim(sys, u, t);
set(sys,'sim','Grunwald');
yGrun2 = lsim(sys, u, t);
% set(sys,'sim','grunimp')
% yGrunImp2 = lsim(sys, u, t);
figure(2), plot(t,yOust2,t,yTrig2, '-.',t,yGrun2)%,t,yGrunImp2)
    legend('Oustaloup''s approx.', 'Trigeassou''s approx.', ...
        'Grunwald''s approx.')%,'Improved Grunwald''s approx.')
    grid
    
    assertFalse(testCase,isempty(yOust2),'yOust2 is empty');
    assertFalse(testCase,isempty(yGrun2),'yGrun2 is empty');
    assertFalse(testCase,isempty(yTrig2),'yTrig2 is empty');
end

%% Test Number 3 - Multidimensional -- 1 input et 2 outputs -- O lsim argout
% Compared to the Grünwald simulation
function testLsimMIMOArgout0(testCase)
sys1 = frac_tf(5, frac_poly_exp([5 1], [1.75  0]), 'N', 30, 'band', [1e-5, 1e5]);
sys2 = frac_tf(1e-2, frac_poly_exp(1, 1.5), 'N', 30, 'band', [1e-5, 1e5]);
sys = [sys1 ; sys2];
[n,  m] = size(sys);
% Definition of time vector t, input vector u and sampling period Te
u = ones(2500,1); u=[u ; u];
Te = 0.01;  t = (0:length(u)-1)*Te;

set(sys,'sim','Oustaloup');
figure, lsim(sys, u, t);
        legend('Oustaloup''s approx.')    
set(sys,'sim','OustaloupTrigeassou');
figure, lsim(sys, u, t);
        legend('Trigeassou''s approx.')    
set(sys,'sim','Grunwald');
figure, lsim(sys, u, t);
        legend('Grunwald''s approx.')    
% set(sys,'sim','grunimp')
% figure, lsim(sys, u, t);
%         legend('Improved Grunwald''s approx.')  

    assertEqual(testCase,[n m],[2 1],'[n m] is not [2 1]');
end     
        
%% Test Number 4 - Multidimensional -- 1 input et 2 outputs -- 1 lsim argout
% Compared to the Grünwald simulation
function testLsimMIMOArgout1(testCase)
sys1 = frac_tf(5, frac_poly_exp([5 1], [1.75  0]), 'N', 30, 'band', [1e-5, 1e5]);
sys2 = frac_tf(1e-2, frac_poly_exp(1, 1.5), 'N', 30, 'band', [1e-5, 1e5]);
sys = [sys1 ; sys2];
[n, m] = size(sys);
% Definition of time vector t, input vector u and sampling period Te
u = ones(2500,1); u=[u ; u];
Te = 0.01;  t = (0:length(u)-1)*Te;

set(sys,'sim','Oustaloup');
yOust2 = lsim(sys, u, t);
hold on,
set(sys,'sim','OustaloupTrigeassou');
yTrig2 = lsim(sys, u,t);
set(sys,'sim','Grunwald');
yGrun2 = lsim(sys, u, t);
% set(sys,'sim','grunimp')
% yGrunImp2 = lsim(sys, u, t);
figure
for j=1:n  % number of outputs
    subplot(n,1,j)
    plot(t,yOust2(:,j),t,yTrig2(:,j), '-.',t,yGrun2(:,j))%,t,yGrunImp2(:,j));
    legend('Oustaloup''s approx.', 'Trigeassou''s approx.', ...
        'Grunwald''s approx.')%,'Improved Grunwald''s approx.')
    grid
end

    assertFalse(testCase,isempty(yOust2),'yOust2 is empty');
    assertFalse(testCase,isempty(yGrun2),'yGrun2 is empty');
    assertFalse(testCase,isempty(yTrig2),'yTrig2 is empty');
    assertEqual(testCase,[n m],[2 1],'[n m] is not [2 1]');
end

%% Test Number 5 - Multidimensional -- 2 inputs et 1 output -- O lsim argout
% Compared to the Grünwald simulation
function testLsimMIMO2Argout0(testCase)
sys1 = frac_tf(5, frac_poly_exp([5 1], [1.75  0]), 'N', 30, 'band', [1e-5, 1e5]);
sys2 = frac_tf(1e-1, frac_poly_exp(1, 1.5), 'N', 30, 'band', [1e-5, 1e5]);
sys = [sys1 , sys2];
[n, m] = size(sys);
% Definition of time vector t, input vector u and sampling period Te
u1 = ones(2500,1);
u2 = [ones(1250,1) ; zeros(625,1) ; ones(625,1)]; u=[u1 , u2];
Te = 0.01;  t = (0:length(u)-1)*Te;

set(sys,'sim','Oustaloup');
yOust2 = lsim(sys, u, t);
hold on,
set(sys,'sim','OustaloupTrigeassou');
yTrig2 = lsim(sys, u,t);
set(sys,'sim','Grunwald');
yGrun2 = lsim(sys, u, t);
% set(sys,'sim','grunimp')
% yGrunImp2 = lsim(sys, u, t);
figure
for j=1:n  % number of outputs
    subplot(n,1,j)
    plot(t,yOust2(:,j),t,yTrig2(:,j), '-.',t,yGrun2(:,j))%,t,yGrunImp2(:,j));
    legend('Oustaloup''s approx.', 'Trigeassou''s approx.', ...
        'Grunwald''s approx.')%,'Improved Grunwald''s approx.')
    grid
end

    assertFalse(testCase,isempty(yOust2),'yOust2 is empty');
    assertFalse(testCase,isempty(yGrun2),'yGrun2 is empty');
    assertFalse(testCase,isempty(yTrig2),'yTrig2 is empty');
    assertEqual(testCase,[n m],[1 2],'[n m] is not [1 2]');
end

%% Test Number 6 - Multidimensional -- 2 input et 3 outputs -- O lsim argout
% Compared to the Grünwald simulation
function testLsimMIMO3Argout0(testCase)
sys1 = frac_tf(5, frac_poly_exp([5 1], [1.75  0]), 'N', 30, 'band', [1e-5, 1e5]);
sys2 = frac_tf(1e-1, frac_poly_exp(1, 1.5), 'N', 30, 'band', [1e-5, 1e5]);
sys = [sys1 , sys2
       sys2 , sys2
       sys1 , sys1];
[n, m] = size(sys);
% Definition of time vector t, input vector u and sampling period Te
u1 = ones(2500,1);
u2 = [ones(1250,1) ; zeros(625,1) ; ones(625,1)]; u=[u1 , u2];
Te = 0.01;  t = (0:length(u)-1)*Te;

set(sys,'sim','Oustaloup');
yOust2 = lsim(sys, u, t);
hold on,
set(sys,'sim','OustaloupTrigeassou');
yTrig2 = lsim(sys, u,t);
set(sys,'sim','Grunwald');
yGrun2 = lsim(sys, u, t);
% set(sys,'sim','grunimp')
% yGrunImp2 = lsim(sys, u, t);
figure
for j=1:n  % number of outputs
    subplot(n,1,j)
    plot(t,yOust2(:,j),t,yTrig2(:,j), '-.',t,yGrun2(:,j))%,t,yGrunImp2(:,j));
    legend('Oustaloup''s approx.', 'Trigeassou''s approx.', ...
        'Grunwald''s approx.')%,'Improved Grunwald''s approx.')
    grid
end

    assertFalse(testCase,isempty(yOust2),'yOust2 is empty');
    assertFalse(testCase,isempty(yGrun2),'yGrun2 is empty');
    assertFalse(testCase,isempty(yTrig2),'yTrig2 is empty');
    assertEqual(testCase,[n m],[3 2],'[n m] is not [3 2]');
end

%%%%%%%%%%%%%%%

% v2.9  Benine 11/06/2014   Traduction des legends  