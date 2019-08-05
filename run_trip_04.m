%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRIP 03 (July 7/8 2019)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 5 August 2019

fprintf('Running Trip 04 Processing.\n');

weights = csvread('trip04/04_bulk_densities.csv',6,1); 
weights = weights(1:72,1:4);

sanpablo_cores = [7 9; 10 12]; 
grizzly_cores = [1 3; 4 6];
% Each row represents a different gomex, with syringe number starts and
% ends. 

salinity_sanpablo = 10; % ppt, ASSUMED
salinity_grizzly = 0; % ppt, ASSUMED

ERO19_master