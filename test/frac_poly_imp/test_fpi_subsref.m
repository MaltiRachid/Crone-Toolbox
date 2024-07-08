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

%% Function-based unit test for frac_fpi_subsref
% Last revision 10/09/2021

function tests = test_fpi_subsref
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testSubsrefSISO(testCase)
    pol=frac_poly_imp(frac_poly_exp([1,2,1],[3,2,0]),0.5);

% The coefficient :
    coef=pol.fpe;
    assertEqual(testCase,coef,get(pol,'fpe'),'coef is not fpe');
    coef=coef(1);
    assertEqual(testCase,coef,get(pol,'fpe'),'coef is not fpe');
% The orders :
    order=pol.imp_order;
    assertEqual(testCase,order,get(pol,'imp_order'),'order is not imp_order');
    order=order(1);
    assertEqual(testCase,order,get(pol,'imp_order'),'order is not imp_order');
end

%% The classic case : multidimensionnal
function testSubsrefMIMO(testCase)
    pol=frac_poly_imp(frac_poly_exp([1,2,1],[3,2,0]),0.5);
% Consider a 2 by 2 polynomial
    pol_multi=enlarge(pol,2,3);
    assertEqual(testCase,class(pol_multi),'frac_poly_imp','class(pol_multi) is not frac_poly_imp');
    
% Quick access to a single polynomial
    assertEqual(testCase,pol_multi(1,2),pol,'pol_multi(1,2) is not pol');
    assertEqual(testCase,pol_multi(1,3),pol,'pol_multi(1,3) is not pol');
    assertEqual(testCase,pol_multi(2,1),pol,'pol_multi(2,1) is not pol');

% Quick access to an attribute (the result is a 2 x 2 cell
    assertEqual(testCase,get(pol_multi,'imp_order'),[0.5 0.5 0.5;0.5 0.5 0.5],'get(pol_multi,''imp_order'') is not [0.5 0.5 0.5;0.5 0.5 0.5]');

%% Test :
    sys = pol_multi(:);
    multipol=frac_poly_imp(frac_poly_exp({[1 2 1];[1 2 1];[1 2 1];[1 2 1];[1 2 1];[1 2 1]},{[3 2 0];[3 2 0];[3 2 0];[3 2 0];[3 2 0];[3 2 0]}),[0.5;0.5;0.5;0.5;0.5;0.5]);
    assertEqual(testCase,sys,multipol,'sys is not multipol');
end