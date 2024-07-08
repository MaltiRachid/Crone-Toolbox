%% Description
%
% Test function on :
%          - function : enlarge
%          - class    : frac_poly_exp
%
% Prototype :
%        res=enlarge(fpe,m,n)            
%
% Argument in : 
%   fpe : Frac_poly_exp object
%   m   : double
%   n   : double
%
% Argument out :
% 	res : Frac_poly_exp object
% 
% This function used on a SISO polynomial duplicate him in order to form a
% m by n polynomial componed of this SISO polynomial.
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpe_enlarge
% Last revision 14/09/2021

function tests = test_fpe_enlarge
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testEnlargeSISO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
% Let's make a 2 by 2 polynomial with this SISO one
% The result will be :
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
%           pol3 = [                                      ]
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
    pol3=enlarge(pol1,2,2);
    assertEqual(testCase,pol3,[pol1 pol1; pol1 pol1],'pol3 is not [pol1 pol1; pol1 pol1]'); 
end

%% Special Case : NaN polynomial
function testEnlargeNaN(testCase)
    pol_nan=frac_poly_exp(nan);
% If the argument is a NaN polynomial the result is the NaN
% polynomial whateve m and n
    pol_en=enlarge(pol_nan,3,3);
    assertEqual(testCase,pol_en,[pol_nan pol_nan pol_nan;pol_nan pol_nan pol_nan;pol_nan pol_nan pol_nan],'enlarge(pol_nan,3,3) is not ok');
end
%% Special Case : Empty polynomial
function testEnlargeEmpty(testCase)
    pol_vide=frac_poly_exp;
% If the arguments is the empty polynomial the result is the empty
% polynomial whateve m and n
    pol_en=enlarge(pol_vide,5,9);
    [n,m]=size(pol_en);
    assertTrue(testCase,isempty(pol_en),'enlarge(pol_vide,5,9) is not empty');
    assertEqual(testCase,[n m],[0 0],'[n m] is not [5 9]');
end
