% % LESG data
 
% close all;
% clear all;
% clc;
% 
% A = [0.687949248	2.148677356	2.954049414	1.522276868
% 5.68911329	12.62593487	33.56560836	7.704216745
% 19.25013823	12.64616011	33.40671653	7.724441987
% 46.95384571	11.1662253	32.91127084	6.691936094
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
%     x(:,2*i-1:2*i) = ode4(@sys_ndRadLESG,t,[1;0],D(i),r); 
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
% 
close all;
clear all;
clc;

A = [0.687949248	2.148677356	2.954049414	1.522276868
5.68911329	12.62593487	33.56560836	7.704216745
19.25013823	12.64616011	33.40671653	7.724441987
46.95384571	11.1662253	32.91127084	6.691936094
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
plot(D,1+ERR_thyroid)

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

