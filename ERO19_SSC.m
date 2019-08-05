% Lukas WinklerPrins

% LAST EDITED 30 JULY 2019

M = csvread('SSC_master_list.csv',1,2);

grizzly = [M(1:8,:); M(26:35,:); M(44:51,:); M(60:67,:)];
sanpablo = [M(9:25,:); M(36:43,:); M(52:59,:); M(68:75,:)];

N = csvread('SSC_master_averaged.csv',1,0);
% Requires weirdly formatted master list of water samples. 
% Pablo Mooring, Pablo Spider, Grizzly Mooring, Grizzly Spider

p_m = N(:,1:2); % Pablo Mooring
p_s = N(:,3:4); % Pablo Spider
g_m = N(:,5:6); % Grizzly Mooring
g_s = N(:,7:8); % Grizzly Spider
% Note the above arrays are filled with zeros

% MATLAB plotting colors...
color1 = [0, 0.447, 0.741];
color2 = [0.85, 0.325, 0.098];
color3 = [0.929, 0.694, 0.125];
color4 = [0.494, 0.184, 0.556];
color5 = [0.466, 0.674, 0.188];
color6 = [0.301, 0.745, 0.933];
color7 = [0.635, 0.078, 0.184];

% Grizzly mooring 1:3, 15:17, 23:25, 30:32
% Grizzly spider 4, 14, 22, 33
figure
t1 = plot(g_m(1:3,2),g_m(1:3,1),'o-');
hold on
t2 = plot(g_m(15:17,2),g_m(15:17,1),'o-');
t3 = plot(g_m(23:25,2),g_m(23:25,1),'o-');
t4 = plot(g_m(30:32,2),g_m(30:32,1),'o-');
ylabel('cmab'); xlabel('SSC (mg/L)');
title('Grizzly Bay');
ylim([0,80]); 
scatter(g_s(4,2),g_s(4,1),[],color1);
scatter(g_s(14,2),g_s(14,1),[],color2);
scatter(g_s(22,2),g_s(22,1),[],color3);
scatter(g_s(33,2),g_s(33,1),[],color4);
legend([t1,t2,t3,t4],{'Trip 1','Trip 2','Trip  3','Trip 4'});

% San Pablo mooring 5:7, 10:12, 19:21, 27:29, 34:36
% San Pablo spider 8, 9, 18, 26, 37
figure
t1 = plot(p_m(5:7,2),p_m(5:7,1),'o-');
hold on
t2 = plot(p_m(10:12,2),p_m(10:12,1),'o-');
t3 = plot(p_m(19:21,2),p_m(19:21,1),'o-');
t4 = plot(p_m(27:29,2),p_m(27:29,1),'o-');
t5 = plot(p_m(34:36,2),p_m(34:36,1),'o-');
ylabel('cmab'); xlabel('SSC (mg/L)');
title('San Pablo Bay');
ylim([0,80]); 
scatter(p_s(8,2),p_s(8,1),[],color1);
scatter(p_s(9,2),p_s(9,1),[],color2);
scatter(p_s(18,2),p_s(18,1),[],color3);
scatter(p_s(26,2),p_s(26,1),[],color4);
scatter(p_s(37,2),p_s(37,1),[],color5);
legend([t1,t2,t3,t4,t5],{'Trip 1','Trip 1 x2','Trip 2','Trip  3','Trip 4'});
