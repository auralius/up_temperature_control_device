clc
clear all 
close all

fn = 'logged_data.bin';

L = 10; % Initial gueess the delay time:
amplitude_of_step_input = 50; 
ts = 0.1; % 100msec time sampling

data = readlvbin(fn, 3);

t_0 = 0; % step input starts at t_0
y_0 = data(3,1); % ambient temperature, step response does not strat from zero

% data(1,:) -> time vector
% data(2,:) -> input
% data(3,:) -> output

t = data(1,:)-t_0;
y = data(3,:)-y_0;

y_ss = y(end);
y_72 = 0.72*y_ss;

K_ss = y_ss/amplitude_of_step_input;

[val, idx] = min(abs(y(:) - y_72));
t_72 = t(idx);

% 5.30
sum_of_T = 0.8*(t_72-L);

while (1)
    % 5.31
    t_z = 0.4*t_72+0.6*L;

    idx = int32(t_z/ts);
    y_z = y(idx);

    ratio = y_z/y_ss;
    if ratio < 0.27
        L = L + 0.1;
    elseif ratio > 0.4
        L = L - 0.1;
    else
        break;
    end
end

load hariott.mat
z = interp1(hariott(:,2), hariott(:,1), ratio, 'linear'); % Look up from figure 5.13

T_1 = z * sum_of_T;
T_2 = sum_of_T - T_1;

s = tf('s');
G = exp(-L*s) / ((T_1*s+1)*(T_2*s+1)/K_ss);
step(G*amplitude_of_step_input, 2000, '-.b');
hold on;
plot(t,y,'r')

legend ('Model by Hariott method','Actual system', 'location', 'best')



