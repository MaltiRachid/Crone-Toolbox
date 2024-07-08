%% Description
%
% Test function on :
%          - function :eq
%          - class    : frac_ss
%
% Prototype :
           % bool=eq(fss1,fss2)
           % Returns the boolean fss1==fss2
%
% Argument in : 
%	fss1 : Frac_ss object
%	fss2 : Frac_ss object
% 
% Argument out :
%	bool : boolean
%
% ex:
% fss1==fss2
%
%   Copyright © CRONE -	26/07/2009

%% Function-based unit test for test_fss_eq 
% Last revision 29/09/2021

function tests = test_fss_eq
    tests = functiontests(localfunctions);
end

%% The classic case :  
function testEqSISO(testCase)
pol1=frac_ss;
pol3=frac_ss([2],[1],[5],[2.5],0.8);
pol4=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2);
pol5=frac_ss([5 6;1 2],[2 5;4 2],[3 5;8 0.3],[2,2;1 8],0.5);

% comparaison
	assertTrue(testCase,eq(pol1,pol1),'pol1 is not pol1');
	assertFalse(testCase,eq(pol1,pol4),'pol1 is pol4');
	assertFalse(testCase,eq(pol3,pol4),'pol3 is pol4');
    assertTrue(testCase,eq(pol4,pol4),'pol4 is not pol4');
	assertFalse(testCase,eq(pol4,pol5),'pol4 is pol5');
end
