% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 10 October 2019



combined_cores = [sanpablo_cores; grizzly_cores];
n_sp_cores = size(sanpablo_cores,1);
n_g_cores = size(grizzly_cores,1);
n_cores = n_sp_cores + n_g_cores;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure out how many syringes there are... (should always be 6...)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
n_syringes = sum(diff); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure out which core came first 
% (for Salinity Adjustment and Plotting)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

is_grizzly_first = isempty(find(sanpablo_cores == 1));
if is_grizzly_first
    first_label = 'Grizzly Bay';
    second_label = 'San Pablo Bay';
else
    first_label = 'San Pablo Bay';
    second_label = 'Grizzly Bay';
end