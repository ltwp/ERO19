% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

start_color = [41,28,19]./255; % dark brown
end_color = [253,199,131]./255; % light tan
n_trips = 7;
colors = [linspace(start_color(1),end_color(1),n_trips)',linspace(start_color(2),end_color(2),n_trips)',linspace(start_color(3),end_color(3),n_trips)'];

% Plotting change in time for bulk density over trips 01-07 (summer 2019)

figure
g(1) = subplot(2,1,1);
hold on
for nn = 1:n_trips % Using "nn" because "ii" gets overwritten when `run_trip_#` is executed. 
    eval(strcat('run_trip_0',num2str(nn)));
    for kk = 1:n_sp_cores
        plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(nn,:),'Color',colors(nn,:),'LineWidth',2);
    end
end
title('San Pablo');
xlabel('Bulk Density (g/cm^3)'); ylabel('Depth');
axis([1.2,1.5,-5.5,0]); 
hold off
    
g(2) = subplot(2,1,2);
hold on
for nn = 1:n_trips
    eval(strcat('run_trip_0',num2str(nn)));
    for kk = n_sp_cores+1:n_sp_cores+n_g_cores
        plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(nn,:),'Color',colors(nn,:),'LineWidth',2);
    end
end

title('Grizzly');
xlabel('Bulk Density (g/cm^3)'); ylabel('Depth');
axis([1.2,1.5,-5.5,0]); 
hold off