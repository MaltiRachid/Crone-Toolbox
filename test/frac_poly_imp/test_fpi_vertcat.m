%% Description
%
% Test function on :
%          - function : horzcat
%          - class    : frac_poly_imp
%
% Prototype :
%        sys = vertcat(fp1, fp2,...)           
%
% Argument in : 
%   varargin : a variable number of Frac_poly_imp object
%   
% Argument out :
% 	sys : Frac_poly_imp object
% 
%   This amounts to appending the outputs of the frac_poly_imp models 
%   SYS1, SYS2,... and feeding all these models with the same input vector.
%
%   Copyright © CRONE

%% Function-based unit test for frac_fpi_vertcat
% Last revision 10/09/2021

function tests = test_fpi_vertcat
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testVertcatSISO(testCase)
	pol1=frac_poly_imp(frac_poly_exp([1,2,4],[3,2,0]),3);
    pol1bis=frac_poly_imp(frac_poly_exp([2,4,8],[3,2,0]),4);
% [pol1, pol1bis] returns the following 1 by 2 polynomial :
    vpol=frac_poly_imp(frac_poly_exp({[1 2 4];[2 4 8]},{[3 2 0];[3 2 0]}),[3;4]);
    assertEqual(testCase,vertcat(pol1,pol1bis),vpol,'vertcat(pol1,pol1bis) is not vpol');
end

%% The classic case : multidimensionnal
function testVertcatMIMO(testCase)
	pol1=frac_poly_imp(frac_poly_exp([1,2,4],[3,2,0]),3);
    pol1bis=frac_poly_imp(frac_poly_exp([2,4,8],[3,2,0]),4);
    pol2=frac_poly_imp([pol1, pol1]);
    pol2bis=frac_poly_imp([pol1bis, pol1bis]);
% Let's apply vertcat to these txo 2 by 1 polynomial
%
%       pol2 = [  (s^3 + 2 s^2 + 4)^3      (s^3 + 2 s^2 + 4)^3   ]
%    pol2bis = [  (2 s^3 + 4 s^2 + 8)^4    (2 s^3 + 4 s^2 + 8)^4 ]
%
% It will return the  following 2 by 2 polynomial :
    vpol=frac_poly_imp(frac_poly_exp({[1 2 4] [1 2 4];[2 4 8] [2 4 8]},{[3 2 0] [3 2 0];[3 2 0] [3 2 0]}),[3 3;4 4]);
    assertEqual(testCase,vertcat(pol2,pol2bis),vpol,'vertcat(pol2,pol2bis) is not vpol');
end

%% Special Case : NaN and Empty polynomial
function testVertcatNaN(testCase)
	pol1=frac_poly_imp(frac_poly_exp([1,2,4],[3,2,0]),3);
    pol_nan=frac_poly_imp(nan);
% If there is any NaN polynomial in the arguments the result is NaN
    assertTrue(testCase,isnan(vertcat(pol1,pol_nan,pol1)));
end

%% Special Case : NaN and Empty polynomial
function testVertcatEmpty(testCase)
	pol1=frac_poly_imp(frac_poly_exp([1,2,4],[3,2,0]),3);
    pol_vide=frac_poly_imp;
% Each Empty polynomial in the arguments is deleted
% vertcat(pol1,pol_vide,pol1) =  vertcat(pol1,pol1)
    assertEqual(testCase,vertcat(pol1,pol_vide,pol1),vertcat(pol1,pol1),'vertcat(pol1,pol_vide,pol1) is not vertcat(pol1,pol1)');
end