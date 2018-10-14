% % This code is for implementing RT 
% % Radiation therapy first and then Chemotherapy 

% close all;
% clear all;
% clc;
% 
% % extracted points: dose, mean ERR, UB err and LB err
% A = [0.538922156	2.222222222	7.489711934	0.576131687
% 3.233532934	6.995884774	29.05349794	1.563786008
% 7.185628743	13.99176955	39.75308642	3.621399177
% 15	6.008230453	26.17283951	1.152263374
% 24.43113772	8.724279835	35.72016461	1.975308642
% 35.47904192	7.325102881	35.72016461	1.152263374
% 49.58083832	6.748971193	39.50617284	0.987654321
% ];
% 
% t_final = 40;
% D = A(:,1)
% t = 1:0.01:t_final;
% %A = dlmread('test.txt','\t');
% %D = A(:,1);
% 
% x = zeros(length(t),length(D)*2);
% r1 = 0.6:0.01:0.9;
% 
% for j = 1:length(r1)
%     r = r1(j);
%     clear x;
% for i = 1:length(D)
%     i
%     x(:,2*i-1:2*i) = ode4(@sys_ndRadFr,t,[1;0],D(i),r); 
%     PMCells_after_Saturation(i) = x(end,2*i);
%     ERR_thyroid(i) = x(end,2*i);  %  
% end
% 
% Ncells_EndofRad = x(end,1*i);
% PMcells_EndofRad = x(end,2*i);
% 
% figure(1)
% hold on
% plot(D,1+ERR_thyroid)
% 
% %plot(D,PMCells_after_Saturation)
% 
% %------- Thyroid ERR data due to HL from Shuryak--------% 
% 
% x = A(:,1);
% y = A(:,2);
% 
% U = A(:,3);
% L = A(:,4);
% 
% U1 = U-y;
% L1 = y-L;
% 
% errorbar(x,y,L1,U1,'bo')
% hold off
% 
% Y1 = PMCells_after_Saturation;
% Y2 = A(:,2)';
% E = (Y1-Y2).^2;
% E1(j) = sqrt(sum(E)/length(Y1))
% 
% end
% 
% figure
% plot(r1,E1)


% % This code is for implementing RT 
% % Radiation therapy first and then Chemotherapy 

close all;
clear all;
clc;

A = [0.538922156	2.222222222	7.489711934	0.576131687
3.233532934	6.995884774	29.05349794	1.563786008
7.185628743	13.99176955	39.75308642	3.621399177
15	6.008230453	26.17283951	1.152263374
24.43113772	8.724279835	35.72016461	1.975308642
35.47904192	7.325102881	35.72016461	1.152263374
49.58083832	6.748971193	39.50617284	0.987654321
];

t_final = 40;
D = 0:1:60;
t = 1:0.01:t_final;

x = zeros(length(t),length(D)*2);
for i = 1:length(D)
    i
    x(:,2*i-1:2*i) = ode4(@sys_ndRadFr,t,[1;0],D(i)); 
    PMCells_after_Saturation(i) = x(end,2*i);
    ERR_thyroid(i) = x(end,2*i);  
end

Ncells_EndofRad = x(end,1*i);
PMcells_EndofRad = x(end,2*i);

figure(1)
hold on
plot(D,ERR_thyroid)

%------- Thyroid ERR data --------% 

x = A(:,1);
y = A(:,2);

U = A(:,3);
L = A(:,4);

U1 = U-y;
L1 = y-L;

errorbar(x,y,L1,U1,'bo')
hold off


