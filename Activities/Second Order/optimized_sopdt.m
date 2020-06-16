clear all 
close all
clc

% % Initial guess from curve fitting
M = 1791/1.104;
B = 201/1.104;
K = 1/1.104;
theta = 10;

x0 = [M,B,K,theta];
options = optimset('MaxIter',1000,'TolX',1e-15,'TolFun',1e-6,'Display','Iter');
xf = fminsearch(@objfunc,x0,options);

data = readlvbin('logged_data.bin', 3);
T = sopdt(data(2,:), 0, 34.2, 0.1, M, B, K, theta);
T_opt = sopdt(data(2,:), 0, 34.2, 0.1, xf(1), xf(2), xf(3), xf(4));

figure
hold on
plot(data(1,:),data(3,:),'LineWidth',1)
plot(data(1,:),T,'-.g','LineWidth',3)
plot(data(1,:),T_opt,'-.r','LineWidth',3)

legend('Actual device', 'Hariott model', 'Optimized model', 'location', 'best')
xlabel('Time')


function residuals = objfunc(X)  
M = X(1);
B = X(2);
K = X(3);
theta = X(4);

data = readlvbin('logged_data.bin', 3);
u = data(2,:);
T = sopdt(u, 0, 34.2, 0.1, M, B, K, theta);

residuals = sqrt(mean(T-data(3,:)).^2);


end
