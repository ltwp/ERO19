%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRIP 04 (July 18/19 2019)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 8 September 2019

fprintf('Running Trip 04 Processing.\n');

weights = csvread('trip04/04_bulk_densities.csv',6,1); 
weights = weights(1:72,1:4);

sanpablo_cores = [7 9; 10 12]; 
grizzly_cores = [1 3; 4 6];
% Each row represents a different gomex, with syringe number starts and
% ends. 

salinity_sanpablo = 10; % ppt, ASSUMED
salinity_grizzly = 0; % ppt, ASSUMED

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run Processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ERO19_prep

ERO19_bulk_density
% ERO19_bulk_density_plotting

% ERO19_grain_size
% ERO19_grain_size_plotting