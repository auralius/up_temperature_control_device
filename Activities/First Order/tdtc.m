function T=tdtc(u, u0, T0, ts, Kss, tau, theta)

T = zeros(1,length(u));
delay_index = 0;

for i = 2:length(u)
    if (i*ts <= theta)
        u_c = u0;
        delay_index = i;
    else
        u_c = u(i - delay_index);
    end
    
    T_dot = (-T(i-1) + Kss * u_c)/tau;
    T(i) = T(i-1)+T_dot*ts;
end

T = T+T0;

end