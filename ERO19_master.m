% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 23 July 2019

% ERO19 MASTER PROCESSING FILE

% Ostensibly to be run to process each individual field run. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRIP DATA CLEANING TO HAPPEN IN SEPARATE FILES

depths = [-0.5; -1; -2; -3; -4; -5];
n_sections = length(depths);

combined_cores = [sanpablo_cores; grizzly_cores];
n_sp_cores = size(sanpablo_cores,1);
n_g_cores = size(grizzly_cores,1);
n_cores = n_sp_cores + n_g_cores;

diff = combined_cores(:,end) - combined_cores(:,1); 
diff = diff+1;
n_sp_syringes = 0;
n_g_syringes = 0;
for ii = 1:n_cores
    if ii <= n_sp_cores
        n_sp_syringes = n_sp_syringes + diff(ii);
    else
        n_g_syringes = n_g_syringes + diff(ii);
    end
end
n_syringes = sum(diff); % RISKY, TEND TO THESE LINES...

% Figure out which core came first (for Salinity Adjustment and Plotting)
is_grizzly_first = isempty(find(sanpablo_cores == 1));
if is_grizzly_first
    first_label = 'Grizzly Bay';
    second_label = 'San Pablo Bay';
else
    first_label = 'San Pablo Bay';
    second_label = 'Grizzly Bay';
end

ERO19_bulk_density

%ERO19_grain_size