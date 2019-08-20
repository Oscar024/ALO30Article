clear all 
clc
warning off
experiments=30;

Function_name='F29'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)


for k1=1:experiments
% Default parameters
% if nargin<1
%    para=[50 0.8];
% end
% tic;
% s1=pwd; %Identify current folder
% s2=['\erroresALO' num2str(k1) '.txt'];
%$s2='\erroresFPA0810.txt';
% dir = strcat(s1,s2);
%--crear arhivo para guardar errores
% error1= fopen(dir, 'wt');
tic;
% bajo = 10;
% alto = 30;
% SearchAgents_no = round(rand(1,experiments).*(alto-bajo)+bajo);
SearchAgents_no=[18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 66 68 70 72 74 76];           % Population size, typically 10 to 25
% Iteration parameters
% bajo = 150;
% alto = 200;
% Max_iteration = round(rand(1,experiments).*(alto-bajo)+bajo);
Max_iteration=[52 47 42 39 36 33 31 29 27 26 24 23 22 21 20 19 19 18 17 17 16 16 15 15 14 14 13 13 13 12];            % Total number of iterations


SearchAgents_no=SearchAgents_no(k1);
Max_iteration=Max_iteration(k1);


% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);

[Best_score,Best_pos,cg_curve,bestnn,bestnnall]=ALO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

tiempo = toc/60; 
tiempos = toc; 
arquitec(k1).nn = bestnn;
arquitec(k1).best = Best_score;
arquitec(k1).capas = Best_pos;
arquitec(k1).Max_iteration = Max_iteration;
arquitec(k1).SearchAgents_no = SearchAgents_no;
arquitec(k1).tiempo = tiempo;
arquitec(k1).bestnnall = bestnnall;
save('redes930_3.mat','arquitec');

display(['The best solution obtained by ALO is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by ALO is : ', num2str(Best_score)]);

% 
% fprintf('El proceso ha tardado %d minutos \n', tiempo);
% fprintf('El proceso ha tardado %d segundos ', tiempos);
% fprintf(error1,['Best Solution:' num2str(Best_pos) ' fmin=',num2str(Best_score) '   ALO time minutos:', num2str(tiempo) '   Experimento:', num2str(k1) '   SearchAgents_no:', num2str(SearchAgents_no)  '   Max_iteration:', num2str(Max_iteration) '\n']);        

end

