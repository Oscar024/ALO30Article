clc
clear all

for iteration= 1:30
tic;
evaluacion=1;
    for j=1:30
        for k=0:30
         load pacientestrain.dat;
            load pacientestarg.dat;
            warning off
            p= pacientestrain;
            t= pacientestarg;
            pn= normaliza(p,7);
            tn= normaliza(t,1);
               % 2 capas
            if(k==0)%  1 capa
              net=newff(minmax(pn),[j,1],{'tansig','purelin','logsig'},'trainlm');                
            else    % 2 capas
              net=newff(minmax(pn),[j,k,1],{'tansig','tansig','purelin','purelin','logsig'},'trainlm');  
            end
           
            net.LW{2,1} = net.LW{2,1}*0.05;
            net.b{2}=net.b{2}*0.01;
            net.trainParam.show=NaN;
            net.trainParam.goal=1e-7;
            net.trainParam.lr=0.001;
            net.trainParam.epochs = 250;
            net.trainParam.showWindow=0;

            net = train(net,pn,tn);

            %Prueba
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
           
            arquitectura(evaluacion).L1 =j;
            arquitectura(evaluacion).L2 =k;
            arquitectura(evaluacion).error =o;
            arquitectura(evaluacion).red =red;
            evaluacion=evaluacion+1
   
            
            
           
        end
    end   
     tiempo = toc/60; 
     tiempos = toc; 
     dumb=iteration
     arquitec(iteration).iteration = iteration;
     arquitec(iteration).arquitectura = arquitectura;  
     arquitec(iteration).tiempo = tiempo;
     save('redsimple2.mat','arquitec');
end