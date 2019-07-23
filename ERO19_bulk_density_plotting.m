% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited July 15 2019

% ALL CORE NAMES HERE ARE UP FOR DEBATE...

% FIGURE: ALL SECTION DENSITIES, COLOR-CODED BY EMBAYMENT
% figure
% hold on
% for ii = 1:6
%     scatter(bulk_density(:,ii),depths,20,'r')
%     scatter(bulk_density(:,ii+6),depths,20,'b')
% end
% xlabel('Bulk Density (g/cm^3)'); ylabel('Depth below surface (cm)');
% legend('San Pablo','Grizzly')
% title('Comparison of Bays')

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

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NOT YET FIXED
% figure
% subplot(2,2,1)
% hold on
% for jj = 1:n_sections
%     errorbar(intra_core_means(jj,1),depths(jj),intra_core_std(jj,1),'horizontal','bo');
% end
% title('San Pablo Core 1');
% xlabel('Bulk Density (g/cm^3)'); ylabel('Depth');
% axis([1.1,1.5,-5.5,0]); 
% 
% subplot(2,2,3)
% hold on
% for jj = 1:n_sections
%     errorbar(intra_core_means(jj,2),depths(jj),intra_core_std(jj,2),'horizontal','bo');
% end
% title('San Pablo Core 2');
% xlabel('Bulk Density (g/cm^3)'); ylabel('Depth');
% axis([1.1,1.5,-5.5,0]); 
% 
% subplot(2,2,2)
% hold on
% for jj = 1:n_sections
%     errorbar(intra_core_means(jj,4),depths(jj),intra_core_std(jj,4),'horizontal','bo');
% end
% title('Grizzly Core 1');
% xlabel('Bulk Density (g/cm^3)'); ylabel('Depth');
% axis([1.1,1.5,-5.5,0]); 
% 
% subplot(2,2,4)
% hold on
% for jj = 1:n_sections
%     errorbar(intra_core_means(jj,3),depths(jj),intra_core_std(jj,3),'horizontal','bo');
% end
% title('Grizzly Core 2');
% xlabel('Bulk Density (g/cm^3)'); ylabel('Depth');
% axis([1.1,1.5,-5.5,0]); 

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NOT YET FIXED
% figure
% subplot(2,1,1)
% hold on
% for jj = 1:n_sections
%     errorbar(intra_core_means(jj,1),depths(jj),intra_core_std(jj,1),'horizontal','bo');
% end
% 
% for jj = 1:n_sections
%     errorbar(intra_core_means(jj,2),depths(jj),intra_core_std(jj,2),'horizontal','ro');
% end
% title('San Pablo');
% xlabel('Bulk Density (g/cm^3)'); ylabel('Depth');
% axis([1.1,1.5,-5.5,0]); 
% 
% subplot(2,1,2)
% hold on
% for jj = 1:n_sections
%     errorbar(intra_core_means(jj,4),depths(jj),intra_core_std(jj,4),'horizontal','bo');
% end
% 
% for jj = 1:n_sections
%     errorbar(intra_core_means(jj,3),depths(jj),intra_core_std(jj,3),'horizontal','ro');
% end
% title('Grizzly');
% xlabel('Bulk Density (g/cm^3)'); ylabel('Depth');
% axis([1.1,1.5,-5.5,0]); 

