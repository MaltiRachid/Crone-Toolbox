% The objective of this function is to test both @frac_lti/svf and 
% @frac_lti/arx functions of the CRONE Toolbox
%
% Copyright � CRONE  2008
% Function created on 2008-05-29 by R. MALTI
%
% Vérification de la fonction clean

%% Function-based unit test for frac_lti frac2int method
% Last revision 29/09/2021

function tests = test_frac_lti_frac2int
    tests = functiontests(localfunctions);
end

function testFrac2int(testCase)
    sys = frac_tf(frac_poly_exp(1, -0.5), 1, 'N', 24, 'band', [1e-3   1e3]);
    sysEnt = frac2int(sys); 
    Z = zero(sysEnt); 
    P = pole(sysEnt);
    w = logspace(-6, 6, 100);
    [G, ph] = bode(sys, w);

%% Data generation
 sys = frac_tf(frac_poly_exp([1 33], [0.5  0]), frac_poly_exp([1  5], [1.5  0]), 'N', 20, 'band', [1e-1  1e6]);
% Analyse fréquentielle du système choisi
    sysEnt = frac2int(sys); Z = zero(sysEnt); P = pole(sysEnt);
    w = logspace(-3, 6, 100);
    [G, ph] = bode(sys, w);
    GG = zeros(length(w), 1); GG(:,1) = 20*log10(G(1, 1, :));
    phG= zeros(length(w), 1); phG(:,1) = ph(1, 1, :);
    [Gr, phr] = bode(sysEnt, w);
    GGr = zeros(length(w), 1); GGr(:,1) = 20*log10(Gr(1, 1, :));
    phGr= zeros(length(w), 1); phGr(:,1) = phr(1, 1, :);
    figure(1), subplot(211), semilogx(w, GG, w, GGr, -Z, zeros(length(Z)), 'o', -P, zeros(length(P)), 'x'),  
                legend('Fractional system', 'Rational approximation')
        subplot(212), semilogx(w, phG, w, phGr, -Z, zeros(length(Z)), 'o', -P, zeros(length(P)), 'x');
end
