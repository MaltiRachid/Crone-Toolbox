%% Function-based unit test for frac_tf constructor
% Last revision 14/06/2021

function tests = test_frac_tf
    tests = functiontests(localfunctions);
end

function testSysArgin0(testCase)
    sys0 = frac_tf;
    
    assertEmpty(testCase, get(sys0,'num'), 'num is not empty');
    assertEmpty(testCase, get(sys0,'den'), 'den is not empty');
    assertEmpty(testCase, get(sys0,'N'), 'N is not empty.');
    assertEmpty(testCase, get(sys0,'band'), 'w is not empty.');
    assertEqual(testCase, get(sys0,'variable'), 's', 'va is not s');
    assertEqual(testCase, get(sys0,'Ts'), 0, 'AbsTol', 0.1, 'Ts is not 0'); %assert absolute tolerance less than 10%
    assertEqual(testCase, get(sys0,'version'), 'OO-CRONE 2.0', 'version is not OO-CRONE 2.0');
    assertEqual(testCase, get(sys0,'sim'), 'Grunwald', 'sim is not Grunwald');
end

function testSysArgin1(testCase)
    sys1 = frac_tf('s');
    sys1num = frac_poly_exp(1, 1);
    sys1den = frac_poly_exp(1, 0);
    
    assertEqual(testCase, get(sys1,'num'), sys1num, 'AbsTol', 0.1, 'num is not s');
    assertEqual(testCase, get(sys1,'den'), sys1den, 'AbsTol', 0.1, 'den is not 1');
    assertEmpty(testCase, get(sys1,'N'), 'N is not empty.');
    assertEmpty(testCase, get(sys1,'band'), 'w is not empty.');
    assertEqual(testCase, get(sys1,'variable'), 's', 'va is not s');
    assertEqual(testCase, get(sys1,'Ts'), 0, 'AbsTol', 0.1, 'Ts is not 0'); %assert absolute tolerance less than 10%
    assertEqual(testCase, get(sys1,'version'), 'OO-CRONE 2.0', 'version is not OO-CRONE 2.0');
    assertEqual(testCase, get(sys1,'sim'), 'Grunwald', 'sim is not Grunwald');
end

function testSysSISO(testCase)    
    pol1 = frac_poly_exp([1 1], [0.3 0.7]);
    pol2 = frac_poly_exp([1 1 1], [0.3 0.7 0.3]);
    sys2 = frac_tf(pol1,pol2, 'N', 10, 'band', [1e-5   1e5], 'variable', 's', 'Ts', 0, 'sim', 'OustaloupTrigeassou');
    
    assertEqual(testCase, get(sys2,'num'), pol1, 'AbsTol', 0.1, 'num is not pol1');
    assertEqual(testCase, get(sys2,'den'), pol2, 'AbsTol', 0.1, 'den is not pol2');
    assertEqual(testCase, get(sys2,'N'), 10, 'AbsTol', 0.1, 'N is not 10 +-10%');
    assertEqual(testCase, get(sys2,'band'), [1e-5 1e5], 'AbsTol', 0.1);
    assertEqual(testCase, get(sys2,'variable'), 's', 'va is not s');
    assertEqual(testCase, get(sys2,'Ts'), 0, 'AbsTol', 0.1, 'Ts is not 0'); %assert absolute tolerance less than 10%
    assertEqual(testCase, get(sys2,'version'), 'OO-CRONE 2.0', 'version is not OO-CRONE 2.0');
    assertEqual(testCase, get(sys2,'sim'), 'OustaloupTrigeassou', 'sim is not OustaloupTrigeassou');

    assertTrue(testCase, isa(get(sys2,'num'), 'frac_poly_exp'), 'num is not a frac_poly_exp');
    assertTrue(testCase, isa(get(get(sys2,'num'),'coef'), 'cell'), 'coef is not a cell');
    assertTrue(testCase, isa(get(get(sys2,'num'),'order'), 'cell'), 'order is not a cell');
end

function testSysMIMO(testCase)
    pol1 = frac_poly_exp([1 1], [0.3 0.7]);
    pol2 = frac_poly_exp([1 1 1], [0.3 0.7 0.3]);
    sys2 = frac_tf(pol1, pol2, 'N', 10, 'band', [1e-5   1e5], 'variable', 's', 'Ts', 0, 'sim', 'OustaloupTrigeassou');
    sys3 = [sys2, sys2 , sys2, sys2];
    
    for i = 1:4
        assertEqual(testCase, get(sys3(i),'num'), pol1, 'AbsTol', 0.1, 'num is not pol1');
        assertEqual(testCase, get(sys3(i),'den'), pol2, 'AbsTol', 0.1, 'den is not pol2');
        assertEqual(testCase, get(sys3(i),'N'), 10, 'AbsTol', 0.1, 'N is not 10 +-10%');
        assertEqual(testCase, get(sys3(i),'band'), [1e-5 1e5], 'AbsTol', 0.1);
        assertEqual(testCase, get(sys3(i),'variable'), 's', 'va is not s');
        assertEqual(testCase, get(sys3(i),'Ts'), 0, 'AbsTol', 0.1, 'Ts is not 0'); %assert absolute tolerance less than 10%
        assertEqual(testCase, get(sys3(i),'version'), 'OO-CRONE 2.0', 'version is not OO-CRONE 2.0');
        assertEqual(testCase, get(sys3(i),'sim'), 'OustaloupTrigeassou', 'sim is not OustaloupTrigeassou');
    end 
    
    sys3(5) = sys2;
    
    assertEqual(testCase, get(sys3(5),'num'), pol1, 'AbsTol', 0.1, 'num 5 is not pol1');
    assertEqual(testCase, get(sys3(5),'den'), pol2, 'AbsTol', 0.1, 'den 5 is not pol2');
    assertEqual(testCase, get(sys3(5),'N'), 10, 'AbsTol', 0.1, 'N is not 10 +-10%');
    assertEqual(testCase, get(sys3(5),'band'), [1e-5 1e5], 'AbsTol', 0.1);
    assertEqual(testCase, get(sys3(5),'variable'), 's', 'va 5 is not s');
    assertEqual(testCase, get(sys3(5),'Ts'), 0, 'AbsTol', 0.1, 'Ts is not 0'); %assert absolute tolerance less than 10%
    assertEqual(testCase, get(sys3(5),'version'), 'OO-CRONE 2.0', 'version is not OO-CRONE 2.0');
    assertEqual(testCase, get(sys3(5),'sim'), 'OustaloupTrigeassou', 'sim 5 is not OustaloupTrigeassou');
end

function testParamQ(testCase)
    assertError(testCase, @()frac_tf('q'), '');
end

function testArginNaN(testCase)
    num = frac_poly_exp([1 1], [0.3 0.7]);
    den = frac_poly_exp([1 1 1], [0.3 0.7 0.3]);
    num_nan=frac_poly_exp(NaN);
    den_nan=frac_poly_exp(NaN);
    sys_nan=frac_tf(num_nan,den_nan);
    sys1=frac_tf(num_nan,den);
    sys2=frac_tf(num,den_nan);
    
    assertTrue(testCase,isnan(sys_nan));
    assertTrue(testCase,isnan(sys1));
    assertTrue(testCase,isnan(sys2));
end