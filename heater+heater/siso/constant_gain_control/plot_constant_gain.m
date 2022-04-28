clc
clear 
close all

load datalog.mat
datalog = datalog(:, 1:floor(end/2)); % Our data is too long, remove half of it!

t  = datalog(1, :);
u1 = datalog(2, :);
u2 = datalog(3, :);
T1 = datalog(4, :);
T2 = datalog(5, :);
T1_target = datalog(6, :);

figure

subplot(2,1,1)
hold on 
plot(t, T1_target, 'g')
plot(t, T1)
ylabel('Output')
xlabel('Time')
xlim([0 t(end)])

subplot(2,1,2)
hold on
plot(t, u1,'-.', 'LineWidth', 2)
plot(t, repmat(0, 1, length(t)), '--r')
plot(t, repmat(1, 1, length(t)), '--r')
xlabel('Time (s)')
ylabel('Input')
xlim([0 t(end)])


