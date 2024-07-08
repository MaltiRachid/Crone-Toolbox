%% Description
%
% Test function on :
%          - function : uminus
%          - class    : frac_poly_imp
%
% Prototype :
%        res=uminus(fpi)            
%
% Argument in : 
%   fpe : Frac_poly_imp object
%
% Argument out :
% 	res : Frac_poly_imp object
% 
% Calculate the opposit of the polynomial fpi.
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpi_uminus
% Last revision 10/09/2021

function tests = test_fpi_uminus
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testUminusSISO(testCase)
    pol1=frac_poly_imp([1,2,4],[3,2,0],1);
% -(s^3 + 2 s^2 + 4) returns the opposite polynomial :
	assertEqual(testCase,uminus(pol1),frac_poly_imp([-1,-2,-4],[3,2,0],1),'uminus(pol1) is not -pol1');
end

%% The classic case : multidimensionnal
function testUminusMIMO(testCase)
    pol1=frac_poly_imp([1,2,4],[3,2,0],1);
    pol2=frac_poly_exp([pol1; pol1]);
    pol3=frac_poly_exp([pol2, pol2]);
%              [ (s^3 + 2 s^2 + 4)^3     (s^3 + 2 s^2 + 4)^3  ]
%       pol3 = [                                              ]
%              [ (s^3 + 2 s^2 + 4)^3     (s^3 + 2 s^2 + 4)^3  ]
%
%
% The operation -pol3 will return the following 2 by 2 polynomial :
    mpol3=frac_poly_exp({[-1 -2 -4] [-1 -2 -4]; [-1 -2 -4] [-1 -2 -4]},{[3 2 0] [3 2 0];[3 2 0] [3 2 0]});
    assertEqual(testCase,uminus(pol3),mpol3,'uminus(pol3) is not equal to mpol3');
end
%% Special Case : NaN polynomial
function testUminusNaN(testCase)
    pol_nan=frac_poly_imp(nan);
% If the argument is a NaN polynomial the result is the NaN
% polynomial 
    assertTrue(testCase,isnan(uminus(pol_nan)));
end

%% Special Case : Empty polynomial
function testUminusEmpty(testCase)
    pol_vide=frac_poly_imp;
% If the arguments is the empty polynomial the result is the empty
% polynomial
    assertEmpty(testCase,uminus(pol_vide));
end
