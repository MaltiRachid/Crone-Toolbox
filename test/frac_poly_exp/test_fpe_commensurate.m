%% Description
%
% Test function on :
%          - function : commensurate
%          - class    : frac_poly_exp
%
% Prototype :
%        res=commensurate(fpe)            
%
% Argument in : 
%   fpe : Frac_poly_exp object
% 
% Argument out :
%   step_order : commun non integer step (scalar)
% 	new_order : new order vector of p (vector or cell of vector)
% 
% Commensurate computes the commun factor of the order vector and
% returns the integer vector with the commun factor step_order.

%% Function-based unit test for frac_fpe_commensurate
% Last revision 13/09/2021

function tests = test_fpe_commensurate
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testCommensurateSISO(testCase)
    pol1=frac_poly_exp([30,5,1,1],[0.2,0.04,0.8,1.2]);
    [step_order, new_order, coefficients]=commensurate(pol1);
    
    assertEqual(testCase,step_order,0.04,'step_order is not 0.04');
    assertEqual(testCase,new_order,{[30 20 5 1]},'new_order is not {[30 20 5 1]}');
    assertEqual(testCase,coefficients,{[1 1 30 5]},'coefficients is not{[1 1 30 5]}');
end

%% Unidimentionnal
function testCommensurateSISO2(testCase)
    fpi1=frac_poly_imp([2 1 -1 ],[3 3.5 5],0.3);
    [step_order, new_order, coefficients]=commensurate(fpi1);
    
    assertEqual(testCase,step_order,0.5,'step_order is not 0.5');
    assertEqual(testCase,new_order,{[10 7 6]},'new_order is not {[10 7 6]}');
    assertEqual(testCase,coefficients,{[-1 1 2]},'coefficients is not{[-1 1 2]}');
    
    fpi2=frac_poly_imp([3 2],[1.5 4 ],3);
    [step_order, new_order, coefficients]=commensurate(fpi2);
    
    assertEqual(testCase,step_order,0.5,'step_order is not 0.5');
    assertEqual(testCase,new_order,{[8 3]},'new_order is not {[8 3]}');
    assertEqual(testCase,coefficients,{[2 3]},'coefficients is not{[2 3]}');
end

%% The case of constant
function testCommensurateCste(testCase)
    polxx = frac_poly_exp(55);
    [step_order, new_order, coefficients]=commensurate(polxx);

    assertEqual(testCase,step_order,1,'step_order is not 1');
    assertEqual(testCase,new_order,{0},'new_order is not {0}');
    assertEqual(testCase,coefficients,{55},'coefficients is not {55}');
end

%% The classic case : multidimensionnal
function testCommensurateMIMO(testCase)
    pol1=frac_poly_exp([30,5,1,1],[0.2,0.04,0.8,1.2]);
    pol1bis=frac_poly_exp([1,1,1,1],[0.9,1.5,5.6,0.21]);
    pol2=frac_poly_exp([pol1; pol1]);
    pol2bis=frac_poly_exp([pol1bis; pol1bis]);
    pol3=frac_poly_exp([pol2, pol2bis]);
%        [ s^1.2 +s^0.8 +s^0.4 +s^0.2  s^5.6 +s^1.5 +s^0.9 +s^0.21 ]
% pol3 = [                                                         ]
%        [ s^1.2 +s^0.8 +s^0.4 +s^0.2  s^5.6 +s^1.5 +s^0.9 +s^0.21 ]
% The function calculate a common step order to all the polynomial
% componing the multidimensionnal one.
% It gives back a scalar (step_order) and a cell of vector (new_order).

    [step_order, new_order, coefficients]=commensurate(pol3);

    assertEqual(testCase,step_order,0.01,'step_order is not 0.01'); %commensurate l.53
    assertEqual(testCase,new_order,{[120 80 20 4] [560 150 90 21];[120 80 20 4] [560 150 90 21]},'new_order is not {[120 80 20 4] [560 150 90 21];[120 80 20 4] [560 150 90 21]}');
    assertEqual(testCase,coefficients,{[1 1 30 5] [1 1 1 1];[1 1 30 5] [1 1 1 1]},'coefficients is not {[1 1 30 5] [1 1 1 1];[1 1 30 5] [1 1 1 1]}');
end
%% Cas multidimensionnel contenant des constantes où l'ordre commensurable
% est inf
function testCommensurateMIMO2(testCase)
    polyy=frac_poly_exp({1, [1 1]}, {0, [1.1  0]});
    [step_order, new_order, coeffff]=commensurate(polyy);
    
end



%% Special Case : NaN and Empty polynomials
function testCommensurateNaNEmpty(testCase)
    pol_nan=frac_poly_exp(nan);
    pol_vide=frac_poly_exp;
% In these case, the function displays an information message
% and returns empty step_order and new_order
    [step_order_nan, new_order_nan, coef_nan]=commensurate(pol_nan);
    [step_order_vide, new_order_vide, coef_vide]=commensurate(pol_vide);
    
    assertTrue(testCase,isnan(step_order_nan),'step_order_nan is not empty');
    assertTrue(testCase,isnan(new_order_nan),'new_order_nan is not empty');
    assertTrue(testCase,isnan(coef_nan),'coef_nan is not nan');
    assertEmpty(testCase,step_order_vide,'step_order_vide is not empty');
    assertEmpty(testCase,new_order_vide,'new_order_vide is not empty');
    assertEmpty(testCase,coef_vide,'coef_vide is not empty');
    
end