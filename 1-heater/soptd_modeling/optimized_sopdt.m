clear all 
close all
clc

% % Initial guesses
b = 100;
c = 10;
theta = 10;
Kss = 10;

lb = [100  1  5  10];
ub = [2000 10 10 500];

guess = [b, c, theta, Kss];
options = optimoptions('fmincon','Display','iter', ...
                       'MaxIter', 1000, 'TolX', 1e-15, 'TolFun',1e-6);
opt_params = fmincon(@objfunc, guess, [], [], [], [], lb, ub, [], ...
                      options);

% Load all data and give proper names
load datalog.mat
t  = datalog(1, :);
u1 = datalog(2, :);
T1 = datalog(4, :);

% Remove the offset
offset = T1(1);
T1 = T1 - offset; 

T1_opt = sopdt(u1, 0, 0.1, opt_params(1), opt_params(2), ...
    opt_params(3), opt_params(4), 0, 0);

figure
subplot(2,1,1);
hold on
plot(t, T1 + offset, 'LineWidth', 1)
plot(t, T1_opt + offset, '-.r', 'LineWidth',3)

legend('Measurement', 'Model', 'location', 'best')
xlabel('Time (s)')
ylabel(['Temperature (' char(176) 'C)'])
xlim([0 3000])

subplot(2,1,2);
hold on
plot(t, u1, 'LineWidth', 1)
xlim([0 3000])
ylim([0 1])
xlabel('Time (s)')
ylabel('PWM')

%%
function residuals = objfunc(guess)  
b = guess(1);
c = guess(2);
theta = guess(3);
Kss = guess(4);

% Load all data and give proper names
load datalog.mat
t  = datalog(1, :);
u1 = datalog(2, :);
T1 = datalog(4, :);

% Remove the offset
offset = T1(1);
T1 = T1 - offset; 

T1_sim = sopdt(u1, 0, 0.1, b, c, theta, Kss, 0, 0);

residuals = sum(((T1_sim-T1).^2) .* (t(end)-t)) ;
end
