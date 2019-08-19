%Entrenamiento
clc 
clear all
load pacientestrain.dat;
load pacientestarg.dat;
warning off
p= pacientestrain;
t= pacientestarg;
pn= normaliza(p,7);
tn= normaliza(t,1);
capaH1=11;
capaH2=4;
  
  %Nueva forma de crear una red 
  net = feedforwardnet([11 4]);
  net.layers{1}.transferFcn = 'tansig';
  net.layers{2}.transferFcn = 'tansig';
  net.layers{3}.transferFcn = 'purelin';
  
  %vieja forma de crear una red
%   net=newff(minmax(pn),[capaH1,capaH2,1],{'tansig','tansig','purelin'},'trainlm');  

net.LW{2,1} = net.LW{2,1}*0.05;
net.b{2}=net.b{2}*0.01;
net.trainParam.show=NaN;
net.trainParam.goal=1e-7;
net.trainParam.lr=0.001;
net.trainParam.epochs = 250;
net.trainParam.showWindow=0;

net = train(net,pn,tn);
view(net);
wb = getwb(net);
[b,IW,LW] = separatewb(net,wb) 
load pactst.dat;
load tarpactstreal.dat;

x1=pactst;
rtarg=tarpactstreal;

pn2 = normaliza(x1,7);


an2 = sim(net,pn2);
sim1 = desnormaliza(an2,1);
% sim2=round(sim1);


MSE= mymse(rtarg,sim1);

o = MSE;
red = net;
