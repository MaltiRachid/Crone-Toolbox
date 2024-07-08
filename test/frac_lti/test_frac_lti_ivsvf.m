%% Function-based unit test for ivsvf method
% Last revision 23/09/2021

function tests = test_frac_lti_ivsvf
    tests = functiontests(localfunctions);
end

% The objective of this function is to test both @frac_lti/svf and
% @frac_lti/arx functions of the CRONE Toolbox
%
% Copyright � CRONE  2008
% Function created on 2008-05-29 by S. VICTOR

function testIvsvf(testCase)
% Data generation
sys = frac_tf(frac_poly_exp([1/50  1], [0.5  0]), ...
    frac_poly_exp([1/100 -0.7/10 1], [1  0.5  0]), 'N', 24, 'band', [1e-4  1e5]);
% Analyse fréquentielle du système choisi
sysEnt = frac2int(sys);
w = logspace(-4, 4, 100);
Fe = 1e4;  we = 2*pi*Fe;  w_shanon = we/2;
[G, ph] = bode(sys, w);
GG = zeros(length(w), 1); GG(:,1) = 20*log10(G(1, 1, :));
phG= zeros(length(w), 1); phG(:,1) = ph(1, 1, :);
[Gr, phr] = bode(sysEnt, w);
GGr = zeros(length(w), 1); GGr(:,1) = 20*log10(Gr(1, 1, :));
phGr= zeros(length(w), 1); phGr(:,1) = phr(1, 1, :);
figure(1), subplot(211), semilogx(w, GG, w, GGr),
hold on
ax = axis();  semilogx([w_shanon, w_shanon], [ax(3) ax(4)], 'r');
hold off
legend('Fractional system', 'Rational approximation', 'Shanon frequency \omega_e/2')
subplot(212), semilogx(w, phG, w, phGr);
hold on
ax = axis();  semilogx([w_shanon, w_shanon], [ax(3) ax(4)], 'r');
hold off

% Analyse temporelle du système choisi
u_tmp = prbs(7, 250, [0 1]);   % prbs function of the ContSid toolbox
% u = u_tmp(2000:10000);         % On ne garde que 8000 points
u = u_tmp;
t = (0:length(u)-1) / Fe  ;    % Période d'échantillonnage Te = 1e-4
y = lsim(sys, u, t);
ddata = iddata(y, u, t(2)-t(1));
figure(2), subplot(211), plot(t, u)
subplot(212), plot(t,y)

% Function calls
idsys1=ivsvf(sys, ddata, [5 1e-3], [1e-3 5]) ;% Call to svf with three arguments
idsys2=ivsvf(sys, ddata, [], [1e-3 5]) ;  % Call to svf function with two arguments
idsys3=ivsvf(sys, ddata);

disp('Comparison between simulated system and the identified ones');
idsys1, idsys2, idsys3

figure(3), plot(t, y, 'b', t, lsim(idsys1, u, t), 'r',t, lsim(idsys2, u, t), 'k')
legend('Simulated system', 'identified using SVF','identified using arx')

assertFalse(testCase,isempty(idsys1));
assertFalse(testCase,isempty(idsys2));
assertFalse(testCase,isempty(idsys3));
assertTrue(testCase,isa(idsys1,'frac_idtf'),'idsys1 is not a frac_idtf');
assertTrue(testCase,isa(idsys2,'frac_idtf'),'idsys2 is not a frac_idtf');
assertTrue(testCase,isa(idsys3,'frac_idtf'),'idsys3 is not a frac_idtf');
end