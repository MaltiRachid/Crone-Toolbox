%% Description
%
% Test function on :
%          - function : subsref
%          - class    : frac_ss
%
% Prototype :
%        ref=subsref(fss,index)
%
% Argument in : 
%     fss   : Frac_ss object
%     index : a structure containing two attribute : type and subs
%
% Argument out :
%       ref : attribute if index.type is '.'
%       ref : fpe if index.type is '()'
%
% This function deliver two type of result
%       - if index.type = '.' the result is the attribute specified by
%         index.subs.
%               Ex : fss.order
%
%       - if index.type = '()' the result is a sigle dimensionned fpe
%         componing a multidimensionnal one at the place specified by index.subs. 
%               Ex : fss(i,j)
% 
%   Copyright © CRONE

%% Function-based unit test for test_fss_subsref
% Last revision 29/09/2021

function tests = test_fss_subsref
    tests = functiontests(localfunctions);
end

%% The classic case :  
function testSubsrefSISO1(testCase)
    % frac_ss créé sans préciser band et N
    %% dans system SISO:
    pol1=frac_ss([2],[1],[5],[2.5],0.8);
    % obtenir les parametres :
    assertEqual(testCase,pol1.A,2,'pol1.A is not 2');
    assertEqual(testCase,pol1.B,1,'pol1.B is not 1');
    assertEqual(testCase,pol1.C,5,'pol1.C is not 5');
    assertEqual(testCase,pol1.D,2.5,'pol1.D is not 2.5');
    assertEqual(testCase,pol1.order,0.8,'pol1.order is not 0.8');
    assertEmpty(testCase,pol1.N,'pol1.N is not empty');
    assertEmpty(testCase,pol1.band,'pol1.band is not empty');
    assertEqual(testCase,pol1.variable,'s','pol1.variable is not s');
end

%% dans system MIMO:
function testSubsrefMIMO1(testCase)
    pol2=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2);
    % obtenir les parametres :
    assertEqual(testCase,pol2.A,[2 5;2 4],'pol2.A is not [2 5;2 4]');
    assertEqual(testCase,pol2.B,[3 4;1 2],'pol2.B is not [3 4;1 2]');
    assertEqual(testCase,pol2.C,[2 5;2 1],'pol2.C is not [2 5;2 1]');
    assertEqual(testCase,pol2.D,[2,2;1 1],'pol2.D is not [2,2;1 1]');
    assertEqual(testCase,pol2.order,0.2,'pol2.order is not 0.2');
    assertEmpty(testCase,pol2.N,'pol2.N is not empty');
    assertEmpty(testCase,pol2.band,'pol2.band is not empty');
    assertEqual(testCase,pol2.variable,'s','pol2.variable is not s');
end
%% frac_ss créé avec les valeurs de  band et N 
function testSubsrefSISO2(testCase)
%% dans systeme SISO:
    pol3=frac_ss([2],[1],[5],[2.5],0.8,'N',50,'band',[0.001,1000]);
    % obtenir les parametres :
    assertEqual(testCase,pol3.A,2,'pol3.A is not 2');
    assertEqual(testCase,pol3.B,1,'pol3.B is not 1');
    assertEqual(testCase,pol3.C,5,'pol3.C is not 5');
    assertEqual(testCase,pol3.D,2.5,'pol3.D is not 2.5');
    assertEqual(testCase,pol3.order,0.8,'pol3.order is not 0.8');
    assertEqual(testCase,pol3.N,50,'pol3.N is not 50');
    assertEqual(testCase,pol3.band,[0.001,1000],'pol3.band is not [0.001,1000]');
    assertEqual(testCase,pol3.variable,'s','pol3.variable is not s');
end
%% dans systeme MIMO: 
function testSubsrefMIMO2(testCase)
pol4=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2,'N',100,'band',[10,1000]);

% obtenir les parametres :
    assertEqual(testCase,pol4.A,[2 5;2 4],'pol4.A is not [2 5;2 4]');
    assertEqual(testCase,pol4.B,[3 4;1 2],'pol4.B is not [3 4;1 2]');
    assertEqual(testCase,pol4.C,[2 5;2 1],'pol4.C is not [2 5;2 1]');
    assertEqual(testCase,pol4.D,[2,2;1 1],'pol4.D is not [2,2;1 1]');
    assertEqual(testCase,pol4.order,0.2,'pol4.order is not 0.2');
    assertEqual(testCase,pol4.N,100,'pol4.N is not 100');
    assertEqual(testCase,pol4.band,[10,1000],'pol4.band is not [10,1000]');
    assertEqual(testCase,pol4.variable,'s','pol4.variable is not s');
end
%% The special case
function testSubsrefEmpty(testCase)
    %frac_ss vide
    pol5=frac_ss;
    % obtenir les parametres :
    assertEmpty(testCase,pol5.A,'pol5.A is not empty');
    assertEmpty(testCase,pol5.B,'pol5.B is not empty');
    assertEmpty(testCase,pol5.C,'pol5.C is not empty');
    assertEmpty(testCase,pol5.D,'pol5.D is not empty');
    assertEmpty(testCase,pol5.order,'pol5.order is not empty');
    assertEmpty(testCase,pol5.N,'pol5.N is not empty');
    assertEmpty(testCase,pol5.band,'pol5.band is not empty');
    assertEqual(testCase,pol5.variable,'s','pol5.variable is not s');
end
%%  frac_ss nan dans systeme MIMO:
%  pol7=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 nan],0.2,100,[10,1000]);
%  A=pol7.A
%  B=pol7.B
%  C=pol7.C
%  D=pol7.D
%  order=pol7.order
%  variable=pol7.variable
%  N=pol7.N
%  band=pol7.band