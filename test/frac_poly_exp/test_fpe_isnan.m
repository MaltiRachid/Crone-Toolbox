%% Description
%
% Test function on :
%          - function : isnan
%          - class    : frac_poly_exp
%
% Prototype :
%        bool=isnan(fpe)            
%
% Argument in : 
%   fpe : Frac_poly_exp object
% 
% Argument out :
% 	bool : boolean
% 
% Test if any terms in the explicit fractionnal polynomial is nan
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpe_isnan
% Last revision 14/09/2021

function tests = test_fpe_isnan
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testIsnan(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    polnan1=frac_poly_exp([1,nan,4],[3,2,0]);
% isnan(pol1) returns 0
	assertFalse(testCase,isnan(pol1));
% isnan(polnan1) returns 1
	assertTrue(testCase,isnan(polnan1));
end

%% The classic case : multidimensionnal
function testIsnanMIMO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    polnan1=frac_poly_exp([1,nan,4],[3,2,0]);
    pol2=frac_poly_exp([pol1; pol1]);
    polnan2=frac_poly_exp([polnan1; polnan1]);
    polnan3=frac_poly_exp([pol2, polnan2]);
%                     [  s^3 + 2 s^2 + 4    NaN  ]
%           polnan3 = [                                          ]
%                     [  s^3 + 2 s^2 + 4    NaN  ]
% The test isnan(polnan3) will return the following boolean :
    assertTrue(testCase,isnan(polnan3));
end
%% Special Case : Empty polynomial
function testIsnanEmpty(testCase)
    pol_vide=frac_poly_exp;
% By convention, the Empty polynomial is not NaN
    assertFalse(testCase,isnan(pol_vide));
end