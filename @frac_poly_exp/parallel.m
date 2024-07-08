%PARALLEL  Parallel connection of two input/output models.
%
%                          +------+
%            v1 ---------->|      |----------> z1
%                          |  M1  |
%                   u1 +-->|      |---+ y1
%                      |   +------+   |
%             u ------>+              O------> y
%                      |   +------+   |
%                   u2 +-->|      |---+ y2
%                          |  M2  |
%            v2 ---------->|      |----------> z2
%                          +------+
%
%   M = PARALLEL(M1,M2,IN1,IN2,OUT1,OUT2) connects the input/output models
%   M1 and M2 in parallel. The inputs specified by IN1 and IN2 are connected
%   and the outputs specified by OUT1 and OUT2 are summed. The resulting
%   model M maps [v1;u;v2] to [z1;y;z2]. The vectors IN1 and IN2 contain
%   indices into the input vectors of M1 and M2, respectively, and define
%   the input channels u1 and u2 in the diagram. Similarly, the vectors
%   OUT1 and OUT2 contain indexes into the outputs of M1 and M2.
%
%   If IN1,IN2,OUT1,OUT2 are jointly omitted, PARALLEL forms the standard
%   parallel interconnection of M1 and M2 and returns M = M1 + M2.
%
%   If M1 and M2 are arrays of models, PARALLEL returns a model array M of
%   the same size where
%      M(:,:,k) = PARALLEL(M1(:,:,k),M2(:,:,k),IN1,...) .
%
%   For dynamic systems SYS1 and SYS2,
%      SYS = PARALLEL(SYS1,SYS2,'name')
%   connects SYS1 and SYS2 by matching their I/O names. All I/O names of
%   SYS1 and SYS2 must be defined and the matching names appear in SYS in
%   the same order as in SYS1.
%
%   See also APPEND, SERIES, FEEDBACK, INPUTOUTPUTMODEL, DYNAMICSYSTEM.
%%   Documentation for parallel
%      doc shared/parallel
%%   Parallel Computing Toolbox Documentation
%      doc parallel
%%   Other functions named parallel
%%      frac_poly_exp/parallel    InputOutputModel/parallel
%      frac_tf/parallel
%