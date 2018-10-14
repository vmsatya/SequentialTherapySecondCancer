% Nordic data
 
% close all;
% clear all;
% clc;
% 
% A = [0.582524272	1.775558091	2.396400663	1.15442849
% 4.077669903	6.663939896	39.47990442	3.027863288
% 21.84466019	15.40826211	35.45289504	7.07123329
% 52.13592233	5.475642047	39.62169648	2.283024419
% ];
% t_final = 40;
% %D = 0:1:60;
% t = 1:0.01:t_final;
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
%     x(:,2*i-1:2*i) = ode4(@sys_ndRadNordic,t,[1;0],D(i),r); 
%     PMCells_after_Saturation(i) = x(end,2*i);
%     ERR_thyroid(i) = x(end,2*i);  %  
% end
% 
% Ncells_EndofRad = x(end,1*i);
% PMcells_EndofRad = x(end,2*i);
% 
% figure(1)
% hold on
% plot(D,ERR_thyroid)
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
% % 

% % This code is for implementing RT 
% % Radiation therapy first and then Chemotherapy 

close all;
clear all;
clc;

A = [0.582524272	1.775558091	2.396400663	1.15442849
4.077669903	6.663939896	39.47990442	3.027863288
21.84466019	15.40826211	35.45289504	7.07123329
52.13592233	5.475642047	39.62169648	2.283024419
];
t_final = 40;
D = 0:1:60;
t = 1:0.01:t_final;

x = zeros(length(t),length(D)*2);
for i = 1:length(D)
    i
    x(:,2*i-1:2*i) = ode4(@sys_ndRadLESG,t,[1;0],D(i)); 
    PMCells_after_Saturation(i) = x(end,2*i);
    ERR_thyroid(i) = x(end,2*i);  
end

Ncells_EndofRad = x(end,1*i);
PMcells_EndofRad = x(end,2*i);

figure(1)
hold on
plot(D,ERR_thyroid)

%plot(D,PMCells_after_Saturation)

%------- Thyroid ERR data --------% 
x = A(:,1);
y = A(:,2);

U = A(:,3);
L = A(:,4);

U1 = U-y;
L1 = y-L;

errorbar(x,y,L1,U1,'bo')
hold off

%Y1 = PMCells_after_Saturation;
%Y2 = A(:,2)';
%E = (Y1-Y2).^2;
%E1(j) = sum(E)/length(Y1)

