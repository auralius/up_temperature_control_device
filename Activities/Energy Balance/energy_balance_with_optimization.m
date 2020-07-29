clc
clear all
close all

load ebalance.mat;

t = data(2,:);
input = data(3,:);
output = data(4,:);

beta = 0.5;
h =  20;
cr = 1000;
e = 0.9;


x0 = [beta, h, cr, e];
lb = [0, 10, 10, 0];
ub = [1, 10000000, 10000000, 1];

A = [];
b = [];
Aeq = [];
beq = [];

%xf = fmincon(@objfunc,x0,A,b,Aeq,beq,lb,ub);
options = optimset('MaxIter',1000,'TolX',1e-15,'TolFun',1e-6,...
                   'Display','Iter');
xf = fminsearch(@objfunc,x0,options);

figure
subplot(2,1,1)
plot(t, input, 'LineWidth',2)
ylim([0 1])
xlim([0 2800])

title('Input (% PWM)')
set(gca,'FontSize',16)
set(gca, 'FontName', 'Times New Roman')

subplot(2,1,2)
hold on
plot(t, output)

% Plot the optimal model 
T_opt = ebalance_model(input, xf(1), xf(2), xf(3), xf(4));
T_opt = T_opt-273.15;
plot(t,T_opt,'-.r','LineWidth',2)

title('Output')
legend('Actual device', 'Model with the optimized parameters',... 
       'location', 'best')
xlabel('Time (s)')
ylabel(['Temperature (' char(176) 'C)'])
xlim([0 2800])

set(gca,'FontSize',16)
set(gca, 'FontName', 'Times New Roman')

error = abs(output-T_opt);
figure
plot(t, error)
xlabel('Time (s)')
ylabel(['Temperature (' char(176) 'C)'])
xlim([0 2800])
title('Absolute Error')

set(gca,'FontSize',16)
set(gca, 'FontName', 'Times New Roman')

function residuals = objfunc(X)  
beta = X(1);
h = X(2);
cr = X(3);
e = X(4);

load ebalance.mat;

u = data(3,:);
output = data(4,:);
Tr = ebalance_model(u, beta, h, cr, e);
Tr = Tr - 273.15;

residuals = sqrt(mean(Tr-output).^2);


end