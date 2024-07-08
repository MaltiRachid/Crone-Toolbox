%% Function-based unit test for frac_tf frac2int method
% Last revision 29/09/2021

function tests = test_frac_tf_frac2int
    tests = functiontests(localfunctions);
end

%% Test - Monodimensional - Transfer Function N°1 used in test_frac_lti_lsim
function testFrac2intSISO(testCase)
% Definition of the fractional system
sys = frac_tf(1, frac_poly_exp(1, 1.5), 'N', 30, 'band', [1e-4, 1e4]);
    w = logspace(-5, 5, 100);
    [G, ph] = bode(sys, w);
    GG = zeros(length(w), 1); GG(:,1) = 20*log10(G(1, 1, :));
    phG= zeros(length(w), 1); phG(:,1) = ph(1, 1, :); 
% Frequency analysis using Oustaloup's approximation
set(sys,'sim','Oustaloup');
sysOust = frac2int(sys);
    [Go, pho] = bode(sysOust, w);
    GGo  = zeros(length(w), 1); GGo(:,1) = 20*log10(Go(1, 1, :));
    phGo = zeros(length(w), 1); phGo(:,1) = pho(1, 1, :);
% Frequency analysis using Trigeassou's approximation
set(sys,'sim','OustaloupTrigeassou');
sysTrig = frac2int(sys);
    [GT, phT] = bode(sysTrig, w);
    GGT  = zeros(length(w), 1); GGT(:,1) = 20*log10(GT(1, 1, :));
    phGT = zeros(length(w), 1); phGT(:,1) = phT(1, 1, :);
figure(1), subplot(211), semilogx(w, GG, w, GGo, w, GGT),  
        legend('Fractional system', 'Oustaloup''s approximation', ...
            'Trigeassou''s approximation')
       subplot(212), semilogx(w, phG, w, phGo, w, phGT);

       assertTrue(testCase,isa(sysOust,'tf'),'sysOust is not a tf object');
       assertFalse(testCase,isempty(sysOust),'sysOust is empty');
       assertTrue(testCase,isa(sysTrig,'tf'),'sysTrig is not a tf object');
       assertFalse(testCase,isempty(sysTrig),'sysTrig is empty');
%% Test - Monodimensional - Transfer Function N°2 used in test_frac_lti_lsim
% Definition of the fractional system
sys = frac_tf(5, frac_poly_exp([5 1], [1.75  0]), 'N', 30, 'band', [1e-5, 1e5]);
    w = logspace(-5, 5, 100);
    [G, ph] = bode(sys, w);
    GG = zeros(length(w), 1); GG(:,1) = 20*log10(G(1, 1, :));
    phG= zeros(length(w), 1); phG(:,1) = ph(1, 1, :);  
% Frequency analysis using Oustaloup's approximation
set(sys,'sim','Oustaloup');
sysOust = frac2int(sys);
    [Go, pho] = bode(sysOust, w);
    GGo  = zeros(length(w), 1); GGo(:,1) = 20*log10(Go(1, 1, :));
    phGo = zeros(length(w), 1); phGo(:,1) = pho(1, 1, :);
% Frequency analysis using Trigeassou's approximation
set(sys,'sim','OustaloupTrigeassou');
sysTrig = frac2int(sys);
    [GT, phT] = bode(sysTrig, w);
    GGT  = zeros(length(w), 1); GGT(:,1) = 20*log10(GT(1, 1, :));
    phGT = zeros(length(w), 1); phGT(:,1) = phT(1, 1, :);
figure(2), subplot(211), semilogx(w, GG, w, GGo, w, GGT),  
        legend('Fractional system', 'Oustaloup''s approximation', ...
            'Trigeassou''s approximation')
       subplot(212), semilogx(w, phG, w, phGo, w, phGT);

       assertTrue(testCase,isa(sysOust,'tf'),'sysOust2 is not a tf object');
       assertFalse(testCase,isempty(sysOust),'sysOust2 is empty');
       assertTrue(testCase,isa(sysTrig,'tf'),'sysTrig2 is not a tf object');
       assertFalse(testCase,isempty(sysTrig),'sysTrig2 is empty');
%% Test - Monodimensional - Transfer Function N°3 used in test_frac_lti_lsim
% Definition of the fractional system
sys = frac_tf(frac_poly_exp(1,-0.5),1, 'N', 24, 'band', [1e-6  1e2]);
    w = logspace(-6, 2, 100);
    [G, ph] = bode(sys, w);
    GG = zeros(length(w), 1); GG(:,1) = 20*log10(G(1, 1, :));
    phG= zeros(length(w), 1); phG(:,1) = ph(1, 1, :);  
% Frequency analysis using Oustaloup's approximation
set(sys,'sim','Oustaloup');
sysOust = frac2int(sys);
    [Go, pho] = bode(sysOust, w);
    GGo  = zeros(length(w), 1); GGo(:,1) = 20*log10(Go(1, 1, :));
    phGo = zeros(length(w), 1); phGo(:,1) = pho(1, 1, :);
% Frequency analysis using Trigeassou's approximation
set(sys,'sim','OustaloupTrigeassou');
sysTrig = frac2int(sys);
    [GT, phT] = bode(sysTrig, w);
    GGT  = zeros(length(w), 1); GGT(:,1) = 20*log10(GT(1, 1, :));
    phGT = zeros(length(w), 1); phGT(:,1) = phT(1, 1, :);
figure(3), subplot(211), semilogx(w, GG, w, GGo, w, GGT),  
        legend('Fractional system', 'Oustaloup''s approximation', ...
            'Trigeassou''s approximation')
       subplot(212), semilogx(w, phG, w, phGo, w, phGT);
       
       assertTrue(testCase,isa(sysOust,'tf'),'sysOust3 is not a tf object');
       assertFalse(testCase,isempty(sysOust),'sysOust3 is empty');
       assertTrue(testCase,isa(sysTrig,'tf'),'sysTrig3 is not a tf object');
       assertFalse(testCase,isempty(sysTrig),'sysTrig3 is empty');
end

%% Test frac2intsn
% Definition of the fractional system
%     sys = frac_tf(frac_poly_exp(1, -0.5), 1, 24, [1e-3   1e3]);
%     sysEnt = frac2intsn(sys); Z = zero(sysEnt); P = pole(sysEnt);
%     w = logspace(-6, 6, 100);
%     [G, ph] = bode(sys, w);    
%     GG = zeros(length(w), 1); GG(:,1) = 20*log10(G(1, 1, :));
%     phG= zeros(length(w), 1); phG(:,1) = ph(1, 1, :);
%     [Gr, phr] = bode(sysEnt, w);
%     GGr = zeros(length(w), 1); GGr(:,1) = 20*log10(Gr(1, 1, :));
%     phGr= zeros(length(w), 1); phGr(:,1) = phr(1, 1, :);
%     figure(4), subplot(211), semilogx(w, GG, w, GGr, -Z, zeros(length(Z)), 'o', -P, zeros(length(P)), 'x'),  
%                 legend('Fractional system', 'Rational approximation')
%         subplot(212), semilogx(w, phG, w, phGr, -Z, zeros(length(Z)), 'o', -P, zeros(length(P)), 'x');

%% Data generation
function testFrac2int(testCase)
% Definition of the fractional system
 sys = frac_tf(frac_poly_exp([1 33], [0.5  0]), frac_poly_exp([1  5], [1.5  0]), 'N', 20, 'band', [1e-1  1e6]);
% Frequency analysis
    sysEnt = frac2int(sys); Z = zero(sysEnt); P = pole(sysEnt);
    w = logspace(-3, 6, 100);
    [G, ph] = bode(sys, w);
    GG = zeros(length(w), 1); GG(:,1) = 20*log10(G(1, 1, :));
    phG= zeros(length(w), 1); phG(:,1) = ph(1, 1, :);
    [Gr, phr] = bode(sysEnt, w);
    GGr = zeros(length(w), 1); GGr(:,1) = 20*log10(Gr(1, 1, :));
    phGr= zeros(length(w), 1); phGr(:,1) = phr(1, 1, :);
    figure(5), subplot(211), semilogx(w, GG, w, GGr, -Z, zeros(length(Z)), 'o', -P, zeros(length(P)), 'x'),  
                legend('Fractional system', 'Rational approximation')
        subplot(212), semilogx(w, phG, w, phGr, -Z, zeros(length(Z)), 'o', -P, zeros(length(P)), 'x');

       assertTrue(testCase,isa(sysEnt,'tf'),'sysEnt is not a tf object');
       assertFalse(testCase,isempty(sysEnt),'sysEnt is empty');
end

%% Test - Multidimensional - Transfer Function N°1&2 used in test_frac_lti_lsim
function testFrac2intMIMO(testCase)
sys1 = frac_tf(1, frac_poly_exp(1, 1.5), 'N', 30, 'band', [1e-4, 1e4]);
sys2 = frac_tf(5, frac_poly_exp([5 1], [1.75  0]), 'N', 30, 'band', [1e-5, 1e5]);
sys = [sys1, sys1, sys1 ; sys2, sys2, sys2];
    w = logspace(-5, 5, 100);
    [G, ph] = bode(sys, w);
    G = 20*log10(abs(G));

set(sys,'sim','Oustaloup');
sysOust = frac2int(sys);
    [Go, pho] = bode(sysOust, w);
    Go = 20*log10(abs(Go));

set(sys,'sim','OustaloupTrigeassou');
sysTrig = frac2int(sys);
    [GT, phT] = bode(sysTrig, w);
    GT = 20*log10(abs(GT));

[n,m] = size(sys);    
figure(6)
for ii = 1:n
    for jj = 1:m
        subplot(n, m, (ii-1)*m+jj),
        semilogx(w, squeeze(G(ii,jj,:)), w, squeeze(Go(ii,jj,:)), w, squeeze(GT(ii,jj,:))),  
        legend('Fractional system', 'Oustaloup''s approximation', ...
            'Trigeassou''s approximation')
        title('Gain Diagram')
    end
end


figure(7)
for ii = 1:n
    for jj = 1:m
        subplot(n, m, (ii-1)*m+jj),
        semilogx(w, squeeze(ph(ii,jj,:)), w, squeeze(pho(ii,jj,:)), w, squeeze(phT(ii,jj,:))),  
        legend('Fractional system', 'Oustaloup''s approximation', ...
            'Trigeassou''s approximation')
        title('Phase Diagram')
    end
end

       assertTrue(testCase,isa(sysOust,'tf'),'sysOust4 is not a tf object');
       assertFalse(testCase,isempty(sysOust),'sysOust4 is empty');
       assertTrue(testCase,isa(sysTrig,'tf'),'sysTrig4 is not a tf object');
       assertFalse(testCase,isempty(sysTrig),'sysTrig4 is empty');
end