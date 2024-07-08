%% Function-based unit test for test_fss_lsim
% Last revision 30/09/2021

function tests = test_fss_lsim
tests = functiontests(localfunctions);
end

%% test_fss_lsim Example 1
function testLsim1(testCase)
% Definition of the time vector t and the input vector u
dt=0.01;
t=0:dt:1000;
u=zeros(length(t),2);
u(4000:end,1)=1;
u(28000:end,2)=1;

%% Definition of a commensurable system
band=[10^(-3) 10^3];
order=0.5;
N=10;
A=[-0.1 0; 0 -0.6];
B=[1 2; -1 -3];
C=[1 0; 0 1];
D=zeros(2,2);

sys=frac_ss(A,B,C,D,order,'N',N,'band',band);

y=lsim(sys, u, t);
assertFalse(testCase,isempty(y));

figure(1), hold all, grid on, plot(t,u), xlabel('time, s'), ylabel('u'), title('Input u');
figure(2), hold all, grid on, plot(t,y), xlabel('time, s'), ylabel('y'), title('Commensurable system time-response');
legend('y_1^{0.5}','y_2^{0.5}');


%% Definition of a non-commensurable system
order=[1.3 0.5];
 
sys2=frac_ss(A,B,C,D,order,'N',N,'band',band);

y2=lsim(sys2, u, t);
assertFalse(testCase,isempty(y2));

figure(3), hold all, grid on, plot(t,y2,'--'), xlabel('time, s'), ylabel('y'), legend('y_1^{1.3}','y_2^{0.5}'), title('Non-commensurable system time response');

end
%% test_fss_lsim Example 2
function testLsim2(testCase)
% Same time vector t and input vector u used
dt=0.01;
t=0:dt:1000;
u=zeros(length(t),2);
u(4000:end,1)=1;
u(28000:end,2)=1;

%% Definition of a commensurable system

band=[10^(-3) 10^3];
order=1.4;
% order=0.3;
N=10;
A=[-0.1 0.1; 0.1 -0.6];
B=[1 2; -1 -3];
C=[1 0; 0 1];
D=zeros(2,2);

sys=frac_ss(A,B,C,D,order,'N',N,'band',band,'variable','s','Ts',0,'sim','Oustaloup');
% sys=frac_ss(A,B,C,D,order,N,band,'s',0,'Trig');

y=lsim(sys, u, t);
assertFalse(testCase,isempty(y));

figure(4), hold all, grid on, plot(t,y), xlabel('time, s'), ylabel('y');
 

%% comparison with frac_tf

sys_tf=ss2tf(sys);
sys_tf=frac2int(sys_tf);
y=lsim(sys_tf, u, t);
assertFalse(testCase,isempty(y));
figure(4), hold all, grid on, plot(t,y,'--'), xlabel('time, s'), ylabel('y'), title('Second commensurable system time-response');
legend('y_3^{ss}','y_4^{ss}','y_3^{tf}','y_4^{tf}');


%% Definition of a non-commensurable system

order=[1.4 0.3];
 
sys2=frac_ss(A,B,C,D,order,'N',N,'band',band,'variable','s','Ts',0,'sim','Oustaloup');
% sys2=frac_ss(A,B,C,D,order,N,band,'s',0,'Trig');

y2=lsim(sys2, u, t);
assertFalse(testCase,isempty(y2));

figure(5), hold all, grid on, plot(t,y2,'--'), xlabel('time, s'), ylabel('y'), 
legend('y_3^{1.3}','y_4^{0.5}'), title('Second non-commensurable system time-response');
end