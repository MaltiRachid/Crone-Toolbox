%% Description
%
% Test function on :
%          - function : set
%          - class    : frac_ss
%
% Prototype :
%        fss=set(fss, field, valor)
%
% Argument in : 
%       fss   : Frac_ss object
%       field : the attribute to be changed
%       valor : the new valor
%
% Argument out :
%       fss: frac_ss object
%
% Permits the modification of the fields
%
%   Copyright © CRONE   16/07/2009

%% Function-based unit test for test_fss_set
% Last revision 29/09/2021

function tests = test_fss_set
    tests = functiontests(localfunctions);
end

%% The classic case :  
function testSetSISO1(testCase)
    % frac_ss créé sans préciser band et N
    pol1=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2);
    % set les parametres
    set(pol1,'band',[0.001 1000]);
    assertEqual(testCase,get(pol1,'band'),[0.001 1000],'band is not [0.001 1000]');
    set(pol1,'N',50);
    assertEqual(testCase,get(pol1,'N'),50,'N is not 50');
    set(pol1,'order',1.5);
    assertEqual(testCase,get(pol1,'order'),1.5,'order is not 1.5');
    set(pol1,'A',[3 3; 3 3]);
    assertEqual(testCase,get(pol1,'A'),[3 3; 3 3],'A is not [3 3; 3 3]');
end
%% frac_ss créé avec les valeurs de  band et N 
function testSetSISO2(testCase)
    pol2=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2,'N',100,'band',[10,1000]);
    % set les parametres
    set(pol2,'band',[0.001 1000]);
    assertEqual(testCase,get(pol2,'band'),[0.001 1000],'band is not [0.001 1000]');
    set(pol2,'N',50);
    assertEqual(testCase,get(pol2,'N'),50,'N is not 50');
    set(pol2,'order',1.5);
    assertEqual(testCase,get(pol2,'order'),1.5,'order is not 1.5');
    set(pol2,'B',[3 3; 3 3]);
    assertEqual(testCase,get(pol2,'B'),[3 3; 3 3],'B is not [3 3; 3 3]');
end
%% The special case
function testSetEmpty(testCase)
%frac_ss vide
pol3=frac_ss;
% set les parametres
set(pol3,'band',[0.001 1000]);
assertEqual(testCase,get(pol3,'band'),[0.001 1000],'band is not [0.001 1000]');
set(pol3,'N',50);
assertEqual(testCase,get(pol3,'N'),50,'N is not 50');
set(pol3,'order',1.5);
assertEqual(testCase,get(pol3,'order'),1.5,'order is not 1.5');
set(pol3,'D',[3 3; 3 3]);
assertEqual(testCase,get(pol3,'D'),[3 3; 3 3],'D is not [3 3; 3 3]');
end
%%  frac_ss nan 
function testSetNaN(testCase)
% set les parametres 
polnan=frac_ss(nan,nan,nan,nan,nan);

set(polnan,'band',[0.001 1000]);
assertEqual(testCase,get(polnan,'band'),[0.001 1000],'band is not [0.001 1000]');
set(polnan,'N',50);
assertEqual(testCase,get(polnan,'N'),50,'N is not 50');
set(polnan,'order',1.5);
assertEqual(testCase,get(polnan,'order'),1.5,'order is not 1.5');
end
%% dans systeme MIMO:
%  %pol7=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 nan],0.2,100,[10,1000]);
%  
% % set les parametres 
% poll=set(pol1,'band',[0.001 1000]);
% band=get(pol1,'band')
% poll=set(pol1,'N',50);
% N=get(pol1,'N')
% pol1=set(pol1,'order',1.5);
% order=get(pol1,'order')
% poll=set(pol1,'D',[3 3; 3 3]);
% D=get(pol1,'D')
