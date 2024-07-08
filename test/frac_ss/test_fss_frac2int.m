%% Function-based unit test for test_fss_frac2int
% Last revision 29/09/2021

function tests = test_fss_frac2int
tests = functiontests(localfunctions);
end

function testFrac2int(testCase)
    dt=0.01;
    t=0:dt:1000;
    u=zeros(length(t),2);
    u(4000:end,1)=1;
    u(28000:end,2)=1;
    %% définition d'un système commensurable
    band=[10^(-3) 10^3];
    order=1.4;
    % order=0.3;
    N=20;
    A=[-0.1 0; 0 -0.6];
    B=[1 2; -1 -3];
    C=[1 0; 0 1];
    D=zeros(2,2);

    sys=frac_ss(A,B,C,D,order, 'N', N, 'band', band, 'variable', 's', 'Ts', 0, 'sim', 'Oustaloup');
    % sys=frac_ss(A,B,C,D,order,N,band,'s',0,'Trig');

    sysEnt=frac2int(sys);

    assertTrue(testCase,isa(sysEnt,'ss'),'sysEnt is not a tf object');
    assertFalse(testCase,isempty(sysEnt),'sysEnt is empty');

    [mag,phi,w_out,h_fig,h_axes]=bode(sys);
    assertFalse(testCase,isempty(mag),'mag is empty');
    assertFalse(testCase,isempty(phi),'phi is empty');
    assertFalse(testCase,isempty(w_out),'w_out is empty');
    assertFalse(testCase,isempty(h_fig),'h_fig is empty');
    assertFalse(testCase,isempty(h_axes),'h_axes is empty');

    figure,bode(sysEnt,logspace(-5,5,1000)), hold all, grid on
end


