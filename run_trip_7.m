%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRIP 07 (August 21 2019)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 8 September 2019

fprintf('Running Trip 07 Processing.\n');

weights = readmatrix('2019-625-FA_BD_ALL.xlsx','Sheet',7,'Range','B8:E79');
last_long_syringe = readmatrix('2019-625-FA_BD_ALL.xlsx','Sheet',7,'Range','B74:E82');
weights = weights(1:72,1:4);

sanpablo_cores = [1 3; 4 6]; 
grizzly_cores = [7 9; 10 12];
% Each row represents a different gomex, with syringe number starts and
% ends. 

salinity_sanpablo = 20.9; % ppt, from trip 6
salinity_grizzly = 6.5; % ppt, from trip 6

GS = csvread('trip07/07_grain_size.csv',2,2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run Processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ERO19_prep

ERO19_bulk_density
% ERO19_bulk_density_plotting

ERO19_grain_size
% ERO19_grain_size_plotting

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Extra Long Syringe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% long_syringe_bd = f_adjust_saline_bulk_density(last_long_syringe(:,3) - last_long_syringe(:,4),last_long_syringe(:,4)-last_long_syringe(:,2),0);
% figure
% scatter(long_syringe_bd,[-0.5 -1 -2 -3 -4 -5 -6 -7 -8],'bo');
% axis([1.1,1.6,-8.5,0]);
% xlabel('Bulk Density (g/cm^3'); ylabel('Depth below surface (cm)');
% title('Long Syringe Bulk Density, Grizzly Aug 21');
