%% Description
%
% Test function on :
%          - function : eq
%          - class    : frac_poly_exp
%
% Prototype :
%        bool=eq(fp1,fp2)            
%
% Argument in : 
%   fp1 : Frac_poly_exp object
%   fp2 : Frac_poly_exp object
% 
% Argument out :
% 	bool : boolean or a cell of boolean (multidimensionnal)
% 
% Test the equality between two explicit fractionnal polynomial
% Tested objects must have the same size.
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpe_eq
% Last revision 09/09/2021

function tests = test_fpe_eq
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testEqSISO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol1bis=frac_poly_exp([2,4,8],[3,2,0]);

% pol1==pol1 returns 1
    assertTrue(testCase,eq(pol1,pol1),'eq(pol1,pol1) is not true');
% pol1==pol1bis returns 0
	assertFalse(testCase,eq(pol1,pol1bis),'eq(pol1,pol1bis) is not false');
end

%% The classic case : multidimensionnal
function testEqMIMO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol1bis=frac_poly_exp([2,4,8],[3,2,0]);
    pol2=frac_poly_exp([pol1; pol1]);
    pol2bis=frac_poly_exp([pol1bis; pol1bis]);
    pol3=frac_poly_exp([pol2, pol2]);
    pol3bis=frac_poly_exp([pol2, pol2bis]);
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
%           pol3 = [                                      ]
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
%
%
%                  [ s^3 + 2 s^2 + 4   2 s^3 + 4 s^2 + 8  ]
%        pol3bis = [                                      ]
%                  [ s^3 + 2 s^2 + 4   2 s^3 + 4 s^2 + 8  ]
%
% The test pol3==pol3bis will return the following cell array :
    assertFalse(testCase,eq(pol3,pol3bis));

% The classic case : different dimensions
% If dimensions are different the polynomials are obviously not equal
    assertFalse(testCase,eq(pol3,pol1));
end
%% Special Case : NaN and Empty polynomial
function testEqNaNEmpty(testCase)
    pol_nan=frac_poly_exp(nan);
    pol_vide=frac_poly_exp;
% By convention,
%   - 2 NaN polynomial are not equal
%   - 2 Empty polynomial are equal 
    assertFalse(testCase,eq(pol_nan, pol_nan));
    assertTrue(testCase,eq(pol_vide, pol_vide));
end