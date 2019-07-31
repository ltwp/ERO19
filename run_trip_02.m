%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRIP 02 (June 26/27 2019)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 31 July 2019

fprintf('Running Trip 03 Processing.\n');

weights = csvread('trip02/02_bulk_densities.csv',6,1); 

sanpablo_cores = [7 9; 10 12]; 
grizzly_cores = [1 3; 4 6];
% Each row represents a different gomex, with syringe number starts and
% ends. 

salinity_sanpablo = 10; % ppt, ASSUMED
salinity_grizzly = 0; % ppt, ASSUMED

GS = csvread('trip02/02_grain_size.csv',2,2);
% Note Row 1 is size in mm, Row 2 is Phi values, thereafter are % weights.
% Skipped Sample IDs & Bag #s. 

ERO19_master