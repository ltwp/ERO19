% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited July 23 2019

colors = {'r','b','g','k'};
four_titles = {'San Pablo 1','San Pablo 2','Grizzly 1','Grizzly 2'};
two_titles = {'San Pablo','Grizzly'};
order = [1 3 2 4];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIGURE: SUBPLOTS OF DENSITIES BY CORE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
for ii = 1:n_cores
    f(ii) = subplot(2,2,order(ii)); % Need to prepare this for > 4 cores
    hold on
    for jj = combined_cores(ii,1):combined_cores(ii,2)
        % combined_cores is always SAN PABLO then GRIZZLY
        scatter(bulk_density(:,jj),depths,20,colors{ii});
    end
    xlabel('Bulk Density (g/cm^3'); ylabel('Depth below surface (cm)');
    title(four_titles{ii});
    axis([1.1,1.5,-5.5,0]); 
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIGURE: PLOTS WITH MEANS AND STD BARS FOR EACH SECTION WITHIN EACH CORE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
for ii = 1:n_cores
    f(ii) = subplot(2,2,order(ii));
    
    errorbar(intra_core_means(:,ii),depths(:),intra_core_std(:,ii),'horizontal','bo');

    xlabel('Bulk Density (g/cm^3'); ylabel('Depth below surface (cm)');
    title(four_titles{ii});
    axis([1.1,1.5,-5.5,0]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIGURE: MEANS AND STD OF BULK DENSITY WITHIN CORES, TWO-BAY COMPARISON
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
g(1) = subplot(2,1,1);
hold on
for kk = 1:n_sp_cores
    for jj = 1:n_sections
        errorbar(intra_core_means(jj,kk),depths(jj),intra_core_std(jj,kk),'horizontal',strcat(colors{kk},'o'));
    end
end
title('San Pablo');
xlabel('Bulk Density (g/cm^3)'); ylabel('Depth');
axis([1.1,1.5,-5.5,0]); 
    
g(2) = subplot(2,1,2);
hold on
for kk = n_sp_cores+1:n_sp_cores+n_g_cores
    for jj = 1:n_sections
         errorbar(intra_core_means(jj,kk),depths(jj),intra_core_std(jj,kk),'horizontal',strcat(colors{kk},'o'));
    end
end
title('Grizzly');
xlabel('Bulk Density (g/cm^3)'); ylabel('Depth');
axis([1.1,1.5,-5.5,0]); 

