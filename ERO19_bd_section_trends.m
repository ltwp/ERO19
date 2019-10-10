% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Updated 8 October 2019

% Plots BD trends from each section

figure
for ii = 1:n_sections
    h(ii) = subplot(n_sections,1,ii);
    errorbar(1:n_trips,sanpablo_bd_means(ii,:),sanpablo_bd_std(ii,:),'vertical','-o'); 
    hold on
    offset_trip_numbers = 1:n_trips; offset_trip_numbers = offset_trip_numbers + 0.1;
    errorbar(offset_trip_numbers,grizzly_bd_means(ii,:),grizzly_bd_std(ii,:),'vertical','-o');
    xlabel('Trip Number'); ylabel('Bulk Density (g/cm^3)');
end
legend('San Pablo','Grizzly');

linkaxes(h);
ylim([1.2,1.5]); xlim([0.9 7.2]);
sgtitle('Trends in Bulk Density for each Section Depth');