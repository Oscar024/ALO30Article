clc
clear all
load paci100.dat
load pacitar1.dat
p= paci100;
t= pacitar1;

pn= normaliza(p,7)
tn= normaliza(t,1)

nn = [7 7 2 1]; 
dIn = [0];
dIntern=[10];
dOut=[10 20 ];
% net = CreateNN(nn,dIn,dIntern,dOut);
% net = CreateNN(nn,dIntern);
net = CreateNN(nn);
netLM = train_LM( pn,tn,net,250,1e-10);
% netLM = train_BFGS( x,ta,net,100,1e-15);



yn = NNOut(pn,netLM);
y_LM = desnormaliza(yn,1);

load pacientesreal.dat
load tarreal.dat



x1=pacientesreal;
rtarg=tarreal;


num=length(rtarg);
%SIMULANDO DATOS PRONOSTICADOS
tn2 = normaliza(x1,7);


an2 = NNOut(tn2,netLM);
sim1 = desnormaliza(an2,1);
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

p1 = 1:1:12;
p2 = 1:1:100;
% plot(p,target);
% hold on
% plot(p,yNN,'r');
% hold on
figure
plot(p2,t,'b');
grid on
hold on
plot(p2,y_LM,'r');
hold on

figure
plot(p1,rtarg,'b');
grid on
hold on
plot(p1,sim2,'r');
hold on