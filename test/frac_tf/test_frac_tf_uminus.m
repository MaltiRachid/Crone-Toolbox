%% Function-based unit test for frac_tf uminus method
% Last revision 28/09/2021

function tests = test_frac_tf_uminus
    tests = functiontests(localfunctions);
end

function testUminus(testCase)
%SISO systems
sys = frac_tf(frac_poly_exp([1 2],[0.5 0.1]), 1, 'N', 10, 'band', [1e-2 1e2], 'variable', 'p', 'Ts', 0);
s = frac_tf('s');
%MIMO systems
%NB: you can add or substract two matrix containing s but can't use a full
%scalar matrix 
s_mat1 = [1 s];
s_mat2 = [s 2];
%Expected systems
sysExp1 = frac_tf(frac_poly_exp([-1 -2],[0.5 0.1]), 1, 'N', 10, 'band', [1e-2 1e2], 'variable', 'p', 'Ts', 0);
sysExp2 = frac_tf(frac_poly_exp(0), 1, 'N', 10, 'band', [1e-2 1e2], 'variable', 'p', 'Ts', 0);
sysExp3 = frac_tf(frac_poly_exp(-1,1), 1);
sysExp4 = frac_tf(frac_poly_exp(0), 1);
sysExp5 = frac_tf(frac_poly_exp([1 2],[1 0]), 1);
sysExp6 = [frac_tf(frac_poly_exp([1 1],[1 0]), 1) frac_tf(frac_poly_exp([1 2],[1 0]),1)];
sysExp7 = [frac_tf(frac_poly_exp([-1 1],[1 0]), 1) frac_tf(frac_poly_exp([1 -2],[1 0]),1)];

%% Test 1
assertEqual(testCase,-sys, sysExp1, '-sys is not equal to sysExp1');

%% Test 2
assertEqual(testCase,-sys+sys, sysExp2, '-sys+sys is not equal to sysExp2');

%% Test 3
assertEqual(testCase,-s, sysExp3, '-s is not equal to sysExp3');

%% Test 4
assertEqual(testCase,-s+s, sysExp4, '-s+s is not equal to sysExp4');

%% Test 5
assertEqual(testCase,s+2, sysExp5, 's+2 is not equal to sysExp5');

%% Test 6
assertEqual(testCase,s_mat1+s_mat2, sysExp6, 's_mat1+s_mat2 is not equal to sysExp6');

%% Test 7
assertEqual(testCase,s_mat1-s_mat2, sysExp7, 's_mat1-s_mat2 is not equal to sysExp7');
end