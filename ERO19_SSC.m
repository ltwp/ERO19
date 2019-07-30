% Lukas WinklerPrins

% LAST EDITED 30 JULY 2019

M = csvread('SSC_master_list.csv',1,2);

grizzly = [M(1:8,:); M(26:35,:); M(44:51,:); M(60:67,:)];
sanpablo = [M(9:25,:); M(36:43,:); M(52:59,:); M(68:75,:)];

N = csvread('SSC_master_averaged.csv',1,0);
% Pablo Mooring, Pablo Spider, Grizzly Mooring, Grizzly Spider

p_m = N(:,1:2); %pablo_mooring(pablo_mooring==0) = [];
p_s = N(:,3:4); %pablo_spider(pablo_spider==0) = [];
g_m = N(:,5:6); %grizzly_mooring(grizzly_mooring==0) = [];
g_s = N(:,7:8); %grizzly_spider(grizzly_spider==0) = [];

% Grizzly mooring 1:3, 15:17, 23:25, 30:32
% San Pablo mooring 5:7, 10:12, 19:21, 27:29, 34:36

figure
plot(g_m(1:3,2),g_m(1:3,1),'o-');
hold on
plot(g_m(15:17,2),g_m(15:17,1),'o-');
plot(g_m(23:25,2),g_m(23:25,1),'o-');
plot(g_m(30:32,2),g_m(30:32,1),'o-');
ylabel('cmab'); xlabel('SSC (mg/L)');
title('Grizzly Bay');
ylim([0,80]); 
scatter(g_s(:,2),g_s(:,1),'k*');
legend('Trip 1','Trip 2','Trip  3','Trip 4','Spider Data');

figure
plot(p_m(5:7,2),p_m(5:7,1),'o-');
hold on
plot(p_m(10:12,2),p_m(10:12,1),'o-');
plot(p_m(19:21,2),p_m(19:21,1),'o-');
plot(p_m(27:29,2),p_m(27:29,1),'o-');
plot(p_m(34:36,2),p_m(34:36,1),'o-');
ylabel('cmab'); xlabel('SSC (mg/L)');
title('San Pablo Bay');
ylim([0,80]); 
scatter(p_s(:,2),p_s(:,1),'k*');
legend('Trip 1','Trip 1 x2','Trip 2','Trip  3','Trip 4','Spider Data');
