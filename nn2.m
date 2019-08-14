load paci.dat
load pacitar.dat
x= paci;
ta= pacitar;

net=newff(minmax(x),[11,1],{'tansig','purelin','logsig'},'trainlm');                

% netLM = train_BFGS( x,ta,net,100,1e-15);
net.LW{2,1} = net.LW{2,1}*0.05;
net.b{2}=net.b{2}*0.01;
net.trainParam.show=NaN;
net.trainParam.goal=1e-7;
net.trainParam.lr=0.001;
net.trainParam.epochs = 500;
net.trainParam.showWindow=1;
[net,tr1]=train(net,x,ta);

load pacientesreal.dat
load tarreal.dat

x1=pacientesreal;


rtarg=tarreal;
num=length(rtarg);
%SIMULANDO DATOS PRONOSTICADOS
sim1=sim(net,x1);
sim2=round(sim1);

%IMPRIMIR SOLO EL PRONOSITICO
pronostico1=rtarg;

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

errorestfpa=errorestfpa/12;
o=errorestfpa

tiempo = toc/60; 
tiempos = toc; 

p1 = 1:1:12;
p2 = 1:1:250;
% plot(p,target);
% hold on
% plot(p,yNN,'r');
% hold on
% figure
% plot(p2,ta,'b');
% hold on
% plot(p2,y_LM,'r');
% hold on

figure
plot(p1,rtarg,'b');
hold on
plot(p1,sim2,'r');
hold on


fprintf('El proceso ha tardado %d minutos \n', tiempo);
fprintf('El proceso ha tardado %d segundos ', tiempos);


