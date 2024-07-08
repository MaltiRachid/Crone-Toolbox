%% Function-based unit test for frac_lti set method
% Last revision 08/09/2021

function tests = test_frac_lti_set
    tests = functiontests(localfunctions);
end

function testSet(testCase)
    sys = frac_lti('N', 10, 'band', [1e-2 1e2], 'variable', 'p', 'Ts', 0);
    
    assertEqual(testCase, get(sys,'N'), 10, 'AbsTol', 0.1, 'N is not 10 +-10%'); 
    assertEqual(testCase, get(sys,'band'), [1e-2 1e2], 'AbsTol', 0.1, 'band is not [1e-2 1e2]');
    assertEqual(testCase, get(sys,'variable'), 'p', 'variable is not p');
    assertEqual(testCase, get(sys,'Ts'), 0, 'AbsTol', 0.1, 'Ts is not 0');
    assertEqual(testCase, get(sys,'sim'), 'Oustaloup', 'sim is not Oustaloup');
    assertEqual(testCase, get(sys,'version'), 'OO-CRONE 2.0', 'version is not OO-CRONE 2.0');

    set(sys,'band', [1e-3 1e3], 'variable', 'q', 'Ts', 1, 'N', 15, 'sim', 'OustaloupTrigeassou');
    
    assertEqual(testCase, get(sys,'N'), 15, 'AbsTol', 0.1, 'N is not 15 +-10%'); 
    assertEqual(testCase, get(sys,'band'), [1e-3 1e3], 'AbsTol', 0.1, 'band is not [1e-3 1e3]');
    assertEqual(testCase, get(sys,'variable'), 'q', 'variable is not q');
    assertEqual(testCase, get(sys,'Ts'), 1, 'AbsTol', 0.1, 'Ts is not 1');
    assertEqual(testCase, get(sys,'sim'), 'OustaloupTrigeassou', 'sim is not Oustaloup');
    assertEqual(testCase, get(sys,'version'), 'OO-CRONE 2.0', 'version is not OO-CRONE 2.0');
end