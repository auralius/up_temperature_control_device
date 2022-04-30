clear a;
a = arduino();

n_samples = 100;
T1 = zeros(n_samples,1);
T2 = zeros(n_samples,1);

msg = 'Measuring the temperatures...';
f = waitbar(0, msg);

for k = 1 : n_samples
    waitbar(k/n_samples, f, msg);
    T1(k) = readVoltage(a, 'A0');
    T2(k) = readVoltage(a, 'A1');
    pause(0.1);
end

close(f);

T1avg = 100.0*mean(T1);
T2avg = 100.0*mean(T2);


s = ['T1 shows ' num2str(T1avg) ' °C. T2 shows ' num2str(T2avg) ' °C.'];
g = msgbox(s);

clear;


