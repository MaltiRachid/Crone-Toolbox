%% Description
%
% Test function on :
%          - function : series
%          - class    : frac_poly_exp
%
% Prototype :
%        Sys = series(Sys1,Sys2,outputs1,inputs2)            
%
% Argument in : 
%   Sys1, Sys2       : Frac_poly_exp object
%   outputs1,inputs2 : row vector
% 
% Argument out :
% 	Sys : Frac_poly_exp object
% 
% Series interconnection of the two frac_poly_exp models.
%
%                                  +------+
%                           v2 --->|      |-----> y2
%                  +------+        | SYS2 |
%                  |      |------->|      |-----> y2
%         u1 ----->|      |y1   u2 +------+
%                  | SYS1 |
%         u2 ----->|      |---> z1
%                  +------+
%
%   SYS = SERIES(SYS1,SYS2,OUTPUTS1,INPUTS2) connects two frac_poly_exp models 
%   SYS1 and SYS2 in series such that the outputs of SYS1 specified by
%   OUTPUTS1 are connected to the inputs of SYS2 specified by INPUTS2.  
%   The vectors OUTPUTS1 and INPUTS2 contain indices into the outputs 
%   and inputs of SYS1 and SYS2, respectively. 
%
%   The resulting frac_poly_exp model SYS maps u1 to y2.
%
%   If OUTPUTS1 and INPUTS2 are omitted, SERIES connects SYS1 and SYS2
%   in cascade and returns
%                     SYS = SYS2 * SYS1 .
%   
%   Copyright 2005 CRONE

%% Function-based unit test for frac_fpe_series
% Last revision 21/09/2021

function tests = test_fpe_series
    tests = functiontests(localfunctions);
end

%% The classic case : unidimensionnal
%
%
% With unidimensionnal polynomial parallel computes the operation plus.
% Sys = Sys1 * Sys2

%% The classic case : multidimensionnal
function testSeriesMIMO(testCase)
% Let's consider 2 by 2 polynomial
    pol1=frac_poly_exp([1 2 3],[2 1 0]);
    pol2=frac_poly_exp([4 5 6],[5 4 3]);
    pol3=enlarge(pol1,2,2);
    pol4=enlarge(pol2,2,2);
    
%     pol3 =  [s^2 + 2s + 3    s^2 + 2s + 3]
%             [                            ]
%             [s^2 + 2s + 3    s^2 + 2s + 3]
% 
%     pol4 =  [4s^5 + 5s^4 + 6s^3    4s^5 + 5s^4 + 6s^3]
%             [                                        ]
%             [4s^5 + 5s^4 + 6s^3    4s^5 + 5s^4 + 6s^3]
    
% The connection of all the pins will give back the same result than an addition
    pols1=series(pol3,pol4,[1 2],[1 2]);
    pols1_exp=pol3*pol4;
    
    assertEqual(testCase,pols1,pols1_exp,'pols1 is not pols1_exp');
    
% Let's consider the same polynomials
% We'll connect the pins like in the precedent diagram
    pols2=series(pol3,pol4,[1],[2]);
    pols2_exp=pol1*pol2;
    
    assertEqual(testCase,pols2,pols2_exp,'pols2 is not pols2_exp');
end
%% Special Case : NaN polynomial
function testSeriesNaN(testCase)
    pol1=frac_poly_exp([1 2 3],[2 1 0]);
    pol_nan=frac_poly_exp(nan);
% If one of the argument is a NaN polynomial the result is the NaN
% polynomial. Note that the dimension of pol_nan are [1 1] so the pin
% need'nt to be specified.
    pols=series(pol1,pol_nan);
    
    assertTrue(testCase,isnan(pols));
end
%% Special Case : Empty polynomial
% The size of pol_vide is [0 0], the function won't work