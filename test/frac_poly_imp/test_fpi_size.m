%% Description
%
% Test function on :
%        - function : size
%        - class    : frac_poly_imp
%
% Prototype :
%               size(fpi)
%         a  =  size(fpi)
%       [a,b] = size(fpi)
% 
% Argument in: 
%        fpi: frac_poly_imp object
% 
% Argument out:
%       With no output the function make a nice display
%       With one output : a is a vector containing the two dimension
%       With a vector in output ; [a,b], a is the number of input and b is
%       the number of output
%
% The function returns the size of LTI models.
%
%   Copyright © CRONE 

%% Function-based unit test for frac_fpi_size
% Last revision 10/09/2021

function tests = test_fpi_size
    tests = functiontests(localfunctions);
end

%% First case  : no output
function testSizeArgout0(testCase)
    pol_1D=frac_poly_imp([1,2,4],[3,2,0],3);
    pol_2D=enlarge(pol_1D,2,2);
% Let's display the size of pol_1D and pol_2D
    assertEqual(testCase,size(pol_1D),[1 1],'size(pol_1D) is not well displayed');
    assertEqual(testCase,size(pol_2D),[2 2],'size(pol_2D) is not well displayed');
end

%% Second case : one output
function testSizeArgout1(testCase)
    pol_1D=frac_poly_imp([1,2,4],[3,2,0],3);
    pol_2D=enlarge(pol_1D,2,2);
% Getting the size's vector
    v1=size(pol_1D);
    v2=size(pol_2D);
    
    assertEqual(testCase,v1,[1 1],'v1 is not [1 1]');
    assertEqual(testCase,v2,[2 2],'v2 is not [2 2]');
end
%% Third case  : two output
function testSizeArgout2(testCase)
    pol_1D=frac_poly_imp([1,2,4],[3,2,0],3);
    pol_2D=enlarge(pol_1D,2,2);
% Getting the size's scalar
    [a1,b1]=size(pol_1D);
    [a2,b2]=size(pol_2D);

    assertEqual(testCase,[a1 b1],[1 1],'[a1 b1 is not [1 1]');
    assertEqual(testCase,[a2 b2],[2 2],'[a2 b2] is not [2 2]');
end

%% Special Case : NaN and Empty polynomial
function testSizeNaNEmpty(testCase)
    pol_nan=frac_poly_imp(nan);
    pol_vide=frac_poly_imp;
% NaN polynomial is considered as having 1 by 1 dimensions
% Empty polynomial is considered as having 0 by 0 dimensions
    sNaN=size(pol_nan);
    sEmp=size(pol_vide);
    assertEqual(testCase,sNaN,[1 1],'sNaN is not [1 1]');
    assertEqual(testCase,sEmp,[0 0],'sEmp is not [0 0]');
end