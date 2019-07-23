%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRIP 03 (July 7/8 2019)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 22 July 2019

fprintf('Running Trip 03 Processing.\n');

weights = csvread('trip03/03_bulk_densities.csv',6,1); 

sanpablo_cores = [7 9; 10 12]; 
grizzly_cores = [1 3; 4 6];
% Each row represents a different gomex, with syringe number starts and
% ends. 

salinity_sanpablo = 10; % ppt, ASSUMED
salinity_grizzly = 0; % ppt, ASSUMED

% GS = csvread('trip02/02_grain_size.csv',0,2);
% % Note Row 1 is size in mm, Row 2 is Phi values, thereafter are % weights.
% % Skipped Sample IDs & Bag #s. 
% GS = GS(3:end,:); % Trim it! 

% 
% GS = [GS(1:16,:); GS(18:49,:)]; 
% % Remove duplicates which didn't seem to have an effect. 
% n_GS_depths = 4;

ERO19_master