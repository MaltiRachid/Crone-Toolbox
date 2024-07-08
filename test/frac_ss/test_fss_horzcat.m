%% Description
%
% Test function on :
%          - function : horzcat
%          - class    : frac_ss
%
% Prototype :
%        sys = horzcat(fss1, fss2,...)           
%
% Argument in : 
%   varargin : a variable number of Frac_ss object
%   
% Argument out :
% 	sys : Frac_ss object
% 
%   This operation amounts to appending the inputs and 
%   adding the outputs of the frac_ss models SYS1, SYS2,...
%
%   Copyright © CRONE

%% Function-based unit test for test_fss_horzcat
% Last revision 29/09/2021

function tests = test_fss_horzcat
    tests = functiontests(localfunctions);
end

%% The classic case :  
% dans system SISO:
function testHorzcatSISO(testCase)
    pol1=frac_ss([2],[1],[5],[2.5],0.8, 'N', 50, 'band', [0.001,1000]);
    pol2=frac_ss([3],[2],[4],[1.8],0.6);
    sys=[pol1,pol2];
    assertFalse(testCase,isempty(sys),'sys is empty');
    assertEqual(testCase,get(sys,'N'),50,'N is not 50');
    assertEqual(testCase,get(sys,'band'),[0.001 1000],'band is not [0.001 1000]');
end
%% dans system MIMO:
function testHorzcatMIMO(testCase)
    pol3=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2, 'N', 50, 'band', [0.001,1000]);
    pol4=frac_ss([3 7;3 5],[2 8;1 6],[4 4;2 3],[1 5;2 3],0.4, 'N', 100, 'band', [10,2000]);
    sys=[pol3,pol4];
    assertFalse(testCase,isempty(sys),'sys is empty');
    assertEqual(testCase,get(sys,'N'),100,'N is not 100');
    assertEqual(testCase,get(sys,'band'),[0.001 2000],'band is not [0.001 2000]');
end
%% dans systeme MIMO:
%  pol6=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 nan],0.2,100,[10,1000]);
%  sys=horzcat(pol6,pol4)
 
