% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Updated 18 February 2020

% Plotting change in time for bulk density

% NOTE: ALL PLOTTING IN TRIP RUN SCRIPTS SHOULD BE TURNED OFF!

sanpablo_bd_means = [];
sanpablo_bd_std = [];
grizzly_bd_means = [];
grizzly_bd_std = [];

ERO19_trend_prep

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% San Pablo Bay
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
% g(1) = subplot(2,1,1);
hold on
for nn = 1:n_trips 
    % Using "nn" because "ii" gets overwritten when `run_trip_#` is executed. 
    % Set nn = 1:n_trips to capture all trips. 
    eval(strcat('run_trip_',num2str(nn)));
    % Trip Run Scripts call ERO19_prep.m
    
    avg_sp_core_bd = (intra_core_means(:,1) + intra_core_means(:,2))./2;
    sanpablo_bd_means = [sanpablo_bd_means avg_sp_core_bd];
    std_sp_core_bd = sqrt((intra_core_std(:,1).^2 + intra_core_std(:,2).^2)./2);
    sanpablo_bd_std = [sanpablo_bd_std std_sp_core_bd];
    
    % To plot just averages, across all cores...
    plot(avg_sp_core_bd,depths,'o-','Color',colors_r(nn,:),'LineWidth',2);
    % use errorbar() to plot with std error of the mean
    % errorbar(avg_sp_core_bd,depths,std_sp_core_bd./sqrt(3),'horizontal','o-','MarkerEdgeColor',colors_g(nn,:),'Color',colors_g(nn,:),'LineWidth',2);
    
    % This for loop plots lines for each box core. 
%     for kk = 1:n_sp_cores
%         errorbar(intra_core_means(:,kk),depths(:),intra_core_std(:,kk),'horizontal','o-','MarkerEdgeColor',colors(nn,:),'Color',colors(nn,:),'LineWidth',2);
%         plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(nn,:),'Color',colors(nn,:),'LineWidth',2);
%     end

    

end
title('San Pablo Bay');
xlabel('Bulk Density (g/cm^3)'); ylabel('Depth (cm)');
axis([1.1,1.5,-5.5,0]); 
legend(trip_date_labels);
hold off

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
    if n_cores == 4
        avg_g_core_bd = (intra_core_means(:,3) + intra_core_means(:,4))./2;
        std_g_core_bd = sqrt((intra_core_std(:,3).^2 + intra_core_std(:,4).^2)./2);
    elseif n_cores == 3
        % Case (on trip 8) where Grizzly only had one core...
        avg_g_core_bd = intra_core_means(:,3); % San Pablo is first two, grizzly (all 6 syringes) averaged in third column. 
        std_g_core_bd = sqrt(intra_core_std(:,3).^2);
    end
    grizzly_bd_means = [grizzly_bd_means avg_g_core_bd];
    grizzly_bd_std = [grizzly_bd_std std_g_core_bd];
    
    % To plot just averages, across all cores...
    plot(avg_g_core_bd,depths,'o-','Color',colors_b(nn,:),'LineWidth',2);
    % Std Error plotting line would go here...
    
    % This for loop plots lines for each box core. 
%     for kk = n_sp_cores+1:n_sp_cores+n_g_cores
%         errorbar(intra_core_means(:,kk),depths(:),intra_core_std(:,kk),'horizontal','o-','MarkerEdgeColor',colors(nn,:),'Color',colors(nn,:),'LineWidth',2);
%         plot(intra_core_means(:,kk),depths(:),'o-','MarkerEdgeColor',colors(nn,:),'Color',colors(nn,:),'LineWidth',2);
%     end
end
title('Grizzly Bay');
xlabel('Bulk Density (g/cm^3)'); ylabel('Depth (cm)');
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
axis([1.1,1.5,-5.5,0]); 
% sgtitle('Bulk Densities');
legend(trip_date_labels);
