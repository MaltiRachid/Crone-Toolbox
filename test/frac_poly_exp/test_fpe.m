%% frac_poly_exp  --  (class frac_poly_exp - Constructor)
%
% Creates a frac_poly_exp object (constructor) containing the following 
% attributes:
%
%     - coef
%     - order
%
%   Syntax
%    frac_poly_exp()
%    frac_poly_exp(NaN)
%    frac_poly_exp(a)       
%    frac_poly_exp(fpe)      
%    frac_poly_exp({a, b})   
%    frac_poly_exp([coef], [order])
%    frac_poly_exp({coef_1, coef_2, ...}, {order_1, oreder_2, ...})
%
% Returns the attributes passed in the argument prop_name. 
% 
%   Copyright (C) CRONE
%% Function-based unit test for frac_fpe constructor
% Last revision 06/09/2021

function tests = test_fpe
    tests = functiontests(localfunctions);
end

function testFpeArgin0(testCase)
    sys1 = frac_poly_exp;

    assertEmpty(testCase, get(sys1,'coef'), 'coef is not empty');
    assertEmpty(testCase, get(sys1,'order'), 'order is not empty');
end

function testFpeArginNan(testCase)
    sysNaN = frac_poly_exp(NaN);
    
    assertEqual(testCase,get(sysNaN,'coef'),{NaN},'coef is not NaN');
    assertEqual(testCase,get(sysNaN,'order'),{0},'order is not 0');
end

%% Création de la classe à partir d'un double
function testFpeArgin1(testCase)
    sys1 = frac_poly_exp(1);
    
    assertEqual(testCase,get(sys1,'coef'),{1},'coef is not 1');
    assertEqual(testCase,get(sys1,'order'),{0},'order is not 0');
    
end

%% Conversion d'un fpi en un fpe
function testFpi2Fpe(testCase)
    sys2 = frac_poly_exp([2 5],[0.2  1.2]);
    
    assertEqual(testCase,get(sys2,'coef'),{[5 2]},'coef is not [5 2]');
    assertEqual(testCase,get(sys2,'order'),{[1.2 0.2]},'order is not [0.2 1.2]');
    
    sys3 = frac_poly_imp(sys2, 2.5);
    assertEqual(testCase,get(sys3,'coef'),get(sys2,'coef'),'coef is not [2 5]');
    assertEqual(testCase,get(sys3,'order'),get(sys2,'order'),'order is not [0.2 1.2]');
    assertEqual(testCase,get(sys3,'imp_order'),2.5,'imp_order is not 2.5');
    
    sys4 = frac_poly_exp(sys3);    
    assertEqual(testCase,get(sys4,'coef'),get(sys3,'coef'),'coef is not [2 5]');
    assertEqual(testCase,get(sys4,'order'),get(sys3,'order'),'order is not [0.2 1.2]'); 
end
%% Création de la classe à partir de deux double
function testFpeArgin2(testCase)
    sys1 = frac_poly_exp(1, 0.5);
    
    assertEqual(testCase,get(sys1,'coef'),{1},'coef is not 1');
    assertEqual(testCase,get(sys1,'order'),{0.5},'order is not 0.5');
end

%% Création à partir d'un frac_poly_exp (1 argument)
function testFpeArgin3(testCase)    
    fpe = frac_poly_exp([1 2],[0.5  0.1]);
    
    assertEqual(testCase,get(fpe,'coef'),{[1 2]},'coef is not [1 2]');
    assertEqual(testCase,get(fpe,'order'),{[0.5 0.1]},'order is not [0.5 0.1]');
end

%% Création à partir d'un frac_poly_exp (1 argument, neutre)
function testFpeArgin4(testCase)
    fpe = frac_poly_exp([1 2],[0.5  0.1]);
    fpe2 = frac_poly_exp(fpe);

    assertEqual(testCase,get(fpe2,'coef'),get(fpe,'coef'),'coef is not [1 2]');
    assertEqual(testCase,get(fpe2,'order'),get(fpe,'order'),'order is not [0.5 0.1]');
end
%% Création à partir d'un frac_poly_exp (2 arguments)
function testFpeArginMimo(testCase)
    fpe = frac_poly_exp([1 2],[0.5  0.1]);
    fpe2 = frac_poly_exp([1 2 1 ],[1 0.5  0.1]);
    fpeMimo = [fpe, fpe2; fpe2, fpe];
    
    assertEqual(testCase,get(fpeMimo,'coef'),[get(fpe,'coef'),get(fpe2,'coef');get(fpe2,'coef'),get(fpe,'coef')],'coefMimo is not ok');
    assertEqual(testCase,get(fpeMimo,'order'),[get(fpe,'order'),get(fpe2,'order');get(fpe2,'order'),get(fpe,'order')],'orderMimo is not ok');
end

%% frac_poly_exp(NaN)
function testFpeNan2(testCase)
% Moreover, if any of the arguments contains a NaN the function 
% frac_poly_exp(NaN) will be called
    P_NaN2=frac_poly_exp([1,1],[NaN,0]);
	assertEqual(testCase,get(P_NaN2, 'coef'),{[1 1]}, 'coef is not [1 1]');
    assertEqual(testCase,get(P_NaN2, 'order'),{[nan 0]}, 'order is not [nan 0]');
end

%% frac_poly_exp({coef_1, coef_2, ...}, {order_1, oreder_2, ...})
% Cell array of row vector produce a multidimensionnal polynomial with the dimension of the 
% cell array
function testFpeArginMimo0(testCase)
    P_multi=frac_poly_exp({[1,4] [2,5]},{[0.2,0] [3.5 1.5]});
% with the attributes
    assertEqual(testCase,get(P_multi,'coef'),{[1 4] [2 5]},'coef is not {[1 4] [2 5]}');
    assertEqual(testCase,get(P_multi,'order'),{[0.2,0] [3.5 1.5]},'order is not {[0.2,0] [3.5 1.5]}');
% le cas de nan
    P_multi_nan = frac_poly_exp({[1 2 3], [3 2 1];[nan 8 9], [3 2 1]}, {[ 4 5 6], [7 8 9];[ 4 5 6], [6 5 4]});
    
    assertEqual(testCase,get(P_multi_nan,'coef'),{[3 2 1], [3 2 1];[nan 8 9], [3 2 1]},'coef is not {[3 2 1], [3 2 1];[nan 8 9], [3 2 1]}');
    assertEqual(testCase,get(P_multi_nan,'order'),{[6 5 4], [7 8 9];[ 4 5 6], [6 5 4]},'order is not {[6 5 4], [7 8 9];[ 4 5 6], [6 5 4]}');
end
