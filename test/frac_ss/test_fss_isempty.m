%% Description
%
% Test function on :
%          - function : isempty
%          - class    : frac_ss
%
% Prototype :
%        bool=isempty(fss)            
%
% Argument in : 
%   fss : Frac_ss object
% 
% Argument out :
% 	bool : boolean
% 
% Test if the frac state space is empty
% 
%   Copyright © CRONE

%% Function-based unit test for test_fss_isempty
% Last revision 29/09/2021

function tests = test_fss_isempty
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testIsemptySISO(testCase)
    pol1=frac_ss([2],[1],[5],[2.5],0.8);
    pol_vide=frac_ss;

    % iscomplex(pol1) returns 0
    assertFalse(testCase,isempty(pol1),'pol1 is empty');
    % iscomplex(polcmplx1) returns 1
    assertTrue(testCase,isempty(pol_vide),'pol_vide is not empty');
end

%% dans system MIMO:
function testIsemptyMIMO(testCase)
    pol2=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2);

    assertFalse(testCase,isempty(pol2),'pol2 is empty');
end