clc
clear all
datos = load('redes3.mat');
net = datos.arquitec(25).bestnnall(187).nn;
save('redoptimized.mat','net');
bred = load('redoptimized.mat');
net = bred.net
load pactst.dat
load tarpactstreal.dat

x1=pactst;
rtarg=tarpactstreal;

num=length(rtarg);
%SIMULANDO DATOS PRONOSTICADOS

pn2 = normaliza(x1,7);


an2 = sim(net,pn2);
sim1 = desnormaliza(an2,1);



%IMPRIMIR SOLO EL PRONOSITICO

MSE= mymse(rtarg,sim1);

p1 = 1:1:numel(tarpactstreal);
figure

plot(p1,rtarg,'-ro',p1,sim1,'-.b');
title(strcat('Experimento ALO con MSE : ',num2str(MSE)));
xlabel('Pacientes')
ylabel('% de riesgo')
hleg1 = legend('Target','NN');