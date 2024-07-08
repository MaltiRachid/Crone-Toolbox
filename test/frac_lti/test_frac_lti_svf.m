%% Function-based unit test for frac_lti svf method
% Last revision 24/09/2021

function tests = test_frac_lti_svf
    tests = functiontests(localfunctions);
end


function  testSvf(testCase)

%% Identification d'un autre système
% Data generation 
u = [ones(100, 1); zeros(200,1); ones(500,1); zeros(800,1)]; 
t = (0:length(u)-1)'*0.01;
sys3 = frac_tf(frac_poly_exp([1.5  1], [0.5  0]), frac_poly_exp([1 2 1],[1.5  0.5  0]), 'N', 24, 'band', [1e-5  1e5]);
y = lsim(sys3, u, t); y_noise_free = y; y = y + 0.05*randn(size(y));
ddata = iddata(y, u, t(2)-t(1));

figure(1), plot(ddata), 

%% Avec la m�thode d'oustaloup - sans pr�ciser la fr�q. de coupure du svf
% On reprend les mm ordres de d�rivation et on recalcule les coef
sys2 = lssvf(sys3, ddata);                    % On peut refaire une estimation ici
figure(2), plot(t, y, t, lsim(sys2, u, t))
   legend('True Output', 'OE identified output')
   title('Résultat d''une identification avec svf -- Simulation d''Outaloup')
   
%% Avec la m�thode d'oustaloup - en pr�cisant la fr�q. de coupure du svf
% La �a ne marche pas, car la fr�quence de coupure du svf prise par d�faut 
% est tr�s basse
sys2 = lssvf(sys3, ddata, [1e-1  6]);                    % On peut refaire une estimation ici
figure(3), plot(t, y, t, lsim(sys2, u, t))
   legend('True Output', 'OE identified output')
   title('Résultat d''une identification avec svf -- Simulation d''Outaloup')
   
%% Avec la m�thode de Grunwald - sans pr�ciser la fr�q. de coupure du svf
set(sys3,'N',[]); set(sys3,'band',[]); set(sys3,'sim','Grunwald');
% lssvf() ne fonctionne pas lorsque l'on force 'N' et 'band' à []

% On reprend les mm ordres de d�rivation et on recalcule les coef
sys2 = lssvf(sys3, ddata);        % On peut refaire une estimation ici
figure(4), plot(t, y, t, lsim(sys2, u, t))
   legend('True Output', 'OE identified output')
   title('Résultat d''une identification avec svf -- Simulation d''Outaloup')
   
%% Avec la m�thode de Grunwald - en pr�cisant la fr�q. de coupure du filtre
% La �a ne marche pas, car la fr�quence de coupure du svf prise par d�faut 
% est tr�s basse
sys2 = lssvf(sys3, ddata, [1e-1  6]);                    % On peut refaire une estimation ici
figure(5), plot(t, y, t, lsim(sys2, u, t))
   legend('True Output', 'OE identified output')
   title('Résultat d''une identification avec svf -- Simulation d''Outaloup')

%% Bug
% On prend des ordres diff�rents et on recalcule les coef
sys_init = frac_tf(frac_poly_exp([1.2  1], [0.5  0]), frac_poly_exp([1 2 1],[1.2  0.5  0]), 'N', 24, 'band', [1e-5  1e5]);
sys2 = lssvf(sys_init, ddata, [1e-1  6]); % On peut refaire une estimation ici
figure(6), plot(t, y, t, lsim(sys2, u, t), t, lsim(sys_init, u, t))
   legend('True Output', 'OE identified output', 'Initial model')
   title('Résultat d''une identification avec svf -- Simulation d''Outaloup')

    

%% SVF
sys2 = lssvf(sys3, ddata, [1e1  6]);                    % On peut refaire une estimation ici
figure(7), plot(t, y_noise_free, t, lsim(sys2, u, t))
   legend('True Output', 'SVF identified output')
   title('Comparaison entre svf')

%% SVF ==> Fréquence de coupure du filtre w_f est inadaptée
% set(sys3,'N',[]); set(sys3,'band',[]); % à commenter ou pas selon le type de simulation souhaité

sys5 = lssvf(sys3, ddata, [1e0  6]);                    % On peut refaire une estimation ici
sys6 = ivsvf(sys3, ddata, [], [1e1  6]);                    % On peut refaire une estimation ici
figure(8), plot(t, y_noise_free, t, lsim(sys5, u, t), t, lsim(sys6, u, t))
   legend('True Noise-free Output', 'svf output', 'ivsvf output')
   title('Comparaison entre svf et ivsvf -- Simulation d''Outaloup')

%% SVF ==> Fréquence de coupure du filtre w_f est très inadaptée ==> svf
% système instable ; ivsvf arrive à stabiliser
sys7 = lssvf(sys3, ddata);                    % On peut refaire une estimation ici
sys8 = ivsvf(sys3, ddata, []);                    % On peut refaire une estimation ici
figure(9), plot(t, y_noise_free, t, lsim(sys7, u, t), t, lsim(sys8, u, t))
   legend('True Noise-free Output', 'svf output', 'ivsvf output')
   title('Comparaison entre svf et ivsvf -- Simulation d''Outaloup')
figure(10), plot(t, y_noise_free, t, lsim(sys8, u, t))
   legend('True Noise-free Output', 'ivsvf output')
   title('ivsvf arrive à stabiliser un résultat instable en provenance de svf')
   

   
%% Test_frac_lti_svf_Bis

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
    figure(11), subplot(211), semilogx(w, GG, w, GGr),
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
figure(12), subplot(211), plot(t, u)
           subplot(212), plot(t,y)

% Function calls
sys2 = lssvf(sys, ddata, [1e5  4]); % Call to svf with three arguments
sys2_1 = lssvf(sys, ddata);    % Call to svf function with two arguments
sys3   = arx(sys, ddata);

display('Comparison between simulated system and the identified ones')
sys, sys2, sys3

figure(13), plot(t, y, 'b', t, lsim(sys2, u, t), 'r',t, lsim(sys3, u, t), 'k')
    legend('Simulated system', 'identified using SVF','identified using arx')  
 
end

