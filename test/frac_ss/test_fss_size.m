%% Description
%
% Test function on :
%        - function : size
%        - class    : frac_ss
%
% Prototype :
%               size(fss)
%         a  =  size(fss)
%       [a,b] = size(fss)
% 
% Argument in: 
%        fss: frac_ss object
% 
% Argument out:
%       With no output the function make a nice display
%       With one output : a is a vector containing the two dimension
%       With a vector in output ; [a,b], a is the number of input and b is
%       the number of output
%
% The function returns the size of LTI models.
%
%   Copyright © CRONE    14/09/2009

%% Function-based unit test for test_fss_size
% Last revision 29/09/2021

function tests = test_fss_size
    tests = functiontests(localfunctions);
end

%% The classic case :  
function testSize(testCase)
% system SISO:
pol1=frac_ss([2],[1],[5],[2.5],0.8);
[n1,m1]=size(pol1);
assertEqual(testCase,[n1 m1],[1 1],'[n1 m1] is not [1 1]');
%dans system MIMO:
pol2=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2);
% obtenir les parametres :
[n2,m2]=size(pol2);
assertEqual(testCase,[n2 m2],[2 2],'[n2 m2] is not [2 2]');
end
%% The special case
function testSizeEmpty(testCase)
%frac_ss vide
pol3=frac_ss;
[n3,m3]=size(pol3);
assertEqual(testCase,[n3 m3],[0 0],'[n3 m3]  is not [0 0]');
end
%%  frac_ss nan 
% dans systeme MIMO:
%  pol5=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 nan],0.2,100,[10,1000]);
%  [a,b]=size(pol5)
%  
 
 
