close all
clear 
clc

x = ones(1, 1000);
x0  = 0;
xdot0  = 0;
dt = 0.01;

b = 2;
c = 2;
theta = 2;
Kss = 4;

tspan = dt.*(0:length(x)-1);
y = sopdt(x, x0, xdot0, dt, b, c, theta, Kss);

plot(tspan, y)
xlabel('Time')
ylabel('y(t)')