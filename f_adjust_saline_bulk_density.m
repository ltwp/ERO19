function bulk_density = f_adjust_saline_bulk_density(water_mass,unadjusted_dry_sediment_mass,salinity,sediment_density)
% F_ADJUST_SALINE_BULK_DENSITY(water mass, dry sediment mass, salinity,
% sediment density) calculates the mass of salt left on sediment sample(s)
% after they have been dried, and accounts for that mass in calculating the
% bulk density of the sample(s). If no sediment density is passed,
% 2.65g/cm3 is assumed. All masses assumed in grams. Salinity  values
% expected in ppt. 

% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited June 20 2019

if isscalar(salinity)
    fprintf('Assuming given salinity stands for all samples.\n');
    n_samples = length(water_mass);
    salinity = salinity.*ones(n_samples,1);
end

water_density = 1.00; % g/cm3
if nargin < 4
    sediment_density = 2.65; % g/cm3
end

salt_mass = water_mass.*(salinity/1000);
dry_sediment_mass = unadjusted_dry_sediment_mass - salt_mass;
porosity = (water_mass./water_density)./((water_mass./water_density + dry_sediment_mass./sediment_density));
dry_bulk_density = (1-porosity).*sediment_density; % Not used but hey, it's here. 

bulk_density = (dry_sediment_mass + water_mass)./(dry_sediment_mass./sediment_density + water_mass/water_density); 

end