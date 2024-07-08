%.\  Left array divide.
%   B.\A divides each element of A by the corresponding element of B. A and
%   B must have compatible sizes. In the simplest cases, they can be the 
%   same size or one can be a scalar. Two inputs have compatible sizes if, 
%   for every dimension, the dimension sizes of the inputs are either the 
%   same or one of them is 1. The element-wise operators ./ and .\ are 
%   related to each other by the equation A./B = B.\A.
%
%   C = LDIVIDE(B,A) is called for the syntax 'B .\ A' when A or B is an
%   object.
%
%   See also RDIVIDE, MRDIVIDE, MLDIVIDE.
%%   Documentation for ldivide
%      doc ldivide
%%   Other functions named ldivide
%%      codistributed/ldivide    gpuArray/ldivide
%      duration/ldivide         quaternion/ldivide
%      frac_lti/ldivide         tall/ldivide
%      frac_poly_exp/ldivide    timeseries/ldivide
%      frac_poly_imp/ldivide
%