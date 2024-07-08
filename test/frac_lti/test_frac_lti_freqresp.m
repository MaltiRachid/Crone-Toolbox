%% Function-based unit test for freqresp method
% Last revision 23/09/2021

function tests = test_frac_lti_freqresp
    tests = functiontests(localfunctions);
end

%% Test Numéro 1 - Intégrateur - Simulation d'Oustaloup ; 
% comparée à la simulation de Grünwald
function testFreqresp(testCase)
    sys = frac_tf(frac_poly_exp(1, 1.5), 1, 'N', 30, 'band', [1e-5, 1e5]);
    w = 1e8;
    resu = freqresp(sys,w);
    resu2 = ((1i*w)^1.5);

    assertEqual(testCase,resu,resu2,'resu is not resu2');
end
