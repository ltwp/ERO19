%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRIP 02 (June 26/27 2019)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 31 July 2019

fprintf('Running Trip 02 Processing.\n');

weights = readmatrix('2019-625-FA_BD_ALL.xlsx','Sheet',2,'Range','B8:E79');

sanpablo_cores = [7 9; 10 12]; 
grizzly_cores = [1 3; 4 6];
% Each row represents a different gomex, with syringe number starts and
% ends. 

salinity_sanpablo = 15.8; % ppt
salinity_grizzly = 1.8; % ppt

GS = csvread('trip02/02_grain_size.csv',2,2);

carbon = csvread('trip02/02_carbon.csv',1,0);
% Total Carbon, Total Organic Carbon, Total Inorganic Carbon, CaCO3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run Processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ERO19_prep

ERO19_bulk_density
% ERO19_bulk_density_plotting

ERO19_grain_size
% ERO19_grain_size_plotting

ERO19_carbon