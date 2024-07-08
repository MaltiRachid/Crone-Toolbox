%% Description
%
% Test function on :
%          - function : isnan
%          - class    : frac_ss
%
% Return 1 if any of the element of fss is NaN
% Argument in : 
%	fpe : Frac_ss object
%	
% Argument out :
%	bool : logical
%
%   Copyright © CRONE 	14/09/2009
%% Function-based unit test for test_fss_isnan
% Last revision 29/09/2021

function tests = test_fss_isnan
    tests = functiontests(localfunctions);
end

%% The classic case :  
function testIsnan(testCase)
    % dans system SISO:
    pol1=frac_ss([2],[1],[5],[2.5],0.8);
    pol1nanA=frac_ss([NaN],[1],[5],[2.5],0.8);
    pol1nanB=frac_ss([1],[NaN],[5],[2.5],0.8);
    pol1nanC=frac_ss([1],[1],[NaN],[2.5],0.8);
    pol1nanD=frac_ss([1],[1],[5],[NaN],0.8);
    pol1nanO=frac_ss([1],[1],[5],[2.5],NaN);

    assertFalse(testCase,isnan(pol1),'pol1 is nan');
    assertTrue(testCase,isnan(pol1nanA),'pol1nanA is not nan');
    assertTrue(testCase,isnan(pol1nanB),'pol1nanB is not nan');
    assertTrue(testCase,isnan(pol1nanC),'pol1nanC is not nan');
    assertTrue(testCase,isnan(pol1nanD),'pol1nanD is not nan');
    assertTrue(testCase,isnan(pol1nanO),'pol1nanO is not nan');

    % dans system MIMO:
    pol2=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2, 'N',50,'band',[0.001,1000]);
    pol2nanA=frac_ss([2 NaN;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],0.2, 'N',50,'band',[0.001,1000]);
    pol2nanB=frac_ss([2 5;2 4],[3 NaN;1 2],[2 5;2 1],[2,2;1 1],0.2, 'N',50,'band',[0.001,1000]);
    pol2nanC=frac_ss([2 5;2 4],[3 4;1 2],[2 NaN;2 1],[2,2;1 1],0.2, 'N',50,'band',[0.001,1000]);
    pol2nanD=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,NaN;1 1],0.2, 'N',50,'band',[0.001,1000]);
    pol2nanO=frac_ss([2 5;2 4],[3 4;1 2],[2 5;2 1],[2,2;1 1],NaN, 'N',50,'band',[0.001,1000]);
    
    assertFalse(testCase,isnan(pol2),'pol2 is nan');
    assertTrue(testCase,isnan(pol2nanA),'pol2nanA is not nan');
    assertTrue(testCase,isnan(pol2nanB),'pol2nanB is not nan');
    assertTrue(testCase,isnan(pol2nanC),'pol2nanC is not nan');
    assertTrue(testCase,isnan(pol2nanD),'pol2nanD is not nan');
    assertTrue(testCase,isnan(pol2nanO),'pol2nanO is not nan');

    %% The special case
    %frac_ss vide
    pol3=frac_ss;
    assertFalse(testCase,isnan(pol3),'pol3 is nan');
end
 
