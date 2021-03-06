% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Updated 18 February 2020

ERO19_trend_prep

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SAN PABLO BAY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
for nn = 1:n_trips 
    % Using "nn" because "ii" gets overwritten when `run_trip_#` is executed. 
    % Set nn = 1:n_trips to capture all trips. 
    % Set nn = neaps or nn = springs to go through neap or spring tides.
    eval(strcat('run_trip_',num2str(nn)));
%     uu(nn) = subplot(n_trips,1,nn);
    for aa = 1:n_GS_depths
        uu(aa) = subplot(n_GS_depths,1,aa);
        if is_grizzly_first
            semilogx(size_bins,second_bay_means(aa,:),'Color',colors_r(nn,:));
        else
            semilogx(size_bins,first_bay_means(aa,:),'Color',colors_r(nn,:));
        end
        hold on
        title(depth_titles{aa});
        xlabel('Size (mm)'); ylabel('% weight');
        xticks([0.001 0.016 0.062 1]);
        xticklabels({'0.001','0.016','0.062','1'});
    end 
    
end

sgtitle('San Pablo Bay');
legend(trip_date_labels)
linkaxes(uu)
ylim([0 10])
xlim([10^-4 1])
hold off
% FOR SOME REASON THESE LINES NEED TO  BE IN THIS PARTICULAR ORDER,
% OTHERWISE MATLAB MESSES UP SGTITLES & LEGENDS ... BE WARY



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GRIZZLY BAY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
for nn = 1:n_trips 
    % Using "nn" because "ii" gets overwritten when `run_trip_#` is executed. 
    % Set nn = 1:n_trips to capture all trips. 
    % Set nn = neaps or nn = springs to go through neap or spring tides.
    eval(strcat('run_trip_',num2str(nn)));
%     vv(nn) = subplot(n_trips,1,nn);
    for aa = 1:n_GS_depths
        vv(aa) = subplot(n_GS_depths,1,aa);
        if is_grizzly_first
            semilogx(size_bins,first_bay_means(aa,:),'Color',colors_b(nn,:));
        else
            semilogx(size_bins,second_bay_means(aa,:),'Color',colors_b(nn,:));
        end
        hold on
        title(depth_titles{aa});
        xlabel('Size (mm)'); ylabel('% weight');
        xticks([0.001 0.016 0.062 1]);
        xticklabels({'0.001','0.016','0.062','1'});
        xlim([10^-4 1])
    end
end

legend(trip_date_labels)
sgtitle('Grizzly Bay');
linkaxes(uu)
ylim([0 10])
xlim([10^-4 1])
hold off



