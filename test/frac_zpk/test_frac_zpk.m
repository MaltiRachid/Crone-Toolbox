%% Function-based unit test for frac_zpk constructor
% Last revision 06/09/2021

function tests = test_frac_zpk
    tests = functiontests(localfunctions);
end

function testArgin0(testCase)
    sys0 = frac_zpk;
    
    assertEmpty(testCase, get(sys0,'eig_zeros'), 'eig_zeros is not empty.');
    assertEmpty(testCase, get(sys0,'eig_poles'), 'eig_poles is not empty.');
    assertEmpty(testCase, get(sys0,'k'), 'k is not empty.');
    assertEmpty(testCase, get(sys0,'order'), 'order is not empty.');
end

function testArgin4(testCase)
    zeros = 0; poles =  [1-1i 1+1i 2];
    gain = -2; order = 0.3;
    sys1 = frac_zpk(zeros,poles,gain,order);
    
    assertEqual(testCase, get(sys1,'eig_zeros'), {zeros}, 'eig_zeros is not zeros.');
    assertEqual(testCase, get(sys1,'eig_poles'), {poles}, 'eig_poles is not poles.');
    assertEqual(testCase, get(sys1,'k'), {gain}, 'k is not gain.');
    assertEqual(testCase, get(sys1,'order'), {order}, 'order is not 0.3.');
    
    zeros = [1 2]; poles =  [1-1i 1+1i 2-1i 2+1i];
    gain = 4; order = 0.7;
    set(sys1,'eig_zeros',zeros);
    set(sys1,'eig_poles',poles);
    set(sys1,'k',gain);
    set(sys1,'order',order);
    
    assertEqual(testCase, get(sys1,'eig_zeros'), {zeros}, 'eig_zeros is not zeros.');
    assertEqual(testCase, get(sys1,'eig_poles'), {poles}, 'eig_poles is not poles.');
    assertEqual(testCase, get(sys1,'k'), {gain}, 'k is not gain.');
    assertEqual(testCase, get(sys1,'order'), {order}, 'order is not 0.7.');
    
end

function testSISO(testCase)
    num = frac_poly_exp([1 1],[0.3 0.7]);
    den = frac_poly_exp([1 1 1],[0.3 0.7 0.3]);
    sys_tf = frac_tf(num,den, 'N', 10, 'band', [1e-5   1e5], 'variable', 's', 'Ts', 0, 'sim', 'OustaloupTrigeassou');

    sys_zpk = frac_zpk(sys_tf);
    tol = 1e-2;
    zeros = [0; 0; 0; -0.7071+0.7071i; -0.7071-0.7071i; 0.7071+0.7071i; 0.7071-0.7071i];
    poles = [0; 0; 0; -0.8409+0.8409i; -0.8409-0.8409i; 0.8409+0.8409i; 0.8409-0.8409i]; 
    gain = 1; order = 0.1;
    
    assertEqual(testCase, get(sys_zpk,'eig_zeros'), {zeros}, 'AbsTol', tol, 'eig_zeros is not zeros.');
    assertEqual(testCase, get(sys_zpk,'eig_poles'), {poles}, 'AbsTol', tol, 'eig_poles is not poles.');
    assertEqual(testCase, get(sys_zpk,'k'), {gain}, 'k is not gain.');
    assertEqual(testCase, get(sys_zpk,'order'), {order}, 'order is not 0.3.');
end

function testMIMO(testCase)
    num = frac_poly_exp([1 1],[0.3 0.7]);
    den = frac_poly_exp([1 1 1],[0.3 0.7 0.3]);
    sys_tf = frac_tf(num,den, 'N', 10, 'band', [1e-5   1e5], 'variable', 's', 'Ts', 0, 'sim', 'OustaloupTrigeassou');
    sys_tf_MIMO = [sys_tf, sys_tf , sys_tf, sys_tf];
    
    tol = 1e-2;
    zeros = [0; 0; 0; -0.7071+0.7071i; -0.7071-0.7071i; 0.7071+0.7071i; 0.7071-0.7071i];
    poles = [0; 0; 0; -0.8409+0.8409i; -0.8409-0.8409i; 0.8409+0.8409i; 0.8409-0.8409i]; 
    gain = 1; order = 0.1;
    
    sys_zpk_MIMO = frac_zpk(sys_tf_MIMO);
    assertEqual(testCase, get(sys_zpk_MIMO,'eig_zeros'), {zeros zeros zeros zeros}, 'AbsTol', tol, 'eig_zeros is not zeros.');
    assertEqual(testCase, get(sys_zpk_MIMO,'eig_poles'), {poles poles poles poles}, 'AbsTol', tol, 'eig_poles is not poles.');
    assertEqual(testCase, get(sys_zpk_MIMO,'k'), {gain gain gain gain}, 'k is not gain.');
    assertEqual(testCase, get(sys_zpk_MIMO,'order'), {order order order order}, 'order is not 0.3.');
end