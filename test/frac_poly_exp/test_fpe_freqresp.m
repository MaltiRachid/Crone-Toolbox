%% Description
%
% Test function on :
%          - function : freqresp
%          - class    : frac_poly_imp
%
% Prototype :
%        res=mtimes2(fr,w)            
%
% Argument in : 
%   fp1 : Frac_poly_imp object
%   w : frequency range (cell or vector)
% 
% Argument out :
% 	H : frequency response (complex gain)
% 
% computes the frequency response of the fractionnal transfer function fr.
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpe_freqresp
% Last revision 14/09/2021

function tests = test_fpe_freqresp
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal - Cas d'une cst
function testFreqrespCst(testCase)
pol1=frac_poly_imp(1,1);
w = logspace(-5, 5, 200);

G = freqresp(pol1,w);
H = zeros(1,length(G)); H(1,:) = G(1,1,:);
figure(1), plot(imag(H), real(H))
figure(2), subplot(211), semilogx(w, 20*log10(abs(H)))
           subplot(212), semilogx(w, angle(H))

end

%% The classic case : unidimensionnal - ordre extérieur 1 et 1.5
function testFreqrespSISO(testCase)
pol1=frac_poly_imp([1,2,4],[3,2,0],1);
pol2=frac_poly_imp([1,2,4],[3,2,0],1.5);
w = logspace(-5, 5, 200);

G1 = freqresp(pol1,w);
H1 = zeros(1,length(G1)); H1(1,:) = G1(1,1,:);
G2 = freqresp(pol2,w);
H2 = zeros(1,length(G2)); H2(1,:) = G2(1,1,:);
figure(1), plot(imag(H1), real(H1), imag(H2), real(H2))
figure(2), subplot(211), semilogx(w, 20*log10(abs(H1)), w, 20*log10(abs(H2))), grid
           subplot(212), semilogx(w, 180*angle(H1)/pi, w, 180*angle(H2)/pi), grid
end
%% The classic case : unidimensionnal - 
function testFreqrespSISO2(testCase)
pol1=frac_poly_imp([1,2,4],[3,2,0],1);
w = logspace(-5, 5, 200);

G = freqresp(pol1,w);
H = zeros(1,length(G)); H(1,:) = G(1,1,:);
figure(1), plot(imag(H), real(H))
figure(2), subplot(211), semilogx(w, 20*log10(abs(H)))
           subplot(212), semilogx(w, angle(H))

end
           
           
%% The classic case : multidimensionnal
function testFreqrespMIMO(testCase)
pol1=frac_poly_imp([1,2,4],[3,2,0],1);
pol2=frac_poly_imp([1,2,4],[3,2,0],1.5);
pol1bis=frac_poly_imp([pol1; pol2]);
pol2bis=frac_poly_imp([pol1; pol2]);
w = logspace(-5, 5, 200);

G1 = freqresp(pol1bis,w);
H11 = zeros(1,length(G1)); H11(1,:) = G1(1,1,:);
H12 = zeros(1,length(G1)); H12(1,:) = G1(2,1,:);

G2 = freqresp(pol2bis,w);
H21 = zeros(1,length(G2)); H21(1,:) = G2(1,1,:);
H22 = zeros(1,length(G2)); H22(1,:) = G2(2,1,:);

figure(1), subplot(121),plot(imag(H11), real(H11))
           subplot(122),plot(imag(H12), real(H12))
figure(2), subplot(221), semilogx(w, 20*log10(abs(H21))), grid
           subplot(223), semilogx(w, 180*angle(H21)/pi), grid
           subplot(222), semilogx(w, 20*log10(abs(H22))), grid
           subplot(224), semilogx(w, 180*angle(H22)/pi), grid
end
%% Special Case : NaN polynomial
function testFreqrespNaN(testCase)
    pol_nan=frac_poly_imp(nan);
    w = logspace(-5, 5, 200);
% If one of the argument is a NaN polynomial the result is the NaN
% polynomial 
    G2 = freqresp(pol_nan,w);
end
%% Special Case : Empty polynomial
function testFreqrespEmpty(testCase)
    pol_vide=frac_poly_imp;
    w = logspace(-5, 5, 200);
% The multiplication succeed only if both arguments are emtys
    G2 = freqresp(pol_vide,w);
end
