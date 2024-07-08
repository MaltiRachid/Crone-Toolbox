%% Description
%
% Test function on :
%          - function : times
%          - class    : frac_poly_exp
%
% Prototype :
%        res=times2(fp1,fp2)            
%
% Argument in : 
%   fp1 : Frac_poly_exp object
%   fp2 : Frac_poly_exp object
% 
% Argument out :
% 	res : Frac_poly_exp object
% 
% Realize the operation fpe1 .x fp2, term by term multiplication.
% The ojects must have the same dimension.
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpe_times
% Last revision 21/09/2021

function tests = test_fpe_times
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testTimesSISO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol1bis=frac_poly_exp([3,12,2],[3,1,0]);
% With one-dimension polynomial, times is equivalent to mtimes2
% (3 s^3 + 12 s + 2) .* (s^3 + 2 s^2 + 4) returns the polynomial :
    pol_exp=frac_poly_exp([3 6 12 38 4 48 8],[6 5 4 3 2 1 0]);
    assertEqual(testCase,times(pol1bis,pol1),pol_exp,'times(pol1bis,pol1) is not pol_exp');
end

%% The classic case : multidimensionnal
function testTimesMIMO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol1bis=frac_poly_exp([3,12,2],[3,1,0]);
    pol2=frac_poly_exp([pol1; pol1]);
    pol2bis=frac_poly_exp([pol1bis; pol1bis]);
    pol3=frac_poly_exp([pol2, pol2]);
    pol3bis=frac_poly_exp([pol2bis, pol2bis]);
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
%           pol3 = [                                      ]
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
%                  [ 3 s^3 + 12 s + 2   3 s^3 + 12 s + 2  ]
%        pol3bis = [                                      ]
%                  [ 3 s^3 + 12 s + 2   3 s^3 + 12 s + 2  ]
% The operation pol3bis .* pol3 calculates the maricial multiplication.
% It will result the following 2 by 2 polynomial:
    pol_exp=enlarge(frac_poly_exp([3 6 12 38 4 48 8],[6 5 4 3 2 1 0]),2,2);
    assertEqual(testCase,times(pol3bis,pol3),pol_exp,'times(pol3bis,pol3) is not pol_exp');
end
%% Special Case : NaN polynomial
function testTimesNaN(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol_nan=frac_poly_exp(nan);
% If one of the argument is a NaN polynomial the result is the NaN
% polynomial 
	assertTrue(testCase,isnan(pol1*pol_nan));
    assertTrue(testCase,isnan(pol_nan*pol1));
    assertTrue(testCase,isnan(pol_nan*pol_nan));
end
%% Special Case : Empty polynomial
function testTimesEmpty(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol_vide=frac_poly_exp;
% If one of the argument is a Empty polynomial the result is the empty
% polynomial 
	assertEmpty(testCase,pol1.*pol_vide);
    assertEmpty(testCase,pol_vide.*pol1);
    assertEmpty(testCase,pol_vide.*pol_vide);
end