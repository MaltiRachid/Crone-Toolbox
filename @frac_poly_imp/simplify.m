%-- help for InputOutputModel/simplify ---
%%SIMPLIFY  Simplifies uncertainty model.
%
%   B = SIMPLIFY(A) uses model-reduction-like techniques to detect and 
%   eliminate redundant copies of uncertain elements. The AutoSimplify 
%   property of each uncertain element in A determines what reduction 
%   methods are used.  After reduction, any uncertain element which does 
%   not actually affect the result is deleted from the model.
%
%   B = SIMPLIFY(A,'full') ignores the AutoSimplify settings and uses 
%   'full' reduction techniques.
%
%   B = SIMPLIFY(A,'basic') ignores the AutoSimplify settings and uses 
%   'basic' reduction techniques.
%
%   See also UMAT, USS, UFRD, UncertainBlock.
%%   Other functions named simplify
%%      digraph/simplify          graph/simplify
%      explicitMPC/simplify      polyshape/simplify
%      frac_poly_exp/simplify    sym/simplify
%      frac_poly_imp/simplify
%