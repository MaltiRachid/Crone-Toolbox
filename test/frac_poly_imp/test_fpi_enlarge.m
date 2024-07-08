%% Description
%
% Test function on :
%          - function : enlarge
%          - class    : frac_poly_imp
%
% Prototype :
%        res=enlarge(fpi,m,n)            
%
% Argument in : 
%   fpi : Frac_poly_imp object
%   m   : double
%   n   : double
%
% Argument out :
% 	res : Frac_poly_imp object
% 
% This function used on a SISO polynomial duplicate him in order to form a
% m by n polynomial componed of this SISO polynomial.
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpi_enlarge
% Last revision 09/09/2021

function tests = test_fpi_enlarge
    tests = functiontests(localfunctions);
end
%% The classic case : unidimensionnal
function testEnlargeSISO(testCase)
    pol1=frac_poly_imp(frac_poly_exp([1,2,4],[3,2,0]),3);
    pol3=enlarge(pol1,2,2);
% Let's make a 2 by 2 polynomial with this SISO one
% The result will be :
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
%           pol3 = [                                      ]
%                  [ s^3 + 2 s^2 + 4     s^3 + 2 s^2 + 4  ]
%
    assertEqual(testCase,pol3,[pol1 pol1; pol1 pol1],'pol3 is not [pol1 pol1; pol1 pol1]'); 
end

%% Special Case : NaN polynomial
function testEnlargeNaN(testCase)
    pol_nan=frac_poly_imp(nan);
% If the argument is a NaN polynomial the result is the NaN
% polynomial whateve m and n
    epol=enlarge(pol_nan,3,4);
    pol_mnan = [frac_poly_imp(nan,nan) frac_poly_imp(nan,nan) frac_poly_imp(nan,nan) frac_poly_imp(nan,nan); frac_poly_imp(nan,nan) frac_poly_imp(nan,nan) frac_poly_imp(nan,nan) frac_poly_imp(nan,nan); frac_poly_imp(nan,nan) frac_poly_imp(nan,nan) frac_poly_imp(nan,nan) frac_poly_imp(nan,nan)];
    
    assertEqual(testCase,epol,pol_mnan,'epol is not a nan-fpi');
end

%% Special Case : Empty polynomial
function testEnlargeEmpty(testCase)
    pol_vide=frac_poly_imp;
% If the arguments is the empty polynomial the result is the empty
% polynomial whatever m and n
    epol=enlarge(pol_vide,2,3);
    
    assertEmpty(testCase,epol,'epol is not empty');
end
