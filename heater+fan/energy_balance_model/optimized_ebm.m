clear all 
close all
clc

% % Initial guesses
theta = 6;
tau = 200;
K = 300;
L = 0.02;

lb = [5  100 100 0.001];
ub = [10 500 200 0.1];

guess = [theta, tau, K, L];
options = optimoptions('fmincon','Display','iter', ...
                       'MaxIter', 1000, 'TolX', 1e-15, 'TolFun',1e-6);
opt_params = fmincon(@objfunc, guess, [], [], [], [], lb, ub, [], ...
                      options);

% Load all data and give proper names
load datalog.mat
t = datalog(1, :);
u = datalog(2, :);
omega = datalog(3, :);
Tambient = datalog(4, :);
T = datalog(5, :);
T0 = Tambient(4); % 1 to 3 are possibly trash
u0 = 0;
dt = 0.1;

T_opt = ebm(u, u0, omega, dt, ...
    opt_params(1), opt_params(2), opt_params(3), opt_params(4), ...
    T0, Tambient);

figure
subplot(2,1,1);
hold on
plot(t, T, 'LineWidth', 1)
plot(t, T_opt, '-.r', 'LineWidth',3)
legend('Measurement', 'Model', 'location', 'best')
xlabel('Time (s)')
ylabel(['Temperature (' char(176) 'C)'])
xlim([0 3000])

subplot(2,1,2);
hold on
plot(t, u, 'LineWidth', 1)
plot(t, omega, 'LineWidth', 1)
legend('Heater', 'Fan', 'location', 'best')
xlim([0 3000])
ylim([0 1])
xlabel('Time (s)')
ylabel('PWM')

%%
function residuals = objfunc(guess)  
theta = guess(1);
tau = guess(2);
K = guess(3);
L = guess(4);

% Load all data and give proper names
load datalog.mat
t = datalog(1, :);
u = datalog(2, :);
omega = datalog(3, :);
Tambient = datalog(4, :);
T = datalog(5, :);
T0 = Tambient(4); % 1 to 3 are possibly trash
u0 = 0;
dt = 0.1;

T_sim = ebm(u, u0, omega, dt, theta, tau, K, L, T0, Tambient);

residuals = sum((T_sim-T).^2);
end
