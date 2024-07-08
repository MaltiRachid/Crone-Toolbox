%% Description
%
% Test function on :
%          - function : ssdata
%          - class    : frac_ss
%
% Prototype :
%        [A,B,C,D,order,N,band,variable]=ssdata(fss)
%     
% Argument in : 
%       fss: Frac_ss object
%
% Argument out :
%       A,B,C,D,order,N,band,variable: les matrices de champs du fss
% 
%   Copyright © CRONE 14/09/2009

%% Function-based unit test for test_fss_ssdata
% Last revision 29/09/2021

function tests = test_fss_ssdata
    tests = functiontests(localfunctions);
end

%% The classic case :  
function testSsdata(testCase)
    % systeme SISO:
    pol1=frac_ss([2],[1],[5],[2.5],0.8,'N',50,'band',[0.001,1000]);
    [A,B,C,D,order]=ssdata(pol1);

    assertEqual(testCase,get(pol1,'A'),A,'A is not 2');
    assertEqual(testCase,get(pol1,'B'),B,'B is not 1');
    assertEqual(testCase,get(pol1,'C'),C,'C is not 5');
    assertEqual(testCase,get(pol1,'D'),D,'D is not 2.5');
    assertEqual(testCase,get(pol1,'order'),order,'order is not 0.8');

    % dans systeme MIMO:
    pol2=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2,'N',100,'band',[10,1000]);
    [A,B,C,D,order,N,band,variable]=ssdata(pol2);

    assertEqual(testCase,get(pol2,'A'),A,'A is not [2 5;2 4]');
    assertEqual(testCase,get(pol2,'B'),B,'B is not [3 4;1 2]');
    assertEqual(testCase,get(pol2,'C'),C,'C is not [2 5;2 1]');
    assertEqual(testCase,get(pol2,'D'),D,'D is not [2 2;1 1]');
    assertEqual(testCase,get(pol2,'order'),order,'order is not 0.2');
    assertEqual(testCase,get(pol2,'N'),N,'N is not 100');
    assertEqual(testCase,get(pol2,'band'),band,'band is not [10,1000]');
    assertEqual(testCase,get(pol2,'variable'),variable,'variable is not s');
end
%% The special case
function testSsdataEmpty(testCase)
    %frac_ss vide
    pol3=frac_ss;
    [A,B,C,D,order,N,band,variable]=ssdata(pol3)
    assertEmpty(testCase,A,'A is not empty');
    assertEmpty(testCase,B,'B is not empty');
    assertEmpty(testCase,C,'C is not empty');
    assertEmpty(testCase,D,'D is not empty');
    assertEmpty(testCase,order,'order is not empty');
    assertEmpty(testCase,N,'N is not empty');
    assertEmpty(testCase,band,'band is not empty');
    assertEqual(testCase,variable,'s','variable is not s');
end
%%  frac_ss nan 
% pol4=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 nan],0.2,100,[10,1000]);
 %
%[A,B,C,D,order,N,band,variable]=ssdata(pol4)