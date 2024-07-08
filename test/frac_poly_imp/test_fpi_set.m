%% Description
%
% Test function on :
%          - function : set
%          - class    : frac_poly_imp
%
% Prototype :
%        fpe=set(fpi, field, valor)
%
% Argument in : 
%       fpi   : Frac_poly_imp object
%       field : the attribute to be changed
%       valor : the new valor
%
% Argument out :
%       fpi: object
%
% Permits the modification of the fields
%
%   Copyright © CRONE

%% Function-based unit test for frac_fpi_set
% Last revision 10/09/2021

function tests = test_fpi_set
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testSetSISO(testCase)
    pol=frac_poly_imp(frac_poly_exp([1,2,1],[3,2,0]),3);
% The implicit order :
    set(pol,'imp_order',4);
    assertEqual(testCase,get(pol,'imp_order'),4,'get(pol,''imp_order'') is not 4');
% The explicit fractional polynomial :
    set(pol,'fpe',frac_poly_exp([6,4,2],[2 1 0]))
    assertEqual(testCase,get(pol,'fpe'),frac_poly_exp([6,4,2],[2 1 0]),'fpe is not frac_poly_exp([6,4,2],[2 1 0])');
    
    set(pol,'coef',{[16,14,12]})
    assertEqual(testCase,get(pol,'coef'),{[16 14 12]},'coef is not {[16 14 12]}');
    
    set(pol,'order',{[16,14,12]})
    assertEqual(testCase,get(pol,'order'),{[16 14 12]},'order is not {[16 14 12]}');
end