%% Description
%
% Test function on :
%          - function : char
%          - class    : frac_poly_imp
%
% Prototype :
%        st = char(fpi)             
%
% Argument in : 
%   fpe : a variable number of frac_poly_imp (fpi)
%
% Argument out :
%   st : string
%
% Char Convert explicit fractionnal polynomial to string.

%% Function-based unit test for frac_fpi_char
% Last revision 09/09/2021

function tests = test_fpi_char
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testCharSISO(testCase)
    pol=frac_poly_imp(frac_poly_exp([1,2,1],[3,2,0]),3);
    spol=char(pol);
    
    assertEqual(testCase,spol,'( s^3 + 2 s^2 + 1 )^3 ','spol is not the good string for pol'); 
end
%% The classic case : multidimensionnal
function testCharMIMO(testCase)
    pol_multi=frac_poly_imp(frac_poly_exp({[1, 4 ,2, 5];[1,4, 2,5]},{[0.2,0, 3.5, 1.5]; [0.2,0, 3.5 1.5]}),[3; 1]);
    spol=char(pol_multi);
    
    assertEqual(testCase,spol, {'( 2 s^3.5 + 5 s^1.5 + s^0.2 + 4 )^3 ';' 2 s^3.5 + 5 s^1.5 + s^0.2 + 4  '},'spol is not the good string for pol');
end

% The function char returns a cell-array of the same dimension, each cell
% containing a string (see also multi)

%% Special Case : NaN polynomial
function testCharNaN(testCase)
    pol_nan=frac_poly_imp(nan);
    spol=char(pol_nan);
    
    assertEqual(testCase,spol,'Frac_poly_imp objet is nan','spol is not the good string for pol');
end

% char(pol_nan) returns the string : 'NaN'

%% Special Case : Empty polynomial
function testCharEmpty(testCase)
    pol_vide=frac_poly_imp;
    spol=char(pol_vide);
    
    assertEqual(testCase,spol,'','spol is not the good string for pol');
end

% char(pol_vide) returns an empty string ' '