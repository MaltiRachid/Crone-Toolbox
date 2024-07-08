% close all
% clear all

sys = frac_tf(1, frac_poly_exp(1, 1.5), 'N', 30, 'band', [1e-5, 1e5]);
% Definition of time vector t and sampling period Te

N = 3;
for i=1:N
    u_start = ones(1,i);
    Te = 0.2;
%     u = [zeros(1,1) u_start zeros(1,25-i-1) ]; %with delay of 1 sample
    u = [u_start zeros(1,25-i) ]; %without delay of 1 sample
    t = (0:length(u)-1)*Te;
    set(sys,'sim','Oustaloup');
    sysO = lsim(sys, u, t);
    set(sys,'sim','Grunwald');
    sysG = lsim(sys, u, t);
    
    figure(1)
    subplot(N,1,i)
    plot(t, sysO,'-b.')
    hold on,
    plot(t, sysG,'-r.')
    hold on,
    plot(t,u,'.k')
    title(['Comparaison lsim for Oustaloup''s and Grunwald''s approx. (N = ',num2str(i),')']);
    legend('Oustaloup''s approx.', 'Grunwald''s approx.', 'Input u') 
    xlabel('Time'); ylabel('Amplitude');
    
    figure(2)
    subplot(N,1,i)
    plot(t, abs(sysG-sysO), '-g.')
    hold on,
    plot(t,u,'.k')
    title(['Error between approximations (N = ', num2str(i),')']);
    legend('Error', 'Input u');
    xlabel('Time'); ylabel('Error amplitude');
end