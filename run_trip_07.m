%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRIP 07 (August 21 2019)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 8 September 2019

fprintf('Running Trip 07 Processing.\n');

weights = csvread('trip07/07_bulk_densities.csv',6,1); 
last_long_syringe = weights(67:end,1:4);
weights = weights(1:72,1:4);

sanpablo_cores = [1 3; 4 6]; 
grizzly_cores = [7 9; 10 12];
% Each row represents a different gomex, with syringe number starts and
% ends. 

salinity_sanpablo = 10; % ppt, ASSUMED
salinity_grizzly = 0; % ppt, ASSUMED

ERO19_master

long_syringe_bd = f_adjust_saline_bulk_density(last_long_syringe(:,3) - last_long_syringe(:,4),last_long_syringe(:,4)-last_long_syringe(:,2),0);
figure
scatter(long_syringe_bd,[-0.5 -1 -2 -3 -4 -5 -6 -7 -8],'bo');
axis([1.1,1.6,-8.5,0]);
xlabel('Bulk Density (g/cm^3'); ylabel('Depth below surface (cm)');
title('Long Syringe Bulk Density, Grizzly Aug 21');