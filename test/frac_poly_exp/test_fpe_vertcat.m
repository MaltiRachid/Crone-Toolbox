%% Description
%
% Test function on :
%          - function : horzcat
%          - class    : frac_poly_exp
%
% Prototype :
%        sys = vertcat(fp1, fp2,...)           
%
% Argument in : 
%   varargin : a variable number of Frac_poly_exp object
%   
% Argument out :
% 	sys : Frac_poly_exp object
% 
%   This amounts to appending the outputs of the frac_poly_exp models 
%   SYS1, SYS2,... and feeding all these models with the same input vector.
%
%   Copyright © CRONE

%% Function-based unit test for frac_fpe_vertcat
% Last revision 21/09/2021

function tests = test_fpe_vertcat
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testVertcatSISO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol1bis=frac_poly_exp([2,4,8],[3,2,0]);
% [pol1, pol1bis] returns the following 1 by 2 polynomial :
    pol1_exp=frac_poly_exp({[1 2 4];[2 4 8]},{[3 2 0];[3 2 0]});
    assertEqual(testCase,vertcat(pol1,pol1bis),pol1_exp,'vertcat(pol1,pol1bis) is not pol1_exp');
end

%% The classic case : multidimensionnal
function testVertcatMIMO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol1bis=frac_poly_exp([2,4,8],[3,2,0]);
    pol2=frac_poly_exp([pol1, pol1]);
    pol2bis=frac_poly_exp([pol1bis, pol1bis]);
% Let's apply vertcat to these txo 2 by 1 polynomial
%
%       pol2 = [  s^3 + 2 s^2 + 4      s^3 + 2 s^2 + 4   ]
%    pol2bis = [  2 s^3 + 4 s^2 + 8    2 s^3 + 4 s^2 + 8 ]
% It will return the  following 2 by 2 polynomial :
    pol2_exp=frac_poly_exp({[1 2 4] [1 2 4];[2 4 8] [2 4 8]},{[3 2 0] [3 2 0];[3 2 0] [3 2 0]});
    assertEqual(testCase,vertcat(pol2,pol2bis),pol2_exp,'vertcat(pol2,pol2bis) is not pol2_exp');
end
%% Special Case : NaN and Empty polynomial
function testVertcatNaN(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol_nan=frac_poly_exp(nan);
% If there is any NaN polynomial in the arguments the result is NaN
    assertTrue(testCase,isnan(vertcat(pol1,pol_nan,pol1)));
end
%% Special Case : NaN and Empty polynomial
function testVertcatEmpty(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol_vide=frac_poly_exp;
% Each Empty polynomial in the arguments is deleted
% vertcat(pol1,pol_vide,pol1) =  vertcat(pol1,pol1)
    assertEqual(testCase,vertcat(pol1,pol_vide,pol1),vertcat(pol1,pol1),'vertcat(pol1,pol_vide,pol1) is not vertcat(pol1,pol1)');
end