%% Description
%
% Test function on :
%          - function : horzcat
%          - class    : frac_poly_imp
%
% Prototype :
%        sys = horzcat(fp1, fp2,...)           
%
% Argument in : 
%   varargin : a variable number of Frac_poly_imp object
%   
% Argument out :
% 	sys : Frac_poly_imp object
% 
%   This operation amounts to appending the inputs and 
%   adding the outputs of the frac_poly_imp models SYS1, SYS2,...
%
%   Copyright © CRONE

%% Function-based unit test for frac_fpi_horzcat
% Last revision 09/09/2021

function tests = test_fpi_horzcat
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testHorzcatSISO(testCase)
    pol1=frac_poly_imp(frac_poly_exp([1,2,4],[3,2,0]),2);
    pol1bis=frac_poly_imp(frac_poly_exp([2,4,8],[3,2,0]),3);
% [pol1, pol1bis] returns the following 1 by 2 polynomial :
    sys12 = horzcat(pol1,pol1bis);
    
    assertEqual(testCase,sys12,[pol1 pol1bis],'sys12 is not [pol1 pol1bis]');
end
%% The classic case : multidimensionnal
function testHorzcatMIMO(testCase)
    pol1=frac_poly_imp(frac_poly_exp([1,2,4],[3,2,0]),2);
    pol1bis=frac_poly_imp(frac_poly_exp([2,4,8],[3,2,0]),3);
    pol2=frac_poly_exp([pol1; pol1]);
    pol2bis=frac_poly_exp([pol1bis; pol1bis]);
% Let's apply horzcat to these two 2 by 1 polynomial
%
%          [ s^3 + 2 s^2 + 4 ]             [ 2 s^3 + 4 s^2 + 8  ]
%   pol2 = [                 ]   pol2bis = [                    ]
%          [ s^3 + 2 s^2 + 4 ]             [ 2 s^3 + 4 s^2 + 8  ]
%
%
% It will return the  following 2 by 2 polynomial :
    pol_horzcat = horzcat(pol2,pol2bis);
    
    assertEqual(testCase,pol_horzcat,[pol2 pol2bis],'pol_horzcat is not [pol2 pol2bis]');
end

%% Special Case : NaN 
function testHorzcatNaN(testCase)
    pol1=frac_poly_imp(frac_poly_exp([1,2,4],[3,2,0]),2);
    pol_nan=frac_poly_imp(nan);
% If there is any NaN polynomial in the arguments the result is NaN
    pol_horzcat=horzcat(pol1,pol_nan,pol1);
    
    assertEqual(testCase,pol_horzcat,[frac_poly_imp(nan) frac_poly_imp(nan) frac_poly_imp(nan)],'pol_horzcat is not nan 1x3');
end
%% Special Case : Empty polynomial
function testHorzcatEmpty(testCase)
    pol1=frac_poly_imp(frac_poly_exp([1,2,4],[3,2,0]),2);
    pol_vide=frac_poly_imp;
% Each Empty polynomial in the arguments is deleted
% horzcat(pol1,pol_vide,pol1) =  horzcat(pol1,pol1)
%
    pol_horz1=horzcat(pol1,pol_vide,pol1);
    pol_horz2=horzcat(pol_vide,pol1);
    pol_horz3=horzcat(pol1,pol_vide);
    
    assertEqual(testCase,pol_horz1,[pol1 pol1],'pol_horz1 is not [pol1 pol1]');
    assertEqual(testCase,pol_horz2,pol1,'pol_horz2 is not pol1');
    assertEqual(testCase,pol_horz3,pol1,'pol_horz3 is not pol1');
end