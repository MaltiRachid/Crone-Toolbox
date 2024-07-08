%% Description
%
% Test function on :
%          - function : multi
%          - class    : frac_poly_exp
%
% Prototype :
%        varargout = multi(fun_name, nbr, varargin)             
%
% Argument in : 
%   fun_name    : Name of the function called
%   nbr         : Number of argout expected
%   nbrout_fpe  : Number of fpe expected in the argout
%   varargin    : Contain the arguments needed by the function "fun_name"
%
% Argument out :
%   varargout : result depends on the function called
%
% This function deals with multi-dimensionnal systems. It catch the size of
% the system and fill-in cells with the results of the function called on
% unidimensionnal system.
% This function is private and is always called when a function is applied
% on multi-dimensionnal polynomials.

%% Function-based unit test for frac_fpe_multi
% Last revision 30/09/2021

function tests = test_fpe_multi
    tests = functiontests(localfunctions);
end

%% Let's create a multi-dimensionnal polynomial
function testMulti(testCase)
% Consider a polynome of size 2x2

pol1=frac_poly_exp([1,2,1],[3,2,0]);
pol2=frac_poly_exp([1,1,4],[4,3,0]);
pol3=frac_poly_exp([1,2],[2,1]);
pol4=frac_poly_exp([6,4],[2,0]);
pol5=frac_poly_exp([pol1; pol2]);
pol6=frac_poly_exp([pol3; pol4]);
poly = frac_poly_exp([pol5, pol6]);

%% First case : one argument out
%  We'll use the function char
%
%  prototype of char :
%           string=char(frac_poly_exp)
%  
%  As the dimensions of the polynome are (2x2), the function char(poly)
%  will automaticly call : multi('char', 1, poly)
%  
%  The result will be a 2x2 cell array containing :
%
%   a  =  {  char(s^3 + 2 s^2 + 1)       char(s^2 + 2 s^1)
%           
%            char(s^4 +  s^3 + 4)        char(6 s^2 + 4)   }
%
%  Where char(s^3 + 2 s^2 + 1) is the result of the function char applied 
%  on the unidimensionnal polynome : s^3 + 2 s^2 + 1
a = char(poly);

assertEqual(testCase,a{1,1},'s^3 + 2 s^2 + 1','a{1,1} is not s^3 + 2 s^2 + 1');
assertEqual(testCase,a{1,2},'s^2 + 2 s','a{1,2} is not s^2 + 2 s');
end
%% Second case : several argument out
%

%  We'll use the function roots
%
%  prototype of char :
%           string=char(frac_poly_exp)
%  
%  As the dimensions of the polynome are (2x2), the function char(poly)
%  will automaticly call : multi('char', 1, poly)
%  
%  The result will be a 2x2 cell array containing :
%
%   a  =  {  char(s^3 + 2 s^2 + 1)       char(s^2 + 2 s^1)
%           
%            char(s^4 +  s^3 + 4)        char(6 s^2 + 4)   }
%
%  Where char(s^3 + 2 s^2 + 1) is the result of the function char applied 
%  on the unidimensionnal polynome : s^3 + 2 s^2 + 1
%% Argument in : 1 frac_poly_exp


%% Argument in : several frac_poly_exp


%% Argument in : 1 fac_poly_exp and several options arguments






