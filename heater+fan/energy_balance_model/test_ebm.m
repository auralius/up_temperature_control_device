close all
clear 
clc

u = ones(1, 1000);
u0  = 0;

omega = zeros(1, 1000);
omega(floor(end/2):end) = 0.5; % Turn on the fan after half of the total time duration

Tambient = zeros(1, 1000) + 0.5;
T0 = Tambient(1); % Initial temperature is the first measurement by the ambient sensor

dt = 0.01;
tau = 1;
theta = 2;
K = 4;
L = 1;


tspan = dt.*(0:length(u)-1);
T = ebm(u, u0, omega, dt, theta, tau, K, L, T0, Tambient);

plot(tspan, T)
xlabel('Time')
ylabel('y(t)')
