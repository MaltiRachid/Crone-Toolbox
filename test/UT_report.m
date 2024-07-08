%% New unit tests
clear all, close all,clc
import matlab.unittest.TestSuite;

fc=0;           %fail count
testingtime=0;  
pat = pwd;

fpeSuite = TestSuite.fromFolder([pat '/frac_poly_exp']);
fpiSuite = TestSuite.fromFolder([pat '/frac_poly_imp']);
fidSuite = TestSuite.fromFolder([pat '/frac_idtf']);
fltSuite = TestSuite.fromFolder([pat '/frac_lti']);
fssSuite = TestSuite.fromFolder([pat '/frac_ss']);
ftfSuite = TestSuite.fromFolder([pat '/frac_tf']);
fzpSuite = TestSuite.fromFolder([pat '/frac_zpk']);
folderSuite=[fpeSuite, fpiSuite, fidSuite, fltSuite, fssSuite, ftfSuite, fzpSuite];

result = run(folderSuite);
clc
fprintf('----------------------------------------------------------------------------\n');
fprintf('\t\tTest report for the CRONE Toolbox\n');
fprintf('----------------------------------------------------------------------------\n');
fprintf('frac_poly_exp class \tnumber of functions tested:\t%d\n', length(fpeSuite));
fprintf('frac_poly_imp class \tnumber of functions tested:\t%d\n', length(fpiSuite));
fprintf('frac_lti class \t\t\tnumber of functions tested:\t%d\n', length(fltSuite));
fprintf('frac_tf class \t\t\tnumber of functions tested:\t%d\n', length(ftfSuite));
fprintf('frac_ss class \t\t\tnumber of functions tested:\t%d\n', length(fssSuite));
fprintf('frac_zpk class \t\t\tnumber of functions tested:\t%d\n', length(fzpSuite));
fprintf('frac_idtf class \t\tnumber of functions tested:\t%d\n', length(fidSuite));
fprintf('----------------------------------------------------------------------------\n');
fprintf('\nTotal number of functions tested: %d\n', length(result));

for i=1:length(result)
    if result(i).Failed
        disp(result(i).Name);
        fc=fc+1;
    end
    testingtime=testingtime+result(i).Duration;
end
fprintf('\nTotal time spent running tests: %d min %d sec\n',floor(testingtime/60),floor(rem(testingtime,60)));

fprintf('\n----------------------------------------------------------------------------\n');
if fc>0
    fprintf('Number of failed tests:\t%d\n',fc);
else
    fprintf('\tNo errors found - The CRONE Toolbox is fully functional\n');
end
fprintf('----------------------------------------------------------------------------\n');
close all