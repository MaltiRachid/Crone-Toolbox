%SUBSREF Subscripted reference.
%   A(I) is an array formed from the elements of A specified by the
%   subscript vector I.  The resulting array is the same size as I except
%   for the special case where A and I are both vectors.  In this case,
%   A(I) has the same number of elements as I but has the orientation of A.
%
%   A(I,J) is an array formed from the elements of the rectangular
%   submatrix of A specified by the subscript vectors I and J.  The
%   resulting array has LENGTH(I) rows and LENGTH(J) columns.  A colon used
%   as a subscript, as in A(I,:), indicates all columns of those rows
%   indicated by vector I. Similarly, A(:,J) = B means all rows of columns
%   J.
%
%   For multi-dimensional arrays, A(I,J,K,...) is the subarray specified by
%   the subscripts.  The result is LENGTH(I)-by-LENGTH(J)-by-LENGTH(K)-...
%
%   A{I} when A is a cell array and I is a scalar is a copy of
%   the array in the specified cell of A.  If I has more than one
%   element, this expression is a comma separated list (see LISTS).
%   Multiple subscripts that specify a scalar element, as in A{3,4}, also
%   work.
%
%   A(I).field when A is a structure array and I is a scalar is a copy of
%   the array in the field with the name 'field'.  If I has more than one
%   element, this expression is a comma separated list.  If A is a 1-by-1
%   structure array, then the subscript can be dropped.  In this case,
%   A.field is the same as A(1).field.
%
%   B = SUBSREF(A,S) is called for the syntax A(I), A{I}, or A.I when A is
%   an object.  S is a structure array with the fields:
%       type -- character vector or string containing '()', '{}', or '.' 
%               specifying the subscript type.
%       subs -- cell array, character vector, or string containing the 
%               actual subscripts.
%
%   Subscripting expressions can use more than one level to form more
%   complicated expressions, for example A{1}.field(3:5).  For an
%   expression with N subscripting levels, S is an N-by-1 structure array.
%   See the subscripting examples in the documentation for more
%   information.
%
%   See also SUBSASGN, SUBSTRUCT, PAREN, SUBSINDEX, LISTS, 
%            NUMARGUMENTSFROMSUBSCRIPT.
%%   Documentation for subsref
%      doc subsref
%%   Other functions named subsref
%%      axisobj/subsref              hgbin/subsref
%      axistext/subsref             icgroup/subsref
%      calendarDuration/subsref     iddata/subsref
%      categorical/subsref          imaqchild/subsref
%      cfit/subsref                 imaqdevice/subsref
%      cgoppoint/subsref            inline/subsref
%      cgprojconnections/subsref    InputOutputModel/subsref
%      codistributed/subsref        instrument/subsref
%      Composite/subsref            iviconfigurationstore/subsref
%      coninputfactor/subsref       laurmat/subsref
%      dataset/subsref              listitemselector/subsref
%      datetime/subsref             mvgraph1d/subsref
%      designdev/subsref            mvgraph2d/subsref
%      diffusion/subsref            mvgraph3d/subsref
%      digraph/subsref              mvgraph4d/subsref
%      distributed/subsref          network/subsref
%      drift/subsref                opcroot/subsref
%      duration/subsref             printtemplate/subsref
%      fdax/subsref                 scribehandle/subsref
%      fdline/subsref               scribehgobj/subsref
%      fdmeas/subsref               serial/subsref
%      fdspec/subsref               sfit/subsref
%      fighandle/subsref            sweepset/subsref
%      figobj/subsref               sweepsetfilter/subsref
%      fints/subsref                tabular/subsref
%      fittype/subsref              tall/subsref
%      frac_idtf/subsref            testplansweepsetfilter/subsref
%      frac_lti/subsref             tscollection/subsref
%      frac_poly_exp/subsref        vrnode/subsref
%      frac_poly_imp/subsref        vrworld/subsref
%      frac_ss/subsref              xregdataset/subsref
%      frac_tf/subsref              xregdesign/subsref
%      frac_zpk/subsref             xregexportmodel/subsref
%      gpuArray/subsref             xregmodel/subsref
%      graph/subsref                xregmonitorplotproperties/subsref
%      groupedData/subsref          xregpointer/subsref
%      gsref/subsref                xregtable/subsref
%      guidarray/subsref
%