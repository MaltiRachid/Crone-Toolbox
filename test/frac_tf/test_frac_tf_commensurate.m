%% Function-based unit test for frac_tf commensurate method
% Last revision 24/09/2021

function tests = test_frac_tf_commensurate
    tests = functiontests(localfunctions);
end

%% Test 1 - Monodimensional
function testComSISO1(testCase)
    sys = frac_tf(frac_poly_exp([2 5],[1.1 0]), frac_poly_exp([1  2.1  5],[1.5  0.5  0]));
    [comm, sys_tf] = commensurate(sys);
    sys_exp=tf([2 0 0 0 0 0 0 0 0 0 0 5],[1 0 0 0 0 0 0 0 0 0 2.1 0 0 0 0 5]);
    
    assertEqual(testCase,comm,0.1,'AbsTol',0.01,'comm is not 0.1');
    assertEqual(testCase,sys_tf,sys_exp,'sys_tf is not sys_exp');
end
%% Test 2 - Monodimensionnel
function testComSISO2(testCase)
    fpi1=frac_poly_imp([2 1 -1 ],[3 3.5 5],1);
    fpi2=frac_poly_imp([3 2],[1.5 4 ],1);
    ftf=frac_tf(fpi2,fpi1);
    [comm, sys_tf] = commensurate(ftf);
    sys_exp=tf([2 0 0 0 0 3 0 0 0],[-1 0 0 1 2 0 0 0 0 0 0]);

    assertEqual(testCase,comm,0.5,'AbsTol',0.01,'comm is not 0.5');
    assertEqual(testCase,sys_tf,sys_exp,'sys_tf is not sys_exp');
end

%% Test 3 - Monodimensional avec une constante au numérateur
function testComSISO3(testCase)
    sys22 = frac_tf(1, frac_poly_exp([1 1], [1.01  0]), 'N', 10, 'band', [1e-2, 1e2]);
    [comm, sys_tf] = commensurate(sys22);
    den=zeros(1,102);den(1)=1;den(102)=1;
    sys_exp=tf(1,den);
    
    assertEqual(testCase,comm,0.01,'AbsTol',0.001,'comm is not 0.01');
    assertEqual(testCase,sys_tf,sys_exp,'sys_tf is not sys_exp');
end
%% Test 4 - Monodimensional with a cst in the numerator
function testComSISO4(testCase)
    sys2 = frac_tf(1 , frac_poly_exp([1  2  5],[1  0.5  0]));
    [comm, sys_tf] = commensurate(sys2);
    sys_exp=tf(1,[1 2 5]);
    
    assertEqual(testCase,comm,0.5,'AbsTol',0.01,'comm is not 0.5');
    assertEqual(testCase,sys_tf,sys_exp,'sys_tf is not sys_exp');
end
%% Test 5 - A SISO constant transfer function
function testComSISO5(testCase)
    sys = frac_tf(5, 2);
    [comm, sys_tf] = commensurate(sys);
    sys_exp=tf(5,2);
    
    assertEqual(testCase,comm,1,'AbsTol',0.1,'comm is not 1');
    assertEqual(testCase,sys_tf,sys_exp,'sys_tf is not sys_exp');

end

%% Test 6 - Multidimensional 
function testComMIMO1(testCase)
    sys = frac_tf(frac_poly_exp([2 5],[1.1 0]), frac_poly_exp([1  2.1  5],[1.5  0.5  0]));
    sys2 = frac_tf(1 , frac_poly_exp([1  2  5],[1  0.5  0]));
    sys3 = [sys, sys2;sys2, sys2];
    [comm, sys_tf] = commensurate(sys3);
    sys_exp1=tf([2 0 0 0 0 0 0 0 0 0 0 5],[1 0 0 0 0 0 0 0 0 0 2.1 0 0 0 0 5]);
    sys_exp2=tf(1,[1 0 0 0 0 2 0 0 0 0 5]);
    sys_exp=[sys_exp1 sys_exp2;sys_exp2 sys_exp2];
    
    assertEqual(testCase,comm,0.1,'AbsTol',0.01,'comm is not 1');
    assertEqual(testCase,sys_tf,sys_exp,'sys_tf is not sys_exp');
end

%% Test 7 - A MIMO TF with one constant TF
function testComMIMO2(testCase)
    sys = frac_tf(frac_poly_exp([2 5],[1.1 0]), frac_poly_exp([1  2.1  5],[1.5  0.5  0]));
    sys3(2,2) = sys;
    [comm, sys_tf] = commensurate(sys3);
    sys_exp=tf([2 0 0 0 0 0 0 0 0 0 0 5],[1 0 0 0 0 0 0 0 0 0 2.1 0 0 0 0 5]);
    
    assertEqual(testCase,comm,0.1,'AbsTol',0.01,'comm is not 1');
    assertEqual(testCase,sys_tf,sys_exp,'sys_tf is not sys_exp');
end

