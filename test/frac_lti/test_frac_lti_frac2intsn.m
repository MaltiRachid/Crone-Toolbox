% @frac_lti\frac2intsn is now a private function
% 08/09/2021
%
% %% Test number 1
% wb = 1e+2;
% wh = 1e+7;
% sys = frac_tf(frac_poly_exp(1, 0.8), 1, 30, [wb wh]);
% % Analyse fréquentielle du système choisi
%     sysEnt = frac2intsn(sys); Z = zero(sysEnt); P = pole(sysEnt);
%     w = logspace(log10(wb)-1, log10(wh)+1, 100);
%     [G, ph] = bode(sys, w);
%     GG = zeros(length(w), 1); GG(:,1) = 20*log10(G(1, 1, :));
%     phG= zeros(length(w), 1); phG(:,1) = ph(1, 1, :);
%     [Gr, phr] = bode(sysEnt, w);
%     GGr = zeros(length(w), 1); GGr(:,1) = 20*log10(Gr(1, 1, :));
%     phGr= zeros(length(w), 1); phGr(:,1) = phr(1, 1, :);
%     figure(1), subplot(211), semilogx(w, GG, w, GGr, -Z, zeros(length(Z)), 'o', -P, zeros(length(P)), 'x'),  
%                 legend('Fractional system', 'Rational approximation')
%         subplot(212), semilogx(w, phG, w, phGr, -Z, zeros(length(Z)), 'o', -P, zeros(length(P)), 'x');
% 
% %% Test number 2
% sys = frac_tf(frac_poly_exp(1, -0.8), 1, 30, [1e2 1e6]);
% % Analyse fréquentielle du système choisi
%     sysEnt = frac2intsn(sys); Z = zero(sysEnt); P = pole(sysEnt);
%     w = logspace(0, 8, 100);
%     [G, ph] = bode(sys, w);
%     GG = zeros(length(w), 1); GG(:,1) = 20*log10(G(1, 1, :));
%     phG= zeros(length(w), 1); phG(:,1) = ph(1, 1, :);
%     [Gr, phr] = bode(sysEnt, w);
%     GGr = zeros(length(w), 1); GGr(:,1) = 20*log10(Gr(1, 1, :));
%     phGr= zeros(length(w), 1); phGr(:,1) = phr(1, 1, :);
%     figure(2), subplot(211), semilogx(w, GG, w, GGr, -Z, zeros(length(Z)), 'o', -P, zeros(length(P)), 'x'),  
%                 legend('Fractional system', 'Rational approximation')
%         subplot(212), semilogx(w, phG, w, phGr, -Z, zeros(length(Z)), 'o', -P, zeros(length(P)), 'x');
