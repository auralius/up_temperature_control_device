load('loggedtime.mat')
figure;
plot((ts(end,2:end)-0.1)/0.1*100)

xlabel('Number of iterations')
ylabel('Jitter in %')