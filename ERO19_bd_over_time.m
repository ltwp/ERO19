% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Updated 8 October 2019

% Plotting change in time for bulk density over trips 1-7 (summer 2019)
n_trips = 7;
springs = [1 4 6]; % Trip #s which were Spring Tides
neaps = [2 3 5 7]; % Trips #s which were Neap Tides
dates = {'1: June 12/13','2: June 26/27','3: July 9/10','4: July 18/19','5: Aug 6/7','6: Aug 14/15','7: Aug 21'};

% Colors to represent change over time. 
% start_color = [41,28,19]./255; % dark brown
% end_color = [253,199,131]./255; % light tan
start_color = [149,111,49]./255; % light brown
end_color = [51,237,233]./255; % aqua
colors = [linspace(start_color(1),end_color(1),n_trips)',linspace(start_color(2),end_color(2),n_trips)',linspace(start_color(3),end_color(3),n_trips)'];

% Plotting San Pablo Bay Averages
figure
g(1) = subplot(2,1,1);
hold on
sanpablo_bd_means = [];
sanpablo_bd_std = [];
for nn = neaps % Using "nn" because "ii" gets overwritten when `run_trip_#` is executed. 
    % Set nn = 1:n_trips to capture all trips. 
    % Set nn = neaps or nn = springs to go through neap or spring tides.
    eval(strcat('run_trip_',num2str(nn)));
    avg_sp_core_bd = (intra_core_means(:,1) + intra_core_means(:,2))./2;
    sanpablo_bd_means = [sanpablo_bd_means avg_sp_core_bd];
    std_sp_core_bd = sqrt((intra_core_std(:,1).^2 + intra_core_std(:,2).^2)./2);
    sanpablo_bd_std = [sanpablo_bd_std std_sp_core_bd];
    
    % To plot just averages, across all cores...
%     plot(avg_sp_core_bd,depths,'o-','MarkerEdgeColor',colors(nn,:),'Color',colors(nn,:),'LineWidth',2);
    errorbar(avg_sp_core_bd,depths,std_sp_core_bd,'horizontal','o-','MarkerEdgeColor',colors(nn,:),'Color',colors(nn,:),'LineWidth',2);
    
    % This for loop plots lines for each box core. 
%     for kk = 1:n_sp_cores
%         errorbar(intra_core_means(:,kk),depths(:),intra_core_std(:,kk),'horizontal','o-','MarkerEdgeColor',colors(nn,:),'Color',colors(nn,:),'LineWidth',2);
%         plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(nn,:),'Color',colors(nn,:),'LineWidth',2);
%     end
end
title('San Pablo Bay');
xlabel('Bulk Density (g/cm^3)'); ylabel('Depth');
hold off

for mm = 1:length(depths)
    temp = mean(sanpablo_bd_std');
    text(1.455,depths(mm),num2str(temp(mm)));
end

% Plotting Grizzly Bay Averages
g(2) = subplot(2,1,2);
hold on
grizzly_bd_means = [];
grizzly_bd_std = [];
for nn = neaps
    eval(strcat('run_trip_',num2str(nn)));
    avg_g_core_bd = (intra_core_means(:,3) + intra_core_means(:,4))./2;
    grizzly_bd_means = [grizzly_bd_means avg_g_core_bd];
    std_g_core_bd = sqrt((intra_core_std(:,3).^2 + intra_core_std(:,4).^2)./2);
    grizzly_bd_std = [grizzly_bd_std std_g_core_bd];
    
    % To plot just averages, across all cores...
%     plot(avg_g_core_bd,depths,'o-','MarkerEdgeColor',colors(nn,:),'Color',colors(nn,:),'LineWidth',2);
    errorbar(avg_g_core_bd,depths,std_g_core_bd,'horizontal','o-','MarkerEdgeColor',colors(nn,:),'Color',colors(nn,:),'LineWidth',2);
    
    % This for loop plots lines for each box core. 
%     for kk = n_sp_cores+1:n_sp_cores+n_g_cores
%         errorbar(intra_core_means(:,kk),depths(:),intra_core_std(:,kk),'horizontal','o-','MarkerEdgeColor',colors(nn,:),'Color',colors(nn,:),'LineWidth',2);
%         plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(nn,:),'Color',colors(nn,:),'LineWidth',2);
%     end
end
title('Grizzly Bay');
xlabel('Bulk Density (g/cm^3)'); ylabel('Depth');
hold off

for mm = 1:length(depths)
    temp = mean(grizzly_bd_std');
    text(1.455,depths(mm),num2str(temp(mm)));
end

linkaxes(g);
axis([1.2,1.5,-5.5,0]); 
sgtitle('Neaps Bulk Densities');
legend(dates{neaps});
