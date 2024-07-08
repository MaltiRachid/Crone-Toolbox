%% Function-based unit test for frac_idtf constructor
% Last revision 06/09/2021

function tests = test_frac_idtf
    tests = functiontests(localfunctions);
end

function testSysArgin0(testCase)
    sys0 = frac_idtf;

    assertEmpty(testCase, get(sys0,'sys'), 'sys is not empty');
    assertEqual(testCase, get(sys0,'P'), 0,'P is not 0');
    assertEqual(testCase, get(sys0,'J'), 0,'J is not 0');
    assertEqual(testCase, get(sys0,'sigma_2'), 0,'sigma_2 is not 0');
    assertEqual(testCase, get(sys0,'Phi'), 0,'Phi is not 0');
    assertEmpty(testCase, get(sys0,'Name'));
end

function testSysArgin1(testCase)
    sys1 = frac_idtf(frac_tf('s'));
    
    assertEqual(testCase, get(sys1,'sys'), frac_tf('s'), 'sys is not s');
    assertEqual(testCase, get(sys1,'P'), 0,'P is not 0');
    assertEqual(testCase, get(sys1,'J'), 0,'J is not 0');
    assertEqual(testCase, get(sys1,'sigma_2'), 0,'sigma_2 is not 0');
    assertEqual(testCase, get(sys1,'Phi'), 0,'Phi is not 0');
    assertEqual(testCase, get(sys1,'Name'),'','Name is not ''''');
    
    nsys = frac_tf(frac_poly_exp([1 1],[0.5 0]), frac_poly_exp([1 2 1],[2.3 1.3 0.3]));
    set(sys1, 'sys', nsys);
    set(sys1, 'P', 1);
    set(sys1, 'J', 2);
    set(sys1, 'sigma_2', 0.3);
    set(sys1, 'Phi', 0.1);
    set(sys1, 'Name', 'Model 1');
    assertEqual(testCase, get(sys1,'sys'), nsys, 'sys is not nsys');
    assertEqual(testCase, get(sys1,'P'), 1,'P is not 0');
    assertEqual(testCase, get(sys1,'J'), 2,'J is not 0');
    assertEqual(testCase, get(sys1,'sigma_2'), 0.3,'sigma_2 is not 0');
    assertEqual(testCase, get(sys1,'Phi'), 0.1,'Phi is not 0');
    assertEqual(testCase, get(sys1,'Name'), 'Model 1','Name is not ''Model 1''');
end

function testSysArgin2(testCase)
    sys2 = frac_idtf(frac_tf('s'),'P',1,'Phi',0.3,'J',4,'sigma_2',0.1,'Name','Model 2');

    assertEqual(testCase, get(sys2,'sys'), frac_tf('s'), 'sys is not s');
    assertEqual(testCase, get(sys2,'P'), 1,'P is not 0');
    assertEqual(testCase, get(sys2,'J'), 4,'J is not 0');
    assertEqual(testCase, get(sys2,'sigma_2'), 0.1,'sigma_2 is not 0');
    assertEqual(testCase, get(sys2,'Phi'), 0.3,'Phi is not 0');
    assertEqual(testCase, get(sys2,'Name'), 'Model 2','Name is not ''Model 2''');
end