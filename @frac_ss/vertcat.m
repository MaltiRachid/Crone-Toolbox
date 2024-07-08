%VERTCAT Vertical concatenation.
%   [A;B] is the vertical concatenation of matrices A and B.  A and B must
%   have the same number of columns. Any number of matrices can be
%   concatenated within one pair of brackets.  Horizontal and vertical
%   concatenation can be combined together as in [1 2;3 4].
%
%   [A B; C] is allowed if the number of rows of A equals the number of
%   rows of B and the number of columns of A plus the number of columns
%   of B equals the number of columns of C.  The matrices in a
%   concatenation expression can themselves by formed via a
%   concatenation as in [A B;[C D]].  These rules generalize in a
%   hopefully obvious way to allow fairly complicated constructions.
%
%   N-D arrays are concatenated along the first dimension. The remaining
%   dimensions must match. 
%
%   C = VERTCAT(A,B) is called for the syntax '[A; B]' when A or B is an
%   object.
%
%   Y = VERTCAT(X1,X2,X3,...) is called for the syntax '[X1; X2; X3; ...]'
%   when any of X1, X2, X3, etc. is an object.
%
%   See also HORZCAT, CAT.
%%   Documentation for vertcat
%      doc vertcat
%%   Other functions named vertcat
%%      Bluetooth/vertcat         icsignal/vertcat
%      categorical/vertcat       iddata/vertcat
%      codistributed/vertcat     inline/vertcat
%      coninputfactor/vertcat    InputOutputModel/vertcat
%      dataset/vertcat           iviconfigurationstore/vertcat
%      datetime/vertcat          laurpoly/vertcat
%      dlarray/vertcat           opcroot/vertcat
%      fints/vertcat             serial/vertcat
%      fittype/vertcat           sweepset/vertcat
%      frac_poly_exp/vertcat     sym/vertcat
%      frac_poly_imp/vertcat     tabular/vertcat
%      frac_ss/vertcat           tall/vertcat
%      frac_tf/vertcat           tcpip/vertcat
%      frac_zpk/vertcat          tscollection/vertcat
%      gpib/vertcat              udp/vertcat
%      gpuArray/vertcat          videoinput/vertcat
%      guidarray/vertcat         visa/vertcat
%      i2c/vertcat               xregdataset/vertcat
%      icdevice/vertcat          xregpointer/vertcat
%      icgroup/vertcat
%