% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited July 2 2019

% Bag Masses in Col. 2, Wet Masses Col. 3, Dry Masses Col. 4
dry_mass = weights(:,4) - weights(:,2); dry_mass = reshape(dry_mass,n_sections,n_syringes);
water_mass = weights(:,3) - weights(:,4); water_mass = reshape(water_mass,n_sections,n_syringes);

if is_grizzly_first
    first_salinity = salinity_grizzly;
    second_salinity = salinity_sanpablo;
else
    first_salinity = salinity_sanpablo;
    second_salinity = salinity_grizzly;
end
salinity = [first_salinity.*ones(n_sections,n_syringes/2) second_salinity.*ones(n_sections,n_syringes/2)];

bulk_density = zeros(n_sections,n_syringes);

for ii = 1:n_syringes
    bulk_density(:,ii) = f_adjust_saline_bulk_density(water_mass(:,ii),dry_mass(:,ii),salinity(:,ii));
end

% N.B. bulk_density is in the order of cores in the .csv file. Use
% is_grizzly_first (T/F) to determine what order the cores are in. 