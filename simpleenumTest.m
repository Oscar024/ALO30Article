clc
clear all
load simpleenum.dat

x=simpleenum;


iteration = x(2,:);
error = x(1,:);

figure
semilogy(iteration,error,'Color','r')
title('Simple Enum evaluation')
xlabel('Iteration');
ylabel('score obtained');

% axis tight
axis tight
grid on
hold on
box on
legend('ALO')
