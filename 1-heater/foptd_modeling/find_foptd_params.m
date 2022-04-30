clc
clear all
close all

% Time delay from visual observation
theta = 7

load datalog.mat

t  = datalog(1, :);
u1 = datalog(2, :);
T1 = datalog(4, :);

T1_offset = datalog(4,1); % the first data point
T1_cleaned = T1 - T1_offset;

figure;
hold on;
plot(t, T1_cleaned + T1_offset);

% calculate gain, used the averaged output (10% from the last output)
y_ss = mean(T1_cleaned(round(0.9*end):end))
K_ss = y_ss / u1(end)
y_632 = 0.632 * T1_cleaned(end);

% find the tau for the corresponding T_635
dist = sum((T1_cleaned'-y_632) .^ 2, 2);
[value, index] = min(dist);
y_632 = T1_cleaned(index)
t_632 = t(index)
tau = t_632 - theta

% simulate the model
s = tf('s');
G = K_ss/(tau*s + 1) * exp(-theta * s)
[y, ~] = step(G, t);
plot(t, y * u1(end) + T1_offset, 'LineWidth', 2)

xlabel ('Time')
ylabel('Temperature');
legend('Measurement', 'Model', 'location', 'best')