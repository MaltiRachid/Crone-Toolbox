%% Description
%
% Test function on :
%          - function : rdivide
%          - class    : frac_poly_exp
%
% Prototype :
%        res=rdivide(fp1,fp2)           
%
% Argument in : 
%   fp1 : Frac_poly_exp object
%   fp2 : Frac_poly_exp object
% 
% Argument out :
%   res : Frac_tf object
%
%   Creates the transfer function with :
%       - numerator   : fr1
%       - denominator : fr2
%
%    res = fr1 / fr2
%
%    See also ldivide
%    See also frac_tf the constructor of this class
% 
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpe_rdivide
% Last revision 14/09/2021

function tests = test_fpe_rdivide
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testRdivideSISO(testCase)
    pol1=frac_poly_exp([1,2,4,3],[3,2,0,1]);
    pol1bis=frac_poly_exp([3,12,2],[3,1,0]);
    sys=frac_tf(pol1bis,pol1);
    
	assertEqual(testCase,rdivide(pol1bis,pol1),sys,'rdivide(pol1bis,pol1) is not pol1bis / pol1');
end
%% The classic case : multidimensionnal
function testRdivideMIMO(testCase)
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
%                  [ (3 s^3 + 12 s + 2)^3   (3 s^3 + 12 s + 2)^3  ]
%        pol3bis = [                                              ]
%                  [ (3 s^3 + 12 s + 2)^3   (3 s^3 + 12 s + 2)^3  ]
    sys=frac_tf(pol3bis,pol3);
    
    assertEqual(testCase,rdivide(pol3bis,pol3),sys,'rdivide(pol3bis,pol3) is not sys');
end

%% Special Case : NaN polynomial
function testRdivideNaN(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol_nan=frac_poly_exp(nan);
% If one of the argument is a NaN polynomial the result is the NaN
% polynomial 
	assertTrue(testCase,isnan(rdivide(pol1,pol_nan)));
    assertTrue(testCase,isnan(rdivide(pol_nan,pol1)));
    assertTrue(testCase,isnan(rdivide(pol_nan,pol_nan)));
end
%% Special Case : Empty polynomial
function testRdivideEmpty(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol_vide=frac_poly_exp;
% If one of the argument is an empty polynomial the result is empty
	assertEmpty(testCase,rdivide(pol1,pol_vide),'rdivide(pol1,pol_vide) is not empty');
	assertEmpty(testCase,rdivide(pol_vide,pol1),'pol_vide/pol1 is not empty');
    assertEmpty(testCase,rdivide(pol_vide,pol_vide),'pol_vide/pol_vide is not empty');
end