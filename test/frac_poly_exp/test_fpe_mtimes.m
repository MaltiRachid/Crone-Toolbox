%% Function-based unit test for frac_fpe_mtimes
% Last revision 14/09/2021

function tests = test_fpe_mtimes
    tests = functiontests(localfunctions);
end

%% Multiplication of two frac_poly_exp functions of dim = 1
function testMtimesSISO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol1bis=frac_poly_exp([3,12,2],[3,1,0]);
% With one-dimension polynomial, mtimes2 is equivalent to times.
% (3 s^3 + 12 s + 2) * (s^3 + 2 s^2 + 4) returns the polynomial :
    assertEqual(testCase,pol1bis*pol1,frac_poly_exp([3 6 12 38 4 48 8],[6 5 4 3 2 1 0]));
end

%% Multiplication of a frac_poly_exp function and a numerical value
function testMtimesCstSISO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    newpoly1=5*pol1;
    newpoly2=pol1*5;
    pol_exp=frac_poly_exp([5 10 20],[3 2 0]);
    
    assertEqual(testCase,newpoly1,pol_exp,'newpoly1 is not pol_exp');
    assertEqual(testCase,newpoly2,pol_exp,'newpoly2 is not pol_exp');
end
%% Multiplication of a scalar(numeric) and a matrix of frac_poly_exp
function testMtimesCstMIMO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol=[pol1, pol1 ; pol1, pol1];
    newpoly1=5*pol;
    newpoly2=pol*5;
    pol_5=frac_poly_exp([5 10 20],[3 2 0]);
    pol_exp=[pol_5 pol_5;pol_5 pol_5];
    
    assertEqual(testCase,newpoly1,pol_exp,'newpoly1 is not pol_exp');
    assertEqual(testCase,newpoly2,pol_exp,'newpoly2 is not pol_exp');
end
%% Multiplication of a Matrix(numeric) and a scalar of frac_poly_exp
function testMtimesSISO2(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    newpoly1=[5, 5]*pol1;
    newpoly2=pol1*[5 5];
    pol_5=frac_poly_exp([5 10 20],[3 2 0]);
    pol_exp1=[pol_5; pol_5];
    pol_exp2=[pol_5 pol_5];
    
    assertEqual(testCase,newpoly1,pol_exp1,'newpoly1 is not pol_exp1');
    assertEqual(testCase,newpoly2,pol_exp2,'newpoly2 is not pol_exp2');    
end
%% Multiplication of a matrix (numeric) with a matrix of frac_poly_exp
function testMtimesMIMO2(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol=[pol1, pol1 ;pol1  pol1; pol1 pol1];
    newpoly = [1  1  1 ; 2 2 2] * pol;
    pol_exp=frac_poly_exp({[1 2 4] [1 2 4];[2 4 8] [2 4 8]},{[3 2 0] [3 2 0];[3 2 0] [3 2 0]});
    
    assertEqual(testCase,newpoly,pol_exp,'newpoly is not pol_exp');    
end

%% Multiplication of a matrix of frac_poly_exp with a matrix (numeric)
function testMtimesMIMO3(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol=[pol1, pol1 ;pol1  pol1; pol1 pol1];
    newpoly =  pol * [0 1 ; 0 1];
    pol_exp=[frac_poly_exp([0],[0]) pol1;frac_poly_exp([0],[0]) pol1;frac_poly_exp([0],[0]) pol1];

    assertEqual(testCase,newpoly,pol_exp,'newpoly is not pol_exp');
end

%% Multiplication of a frac_poly_exp functions of dim = 1 with a frac_poly_exp of dim > 1
function testMtimesMIMO4(testCase)
    pol1=frac_poly_exp([1,2,4],[2,1,0]);
    pol=[pol1, pol1 ; pol1, pol1];
    pol1bis=frac_poly_exp([0.01 1],[0.1,0]);
    newpoly1  = pol1bis * pol;
    newpoly2 =  pol * pol1bis;
    pol_exp = frac_poly_exp([0.01 1 0.02 2 0.04 4],[2.1 2 1.1 1 0.1 0]);
    pol_exp1 = [pol_exp pol_exp;pol_exp pol_exp];

    assertEqual(testCase,newpoly1,pol_exp1,'newpoly1 is not pol_exp1');
    assertEqual(testCase,newpoly1,newpoly2,'newpoly1 is not newpoly2');
end
%% Multidimensionnal -- Multiplication of a matrix of scalar and a matrix of frac_poly_exp
function testMtimesMIMO5(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol=[pol1, pol1 ; pol1, pol1]; %of dim 2*2
    res1 = [1  1] * pol; 
    res2 = pol * [2 ; 2];
    pol_exp1=frac_poly_exp({[1 2 4] [1 2 4]},{[3 2 0] [3 2 0]});
    pol_exp2=frac_poly_exp({[2 4 8];[2 4 8]},{[3 2 0];[3 2 0]});
    
    assertEqual(testCase,res1,pol_exp1,'res1 is not pol_exp1');
    assertEqual(testCase,res2,pol_exp2,'res2 is not pol_exp2');
end
%% Special Case : NaN polynomial
function testMtimesNaN(testCase)
	pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol_nan=frac_poly_exp(nan);
% If one of the argument is a NaN polynomial the result is the NaN
% polynomial 
	assertTrue(testCase,isnan(pol1*pol_nan));
	assertTrue(testCase,isnan(pol_nan*pol1));
	assertTrue(testCase,isnan(pol_nan*pol_nan));
end

%% Special Case : Empty polynomial
function testMtimesEmpty(testCase)
    pol_vide=frac_poly_exp;
% The operation with an empty polynomial will not succeed,
% because of the rule on the dimension.
% Only the multiplication of two empty polynomial will produce an empty
% one.
    assertEmpty(testCase,pol_vide*pol_vide,'pol_vide*pol_vide is not empty');
end