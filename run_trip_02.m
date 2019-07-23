%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRIP 02 (June 26/27 2019)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 8 July 2019

weights = csvread('trip02/02_bulk_densities.csv',6,1); 

sanpablo_cores = [7 9; 10 12]; 
grizzly_cores = [1 3; 4 6];
% Each row represents a different gomex, with syringe number starts and
% ends. 

salinity_sanpablo = 10; % ppt, ASSUMED
salinity_grizzly = 0; % ppt, ASSUMED

GS = csvread('trip02/02_grain_size.csv',0,2);
% Note Row 1 is size in mm, Row 2 is Phi values, thereafter are % weights.
% Skipped Sample IDs & Bag #s. 
GS = GS(3:end,:); % Trim it! 

% Same Core (row #s from Angela's spreadsheet)
% 1 2 3 4 (start san pablo)
% 5 6 7 8
% 9 10 11 12
% 13 14 15 16/17
% 18 19 20 21 
% 22 23 24 25
% 26 27 28 29 (start grizzly)
% 30 31 32 33 
% 34 35 36 37
% 38 39 40 41
% 42 43 44 45
% 46 47 48 49/50

GS = [GS(1:16,:); GS(18:49,:)]; 
% Remove duplicates which didn't seem to have an effect. 
n_GS_depths = 4;

ERO19_master