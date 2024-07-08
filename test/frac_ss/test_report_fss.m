function  [intNumberOfErrors, NumberFunctionTested] = test_report_frac_ss
clear all, close all, %clc

%%
intNumberOfErrors=0;

%%
disp('***************************************')
disp('*             Test Report of          *')
currentfile=mfilename;
currentfile=currentfile(13:length(currentfile));
disp(['*         the class ' currentfile '           *']);
disp('*                 v 0.1               *')
disp('***************************************')
disp(' ')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Test report of the class Frac_tf
% oldpath = addpath([pwd '/..']);
checkTitle(currentfile);
NumberFunctionTested=0;
blnExpectedResult=1;
list=ls;
list_cell = cellstr(list);
for ii=1:length(list_cell)
    if strncmp(list_cell{ii},['test_' currentfile],length(['test_' currentfile]))
        NumberFunctionTested=NumberFunctionTested+1;
        strSyntaxToCheck=list_cell{ii}(1:length(list_cell{ii})-2);
        blnSyntaxOK=checkAndDispResult(strSyntaxToCheck,blnExpectedResult);intNumberOfErrors=intNumberOfErrors+(~blnSyntaxOK);
    end
end



%%

disp('   ');
disp('   ');
disp([num2str(NumberFunctionTested), ' of Functions tested']);

disp('   ');
disp(['Found:  ',num2str(intNumberOfErrors), ' error(s)']);

if intNumberOfErrors==0
    disp('Fully functional.');
end
close all
%path(oldpath);
end

%%
%%%%%%%%%%%%%%%
% v2.9  Benine 11/06/2014   Remplacement de Majuscule dans l'appel ? la 
%                           fonction test_frac_tf_tfdata.m   
% c2.10 Farges 17/06/2014   Automatisation complète de la fonction

