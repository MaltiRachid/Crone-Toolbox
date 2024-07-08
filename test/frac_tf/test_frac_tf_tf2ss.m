%% Description
%
% [...]=tf2ss(frac_tf_sys) calculates the state-space representation of the first level : 
%
%        n
%       D (x) = Ax + Bu
%           y = Cx + Du
%
% [A,B,C,D,order]=tf2ss(...) returns the A,B,C,D matrices and the order scalar.
%
% [frac_ss]=tf2ss(...) returns the non integer state representation system.
%
% Argument in : 
%	frac_tf_sys : non integer transfer function system (frac_tf object)
%
% Argument out :
%	A,B,C,D : matrices of the state representation (matrix)
%	order : order of the fisrt level (scalar)
%	or
%	sys : non integer system (frac_ss object)
%
% Global variable :
%	none
%
%   Copyright © CRONE - Dancla	06/06/2000
%
% [A,B,C,D,order]=tf2ss(input_coef,input_order,output_coef,output_order)
% [frac_ss]=tf2ss(frac_tf_sys)

%% Function-based unit test for frac_tf tf2ss method
% Last revision 28/09/2021

function tests = test_frac_tf_tf2ss
    tests = functiontests(localfunctions);
end

%% The classic case :  
% frac_tf créé sans préciser band ,N , variable et Ts
%% dans system SISO:
function testTf2ssSISO1(testCase)
    %creation de premiere frac_tf
    fpe1 = frac_poly_exp([1 1],[0.3 0.7]);
    fpe2 = frac_poly_exp([1 1 1],[0.3 0.7 0.5]);
    ftf1=frac_tf(fpe1,fpe2);
    % convertir ver frac_ss et voir les parametres passés
    fss1=tf2ss(ftf1);
    A=[0,-1,0,-1,0,0,0;
        1,0,0,0,0,0,0;
        0,1,0,0,0,0,0;
        0,0,1,0,0,0,0;
        0,0,0,1,0,0,0;
        0,0,0,0,1,0,0;
        0,0,0,0,0,1,0];
    B=[1;0;0;0;0;0;0]; C=[0,-1,0,0,0,0,0]; D=1; order=0.1;
    fss_exp=frac_ss(A,B,C,D,order);
    
    assertEqual(testCase,fss1,fss_exp,'fss1 is not fss_exp');
    assertEmpty(testCase,get(fss1,'N'),'N is not empty');
    assertEmpty(testCase,get(fss1,'band'),'band is not empty');
    assertEqual(testCase,get(fss1,'variable'),'s','variable is not s');
end
%% dans system MIMO:
function testTf2ssMIMO1(testCase)
    %creation de premiere frac_tf
    fpe1 = frac_poly_exp(1,0);
    fpe2 = frac_poly_exp([1 1],[1 0.5]);
    ftf1=frac_tf(fpe1,fpe2);
    %creation de deuxième frac_tf
    fpe3 = frac_poly_exp(1,0);
    fpe4 = frac_poly_exp([2 3],[0.3 0.5]);
    ftf2=frac_tf(fpe3,fpe4);
    %création de systeme frac_tf MIMO 
    ftf_MIMO1=[ftf1 ftf2];
    % convertir ver frac_ss et voir les parametres passés
    fss_MIMO1=tf2ss(ftf_MIMO1);
    
    A=[0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0;
        1,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
        0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;
        0,0,1,0,0,0,0,0,0,0,0,0,0,0,0;
        0,0,0,1,0,0,0,0,0,0,0,0,0,0,0;
        0,0,0,0,1,0,0,0,0,0,0,0,0,0,0;
        0,0,0,0,0,1,0,0,0,0,0,0,0,0,0;
        0,0,0,0,0,0,1,0,0,0,0,0,0,0,0;
        0,0,0,0,0,0,0,1,0,0,0,0,0,0,0;
        0,0,0,0,0,0,0,0,1,0,0,0,0,0,0;
        0,0,0,0,0,0,0,0,0,0,0,-0.66667,0,0,0;
        0,0,0,0,0,0,0,0,0,0,1,0,0,0,0;
        0,0,0,0,0,0,0,0,0,0,0,1,0,0,0;
        0,0,0,0,0,0,0,0,0,0,0,0,1,0,0;
        0,0,0,0,0,0,0,0,0,0,0,0,0,1,0;];
    B=[1,0;0,0;0,0;0,0;0,0;0,0;0,0;0,0;0,0;0,0;0,0.5;0,0;0,0;0,0;0,0];
    C=[0,0,0,0,0,0,0,0,0,1,0,0,0,0,0.66667]; D=[0,0]; order=0.1;
    fss_exp=frac_ss(A,B,C,D,order);
    
    assertEqual(testCase,get(fss_MIMO1,'A'),get(fss_exp,'A'),'AbsTol',1e-3,'fss_MIMO1 A is not fss_exp A');
    assertEqual(testCase,get(fss_MIMO1,'B'),get(fss_exp,'B'),'AbsTol',1e-3,'fss_MIMO1 B is not fss_exp B');
    assertEqual(testCase,get(fss_MIMO1,'C'),get(fss_exp,'C'),'AbsTol',1e-3,'fss_MIMO1 C is not fss_exp C');
    assertEqual(testCase,get(fss_MIMO1,'D'),get(fss_exp,'D'),'AbsTol',1e-3,'fss_MIMO1 D is not fss_exp D');
    assertEmpty(testCase,get(fss_MIMO1,'N'),'N is not empty');
    assertEmpty(testCase,get(fss_MIMO1,'band'),'band is not empty');
    assertEqual(testCase,get(fss_MIMO1,'variable'),'s','variable is not s');
end

%% frac_tf créé avec les valeurs de  band , N , variable et Ts
function testTf2ssSISO2(testCase)
	%dans systeme SISO:
    fpe1 = frac_poly_exp([1 1],[0.3 0.7]);
    fpe2 = frac_poly_exp([1 1 1],[0.3 0.7 0.5]);
    ftf3=frac_tf(fpe1,fpe2, 'N', 100, 'band', [0.01,1000], 'variable', 'z', 'Ts', 0.1);
    % convertir vers frac_ss et voir les parametres passés
    fss2=tf2ss(ftf3);
    A=[0,-1,0,-1,0,0,0;
        1,0,0,0,0,0,0;
        0,1,0,0,0,0,0;
        0,0,1,0,0,0,0;
        0,0,0,1,0,0,0;
        0,0,0,0,1,0,0;
        0,0,0,0,0,1,0];
    B=[1;0;0;0;0;0;0]; C=[0,-1,0,0,0,0,0]; D=1; order=0.1;
    fss_exp=frac_ss(A,B,C,D,order,'N',100,'band',[0.01,1000],'variable','z','Ts',0.1);
    
    assertEqual(testCase,fss2,fss_exp,'fss2 is not fss_exp');
    assertEqual(testCase,get(fss2,'N'),get(fss_exp,'N'),'N is not empty');
    assertEqual(testCase,get(fss2,'band'),get(fss_exp,'band'),'band is not empty');
    assertEqual(testCase,get(fss2,'variable'),get(fss_exp,'variable'),'variable is not s');
end
%% dans systeme MIMO: 
function testTf2ssMIMO2(testCase)
    fpe1 = frac_poly_exp([1 1],[0.3 0.7]);
    fpe2 = frac_poly_exp([1 1 1],[0.3 0.7 0.5]);
    fpe3 = frac_poly_exp(1,0);
    fpe4 = frac_poly_exp([2 3],[0.3 0.5]);
    ftf1=frac_tf(fpe1,fpe2);
    ftf3=frac_tf(fpe1,fpe2, 'N', 100, 'band', [0.01,1000], 'variable', 'z', 'Ts', 0.1);  
    ftf2=frac_tf(fpe3,fpe4);
    ftf4=frac_tf(fpe3,fpe4, 'N', 50, 'band', [0.1,5000], 'variable', 'p', 'Ts', 0.1);
    ftf_MIMO2=[ftf2,ftf4;ftf3 ftf1];
    % convertir vers frac_ss et voir les parametres passés
    fss_MIMO2=tf2ss(ftf_MIMO2);
    
    A=[0,0,0,0,0,0,0,0,0,0,0,0;
        1,0,0,0,0,0,0,0,0,0,0,0;
        0,1,0,0,0,0,0,0,0,0,0,0;
        0,0,1,0,-0.6667,0,0,0,0,0,0,0;
        0,0,0,1,0,0,0,0,0,0,0,0;
        0,0,0,0,0,0,0,0,0,0,0,0;
        0,0,0,0,0,1,0,0,0,0,0,0;
        0,0,0,0,0,0,1,0,0,0,0,0;
        0,0,0,0,0,0,0,1,0,0,0,-1;
        0,0,0,0,0,0,0,0,1,0,0,0;
        0,0,0,0,0,0,0,0,0,1,0,-1;
        0,0,0,0,0,0,0,0,0,0,1,0;];
    B=[0.333,0.333;0,0;0,0;0,0;0,0;0,0;0,0;0,0;0,0;0,0;-0.5,-0.5;0,0]; 
    C=[0,0,0,0,1,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,2];
    D=[0,0;1,1]; order=0.1;
    fss_exp=frac_ss(A,B,C,D,order);
    
    assertEqual(testCase,get(fss_MIMO2,'A'),get(fss_exp,'A'),'AbsTol',1e-3,'fss_MIMO2 A is not fss_exp A');
    assertEqual(testCase,get(fss_MIMO2,'B'),get(fss_exp,'B'),'AbsTol',1e-3,'fss_MIMO2 B is not fss_exp B');
    assertEqual(testCase,get(fss_MIMO2,'C'),get(fss_exp,'C'),'AbsTol',1e-3,'fss_MIMO2 C is not fss_exp C');
    assertEqual(testCase,get(fss_MIMO2,'D'),get(fss_exp,'D'),'AbsTol',1e-3,'fss_MIMO2 D is not fss_exp D');
%     assertEqual(testCase,get(fss_MIMO2,'N'),get(fss_exp,'N'),'N is not empty');
%     assertEqual(testCase,get(fss_MIMO2,'band'),get(fss_exp,'band'),'band is not empty');
%     assertEqual(testCase,get(fss_MIMO2,'variable'),get(fss_exp,'variable'),'variable is not s');
end
%% The special case de systeme NaN et systeme vide
function testTf2ssEmpty(testCase)
    %% frac_ss vide
    ftf5=frac_tf;
    % convertir vers frac_ss et voir les parametres passés
    fss3=tf2ss(ftf5);
    
    assertEmpty(testCase,fss3,'fss3 is not empty');
    assertEmpty(testCase,get(fss3,'N'),'N is not empty');
    assertEmpty(testCase,get(fss3,'band'),'band is not empty');
    assertEqual(testCase,get(fss3,'variable'),'s','variable is not s');
end
%%  frac_ss nan 
%% dans systeme SISO:
function testTf2ssNaN(testCase)
    ftf6=frac_tf(nan);
    % convertir vers frac_ss et voir les parametres passés
    fss4=tf2ss(ftf6);
    
%     assertTrue(testCase,isnan(fss4),'fss4 is not nan');
    assertEmpty(testCase,get(fss4,'N'),'N is not empty');
    assertEmpty(testCase,get(fss4,'band'),'band is not empty');
    assertEqual(testCase,get(fss4,'variable'),'s','variable is not s');
%% dans système MIMO
    ftf_MIMO3 = [ftf6 ftf6;ftf6 ftf6];
    % convertir vers frac_ss et voir les parametres passés
    fss5=tf2ss(ftf_MIMO3);
    
%     assertTrue(testCase,isnan(fss5),'fss5 is not nan');
    assertEmpty(testCase,get(fss5,'N'),'N is not empty');
    assertEmpty(testCase,get(fss5,'band'),'band is not empty');
    assertEqual(testCase,get(fss5,'variable'),'s','variable is not s');
end
