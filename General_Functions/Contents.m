% CRONE
% Version 2013 (R2007)  2013
%
% frac_lti
%   arx                 - Fractional system identification using direct differentiation of input/output signals.
%   bode                - Plot the diagram of bode of the fractionnal transfer function f
%   canon               - Canonical state-space realizations
%   copyband            - Copy bandwidth, N (number of cells), and sim from sys2 into sys1 without affecting numerator and denominator characteristics
%   crone_bode          - Plots a Bode diagram defined by x, y pairs
%   crone_nichols       - Plots a Black / Nichols diagram defined by x, y pairs
%   crone_nyquist       - Plots a Nyquist diagram (complex plan) defined by x, y pairs
%   display             - Prints the object to the screen
%   eval_oe    			- Evaluation of function oe
%   eval_oosrivcf		- Evaluation of function oosrivcf
%   frac2int			- Computes an approximation of the fractional transfer function using Oustaloup's approximation
%   frac2intsn			- Computes an approximation using recursive pole and zero distributions of sys = s^n
%   frac_lti			- Returns a frac_lti object
%   frac_lti_data		- Copies the fields of a frac_lti object
%   freqgen             - Creates a frequency vector from a fractional transfert function
%   freqresp			- Computes the frequency response of a fractional transfer function
%   get                 - collects the fields prop_name of the object afp 
%   gob                 - Computes the orthogonal functions G from the generating functions F
%   impulse             - Gives impulse response of frac_lti objects
%   isempty             - Returns the boolean flti is empty
%   isstable			- Tests if the fractionnal transfer function t is stable
%   ldivide     		- Connects the two fractional systems 1/fr1 and fr2 in parallel: res = fr1 \ fr2
%   length              - Is equivalent to MAX(SIZE(SYS)) for non-empty frac_lti arrays
%   logo_crone			- Adds the CRONE logo at the bottom of a figure
%   lsim    			- Simulate time response of frac_lti models to arbitrary inputs
%   minus               - Connects the two fractional systems as: sys = sys1 - sys2
%   mldivide			- Connects the two fractional systems as: sys =   sys2 / sys1
%   mpower  			- computes the r-th power of system SYS as: sys = (SYS)^r 
%   mrdivide			- Connects the two fractional systems as: sys = sys1 / sys2
%   nichols             - Draws the Nichols plot of the dynamical system
%   norm    			- Computes the Hp norm of a dynamic system
%   oe      			- Estimates Output-Error fractional model
%   oemodal             - Fractional system identification using direct differentiation
%   oosrivcf            - Estimates ARX fractional model, differentiation orders are estimated with a gradient based algorithm and coefficients with srivcf
%   set     			- Enables to set object properties
%   srivcf              - Estimates ARX fractional model with simplified refined instrumental variable for continuous-time fractional models
%   stabilize			- Stalibilizes a commensurate fractional transfer function that has unstable s^nu poles
%   step    			- Plots the step response of the fractionnal transfer function
%   subsasgn			- Permits the acces to fields
%   subsref     		- Permits the acces of fields
%   svf                 - Fractional system identification using State Variable Filters


% frac_poly_exp
%   append  			- Groups LTI models by appending their inputs and outputs
%   cancel_zero_coef	- Removes the nul coefficents of a frac_poly_exp object
%   char        		- Converts a frac_poly_exp object into a string
%   clean               - Sorts the orders of a frac_poly_exp object in the descending order and removes the nul coefficents.
%   commensurate        - Computes the commun factor of the differentiation order vector
%   ctranspose			- Transposes of fractional explicit polynomial cell
%   display             - Prints the frac_poly_exp object to the screen
%   eig                 - Computes the eigenvalues
%   enlarge             - Forms an n x m matrix with components of the frac_poly_exp object
%   eq                  - Compares two frac_poly_exp objects
%   frac_poly_exp		- Creates an explicit fractional polynomial object
%   freqresp			- Computes the frequency response of a frac_poly_exp object
%   get     			- Returns the value of the field prop_name of the frac_poly_exp object
%   horzcat    			- Description
%   iscomplex			- Returns the boolean result corresponding to 'fpe has a complex coef or order'
%   isempty             - Returns the boolean result 'fpe is empty'
%   isnan               - Returns the boolean result 'any element of fpe is NaN'
%   ldivide             - Creates the frac_tf object sys = fpe2 / fpe1
%   length              - Returns the length of frac_poly_exp_object fpe
%   match_same_order	- Matches the differential orders of a frac_poly_exp object
%   minus   			- Computes the substraction of two frac_poly_exp object
%   mpower  			- Computes the r-th power of frac_poly_exp object
%   mtimes      		- Computes the linear algebraic product of two frac_poly_exp objects
%   multi   			- Catches the size of the system and fills in cells with the results of the function called on unidimensional case
%   ne      			- Returns the boolean result of the 'not equal' operator between two frac_poly_exp objects
%   parallel			- Makes the parallel interconnection of two frac_poly_exp objects
%   plus    			- Computes the addition of two frac_poly_exp objects
%   rdivide    			- Creates the frac_tf object sys = fpe1 / fpe2
%   roots   			- computes the roots of a frac_poly_exp object
%   series  			- Makes the interconnection of the two frac_poly_exp objects
%   set     			- Permits the modification of the object fields
%   size    			- Returns the size of a frac_poly_exp object
%   sort    			- Sorts in ascending or descending order
%   subsasgn   			- Enables subscripted assignment
%   subsref         	- Permits the access of fields
%   times       		- Permits the multiplication of two frac_poly_exp object
%   transpose			- Transposes frac_poly_exp objects
%   uminus      		- Computes -fpe
%   vertcat     		- performs the vertical concatenation of frac_poly_exp objects


% frac_poly_imp
%   char        		- Converts a frac_poly_imp object into a string
%   display     		- Prints the frac_poly_imp object to the screen
%   enlarge     		- Forms an n x m matrix with components of the frac_poly_imp object
%   eq                  - Compares fpi1 with fpi2 and returns the boolean result
%   fpe                 - Gives a quick access to the frac_poly_exp object used in the frac_poly_imp object
%   frac_poly_imp		- Creates an implicit fractional polynomiaL object
%   get     			- Returns the value of the field prop_name of the frac_poly_imp object fpi
%   horzcat    			- Performs the horizontal concatenation of frac_poly_imp objects
%   imp_order			- Gives a quick access to the implicit order used in the frac_poly_imp object
%   iscomplex			- Returns the boolean result 'fpi has a complex fpe or order'
%   isnan   			- Returns the boolean result 'any element of fpi is NaN'
%   ldivide 			- Creates the frac_tf object sys = fpi2 / fpi1
%   minus   			- Computes the substraction of two frac_poly_imp objects
%   mpower              - Computes a frac_poly_imp object to the power r
%   mtimes              - Computes the multiplication of two frac_poly_imp objects
%   multi               - Deals with multi-dimensional systems
%   ne      			- Returns the boolean result of the 'not equal' operator between two frac_poly_imp objects
%   plus    			- Computes the addition of two frac_poly_imp objects
%   rdivide    			- Creates the frac_tf object sys = fpi1 / fpi2
%   roots   			- Computes the roots of a frac_poly_exp object used in the frac_poly_imp object
%   set     			- Permits the modification of the frac_poly_imp object fields
%   subsasgn 			- Enables subscripted assignment
%   subsref    			- Permits the access of fields
%   times   			- Permits the multiplication of two frac_poly_imp objects
%   transpose			- Makes the transposition of frac_poly_imp objects: fpit = fpi'
%   uminus  			- Computes -fpi
%   vertcat    			- Performs the vertical concatenation of frac_poly_imp objects



% frac_ss
%   canon   			- Computes a canonical fractional state-space realization
%   display          	- Prints the frac_ss object to the screen
%   eq                  - Compares fss1 with fss2 and returns the boolean result
%   frac_ss             - Creates a continuous-time fractional state-space system
%   get                 - Returns the value of the field prop_name of the frac_ss object fss
%   horzcat 			- performs the horizontal concatenation of frac_ss objects
%   isempty 			- Returns the boolean result 'fss is empty'
%   isnan   			- Returns the boolean result 'any element of fss is NaN'
%   ne      			- Returns the boolean result of the 'not equal' operator between two frac_ss objects
%   set     			- Permits the modification of the frac_ss object fields
%   size    			- Returns the size of a frac_ss object.
%   ss2ss   			- Creates a new frac_ss object new_fss
%   ss2tf   			- Calculates the transfer function frac_tf asssociated to the frac_ss object fss
%   ssdata  			- Returns the fractional state-space frac_ss parameters
%   subsasgn			- Enables subscripted assignment
%   subsref    			- Permits the access of fields
%   transpose			- Makes the transposition of frac_ss objects
%   vertcat    			- Performs the vertical concatenation of frac_ss objects



% frac_tf
%   char        		- Converts a frac_poly_exp object into a string
%   clean        		- Returns the system ftf in a clean version
%   commensurate     	- Computes the commensurate order of a frac_tf object
%   display     		- Description
%   eig          		- Description
%   eq                  - Description
%   frac_tf             - Description
%   get     			- Description
%   horzcat    			- Description
%   iscomplex     		- Description
%   isempty     		- Description
%   isnan        		- Description
%   minreal    			- Description
%   minus   			- Description
%   mpower   			- Description
%   mtimes   			- Description
%   ne      			- Description
%   ngrid        		- Description
%   parallel     		- Description
%   plot         		- Description
%   plus    			- Description
%   poles        		- Description
%   rdivide    			- Description
%   scalar   			- Description
%   series       		- Description
%   set     			- Description
%   size         		- Description
%   subsasgn 			- Description
%   subsref    			- Description
%   tf2ss        		- Description
%   tf2zpk       		- Description
%   tfdata       		- Description
%   times   			- Description
%   transpose			- Description
%   uminus  			- Description
%   vertcat    			- Description


% frac_zpk
%   char        		- Converts a frac_poly_exp object into a string
%   display     		- Description
%   enlarge     		- Description
%   eq                  - Description
%   frac_zpk    		- Description
%   get     			- Description
%   horzcat    			- Description
%   minreal    			- Description
%   mpower  			- Description
%   mtimes   			- Description
%   ne      			- Description
%   plot                - Description
%   plus    			- Description
%   residue    			- Description
%   scalar   			- Description
%   set     			- Description
%   size     			- Description
%   subsasgn 			- Description
%   subsref    			- Description
%   transpose			- Description
%   vertcat    			- Description
%   zpk2tf              - Description
%   zpkdata             - Description


% General Purpose Functions
%   frac_lti			- Description
%   frac_poly_exp		- Description
%   frac_poly_imp		- Description
%   frac_ss             - Description
%   frac_tf             - Description
%   frac_zpk			- Description
