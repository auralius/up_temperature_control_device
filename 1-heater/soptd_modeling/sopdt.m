function y = sopdt(u, u0, dt, b, c, theta, Kss, y0, y0dot)
% This simulates a second-order system pluts time delay
% The system model is:
% Y(s)/U(s) = Kss / (s^2 + b*s + c) * exp(-theta*s)
%
% y is the discretized system's output (vector)
%
% u is the discretized system's input (vector)
%
% u0 is the initial value of u, u0 will be used  as the
%    input u when 0 <= t <= theta
%
% y0 is the initial output (scalar)
% y0dot is the first time derivative of the initial output (scalar)
%
% dt, b, c, theta, and Kss are all scalar parameters
%
% See the explanation at: 
%   https://crystal-rain-1f4.notion.site/Second-Order-Plus-Time-Delay-SOPTD-7fa1d65c898540cb9b0e7fecc96c322e

% Apply the delay
y = zeros(1, length(u));
y(1:2) = [y0 y0+y0dot*dt];
u_d = zeros(1, length(u));
n = floor(theta/dt);

% Simulate the system
for k = 1 : length(u)
    if k > n
        u_d(k) = u(k-n);        
    else
        u_d(k) = u0;        
    end

    if k > 3
        A = 1 + b * dt + c * dt^2;
        y(k) = (c*Kss*dt^2*u_d(k) + b*dt*y(k-1) + 2*y(k-1) - y(k-2)) / A;
    end
end

end