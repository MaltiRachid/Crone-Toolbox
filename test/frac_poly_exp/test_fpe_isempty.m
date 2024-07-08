%% Description
%
% Test function on :
%          - function : isempty
%          - class    : frac_poly_exp
%
% Prototype :
%        bool=isempty(fpe)            
%
% Argument in : 
%   fpe : Frac_poly_exp object
% 
% Argument out :
% 	bool : boolean
% 
% Test if the explicit fractionnal polynomial is empty
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpe_isempty
% Last revision 14/09/2021

function tests = test_fpe_isempty
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testIsemptySISO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol_vide=frac_poly_exp;

% iscomplex(pol1) returns 0
	assertFalse(testCase,isempty(pol1));
% iscomplex(pol_vide) returns 1
	assertTrue(testCase,isempty(pol_vide));
end

%% Special Case : NaN polynomial
function testIsemptyNaN(testCase)
    pol_nan=frac_poly_exp(nan);
% By convention, the NaN polynomial is not empty
    assertFalse(testCase,isempty(pol_nan));
end