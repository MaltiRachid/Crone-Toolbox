%% Description
%
% Test function on :
%          - function : char
%          - class    : frac_poly_exp
%
% Prototype :
%        st = char(fpe)             
%
% Argument in : 
%   fpe : a variable number of frac_poly_exp (fpe)
%
% Argument out :
%   st : string
%
% Char Convert explicit fractionnal polynomial to string.

%% Function-based unit test for frac_fpe_char
% Last revision 13/09/2021

function tests = test_fpe_char
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testCharSISO(testCase)
    pol=frac_poly_exp([1,2,1],[3,2,0]);
    spol=char(pol);
    
    assertEqual(testCase,spol,'s^3 + 2 s^2 + 1','spol is not the good string for pol');
end
%% The classic case : multidimensionnal
function testCharMIMO(testCase)
    pol_multi=frac_poly_exp({[1,4] [2,5];[1,4] [2,5]},{[0.2,0] [3.5 1.5]; [0.2,0] [3.5 1.5]});
    spol=char(pol_multi);

    assertEqual(testCase,spol,{'s^0.2 + 4' '2 s^3.5 + 5 s^1.5';'s^0.2 + 4' '2 s^3.5 + 5 s^1.5'},'spol is not the good string for pol');
% The function char returns a cell-array of the same dimension, each cell
% containing a string (see also multi)
end
%% Special Case : NaN polynomial
function testCharNaN(testCase)
    pol_nan=frac_poly_exp(nan);
    spol=char(pol_nan);

    assertEqual(testCase,spol,' the object is NaN ','spol is not ''NaN''');
% char(pol_nan) returns the string : 'NaN'
end
%% Special Case : Empty polynomial
function testCharEmpty(testCase)
    pol_vide=frac_poly_exp;
    spol=char(pol_vide);

    assertEmpty(testCase,spol,'spol is not empty');
% char(pol_vide) returns an empty string ' '
end