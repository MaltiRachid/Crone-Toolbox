%% Description
%
% Test function on :
%          - function : transpose
%          - class    : frac_ss
%
% Prototype :
%        res=transpose(fss)            
%
% Argument in : 
%   fpe : Frac_ss object
% 
% Argument out :
% 	res : Frac_ss object
% 
% Transposition of fractional state space, res = 'fss
% 
%   Copyright © CRONE  26/07/2009

%% Function-based unit test for test_fss_transpose
% Last revision 30/09/2021

function tests = test_fss_transpose
    tests = functiontests(localfunctions);
end

%% The classic case :  
function testTranspose1(testCase)
% frac_ss créé sans préciser band et N
    pol1=frac_ss([2],[1],[5],[2.5],0.8);
    res1=transpose(pol1);

    assertFalse(testCase,isempty(res1),'sys is empty');
    assertEmpty(testCase,get(res1,'N'),'N is not empty');
    assertEmpty(testCase,get(res1,'band'),'band is not empty');
%% dans system MIMO:
    pol2=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2);
    res = transpose(pol2);
    
    assertFalse(testCase,isempty(res),'sys is empty');
    assertEmpty(testCase,get(res,'N'),'N is not empty');
    assertEmpty(testCase,get(res,'band'),'band is not empty');
end
%% frac_ss créé avec les valeurs de  band et N 
function testTranspose2(testCase)
    pol3=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2,'N',100,'band',[10,1000]);
    res= transpose(pol3);

    assertFalse(testCase,isempty(res),'sys is empty');
    assertEqual(testCase,get(res,'N'),100,'N is not 100');
    assertEqual(testCase,get(res,'band'),[10 1000],'band is not [10 1000]');
end

%% Special case: empty frac_ss
function testTransposeEmpty(testCase)
    pol_vide=frac_ss;
    res2=transpose(pol_vide);
    assertEmpty(testCase,res2,'res2 is not empty');
end
%% Special Case : NaN polynomial
%dans système MIMO:
%  pol_nan2=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 nan],0.2,100,[10,1000]);
% % 
% res1=transpose(pol_nan1)
% res2=transpose(pol_nan2)