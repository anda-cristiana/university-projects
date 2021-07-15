clc, clear, close all

%Parametrii aferenti procesului personal
m = 2.12;
l = 1.53;
g = 10; %Am cosiderat acceleratia gravitatioala egala cu 10
zeta = 6.93;

params.m = m;
params.l = l;
params.g = g;
params.zeta = zeta;

%x0 = [theta1; d_theta1; theta2;  d_theta2]
x0 = [0; %conditie initiala theta1
    0;  %conditie initiala d_theta1
    0;  %conditie initiala d_theta2
    0]; %conditie initiala theta2



params_bus_info = Simulink . Bus . createObject ( params ) ;
params_bus = evalin ( 'base' , params_bus_info . busName) ;

Tmax = 30; %timpul de simulare
load_system('fcn')
set_param('fcn','StopTime',num2str(Tmax))

% Cerinta a)
t = linspace(0,15,100).';
step = double(t>=0);
u = timeseries(step,t); %intrarea treapta a sistemului 

out = sim('fcn');
y1_step = out.theta1.Data; %raspunsul la intrarea treapta - theta1
y2_step = out.theta2.Data; %raspunsul la intrarea treapta - theta2

figure(1)
title('Raspunsul sistemului la intrare treapta')
plot(1:length(y1_step),y1_step)
xlabel('Timp')
ylabel('Iesire 1(y_1)')

figure(2)
title('Raspunsul sistemului la intrare treapta')
plot(1:length(y2_step),y2_step)
xlabel('Timp')
ylabel('Iesire 2(y_2)')

%Cerinta b)

ustar = [4.5; 6.3; 8.6; 9.8]; %vector cu valori ale intrarii pentru care sistemul atinge regimul stationar
%Am verificat plaja de valori a intrarii pentru care modelul admite regim stationar, aceasta fiind
%intervalul [-45; 45] => cum vectorul ustar cuprinde valori din acest
%interval, putem garanta atingerea unui regim stationar 
ystar1 = zeros(length(ustar),1);
ystar2 = zeros(length(ustar),1);

for(i = 1:length(ustar))
    u = timeseries(ustar(i).*step,t);
    out = sim('fcn');
    ystar1(i) = out.theta1.Data(end); 
    ystar2(i) = out.theta2.Data(end);
end

p1 = polyfit(ustar,ystar1,3); 
p2 = polyfit(ustar,ystar2,3);

ustar_1 = ustar(1):0.1:ustar(end);

ystar_1 = polyval(p1,ustar_1);
ystar_2 = polyval(p2,ustar_1);

figure(3)
plot(ustar,ystar1,'bs')
title('Caracteristica statica a primei iesiri y1 = y1(u)')
xlabel('u*')
ylabel('(y_1)*')
hold on 
plot(ustar_1,ystar_1,'--m')
legend('Caracteristica statica','Aproximarea polinomiala de ordin 3')
hold off


figure(4)
plot(ustar,ystar2,'bs')
title('Caracteristica statica a celei de-a doua iesiri y2 = y2(u)')
xlabel('u*')
ylabel('(y_2)*')
hold on
plot(ustar_1,ystar_2,'--m')
legend('Caracteristica statica','Aproximarea polinomiala de ordin 3')
hold off


%Cerinta c)
u = timeseries(step,t); % intrare treapta
%Am considerat un ciclu for pentru a schimba conditiile initiale din
%interiorul integratorilor; alegerea valorilor initiale nu a fost una
%intamplatoare, pentru anumite valori, programul crapa din cauza impartirii
%prin  cos2(?1(t) ? ?2(t)) ce se observa in ecuatiile procesului studiat
% Valorile din vectorul asociat conditiilor initiale corespund
% integratorilor dupa modelul %x0 = [theta1; d_theta1; theta2; d_theta2]
for(j = 1:5)  
   if(j == 1)
       x0 = [0;1;0;0];
   elseif(j == 2)
       x0 = [2;2;2;2];
   elseif (j == 3)
       x0 = [0;5;0;0];
   elseif (j == 4)
        x0 = [0;1;0;1];
    elseif (j == 5)
       x0 = [1;1;1;1];
    end
    out = sim('fcn');
    y1_step_cond = out.theta1.Data;
    y2_step_cond = out.theta2.Data;
    
    figure(j+4)
    subplot(2,1,1)
    plot(y1_step_cond)
    xlabel('u')
    ylabel('y_1')
    if(j == 1)
       title('Graficul primei iesiri la intrare treapta si x0 = [0;1;0;0]')
   elseif(j == 2)
        title('Graficul primei iesiri la intrare treapta si x0 = [2;2;2;2]')
   elseif (j == 3)
        title('Graficul primei iesiri la intrare treapta si x0 = [0;5;0;0]')
   elseif (j == 4)
       title('Graficul primei iesiri la intrare treapta si x0 = [0;1;0;1]')
    elseif (j == 5)
        title('Graficul primei iesiri la intrare treapta si x0 = [1;1;1;1]')
    end
    subplot(2,1,2)
    plot(y2_step_cond)
    xlabel('u')
    ylabel('y_2')
     if(j == 1)
       title('Graficul celei de-a doua iesiri la intrare treapta si x0 = [0;1;0;0]')
   elseif(j == 2)
        title('Graficul celei de-a doua iesiri la intrare treapta si x0 = [2;2;2;2]')
   elseif (j == 3)
        title('Graficul celei de-a doua iesiri la intrare treapta si x0 = [0;5;0;0]')
   elseif (j == 4)
       title('Graficul celei de-a doua iesiri la intrare treapta si x0 = [0;1;0;1] ')
    elseif (j == 5)
        title('Graficul celei de-a doua iesiri la intrare treapta si x0 = [1;1;1;1]')
    end
end


