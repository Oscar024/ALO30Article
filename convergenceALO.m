clc
clear all
load convergence.dat

x=convergence;


iteration = x(2,:);
error = x(1,:);

figure
semilogy(iteration,error,'Color','r')
title('Convergence of experiment 25')
xlabel('Iteration');
ylabel('Best score obtained');

% axis tight
axis auto
grid on
hold on
box on
legend('ALO')




