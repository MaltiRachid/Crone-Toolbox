%% Function-based unit test for impulse method
% Last revision 23/09/2021

function tests = test_frac_lti_impulse
    tests = functiontests(localfunctions);
end

%% Test Numéro 1 - Intégrateur - Simulation d'Oustaloup ; 
% comparée à la simulation de Grünwald
function testImpulseIntegrator(testCase)
    sys = frac_tf(1, frac_poly_exp(1, 1.5), 'N', 30, 'band', [1e-5, 1e5]);
    Te = 0.005;
    u = ones(1,5000);
    t = (0:length(u)-1)*Te;

    set(sys,'sim','Oustaloup');
    yOust = impulse(sys, t);

    set(sys,'sim','OustaloupTrigeassou');
    yTrig = impulse(sys, t);
    set(sys,'sim','Grunwald');
    yGrun = impulse(sys, t);
    % set(sys,'sim','grunimp');
    % yGrunImp = impulse(sys, t);
    if isempty(yTrig)
        figure(1), plot(t,yOust,t,yGrun)%,t,yGrunImp)
        legend('Oustaloup''s approx.', ...
            'Grunwald''s approx.')%,'Improved Grunwald''s approx.')
    else
        figure(1), plot(t,yOust,t,yTrig,t,yGrun)%,t,yGrunImp)
        legend('Oustaloup''s approx.', 'Trigeassou''s approx.', ...
            'Grunwald''s approx.')%,'Improved Grunwald''s approx.')
    end
    
    assertFalse(testCase,isempty(yOust),'yOust is empty');
    assertFalse(testCase,isempty(yGrun),'yGrun is empty');
    assertFalse(testCase,isempty(yTrig),'yTrig is empty');
end
%% Test Numéro 2 - Monodimensionnel ; 
% comparée à la simulation de Grünwald
function testImpulseSISO(testCase)
    sys = frac_tf(5, frac_poly_exp([5 1], [1.75  0]), 'N', 30, 'band', [1e-5, 1e5]);
    % D?finition d'un signal temporel et d'une p?riode d'?chantillonnage
    Te = 0.01;
    u = ones(1,5000);
    t = (0:length(u)-1)*Te;
    set(sys,'sim','Oustaloup'); yOust2 = impulse(sys,t);
    set(sys,'sim','OustaloupTrigeassou'); yTrig2 = impulse(sys, t);
    set(sys,'sim','Grunwald'); yGrun2 = impulse(sys, t);
    % set(sys,'sim','grunimp'); yGrunImp2 = impulse(sys, t);
    figure(2), plot(t,yOust2,t,yTrig2, '-.',t,yGrun2);%,t,yGrunImp2)
        legend('Oustaloup''s approx.', 'Trigeassou''s approx.', ...
            'Grunwald''s approx.');%,'Improved Grunwald''s approx.')
        grid;
        
    assertFalse(testCase,isempty(yOust2),'yOust2 is empty');
    assertFalse(testCase,isempty(yGrun2),'yGrun2 is empty');
    assertFalse(testCase,isempty(yTrig2),'yTrig2 is empty');
end
%% Test Numéro 3 - Monodimensionnel - Ordre négatif au numérateur
function testImpulseNegNum1(testCase)
    % sys2 = frac_tf(frac_poly_exp(1.9538e-004,-0.2887),frac_poly_exp([16.0057 1],[0.5902 0]), 24, [1e-6  1e2]);
    sys2 = frac_tf(frac_poly_exp(1,-0.5),1, 'N', 24, 'band', [1e-6  1e2]);

    set(sys2,'sim','Oustaloup'); [yOust3,tO] = impulse(sys2);
    set(sys2,'sim','OustaloupTrigeassou'); [yTrig3,tT] = impulse(sys2);
    set(sys2,'sim','Grunwald'); [yGrun3,TG] = impulse(sys2);
    % set(sys2,'sim','grunimp'); [yGrunImp3,TGi] = impulse(sys2);

    figure(3), plot(tO, yOust3, tT, yTrig3, '-.', TG, yGrun3)%, ...
    %     TGi, yGrunImp3, '-.'),
            legend('Oustaloup''s approx.', 'Trigeassou''s approx.', ...
            'Grunwald''s approx.');%,'Improved Grunwald''s approx.')
        
    assertFalse(testCase,isempty(yOust3),'yOust3 is empty');
    assertFalse(testCase,isempty(yGrun3),'yGrun3 is empty');
    assertFalse(testCase,isempty(yTrig3),'yTrig3 is empty');
    assertFalse(testCase,isempty(tO),'tO is empty');
    assertFalse(testCase,isempty(TG),'TG is empty');
    assertFalse(testCase,isempty(tT),'tT is empty');
end
%% Test Numéro 4 - Monodimensionnel - Ordre négatif au numérateur
function testImpulseNegNum2(testCase)
    sys2 = frac_tf(frac_poly_exp(1,-0.5),1, 'N', 24, 'band', [1e-6  1e2]);

    set(sys2,'sim','Oustaloup'); [yOust3,tO] = impulse(sys2);
    set(sys2,'sim','OustaloupTrigeassou'); [yTrig3,tT] = impulse(sys2);
    set(sys2,'sim','Grunwald'); [yGrun3,TG] = impulse(sys2);
    % set(sys2,'sim','grunimp'); [yGrunImp3,TGi] = impulse(sys2);

    figure(4), plot(tO, yOust3, tT, yTrig3, '-.', TG, yGrun3)%, ...
    %     TGi, yGrunImp3, '-.'),
            legend('Oustaloup''s approx.', 'Trigeassou''s approx.', ...
            'Grunwald''s approx.')%,'Improved Grunwald''s approx.')
        
    assertFalse(testCase,isempty(yOust3),'yOust3 is empty');
    assertFalse(testCase,isempty(yGrun3),'yGrun3 is empty');
    assertFalse(testCase,isempty(yTrig3),'yTrig3 is empty');
    assertFalse(testCase,isempty(tO),'tO is empty');
    assertFalse(testCase,isempty(TG),'TG is empty');
    assertFalse(testCase,isempty(tT),'tT is empty');
end

%%%%%%%%%%%%%%%
% v2.9  Benine  11/06/2014     Correction : Ajout de u=ones(1,5000) afin de
%                              definir le vecteur de temps (t). Traduction
%                              de legend