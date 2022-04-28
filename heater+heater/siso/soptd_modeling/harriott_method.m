% See: http://www.users.abo.fi/khaggblo/PDC/PDC5milver.pdf
clc
clear all 
close all

% Load all data and give proper names
load datalog.mat
t  = datalog(1, :);
u1 = datalog(2, :);
T1 = datalog(4, :);

% Remove the offset
offset = T1(1);
T1 = T1 - offset; 

theta = 6; % Initially, gueess the delay time, select a slighly larger number than the actual time delay
amplitude_of_step_input = u1(end); 
ts = 0.1; % 100msec time sampling

y_0 = T1(1); % ambient temperature, step response does not strat from zero


y = T1 - y_0;

y_ss = y(end);
y_72 = 0.72 * y_ss;

K_ss = y_ss / amplitude_of_step_input

[val, idx] = min(abs(y(:) - y_72));
t_72 = t(idx);

% Eq. 5.30
sum_of_T = 0.8*(t_72-theta); 

while (1)
    % Eq. 5.31
    t_z = 0.4*t_72+0.6*theta;

    idx = int32(t_z/ts);
    y_z = y(idx);

    ratio = y_z/y_ss;
    if ratio < 0.27
        theta = theta + 0.1;
    elseif ratio > 0.4
        theta = theta - 0.1;
    else
        break;
    end
end

% Look up table from figure 5.13
load harriott_lookup_table.mat
z = interp1(harriott(:,2), harriott(:,1), ratio, 'linear'); 

% Eq. 5.32
T_1 = z * sum_of_T
T_2 = sum_of_T - T_1

theta % print the time delay too

s = tf('s');
G = exp(-theta*s) / ((T_1*s+1)*(T_2*s+1)/K_ss);
step(G*amplitude_of_step_input, 2000, '-.b');
hold on;
plot(t,y,'r')

legend ('Model by Hariott method','Actual system', 'location', 'best')



