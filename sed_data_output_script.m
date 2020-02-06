% Lukas WinklerPrins lukas_wp@berkeley.edu
% Last Edited 28 January 2020

% Sample ID, Bag #, Bag Wt, Wet Wt, Dry Sed Wt, Porosity, Wet BD, Dry BD

ERO19_prep

for nn = 1:n_trips
    
    eval(strcat('run_trip_',num2str(nn)));
    
    output_matrix = zeros(n_sections*n_syringes,6);
    % Bag Wt, Wet Wt, Dry Sed Wt, Porosity, Wet BD, Dry BD

    output_matrix(:,1) = weights(:,2);
    output_matrix(:,2) = weights(:,3);
    output_matrix(:,3) = reshape(dry_mass,n_sections*n_syringes,1);
    output_matrix(:,4) = reshape(porosity,n_sections*n_syringes,1);
    output_matrix(:,5) = reshape(bulk_density,n_sections*n_syringes,1);
    output_matrix(:,6) = reshape(dry_bulk_density,n_sections*n_syringes,1);
    
    writematrix(output_matrix,strcat('trip',num2str(nn),'_output.xlsx'));
    
end