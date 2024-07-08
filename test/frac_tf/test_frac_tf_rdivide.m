%% Function-based unit test for frac_tf rdivide method
% Last revision 29/09/2021

function tests = test_frac_tf_rdivide
    tests = functiontests(localfunctions);
end

%% Test 1 - Monodimensional - Frac_tf ./ Frac_tf
function testRdivideSISO(testCase)
    sys = frac_tf(frac_poly_exp([2 5],[0.5 0]),frac_poly_exp([1 2 5],[1 0.5 0]));
    sys2 = sys ./ sys;
    sys2_exp = frac_tf(frac_poly_exp([2 9 20 25],[1.5 1 0.5 0]),frac_poly_exp([2 9 20 25],[1.5 1 0.5 0]));
    
    assertEqual(testCase,sys2,sys2_exp,'sys2 is not sys2_exp');
    %% Test 2 - Monodimensional - Frac_tf ./ numeric
    sys2 = sys ./ 5;
    sys2_exp=frac_tf(frac_poly_exp([2 5],[0.5 0]),frac_poly_exp([5 10 25],[1 0.5 0]));
    
    assertEqual(testCase,sys2,sys2_exp,'sys2 is not sys2_exp');
    %% Test 3 - Monodimensional - numeric ./ Frac_tf 
    sys3 = 5 ./ sys;
    sys3_exp=frac_tf(frac_poly_exp([5 10 25],[1 0.5 0]),frac_poly_exp([2 5],[0.5 0]));
    
    assertEqual(testCase,sys3,sys3_exp,'sys3 is not sys3_exp');
end
%% Test 4 - Multidimensional - Frac_tf ./ Frac_tf 
function testRdivideMIMO(testCase)
    sys = frac_tf(frac_poly_exp([2 5],[0.5 0]),frac_poly_exp([1 2 5],[1 0.5 0]));
    sysx = [sys, sys;sys, sys];
    sys2 = sysx ./ sysx;
    sys_exp = frac_tf(frac_poly_exp([2 9 20 25],[1.5 1 0.5 0]),frac_poly_exp([2 9 20 25],[1.5 1 0.5 0]));
    sys2_exp=[sys_exp sys_exp ; sys_exp sys_exp];  

    assertEqual(testCase,sys2,sys2_exp,'sys2 is not sys2_exp');
    %% Test 5 - Multidimensional - Frac_tf ./ numeric 
    A = [1 2 ; 2 2];
    sys3 = sysx ./ A;
    sys3_exp=[sys sys./2; sys./2 sys./2]; %!! 1x4 et non 2x2 !!

    assertEqual(testCase,sys3,sys3_exp,'sys3 is not sys3_exp');
    %% Test 5 - Multidimensional - Frac_tf ./ numeric 
    sys4 =  A ./ sysx;
    sys4_exp=[1./sys 2./sys; 2./sys 2./sys];

    assertEqual(testCase,sys4,sys4_exp,'sys4 is not sys4_exp');
end

%% Test 3 - Monodimensional - Frac_tf empty
function testRdivideEmpty(testCase)
    sys = frac_tf(frac_poly_exp([2 5],[0.5 0]),frac_poly_exp([1 2 5],[1 0.5 0]));
    sys_empty = frac_tf();
    
    assertEmpty(testCase,sys_empty./sys,'sys_empty./sys is not empty');
    assertEmpty(testCase,sys./sys_empty,'sys./sys_empty is not empty');
end
