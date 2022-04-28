clc
clear 
close all

SWITCH_ON_POINT = 2;
SWITCH_OFF_POINT = -2;

load datalog.mat
datalog = datalog(:, 1:floor(end/2)); % Our data is too long, remove half of it!

t  = datalog(1, :);
u1 = datalog(2, :);
u2 = datalog(3, :);
T1 = datalog(4, :);
T2 = datalog(5, :);
T1_target = datalog(6, :);

% Plot time vs output
figure
hold on
yyaxis left
plot(t, T1_target, 'g')
plot(t, T1)
plot(t, T1_target + SWITCH_ON_POINT, '--k', 'LineWidth', 2)
plot(t, T1_target + SWITCH_OFF_POINT, '--k', 'LineWidth', 2)
ylabel('Output')
xlim([0 t(end)])

% Plot time vs input
yyaxis right
plot(t, u1,'-.', 'LineWidth', 2)
xlabel('Time (s)')
ylabel('Input')
xlim([0 t(end)])

% Plot the hysteresis curve
figure
plot(T1, u1, 'LineWidth', 2)
xlabel('Temperature')
ylabel('Input')
xlim([min(T1)-1 max(T1)+1])
ylim([min(u1)-0.1 max(u1)+0.1])
