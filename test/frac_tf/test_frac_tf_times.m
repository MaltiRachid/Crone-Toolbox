%% Function-based unit test for frac_tf times method
% Last revision 28/09/2021

function tests = test_frac_tf_times
    tests = functiontests(localfunctions);
end

%% Test 1
function testTimesSISO(testCase)
    sys = frac_tf(frac_poly_exp([2 5],[0.5 0]), frac_poly_exp([1  2  5],[1  0.5  0]));
    sys2 = sys .* sys;
    sys2_exp=frac_tf(frac_poly_exp([4 20 25],[1 0.5 0]),frac_poly_exp([1 4 14 20 25],[2 1.5 1 0.5 0]));
    A = 2;
    sys4 = A .* sys;
    sys4_exp=frac_tf(frac_poly_exp([4 10],[0.5 0]),frac_poly_exp([1 2 5],[1 0.5 0]));
    
    assertEqual(testCase,sys2,sys2_exp,'sys2 is not sys2_exp');
    assertEqual(testCase,sys4,sys4_exp,'sys4 is not sys4_exp');
end

%% Test 2
function testTimesEmpty(testCase)
    sys = frac_tf(frac_poly_exp([2 5],[0.5 0]), frac_poly_exp([1  2  5],[1  0.5  0]));
    sys_empty = frac_tf();
    sys2 = sys_empty .* sys;
    
    assertEmpty(testCase,sys2,'sys2 is not empty');
end
%% Test multidimensionnel
function testTimesMIMO(testCase)
    sys = frac_tf(frac_poly_exp([2 5],[0.5 0]), frac_poly_exp([1  2  5],[1  0.5  0]));
    sysm = [sys  sys] ;
    sys_exp=frac_tf(frac_poly_exp([4 20 25],[1 0.5 0]),frac_poly_exp([1 4 14 20 25],[2 1.5 1 0.5 0]));
    sysm_exp=[sys_exp sys_exp];
    sys3 = sysm .* sysm;
    
    A = 2*ones(size(sysm));
    sys5 = A .* sysm;
    sys5_exp=2*sysm;
    
    assertEqual(testCase,sys3,sysm_exp,'sys3 is not sysm_exp');
    assertEqual(testCase,sys5,sys5_exp,'sys5 is not sys5_exp');
end