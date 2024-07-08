%% Function-based unit test for frac_tf mtimes method
% Last revision 28/09/2021

function tests = test_frac_tf_mtimes
    tests = functiontests(localfunctions);
end

function testMtimes(testCase)
%Shared variable section
%SISO Systems
sys0 = frac_tf();
sys1 = frac_tf(frac_poly_exp([2 5],[0.5 0]), frac_poly_exp([1  2  5],[1  0.5  0]), 'N', 30, 'band', [1e-2  1e8]);
sys2 = frac_tf(frac_poly_exp([1 1],[0.5 0]), frac_poly_exp([2  2  1],[1  0.5  0]), 'N', 30, 'band', [1e-2  1e8]);
sys3= frac_tf(frac_poly_exp([1 1],[0.1 0]), frac_poly_exp([1  1],[2  1]), 'N', 30, 'band', [1e-2  1e8]);
sys4= frac_tf(frac_poly_exp([1 1],[0.1 0]), frac_poly_exp([.1  .1],[2  1]), 'N', 30, 'band', [1e-2  1e8]);
s = frac_tf('s');
%MIMO systems
sys12 = [sys1  sys1 ; sys2 sys2] ;
sys34 = [sys3 ; sys4];
%Expected systems
sysExp1 = frac_tf(frac_poly_exp([6 15],[0.5 0]), frac_poly_exp([1 2 5], [1 0.5 0]), 'N', 30, 'band', [1e-2  1e8]);
sysExp2 = sys1*sys1;
sysExp3 = [2*sys1 sys1; sys1 2*sys1];
sysExp4 = [sys1*sys3 + sys1*sys4; sys2*sys3 + sys2*sys4];
sysExp5 = [2*sys3; 2*sys4];
sysExp6 = frac_tf(frac_poly_exp(3,1), frac_poly_exp(1,0));
sysExp7 = [s 2*s; 2*s s];

%% Test 0
assertEmpty(testCase,sys0*sys1, 'sys0*sys is not empty');

%% Test 1: Mono - Product of a fractional systems with a scalar
assertEqual(testCase,3*sys1, sysExp1, '3*sys is not equal to sysExp1');
assertEqual(testCase,sys1*3, sysExp1, 'sys*3 is not equal to sysExp1'); 

%% Test 2: Mono - Product of 2 fractional systems
assertEqual(testCase,sys1 * transpose(sys1), sysExp2, 'sys * transpose(sys) is not equal to sysExp2'); 

%% Test 3: Multi - Product of a fractional system with a matrix of scalar
assertEqual(testCase,[2 1 ; 1 2]*sys1,sysExp3, '[2 1 ; 1 2]*sys is not equal to sysExp3');
assertEqual(testCase,sys1*[2 1 ; 1 2], sysExp3, 'sys*[2 1 ; 1 2] is not equal to sysExp3');

%% Test 4: multidimensionnel
assertEqual(testCase,sys12 * sys34, sysExp4, 'sys12*sys34 is not equal to sysExp4');

%% Test 5: multidimensionnel avec scalaire
assertEqual(testCase,2*sys34, sysExp5, '2*sys34 is not equal to sysExp5');

%% Test 6: between s and a scalar
assertEqual(testCase,3*s, sysExp6, '3*s is not equal to sysExp6');
assertEqual(testCase,s*3, sysExp6, 's*3 is not equal to sysExp6');

%% Test 7: between s and a scalar matrix
assertEqual(testCase,[1 2; 2 1]*s, sysExp7, '[1 2]*s is not equal to sysExp7');
assertEqual(testCase,s*[1 2; 2 1], sysExp7, 's*[1 2] is not equal to sysExp7');
end