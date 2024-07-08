%% Function-based unit test for frac_lti poles method
% Last revision 24/09/2021

function tests = test_frac_lti_poles
    tests = functiontests(localfunctions);
end

%% Test Numéro 1 - Intégrateur - Simulation d'Oustaloup ; 
% comparée à la simulation de Grünwald
function testPoles(testCase)
    sys = frac_tf(5, frac_poly_exp([1 1], [1.75  0]), 'N', 30, 'band', [1e-5, 1e5]);
    [Poles,Poles_sn,eigen_order] = poles(sys);
    p_exp=[-0.2225-0.9749i -0.2225+0.9749i];
    psn_exp=-1;
    eiord_exp=1.75;
    
    assertEqual(testCase,Poles,{p_exp},'AbsTol',0.1,'Poles is not p_exp');
    assertEqual(testCase,Poles_sn,{psn_exp},'AbsTol',0.1,'Poles_sn is not psn_exp');
    assertEqual(testCase,eigen_order,eiord_exp,'eigen_order is not 1.75');
end