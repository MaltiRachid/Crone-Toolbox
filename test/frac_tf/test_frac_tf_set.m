%% Function-based unit test for frac_tf set method
% Last revision 24/09/2021

function tests = test_frac_tf_set
    tests = functiontests(localfunctions);
end

%% Test 1 - Monodimensional -- Manipulation du num et de den
function testSetSISO(testCase)
sys = frac_tf(frac_poly_exp([2 5],[0.5 0]), ...
    frac_poly_exp([1  2.1  5],[1  0.1  0]), 'N', 25, 'band', [1e-2  1e2]);
numer2 = frac_poly_imp(1,1);

set(sys,'num', numer2);
assertEqual(testCase,get(sys,'num'),frac_poly_exp(numer2));
set(sys,'num', 155);
assertEqual(testCase,get(sys,'num'),frac_poly_exp(155));
set(sys,'num', frac_poly_exp([0.5  1], [0.5  0.1]));
assertEqual(testCase,get(sys,'num'),frac_poly_exp([0.5  1], [0.5  0.1]));

set(sys,'den', numer2);
assertEqual(testCase,get(sys,'den'),frac_poly_exp(numer2));
set(sys,'den', 155);
assertEqual(testCase,get(sys,'den'),frac_poly_exp(155));
set(sys,'den', frac_poly_exp([0.5  1], [0.5  0.1]));
assertEqual(testCase,get(sys,'den'),frac_poly_exp([0.5  1], [0.5  0.1]));

set(sys, 'Ts', 25);
assertEqual(testCase,get(sys,'Ts'),25);

set(sys,'N', 130);
assertEqual(testCase,get(sys,'N'),130);

set(sys, 'band', [1e-10 1e10]);
assertEqual(testCase,get(sys, 'band'),[1e-10 1e10]);

set(sys,'variable','q');
assertEqual(testCase,get(sys,'variable'),'q');

set(sys,'sim','OustaloupTrigeassou');
assertEqual(testCase,get(sys,'sim'),'OustaloupTrigeassou');
end

%% Test 2 - Monodimensional -- Manipulation du num et de den

