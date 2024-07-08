%% Description
%
% Test function on :
%          - function : ss2tf
%          - class    : frac_ss
%
% Prototype :
%        ftf=ss2tf(fss)
%    
% Argument in : 
%       fss : Frac_ss object
%       
% Argument out :
%       ftf :  Frac_tf objet
%
% transform a Frac_ss object to a Frac_tf objet
% 
% 
%   Copyright © CRONE

%% Function-based unit test for test_fss_ss2tf
% Last revision 30/09/2021

function tests = test_fss_ss2tf
    tests = functiontests(localfunctions);
end

%% The classic case :  
function testSs2tf1(testCase)
% frac_ss créé sans préciser band et N
%% dans system SISO:
pol1=frac_ss([2],[1],[5],[2.5],0.8);
%transfer to frac_tf
ftf1=ss2tf(pol1);

assertTrue(testCase,isa(ftf1,'frac_tf'),'ftf1 is not a frac_tf');
assertEmpty(testCase,get(ftf1,'N'),'N is not empty');
assertEmpty(testCase,get(ftf1,'band'),'band is not empty');

%% dans system MIMO:
pol2=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2);
%transfer to frac_tf
ftf2=ss2tf(pol2);

assertTrue(testCase,isa(ftf2,'frac_tf'),'ftf1 is not a frac_tf');
assertEmpty(testCase,get(ftf2,'N'),'N is not empty');
assertEmpty(testCase,get(ftf2,'band'),'band is not empty');
end
%% frac_ss créé avec les valeurs de  band et N 
function testSs2tf2(testCase)
%% dans systeme SISO:
pol3=frac_ss([2],[1],[5],[2.5],0.8,'N',50,'band',[0.001,1000]);
%transfer to frac_tf
ftf3=ss2tf(pol3);

assertTrue(testCase,isa(ftf3,'frac_tf'),'ftf1 is not a frac_tf');
assertEqual(testCase,get(ftf3,'N'),50,'N is not 50');
assertEqual(testCase,get(ftf3,'band'),[0.001 1000],'band is not [0.001 1000]');

%% dans systeme MIMO: 
pol4=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2,'N',100,'band',[10,1000]);
%transfer to frac_tf
ftf4=ss2tf(pol4);

assertTrue(testCase,isa(ftf4,'frac_tf'),'ftf1 is not a frac_tf');
assertEqual(testCase,get(ftf4,'N'),100,'N is not 100');
assertEqual(testCase,get(ftf4,'band'),[10 1000],'band is not [10 1000]');
end

%% The special case
function testSs2tfEmpty(testCase)
%frac_ss vide
pol5=frac_ss;

%transfer to frac_tf
ftf5=ss2tf(pol5);
assertEmpty(testCase,ftf5,'ftf5 is not empty');

% %% dans systeme MIMO:
%  pol7=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 8],0.2,'N',100,'band',[10,1000]);
% 
% %transfer to frac_tf
% ftf7=ss2tf(pol7)
% N=get(ftf7,'N')
% band=get(ftf7,'band')
end
 
