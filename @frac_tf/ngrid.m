%NGRID  Generates grid lines for a Nichols plot.
%   NGRID plots the Nichols chart grid over an existing Nichols plot
%   generated with NICHOLS.  The Nichols chart relates the complex
%   numbers H and H/(1+H), and consists of lines where H/(1+H) has
%   constant magnitude and phase (as H varies in the complex plane).
%
%   NGRID('new') clears the current axes first and sets HOLD ON.
%
%   NGRID(AX,...) plots the grid on the Axes or UIAxes with handle AX.
%
%   NGRID generates a grid over the region -40 db to 40 db in
%   magnitude and -360 degrees to 0 degrees in phase when no plot
%   is contained in the current axis.
%
%   NGRID can only be used for SISO systems.
%
%   See also NICHOLS.
%%   Documentation for ngrid
%      doc ngrid
%%   Other functions named ngrid
%%      frac_tf/ngrid
%