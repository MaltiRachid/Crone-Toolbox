%% Description
%
% Test function on :
%          - function : uminus
%          - class    : frac_poly_exp
%
% Prototype :
%        res=uminus(fpe)            
%
% Argument in : 
%   fpe : Frac_poly_exp object
%
% Argument out :
% 	res : Frac_poly_exp object
% 
% Calculate the opposit of the polynomial fpe.
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpe_uminus
% Last revision 21/09/2021

function tests = test_fpe_uminus
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testUminusSISO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol1_exp=frac_poly_exp([-1,-2,-4],[3,2,0]);
% -(s^3 + 2 s^2 + 4) returns the opposite polynomial :
	assertEqual(testCase,uminus(pol1),pol1_exp,'uminus(pol1) is not pol1_exp');
end
%% The classic case : multidimensionnal
function testUminusMIMO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol2=frac_poly_exp([pol1; pol1]);
    pol3=frac_poly_exp([pol2, pol2]);
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
%           pol3 = [                                      ]
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
% The operation -pol3 will return the following 2 by 2 polynomial :
    pol3_exp=frac_poly_exp([-pol2, -pol2]);
    assertEqual(testCase,uminus(pol3),pol3_exp,'uminus(pol3) is not pol3_exp');
end
%% Special Case : NaN polynomial
function testUminusNaN(testCase)
    pol_nan=frac_poly_exp(nan);
% If the argument is a NaN polynomial the result is the NaN
% polynomial 
    assertTrue(testCase,isnan(uminus(pol_nan)));
end
%% Special Case : Empty polynomial
function testUminusEmpty(testCase)
    pol_vide=frac_poly_exp;
% If the arguments is the empty polynomial the result is the empty
% polynomial
    assertEmpty(testCase,uminus(pol_vide));
end
