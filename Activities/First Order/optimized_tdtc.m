clear all 
close all
clc

% Initial guess from curve fitting
Kss = 1;
tau = 243;
theta = 10;

x0 = [Kss,tau,theta,];
options = optimset('MaxIter',1000,'TolX',1e-15,'TolFun',1e-6,'Display','Iter');
xf = fminsearch(@objfunc,x0,options);

data = readlvbin('logged_data.bin', 3);
T = tdtc(data(2,:), 0, 34.2, 0.1, xf(1), xf(2), xf(3));

figure
hold on
plot(data(1,:),data(3,:),'LineWidth',1)
plot(data(1,:),T,'-.r','LineWidth',3)

legend('Actual device', 'Optimized model', 'location', 'best')
xlabel('Time')


function residuals = objfunc(X)  
Kss = X(1);
tau = X(2);
theta = X(3);

data = readlvbin('logged_data.bin', 3);
u = data(2,:);
T = tdtc(u, 0, 34.2, 0.1, Kss, tau, theta);

residuals = sqrt(mean(T-data(3,:)).^2);


end
