%~=  Not equal.
%   A ~= B does element by element comparisons between A and B and returns
%   an array with elements set to logical 1 (TRUE) where the relation is
%   true and elements set to logical 0 (FALSE) where it is not. A and B
%   must have compatible sizes. In the simplest cases, they can be the same
%   size or one can be a scalar. Two inputs have compatible sizes if, for
%   every dimension, the dimension sizes of the inputs are either the same
%   or one of them is 1.
%
%   C = NE(A,B) is called for the syntax 'A ~= B' when A or B is an object.
%%   Documentation for ne
%      doc ne
%%   Other functions named ne
%%      categorical/ne      imaqdevice/ne               serial/ne
%      codistributed/ne    instrument/ne               string/ne
%      datetime/ne         iviconfigurationstore/ne    sweepset/ne
%      dlarray/ne          laurmat/ne                  timer/ne
%      frac_tf/ne          laurpoly/ne                 vrfigure/ne
%      frac_zpk/ne         MException/ne               vrnode/ne
%      gpuArray/ne         mtree/ne                    vrworld/ne
%      handle/ne           opaque/ne                   xregcovariance/ne
%      icgroup/ne          opcroot/ne                  xregpointer/ne
%      imaqchild/ne        scribehandle/ne
%