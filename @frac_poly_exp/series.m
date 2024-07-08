%SERIES  Series connection of two input/output models.
%
%                                  +------+
%                           v2 --->|      |
%                  +------+        |  M2  |-----> y2
%                  |      |------->|      |
%         u1 ----->|      |y1   u2 +------+
%                  |  M1  |
%                  |      |---> z1
%                  +------+
%
%   M = SERIES(M1,M2,OUTPUTS1,INPUTS2) connects the input/ouput models 
%   M1 and M2 in series. The vectors of indices OUTPUTS1 and INPUTS2 
%   specify which outputs of M1 and which inputs of M2 are connected 
%   together. The resulting model M maps u1 to y2.
%
%   If OUTPUTS1 and INPUTS2 are omitted, SERIES connects M1 and M2
%   in cascade and returns M = M2 * M1.
%
%   If M1 and M2 are arrays of models, SERIES returns a model array M of 
%   the same size where 
%      M(:,:,k) = SERIES(M1(:,:,k),M2(:,:,k),OUTPUTS1,INPUTS2) .
%
%   For dynamic systems SYS1 and SYS2, 
%      SYS = SERIES(SYS1,SYS2,'name')
%   connects SYS1 and SYS2 by matching their I/O names. The output names 
%   of SYS1 and input names of SYS2 should be fully defined.
%
%   See also APPEND, PARALLEL, FEEDBACK, INPUTOUTPUTMODEL, DYNAMICSYSTEM.
%%   Documentation for series
%      doc series
%%   Other functions named series
%%      frac_poly_exp/series    InputOutputModel/series    sym/series
%      frac_tf/series
%