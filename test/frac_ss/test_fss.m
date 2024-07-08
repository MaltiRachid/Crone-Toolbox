%% Description
%
% Test function on :
%          - function : frac_ss (constructor)
%          - class    : frac_ss
%
% Prototype :
%        sys=frac_ss(A,B,C,D,order,N,band)      
%
% Argument in : 
%	A,B,C,D : matrices of the state-space representation (matrix)
%	order : order (scalar)
%
% Argument out :
%	sys : fractional system (frac_ss object)
%
% Global variable :
%	none
%   Copyright © CRONE - Dancla	07/06/2000

%% Function-based unit test for frac_ss constructor
% Last revision 29/09/2021

function tests = test_fss
    tests = functiontests(localfunctions);
end

%%  Création de la classe vide
function testFssEmpty(testCase)
    sys = frac_ss();
    assertEmpty(testCase,sys,'sys is not empty');
end

%% Création à partir de 5 arguments)
function testFssSISO(testCase)
    sys = frac_ss([3,4;1 2],[2 2;1 1],[1 1],[2 3],0.5);

    assertEqual(testCase,get(sys,'A'),[3,4;1,2],'A is not [3,4;1,2]');
    assertEqual(testCase,get(sys,'B'),[2,2;1,1],'B is not [2,2;1,1]');
    assertEqual(testCase,get(sys,'C'),[1,1],'C is not [1,1]');
    assertEqual(testCase,get(sys,'D'),[2,3],'D is not [2,3]');
    assertEqual(testCase,get(sys,'order'),0.5,'order is not 0.5');
    assertEmpty(testCase,get(sys,'N'),'N is not empty');
    assertEmpty(testCase,get(sys,'band'),'band is not empty');
    assertEqual(testCase,get(sys,'variable'),'s','variable is not s');
    assertEqual(testCase,get(sys,'Ts'),0,'Ts is not 0');
    assertEqual(testCase,get(sys,'sim'),'Grunwald','sim is not Grunwald');
    assertEqual(testCase,get(sys,'version'),'OO-CRONE 2.0','version is not OO-CRONE 2.0');

    %% Création à partir de 10 arguments
    sys2 = frac_ss([1 5;2 4],[3 4;1 7],[2 8],[4 2],0.5,'N',20,'band',[100,1000], 'sim', 'Oustaloup');

    assertEqual(testCase,get(sys2,'A'),[1 5;2 4],'A is not [1 5;2 4]');
    assertEqual(testCase,get(sys2,'B'),[3 4;1 7],'B is not [3 4;1 7]');
    assertEqual(testCase,get(sys2,'C'),[2 8],'C is not [2 8]');
    assertEqual(testCase,get(sys2,'D'),[4 2],'D is not [4 2]');
    assertEqual(testCase,get(sys2,'order'),0.5,'order is not 0.5');
    assertEqual(testCase,get(sys2,'N'),20,'N is not 20');
    assertEqual(testCase,get(sys2,'band'),[100,1000],'band is not [100,1000]');
    assertEqual(testCase,get(sys2,'variable'),'s','variable is not s');
    assertEqual(testCase,get(sys2,'Ts'),0,'Ts is not 0');
    assertEqual(testCase,get(sys2,'sim'),'Oustaloup','sim is not Oustaloup');
    assertEqual(testCase,get(sys2,'version'),'OO-CRONE 2.0','version is not OO-CRONE 2.0');
    %%  Création à partir d'un frac_ss
    sys3=frac_ss(sys);

    assertEqual(testCase,sys3,sys,'sys3 is not sys');
    %% Création d'un frac_ss à partir d'ordre incommensurable
    sys4 = frac_ss([3,4;1 2],[2 2;1 1],[1 1],[2 3],[0.5  1.2]);

    assertEqual(testCase,get(sys4,'A'),[3,4;1 2],'A is not [3,4;1 2]');
    assertEqual(testCase,get(sys4,'B'),[2 2;1 1],'B is not [2 2;1 1]');
    assertEqual(testCase,get(sys4,'C'),[1 1],'C is not [1 1]');
    assertEqual(testCase,get(sys4,'D'),[2 3],'D is not [2 3]');
    assertEqual(testCase,get(sys4,'order'),[0.5;1.2],'order is not [0.5  1.2]');

    sys5 = frac_ss([3 4 5 ; 1 2 4 ; 2 3 4],[2 2;1 1; 3 3],[1 1 1],[2 3],[0.5 1.2 2.4]);

    assertEqual(testCase,get(sys5,'A'),[3 4 5 ; 1 2 4 ; 2 3 4],'A is not [3 4 5 ; 1 2 4 ; 2 3 4]');
    assertEqual(testCase,get(sys5,'B'),[2 2;1 1; 3 3],'B is not [2 2;1 1; 3 3]');
    assertEqual(testCase,get(sys5,'C'),[1 1 1],'C is not [1 1 1]');
    assertEqual(testCase,get(sys5,'D'),[2 3],'D is not [2 3]');
    assertEqual(testCase,get(sys5,'order'),[0.5;1.2;2.4],'order is not [0.5 1.2 2.4]');
end
%%  Création à partir de 1 argument 
% Création du systeme nan en SISO:
%
%sys_nan_SISO=frac_ss(nan, 1, 2, 3, 0.5)
%
%% Création du systeme nan en MIMO:
%
%sys_nan_MIMO=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 nan],0.2,100,[10,1000])
%
%% Conversion d'un ftf en un fss
function testFssTf2ss(testCase)
    fpi1=frac_poly_exp([2 1 -1 ],[3 3.5 5]);
    fpi2=frac_poly_exp([3 2],[1.5 4 ]);
    ftf=frac_tf(fpi2,fpi1, 'N', 30, 'band', [1e-3  1e3], 'variable', [], 'Ts', [], 'sim', 'OustaloupTrigeassou');
    sys = tf2ss(ftf);

    assertTrue(testCase,isa(sys,'frac_ss'),'sys is not a frac_ss');
    assertEqual(testCase,get(sys,'N'),30,'N is not 30');
    assertEqual(testCase,get(sys,'band'),[1e-3  1e3],'band is not [1e-3  1e3]');
    assertEqual(testCase,get(sys,'variable'),'s','variable is not s');
    assertEqual(testCase,get(sys,'Ts'),0,'Ts is not 0');
    assertEqual(testCase,get(sys,'sim'),'OustaloupTrigeassou','sim is not OustaloupTrigeassou');
    assertEqual(testCase,get(sys,'version'),'OO-CRONE 2.0','version is not OO-CRONE 2.0');
    
    % Comparaison avec le cas entier ==> OK tout est validé
    [c, fti] = commensurate(ftf);
    ssfti = ss(fti);
    assertEqual(testCase,get(ssfti,'A'),get(sys,'A'),'ssfti A is not sys A');
    assertEqual(testCase,get(ssfti,'B'),get(sys,'B'),'ssfti B is not sys B');
    assertEqual(testCase,get(ssfti,'C'),get(sys,'C'),'ssfti C is not sys C');
    assertEqual(testCase,get(ssfti,'D'),get(sys,'D'),'ssfti D is not sys D');
    assertEqual(testCase,c,get(sys,'order'),'c is not order');
    % sys33 = ss2tf(sys3)
    ei_sys=eig(get(sys,'A'));
    [~,eigen_value,eigen_order] = poles(ftf);
    assertEqual(testCase,ei_sys,eigen_value{1},'AbsTol',0.01,'ei_sys is not eigen_value{1}');
    assertEqual(testCase,get(sys,'order'),eigen_order,'AbsTol',0.01,'sys order is not eigen_order');
    
end