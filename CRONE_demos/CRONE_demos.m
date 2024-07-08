%CRONE_demos - CRONE Toolbox
%
%   The CRONE Toolbox, developed since the nineties by the CRONE team, is a 
%   Matlab Toolbox dedicated to fractional calculus. It is currently 
%   evolving towards an object oriented version, which allows many 
%   enhancements. Three main user classes, dedicated to fractional systems 
%   representations namely fractional transfer functions (frac_tf), 
%   fractional zeros poles and gain (frac_zpk), and fractional state-space 
%   (frac_ss), are developed. All three user classes are children of a 
%   parent class (frac_lti) which contains some common attributes of 
%   fractional systems. Among enhancements of the object programming of the 
%   CRONE toolbox, is the overloading of basic operators (+,-,*, /, .*, ...) 
%   and standard Matlab scripts (lsim, bode, nichols, ...) for the new 
%   classes. As a consequence, an end-user familiar with standard Matlab 
%   operators and scripts can use straightforwardly the CRONE toolbox. The 
%   main objective of this tutorial is to present class diagrams and principle 
%   features of the object oriented CRONE toolbox.
%
% Copyright (c) CRONE -	Victor 18/11/2014
% Last revision: 27/01/2015

clc
echo off
help CRONE_demos
disp('Hit a key to continue')
pause


k=1;

while (k~=11)
	k = menu('Demonstration programs for using the CRONE toolbox ',...
     'Fractional system representations',...
     'System identification for coefficient estimation',...
     'System Identification for coefficient and differentiation order estimation (Thermal Rod application)',...   
     'Quit');

   close all
	if k==1, FSR_demo1, end
    if k==2, SID_demo2, end
	if k==3, SID_TR_demo3, end
    if k == 4,  break, end
    close all
end

%whitebg('white')

close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% v0.1 Victor   18/11/2014  Creation de la fonction
% v0.2 Victor   27/01/2015  Amelioration de l'entete
% 