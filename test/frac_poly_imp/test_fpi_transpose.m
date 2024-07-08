%% Description
%
% Test function on :
%          - function : transpose
%          - class    : frac_poly_exp
%
% Prototype :
%        res=transpose(fpe)            
%
% Argument in : 
%   fpe : Frac_poly_exp object
% 
% Argument out :
% 	res : Frac_poly_exp object
% 
% Transposition of fractional explicit polynomial, res = 'fpe
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpi_transpose
% Last revision 10/09/2021

function tests = test_fpi_transpose
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testTransposeSISO(testCase)
    pol1=frac_poly_imp([1,2,4],[3,2,0],2);
    pol1bis=frac_poly_imp([3,12,2],[3,1,0],3);
    pol2=frac_poly_imp([pol1; pol1]);
    pol2bis=frac_poly_imp([pol1bis; pol1bis]);
    pol3=frac_poly_imp([pol2, pol2bis]);
    pol2t=frac_poly_imp([pol1 pol1]);
    pol2tbis=frac_poly_imp([pol1bis pol1bis]);
    pol3t=frac_poly_imp([pol2t; pol2tbis]);
% Lets consider the following polynomial :
%
%               [ (s^3 + 2 s^2 + 4)^2   (3 s^3 + 12 s + 2)^3  ]
%        pol3 = [                                             ]
%               [ (s^3 + 2 s^2 + 4)^2   (3 s^3 + 12 s + 2)^3  ]
%
%
% Applied to this polynomial the function transpose produces the folowing
% one :
%
%               [ (s^3 + 2 s^2 + 4)^2    (s^3 + 2 s^2 + 4)^2  ]
%        pol3 = [                                             ]
%               [ (3 s^3 + 12 s + 2)^3  (3 s^3 + 12 s + 2)^3  ]
    D=transpose(pol3);
    assertEqual(testCase,D,pol3t,'D is not pol3t');
end
%% Special Case : NaN and Empty polynomial
%

% The function clean has no specific effects on the scalar, unidimensionnal,
% empty and NaN polynomial.
