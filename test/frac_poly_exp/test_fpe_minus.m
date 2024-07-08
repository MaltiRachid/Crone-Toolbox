%% Description
%
% Test function on :
%          - function : minus
%          - class    : frac_poly_exp
%
% Prototype :
%        res=minus(fp1,fp2)            
%
% Argument in : 
%   fp1 : Frac_poly_exp object
%   fp2 : Frac_poly_exp object
% 
% Argument out :
% 	res : Frac_poly_exp object
% 
% Realize the opration fp1 - fp2. The ojects must have the same size.
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpe_minus
% Last revision 14/09/2021

function tests = test_fpe_minus
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testMinusSISO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol1bis=frac_poly_exp([3,12,2],[3,1,0]);
    
% pol1-pol1 returns the null polynomial
    assertEqual(testCase,minus(pol1,pol1),frac_poly_exp(0),'minus(pol1,pol1) is not pol1-pol1');
% another results, (3 s^3 + 12 s + 2) - (s^3 + 2 s^2 + 4)
	assertEqual(testCase,minus(pol1bis,pol1),frac_poly_exp([2 -2 12 -2],[3 2 1 0]));
end

%% The classic case : multidimensionnal
function testMinusMIMO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol1bis=frac_poly_exp([3,12,2],[3,1,0]);
    pol2=frac_poly_exp([pol1; pol1]);
    pol2bis=frac_poly_exp([pol1bis; pol1bis]);
    pol3=frac_poly_exp([pol2, pol2]);
    pol3bis=frac_poly_exp([pol2bis, pol2bis]);
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
%           pol3 = [                                      ]
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
%
%
%                  [ 3 s^3 + 12 s + 2   3 s^3 + 12 s + 2  ]
%        pol3bis = [                                      ]
%                  [ 3 s^3 + 12 s + 2   3 s^3 + 12 s + 2  ]
    polminus=frac_poly_exp({[2 -2 12 -2] [2 -2 12 -2];[2 -2 12 -2] [2 -2 12 -2]},{[3 2 1 0] [3 2 1 0];[3 2 1 0] [3 2 1 0]});
% The operation pol3bis - pol3 will return the following 2 by 2 polynomial :
    assertEqual(testCase,minus(pol3bis,pol3),polminus,'minus(pol3bis,pol3) is not polminus');
end

%% Special Case : NaN polynomial
function testMinusNaN(testCase)
    pol_nan=frac_poly_exp(nan);
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
% If one of the argument is a NaN polynomial the result is the NaN
% polynomial 
	assertTrue(testCase,isnan(pol1-pol_nan));
    assertTrue(testCase,isnan(pol_nan-pol1));
    assertTrue(testCase,isnan(pol_nan-pol_nan));
end
%% Special Case : Empty polynomial
function testMinusEmpty(testCase)
    pol_vide=frac_poly_exp;
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
% If both arguments are the empty polynomial the result is the empty
% polynomial
	assertEqual(testCase,pol1-pol_vide,pol1,'pol1-pol_vide is not pol1');
    assertEqual(testCase,pol_vide-pol1,frac_poly_exp([-1,-2,-4],[3,2,0]),'pol_vide-pol1 is not -pol1');
	assertEmpty(testCase,pol_vide-pol_vide,'pol_vide-pol_vide is not empty');
end