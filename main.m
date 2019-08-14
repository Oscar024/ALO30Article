%___________________________________________________________________%
%  Ant Lion Optimizer (ALO) source codes demo version 1.0           %
%                                                                   %
%  Developed in MATLAB R2011b(7.13)                                 %
%                                                                   %
%  Author and programmer: Seyedali Mirjalili                        %
%                                                                   %
%         e-Mail: ali.mirjalili@gmail.com                           %
%                 seyedali.mirjalili@griffithuni.edu.au             %
%                                                                   %
%       Homepage: http://www.alimirjalili.com                       %
%                                                                   %
%   Main paper:                                                     %
%                                                                   %
%   S. Mirjalili, The Ant Lion Optimizer                            %
%   Advances in Engineering Software , in press,2015                %
%   DOI: http://dx.doi.org/10.1016/j.advengsoft.2015.01.010         %
%                                                                   %
%___________________________________________________________________%

% You can simply define your cost in a seperate file and load its handle to fobj 
% The initial parameters that you need are:
%__________________________________________
% fobj = @YourCostFunction
% dim = number of your variables
% Max_iteration = maximum number of generations
% SearchAgents_no = number of search agents
% lb=[lb1,lb2,...,lbn] where lbn is the lower bound of variable n
% ub=[ub1,ub2,...,ubn] where ubn is the upper bound of variable n
% If all the variables have equal lower bound you can just
% define lb and ub as two single number numbers

% To run ALO: [Best_score,Best_pos,cg_curve]=ALO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj)
%__________________________________________


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
tic;
s1=pwd; %Identify current folder
s2=['\erroresALO' num2str(k1) '.txt'];
%$s2='\erroresFPA0810.txt';
dir = strcat(s1,s2);
%--crear arhivo para guardar errores
error1= fopen(dir, 'wt');
tic;
bajo = 10;
alto = 30;
SearchAgents_no = round(rand(1,experiments).*(alto-bajo)+bajo);
% SearchAgents_no=[36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 66 68 70 72 74 76 78 80];           % Population size, typically 10 to 25
% Iteration parameters
bajo = 150;
alto = 200;
Max_iteration = round(rand(1,experiments).*(alto-bajo)+bajo);
% Max_iteration=[278 263 250 238 227 217 208 200 192 185 179 172 167 161 156];            % Total number of iterations


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
save('redes3.mat','arquitec');

display(['The best solution obtained by ALO is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by ALO is : ', num2str(Best_score)]);


fprintf('El proceso ha tardado %d minutos \n', tiempo);
fprintf('El proceso ha tardado %d segundos ', tiempos);
fprintf(error1,['Best Solution:' num2str(Best_pos) ' fmin=',num2str(Best_score) '   ALO time minutos:', num2str(tiempo) '   Experimento:', num2str(k1) '   SearchAgents_no:', num2str(SearchAgents_no)  '   Max_iteration:', num2str(Max_iteration) '\n']);        

end

