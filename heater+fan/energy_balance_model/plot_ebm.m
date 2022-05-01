clc
clear 
close all


load datalog.mat

t  = datalog(1, :);
u1 = datalog(2, :); % Heater PWM
u2 = datalog(3, :); % Fan PWM
T1 = datalog(4, :); % Ambient temperature
T2 = datalog(5, :); % Heater temperature

figure
subplot(2,1,1)
hold on
plot(t, T1)
plot(t, T2)
legend('$T_0$','$T(t)$', 'interpreter', 'latex', 'location', 'best')
xlabel('Time (s)')
title('Outputs')

subplot(2,1,2)
hold on
plot(t, u1)
plot(t, u2)
legend('$u_1(t)$','$u_2(t)$', 'interpreter', 'latex', 'location', 'best')
xlabel('Time (s)')
title('Inputs')

