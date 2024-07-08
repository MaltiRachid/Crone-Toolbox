%% Test de la fonction subsasgn de frac_poly_exp
%
% Test function on :
%          - function : subsasgn
%          - class    : frac_poly_exp
%
% Prototype :
%        fpe=subsasgn(fpe,index,val)
%
% Argument in :
%     fpe   : Frac_poly_exp object
%     index : a strucuture containing two attribute : type and subs
%     val   : the value that has to be affected depending on the index
%
% Argument out :
%       fpe : Frac_poly_exp object
%
% This permits the affectation of different value of an fpe.
% See subsref for further information about the functionnement of index.
%
% This is an overload of fpe.order = [...] or fpe(i,j) = fpebis
%
%   Copyright © CRONE

%% Function-based unit test for frac_fpe_subsasgn
% Last revision 21/09/2021

function tests = test_fpe_subsasgn
    tests = functiontests(localfunctions);
end


%% With an emply frac_poly_exp
function testSubsasgnEmpty(testCase)
    pol1=frac_poly_exp([1,2,1],[3,2,0]);
    pol = frac_poly_exp;
    pol(1)=pol1;
    
    assertEqual(testCase,pol,pol1,'pol is not pol1');
    
    pol_sys(5) = pol1;
    polsys_exp=frac_poly_exp({0;0;0;0;[1 2 1]},{0;0;0;0;[3 2 0]});
    assertEqual(testCase,pol_sys,polsys_exp,'pol_sys is not polsys_exp');
end
%% The classic case : unidimensionnal
function testSubsasgnSISO(testCase)
    pol1=frac_poly_exp([1,2,1],[3,2,0]);
    pol2= [pol1; pol1; pol1; pol1];
    pol2(7) = pol1;
    pol2_exp=frac_poly_exp({[1,2,1];[1,2,1];[1,2,1];[1,2,1];0;0;[1,2,1]},{[3 2 0];[3 2 0];[3 2 0];[3 2 0];0;0;[3 2 0]});
    assertEqual(testCase,pol2,pol2_exp,'pol2 is not pol2_exp');
end

%% Two dimensional case
function testSubsasgnMIMO(testCase)
    pol1=frac_poly_exp([1,2,1],[3,2,0]);
    pol3(3,3) = pol1;
    pol3_exp=frac_poly_exp({0 0 0;0 0 0;0 0 [1 2 1]},{0 0 0;0 0 0;0 0 [3 2 0]});
    
    assertEqual(testCase,pol3,pol3_exp,'pol3 is not pol3_exp');
end
%% Constant polynomial
function testSubsasgnCst(testCase)
    pol = frac_poly_exp(1);
    pol(2) = frac_poly_exp(1);
    
    assertEqual(testCase,pol,frac_poly_exp({1;1},{0;0}),'pol is not frac_poly_exp({1;1},{0;0})');
end
%% The classic case : multidimensionnal
function testSubsagnMIMO2(testCase)
    pol = frac_poly_exp(1);
% Consider a 2 by 2 polynomial
    pol_multi=enlarge(pol,2,2);
% Quick access to a single polynomial
    pol_multi(1,2)=frac_poly_exp([3 4 5],[3 2 1]);
    pol_exp=frac_poly_exp({1 [3 4 5];1 1},{0 [3 2 1];0 0});
    assertEqual(testCase,pol_multi,pol_exp,'pol_multi is not pol_exp');    
end