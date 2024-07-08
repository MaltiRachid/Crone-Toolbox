%-- help for DynamicSystem/ssdata ---
%%SSDATA  Quick access to state-space data.
%
%   [A,B,C,D] = SSDATA(SYS) returns the A,B,C,D matrices of the state-space
%   model SYS.  If SYS is not a state-space model, it is first converted to 
%   the state-space representation. If SYS is in descriptor form (nonempty 
%   E matrix), an equivalent explicit form is first derived. If SYS has 
%   internal delays, A,B,C,D are obtained by first setting all internal 
%   delays to zero (delay-free dynamics).
%
%   [A,B,C,D,TS] = SSDATA(SYS) also returns the sample time TS. Other 
%   properties of SYS can be accessed using struct-like dot syntax (for
%   example, SYS.StateName).
%
%   Support for arrays of state-space models:
%
%   [A,B,C,D,TS] = SSDATA(SYS,J1,...,JN) extracts the data for the 
%   (J1,...,JN) entry in the model array SYS.
%
%   If all models in SYS have the same order, SSDATA returns
%   multi-dimensional arrays A,B,C,D where A(:,:,k), B(:,:,k), C(:,:,k), 
%   D(:,:,k) are the state-space matrices of the k-th model SYS(:,:,k).
%
%   If the models in SYS have variable order, use the syntax
%      [A,B,C,D] = SSDATA(SYS,'cell')
%   to extract the state-space matrices of each model as separate cells in
%   the cell arrays A,B,C,D.
%
%   See also SS, DSSDATA, GETDELAYMODEL, TFDATA, ZPKDATA,
%   IDPARAMETRIC/IDSSDATA.
%%   Other functions named ssdata
%%      frac_ss/ssdata
%