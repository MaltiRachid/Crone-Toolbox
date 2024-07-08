%% Description
%
% Test function on :
%          - function : isnan
%          - class    : frac_poly_imp
%
% Prototype :
%        bool=isnan(fpi)            
%
% Argument in : 
%   fpi : Frac_poly_imp object
% 
% Argument out :
% 	bool : boolean
% 
% Test if any terms in the implicit fractionnal polynomial is nan
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpi_isnan
% Last revision 09/09/2021

function tests = test_fpi_isnan
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testIsNaNSISO(testCase)
    pol1=frac_poly_imp(frac_poly_exp([1,2,4],[3,2,0]),3);
    polnan1=frac_poly_imp(frac_poly_exp([1,nan,4],[3,2,0]),3);
    polnan1bis=frac_poly_imp(frac_poly_exp([1,2,4],[3,2,0]),nan);

% isnan(pol1) returns 0
	assertFalse(testCase,isnan(pol1));
% isnan(polnan1) returns 1
	assertTrue(testCase,isnan(polnan1));
% isnan(polnan1) returns 1
	assertTrue(testCase,isnan(polnan1bis));
end

%% The classic case : multidimensionnal
function testIsNaNMIMO(testCase)
    pol1=frac_poly_imp(frac_poly_exp([1,2,4],[3,2,0]),3);
    polnan1=frac_poly_imp(frac_poly_exp([1,nan,4],[3,2,0]),3);
    pol2=frac_poly_imp([pol1; pol1]);
    polnan2=frac_poly_imp([polnan1; polnan1]);
    polnan3=frac_poly_imp([pol2, polnan2]);
%                     [  s^3 + 2 s^2 + 4    NaN  ]
%           polnan3 = [                                          ]
%                     [  s^3 + 2 s^2 + 4    NaN  ]
%
%
% The test isnan(polnan3) will return the following boolean :
    assertTrue(testCase,isnan(polnan3));
end

%% Special Case : Empty polynomial
function testIsNaNEmpty(testCase)
    pol_vide=frac_poly_imp;
% By convention, the Empty polynomial is not NaN
    assertFalse(testCase,isnan(pol_vide));
end