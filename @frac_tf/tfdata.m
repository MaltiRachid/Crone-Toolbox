%-- help for DynamicSystem/tfdata ---
%%TFDATA  Quick access to transfer function data.
%
%   [NUM,DEN] = TFDATA(SYS) returns the numerator(s) and denominator(s) 
%   of the transfer function SYS. For a transfer function with NY outputs 
%   and NU inputs, NUM and DEN are NY-by-NU cell arrays where the (I,J) 
%   entry specifies the transfer function from input J to output I. 
%   SYS is first converted to transfer function if necessary.
%
%   [NUM,DEN,TS] = TFDATA(SYS) also returns the sample time TS. Other
%   properties of SYS can be accessed using struct-like dot syntax (for
%   example, SYS.ioDelay).
%
%   [NUM,DEN,TS,SDNUM,SDDEN] = TFDATA(SYS) also returns the uncertainties in
%   the numerator and denominator coefficients of identified system SYS.
%   SDNUM{i,j}(k) is the 1 std uncertainty in the value NUM{i,j}(k) and
%   SDDEN{i,j}(k) is the 1 std uncertainty in the value DEN{i,j}(k). If SYS
%   does not contain uncertainty information, SDNUM and SDDEN are [].
%
%   For a single SISO model SYS, the syntax
%       [NUM,DEN] = TFDATA(SYS,'v')
%   returns the numerator and denominator as row vectors rather than
%   cell arrays.
%
%   [NUM,DEN,TS,...] = TFDATA(SYS,J1,...,JN) extracts the data for the
%   (J1,...,JN) entry in the model array SYS.
%
%   See also TF, ZPKDATA, SSDATA, IDTF.
%%   Other functions named tfdata
%%      frac_tf/tfdata
%