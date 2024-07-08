%% Description
%
% Test function on :
%          - function : fpe
%          - class    : frac_poly_imp
%
% Prototype :
%        res=fpe(fpi)
%
% Argument in : 
%       fpi : Frac_poly_imp object
%
% Argument out :
%       ref : attribute
%
% Returns the attribute fpe of the implicit fractionnal polynomial passed in
% argument.
% It calls get(fpi,'fpe')
% See also get
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpi_fpe
% Last revision 09/09/2021

function tests = test_fpi_fpe
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testFpeSISO(testCase)
    pol_imp=frac_poly_imp(frac_poly_exp([1,2,1],[3,2,0]),3);
    pol_exp = frac_poly_exp([1,2,1],[3,2,0]);
    pol_fpe = fpe(pol_imp);
    
    assertEqual(testCase,pol_fpe,pol_exp,'pol_fpe is not pol_exp');
end
%% The classic case : multidimensionnal
function testFpeMIMO(testCase)
    pol_multi=frac_poly_imp(frac_poly_exp({[1,4] [2,5]; [1,4] [2,5]},{[0.2,0] [3.5 1.5]; [0.2,0] [3.5 1.5]}),[3, 0.6 ; 0.3, 0.5]);
    pol_multi_fpe = fpe(pol_multi);
    pol_multi_exp = frac_poly_exp({[1,4] [2,5]; [1,4] [2,5]},{[0.2,0] [3.5 1.5]; [0.2,0] [3.5 1.5]});

    assertEqual(testCase,pol_multi_fpe,pol_multi_exp,'pol_multi_fpe is not pol_multi_exp');
% The function fpe returns a frac_poly_imp of the same dimension.
end

%% Special Case : NaN polynomial
function testFpeNaN(testCase)
    pol_nan=frac_poly_imp(nan);
    pol_nan_fpe = fpe(pol_nan);
    pol_nan_exp = frac_poly_exp(nan);
    
    assertEqual(testCase,pol_nan_fpe,pol_nan_exp,'pol_nan_fpe is not pol_nan_exp');
% pol_nan.fpe returns the NaN frac_poly_imp
end
%% Special Case : Empty polynomial
function testFpeEmpty(testCase)
    pol_vide=frac_poly_imp;
    pol_vide_fpe = fpe(pol_vide);
    pol_vide_exp = frac_poly_exp;
    
    assertEqual(testCase,pol_vide_fpe,pol_vide_exp,'pol_vide_fpe is not pol_vide_exp');
% pol_vide.fpe returns the empty frac_poly_imp.
end