clear all 
close all
clc

data_w_smith = readlvbin('logged_data_w_smith.bin', 4);
data_wo_smith = readlvbin('logged_data_wo_smith.bin', 4);

figure
hold on
plot(data_w_smith(1,:),data_w_smith(2,:),'b')
plot(data_w_smith(1,:),data_w_smith(3,:),'r')
plot(data_wo_smith(1,:),data_wo_smith(3,:),'g')
xlim([0 300])
xlabel('Time (s)')
ylabel(['Temperature (' char(176) 'C)'])
legend('Desired Temperature','With Smith Predictor', 'Without Smith Predictor', 'Location', 'Best')

set(gca,'FontSize',16)