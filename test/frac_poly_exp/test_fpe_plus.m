%% Description
%
% Test function on :
%          - function : plus
%          - class    : frac_poly_exp
%
% Prototype :
%        res=plus(fp1,fp2)            
%
% Argument in : 
%   fp1 : Frac_poly_exp object
%   fp2 : Frac_poly_exp object
% 
% Argument out :
% 	res : Frac_poly_exp object
% 
% Realize the opration fp1 + fp2. The ojects must have the same size.
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpe_parallel
% Last revision 20/09/2021

function tests = test_fpe_plus
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testPlusSISO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol1bis=frac_poly_exp([3,12,2],[3,1,0]);
% (3 s^3 + 12 s + 2) + (s^3 + 2 s^2 + 4) returns the polynomial :
    polplus=plus(pol1bis,pol1);
    polplus_exp=frac_poly_exp([4 2 12 6],[3 2 1 0]);
    
    assertEqual(testCase,polplus,polplus_exp,'polplus is not polplus_exp');
end
%% The classic case : multidimensionnal
function testPlusMIMO(testCase)
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
% The operation pol3bis + pol3 will return the following 2 by 2 polynomial :
    polplus=plus(pol3bis,pol3);
    polplus_exp=frac_poly_exp({[4 2 12 6] [4 2 12 6];[4 2 12 6] [4 2 12 6]},{[3 2 1 0] [3 2 1 0];[3 2 1 0] [3 2 1 0]});
    
    assertEqual(testCase,polplus,polplus_exp,'polplus is not polplus_exp');
end
%% Special Case : NaN polynomial
function testPlusNaN(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol_nan=frac_poly_exp(nan);
% If one of the argument is a NaN polynomial the result is the NaN
% polynomial 
    polplus1=pol1+pol_nan;
    polplus2=pol_nan+pol1;
    polplus3=pol_nan+pol_nan;
    
    assertTrue(testCase,isnan(polplus1));
    assertTrue(testCase,isnan(polplus2));
    assertTrue(testCase,isnan(polplus3));
end
%% Special Case : Empty polynomial
function testPlusEmpty(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol_vide=frac_poly_exp;
% If both arguments are the empty polynomial the result is the empty
% polynomial
	polplus1=pol1+pol_vide;
	polplus2=pol_vide+pol1;
    polplus3=pol_vide+pol_vide;
    
    assertEqual(testCase,polplus1,pol1,'polplus1 is not pol1');
    assertEqual(testCase,polplus2,pol1,'polplus2 is not pol1');
    assertEmpty(testCase,polplus3,'polplus3 is not empty');
end