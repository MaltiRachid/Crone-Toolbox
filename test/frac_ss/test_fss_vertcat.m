%% Description
%
% Test function on :
%          - function : vertcat
%          - class    : frac_ss
%
% Prototype :
%        sys = vertcat(fss1, fss2,...)           
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

%% Function-based unit test for test_fss_vertcat
% Last revision 30/09/2021

function tests = test_fss_vertcat
    tests = functiontests(localfunctions);
end

%% The classic case :  
function testVertcat1(testCase)
    % dans system SISO:
    pol1=frac_ss([2],[1],[5],[2.5],0.8,'N',50,'band',[0.001,1000]);
    pol2=frac_ss([3],[2],[4],[1.8],0.6);
    sys=[pol1;pol2];
    sys_exp=frac_ss([2,0;0,3],[1;2],[5,0;0,4],[2.5;1.8],0.8,'N',50,'band',[0.001,1000]);

    assertEqual(testCase,sys,sys_exp,'sys is not sys_exp');
    assertEqual(testCase,get(sys,'N'),50,'N is not 50');
    assertEqual(testCase,get(sys,'band'),[0.001,1000],'band is not [0.001,1000]');

    %% dans system MIMO:
    pol3=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2,'N',50,'band',[0.001,1000]);
    pol4=frac_ss([3 7;3 5],[2 8;1 6],[4 4;2 3],[1 5;2 3],0.4,'N',100,'band',[10,2000]);
    sysm=vertcat(pol3,pol4);
    
    assertFalse(testCase,isempty(sysm),'sysm is empty');
    assertEqual(testCase,get(sysm,'N'),100,'N is not 100');
    assertEqual(testCase,get(sysm,'band'),[0.001,2000],'band is not [0.001,2000]');

end

%%  frac_ss nan 
% dans systeme SISO:
%sys=vertcat(pol5,pol5,pol1)

%% dans systeme MIMO:
%  pol6=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 nan],0.2,100,[10,1000]);
%  sys=vertcat(pol6,pol4)
 