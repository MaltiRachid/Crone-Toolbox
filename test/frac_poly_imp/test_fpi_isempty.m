%% Description
%
% Test function on :
%          - function : isempty
%          - class    : frac_poly_imp
%
% Prototype :
%        bool=isempty(fpi)            
%
% Argument in : 
%   fpi : Frac_poly_imp object
% 
% Argument out :
% 	bool : boolean
% 
% Test if the implicit fractionnal polynomial is empty
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpi_isempty
% Last revision 09/09/2021

function tests = test_fpi_isempty
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testIsEmptySISO(testCase)
    pol1=frac_poly_imp(frac_poly_exp([1,2,4],[3,2,0]),3);
    pol_vide=frac_poly_imp;

% iscomplex(pol1) returns 0
	assertFalse(testCase,isempty(pol1));
% iscomplex(polcmplx1) returns 1
	assertTrue(testCase,isempty(pol_vide));
end
%% Special Case : NaN polynomial
function testIsEmptyNaN(testCase)
    pol_nan=frac_poly_imp(nan);
% By convention, the NaN polynomial is not empty
    assertFalse(testCase,isempty(pol_nan));
end