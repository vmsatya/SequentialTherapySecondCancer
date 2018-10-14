close all;
clear all;
clc;

OneCycle = 30; % number of days per cycle, Travis 2002
NumbCycles = 5; % number of cycles, Historical studies
TotalDays = OneCycle * NumbCycles; 

t_final = TotalDays + 50; % End of treatment

t = 1:0.01:t_final;
D = 12;

x = zeros(length(t),length(D)*2);

for i = 1:length(D)
    i
    x(:,2*i-1:2*i) = ode4(@sys_ndChemo,t,[1;0],D(i),OneCycle,TotalDays); 
    
    PMCells_after_Saturation(i) = x(end,2*i);
    ERR_Breast(i) = x(end,2*i)*1;  
end

Ncells_EndofChemo = x(end,1*i);
PMcells_EndofChemo = x(end,2*i);

%RR = 1+ERR_Breast;

%----------------------------

t_final = 40;
D = 14;
t = 1:0.01:t_final;

x = zeros(length(t),length(D)*2);

for i = 1:length(D)
    i
    x(:,2*i-1:2*i) = ode4(@sys_ndRad,t,[Ncells_EndofChemo;PMcells_EndofChemo],D(i)); 
    
    PMCells_after_Saturation(i) = x(end,2*i);
    ERR_lung(i) = x(end,2*i)*1;  
end

Ncells_EndofRad = x(end,1*i);
PMcells_EndofRad = x(end,2*i);

ERR = 1+PMcells_EndofRad



