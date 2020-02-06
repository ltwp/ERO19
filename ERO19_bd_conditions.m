% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Updated 14 October 2019

% Comparing top-section bulk densities to wave height and tidal index
ERO19_prep

% Trips, with appropriate time indexes out of 6715 (GST) or 6619 (PST)
% PST indices seem 14 ahead of GST
% 1: June 12 10:30sp [11] / June 13 9:00g [115]?    [1]  / [2]
% 2: June 26 9:45g [1366] / June 27 9:15sp [1446]   [14] / [15]
% 3: July 9 10:00g [2615] / July 10 9:30sp [2695]   [26] / [27]
% 4: July 18 8:15g [3472] / July 19 7:15sp [3550]   [34] / [35]
% 5: Aug 6 10:00g [5303] / Aug 7 9:15sp [5382]      [52]/ [53]
% 6: Aug 14 11:45g [6078] / Aug 15 10:15sp [6154]   [60]/ [61]
% 7: Aug 21 8:15sp & 11:00g [not on burst record]   [nada]

springs = [1 4 6]; % Trip #s which were Spring Tides
neaps = [2 3 5 7]; % Trips #s which were Neap Tides

top_bd_sp_avgs = [];
top_bd_g_avgs = [];

% load gst_mat_files/ero19gst01_bmn.mat
% grizzly_depth = bmn.depth;
% grizzly_depth = grizzly_depth - mean(grizzly_depth);
% grizzly_datetimes = bmn.datetimes;
load gst_mat_files/ero19gst01_wstat.mat
grizzly_Hrmsp = [ws.Hrmsp];
load pst_mat_files/ero19pst01_bmn.mat
sanpablo_depth = bmn.depth;
sanpablo_datetimes = bmn.datetimes;
load pst_mat_files/ero19pst01_wstat.mat
sanpablo_Hrmsp = [ws.Hrmsp];

% [max_peaks,loc_max] = findpeaks(grizzly_depth);
% [min_peaks,loc_min] = findpeaks(-grizzly_depth);
% min_peaks = -min_peaks;
% tide_switch_times = grizzly_datetimes(floor((loc_max(2:end)+loc_min)./2));
% [sni_g,loc_sni_g] = findpeaks(max_peaks(2:end)-min_peaks);
% sni_g_times = tide_switch_times(loc_sni_g);

tmp = sanpablo_depth - mean(sanpablo_depth);
[max_peaks,loc_max] = findpeaks(tmp);
[min_peaks,loc_min] = findpeaks(-tmp);
min_peaks = -min_peaks;
tide_switch_times = sanpablo_datetimes(floor((loc_max+loc_min)./2));
[sni_sp,loc_sni_sp] = findpeaks(max_peaks-min_peaks,'MaxPeakWidth',4);
sni_sp_times = tide_switch_times(loc_sni_sp);
sni_sp = sni_sp./max(sni_sp);

% grizzly_tidal_index = tidalfil(grizzly_depth,15);
% sanpablo_tidal_index = tidalfil(sanpablo_depth,15);

% ti_values_g = [grizzly_tidal_index(115) grizzly_tidal_index(1366) grizzly_tidal_index(2615) grizzly_tidal_index(3472) grizzly_tidal_index(5303) grizzly_tidal_index(6078)];
% ti_values_g = [grizzly_tidal_index(1366) grizzly_tidal_index(2615) grizzly_tidal_index(3472) grizzly_tidal_index(5303) grizzly_tidal_index(6078)];
ti_values_g = [sni_sp(2) sni_sp(14) sni_sp(26) sni_sp(34) sni_sp(52) sni_sp(60)];
% ti_values_sp = [sanpablo_tidal_index(11) sanpablo_tidal_index(1446) sanpablo_tidal_index(2695) sanpablo_tidal_index(3550) sanpablo_tidal_index(5382) sanpablo_tidal_index(6154)];
% ti_values_sp = [sanpablo_tidal_index(1446) sanpablo_tidal_index(2695) sanpablo_tidal_index(3550) sanpablo_tidal_index(5382) sanpablo_tidal_index(6154)];
ti_values_sp = [sni_sp(1) sni_sp(15) sni_sp(27) sni_sp(35) sni_sp(53) sni_sp(61)];

% H_values_g = [grizzly_Hrmsp(115) grizzly_Hrmsp(1366) grizzly_Hrmsp(2615) grizzly_Hrmsp(3472) grizzly_Hrmsp(5303) grizzly_Hrmsp(6078)];
% H_values_g = [grizzly_Hrmsp(115) grizzly_Hrmsp(1366) grizzly_Hrmsp(2615) grizzly_Hrmsp(3472) grizzly_Hrmsp(5303) grizzly_Hrmsp(6078)];
H_values_g = [mean(grizzly_Hrmsp(114:116)) mean(grizzly_Hrmsp(1365:1467)) mean(grizzly_Hrmsp(2614:2616)) mean(grizzly_Hrmsp(3471:3473)) mean(grizzly_Hrmsp(5302:5404)) mean(grizzly_Hrmsp(6077:6079))];
% H_values_sp = [sanpablo_Hrmsp(11) sanpablo_Hrmsp(1446) sanpablo_Hrmsp(2695) sanpablo_Hrmsp(3550) sanpablo_Hrmsp(5382) sanpablo_Hrmsp(6154)];
% H_values_sp = [sanpablo_Hrmsp(11) sanpablo_Hrmsp(1446) sanpablo_Hrmsp(2695) sanpablo_Hrmsp(3550) sanpablo_Hrmsp(5382) sanpablo_Hrmsp(6154)];
H_values_sp = [mean(sanpablo_Hrmsp(10:12)) mean(sanpablo_Hrmsp(1445:1447)) mean(sanpablo_Hrmsp(2694:2696)) mean(sanpablo_Hrmsp(3549:3551)) mean(sanpablo_Hrmsp(5381:5383)) mean(sanpablo_Hrmsp(6153:6155))];

for nn = 1:n_trips 
    % Using "nn" because "ii" gets overwritten when `run_trip_#` is executed. 
    % Set nn = 1:n_trips to capture all trips. 
    % Set nn = neaps or nn = springs to go through neap or spring tides.
    eval(strcat('run_trip_',num2str(nn)));
    
%     top_bd_sp_avgs = [top_bd_sp_avgs mean(intra_core_means(1,1:2))]; % (intra_core_means(1,1)+intra_core_means(1,2))./2];
%     top_bd_g_avgs = [top_bd_g_avgs mean(intra_core_means(1,3:4))]; % (intra_core_means(1,3)+intra_core_means(1,4))./2];
    top_bd_sp_avgs = [top_bd_sp_avgs mean(mean(intra_core_means(1:2,1:2)))]; % (intra_core_means(1,1)+intra_core_means(1,2))./2];
    top_bd_g_avgs = [top_bd_g_avgs mean(mean(intra_core_means(1:2,3:4)))]; % (intra_core_means(1,3)+intra_core_means(1,4))./2];
    
end

figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bulk Density vs Hrms (wave)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g(1) = subplot(1,2,1);
scatter(H_values_sp,top_bd_sp_avgs(1:end-1),100.*ones(size(H_values_sp)),'rs','filled');
hold on
scatter(H_values_g,top_bd_g_avgs(1:end-1),100.*ones(size(H_values_sp)),'bs','filled');
plot(mean(sanpablo_Hrmsp,'omitnan').*ones(1,2),[0 3],'r-','LineWidth',2);
plot(mean(grizzly_Hrmsp,'omitnan').*ones(1,2),[0 3],'b-','LineWidth',2);
xlabel('H_{rms} (m)'); ylabel('Bulk Density (g/cm^3)');
legend('San Pablo','Grizzly','SPB Mean','GB Mean');
ylim([1.2 1.4]);

ax = gca;
ax.FontSize = 24; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bulk Density vs Tidal Index
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g(2) = subplot(1,2,2);
scatter(ti_values_sp,top_bd_sp_avgs(1:end-1),100.*ones(size(H_values_sp)),'rs','filled');
hold on
scatter(ti_values_g,top_bd_g_avgs(1:end-1),100.*ones(size(H_values_sp)),'bs','filled');
xlabel('Spring-Neap Tidal Strength Index'); ylabel('Bulk Density (g/cm^3)');
ylim([1.2 1.4]);

ax = gca;
ax.FontSize = 24; 

sgtitle('Bulk Density Response to Wave Height & Tidal Strength','FontSize',24);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Extra Parameters & Timeseries
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sanpablo_trip_datetimes = [datetime(2019,6,12,10,30,0), datetime(2019,6,27,9,15,00), datetime(2019,7,10,9,30,0), datetime(2019,7,19,7,15,0), datetime(2019,8,7,9,15,0), datetime(2019,8,15,10,15,0),datetime(2019,8,21,8,15,0)];
grizzly_trip_datetimes = [datetime(2019,6,13,9,0,0), datetime(2019,6,26,9,45,0), datetime(2019,7,9,10,0,0), datetime(2019,7,18,8,15,0), datetime(2019,8,6,10,0,0), datetime(2019,8,14,11,45,0), datetime(2019,8,21,11,0,0)];

figure

t(1) = subplot(2,1,2);
plot(sanpablo_datetimes,tmp,'b');
hold on
plot(sni_sp_times,sni_sp,'r','LineWidth',2);
% plot(sanpablo_datetimes,zeros(size(sanpablo_datetimes)),'k--');
legend('Depth Signal at San Pablo Bay Site','Spring-Neap Tide Strength Index');
xlabel('Date');
ylabel('De-Meaned Depth (m)');
ax = gca;
ax.FontSize = 24; 

t(2) = subplot(2,1,1);
plot(sanpablo_trip_datetimes,top_bd_sp_avgs,'ro-','LineWidth',2);
hold on
plot(grizzly_trip_datetimes,top_bd_g_avgs,'bo-','LineWidth',2);
legend('San Pablo Bay','Grizzly Bay');
xlabel('Date');
ylabel('Bulk Density (g/cm^3)');
title('Average Bulk Density of Top 2 Sections');
ax = gca;
ax.FontSize = 24; 

% t(3) = subplot(3,1,3);
% plot(sanpablo_trip_datetimes(1:end-1),H_values_sp,'ro','LineWidth',2);
% hold on
% plot(grizzly_trip_datetimes(1:end-1),H_values_g,'bo','LineWidth',2);
% legend('San Pablo Bay','Grizzly Bay');
% xlabel('Date');
% ylabel('Wave H_{rms} (m)');
% ax = gca;
% ax.FontSize = 24; 

linkaxes(t,'x');
xlim([datetime(2019,6,12,10,0,0) datetime(2019,8,21,12,0,0)]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% USGS Sac River Flow
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sacramento River at Freeport 11447650
%  P = get_usgs_waterdata('11447650','start_time',datestr(datetime(2019,6,12,0,0,0)),'end_time',datestr(datetime(2019,8,21,23,59,59)));
