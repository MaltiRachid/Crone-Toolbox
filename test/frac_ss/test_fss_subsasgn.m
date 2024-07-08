%% Description
%
% Test function on :
%          - function : subsasgn
%          - class    : frac_ss
%
% Prototype :
%        fss=subsasgn(fss,index,val)
%
% Argument in : 
%     fss   : Frac_ss object
%     index : a strucuture containing two attribute : type and subs
%     val   : the value that has to be affected depending on the index
%
% Argument out :
%       fss : Frac_ss object
%
% This permits the affectation of different value of an fss.
% See subsref for further information about the functionnement of index.
% 
% This is an overload of fpe.order = [...] or fpe(i,j) = fpebis
%
%   Copyright © CRONE  14/09/2009

%% Function-based unit test for test_fss_subsasgn
% Last revision 29/09/2021

function tests = test_fss_subsasgn
    tests = functiontests(localfunctions);
end

%% The classic case :
function testSubsasgn(testCase)
%  system SISO:
   pol1=frac_ss([2],[1],[5],[2.5],0.8);
   pol1.A=[5];
   assertEqual(testCase,get(pol1,'A'),5,'A is not 5');
 
% dans systeme MIMO: 
   pol2=frac_ss([2 5;2 4], [3 4;1 2], [2 5;2 1], [2 2;1 1], 0.2, 'N',100, 'band',[10,1000]);
   pol2.A=[3 4;4 3];
   pol2.D=[5 2;2 5];
   assertEqual(testCase,get(pol2,'A'),[3 4;4 3],'A is not [3 4;4 3]');
   assertEqual(testCase,get(pol2,'D'),[5 2;2 5],'D is not [5 2;2 5]');

end

%% The special case
%frac_ss vide
%    pol3=frac_ss;
%    pol3.D=[1 2;5 6]
 
%%  frac_ss nan 
% dans systeme MIMO:
 
%  pol5=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 nan],0.2,100,[10,1000]);
%  pol5.D=[nan]
 
