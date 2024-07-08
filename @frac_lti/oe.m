%OE  Estimate Output-Error polynomial model using time or frequency domain data.
%
%  M = OE(Z, [nb nf nk])
%    estimates an Output Error model represented by:
%      y(t) = [B(q)/F(q)] u(t-nk) +  e(t)
%    where:
%       nb = order of B polynomial + 1 (Ny-by-Nu matrix)
%       nf = order of F polynomial     (Ny-by-Nu matrix)
%       nk = input delay (in number of samples, Ny-by-Nu matrix)
%       (Nu = number of inputs, Ny = number of outputs)
%
%    The estimation may be performed using either time or frequency domain
%    data. The estimated model is delivered as an @idpoly object. M
%    contains the estimated values for B and F polynomials along with their
%    covariances and structure information.
%
%    Z is the estimation data given as an IDDATA or an IDFRD object. Use
%    IDDATA object for input-output signals (time or frequency domain). Use
%    FRD or IDFRD object for frequency response data. Type "help iddata"
%    and "help idfrd" for more information. nb, nf and nk are the
%    polynomial orders associated with the OE model.
%
%  M = OE(Z, [nb nf nk], 'Name1', Value1, 'Name2', Value2,...)
%    specifies additional attributes of the model structure as name-value
%    pairs. Specify as one or more of the following:
%    'InputDelay': Specify input delay as a double vector of length equal
%                 to number of inputs. For continuous-time models, use a
%                 vector of real numbers. For discrete-time models, value
%                 must be an integer vector denoting the delay as multiples
%                 of sample time.
%      'ioDelay': Input-to-output delay (double matrix). For
%                 continuous-time models, specify as an Ny-by-Nu matrix of
%                 nonnegative numbers. For discrete-time models, the value
%                 must be an integer matrix denoting the delays as
%                 multiples of sample time; in discrete-time case, this is
%                 useful as a replacement for "nk" order - max(nk-1,0) lags
%                 can be factored out as "ioDelay" value.
%
%  M = OE(Z, [nb nf nk], ..., OPTIONS)
%    specifies estimation options that configure the estimation objective,
%    initial conditions and numerical search method to be used for
%    estimation. Use the "oeOptions" command to create the option set
%    OPTIONS.
%
%  M = OE(Z, M0)
%  M = OE(Z, M0, OPTIONS)
%    uses the IDPOLY model M0 to configure the initial parameterization of
%    the resulting model M. M0 must be a model of OE structure (only A,
%    B and C polynomials must be active). M0 may be created using the
%    IDPOLY constructor or could be the result of a previous estimation.
%    The initial model argument, M0, may be followed by estimation options
%    to configure estimation options. If OPTIONS is not specified and M0
%    was created by estimation, the options are taken from M0.Report.OptionsUsed.
%
%   Continuous Time Model Estimation
%   It is recommended to use TFEST for continuous-time estimations.
%   However, when using continuous-time frequency domain data (IDDATA or
%   IDFRD with Ts=0), continuous-time models are also estimated using OE.
%   Then 'nk' should be omitted from orders: M = OE(Z,[nb nf]).
%
%  [SYS, IC] = OE(DATA, ...)
%    returns the estimated initial conditions IC as an @initialCondition
%    object. If DATA is multiple experiments, IC is an object array with
%    one value for each data experiement. Type "help initialCondition" for
%    more information.
%
%   Example: Fit continuous-time transfer function to frequency response.
%   1. Generate data:
%       SYS = tf([1 3],[1 2 1 1]); % TF requires Control System Toolbox
%       G = idfrd(SYS,logspace(-2,2,256)); % continuous-time FR data
%   2. Estimate an OE model to fit the data G
%       M = oe(G, [2 3]); % use syntax OE(DATA, [nb, nf])
%       bode(G, M) % compare data to model
%
%  NOTE: Output Error models are a special configuration of IDPOLY models
%  that have only two active polynomials - B and F. For such models, it may
%  be more convenient to use IDTF model object and the associated
%  estimation command TFEST.
%
%   See also OEOPTIONS, TFEST, ARX, ARMAX, IV4, N4SID, BJ, POLYEST, IDPOLY,
%   IDDATA, IDFRD, IDPARAMETRIC/SIM, COMPARE, initialCondition.
%%   Documentation for oe
%      doc oe
%%   Other functions named oe
%%      frac_lti/oe
%