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

%% Function-based unit test for frac_fpe_transpose
% Last revision 21/09/2021

function tests = test_fpe_transpose
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testTransposeSISO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol1bis=frac_poly_exp([3,12,2],[3,1,0]);
    pol2=frac_poly_exp([pol1; pol1]);
    pol2bis=frac_poly_exp([pol1bis; pol1bis]);
    pol3=frac_poly_exp([pol2, pol2bis]);
% Lets consider the following polynomial :
%
%               [ s^3 + 2 s^2 + 4   3 s^3 + 12 s + 2  ]
%        pol3 = [                                     ]
%               [ s^3 + 2 s^2 + 4   3 s^3 + 12 s + 2  ]
% Applied to this polynomial the function transpose produces the folowing
% one :
%
%               [ s^3 + 2 s^2 + 4    s^3 + 2 s^2 + 4  ]
%        pol3 = [                                     ]
%               [ 3 s^3 + 12 s + 2  3 s^3 + 12 s + 2  ]
    D=transpose(pol3);
    pol3_exp=frac_poly_exp({[1 2 4] [1 2 4];[3 12 2] [3 12 2]},{[3 2 0] [3 2 0];[3 1 0] [3 1 0]});
    
    assertEqual(testCase,D,pol3_exp,'D is not pol3_exp');
end
%% Special Case : NaN and Empty polynomial
%

% The function clean has no specific effects on the scalar, unidimensionnal,
% empty and NaN polynomial.
