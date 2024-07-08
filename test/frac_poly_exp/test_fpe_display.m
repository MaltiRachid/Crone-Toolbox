%% Description
%
% Test function on :
%          - function : display
%          - class    : frac_poly_exp
%
% Prototype :
%        s=display(fpe)             
%
% Argument in : 
%   fpe : Frac_poly_exp object
%
% Argument out :
%   chaine s
%
% Print the object to the screen.

%% Function-based unit test for frac_fpe_display
% Last revision 14/09/2021

function tests = test_fpe_display
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testDisplaySISO(testCase)
%the case that all coefficients are real
    pol=frac_poly_exp([1,2,1],[3,2,0]);
    display(pol);
% the case that some complex coefficients exist
    pol_complex=frac_poly_exp([2,0.2,1.7-1i],[3,2+1i,0.5+1i]);
    display(pol_complex);
end
%% The classic case : multidimensionnal
function testDisplayMIMO(testCase)
    pol_multi=frac_poly_exp({[1,4] [2,5-1i];[1,4] [2.125,5+1i]},{[0.2,0] [3.5 1.5]; [0.2,0] [3.5 1.5]});
    display(pol_multi);

% The function print the transfer function from each input
% to each output with the following presentation
end
%% Special Case : NaN polynomial
function testDisplayNaN(testCase)
    pol_nan=frac_poly_exp(nan);
    display(pol_nan);

    pol=frac_poly_exp([1,2,1],[3,2,0]);
    pol_complex=frac_poly_exp([2,0.2,1.7-1i],[3,2+1i,0.5+1i]);
    pol_multi_nan=[pol pol_complex;pol_nan pol];
    display(pol_multi_nan);
end
%% Special Case : Empty polynomial
function testDisplayEmpty(testCase)
    pol_vide=frac_poly_exp;
    display(pol_vide);
end