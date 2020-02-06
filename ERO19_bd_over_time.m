% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Updated 6 November 2019

% Plotting change in time for bulk density over trips 1-7 (summer 2019)
ERO19_prep

sanpablo_datetimes = [datetime(2019,6,12,10,30,0), datetime(2019,6,27,9,15,00), datetime(2019,7,10,9,30,0), datetime(2019,7,19,7,15,0), datetime(2019,8,7,9,15,0), datetime(2019,8,15,10,15,0),datetime(2019,8,21,8,15,0),datetime(2019,11,25,9,0,0)];
grizzly_datetimes = [datetime(2019,6,13,9,0,0), datetime(2019,6,26,9,45,0), datetime(2019,7,9,10,0,0), datetime(2019,7,18,8,15,0), datetime(2019,8,6,10,0,0), datetime(2019,8,14,11,45,0), datetime(2019,8,21,11,0,0),datetime(2019,11,25,10,0,0)];

sanpablo_bd_means = [];
sanpablo_bd_std = [];
grizzly_bd_means = [];
grizzly_bd_std = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% San Pablo Bay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
% g(1) = subplot(2,1,1);
hold on
for nn = 1:n_trips 
    % Using "nn" because "ii" gets overwritten when `run_trip_#` is executed. 
    % Set nn = 1:n_trips to capture all trips. 
    % Set nn = neaps or nn = springs to go through neap or spring tides.
    eval(strcat('run_trip_',num2str(nn)));
    
    avg_sp_core_bd = (intra_core_means(:,1) + intra_core_means(:,2))./2;
    sanpablo_bd_means = [sanpablo_bd_means avg_sp_core_bd];
    std_sp_core_bd = sqrt((intra_core_std(:,1).^2 + intra_core_std(:,2).^2)./2);
    sanpablo_bd_std = [sanpablo_bd_std std_sp_core_bd];
    
    % To plot just averages, across all cores...
%     errorbar(avg_sp_core_bd,depths,std_sp_core_bd./sqrt(3),'horizontal','o-','MarkerEdgeColor',colors_g(nn,:),'Color',colors_g(nn,:),'LineWidth',2);
% Note, Standard Error of the Mean
    plot(avg_sp_core_bd,depths,'o-','Color',colors_r(nn,:),'LineWidth',2);
    
    % This for loop plots lines for each box core. 
%     for kk = 1:n_sp_cores
%         errorbar(intra_core_means(:,kk),depths(:),intra_core_std(:,kk),'horizontal','o-','MarkerEdgeColor',colors(nn,:),'Color',colors(nn,:),'LineWidth',2);
%         plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(nn,:),'Color',colors(nn,:),'LineWidth',2);
%     end

    

end
title('San Pablo Bay','FontSize',24);
xlabel('Bulk Density (g/cm^3)'); ylabel('Depth (cm)');
axis([1.2,1.5,-5.5,0]); 
legend(trip_date_labels);
ax = gca;
ax.FontSize = 20; 


% hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Displaying Means & Standard Errors on the Plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for mm = 1:length(depths)
%     temp_stde = mean(sanpablo_bd_std')/sqrt(size(sanpablo_bd_std,2));
%     temp_mean = mean(sanpablo_bd_means');
%     text(1.455,depths(mm),strcat(num2str(temp_mean(mm)),',',num2str(temp_stde(mm))));
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grizzly Bay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
% g(2) = subplot(2,1,2);
hold on
for nn = 1:n_trips
    eval(strcat('run_trip_',num2str(nn)));
    avg_g_core_bd = (intra_core_means(:,3) + intra_core_means(:,4))./2;
    grizzly_bd_means = [grizzly_bd_means avg_g_core_bd];
    std_g_core_bd = sqrt((intra_core_std(:,3).^2 + intra_core_std(:,4).^2)./2);
    grizzly_bd_std = [grizzly_bd_std std_g_core_bd];
    
    % To plot just averages, across all cores...
%     errorbar(avg_g_core_bd,depths,std_g_core_bd,'horizontal','o-','MarkerEdgeColor',colors_g(nn,:),'Color',colors_g(nn,:),'LineWidth',2);
    plot(avg_g_core_bd,depths,'o-','Color',colors_b(nn,:),'LineWidth',2);
    
    % This for loop plots lines for each box core. 
%     for kk = n_sp_cores+1:n_sp_cores+n_g_cores
%         errorbar(intra_core_means(:,kk),depths(:),intra_core_std(:,kk),'horizontal','o-','MarkerEdgeColor',colors(nn,:),'Color',colors(nn,:),'LineWidth',2);
%         plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(nn,:),'Color',colors(nn,:),'LineWidth',2);
%     end
end
title('Grizzly Bay','FontSize',24);
xlabel('Bulk Density (g/cm^3)'); ylabel('Depth (cm)');
ax = gca;
ax.FontSize = 20; 
% hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Displaying Means & Standard Errors on the Plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for mm = 1:length(depths)
%     temp_stde = mean(grizzly_bd_std')/sqrt(size(grizzly_bd_std,2));
%     temp_mean = mean(grizzly_bd_means');
%     text(1.455,depths(mm),strcat(num2str(temp_mean(mm)),',',num2str(temp_stde(mm))));
% end

% linkaxes(g);
axis([1.2,1.5,-5.5,0]); 
% sgtitle('Bulk Densities');
legend(trip_date_labels);
