%% Description
%
% Test function on :
%          - function : display
%          - class    : frac_poly_imp
%
% Prototype :
%        display(fpi)             
%
% Argument in : 
%   fpe : Frac_poly_imp object
%
% Argument out :
%   none
%
% Display Print the object to the screen.

%% Function-based unit test for frac_fpi_display
% Last revision 09/09/2021

function tests = test_fpi_display
    tests = functiontests(localfunctions);
end
%% The classic case : unidimensionnal
function testDisp1(testCase)
    pol=frac_poly_imp(frac_poly_exp([1,2,1],[3,2,0]),4);
    display(pol);
end
%% The classic case : multidimensionnal
function testDisp2(testCase)
    pol_multi=frac_poly_imp(frac_poly_exp({[1,4] [2,5];[1,4] [2,5]},{[0.2,0] [3.5 1.5]; [0.2,0] [3.5 1.5]}),[1 2; 3 4]);
    display(pol_multi);
end
% The function print the transfer function from each input
% to each output with the following presentation

%% Special Case : NaN polynomial
function testDispNaN(testCase)
    pol_nan=frac_poly_imp(nan);
    display(pol_nan);
end
% display(pol_nan) display :

%% Special Case : Empty polynomial
function testDispEmpty(testCase)
    pol_vide=frac_poly_imp;
    display(pol_vide);
end
% display(pol_vide) display :