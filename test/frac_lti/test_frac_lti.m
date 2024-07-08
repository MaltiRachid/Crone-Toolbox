%% Function-based unit test for frac_lti constructor
% Last revision 14/06/2021

function tests = test_frac_lti
    tests = functiontests(localfunctions);
end

function testSysArgin0(testCase)
    sys0 = frac_lti;
    
    assertEmpty(testCase, get(sys0,'N'), 'N is not empty.');
    assertEmpty(testCase, get(sys0,'band'), 'w is not empty.');
    assertEqual(testCase, get(sys0,'variable'), 's', 'va is not s');
    assertEqual(testCase, get(sys0,'Ts'), 0, 'AbsTol', 0.1, 'Ts is not 0'); %assert absolute tolerance less than 10%
    assertEqual(testCase, get(sys0,'version'), 'OO-CRONE 2.0', 'version is not OO-CRONE 2.0');
    assertEqual(testCase, get(sys0,'sim'), 'Grunwald', 'sim is not Grunwald');
end

function testSysArgin1(testCase)
    sys1 = frac_lti('N', 10);
    
    assertEqual(testCase, get(sys1,'N'), 10, 'AbsTol', 0.1, 'N is not 10 +-10%');
    assertEmpty(testCase, get(sys1,'band'), 'w is not empty.');
    assertEqual(testCase, get(sys1,'variable'), 's', 'va is not s');
    assertEqual(testCase, get(sys1,'Ts'), 0, 'Abs', 0.1, 'Ts is not 0');
    assertEqual(testCase, get(sys1,'version'), 'OO-CRONE 2.0', 'version is not OO-CRONE 2.0');
    assertEqual(testCase, get(sys1,'sim'), 'Grunwald', 'sim is not Grunwald');
end

function testSysArgin2(testCase)
    sys2 = frac_lti('N', 10, 'band', [1e-2   1e-6]);
    
    assertEqual(testCase, get(sys2,'N'), 10, 'AbsTol', 0.1, 'N is not 10 +-10%'); 
    assertEqual(testCase, get(sys2,'band'), [1e-6 1e-2], 'AbsTol', 0.1);
    assertEqual(testCase, get(sys2,'variable'), 's', 'va is not s');
    assertEqual(testCase, get(sys2,'Ts'), 0, 'AbsTol', 0.1, 'Ts is not 0');
    assertEqual(testCase, get(sys2,'version'), 'OO-CRONE 2.0', 'version is not OO-CRONE 2.0');
    assertEqual(testCase, get(sys2,'sim'), 'Oustaloup', 'sim is not Oustaloup');
end

function testSysArgin3(testCase)
    sys3 = frac_lti('N', 10, 'band', [1e-6   1e-2], 'variable', 'q', 'Ts', 0);
    
    assertEqual(testCase, get(sys3,'N'), 10, 'AbsTol', 0.1, 'N is not 10 +-10%');
    assertEqual(testCase, get(sys3,'band'), [1e-6 1e-2], 'RelTol', 0.1); 
    assertEqual(testCase, get(sys3,'variable'), 'q', 'va is not q');
    assertEqual(testCase, get(sys3,'Ts'), 0, 'AbsTol', 0.1, 'Ts is not 0');
    assertEqual(testCase, get(sys3,'version'), 'OO-CRONE 2.0', 'version is not OO-CRONE 2.0');
    assertEqual(testCase, get(sys3,'sim'), 'Oustaloup', 'sim is not Oustaloup');
end

function testSysArgin4(testCase)
    sys4 = frac_lti('N', 10, 'band', [1e-6   1e-2], 'variable', 'q', 'Ts', 0, 'sim', 'OustaloupTrigeassou');
    
    assertEqual(testCase, get(sys4,'N'), 10, 'AbsTol', 0.1, 'N is not 10 +-10%');
    assertEqual(testCase, get(sys4,'band'), [1e-6 1e-2], 'AbsTol', 0.1);
    assertEqual(testCase, get(sys4,'variable'), 'q', 'va is not q');
    assertEqual(testCase, get(sys4,'Ts'), 0, 'AbsTol', 0.1, 'Ts is not 0');
    assertEqual(testCase, get(sys4,'version'), 'OO-CRONE 2.0', 'version is not OO-CRONE 2.0');
    assertEqual(testCase, get(sys4,'sim'), 'OustaloupTrigeassou', 'sim is not OustaloupTrigeassou');
end