%% Function-based unit test for frac_tf tfdata method
% Last revision 24/09/2021

function tests = test_frac_tf_tfdata
    tests = functiontests(localfunctions);
end

%% Test 1
function testTfdataSISO(testCase)
    sys = frac_tf(frac_poly_exp([2 5],[0.5 0]), frac_poly_exp([1  2  5],[1  0.5  0]));
    [num_coef,num_order,den_coef,den_order]=tfdata(sys);

    assertEqual(testCase,num_coef,{[2 5]});
    assertEqual(testCase,num_order,{[0.5 0]});
    assertEqual(testCase,den_coef,{[1 2 5]});
    assertEqual(testCase,den_order,{[1 0.5 0]});
end

%% Test 2
function testTfdataEmpty(testCase)
    sys_empty = frac_tf();
    verifyError(testCase,@() tfdata(sys_empty),'CRONE:sys_empty');
end
%% Test multidimensionnel
function testTfdataMIMO(testCase)
    sys = frac_tf(frac_poly_exp([2 5],[0.5 0]), frac_poly_exp([1  2  5],[1  0.5  0]));
    sys = [sys  sys ; sys sys] ; 
    [num_coef,num_order,den_coef,den_order]=tfdata(sys(1,1));
    
    assertEqual(testCase,num_coef,{[2 5]});
    assertEqual(testCase,num_order,{[0.5 0]});
    assertEqual(testCase,den_coef,{[1 2 5]});
    assertEqual(testCase,den_order,{[1 0.5 0]});
    verifyError(testCase,@() tfdata(sys),'CRONE:sys_empty');
end