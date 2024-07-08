%% Function-based unit test for frac_lti arx method
% Last revision 29/09/2021

function tests = test_frac_lti_arx
    tests = functiontests(localfunctions);
end
%% Identification with the ARX function
function testArx(testCase)
    u = [ones(100, 1); zeros(200,1); ones(500,1); zeros(800,1)]; t = (0:length(u)-1)'*0.01;
    sys3 = frac_tf(frac_poly_exp([1  1], [0.25  0]), frac_poly_exp([1 2 1],[1.2  0.5  0]), 'N', 24, 'band', [1e-5  1e5]);
    y = lsim(sys3, u, t); y = y + 0.05*randn(size(y));
    ddata = iddata(y, u, t(2)-t(1));

    figure(1), plot(ddata);

    sys_init = frac_tf(frac_poly_exp([1.5  1], [0.5  0]), frac_poly_exp([1 2 1],[1.5  0.25  0]), 'N', 24, 'band', [1e-5  1e5]);

    sys2 = arx(sys_init, ddata);                    % On peut refaire une estimation ici
    figure(2), plot(t, y, t, lsim(sys2, u, t), t, lsim(sys_init, u, t));
    legend('True Output', 'OE identified output', 'Initial model');
    title('Avec l''option static coef');
    
    assertFalse(testCase,isnan(sys2),'sys2 est nan');
    assertFalse(testCase,isempty(sys2),'sys2 est vide');
    assertTrue(testCase,isa(sys2,'frac_tf'),'sys2 is not a frac_tf');
end