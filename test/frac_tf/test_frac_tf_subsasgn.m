%% Function-based unit test for frac_tf subsasgn method
% Last revision 28/09/2021

function tests = test_frac_tf_subsasgn
    tests = functiontests(localfunctions);
end

%% Définition d'un système fractionnaire 
%% Test 1 de la fonction subsasgn
function testSubsasgnSISO(testCase)
    syspolyexp1 = frac_poly_exp([1  1],[0.3    0.7]);
    syspolyexp2 = frac_poly_exp([1  1  1],[0.3    0.7  0.3]);
    sys1 = frac_tf(syspolyexp1,syspolyexp2, 'N', 10, 'band', [1e-5   1e5], 'variable', 's', 'Ts', 0, 'sim', 'OustaloupTrigeassou');

    s = frac_tf;
    s(1) = sys1;
    assertEqual(testCase,s,sys1,'s is not sys1');
end

%% Test 2
function testSubsasgnMIMO(testCase)
    syspolyexp1 = frac_poly_exp([1  1],[0.3    0.7]);
    syspolyexp2 = frac_poly_exp([1  1  1],[0.3    0.7  0.3]);
    sys1 = frac_tf(syspolyexp1,syspolyexp2, 'N', 10, 'band', [1e-5   1e5], 'variable', 's', 'Ts', 0, 'sim', 'OustaloupTrigeassou');

    sys2 = [sys1, sys1, sys1, sys1];
    sys2(5) = sys1;
    assertEqual(testCase, sys2,[sys1 sys1 sys1 sys1 sys1]);
end