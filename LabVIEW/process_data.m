clear all 
close all
clc

data = readlvbin('logged_data.bin', 3);

figure;
hold on;
yyaxis left
plot(data(1,:),data(2,:))
ylim([0 100])

yyaxis right
plot(data(1,:),data(3,:))
ylim([0 100])