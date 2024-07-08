%CHAR Create character array
%   CHR = CHAR(X) converts array X of nonnegative integer codes into a
%   character array. Valid codes range from 0 to 65535, where codes 0 to
%   127 correspond to 7-bit ASCII characters. The characters that MATLAB
%   can process (other than 7-bit ASCII characters) depend on your current
%   locale setting. Use DOUBLE to convert characters to numeric codes.
%
%   CHR = CHAR(C), when C is a cell array of character vectors, places each 
%   element of C into a row of the character array CHR. Use CELLSTR to
%   convert back.
%
%   CHR = CHAR(STR), when STR is a string array, converts each element of STR into 
%   a row of the character array CHR. Use STRING to convert back.
%
%   CHR = CHAR(T1,T2,T3,..) forms the character array CHR containing the
%   text from T1,T2,T3,... as rows. CHAR automatically pads each row with
%   spaces in order to form a character array. Each text parameter, Ti,
%   can itself be a character array. This allows the creation of
%   arbitrarily large character arrays. If Ti has no characters, then the
%   corresponding row of CHR is filled with spaces.
%
%   See also STRING, DOUBLE, CELLSTR, ISCELLSTR, ISCHAR, ISSTRING.
%%   Documentation for char
%      doc char
%%   Other functions named char
%%      categorical/char            localpspline/char
%      cgconconstraint/char        localsurface/char
%      cgconstraint/char           localtruncps/char
%      cgexpr/char                 localusermod/char
%      cgexprconstraint/char       matlab.net.http.HeaderField/char
%      cgfeature/char              matlab.net.http.MediaType/char
%      cgfuncmodel/char            matlab.net.QueryParameter/char
%      cgoppoint/char              matlab.net.URI/char
%      cgoptimitem/char            mbcinputfactor/char
%      cgpointconstraint/char      opaque/char
%      cgpointobjective/char       sweepset/char
%      cgprec/char                 sweepsetfilter/char
%      cgprecfloat/char            sym/char
%      cgpreclookupfix/char        tall/char
%      cgprecpolyfix/char          xreg3xspline/char
%      cgrangeconstraint/char      xregclickinput/char
%      cgsumconstraint/char        xregclicktolinput/char
%      cgsumobjective/char         xregcovariance/char
%      cgtabgradconstraint/char    xregcubic/char
%      codistributed/char          xregdesign/char
%      coninputfactor/char         xreggpr/char
%      datetime/char               xreghybridrbf/char
%      des_constraints/char        xreginterprbf/char
%      fittype/char                xreglistctrl/char
%      frac_poly_exp/char          xregmodel/char
%      frac_poly_imp/char          xregmodswitch/char
%      frac_tf/char                xregmulti/char
%      frac_zpk/char               xregnnet/char
%      inline/char                 xregrangeinput/char
%      junit/char                  xregrbf/char
%      localavfit/char             xregtwostage/char
%      localbspline/char           xregunispline/char
%      localmulti/char             xregusermod/char
%      localpoly/char              xregvectorinput/char
%