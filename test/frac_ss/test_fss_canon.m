%% Description
%
% Test function on :
%          - function : canon
%          - class    : frac_ss
%
%Prototype :
% [Csys,T]=canon(sys,Type,condt)
%
% Argument in : 
%	sys : Frac_ss object
%	Type : string(type of realization),soit 'modal' ou 'companion'
%   condt : specifies an upper bound CONDT on the condition 
%           number of the block-diagonalizing transformation T
% Argument out :
%    - Csys : frac_ss
%    - T : the state transformation  matrix
%  
%   Copyright © CRONE 	15/09/2009

%% Function-based unit test for test_fss_canon
% Last revision 30/09/2021

function tests = test_fss_canon
    tests = functiontests(localfunctions);
end

%% The classic case :
function testCanon(testCase)
% dans system SISO:
pol1=frac_ss([2],[1],[5],[2.5],0.8);
Csys=canon(pol1);
assertFalse(testCase,isempty(Csys),'Csys is empty');
% dans system MIMO:
pol2=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2, 'N', 50, 'band', [0.001,1000]);
[Csys2,T]=canon(pol2,'companion');
assertFalse(testCase,isempty(Csys2),'Csys2 is empty');
assertFalse(testCase,isempty(T),'T is empty');
end

%% The special case
function testCanonEmpty(testCase)
%frac_ss vide
pol3=frac_ss;
assertEmpty(testCase,canon(pol3),'canon(pol3) is not empty');
end
%%  frac_ss nan 
% dans systeme SISO:
%  pol4=frac_ss(nan);
%  [Csys4,T]=canon(pol4,'modal')
% % dans systeme MIMO:
%  pol5=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 nan],0.2,100,[10,1000]);
%  Csys5=canon(pol5,'modal',5000)
 
