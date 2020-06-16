function T = sopdt(u, u0, T0, ts, M, B, K, theta)

T = zeros(1,length(u));

T_dot = 0;
u_b = 0;
u_k = 0;

delay_index = 0;

for i = 2:length(u)
    if (i*ts <= theta)
        u_m = u0;
        delay_index = i;
    else
        u_m = u(i - delay_index);
    end
    
    T_ddot = (u_m-u_b-u_k)/M;
    T_dot = T_dot + T_ddot * ts;
    T(i) = T(i-1) + T_dot * ts;
    
    u_b = B * T_dot;
    u_k = K * T(i);
end

T = T+T0;

end