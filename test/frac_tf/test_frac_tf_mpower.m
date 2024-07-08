%% Function-based unit test for frac_tf mpower method
% Last revision 28/09/2021

function tests = test_frac_tf_mpower
    tests = functiontests(localfunctions);
end

function testMpower(testCase)
% Shared variable section
% Empty system
sys0 = frac_tf();
% NaN system
sysNaN = frac_tf(nan);
% SISO system
num1 = frac_poly_exp([2 5], [0.5 0]);
den1 = frac_poly_exp([1 2 5], [1 0.5 0]);
N1 = 30; band1 = [1e-2 1e3];
sys1 = frac_tf(num1, den1, 'N', N1, 'band', band1, 'sim', 'OustaloupTrigeassou');
% MIMO system
sys2 = [sys1 sys1; sys1 sys1];

% Expected values
numExp = frac_poly_exp([4 20 25], [1 0.5 0]);
denExp = frac_poly_exp([1 4 14 20 25], [2 1.5 1 0.5 0]);
sysExp = frac_tf(numExp, denExp, 'N', N1, 'band', band1, 'sim', 'OustaloupTrigeassou');

sys2Exp = [2*sysExp 2*sysExp; 2*sysExp 2*sysExp];

%% Test 1 - Empty system
assertEmpty(testCase,sys0^5, 'Not empty');

%% Test 2 - NaN system
assertTrue(testCase,isnan(sysNaN^5), 'Not a nan');
assertTrue(testCase,isnan(sys1^nan), 'Not a nan sys1^nan = sys1');

%% Test 3 - SISO system
assertEqual(testCase,sys1*sys1, sysExp, 'sys1*sys1 is not equal to sysExp');
assertEqual(testCase,sys1^2, sysExp, 'sys1^2 is not equal to sysExp');
assertEqual(testCase,mpower(sys1,2), sysExp, 'mpower(sys1,2) is not equal to sysExp');

%% Test 4 - MIMO system
assertEqual(testCase,sys2*sys2, sys2Exp, 'sys2*sys2 is not equal to sys2Exp');
assertEqual(testCase,mpower(sys2,2), sys2Exp, 'mpower(sys2,2) is not equal to sys2Exp');
assertEqual(testCase,sys2^2, sys2Exp, 'sys2^2 is not equal to sys2Exp');

%% Test 5: (a*s^alpha)^beta
s = frac_tf('s');
a = 10; alpha = 0.3; beta = 0.3;
sys = a*s^alpha;

sExp = (10^0.3)*s^0.09;

assertEqual(testCase,get(mpower(sys,beta),'num'), get(sys^beta,'num'), 'mpower(sys,beta) is not equal to sys^beta');
assertEqual(testCase,get(mpower(sys,beta),'num'), get(sExp,'num'), 'mpower(sys,beta) is not equal to sExp');
assertEqual(testCase,sys^beta, sExp, 'sys^beta is not equal to sExp');
end