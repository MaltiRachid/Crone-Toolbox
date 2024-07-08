%FSR_demo1 - CRONE Toolbox
% 
% Demo file for Fractional System Representations
%
% Copyright (c) CRONE -	18/11/2014
% Last revision: 29/10/2021

clc
disp(' ')
disp(' ')
disp('                Fractional System Representations ')
disp('                     with the CRONE toolbox')
disp('               --------------------------------------')
disp(' ')

disp('   This demo will illustrate the use of the CRONE Toolbox')
disp('   for Fractional System Representations.');
disp(' ')
disp(' ')
disp('   Hit any key to continue')
pause

clc
echo on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FRACTIONAL EXPLICIT POLYNOMIALS (frac_poly_exp) Class, in the SISO case
%   
%   By analogy to classical polynomials, fractional polynomials in the
%   explicit form are defined as:
%       
%       fpe(s) = a0 + ... + a_i s^(alpha_i) + ... + a_N s^(alpha_N) 
%   
%   where the a_i refer to coefficients, and the word explicit refers to
%   the real powers of s. Consequently, two linked vectors [a_i] and
%   [alpha_i] are necessary to define a frac_poly_exp object.
%
%   For example : 

fpe = frac_poly_exp([2 1 3],[1.2 0.5 0])

%   Hit any key
pause
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FRACTIONAL EXPLICIT POLYNOMIALS (frac_poly_exp) Class, in the MIMO case
%   
%   It is also possible to define frac_poly_exp objects of higher dimension
%   which can be used for defining MIMO transfer functions (see frac_tf 
%   objects) with the help of cells.
%
%   For example : 

fpe_MIMO = frac_poly_exp({[1,2] [2 1 3]; 2 5},{[2 0.3] [1.2 0.5 0]; 0.1 0})

pause
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FRACTIONAL EXPLICIT POLYNOMIALS (frac_poly_exp) Class, in the MIMO case
%   
%   Another way for creating MIMO frac_poly_exp objects consists of
%   concatenating existing SISO and/or MIMO objects
%
%   For example : 

fpe_MIMO3 = [fpe_MIMO ; fpe, fpe]


%   Hit any key
pause
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   FRACTIONAL EXPLICIT POLYNOMIALS (frac_poly_exp) Class: overloaded operators
%   Usual Matlab operators (isnan, isempty, ==, ...) and functions (+, -, *, =) 
%   have been overloaded for the frac_poly_exp class.
%
%   For example : 

newfpe = 5 * fpe_MIMO - fpe_MIMO 

sysfpe = fpe_MIMO^2

%   Hit any key
    pause
    clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%   FRACTIONAL IMPLICIT POLYNOMIALS: Frac_poly_imp objects
%   
%   Fractional polynomials of the implicit form are defined as children 
%   of the frac_poly_exp class:
%       
%       fpi(s) = (fpe(s))^beta
%   
%   where the frac_poly_exp object fpe(s) is held to the (fractional) power
%   beta to define a frac_poly_emp object.
%
%   For example :

fpi = frac_poly_imp(frac_poly_exp([2 1 3],[1.2 0.5 0]),1.5)



%   Usual operators can be used with frac_poly_imp objects such as basic 
%   functions (isnan, isempty,==,...) and operations (+, -, *,=)

%   Hit any key
    pause
    clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%   FRACTIONAL LINEAR TIME INVARIANT CLASS: Frac_lti objects
%   
%   The fractional-lti class has attributes common to and hence inherited 
%   in the three children classes, namely:
%   - var: contains variable name to be used in the representation of 
%       fractional transfer function and might be set to s (default), p, z,
%       or q.
%   - ver: contains version number of different objects. It is required for 
%       further enhancements. This parameter is automatically filled and is 
%       not necessary to the end user.
%   - Ts: (optional) is the sampling period.
%   - N: (optional - necessary for Oustaloup and Trigeassou simulation 
%       methods) contains the corner frequencies used in Oustaloup and 
%       Trigessou approximations.
%   - [wb, wh]: (optional - necessary for Oustaloup and Trigeassou 
%       simulation methods) contains the interval on which the fractional 
%       system is approximated.
%   - sim: (optional - if not set by the user, "Grunwald" is the default 
%       simulation method when N and [wb, wh] are not entered - otherwise 
%       the default simulation method is "Oustaloup".

%   Anytime, the function "get" helps to see the attributes of an object
%   and the function "set" (set(object_name,'attribute_name',value)") 
%   enables to modify an attribute.

%   Hit any key
    pause
    clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%   FRACTIONAL TRANSFER FUNCTION CLASS: Frac_tf objects
%   
%   A fractional transfer function is defined in the frac tf class 
%   which allows representing uncommensurate fractional systems: 
%                    b0 + ... + b_M s^(beta_M) 
%       sys_tf(s) = ----------------------------
%                    a0 + ... + a_N s^(alpha_N)
%
%   or commensurate systems:
%
%                    c0 + ... + c_m s^(m*v) 
%       sys_tf(s) = -------------------------
%                    d0 + ... + d_n s^(n*v)
%
%   The frac_tf class inherits attributes of the frac lti class and has 
%   additionally two attributes, aggregated from frac_poly_exp class: num
%   and den
%
%   The constructor is called with two mandatory arguments: frac tf 
%   (num:frac poly exp, den:frac poly exp) and may be called with five 
%   optional arguments, in the order specified by the frac lti constructor. 
%
%   Hit any key
    pause
    clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%   FRACTIONAL TRANSFER FUNCTION CLASS: Frac_tf objects
%   
%   Example 1 with Grünwald simulation method 

sys_tf = frac_tf(1,frac_poly_exp([5 1],[1.5 0]))
get(sys_tf,'sim')
%   A frac_tf object is created and as only num and den options are 
%   specified, the 'Grunwald' method will be used for simulation with lsim.

%   Hit any key
    pause
    clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%   FRACTIONAL TRANSFER FUNCTION CLASS: Frac_tf objects
%   
%   Example 2 with Grünwald simulation method 

sys_tf = frac_tf(1,frac_poly_exp([5 1],[1.5 0]),'N',10,'band',[1e-2 1e2])
get(sys_tf, 'sim')
%   In order to use Oustaloup's rational approximation, it is sufficient to 
%   specify the number of cells and the frequency band. It is equivalent
%   to:
%   sys_tf = frac_tf(1,frac_poly_exp([5 1],[1.5 0]),'N',10,'band',[1e-2 1e2],... 
%   'sim','Oustaloup')

%   Hit any key
    pause
    clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%   FRACTIONAL TRANSFER FUNCTION CLASS: Frac_tf objects
%   
%   Example 3 by changind the simulation method 

set(sys_tf,'sim','OustaloupTrigeassou');
get(sys_tf,'sim')
%   In order to use Trigeassou's rational approximation, it is sufficient 
%   to specify the number of cells and the frequency band. It is equivalent
%   to:
%   sys_tf = frac_tf(1,frac_poly_exp([5 1],[1.5 0]),'N',10,'band',[1e-2 1e2],...
%   'sim','OustaloupTrigeassou')
%
%
%   Moreover, matrix of transfer functions might be defined for 
%   Multi-Input-Multi-Output systems.


%   Hit any key
    pause
    clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%   FRACTIONAL STATE SPACE CLASS: Frac_ss objects
%   
%   The fractional (or pseudo-) state space representation is based on :
%
%       x^(v)(t) = A x(t) + B u(t),
%       y(t) = C x(t) + D u(t)
%
%   Consequently, the frac_ss class is constituted of the following 
%   attributes:
%   - A, B, C, D,
%   - the commensurate order v.
%   This fractional state-space representation allows to represent MIMO 
%   systems and, A, B, C, D matrices are of appropriate dimensions. 

%   For example : 

A=1; B=2; C=3; D=4; v= 1.5;
sys_ss1 = frac_ss(A,B,C,D,v);
%
%   The frac_ss command will create a frac_ss object from the the matrices
%   A, B, C and D and with the commensurate order v.
%
%   Hit any key
    pause   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%   FRACTIONAL STATE SPACE CLASS: Frac_ss objects
%   
% Another way of generating a frac_ss object 

sys_ss2 = frac_ss(sys_tf)
%   Otherwise, it is possible to get a frac_ss object from a frac_tf
%   object. The reverse is also possible with the frac_tf function.

%   Hit any key
    pause
    clc
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%   FRACTIONAL ZERO POLE GAIN CLASS: Frac_zpk objects
%   
%   A commensurable transfer function 
%
%                    c0 + ... + c_m s^(m*v) 
%       sys_tf(s) = -------------------------
%                    d0 + ... + d_n s^(n*v)
%
%   can always be written in a factorized form:
%
%                       (s^v + z0)...(s^v + zm) 
%       sys_zpk(s) = K --------------------------
%                       (s^v + p0)...(s^v + pn)
%
%   Consequently, the frac_zpk class is constituted of the following 
%   attributes:
%   - zi, pj, K
%   - the commensurate order v.
%
%   The attributes constituting the frac_zpk class are zi, pj, K of cell 
%   type. The v parameter is the commensurate order and in the case of MIMO
%   systems, there is a single commensurate order for all subsystems.


%   For example : 

z=-1; p=2; K=3; v= 1.5;
sys_zpk1 = frac_zpk(z,p,K,v)

%   The command frac_zpk will create a frac_zpk object from the the vectors
%   z, p, and K and with the commensurate order v.

%   Hit any key
    pause 
    clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%   FRACTIONAL ZERO POLE GAIN CLASS: Frac_zpk objects
%   
% Another way of generating a frac_zpk object

sys_zpk2 = frac_zpk(sys_tf)
%   Otherwise, it is possible to get a frac_ss object from a frac_tf
%   object. The reverse is also possible with the frac_tf function.

    
%   Hit any key
pause    
    
echo off
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% v0.1 Victor   18/11/2014  Creation de la fonction
% v0.2 Victor   13/11/2014  Amelioration de l'entete
% v0.3 Malti    18/10/2015  Amélioration de l'affichage à la veille de la
%                           présentation à SYSID, Beijing, Chine.
% v2.0 Loo      29/10/2021  Correction pour les paires 'Name'-'Value'