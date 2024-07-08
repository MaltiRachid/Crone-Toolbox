%% Function-based unit test for frd method
% Last revision 29/06/2021

function tests = test_frac_lti_frd
    tests = functiontests(localfunctions);
end

function testSysArgin0(testCase)
    sys0 = frd;
    
    assertEmpty(testCase, get(sys0,'Frequency'), 'Frequency is not empty');
    assertEqual(testCase, get(sys0,'FrequencyUnit'), 'rad/TimeUnit', 'FrequencyUnit is not rad/TimeUnit');
    assertEmpty(testCase, get(sys0,'ResponseData'), 'ResponseData is not empty');
    assertEmpty(testCase, get(sys0,'IODelay'), 'IODelay is not empty');
    assertEmpty(testCase, get(sys0,'InputDelay'), 'InputDelay is not empty');
    assertEmpty(testCase, get(sys0,'OutputDelay'), 'OutputDelay is not empty');
    assertEqual(testCase, get(sys0,'Ts'), 0, 'Ts is not 0');
    assertEqual(testCase, get(sys0,'TimeUnit'), 'seconds', 'TimeUnit is not seconds');
    assertEmpty(testCase, get(sys0,'InputName'), 'InputName is not empty');
    assertEmpty(testCase, get(sys0,'InputUnit'), 'InputUnit is not empty');
    assertEqual(testCase, get(sys0,'InputGroup'), struct, 'InputGroup is not empty');
    assertEmpty(testCase, get(sys0,'OutputName'), 'OutputName is not empty');
    assertEmpty(testCase, get(sys0,'OutputUnit'), 'OutputUnit is not empty');
    assertEqual(testCase, get(sys0,'OutputGroup'), struct, 'OutputGroup is not empty');
    assertEmpty(testCase, get(sys0,'Notes'), 'Notes is not empty');
    assertEmpty(testCase, get(sys0,'UserData'), 'UserData is not empty');
    assertEmpty(testCase, get(sys0,'Name'), 'Name is not empty');
    assertEqual(testCase, get(sys0,'SamplingGrid'), struct, 'SamplingGrid is not empty');
end

function testSysArgin2(testCase)
    freq = 2*pi*logspace(-1,1,100);
    num = frac_poly_exp([1 2], [0.6 0.3]);
    den = frac_poly_exp([3 4 5], [1 0.6 0.3]);
    sys=frac_tf(num,den);
    sys1 = frd(sys,freq); 
    % % % % % % % % % %
    num = get(sys, 'num');
    den = get(sys, 'den');
    num_ord = get(num, 'order');
    num_coef = get(num, 'coef');
    den_ord = get(den, 'order');
    den_coef = get(den, 'coef');
    num_frd = zeros(1, length(freq));
    den_frd = zeros(1, length(freq));
    respExp = zeros(1, length(freq));
    for i=1:length(freq)
        for j = 1:length(num_ord{1})
            num_frd(i) = num_frd(i) + num_coef{1}(j)*(1i*freq(i))^(num_ord{1}(j));
        end
        for k = 1:length(den_ord{1})
            den_frd(i) = den_frd(i) + den_coef{1}(k)*(1i*freq(i))^(den_ord{1}(k));
        end
        respExp(i) = num_frd(i)/den_frd(i);
    end
    % % % % % % % % % %
    assertEqual(testCase, get(sys1,'Frequency'), freq', 'Frequency is not freq');
    assertEqual(testCase, get(sys1,'FrequencyUnit'), 'rad/TimeUnit', 'FrequencyUnit is not rad/TimeUnit');
    assertEqual(testCase, reshape(get(sys1,'ResponseData'), [1 100]), respExp, 'ResponseData is not respExp');
    assertEqual(testCase, get(sys1,'IODelay'), 0, 'IODelay is not 0');
    assertEqual(testCase, get(sys1,'InputDelay'), 0, 'InputDelay is not 0');
    assertEqual(testCase, get(sys1,'OutputDelay'), 0, 'OutputDelay is not 0');
    assertEqual(testCase, get(sys1,'Ts'), 0, 'Ts is not 0');
    assertEqual(testCase, get(sys1,'TimeUnit'), 'seconds', 'TimeUnit is not seconds');
    assertEqual(testCase, get(sys1,'InputName'), {''}, 'InputName is not empty');
    assertEqual(testCase, get(sys1,'InputUnit'), {''}, 'InputUnit is not empty');
    assertEqual(testCase, get(sys1,'InputGroup'), struct, 'InputGroup is not empty');
    assertEqual(testCase, get(sys1,'OutputName'), {''}, 'OutputName is not empty');
    assertEqual(testCase, get(sys1,'OutputUnit'), {''}, 'OutputUnit is not empty');
    assertEqual(testCase, get(sys1,'OutputGroup'), struct, 'OutputGroup is not empty');
    assertEmpty(testCase, get(sys1,'Notes'), 'Notes is not empty');
    assertEmpty(testCase, get(sys1,'UserData'), 'UserData is not empty');
    assertEmpty(testCase, get(sys1,'Name'), 'Name is not empty');
    assertEqual(testCase, get(sys1,'SamplingGrid'), struct, 'SamplingGrid is not empty');
end

function testSysMimotf(testCase)
    freq = 2*pi*logspace(-3,3,1000);
    pol11 = frac_poly_exp(1,0); pol12 = frac_poly_exp([1 1], [1 0]);
    sys1 = frac_tf(pol11, pol12);
    pol21 = frac_poly_exp(2,0); pol22 = frac_poly_exp([1 1], [2 0]);
    sys2 = frac_tf(pol21, pol22);
    pol31 = frac_poly_exp(3,0); pol32 = frac_poly_exp([1 1], [3 0]);
    sys3 = frac_tf(pol31, pol32);
    pol41 = frac_poly_exp(4,0); pol42 = frac_poly_exp([1 1], [4 0]);
    sys4 = frac_tf(pol41, pol42);
    sysM = [sys1 sys3; sys2 sys4];
    % % % % % % % % % %
    respExp1 = frd(sys1, freq);
    respExp2 = frd(sys2, freq);
    respExp3 = frd(sys3, freq);
    respExp4 = frd(sys4, freq);
    respExpM = [get(respExp1,'responseData') get(respExp3,'responseData'); get(respExp2,'responseData') get(respExp4,'responseData')];
    % % % % % % % % % %
    sysfrdM = frd(sysM, freq);
    assertEqual(testCase, get(sysfrdM,'Frequency'), freq', 'Frequency is not freq');
    assertEqual(testCase, get(sysfrdM,'FrequencyUnit'), 'rad/TimeUnit', 'FrequencyUnit is not rad/TimeUnit');
    assertEqual(testCase, get(sysfrdM,'ResponseData'), respExpM, 'ResponseData is not respExpM');
    assertEqual(testCase, get(sysfrdM,'IODelay'), [0 0; 0 0], 'IODelay is not 0');
    assertEqual(testCase, get(sysfrdM,'InputDelay'), [0; 0], 'InputDelay is not 0');
    assertEqual(testCase, get(sysfrdM,'OutputDelay'), [0; 0], 'OutputDelay is not 0');
    assertEqual(testCase, get(sysfrdM,'Ts'), 0, 'Ts is not 0');
    assertEqual(testCase, get(sysfrdM,'TimeUnit'), 'seconds', 'TimeUnit is not seconds');
    assertEqual(testCase, get(sysfrdM,'InputName'), [{''}; {''}], 'InputName is not empty');
    assertEqual(testCase, get(sysfrdM,'InputUnit'), [{''}; {''}], 'InputUnit is not empty');
    assertEqual(testCase, get(sysfrdM,'InputGroup'), struct, 'InputGroup is not empty');
    assertEqual(testCase, get(sysfrdM,'OutputName'), [{''}; {''}], 'OutputName is not empty');
    assertEqual(testCase, get(sysfrdM,'OutputUnit'), [{''}; {''}], 'OutputUnit is not empty');
    assertEqual(testCase, get(sysfrdM,'OutputGroup'), struct, 'OutputGroup is not empty');
    assertEmpty(testCase, get(sysfrdM,'Notes'), 'Notes is not empty');
    assertEmpty(testCase, get(sysfrdM,'UserData'), 'UserData is not empty');
    assertEmpty(testCase, get(sysfrdM,'Name'), 'Name is not empty');
    assertEqual(testCase, get(sysfrdM,'SamplingGrid'), struct, 'SamplingGrid is not empty');
%     bode(sysfrdM); bode([sys1 sys3; sys2 sys4]) %pour comparaison
end