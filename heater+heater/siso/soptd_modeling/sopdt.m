function y = sopdt(u, u0, udot0, dt, b, c, theta, Kss)
% This simulates a second-order system pluts time delay
% The system model is:
% Y(s)/U(s) = Kss / (s^2 + b*s + c) * exp(-theta*s)
% y is the discretized system's output
% u is the discretized system's input
% u is a vector
% u0 is the initial value of u
% udot0 is the initial value of udot
% b, c, theta, and Kss are all scalars
%
% See the explanation at: 
%   https://crystal-rain-1f4.notion.site/Second-Order-Plus-Time-Delay-SOPTD-7fa1d65c898540cb9b0e7fecc96c322e

% Apply the delay
y = zeros(1, length(u));
y(1:2) = [u0 udot0];
u_d = zeros(1, length(u));
u_d(floor(theta/dt)+1:end) = u(1:end-floor(theta/dt));

% Simulate the system
for k = 3 : length(u)        
    A = 1 + b * dt + c * dt^2;
    y(k) = (c*Kss*dt^2*u_d(k) + b*dt*y(k-1) + 2*y(k-1) - y(k-2)) / A;
end
end