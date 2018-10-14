% % This code is for implementing RT 
% % Radiation therapy first and then Chemotherapy 
% 
% close all;
% clear all;
% clc;
% 
% % This code is for Radiation Therapy
% 
% t_final = 40;
% %D = 0:1:60;
% t = 1:0.01:t_final;
% A = dlmread('test.txt','\t');
% D = A(:,1);
% 
% x = zeros(length(t),length(D)*2);
% r1 = 0.6:0.01:0.9;
% 
% for j = 1:length(r1)
%     r = r1(j);
%     clear x;
% for i = 1:length(D)
%     i
%     x(:,2*i-1:2*i) = ode4(@sys_ndRadUS,t,[1;0],D(i),r); 
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
% A = dlmread('test.txt','\t');
% 
% x = A(:,1);
% y = A(:,2);
% 
% U = dlmread('testU.txt');
% L = dlmread('testL.txt');
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


% This code is for implementing RT 
% Radiation therapy first and then Chemotherapy 

close all;
clear all;
clc;

% This code is for Radiation Therapy

t_final = 40;
D = 0:1:60;
t = 1:0.01:t_final;
%A = dlmread('test.txt','\t');
%D = A(:,1);

x = zeros(length(t),length(D)*2);
for i = 1:length(D)
    i
    x(:,2*i-1:2*i) = ode4(@sys_ndRadUS,t,[1;0],D(i)); 
    PMCells_after_Saturation(i) = x(end,2*i);
    ERR_thyroid(i) = x(end,2*i);  
end

Ncells_EndofRad = x(end,1*i);
PMcells_EndofRad = x(end,2*i);

figure(1)
hold on
plot(D,1+ERR_thyroid)

%plot(D,PMCells_after_Saturation)

%------- Thyroid ERR data --------% 

A = dlmread('test.txt','\t');

x = A(:,1);
y = A(:,2);

U = dlmread('testU.txt');
L = dlmread('testL.txt');

U1 = U-y;
L1 = y-L;

errorbar(x,y,L1,U1,'bo')
hold off

%Y1 = PMCells_after_Saturation;
%Y2 = A(:,2)';
%E = (Y1-Y2).^2;
%E1(j) = sum(E)/length(Y1)

