% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

start_color = [253,199,131]./255; % light tan
end_color = [41,28,19]./255; % dark brown
n_trips = 7;
colors = [linspace(start_color(1),end_color(1),n_trips)',linspace(start_color(2),end_color(2),n_trips)',linspace(start_color(3),end_color(3),n_trips)'];

% Plotting change in time for bulk density over trips 01-07 (summer 2019)

figure
g(1) = subplot(2,1,1);
hold on
run_trip_01
for kk = 1:n_sp_cores
    plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(1,:),'Color',colors(1,:),'LineWidth',2);
end
run_trip_02
for kk = 1:n_sp_cores
    plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(2,:),'Color',colors(2,:),'LineWidth',2);
end
run_trip_03
for kk = 1:n_sp_cores
    plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(3,:),'Color',colors(3,:),'LineWidth',2);
end
run_trip_04
for kk = 1:n_sp_cores
    plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(4,:),'Color',colors(4,:),'LineWidth',2);
end
run_trip_05
for kk = 1:n_sp_cores
    plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(5,:),'Color',colors(5,:),'LineWidth',2);
end
run_trip_06
for kk = 1:n_sp_cores
    plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(6,:),'Color',colors(6,:),'LineWidth',2);
end
run_trip_07
for kk = 1:n_sp_cores
    plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(7,:),'Color',colors(7,:),'LineWidth',2);
end
title('San Pablo');
xlabel('Bulk Density (g/cm^3)'); ylabel('Depth');
axis([1.1,1.6,-5.5,0]); 
    
g(2) = subplot(2,1,2);
hold on
run_trip_01
for kk = n_sp_cores+1:n_sp_cores+n_g_cores
    plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(1,:),'Color',colors(1,:),'LineWidth',2);
end
run_trip_02
for kk = n_sp_cores+1:n_sp_cores+n_g_cores
    plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(2,:),'Color',colors(2,:),'LineWidth',2);
end
run_trip_03
for kk = n_sp_cores+1:n_sp_cores+n_g_cores
    plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(3,:),'Color',colors(3,:),'LineWidth',2);
end
run_trip_04
for kk = n_sp_cores+1:n_sp_cores+n_g_cores
    plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(4,:),'Color',colors(4,:),'LineWidth',2);
end
run_trip_05
for kk = n_sp_cores+1:n_sp_cores+n_g_cores
    plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(5,:),'Color',colors(5,:),'LineWidth',2);
end
run_trip_06
for kk = n_sp_cores+1:n_sp_cores+n_g_cores
    plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(6,:),'Color',colors(6,:),'LineWidth',2);
end
run_trip_07
for kk = n_sp_cores+1:n_sp_cores+n_g_cores
    plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(7,:),'Color',colors(7,:),'LineWidth',2);
end
title('Grizzly');
xlabel('Bulk Density (g/cm^3)'); ylabel('Depth');
axis([1.1,1.6,-5.5,0]); 