%% Description test_fpi
%
% Test function on :
%          - function : frac_poly_imp (constructor)
%          - class    : frac_poly_imp
%
%
% Arguments in:
%   Various arguments in are possible, see next
%
% Argument out:
%   obj : frac_poly_imp object.
%
% As being a constructor, this function creates a specimen of a
% frac_poly_imp containing te folowing attributes :
%           - fpe (See frac_poly_imp)
%           - imp_order
% 
%   Copyright © CRONE

%% Function-based unit test for frac_fpi constructor
% Last revision 06/09/2021

function tests = test_fpi
    tests = functiontests(localfunctions);
end

%% Test of the various case of argument in (1)
% Number of argin : 0
% 
% If no argin an empty polynomial is created
function testSysArgin0(testCase)
    P_empty=frac_poly_imp;
    assertEmpty(testCase, get(P_empty,'imp_order'), 'imp_order is not empty');
end

%% Test of the various case of argument in (2)
% Number of argin : 1
% Type : NaN
% 
% If the argin is NaN, a NaN polynomial is created
function testFpeArginNan(testCase)
    P_NaN = frac_poly_imp(nan);
    
    assertEqual(testCase,get(P_NaN,'coef'),{nan},'coef is not nan');
    assertEqual(testCase,get(P_NaN,'order'),{0},'order is not 0');
    assertEqual(testCase,get(P_NaN,'imp_order'),1,'imp_order is not 1');
end
%% Test of the various case of argument in (3)
% Number of argin : 2
% Type : scalar, NaN
% 
% In addition, if any of the arguments contain
% a NaN the function frac_poly_exp(NaN) will be called
function testFpeArginNan2(testCase)
    P_NaN2 = frac_poly_imp(1,NaN);

    assertEqual(testCase,get(P_NaN2, 'imp_order'),NaN,'imp_order is not nan');
end


%% Test of the various case of argument in (4)
% Number of argin : 1
% Type : scalar
function testFpeArgin1(testCase)
% The scalar is considered as the coefficient argument
    P_scalar=frac_poly_imp(3);
    % with the folowing attributes
    assertEqual(testCase,get(P_scalar,'coef'),{3},'coef is not 3');
    assertEqual(testCase,get(P_scalar,'order'),{0},'order is not 0');
	assertEqual(testCase,get(P_scalar, 'imp_order'),1,'imp_order is not 1');
end


%% Test of the various case of argument in (5)
% Number of argin : 2
% Type : scalar
function testFpeArgin2(testCase) 
% The scalars are considered as the coefficient argument and the implicit 
% order argument
    P_scalar2 = frac_poly_imp(1, 0.5);
% with the following attributes
    assertEqual(testCase,get(P_scalar2,'coef'),{1},'coef is not 1');
    assertEqual(testCase,get(P_scalar2,'order'),{0},'order is not 0');
	assertEqual(testCase,get(P_scalar2, 'imp_order'),0.5,'imp_order is not 0.5');
end

%% Test of the various case of argument in (6)
% Number of argin : 1
% Type : frac_poly_exp
function testFpeArgin3(testCase)
% This case produces a frac_poly_imp with the frac_poly_exp and the
% implicit order is forced at 1.
    polexp=frac_poly_exp([1 2 3],[2 1 0]);
    P_exp = frac_poly_imp(polexp);
% with the same attributes    
    assertEqual(testCase,get(P_exp,'coef'),get(polexp,'coef'),'coef is not [1 2 3]');
    assertEqual(testCase,get(P_exp,'order'),get(polexp,'order'),'order is not [2 1 0]');
	assertEqual(testCase,get(P_exp, 'imp_order'),1,'imp_order is not 1');
end

%% Test of the various case of argument in (7)
% Number of argin : 1
% Type : frac_poly_imp
function testFpi2Fpe(testCase)
% This case produce gets the fpe in the fpi
    polexp=frac_poly_exp([1 2 3],[2 1 0]);
    P_exp = frac_poly_imp(polexp);
    P_copy = frac_poly_exp(P_exp);
% with the same attributes
    assertEqual(testCase,P_copy,polexp,'P_copy is not polexp');
end

%% Test of the various case of argument in (8)
% Number of argin : 2
% Type : fpe, scalar
function testFpiArginFpe(testCase)
% The first argument being the fpe and the second the implicit order
    polexp=frac_poly_exp([1 2 3],[2 1 0]);    
    P=frac_poly_imp(polexp,3);
% with the attributes
    assertEqual(testCase,get(P,'coef'),get(polexp,'coef'),'coef is not [1 2 3]');
    assertEqual(testCase,get(P,'order'),get(polexp,'order'),'order is not [2 1 0]');
	assertEqual(testCase,get(P, 'imp_order'),3,'imp_order is not 3');
end