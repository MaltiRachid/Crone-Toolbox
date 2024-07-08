%% Description
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

%% Function-based unit test for frac_fpi_subsasgn
% Last revision 10/09/2021

function tests = test_fpi_subsasgn
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testSubsasgnSISO(testCase)
    pol=frac_poly_imp([1,2,1],[3,2,0],3);
% The coefficient :
    pol.imp_order=5;
    assertEqual(testCase,get(pol,'imp_order'),5,'imp_order is not 5');
end

%% Empty + add ==> Cette partie validée, pas le reste !
function testSubsasgnBrackets1(testCase)
    sys = frac_poly_imp;
    sys(5) = frac_poly_imp([1,2,3],[3,2,0],3);
    sys(3,5) = frac_poly_imp([3,2,1],[3,2,0],3);
    
    assertEqual(testCase,get(sys(5,1),'coef'),{[1 2 3]},'sys(5,1) coef is not {[1 2 1]}');
    assertEqual(testCase,get(sys(5,1),'order'),{[3 2 0]},'sys(5,1) order is not {[3 2 0]}');
    assertEqual(testCase,get(sys(5,1),'imp_order'),3,'sys(5,1) imp_order is not 3');
    assertEqual(testCase,get(sys(3,5),'coef'),{[3 2 1]},'sys(3,5) coef is not {[1 2 1]}');
    assertEqual(testCase,get(sys(3,5),'order'),{[3 2 0]},'sys(3,5) order is not {[3 2 0]}');
    assertEqual(testCase,get(sys(3,5),'imp_order'),3,'sys(3,5) imp_order is not 3');
end
%% Non empty + add ==> Cette partie validée, pas le reste !
function testSubsasgnBrackets2(testCase)
    sys = frac_poly_imp([1,2,1],[3,2,0],3);
    sys(3,5) = frac_poly_imp([1,2,1],[3,2,0],3);

    assertEqual(testCase,get(sys(1,1),'coef'),{[1 2 1]},'sys(1,1) coef is not {[1 2 1]}');
    assertEqual(testCase,get(sys(1,1),'order'),{[3 2 0]},'sys(1,1) order is not {[3 2 0]}');
    assertEqual(testCase,get(sys(1,1),'imp_order'),3,'sys(1,1) imp_order is not 3');
    assertEqual(testCase,get(sys(3,5),'coef'),{[1 2 1]},'sys(3,5) coef is not {[1 2 1]}');
    assertEqual(testCase,get(sys(3,5),'order'),{[3 2 0]},'sys(3,5) order is not {[3 2 0]}');
    assertEqual(testCase,get(sys(3,5),'imp_order'),3,'sys(3,5) imp_order is not 3');
end
%% The classic case : multidimensionnal
function testSubsasgnMIMO(testCase)
    pol=frac_poly_imp([1,2,1],[3,2,0],3);
% fprintf('Consider a 2 by 2 polynomial\n')
    pol_multi=enlarge(pol,2,2);    
    
    assertEqual(testCase,get(pol_multi(1,1),'coef'),{[1 2 1]},'pol_multi(1,1) coef is not {[1 2 1]}');
    assertEqual(testCase,get(pol_multi(1,1),'order'),{[3 2 0]},'pol_multi(1,1) order is not {[3 2 0]}');
    assertEqual(testCase,get(pol_multi(1,1),'imp_order'),3,'pol_multi(1,1) imp_order is not 3');
% fprintf('\n\nQuick access to a single polynomial\n')
    pol_multi(1,2)=frac_poly_imp([3 4 5],[3 2 1],3);

    assertEqual(testCase,get(pol_multi(1,2),'coef'),{[3 4 5]},'pol_multi(1,2) coef is not {[3 4 5]}');
    assertEqual(testCase,get(pol_multi(1,2),'order'),{[3 2 1]},'pol_multi(1,2) order is not {[3 2 1]}');
    assertEqual(testCase,get(pol_multi(1,2),'imp_order'),3,'pol_multi(3,5) imp_order is not 3');
% fprintf('\n\nQuick access to an attribute (the result is a 2 x 2 cell\n')
    pol_multi.imp_order=[1 2; 3 4];
    
    assertEqual(testCase,get(pol_multi(1,1),'imp_order'),1,'pol_multi(1,1) imp_order is not 1');
    assertEqual(testCase,get(pol_multi(1,2),'imp_order'),2,'pol_multi(1,2) imp_order is not 2');
    assertEqual(testCase,get(pol_multi(2,1),'imp_order'),3,'pol_multi(2,1) imp_order is not 3');
    assertEqual(testCase,get(pol_multi(2,2),'imp_order'),4,'pol_multi(2,2) imp_order is not 4');
end
