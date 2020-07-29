function Tr = ebalance_model(u, beta, h, cr, e)

ts = 0.1;
Vmax  = 12;
Ta = 30.2734 + 273.15;
sigma = 5.670374e-8;
R = 27;
m = 0.005;
A = 0.0008;

Tr = zeros(1,length(u));

Tr(1) = Ta;
for i = 2:length(u)
    dTr =  beta * u(i)* Vmax^2 / R +h*A*(Ta-Tr(i-1))+e*A*sigma*(Ta^4-Tr(i-1)^4);
    Tr(i) = Tr(i-1) + dTr/(m*cr) * ts;
end

end
