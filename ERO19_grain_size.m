% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 23 July 2019

load('size_bins.mat');
log_size_bins = log10(size_bins);
n_size_bins = length(size_bins);
n_GS_depths = 4;

% ASSUMING SIX SYRINGES PER BAY...
first_bay_means = [mean([GS(1,:); GS(5,:); GS(9,:); GS(13,:); GS(17,:); GS(21,:)]); mean([GS(2,:); GS(6,:); GS(10,:); GS(14,:); GS(18,:); GS(22,:)]); mean([GS(3,:); GS(7,:); GS(11,:); GS(15,:); GS(19,:); GS(23,:)]); mean([GS(4,:); GS(8,:); GS(12,:); GS(16,:); GS(20,:); GS(24,:)]);];
second_bay_means = [mean([GS(25,:); GS(29,:); GS(33,:); GS(37,:); GS(41,:); GS(45,:)]); mean([GS(26,:); GS(30,:); GS(34,:); GS(38,:); GS(42,:); GS(46,:)]); mean([GS(27,:); GS(31,:); GS(35,:); GS(39,:); GS(43,:); GS(47,:)]); mean([GS(28,:); GS(32,:); GS(36,:); GS(40,:); GS(44,:); GS(48,:)]);];

first_bay_stds = [std([GS(1,:); GS(5,:); GS(9,:); GS(13,:); GS(17,:); GS(21,:)]); std([GS(2,:); GS(6,:); GS(10,:); GS(14,:); GS(18,:); GS(22,:)]); std([GS(3,:); GS(7,:); GS(11,:); GS(15,:); GS(19,:); GS(23,:)]); std([GS(4,:); GS(8,:); GS(12,:); GS(16,:); GS(20,:); GS(24,:)]);];
second_bay_stds = [std([GS(25,:); GS(29,:); GS(33,:); GS(37,:); GS(41,:); GS(45,:)]); std([GS(26,:); GS(30,:); GS(34,:); GS(38,:); GS(42,:); GS(46,:)]); std([GS(27,:); GS(31,:); GS(35,:); GS(39,:); GS(43,:); GS(47,:)]); std([GS(28,:); GS(32,:); GS(36,:); GS(40,:); GS(44,:); GS(48,:)]);];

ERO19_grain_size_plotting




