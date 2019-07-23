% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 2 July 2019

load('size_bins.mat');
log_size_bins = log10(size_bins);

n_GS_samples = size(GS,1);
n_size_bins = length(size_bins);

% TOUCHY TOUCHY RIGHT HERE...
means_sp = zeros(n_sp_syringes*n_GS_depths,n_size_bins);
stds_sp = zeros(n_sp_syringes*n_GS_depths,n_size_bins);
means_g = zeros(n_g_syringes*n_GS_depths,n_size_bins);
stds_g = zeros(n_g_syringes*n_GS_depths,n_size_bins);



ERO19_grain_size_plotting




