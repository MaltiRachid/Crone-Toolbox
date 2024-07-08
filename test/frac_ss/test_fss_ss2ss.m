%% Description
%
% Test function on :
%          - function : ss2ss
%          - class    : frac_ss
%
% Prototype :
%        res=ss2ss(fss,facteur_ordre)
%    
%
% Argument in : 
%       fss : Frac_ss object
%       facteur_ordre: le rapport de ordre du système fss et celui de
%       res  (ordre commensurable)
%
% Argument out :
%       res : Frac_ss object
%
% example:
% 
%il existe deux système fss1 et fss2, avec ordre respectivement 0.8 et 0.6,
%donc l'ordre commensurate égale 0.2. 
% 
%ss2ss est pour le but de convertir système frac_ss vers un nouveau frac_ss
%avec un ordre commensurate.
%
%pour le système fss1: facteur_ordre=0.8/0.2=4, res1=ss2ss(fss1,4);
%pour fss2: facteur_ordre=0.6/0.2=3, res2=ss2ss(fss2,3);
%
%   Copyright © CRONE 14/09/2009

%% Function-based unit test for test_fss_ss2ss
% Last revision 30/09/2021

function tests = test_fss_ss2ss
    tests = functiontests(localfunctions);
end

%% The classic case : 
function testSs2ss(testCase)
pol1=frac_ss([0 1;1 -1],[0 ;1],[1 1],[1 ],0.3,'N',100,'band',[0.1 1000]);
res1=ss2ss(pol1,3);

assertEqual(testCase,get(res1,'order'),get(pol1,'order')/3,'res1_order is not pol1_order/3');
assertEqual(testCase,get(res1,'variable'),'s','variable is not s');
assertEqual(testCase,get(res1,'N'),100,'N is not 100');
assertEqual(testCase,get(res1,'band'),[0.1 1000],'band is not [0.1 1000]');

end
% %%  frac_ss nan 
%  pol2=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 nan],0.2,100,[10,1000]);
%  res2=ss2ss(pol2,2)
%  N=get(res2,'N')
%  band=get(res2,'band')
 
%% frac_ss vide
function testSs2ssEmpty(testCase)
    pol3=frac_ss;
    res3=ss2ss(pol3,4);

    assertEmpty(testCase,res3,'res3 is not empty');
end
 
