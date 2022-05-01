clear a;
a = arduino();

n_samples = 100;
T_ambient=zeros(n_samples,1);
T_heater=zeros(n_samples,1);

msg = 'Measuring the ambient temperature';
f = waitbar(0, msg);

for k = 1 : n_samples
    waitbar(k/n_samples, f, msg);
    T_ambient(k) = readVoltage(a, 'A0');
    T_heater(k) = readVoltage(a, 'A1');
    pause(0.1);
end

close(f);

offset = 100.0*(mean(T_ambient) - mean(T_heater));
ambient_temp = 100.0*mean(T_ambient);

clear T_ambient T_heater k n_samples f a

s = ['The ambient temperature is: ' num2str(ambient_temp) ' degrees of Celcius'];
g = msgbox(s);

N = 5000;

clear s g;


