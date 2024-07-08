%% Description
%
% Test function on :
%          - function : plus
%          - class    : frac_poly_imp
%
% Prototype :
%        res=plus(fp1,fp2)            
%
% Argument in : 
%   fp1 : Frac_poly_imp object
%   fp2 : Frac_poly_imp object
% 
% Argument out :
% 	res : Frac_poly_imp object
% 
% Realize the opration fp1 + fp2. The ojects must have the same size.
% Addition is possible only if all the implicite order are equal to 1.
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpi_plus
% Last revision 10/09/2021

function tests = test_fpi_plus
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testPlusSISO(testCase)
    pol1=frac_poly_imp([1,2,4],[3,2,0],1);
    pol1bis=frac_poly_imp([3,12,2],[3,1,0],1);
    sumpol=frac_poly_imp([4 2 12 6],[3 2 1 0],1);
% (3 s^3 + 12 s + 2) + (s^3 + 2 s^2 + 4) returns the polynomial :
	assertEqual(testCase,plus(pol1bis,pol1),sumpol,'plus(pol1bis,pol1) is not sumpol');
end

%% The classic case : multidimensionnal
function testPlusMIMO(testCase)
    pol1=frac_poly_imp([1,2,4],[3,2,0],1);
    pol1bis=frac_poly_imp([3,12,2],[3,1,0],1);
    pol2=frac_poly_imp([pol1; pol1]);
    pol2bis=frac_poly_imp([pol1bis; pol1bis]);
    pol3=frac_poly_imp([pol2, pol2]);
    pol3bis=frac_poly_imp([pol2bis, pol2bis]);
    sumpol=frac_poly_imp(frac_poly_exp({[4 2 12 6] [4 2 12 6];[4 2 12 6] [4 2 12 6]},{[3 2 1 0] [3 2 1 0];[3 2 1 0] [3 2 1 0]}),[1 1;1 1]);
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
%           pol3 = [                                      ]
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
%
%
%                  [ 3 s^3 + 12 s + 2   3 s^3 + 12 s + 2  ]
%        pol3bis = [                                      ]
%                  [ 3 s^3 + 12 s + 2   3 s^3 + 12 s + 2  ]
% The operation pol3bis + pol3 will return the following 2 by 2 polynomial :
    assertEqual(testCase,plus(pol3bis,pol3),sumpol,'plus(pol3bis,pol3) is not sumpol'); 
end
%% Special Case : NaN polynomial
function testPlusNaN(testCase)
    pol1=frac_poly_imp([1,2,4],[3,2,0],1);
    pol_nan=frac_poly_imp(nan);
% If one of the argument is a NaN polynomial the result is the NaN
% polynomial 
    assertTrue(testCase,isnan(pol1+pol_nan));
    assertTrue(testCase,isnan(pol_nan+pol1));
	assertTrue(testCase,isnan(pol_nan+pol_nan));
end
%% Special Case : Empty polynomial
function testPlusEmpty(testCase)
    pol1=frac_poly_imp([1,2,4],[3,2,0],1);
    pol_vide=frac_poly_imp;
% If both arguments are the empty polynomial the result is the empty
% polynomial
    assertEqual(testCase,pol1+pol_vide,pol1,'pol1+pol_vide is not pol1');
    assertEqual(testCase,pol_vide+pol1,pol1,'pol_vide+pol1 is not pol1');
    assertEmpty(testCase,pol_vide+pol_vide,'pol_vide+pol_vide is not empty'); 
end