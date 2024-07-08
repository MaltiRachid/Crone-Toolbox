%% Description
%
% Test function on :
%          - function : eq
%          - class    : frac_poly_imp
%
% Prototype :
%        bool=eq(fp1,fp2)            
%
% Argument in : 
%   fp1 : Frac_poly_imp object
%   fp2 : Frac_poly_imp object
% 
% Argument out :
% 	bool : boolean or a cell of boolean (multidimensionnal)
% 
% Test the equality between two explicit fractionnal polynomial
% Tested objects must have the same size.
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpi_eq
% Last revision 09/09/2021

function tests = test_fpi_eq
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testEqSISO(testCase)
    pol1=frac_poly_imp(frac_poly_exp([1,2,4],[3,2,0]),3);
    pol1bis=frac_poly_imp(frac_poly_exp([2,4,8],[3,2,0]),3);
    pol1bisbis=frac_poly_imp(frac_poly_exp([1,2,4],[3,2,0]),2);

% pol1==pol1 returns 1
    assertTrue(testCase,eq(pol1,pol1));
% pol1==pol1bis returns 0 (coef)
    assertFalse(testCase,eq(pol1,pol1bis));
% pol1==pol1bis returns 0 (imp_order)
    assertFalse(testCase,eq(pol1,pol1bisbis));
end

%% The classic case : multidimensionnal
function testEqMIMO(testCase)
    pol1=frac_poly_imp(frac_poly_exp([1,2,4],[3,2,0]),3);
    pol1bis=frac_poly_imp(frac_poly_exp([2,4,8],[3,2,0]),3);
    pol3=frac_poly_imp([pol1 pol1; pol1 pol1]);
    pol3bis=frac_poly_imp([pol1 pol1bis; pol1 pol1bis]);

%               [ (s^3 + 2 s^2 + 4)^3     (s^3 + 2 s^2 + 4)^3  ]
%        pol3 = [                                              ]
%               [ (s^3 + 2 s^2 + 4)^3     (s^3 + 2 s^2 + 4)^3  ]
%
%
%               [ (s^3 + 2 s^2 + 4)^3   (2 s^3 + 4 s^2 + 8)^3  ]
%     pol3bis = [                                              ]
%               [ (s^3 + 2 s^2 + 4)^3   (2 s^3 + 4 s^2 + 8)^3  ]
%
%
% The test pol3==pol3bis will return the following cell array :
    assertFalse(testCase,eq(pol3,pol3bis));
end

%% The classic case : different dimensions
function testEq3(testCase)
% If dimensions are different the polynomials are obviously not equal
    pol1=frac_poly_imp(frac_poly_exp([1,2,4],[3,2,0]),3);
    pol3=frac_poly_imp([pol1 pol1; pol1 pol1]);
    
    assertFalse(testCase,eq(pol3,pol1));
end

%% Special Case : NaN and Empty polynomial
function testEqNaNEmpty(testCase)
    pol_nan=frac_poly_imp(nan);
    pol_vide=frac_poly_imp;
%
% By convention,
%   - 2 NaN polynomial are not equal
%   - 2 Empty polynomial are equal 
%
	assertFalse(testCase,eq(pol_nan, pol_nan));
    assertTrue(testCase,eq(pol_vide, pol_vide));
end