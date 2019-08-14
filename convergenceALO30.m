clc
clear all
datos = load('redes3.mat');
%%
 
figure
for i= 7:7
    iteration=[];
    error=[];
    width=2;
    for k= 2:datos.arquitec(i).Max_iteration
        iteration(k) = datos.arquitec(i).bestnnall(k).iteration
        error(k) = datos.arquitec(i).bestnnall(k).best        
    end
%         width=width +0.2;
        if i==7
%              semilogy(iteration,error,'Color', 'r','LineWidth',3,'LineStyle','-.');
               semilogy(iteration,error,'Color', 'r','LineWidth',2);
        else
            semilogy(iteration,error,'Color', rand(1,3),'LineWidth',width);
        end
       
        title('ALO Convergence of experiment 7 with an MSE error of 0.000548')
        xlabel('Iteration');
        ylabel('Best score obtained');

%         axis tight
        axis auto
        grid on
        hold on
        box on
         legend('Exp7');
%         legend('Exp1','Exp2','Exp3','Exp4','Exp5',...
%         'Exp6','Exp7','Exp8','Exp9','Exp10',...
%         'Exp11',...
%         'Exp12','Exp13','Exp14','Exp15','Exp16','Exp17',...
%         'Exp18','Exp19','Exp20',...
%        'Exp21','Exp22','Exp23',...
%         'Exp24','Exp25','Exp26','Exp27','Exp28','Exp29',...
%         'Exp30',...
%         'Location','NorthEastOutside')
       
end