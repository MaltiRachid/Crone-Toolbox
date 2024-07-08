%% Description
%
% Test function on :
%          - function : mpower
%          - class    : frac_poly_imp
%
% Prototype :
%        res=mpower(fpi,r)            
%
% Argument in : 
%   fpi : Frac_poly_imp object
%   r   : Scalar
% 
% Argument out :
% 	res : Frac_poly_imp object
% 
% Realize the opration (fpi)^r.
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpi_mpower
% Last revision 09/09/2021

function tests = test_fpi_mpower
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testMpowerSISO(testCase)
    pol1=frac_poly_imp([1,2,4],[3,2,0],1);
    pol2=frac_poly_imp([1,2,4],[3,2,0],3);
% Only the polynomial with an implicit order equal to one will be
% calculated.
    assertEqual(testCase,mpower(pol1,2),frac_poly_imp([1 4 4 8 16 16],[6 5 4 3 2 0],1),'mpower(pol1,2) is not pol2^2');
    assertEmpty(testCase,mpower(pol2,2),'mpower(pol2,2) is not empty');
end
%% The classic case : multidimensionnal
function testMpowerMIMO(testCase)
    pol1=frac_poly_imp([1,2,4],[3,2,0],1);
    pol3=enlarge(pol1,2,2);
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
%           pol3 = [                                      ]
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
%
%
% Let's calculate :
%
%                  [ (s^3 + 2 s^2 + 4)^2   (s^3 + 2 s^2 + 4)^2  ]
%                  [                                            ]
%                  [ (s^3 + 2 s^2 + 4)^2   (s^3 + 2 s^2 + 4)^2  ]
    polpow=frac_poly_imp(frac_poly_exp({[1 4 4 8 16 16] [1 4 4 8 16 16];[1 4 4 8 16 16] [1 4 4 8 16 16]},{[6 5 4 3 2 0] [6 5 4 3 2 0];[6 5 4 3 2 0] [6 5 4 3 2 0]}),[1 1;1 1]);
    assertEqual(testCase,mpower(pol3,2),polpow,'mpower(pol3,2) is not polpow');
end

%% Special Case : NaN and Empty polynomial
function testMpowerNaNEmpty(testCase)
    pol_nan=frac_poly_imp(nan);
    pol_vide=frac_poly_imp;
% By convention,
%   - (NaN)^r is the NaN polynomial
%   - (Empty)^r is the Empty polynomial
    assertTrue(testCase,isnan(mpower(pol_nan, 2)));
	assertEmpty(testCase,mpower(pol_vide, 2),'mpower(pol_vide,2) is not empty');
end