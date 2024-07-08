%% Function-based unit test for lssvf method
% Last revision 23/09/2021

function tests = test_frac_lti_lssvf
    tests = functiontests(localfunctions);
end

%% Identification d'un autre système
function testLssvf(testCase)
u = [ones(100, 1); zeros(200,1); ones(500,1); zeros(800,1)]; 
t = (0:length(u)-1)'*0.01;
sys3 = frac_tf(frac_poly_exp([1.5  1], [0.5  0]), frac_poly_exp([1 2 1],[1.5  0.5  0]), 'N', 24, 'band', [1e-5  1e5]);
y = lsim(sys3, u, t); y = y + 0.05*randn(size(y));
ddata = iddata(y, u, t(2)-t(1));

figure(1), plot(ddata), 

%% On reprend les mm ordres de dérivation et on recalcule les coef
sys2 = lssvf(sys3, ddata, [1e0  6]);                    % On peut refaire une estimation ici
figure(2), plot(t, y, t, lsim(sys2, u, t));
   legend('True Output', 'OE identified output');
   title('Résultat d''une identification avec svf -- Simulation d''Outaloup');

   assertFalse(testCase,isempty(sys2),'sys2 is empty');
%% La ça ne marche pas, car la fréquence de coupure du svf prise par défaut 
% est très basse
sys2 = lssvf(sys3, ddata);                  % On peut refaire une estimation ici
figure(3), plot(t, y, t, lsim(sys2, u, t));
   legend('True Output', 'OE identified output');
   title('Résultat d''une identification avec svf -- Simulation d''Outaloup');

   assertFalse(testCase,isempty(sys2),'sys2 is empty');
%% On prend des ordres différents et on recalcule les coef
sys_init = frac_tf(frac_poly_exp([1.2  1], [0.5  0]), frac_poly_exp([1 2 1],[1.2  0.5  0]), 'N', 24, 'band', [1e-5  1e5]);
sys2 = lssvf(sys_init, ddata); % On peut refaire une estimation ici
figure(4), plot(t, y, t, lsim(sys2, u, t), t, lsim(sys_init, u, t));
   legend('True Output', 'OE identified output', 'Initial model');
   title('Résultat d''une identification avec svf -- Simulation d''Outaloup');
   
   assertFalse(testCase,isempty(sys2),'sys2 is empty');
end
