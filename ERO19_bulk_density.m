% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited July 15 2019

ERO19_bulk_density_setup

intra_core_means = zeros(n_sections,n_cores);
intra_core_std = zeros(n_sections,n_cores);
for ii = 1:n_sections
    for jj = 1:n_cores
        begin = combined_cores(jj,1);
        stop = combined_cores(jj,end);
        % Intra Core Metrics always SAN PABLO then GRIZZLY
        intra_core_means(ii,jj) = mean(bulk_density(ii,begin:stop));
        intra_core_std(ii,jj) = std(bulk_density(ii,begin:stop));
    end
end

ERO19_bulk_density_plotting

