%% Function-based unit test for frac_lti srivcf method
% Last revision 24/09/2021

function tests = test_frac_lti_srivcf
    tests = functiontests(localfunctions);
end

function testSrivcf(testCase)
%% Identification d'un autre système
% Data generation
u = [ones(100, 1); zeros(200,1); ones(500,1); zeros(800,1)]; 
t = (0:length(u)-1)'*0.01;
% AO
% sys3 = frac_tf(frac_poly_exp([1.5  1], [0.5  0]), frac_poly_exp([1 2 1],[1.5  0.5  0]), 24, [1e-5  1e5])
% Grunwald
sys_id = frac_tf(frac_poly_exp([1.5  1], [0.5  0]), frac_poly_exp([1 2 1],[1.5  0.5  0]));
y = lsim(sys_id, u, t); y_noise_free = y; y = y + 0.05*randn(size(y));
ddata = iddata(y, u, t(2)-t(1));
sys_init = frac_tf(frac_poly_exp([1  1], [0.5  0]), frac_poly_exp([1 1 1],[1.5  0.5  0]));

figure(1), plot(ddata), 

%% LSSVF
sys_lssvf = lssvf(sys_init, ddata, [1e1  6]);                 
figure(2), plot(t, y_noise_free, t, lsim(sys_lssvf, u, t))
   legend('True Output', 'LSSVF identified output')
   title('Comparison between true model and lssvf')

%% IVSVF
sys_ivsvf = ivsvf(sys_lssvf, ddata,[20,1e-3],[1e1  6]);                    
figure(3), plot(t, y_noise_free, t, lsim(sys_lssvf, u, t), ...
    t, lsim(sys_ivsvf, u, t))
   legend('True Output', 'SVF identified output', 'IV SVF identified output')
   title('Comparaison entre svf et ivsvf')

%% SRIVCF with lssvf init (Default)
sys_srivcf = srivcf(sys_ivsvf, ddata, 'lssvf', [], [1e-1  6]);     
figure(5), plot(t, y_noise_free, t, lsim(sys_ivsvf, u, t), ...
    t, lsim(sys_srivcf, u, t))
   legend('True Output', 'ivsvf identified output', 'srivcf identified output')
   title('Comparaison entre ivsvf et srivcf')
assertFalse(testCase,isempty(sys_srivcf),'sys_srivcf is empty');
%% SRIVCF with ivsvf init
sys_srivcf = srivcf(sys_ivsvf, ddata, 'ivsvf', [], [1e-1  6]) ;    
figure(6), plot(t, y_noise_free, t, lsim(sys_ivsvf, u, t), ...
    t, lsim(sys_srivcf, u, t))
   legend('True Output', 'ivsvf identified output', 'srivcf identified output')
   title('Comparaison entre ivsvf et srivcf')
assertFalse(testCase,isempty(sys_srivcf),'sys_srivcf is empty');
   
%% srivcf without svf init
sys_srivcf = srivcf(sys_ivsvf, ddata, '0', [], [1e-1  6]);                    % On peut refaire une estimation ici
figure(7), plot(t, y_noise_free, t, lsim(sys_ivsvf, u, t), ...
    t, lsim(sys_srivcf, u, t))
   legend('True Output', 'ivsvf identified output', 'srivcf identified output')
   title('Comparaison entre ivsvf et srivcf')
assertFalse(testCase,isempty(sys_srivcf),'sys_srivcf is empty');

end
