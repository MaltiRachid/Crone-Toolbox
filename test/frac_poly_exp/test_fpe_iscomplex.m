%% Description
%
% Test function on :
%          - function : iscomplex
%          - class    : frac_poly_exp
%
% Prototype :
%        bool=iscomplex(fpe)            
%
% Argument in : 
%   fpe : Frac_poly_exp object
% 
% Argument out :
% 	bool : boolean
% 
% Test if there is any complex number in the explicit fractionnal
% polynomial
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpe_iscomplex
% Last revision 14/09/2021

function tests = test_fpe_iscomplex
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testIscomplexSISO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    polcmplx1=frac_poly_exp([1,2+1i,4],[3,2,0]);

% iscomplex(pol1) returns 0
	assertFalse(testCase,iscomplex(pol1));
% iscomplex(polcmplx1) returns 1
	assertTrue(testCase,iscomplex(polcmplx1));
end

%% The classic case : multidimensionnal
function testIscomplex(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    polcmplx1=frac_poly_exp([1,2+1i,4],[3,2,0]);
    pol2=frac_poly_exp([pol1; pol1]);
    polcmplx2=frac_poly_exp([polcmplx1; polcmplx1]);
    polcmplx3=frac_poly_exp([pol2, polcmplx2]);
%                       [  s^3 + 2 s^2 + 4    s^3 + (2+i) s^2 + 4  ]
%           polcmplx3 = [                                          ]
%                       [  s^3 + 2 s^2 + 4    s^3 + (2+i) s^2 + 4  ]
% The test iscomplex(polcmplx3) will return the following boolean :
    assertTrue(testCase,iscomplex(polcmplx3));
end
%% Special Case : NaN and Empty polynomial
function testIscomplexNaNEmpty(testCase)
    pol_nan=frac_poly_exp(nan);
    pol_vide=frac_poly_exp;
% By convention, the NaN and the Empty polynomial are not complex
	assertFalse(testCase,iscomplex(pol_nan));
	assertFalse(testCase,iscomplex(pol_vide));
end