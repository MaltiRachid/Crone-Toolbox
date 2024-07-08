%% Description
%
% Test function on :
%          - function : times
%          - class    : frac_poly_imp
%
% Prototype :
%        res=times2(fp1,fp2)            
%
% Argument in : 
%   fp1 : Frac_poly_imp object
%   fp2 : Frac_poly_imp object
% 
% Argument out :
% 	res : Frac_poly_imp object
% 
% Realize the operation fpe1 .x fp2, term by term multiplication.
% The ojects must appropriatedimension, column of fp1 = row of fp2.
% The multiplication is possible only if the implicit order of the
% polynomial are all equal to 1.
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpi_times
% Last revision 10/09/2021

function tests = test_fpi_times
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testTimesSISO(testCase)
    pol1=frac_poly_imp([1,2,4],[3,2,0],1);
    pol1bis=frac_poly_imp([3,12,2],[3,1,0],3);
% With one-dimension polynomial, times is equivalent to mtimes
% (3 s^3 + 12 s + 2) .* (s^3 + 2 s^2 + 4) returns a polynomial despite the
% multiplication with a non null implicit order won't work
    pol1_2=frac_poly_imp([1 4 4 8 16 16],[6 5 4 3 2 0],1);
	assertEqual(testCase,times(pol1,pol1),pol1_2,'mtimes(pol1,pol1) is not pol1^2');
    assertEmpty(testCase,times(pol1bis,pol1bis),'mtimes(pol1bis,pol1bis) is not empty');
end
%% The classic case : multidimensionnal
function testTimesMIMO(testCase)
    pol1=frac_poly_imp([1,2,4],[3,2,0],1);
    pol1bis=frac_poly_imp([3,12,2],[3,1,0],3);
    pol2=frac_poly_imp([pol1; pol1]);
    pol2bis=frac_poly_imp([pol1bis; pol1bis]);
    pol3=frac_poly_imp([pol2, pol2]);
    pol3bis=frac_poly_imp([pol2bis, pol2bis]);
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
%           pol3 = [                                      ]
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
%
%
%                  [ (3 s^3 + 12 s + 2)^3   (3 s^3 + 12 s + 2)^3  ]
%        pol3bis = [                                              ]
%                  [ (3 s^3 + 12 s + 2)^3   (3 s^3 + 12 s + 2)^3  ]
% As in the previous case, only an implicit order equal to 1 allows the
% multiplication.
    pol3_exp=frac_poly_imp(frac_poly_exp({[1 4 4 8 16 16] [1 4 4 8 16 16];[1 4 4 8 16 16] [1 4 4 8 16 16]},{[6 5 4 3 2 0] [6 5 4 3 2 0];[6 5 4 3 2 0] [6 5 4 3 2 0]}),[1 1;1 1]);
    assertEqual(testCase,times(pol3,pol3),pol3_exp,'mtimes(pol3,pol3) is not pol3_exp');
    assertEmpty(testCase,times(pol3bis,pol3bis),'mtimes(pol3bis,pol3bis) is not empty');
end

%% Special Case : NaN polynomial
function testTimesNaN(testCase)
    pol1=frac_poly_imp([1,2,4],[3,2,0],1);
    pol_nan=frac_poly_imp(nan);
% If one of the argument is a NaN polynomial the result is the NaN
% polynomial 
	assertTrue(testCase,isnan(pol1.*pol_nan));
    assertTrue(testCase,isnan(pol_nan.*pol1));
    assertTrue(testCase,isnan(pol_nan.*pol_nan));
end
%% Special Case : Empty polynomial
function testTimesEmpty(testCase)
    pol1=frac_poly_imp([1,2,4],[3,2,0],1);
    pol_vide=frac_poly_imp;
% The multiplication succeed only if both arguments are emtys
	assertEmpty(testCase,pol1.*pol_vide,'pol1*pol_vide is not empty');
	assertEmpty(testCase,pol_vide.*pol1,'pol_vide*pol1 is not empty');
    assertEmpty(testCase,pol_vide.*pol_vide,'pol_vide*pol_vide is not empty');
end