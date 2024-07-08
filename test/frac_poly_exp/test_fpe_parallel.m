%% Description
%
% Test function on :
%          - function : parallel
%          - class    : frac_poly_exp
%
% Prototype :
%        Sys = parallel(Sys1,Sys2,inp1,inp2,out1,out2)            
%
% Argument in : 
%   Sys1, Sys2          : Frac_poly_exp object
%   inp1,inp2,out1,out2 : row vector
% 
% Argument out :
% 	Sys : Frac_poly_exp object
% 
% Parallel interconnection of two frac_poly_exp models.
%
%                          +------+
%            v1 ---------->|      |----------> z1
%                          | SYS1 |
%                   u1 +-->|      |---+ y1
%                      |   +------+   |
%             u ------>+              O------> y
%                      |   +------+   |
%                   u2 +-->|      |---+ y2
%                          | SYS2 |
%            v2 ---------->|      |----------> z2
%                          +------+
%
%   SYS = PARALLEL(SYS1,SYS2,IN1,IN2,OUT1,OUT2) connects the two 
%   frac_poly_exp models SYS1 and SYS2 in parallel such that the inputs 
%   specified by IN1 and IN2 are connected and the outputs specified
%   by OUT1 and OUT2 are summed.  The resulting frac_poly_exp model SYS maps 
%   [v1;u;v2] to [z1;y;z2].  The vectors IN1 and IN2 contain indexes 
%   into the input vectors of SYS1 and SYS2, respectively, and define 
%   the input channels u1 and u2 in the diagram.  Similarly, the 
%   vectors OUT1 and OUT2 contain indexes into the outputs of these 
%   two systems. 
%
%   If IN1,IN2,OUT1,OUT2 are jointly omitted, PARALLEL forms the 
%   standard parallel interconnection of SYS1 and SYS2 and returns
%          SYS = SYS2 + SYS1 .
%
%	Copyright 2005 CRONE 

%% Function-based unit test for frac_fpe_parallel
% Last revision 15/09/2021

function tests = test_fpe_parallel
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
%
%
% With unidimensionnal polynomial parallel computes the operation plus.
% Sys = Sys1 + Sys2

%% The classic case : multidimensionnal
function testParallelMIMO(testCase)
% Let's consider 2 by 2 polynomial
    pol1=frac_poly_exp([1 2 3],[2 1 0]);
    pol2=frac_poly_exp([4 5 6],[5 4 3]);
    pol3=enlarge(pol1,2,2);
    pol4=enlarge(pol2,2,2);
% The connection of all the pins will give back the same result than an addition
    sys1=parallel(pol3,pol4,[1 2],[1 2],[1 2],[1 2]);
    assertEqual(testCase,sys1,pol3+pol4,'sys1 is not pol3+pol4');
%% The classic case : multidimensionnal
% Let's consider the same polynomials
% We'll connect the pins like in the precedent diagram
    sys2_exp=[pol1 pol1 frac_poly_exp(0); pol1 pol1+pol2 pol2; frac_poly_exp(0) pol2 pol2];
    sys2=parallel(pol3,pol4,[2],[1],[2],[1]);
    assertEqual(testCase,simplify(sys2),sys2_exp,'sys2 is not sys2_exp');
end
%% Special Case : NaN polynomial
function testParallelNaN(testCase)
    pol1=frac_poly_exp([1 2 3],[2 1 0]);
    pol_nan=frac_poly_exp(nan);
% If one of the argument is a NaN polynomial the result is the NaN
% polynomial. Note that the dimension of pol_nan are [1 1] so the pin
% need'nt to be specified.
    sys_nan=parallel(pol1,pol_nan);
    assertTrue(testCase,isnan(sys_nan),'sys_nan is not nan');
end
%% Special Case : Empty polynomial
function testParallelEmpty(testCase)
    pol1=frac_poly_exp([1 2 3],[2 1 0]);
    pol_vide=frac_poly_exp;
% The size of pol_vide is [0 0] the pins cannot be specified. 
% Despite if no pins are specified, the result will be the other, non-empty, fpe.
    sys_vide=parallel(pol1,pol_vide);
    assertEqual(testCase,sys_vide,pol1,'sys_vide is not pol1');
end