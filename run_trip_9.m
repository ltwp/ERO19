%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRIP 09 (January 22/23 2020)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Lukas WinklerPrins & Sam McGill
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 11 February 2020

fprintf('Running Trip 09 Processing.\n');

weights = xlsread('trip09/2020-603-FA Trip 9 BD','B8:G85'); 
weights = [weights(1:54,1:4); weights(61:end,1:4)]; % Removed extra errant syringe. 

sanpablo_cores = [7 9;10 12]; 
grizzly_cores = [1 3;4 6];
% Each row represents a different gomex, with syringe number starts and
% ends. 

salinity_sanpablo = 20.9; % ppt, from Trip 6
salinity_grizzly = 6.5; % ppt, from Trip 6

% GS = csvread('trip07/07_grain_size.csv',2,2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run Processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ERO19_prep

ERO19_bulk_density
% ERO19_bulk_density_plotting

ERO19_grain_size
% ERO19_grain_size_plotting
