%% Function-based unit test for frac_lti norm method
% Last revision 24/09/2021

function tests = test_frac_lti_norm
    tests = functiontests(localfunctions);
end

function testNorm(testCase)
    sys = frac_tf(1, frac_poly_exp([1 1], [1.01  0]), 'N', 10, 'band', [1e-2, 1e2]);
    no=norm(sys);
    
    assertFalse(testCase,isempty(no),'no is empty');
    assertFalse(testCase,isnan(no),'no is nan');
end



