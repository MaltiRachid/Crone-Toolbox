%% Description
%
% Test function on :
%          - function : subsref
%          - class    : frac_poly_exp
%
% Prototype :
%        ref=subsref(fpe,index)
%
% Argument in : 
%     fpe   : Frac_poly_exp object
%     index : a strucuture containing two attribute : type and subs
%
% Argument out :
%       ref : attribute if index.type is '.'
%       ref : fpe if index.type is '()'
%
% This function deliver two type of result
%       - if index.type = '.' the result is the attribute specified by
%         index.subs.
%               Ex : fpe.order
%
%       - if index.type = '()' the result is a sigle dimensionned fpe
%         componing a multidimensionnal one at the place specified by index.subs. 
%               Ex : fpe(i,j)
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpe_subsref
% Last revision 21/09/2021

function tests = test_fpe_subsref
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testSubsrefSISO(testCase)
    pol=frac_poly_exp([1,2,1],[3,2,0]);
    % The coefficient :
    coef=pol.coef;
    coef=coef{1};
    assertEqual(testCase,coef,[1 2 1],'coef is not [1 2 1]');
    
    % The orders :
    order=pol.order;
    order=order{1};
    assertEqual(testCase,order,[3 2 0],'order is not [3 2 0]');
    
    kikou = pol(1);
    assertEqual(testCase,kikou,pol,'kikou is not pol');
end

%% The classic case : multidimensionnal
function testSubsrefMIMO(testCase)
    pol=frac_poly_exp([1,2,1],[3,2,0]);
% Consider a 2 by 2 polynomial
    pol_multi=enlarge(pol,2,2);
% Quick access to a single polynomial
    assertEqual(testCase,pol_multi(1,2),pol,'pol_multi(1,2) is not pol');

% Quick access to an attribute (the result is a 2 x 2 cell
    assertEqual(testCase,pol_multi.order,{[3 2 0] [3 2 0];[3 2 0] [3 2 0]},'pol_multi.order is not {[3 2 0] [3 2 0];[3 2 0] [3 2 0]}');
end