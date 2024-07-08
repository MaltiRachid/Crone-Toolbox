%% Function-based unit test for frac_tf get method
% Last revision 24/09/2021

function tests = test_frac_tf_get
    tests = functiontests(localfunctions);
end

%% Test 1 - Monodimensional -- Manipulation du num et de den
function testGetSISO(testCase)
sys = frac_tf(frac_poly_exp([2 5],[0.5 0]), ...
    frac_poly_exp([1  2.1  5],[1  0.1  0]), 'N', 25, 'band', [1e-2  1e2]);

    assertEqual(testCase,get(sys,'num'),frac_poly_exp([2 5],[0.5 0]));
    assertEqual(testCase,get(sys,'den'),frac_poly_exp([1  2.1  5],[1  0.1  0]));
    assertEqual(testCase,get(sys,'N'),25);
    assertEqual(testCase,get(sys,'band'),[1e-2 1e2]);
    assertEqual(testCase,get(sys,'variable'),'s');
    assertEqual(testCase,get(sys,'Ts'),0);
    assertEqual(testCase,get(sys,'sim'),'Oustaloup');
    assertEqual(testCase,get(sys,'version'),'OO-CRONE 2.0');
end
%% Test 2 - Monodimensional -- Manipulation du num et de den

