%% Description
%
% Test function on :
%        - function : size
%        - class    : frac_poly_exp
%
% Prototype :
%               size(fpe)
%         a  =  size(fpe)
%       [a,b] = size(fpe)
% 
% Argument in: 
%        fpe: frac_poly_exp object
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

%% Function-based unit test for frac_fpe_size
% Last revision 21/09/2021

function tests = test_fpe_size
    tests = functiontests(localfunctions);
end

%% First case  : no output
function testSizeArgout0(testCase)
    pol_1D=frac_poly_exp([1,2,4],[3,2,0]);
    pol_2D=enlarge(pol_1D,2,2);
% Let's display the size of pol_1D and pol_2D
    assertEqual(testCase,size(pol_1D),[1 1],'size(pol_1D) is not 1x1');
    assertEqual(testCase,size(pol_2D),[2 2],'size(pol_2D) is not 2x2');
end
%% Second case : one output
function testSizeArgout1(testCase)
% Getting the size's vector
    pol_1D=frac_poly_exp([1,2,4],[3,2,0]);
    pol_2D=enlarge(pol_1D,2,2);
    v1=size(pol_1D);
    v2=size(pol_2D);

    assertEqual(testCase,v1,[1 1],'v1 is not 1x1');
    assertEqual(testCase,v2,[2 2],'v2 is not 2x2');
end

%% Third case  : two output
function testSizeArgout2(testCase)
% Getting the size's scalar
    pol_1D=frac_poly_exp([1,2,4],[3,2,0]);
    pol_2D=enlarge(pol_1D,2,2);
    [a1,b1]=size(pol_1D);
    [a2,b2]=size(pol_2D);

    assertEqual(testCase,a1,1,'a1 is not 1');
    assertEqual(testCase,b1,1,'b1 is not 1');
    assertEqual(testCase,a2,2,'a2 is not 2');
    assertEqual(testCase,b2,2,'b2 is not 2');
end
%% Special Case : NaN and Empty polynomial
function testSizeNaNEmpty(testCase)
    pol_nan=frac_poly_exp(nan);
    pol_vide=frac_poly_exp;

% NaN polynomial is considered as having 1 by 1 dimensions
% Empty polynomial is considered as having 0 by 0 dimensions
    assertEqual(testCase,size(pol_nan),[1 1],'size(pol_nan) is not 1x1');
    assertEqual(testCase,size(pol_vide),[0 0],'size(pol_vide) is not 0x0');
end