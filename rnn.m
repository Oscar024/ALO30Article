%Red neuronal recurrente


tic;
load paci100.dat
load pacitar1.dat

x= paci100;
ta= pacitar1;

% net = CreateNN([7,10,14,1],dIn=[0],dIntern=[100],dOut=[10,20])
nInterSize =4;
nn = [7 29 25 1];
dIn = [0];
dIntern=[100];
dOut=[10 20];
net = CreateNN(nn,dIn,dIntern,dOut);
% net = CreateNN(nn,dIntern);
% net = CreateNN(nn);
netLM = train_LM( x,ta,net,1000,1e-11);
% netLM = train_BFGS( x,ta,net,100,1e-15);



y_LM = NNOut(x,netLM);


load pacientesreal.dat
load tarreal.dat

Ptest=pacientesreal;
rtarg=tarreal;
num=length(rtarg);

sim1 = NNOut(Ptest,netLM);

% sim1=sim(net,x1);
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

errorestfpa=errorestfpa/12

p1 = 1:1:12;
p2 = 1:1:100;
% plot(p,target);
% hold on
% plot(p,yNN,'r');
% hold on
figure
plot(p2,ta,'b');
hold on
plot(p2,y_LM,'r');
hold on

figure
plot(p1,rtarg,'b');
hold on
plot(p1,sim2,'r');
hold on
tiempo = toc/60; 
tiempos = toc; 

fprintf('El proceso ha tardado %d minutos \n', tiempo);
fprintf('El proceso ha tardado %d segundos ', tiempos);

