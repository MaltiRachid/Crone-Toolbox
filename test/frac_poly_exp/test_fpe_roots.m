%% Function-based unit test for frac_fpe_roots
% Last revision 21/09/2021

function tests = test_fpe_roots
    tests = functiontests(localfunctions);
end

%% Test Numéro 1 - Intégrateur - Simulation d'Oustaloup ; 
% comparée à la simulation de Grünwald
function testRootsSISO(testCase)
    sys = frac_poly_exp([1 1], [1.5  0]);
    [Poles,Poles_sn,eigen_order] = roots(sys);
    p_exp=[-0.5-0.8660i -0.5+0.8660i];
    psn_exp=-1;
    eiord_exp=1.5;
    
    assertEqual(testCase,Poles,{p_exp},'AbsTol',0.1,'Poles is not p_exp');
    assertEqual(testCase,Poles_sn,{psn_exp},'AbsTol',0.1,'Poles_sn is not psn_exp');
    assertEqual(testCase,eigen_order,eiord_exp,'eigen_order is not eiord_exp');    
end

%% Il reste aussi à tester le cas multidimensionnel !
function testRootsMIMO(testCase)
    sys = frac_poly_exp([1 1], [1.5  0]);
    [Poles2,Poles_sn2,eigen_order2] = roots([sys, sys]);
    p_exp={{[-0.5-0.8660i -0.5+0.8660i]} {[-0.5-0.8660i -0.5+0.8660i]}};
    psn_exp={{-1} {-1}};
    eiord_exp=1.5;
    
    assertEqual(testCase,Poles2,p_exp,'AbsTol',0.1,'Poles is not p_exp');
    assertEqual(testCase,Poles_sn2,psn_exp,'AbsTol',0.1,'Poles_sn is not psn_exp');
    assertEqual(testCase,eigen_order2,eiord_exp,'eigen_order is not eiord_exp');   
end

%% Test d'une fpe constante
function testRootsCst(testCase)
    sys = frac_poly_exp(1);
    [Poles,Poles_sn,eigen_order] = roots(sys);
    
    assertEmpty(testCase,Poles{1,1},'Poles is not empty');
    assertEmpty(testCase,Poles_sn{1,1},'Poles_sn is not empty');
    assertEqual(testCase,eigen_order,1,'eigen_order is not 1');
end

%% Test d'une fpe vide
function testRootsEmpty(testCase)
    sys=frac_poly_exp;
    [Poles,Poles_sn,eigen_order] = roots(sys);
    
    assertEmpty(testCase,Poles,'Poles is not empty');
    assertEmpty(testCase,Poles_sn,'Poles_sn is not empty');
    assertEmpty(testCase,eigen_order,'eigen_order is not empty');
end