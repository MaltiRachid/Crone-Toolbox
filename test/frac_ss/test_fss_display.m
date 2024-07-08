%% Description
%
% Test function on :
%          - function : display
%          - class    : frac_ss
%
% Prototype :
%        s=display(fss)             
%
% Argument in : 
%   fss : Frac_ss object
%
% Argument out :
%   chaine s
%
% Print the object to the screen.

%% Function-based unit test for test_fss_display
% Last revision 30/09/2021

function tests = test_fss_display
    tests = functiontests(localfunctions);
end

%% The classic case :  
function testDisplay1(testCase)
    % frac_ss créé sans préciser band et N
    %% dans system SISO:
    pol1=frac_ss([2],[1],[5],[2.5],0.8);
    display(pol1);
    %% dans system MIMO:
    pol2=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2);
    display(pol2);
end
%% frac_ss créé avec les valeurs de  band et N 
function testDisplay2(testCase)
    %% dans systeme SISO:
    pol3=frac_ss([2],[1],[5],[2.5],0.8, 'N', 50, 'band', [0.001,1000]);
    display(pol3);
    %% dans systeme MIMO: 
    pol4=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2, 'N', 100, 'band', [10,1000]);
    display(pol4);
end
%% The special case de systeme NaN et systeme vide
function testDisplayEmpty(testCase)
    %% frac_ss vide
    pol5=frac_ss;
    display(pol5)
end
%% dans systeme MIMO:
% %
% pol7=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 nan],0.2,100,[10,1000]);
% display(pol7)
%
