%Normalizacion de datos
clc
clear all
load paci100.dat
load pacitar1.dat
p= paci100;
t= pacitar1;
pn= normaliza(p,7)
tn= normaliza(t,1)

datos = load('redes.mat');
net = datos.arquitec(8).nn;

% pn(1,:) = (p(1,:)/1000);

% net=newff(minmax(pn),[10,1],{'tansig','purelin','logsig'},'trainlm'); 
% net=newff(minmax(pn),[7,2,1],{'tansig','tansig','purelin','purelin','logsig'},'trainlm') 
% % netLM = train_BFGS( x,ta,net,100,1e-15);
% net.LW{2,1} = net.LW{2,1}*0.05;
% net.b{2}=net.b{2}*0.01;
% % net.trainParam.show=NaN;
% net.trainParam.show=NaN;
% net.trainParam.goal=1e-7;
% net.trainParam.lr=0.001;
% net.trainParam.epochs = 250;
net.trainParam.showWindow=1;

net = train(net,pn,tn);

% an = sim(net,pn);




load pactst.dat
load tarpactst.dat

x1=pactst;
rtarg=tarpactst;


num=length(rtarg);
%SIMULANDO DATOS PRONOSTICADOS

pn2 = normaliza(x1,7);


an2 = sim(net,pn2);
sim1 = desnormaliza(an2,1);
sim2=round(sim1);




%IMPRIMIR SOLO EL PRONOSITICO
pronostico1=round(rtarg);

% perf = mse(net,pronostico1,sim2,'regularization',0.01);
% perf=immse(pronostico1,sim2)

 for j=1:num
     pronostico1(1,j)=sim2(1,j);
 end
 
 pronostico1=round(pronostico1);

%%%%%%%%%%%%%%%%%%%%
%INTEGRACION POR PROMEDIO

prom=pronostico1;
for iii=1:12
   erroresga(iii)=abs(rtarg(iii)-pronostico1(iii));  
   mse_calc(iii) = sum((rtarg(iii)-pronostico1(iii)).^2)/length(rtarg);
end

   %mse_calc = sum((y-targets).^2)/length(y);

errorestfpa=0;
for ii=1:12
   errorestfpa=errorestfpa+mse_calc(ii);
end

errorestfpa=errorestfpa/12

p1 = 1:1:50;
figure
plot(p1,rtarg,'b');
grid on
hold on
plot(p1,sim2,'r');
hold on


save('red.mat','errorestfpa','net')
