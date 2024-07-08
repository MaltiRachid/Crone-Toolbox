%SS2SS  Change of state coordinates for state-space models.
%
%   SYS = SS2SS(SYS,T) performs the similarity transformation z = Tx on the
%   state vector x of the state-space model SYS. The resulting state-space 
%   model is described by:
%
%               .       -1        
%               z = [TAT  ] z + [TB] u
%                       -1
%               y = [CT   ] z + D u
%
%   or, in the descriptor case,
%
%           -1  .       -1        
%       [TET  ] z = [TAT  ] z + [TB] u
%                       -1
%               y = [CT   ] z + D u  .
%
%   SS2SS is applicable to both continuous- and discrete-time models. For 
%   arrays of state-space models, the transformation T is applied to each 
%   individual model in the array. For GENSS or USS models, the transformation 
%   T is applied to the state vector of the interconnection model (first 
%   output argument of GETLFTMODEL).
%
%   See also CANON, BALREAL, SS, GENSS, GETLFTMODEL.
%%   Documentation for ss2ss
%      doc ss2ss
%%   Other functions named ss2ss
%%      frac_ss/ss2ss    StateSpaceModel/ss2ss
%