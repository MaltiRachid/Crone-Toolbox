%% Description
%
% Test function on :
%        - function : sort
%        - class    : frac_poly_exp
%
% Prototype :
%        Q = sort(P)
% 
% Argument in: 
%        P: frac_poly_exp object
% 
% Argument out:
%        Q: frac_poly_exp object
%
% Sorts the orders of an explicit fractional polynomial in the descending
% order, adds the coefficient with the same order.
%
%   Copyright © CRONE 

%% Function-based unit test for frac_fpe_sort
% Last revision 21/09/2021

function tests = test_fpe_sort
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testSortSISO(testCase)
% The polynomial is given with the folowing order :
% s^0.5 + 2s^0.2 + 3s^6 + 0s^12 + 2s^3 - 1s^0.2
    pol=frac_poly_exp([1 2 3 -3 2 -1],[0.5 0.2 6 0.5 3 0.2]);
    pol_exp=frac_poly_exp([3 2 -2 1],[6 3 0.5 0.2]);
    
    assertEqual(testCase,sort(pol),pol_exp,'sort(pol) is not pol_exp');
end
%
% The function sort returns the simplified and ordered polynomial :

%% The classic case : multidimensionnal
%

% Sorting a multidimensionnal polynomial returns an equal size polynomial
% compound of unidimensionnal polynomial treaten as in the previous case

%% Specific Case : Scalar, Empty and NaN polynomials
%

% The function sort has no specific effects on the scalar, empty and NaN
% polynomial.