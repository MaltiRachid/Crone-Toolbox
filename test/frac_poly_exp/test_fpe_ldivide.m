%% Description
%
% Test function on :
%          - function : ldivide
%          - class    : frac_poly_exp
%
% Prototype :
%        res=ldivide(fp1,fp2)           
%
% Argument in : 
%   fp1 : Frac_poly_exp object
%   fp2 : Frac_poly_exp object
% 
% Argument out :
%   res : Frac_tf object
%
%   Creates the transfer function with :
%       - numerator   : fr2
%       - denominator : fr1
%
%    res = fr2 / fr1
%
%    See also rdivide
%    See also frac_tf the constructor of tis class
% 
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpe_ldivide
% Last revision 14/09/2021

function tests = test_fpe_ldivide
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testLdivideSISO(testCase)
    pol1=frac_poly_exp([1,2,4,3],[3,2,0,1]);
    pol1bis=frac_poly_exp([3,12,2],[3,1,0]);
    sys=frac_tf(pol1bis,pol1);
    
	assertEqual(testCase,ldivide(pol1,pol1bis),sys,'ldivide(pol1,pol1bis) is not pol1bis / pol1');
end
%% The classic case : multidimensionnal
function testLdivideMIMO(testCase)
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
    
    assertEqual(testCase,ldivide(pol3,pol3bis),sys,'ldivide(pol3,pol3bis) is not sys');
end

%% Special Case : NaN polynomial
function testLdivideNaN(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol_nan=frac_poly_exp(nan);
% If one of the argument is a NaN polynomial the result is the NaN
% polynomial 
	assertTrue(testCase,isnan(ldivide(pol1,pol_nan)));
    assertTrue(testCase,isnan(ldivide(pol_nan,pol1)));
    assertTrue(testCase,isnan(ldivide(pol_nan,pol_nan)));
end
%% Special Case : Empty polynomial
function testLdivideEmpty(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol_vide=frac_poly_exp;
% If one of the argument is an empty polynomial the result is empty
	assertEmpty(testCase,ldivide(pol1,pol_vide),'ldivide(pol1,pol_vide) is not empty');
	assertEmpty(testCase,ldivide(pol_vide,pol1),'pol_vide*pol1 is not empty');
    assertEmpty(testCase,ldivide(pol_vide,pol_vide),'pol_vide*pol_vide is not empty');
end