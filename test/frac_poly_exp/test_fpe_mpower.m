%% Description
%
% Test function on :
%          - function : mpower
%          - class    : frac_poly_exp
%
% Prototype :
%        res=mpower(fpe,r)            
%
% Argument in : 
%   fpe : Frac_poly_exp object
%   r   : Scalar
% 
% Argument out :
% 	res : Frac_poly_exp object
% 
% Realize the opration (fpe)^r.
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpe_mpower
% Last revision 14/09/2021

function tests = test_fpe_mpower
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testMpowerSISO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
% Let's Calaculate (s^3 + 2 s^2 + 4)^2
    mpol=mpower(pol1,2);
    mpol_exp = frac_poly_exp([1 4 4 8 16 16],[6 5 4 3 2 0]);
    
    assertEqual(testCase,mpol,mpol_exp,'mpol is not mpol_exp');
end
%% The classic case : multidimensionnal
function testMpowerMIMO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol2=frac_poly_exp([pol1; pol1]);
    pol3=frac_poly_exp([pol2, pol2]);
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
%           pol3 = [                                      ]
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]

% Let's calaculate :
%                  [ (s^3 + 2 s^2 + 4)^2   (s^3 + 2 s^2 + 4)^2  ]
%                  [                                            ]
%                  [ (s^3 + 2 s^2 + 4)^2   (s^3 + 2 s^2 + 4)^2  ]
    mpol2=mpower(pol3,2);
    mpol2_exp=frac_poly_exp({[1 4 4 8 16 16] [1 4 4 8 16 16];[1 4 4 8 16 16] [1 4 4 8 16 16]},{[6 5 4 3 2 0] [6 5 4 3 2 0];[6 5 4 3 2 0] [6 5 4 3 2 0]});
    mpol0=mpower(pol3,0);
        
    assertEqual(testCase,mpol0,frac_poly_exp(1,0));
    assertEqual(testCase,mpol2,mpol2_exp,'mpol2 is not mpol2_exp');
end
%% Special Case : NaN and Empty polynomial
function testMpowerNaNEmpty(testCase)
    pol_nan=frac_poly_exp(nan);
    pol_vide=frac_poly_exp;
% By convention,
%   - (NaN)^r is the NaN polynomial
%   - (Empty)^r is the Empty polynomial
	assertTrue(testCase,isnan(mpower(pol_nan, 2)));
    assertEmpty(testCase,mpower(pol_vide, 2));
end