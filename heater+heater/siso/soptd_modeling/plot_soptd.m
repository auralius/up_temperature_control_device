clc
clear 
close all


load datalog.mat

t  = datalog(1, :);
u1 = datalog(2, :);
u2 = datalog(3, :);
T1 = datalog(4, :);
T2 = datalog(5, :);

figure
subplot(2,1,1)
hold on
plot(t, T1)
plot(t, T2)
legend('$T_1$','$T_2$', 'interpreter', 'latex', 'location', 'best')
xlabel('Time (s)')
title('Outputs')

subplot(2,1,2)
hold on
plot(t, u1)
plot(t, u2)
legend('$u_1$','$u_2$', 'interpreter', 'latex', 'location', 'best')
xlabel('Time (s)')
title('Inputs')

%% Plot only T1, we don't care about T2
figure
plot(t, T1)
xlabel('Time (s)')
title('$T_1$', 'Interpreter','latex')
ylim([0 80])

%% Plot cleaned T1 where we removed the room temperature from the data
offset = datalog(3,1); % the first data point is the room temperature
T1_cleaned = T1 - offset;
figure
plot(t, T1_cleaned)
xlabel('Time (s)')
title('Cleaned $T_1$', 'Interpreter','latex')
