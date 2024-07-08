%% Function-based unit test for frac_lti bode method
% Last revision 24/09/2021

function tests = test_frac_tf_bode
    tests = functiontests(localfunctions);
end

function testBode(testCase)
%% Data generation
    fpi1 = frac_poly_imp([1,2,3],[1,2,3],2.5);
    fpi2 = frac_poly_imp([1+1i,2,3*1i],[1,2,3],3.3);

    ftf0 = frac_tf;
    ftf1 = frac_tf(1,fpi1);
    ftf2 = frac_tf(1,fpi2);

%% Function call without frequency band

    verifyWarning(testCase,@() bode(ftf0),'CRONE:sys_empty');
    
    [mag,phi,w_out,h_fig,h_axes]=bode(ftf1);
    assertFalse(testCase,isempty(mag),'mag is empty');
    assertFalse(testCase,isempty(phi),'phi is empty');
    assertFalse(testCase,isempty(w_out),'w_out is empty');
    assertFalse(testCase,isempty(h_fig),'h_fig is empty');
    assertFalse(testCase,isempty(h_axes),'h_axes is empty');
    
    [mag,phi,w_out,h_fig,h_axes]=bode(ftf2);
    assertFalse(testCase,isempty(mag),'mag is empty');
    assertFalse(testCase,isempty(phi),'phi is empty');
    assertFalse(testCase,isempty(w_out),'w_out is empty');
    assertFalse(testCase,isempty(h_fig),'h_fig is empty');
    assertFalse(testCase,isempty(h_axes),'h_axes is empty');

%% Function call with frequency band

    w = logspace(-3,2,400);
    
    [mag,phi,w_out,h_fig,h_axes]=bode(ftf1,w);
    assertFalse(testCase,isempty(mag),'mag is empty');
    assertFalse(testCase,isempty(phi),'phi is empty');
    assertFalse(testCase,isempty(w_out),'w_out is empty');
    assertFalse(testCase,isempty(h_fig),'h_fig is empty');
    assertFalse(testCase,isempty(h_axes),'h_axes is empty');
    
    [mag,phi,w_out,h_fig,h_axes]=bode(ftf2,w);
    assertFalse(testCase,isempty(mag),'mag is empty');
    assertFalse(testCase,isempty(phi),'phi is empty');
    assertFalse(testCase,isempty(w_out),'w_out is empty');
    assertFalse(testCase,isempty(h_fig),'h_fig is empty');
    assertFalse(testCase,isempty(h_axes),'h_axes is empty');

%% Mimo system

    sys = [ftf1 ftf2 ; ftf2 ftf1];

    [mag,phi,w_out,h_fig,h_axes]=bode(sys);
    assertFalse(testCase,isempty(mag),'mag is empty');
    assertFalse(testCase,isempty(phi),'phi is empty');
    assertFalse(testCase,isempty(w_out),'w_out is empty');
    assertFalse(testCase,isempty(h_fig),'h_fig is empty');
    assertFalse(testCase,isempty(h_axes),'h_axes is empty');
    
    [mag,phi,w_out,h_fig,h_axes]=bode(sys,w);
    assertFalse(testCase,isempty(mag),'mag is empty');
    assertFalse(testCase,isempty(phi),'phi is empty');
    assertFalse(testCase,isempty(w_out),'w_out is empty');
    assertFalse(testCase,isempty(h_fig),'h_fig is empty');
    assertFalse(testCase,isempty(h_axes),'h_axes is empty');
end