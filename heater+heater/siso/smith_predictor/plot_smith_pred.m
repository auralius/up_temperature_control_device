clc
clear 
close all

load datalog1.mat % This is the data without the Smith predictor
load datalog2.mat % This is the data with the Smith predictor

tnom  = nominal(1, :);
u1nom = nominal(2, :);
u2nom = nominal(3, :);
T1nom = nominal(4, :);
T2nom = nominal(5, :);
T1_targetnom = nominal(6, :);

tsmith  = smith(1, :);
u1smith = smith(2, :);
u2smith = smith(3, :);
T1smith = smith(4, :);
T2smith = smith(5, :);
T1_targetsmith = smith(6, :);

figure

subplot(2,1,1)
hold on 
plot(tnom, T1nom, 'r')
plot(tsmith, T1smith, 'b')
plot(tnom, T1_targetnom, '--g', 'LineWidth', 2)
ylabel('Output')
xlabel('Time')
xlim([0 tnom(floor(end/2))])
legend('Constant-gain feedback', 'Smith Predictor', 'location', 'best')

subplot(2,1,2)
hold on
plot(tnom, u1nom,'r-.', 'LineWidth', 2)
plot(tsmith, u1smith,'b-.', 'LineWidth', 2)
plot(tnom, repmat(0, 1, length(tnom)), '--g', 'LineWidth', 2)
plot(tnom, repmat(1, 1, length(tnom)), '--g', 'LineWidth', 2)
xlabel('Time (s)')
ylabel('Input')
xlim([0 tnom(end)])
xlim([0 tnom(floor(end/2))])
legend('Constant-gain feedback', 'Smith Predictor', 'location', 'best')


