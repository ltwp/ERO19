% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Updated 8 October 2019

% Plots BD trends from each section.
% To follow ERO19_bd_over_time

sanpablo_datetimes = [datetime(2019,6,12,10,30,0), datetime(2019,6,27,9,15,00), datetime(2019,7,10,9,30,0), datetime(2019,7,19,7,15,0), datetime(2019,8,7,9,15,0), datetime(2019,8,15,10,15,0),datetime(2019,8,21,8,15,0)];
grizzly_datetimes = [datetime(2019,6,13,9,0,0), datetime(2019,6,26,9,45,0), datetime(2019,7,9,10,0,0), datetime(2019,7,18,8,15,0), datetime(2019,8,6,10,0,0), datetime(2019,8,14,11,45,0), datetime(2019,8,21,11,0,0)];

figure
for ii = 1:n_sections
    h(ii) = subplot(n_sections,1,ii);
    plot(sanpablo_datetimes,sanpablo_bd_means(ii,:),'-o','LineWidth',2); 
    hold on
%     offset_trip_numbers = 1:n_trips; offset_trip_numbers = offset_trip_numbers + 0.1;
    plot(grizzly_datetimes,grizzly_bd_means(ii,:),'-o','LineWidth',2);
    xlabel('Date'); ylabel('Bulk Density (g/cm^3)');
%     ax = gca;
%     ax.FontSize = 20; 
end
legend('San Pablo','Grizzly');

linkaxes(h);
ylim([1.2,1.5]); 
% xlim([0.9 7.2]);
sgtitle('Trends in Bulk Density for each Section Depth','FontSize',24);

