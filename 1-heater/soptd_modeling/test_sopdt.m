close all
clear 
clc

x = ones(1, 1000);
x0  = 0;
xdot0  = 0;
dt = 0.01;
u0 = 0;

b = 2;
c = 2;
theta = 2;
Kss = 4;

tspan = dt.*(0:length(x)-1);
y = sopdt(x, u0, dt, b, c, theta, Kss, x0, xdot0);

plot(tspan, y)
xlabel('Time')
ylabel('y(t)')