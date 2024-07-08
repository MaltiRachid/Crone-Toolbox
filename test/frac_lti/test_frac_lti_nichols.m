%% Function-based unit test for frac_lti nichols method
% Last revision 24/09/2021

function tests = test_frac_lti_nichols
    tests = functiontests(localfunctions);
end

%% Test Num�ro 1 - Monodimensionnel
function testNicholsSISO(testCase)
    sys = frac_tf(1, frac_poly_exp([1 1], [1.01  0]), 'N', 10, 'band', [1e-2, 1e2]);

    [mag,phi,w_out,h_fig,h_axes]=nichols(sys);

    assertFalse(testCase,isempty(mag),'mag is empty');
    assertFalse(testCase,isempty(phi),'phi is empty');
    assertFalse(testCase,isempty(w_out),'w_out is empty');
    assertFalse(testCase,isempty(h_fig),'h_fig is empty');
    assertFalse(testCase,isempty(h_axes),'h_axes is empty');
end
%% Test Num�ro 2 - Multidimensionnel
function testNicholsMIMO(testCase)
    sys = frac_tf(1, frac_poly_exp([1 1], [1.01  0]), 'N', 10, 'band', [1e-2, 1e2]);
    sys2 = [sys, sys; sys, sys];

    [mag,phi,w_out,h_fig,h_axes]=nichols(sys2);

    assertFalse(testCase,isempty(mag),'mag is empty');
    assertFalse(testCase,isempty(phi),'phi is empty');
    assertFalse(testCase,isempty(w_out),'w_out is empty');
    assertFalse(testCase,isempty(h_fig),'h_fig is empty');
    assertFalse(testCase,isempty(h_axes),'h_axes is empty');
end