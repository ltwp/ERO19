%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRIP 01 (June 12/13 2019)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 2 July 2019

weights = csvread('trip01/01_bulk_densities.csv',6,1); 

sanpablo_cores = [1 3; 4 6]; 
grizzly_cores = [7 9; 10 12];
% This means San Pablo Gomex 1 had Syringes 1-3, Gomex 2 4-6... etc. 

% Gomexes as such: SPB 1{1,2,3} 2{4,5,6} // GB 2{7,8,9} 1{10,11,12}

salinity_sanpablo = 10; % ppt, ASSUMED
salinity_grizzly = 0; % ppt, ASSUMED

GS = csvread('trip01/01_grain_size.csv',0,2);
% Note Row 1 is size in mm, Row 2 is Phi values, thereafter are % weights.
% Skipped Sample IDs & Bag #s. 
GS = GS(3:end,:); % Trim it! 

GS = [GS(1:16,:); GS(18:49,:)]; 
% Remove duplicates which didn't seem to have an effect. 
n_GS_depths = 4;

ERO19_master