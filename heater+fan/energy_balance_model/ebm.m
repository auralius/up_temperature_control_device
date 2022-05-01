function T = ebm(u, u0, omega, dt, theta, tau, K, L, T0, Tambient)
% This simulates a first-order energy balance model
% The system model is:
% Tdot(t) = K/tau*u(t-theta) - 1/tau*(T(t)-T0(t))
%
% T is the temperature of the heater (vector)
% Tambient is the ambient temperature (vector)
%
% u is the PWM input of the heater (vector)
% u0 is the initial value of u, u0 will be used  as the
%    input u when 0 <= t <= theta
%
% omega is the PWM input of the fan (vector)
%
% T0 is the initial temperature output (scalar)
%

% Apply the delay
T = zeros(1, length(u));
T(1) = T0;
u_d = zeros(1, length(u));
n = floor(theta/dt);

% Simulate the system
for k = 1 : length(u)
    if k > n
        u_d(k) = u(k-n);
    else
        u_d(k) = u0;
    end

    if k > 1
        T(k) = (dt*(K/tau*u_d(k) + ...
               (1/tau+L*omega(k))*Tambient(k)) + T(k-1)) / ...
               (1+dt/tau+dt*L*omega(k));
    end

end

end