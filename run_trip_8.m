%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRIP 08 (November 25 2019)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 5 December 2019

fprintf('Running Trip 08 Processing.\n');

weights = csvread('trip08/08_bulk_densities.csv',6,1); 
last_long_syringe = weights(67:end,1:4);
weights = weights(1:72,1:4);

sanpablo_cores = [1 3; 4 6]; 
grizzly_cores = [7 12];
% Each row represents a different gomex, with syringe number starts and
% ends. 

salinity_sanpablo = 20.9; % ppt, from Trip 7
salinity_grizzly = 6.5; % ppt, from Trip 7

% GS = csvread('trip07/07_grain_size.csv',2,2);
% n_GS_depths = 4;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run Processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ERO19_prep
ERO19_gs_prep

ERO19_bulk_density
ERO19_bulk_density_plotting

% ERO19_grain_size
% ERO19_grain_size_plotting
