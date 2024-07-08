%% Function-based unit test for frac_tf isempty method
% Last revision 24/09/2021

function tests = test_frac_tf_isempty
    tests = functiontests(localfunctions);
end

%% Yes empty
function testIsempty(testCase)
    s = frac_tf;
    assertTrue(testCase,isempty(s));

%% Not empty
    syspolyexp1 = frac_poly_exp([1  1],[0.3    0.7]);
    syspolyexp2 = frac_poly_exp([1  1  1],[0.3    0.7  0.3]);
    sys1 = frac_tf(syspolyexp1,syspolyexp2, 'N', 10, 'band', [1e-5   1e5], 'variable', 's', 'Ts', 0, 'sim', 'OustaloupTrigeassou');

    assertFalse(testCase,isempty(sys1));
end