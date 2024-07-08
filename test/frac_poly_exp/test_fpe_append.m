%% Description
%
% Test function on :
%          - function : append
%          - class    : frac_poly_exp
%
% Prototype :
%        sys = append(sys1, sys2, sys3, ...)             
%
% Argument in : 
%   varargin : a variable number of frac_poly_exp (fpe)
%
% Argument out :
%   varargout : fpe
%
% This function produces the aggregate system
%
%                 [ SYS1  0               ]
%           SYS = [  0   SYS2             ]
%                 [           SYS3        ]
%                 [                .   0  ]
%                 [                0   .  ]

%% Function-based unit test for frac_fpe_append
% Last revision 13/09/2021

function tests = test_fpe_append
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
function testAppendSISO(testCase)
% two fpe are passed in argument
    pol1=frac_poly_exp([1,2,1],[3,2,0]);
    pol2=frac_poly_exp([3,4,5],[0,1,2.5]);
    sys = append(pol1,pol2);
    sys_exp=frac_poly_exp({[1 2 1] 0 ; 0 [3 4 5]},{[3 2 0] 1;1 [0 1 2.5]});
    
    assertEqual(testCase,sys,sys_exp,'sys is not sys_exp');
end

%% The classic case : multidimensionnal
function testAppendMIMO(testCase)
    pol1=frac_poly_exp([1,2,1],[3,2,0]);
    pol_multi=frac_poly_exp({[1,4] [2,5];[1,4] [2,5]},{[0.2,0] [3.5 1.5]; [0.2,0] [3.5 1.5]});
    sys=append(pol1,pol_multi);
    sys_exp=frac_poly_exp({[1 2 1] 0 0;0 [1 4] [2 5];0 [1 4] [2 5]},{[3 2 0] 1 1;1 [0.2 0] [3.5 1.5];1 [0.2 0] [3.5 1.5]});
    
    assertEqual(testCase,sys,sys_exp,'sys is not sys_exp');
% To append a [1x1] dimension's polynomial with a [2x2] dimension's one
% produces a [3x3] polynomial
end
%% Special Case : NaN polynomial
function testAppendNaN(testCase)
    pol1=frac_poly_exp([1,2,1],[3,2,0]);
    pol_nan=frac_poly_exp(nan);
    sys=append(pol1,pol_nan);

    assertTrue(testCase,isnan(sys),'sys is not NaN');
% append(pol1,pol_nan) produces the NaN polynomial :
end
%% Special Case : Empty polynomial
function testAppendEmpty(testCase)
    pol1=frac_poly_exp([1,2,1],[3,2,0]);
    pol_empty=frac_poly_exp;
    sys=append(pol1, pol_empty);

    assertEqual(testCase,sys,pol1,'sys is not pol1');
% append(pol1 ,pol_empty) = pol1 :
end