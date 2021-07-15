clc, clear, close all
%% Configurare model

%Definire parametrii model
m = 2.12;
l = 1.53;
g = 10;
zeta = 6.93;

params.m = m;
params.l = l;
params.g = g;
params.zeta = zeta;

x0 =  [0;0;0;0]; % conditii initiale nule

% Setare parametrii pentru modelul simulink
T = 50; 
load_system('fcn'); 
set_param('fcn','StopTime',num2str(T))  
params_bus_info = Simulink.Bus.createObject( params );
params_bus = evalin ('base',params_bus_info.busName);

%Intrare de tip treapta a sistemului
t = linspace(0,T,1e3).';
f = @(t,k) k.*double(t>=0);

%%  Cerinta a) - Liniarizare
ustar = [4.5; 6.3; 8.6; 9.8; 11.3]; %In punctele din vectorul ustar voi face liniarizarea sistemului

ystar1_sim = zeros(length(ustar),1);
ystar2_sim = zeros(length(ustar),1);
xstar_sim = zeros(length(ustar),4);

for i = 1: length(ustar)
%Metoda alternativa    
u = timeseries(f(t,ustar(i)),t);
out = sim('fcn');
ystar1_sim(i) = out.theta1.Data(end,:);
ystar2_sim(i) = out.theta2.Data(end,:);
xstar_sim(i,:) = out.x.Data(end,:).';

%Liniarizare
[A_sim, B_sim, C_sim, D_sim] = linmod('fcn_pini', xstar_sim(i,:), ustar(i));
sys_sim = ss(A_sim, B_sim, C_sim, D_sim);

%Simulare
u2  = f(t,ustar(i));
x0 = [0;0;0;0];

ylsim = lsim(sys_sim, u2 - repmat(ustar(i), length(t),1), t, x0-xstar_sim(i,:).');
y1_sim(:,i) = ylsim(:,1) + repmat(ystar1_sim(i), length(t),1);
y2_sim(:,i) = ylsim(:,2) + repmat(ystar2_sim(i), length(t),1);
end

%Plot sistem dupa liniarizare in cele 5 valori ale lui ustar
figure(1)
subplot(2,1,1)
plot(out.theta1.Time, out.theta1.Data, 'r', 'LineWidth', 1.2)
hold on
for j = 1:length(ustar)
plot(t, y1_sim(:,j), 'b')
hold on 
end
title('Iesirea theta1 inainte si dupa liniarizare')
xlabel('Timp')
ylabel('Theta1')
legend('Iesirea sistemului neliniar','Iesirea sistemului dupa liniarizare')
hold off

subplot(2,1,2)
plot(out.theta2.Time, out.theta2.Data, 'r', 'LineWidth', 1.2) 
hold on
for j = 1:length(ustar)
plot(t, y2_sim(:,j), 'b')
hold on 
end
title('Iesirea theta2 inainte si dupa liniarizare')
xlabel('Timp')
ylabel('Theta2')
legend('Iesirea sistemului neliniar','Iesirea sistemului dupa liniarizare')
hold off

%% Cerinta b) - Caracteristica statica
% Caracteristica statica pentru sistemul neliniar
% Vectorul ustar este identic cu cel de la cerinta a) pentru care am facut
% liniarizarea sistemului 
ystar1_NL = zeros(length(ustar),1);
ystar2_NL = zeros(length(ustar),1);

for i = 1:length(ustar)
    u = timeseries(f(t,ustar(i)),t);
    out = sim('fcn');
    ystar1_NL(i) = out.theta1.Data(end); 
    ystar2_NL(i) = out.theta2.Data(end);
end

p1 = polyfit(ustar,ystar1_NL,4); 
p2 = polyfit(ustar,ystar2_NL,4);

ustar_1 = ustar(1):0.1:ustar(end);

ystar_1NL = polyval(p1,ustar_1);
ystar_2NL = polyval(p2,ustar_1);


% Caracteristica statica pentru sistemele liniare obtinute

% Pentru fiecare punct in care se realizeaza liniarizarea, se considera 5
% valori ale lui ustar pentru care cautam ystar(caracteristica statica)
% Fiecare rand al matricei contine cele 5 valori asociate unei liniarizari.
ustar2_L = [ 3.9  4.2  4.5  4.8  5.1;
             5.5  5.9  6.3  6.7  7.2;
             7.9  8.3  8.6  8.9  9.2;
             9.3  9.5  9.8  10.3 10.5;
             10.8 11  11.3  11.6 11.9 ];
      
             
ystar1_sim_liniar = zeros(length(ustar2_L),length(ustar));
ystar2_sim_liniar = zeros(length(ustar2_L),length(ustar));

ystar1_sim_L = zeros(length(ustar),1);
ystar2_sim_L = zeros(length(ustar),1);
xstar_sim_L = zeros(length(ustar),4);

for i = 1 : length(ustar)
u = timeseries(f(t,ustar(i)),t);
out = sim('fcn');
ystar1_sim_L(i) = out.theta1.Data(end,:);
ystar2_sim_L(i) = out.theta2.Data(end,:);
xstar_sim_L(i,:) = out.x.Data(end,:).';

[A_sim, B_sim, C_sim, D_sim] = linmod('fcn_pini', xstar_sim_L(i,:), ustar(i));
sys_sim = ss(A_sim, B_sim, C_sim, D_sim); %sistemul liniarizat in punctul ustar(i) 

H = (-1)* C_sim *inv(A_sim) *B_sim + D_sim;
% pentru a calcula caracteristica statica a fiecarui sistem dupa
% liniarizare, folosim formula delta_y = H * delta_u, unde delta_y =
% y_caracteristica_statica + ystar_sim si delta_u =
% ustar2_L(ustar_caracteristica_statcia) - ustar(vector ce contine punctele in care se liniarizeaza)

for j = 1 : length(ustar2_L)
    ystar1_sim_liniar(i,j) = H(1)*(ustar2_L(i,j)-ustar(i)) + ystar1_sim_L(i);
    ystar2_sim_liniar(i,j) = H(2)*(ustar2_L(i,j)-ustar(i)) + ystar2_sim_L(i); 
end
end
%%  Afisare caracteristica statica
figure(2)
plot(ustar,ystar1_NL,'bs')
hold on 
plot(ustar_1,ystar_1NL,'--k')
hold on
for i = 1: length(ustar)
    plot(ustar2_L(i,:),ystar1_sim_liniar(i,:),'r');
    hold on
end
title("Caracteristica statica - theta1")
xlabel("ustar")
ylabel("ystar")
legend("Caracteristica statica sistem neliniar","Aproximare polinomiala de ord.4","Caracteristica statica sistem dupa liniarizare")
hold off

figure(3)
plot(ustar,ystar2_NL,'bs')
hold on
plot(ustar_1,ystar_2NL,'--k')
hold on
for i = 1: length(ustar)
    plot(ustar2_L(i,:),ystar2_sim_liniar(i,:),'r');
    hold on
end
title("Caracteristica statica - theta2")
xlabel("ustar")
ylabel("ystar")
legend("Caracteristica statica sistem neliniar","Aproximare polinomiala de ord.4","Caracteristica statica sistem dupa liniarizare")
hold off

%% Cerinta c) - Comparare iesiri sistem neliniar cu iesiri sistem liniar interpolat

a=-0.5;  % termen de amortizare
T=100;                      
timp=linspace(0,T,1e4);         
load_system('fcn'); 
set_param('fcn','StopTime',num2str(T)) 

u = 6.75*double(timp<=30)+ 4.5*double((30<timp).*(timp<=70))+ 10.75*double((70<timp).*(timp<=T));    
ustar={4.5 6.3 8.6};            % puncte in care se va face liniarizarea 

sigma=5*double(timp<=30)+ 6*double((30<timp).*(timp<=70))+ 9*double((70<timp).*(timp<=T));

%% Obtierea liniarizarilor cu trim

x0 = [0;0;0;0];
xst = cell(2,1);
ust = cell(2,1);
yst = cell(2,1);

A = cell(2,1);
B = cell(2,1);
C = cell(2,1);
D = cell(2,1);
for i = 1:length(ustar)
    [xst{i},ust{i},yst{i},~] = trim('fcn_pini',[],ustar{i},[],[],1,[]);
    [A{i},B{i},C{i},D{i}] = linmod('fcn_pini',xst{i},ust{i});
end

%% Calcul lambda specifice
xinitial=[0;0;0;0];                 
y_int1=[];
y_int2 = [];

alternanta=find((diff(sigma))~=0); 
alternanta=[1 alternanta length(timp)];

d=3;
m=1;
knotv=timp([alternanta(1)*ones(1,d-1) alternanta alternanta(end)*ones(1,d-1)]);
bv=bsplinesSymbolic(d,knotv);

[btt,tt]=plot_bsplines(bv{end},knotv); 
tt(end)=[];
temp=[btt{1}+btt{2}; reshape([btt{3:end-2}],length(btt)-4,length(tt)); btt{end-1}+btt{end}];


for i=1:size(temp,1)
    lambda(i,:)=interp1(tt,temp(i,:),timp);
end

%% Calculul iesirilor dupa interpolare
y_int1=[];
y_int2=[];
for i=1:length(ustar)   
    [ylin,~,xlin]=lsim(ss(A{i},B{i},C{i},D{i}),u-ust{i},timp,xinitial-xst{i});
    y_lin1 = ylin(:,1)+yst{i}(1);
    y_lin2 = ylin(:,2)+yst{i}(2); 
      if i==1
        y_int1=y_lin1'.*lambda(i,:);
        y_int2=y_lin2'.*lambda(i,:);
    else
        y_int1=y_int1+y_lin1'.*lambda(i,:);
        y_int2=y_int2+y_lin2'.*lambda(i,:);
    end
end

%% 
load_system('fcn'); 
set_param('fcn', 'StopTime', num2str(T)) 
u=timeseries(u',timp);    
out = sim('fcn');      

%% Afisare iesiri in cazul sistemului neliniar si dupa liniarizarea si interpolarea sistemului
figure(4)
subplot(2,1,1)
plot(out.theta1.Time, out.theta1.Data,'b')
hold on
plot(timp,y_int1,'r')
title("Iesirea theta1 a sistemului neliniar/ sistemului liniar interpolat")
xlabel('timp')
ylabel('theta1')
legend('theta1 - sist. neliniar','theta1 - sist. liniar interpolat')
hold off

subplot(2,1,2)
plot(out.theta2.Time, out.theta2.Data,'b')
hold on
plot(timp,y_int2,'r')
legend({'ysim2','y_{int2}'})
title("Iesirea theta2 a sistemului neliniar/ sistemului liniar interpolat")
xlabel('timp')
ylabel('theta2')
legend('theta2 - sist. neliniar','theta2 - sist. liniar interpolat')
hold off