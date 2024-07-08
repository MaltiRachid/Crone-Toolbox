clear, clc, close all, echo off
%% FPE - FPI
pat = pwd;
npat = [pat '/frac_poly_exp/']; eval(['cd ''' npat ''''])
    [E_fpe, T_fpe] = test_report_fpe ;
npat = [pat '/frac_poly_imp/']; eval(['cd ''' npat ''''])
    [E_fpi, T_fpi] = test_report_fpi ;

%% frac_lti, frac_tf, frac_ss, frac_zpk
npat = [pat '/frac_lti/'];  eval(['cd ''' npat ''''])
    [E_lti, T_lti] = test_report_frac_lti;
npat = [pat '/frac_tf/'];  eval(['cd ''' npat ''''])
    [E_tf, T_tf] = test_report_frac_tf;
npat = [pat '/frac_ss/'];  eval(['cd ''' npat ''''])
    [E_ss, T_ss] = test_report_fss;
npat = [pat '/frac_zpk/']; eval(['cd ''' npat ''''])
    [E_zpk, T_zpk] = test_report_frac_zpk;

%% Bilan
Total_fun_tested = T_fpe + T_fpi + T_lti + T_tf + T_ss + T_zpk;
Total_errors     = E_fpe + E_fpi + E_lti + E_tf + E_ss + E_zpk;

fprintf('---------------------------------------------------------------\n');
fprintf('\tTest report for the CRONE Toolbox\n');
fprintf('---------------------------------------------------------------\n');
fprintf('frac_poly_exp class, number of functions tested: %d\n', T_fpe);
    fprintf('\tnumber of errors found: %d\n', E_fpe);
fprintf('frac_poly_imp class, number of functions tested: %d\n', T_fpi);
    fprintf('\tnumber of errors found: %d\n', E_fpi);
fprintf('frac_lti class, number of functions tested: %d\n', T_lti);
    fprintf('\tnumber of errors found: %d\n', E_lti);
fprintf('frac_tf class, number of functions tested: %d\n', T_tf);
    fprintf('\tnumber of errors found: %d\n', E_tf);
fprintf('frac_ss class, number of functions tested: %d\n', T_ss);
    fprintf('\tnumber of errors found: %d\n', E_ss);
fprintf('frac_zpk class, number of functions tested: %d\n', T_zpk);
    fprintf('\tnumber of errors found: %d\n', E_zpk);
fprintf('\nTotal number of functions tested: %d\n', Total_fun_tested);
if Total_errors==0
    fprintf('\n\t\t Youppiiiiii - No errors found - The CRONE Toolbox is fully functional\n');
else
    fprintf('\tTotal number of errors found: %d\n', Total_errors);
end
fprintf('---------------------------------------------------------------\n');

eval(['cd ''' pat ''''])
