%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRIP 01 (June 12/13 2019)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 31 July 2019

fprintf('Running Trip 01 Processing.\n');

weights = readmatrix('2019-625-FA_BD_ALL.xlsx','Sheet',1,'Range','B8:E79');

sanpablo_cores = [1 3; 4 6]; 
grizzly_cores = [7 9; 10 12];
% This means San Pablo Gomex 1 had Syringes 1-3, Gomex 2 4-6... etc. 

% Gomexes as such: SPB 1{1,2,3} 2{4,5,6} // GB 2{7,8,9} 1{10,11,12}

salinity_sanpablo = 13.5; % ppt
salinity_grizzly = 0.4; % ppt

GS = csvread('trip01/01_grain_size.csv',0,2);
% Note Row 1 is size in mm, Row 2 is Phi values, thereafter are % weights.
% Skipped Sample IDs & Bag #s. 
GS = GS(3:end,:); % Trim it! 

GS = [GS(1:16,:); GS(18:49,:)]; 
% Remove duplicates which didn't seem to have an effect. 

carbon = csvread('trip01/01_carbon.csv',1,0);
% Total Carbon, Total Organic Carbon, Total Inorganic Carbon, CaCO3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run Processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ERO19_prep

ERO19_bulk_density
% ERO19_bulk_density_plotting

ERO19_grain_size
% ERO19_grain_size_plotting

% ERO19_carbon

