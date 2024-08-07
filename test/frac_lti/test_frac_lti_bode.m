%% Function-based unit test for frac_lti bode method
% Last revision 29/09/2021

function tests = test_frac_lti_bode
    tests = functiontests(localfunctions);
end
%% Test Num�ro 1 - Monodimensionnel
function testBodeSISO(testCase)
    sys = frac_tf(1, frac_poly_exp([1 1], [1.01  0]), 'N', 10, 'band', [1e-2, 1e2]);
    [mag,phi,w_out,h_fig,h_axes]=bode(sys);
    
    assertFalse(testCase,isempty(mag),'mag is empty');
    assertFalse(testCase,isempty(phi),'phi is empty');
    assertFalse(testCase,isempty(w_out),'w_out is empty');
    assertFalse(testCase,isempty(h_fig),'h_fig is empty');
    assertFalse(testCase,isempty(h_axes),'h_axes is empty');
end

%% Test Num�ro 2 - Multidimensionnel
function testBodeMIMO(testCase)
    sys = frac_tf(1, frac_poly_exp([1 1], [1.01  0]), 'N', 10, 'band', [1e-2, 1e2]);
    sys2 = [sys, sys; sys, sys];
    [mag,phi,w_out,h_fig,h_axes]=bode(sys2);
    
    assertFalse(testCase,isempty(mag),'mag is empty');
    assertFalse(testCase,isempty(phi),'phi is empty');
    assertFalse(testCase,isempty(w_out),'w_out is empty');
    assertFalse(testCase,isempty(h_fig),'h_fig is empty');
    assertFalse(testCase,isempty(h_axes),'h_axes is empty');
end