%% Description
%
% Test function on :
%          - function : horzcat
%          - class    : frac_poly_exp
%
% Prototype :
%        sys = horzcat(fp1, fp2,...)           
%
% Argument in : 
%   varargin : a variable number of Frac_poly_exp object
%   
% Argument out :
% 	sys : Frac_poly_exp object
% 
%   This operation amounts to appending the inputs and 
%   adding the outputs of the frac_poly_exp models SYS1, SYS2,...
%
%   Copyright © CRONE

%% Function-based unit test for frac_fpe_horzcat
% Last revision 14/09/2021

function tests = test_fpe_horzcat
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testHorzcatSISO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol1bis=frac_poly_exp([2,4,8],[3,2,0]);
% [pol1, pol1bis] returns the following 1 by 2 polynomial :
    sys = horzcat(pol1,pol1bis);
    
    assertEqual(testCase,sys,[pol1,pol1bis],'sys is not [pol1,polbis]');
end
%% The classic case : multidimensionnal
function testHorzcatMIMO(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol1bis=frac_poly_exp([2,4,8],[3,2,0]);
    pol2=frac_poly_exp([pol1; pol1]);
    pol2bis=frac_poly_exp([pol1bis; pol1bis]);
% Let's apply horzcat to these txo 2 by 1 polynomial
%
%          [ s^3 + 2 s^2 + 4 ]             [ 2 s^3 + 4 s^2 + 8  ]
%   pol2 = [                 ]   pol2bis = [                    ]
%          [ s^3 + 2 s^2 + 4 ]             [ 2 s^3 + 4 s^2 + 8  ]
%
%
% It will return the  following 2 by 2 polynomial :
    sys=horzcat(pol2,pol2bis);
    
    assertEqual(testCase,sys,[pol2 pol2bis],'sys is not [pol2 pol2bis]');
end

%% Special Case : NaN and Empty polynomial
function testHorzcatNaN(testCase)
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
    pol_nan=frac_poly_exp(nan);
% If there is any NaN polynomial in the arguments the result is NaN
	sys=horzcat(pol1,pol_nan,pol1);
    
    assertEqual(testCase,sys,[pol_nan pol_nan pol_nan],'sys is not [pol_nan pol_nan pol_nan]');
end

%% Special Case : NaN and Empty polynomial
function testHorzcatNaNEmpty(testCase)
    pol_vide=frac_poly_exp;
    pol1=frac_poly_exp([1,2,4],[3,2,0]);
% Each Empty polynomial in the arguments is deleted
% horzcat(pol1,pol_vide,pol1) =  horzcat(pol1,pol1)
    sys=horzcat(pol1,pol_vide,pol1);
    
    assertEqual(testCase,sys,[pol1 pol1],'sys is not [pol1 pol1]');
end