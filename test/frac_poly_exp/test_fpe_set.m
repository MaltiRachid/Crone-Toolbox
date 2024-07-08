%% Description
%
% Test function on :
%          - function : set
%          - class    : frac_poly_exp
%
% Prototype :
%        fpe=set(fpe, field, valor)
%
% Argument in : 
%       fpe   : Frac_poly_exp object
%       field : the attribute to be changed
%       valor : the new valor
%
% Argument out :
%       fpe: object
%
% Permits the modification of the fields
%
%   Copyright © CRONE

%% Function-based unit test for frac_fpe_set
% Last revision 21/09/2021

function tests = test_fpe_set
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testSetSISO(testCase)
    pol=frac_poly_exp([1,2,1],[3,2,0]);
    pol_exp=frac_poly_exp([2,1,2],[6,4,2]);
    
    assertNotEqual(testCase,pol,pol_exp,'pol is pol_exp');
% The coefficient :
    pol=set(pol,'coef',[2,1,2]);
% The orders :
    pol=set(pol,'order',[6,4,2]);
    
    assertEqual(testCase,pol,pol_exp,'pol is not pol_exp');
end