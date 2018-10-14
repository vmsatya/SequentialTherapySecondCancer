% This code is for implementing RT 
% Radiation therapy first and then Chemotherapy 

close all;
clear all;
clc;

% This code is for Radiation Therapy

t_final = 40;
D = 14;
t = 1:0.01:t_final;

x = zeros(length(t),length(D)*2);

for i = 1:length(D)
    i
    x(:,2*i-1:2*i) = ode4(@sys_ndRad,t,[1;0],D(i)); 
    
    PMCells_after_Saturation(i) = x(end,2*i);
    ERR_lung(i) = x(end,2*i)*1;  
end

Ncells_EndofRad = x(end,1*i);
PMcells_EndofRad = x(end,2*i);

%-------------------------------------------------


OneCycle = 30; % number of days per cycle, Travis 2002
NumbCycles = 5; % number of cycles, Historical studies
TotalDays = OneCycle * NumbCycles; 

t_final = TotalDays + 50; % End of treatment

t = 1:0.01:t_final;
D = 12;

x = zeros(length(t),length(D)*2);

for i = 1:length(D)
    i
    x(:,2*i-1:2*i) = ode4(@sys_ndChemo,t,[Ncells_EndofRad;PMcells_EndofRad],D(i),OneCycle,TotalDays); 
    
    PMCells_after_Saturation(i) = x(end,2*i);
    ERR_Breast(i) = x(end,2*i)*1;  
end

Ncells_EndofChemo = x(end,1*i);
PMcells_EndofChemo = x(end,2*i);

ERR_Breast+1



