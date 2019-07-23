% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 22 July 2019

color1 = '#FDC783';
color2 = '#EA915C';
color3 = '#815030';
color4 = '#291C13';
colors = {color1, color2, color3, color4};

depth1 = '0-0.5cm depth';
depth2 = '0.5-1cm depth';
depth3 = '2-3cm depth';
depth4 = '4-5cm depth';
depth_titles = {depth1, depth2, depth3, depth4};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EACH CORE IN SAN PABLO BAY: SAME DEPTHS COMPARED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
for ii = 1:n_GS_depths
    f(ii) = subplot(n_GS_depths,1,ii);
    for jj = 1:n_sp_syringes
        semilogx(size_bins,GS((jj-1)*n_GS_depths+ii,:));
        hold on
    end
    xlabel('Bin Size (mm)'); ylabel('% weight');
    title(depth_titles{ii});
end
legend('1','2','3','4','5','6');
linkaxes(f)
ylim([0 10])
xlim([-inf 1])
sgtitle(first_label);

figure
for ii = 1:n_GS_depths
    f(ii) = subplot(n_GS_depths,1,ii);
    for jj = 1:n_sp_syringes
        semilogx(size_bins,GS((jj-1)*n_GS_depths+24+ii,:));
        hold on
    end
    xlabel('Bin Size (mm)'); ylabel('% weight');
    title(depth_titles{ii});
end
legend('1','2','3','4','5','6');
linkaxes(f)
ylim([0 10])
xlim([-inf 1])
sgtitle(second_label);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BOUND PLOTS ACROSS DEPTHS, COMPARING BAYS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% http://kellyakearney.net/2016/06/10/boundedline.html.
% TEST SECTION

figure
for ii = 1:n_GS_depths
    f(ii) = subplot(n_GS_depths,1,ii);
    boundedline(log_size_bins,first_bay_means(ii,:),first_bay_stds(ii,:),'b','alpha');
    hold on
    boundedline(log_size_bins,second_bay_means(ii,:),second_bay_stds(ii,:),'r','alpha');
    xlabel('Log_1_0 Bin Size (mm)'); ylabel('% weight');
end
sgtitle(strcat(strcat(first_label,' (blue)'),', ',strcat(second_label,' (red)')));
linkaxes(f)
ylim([0 10])
xlim([-inf -1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EACH SYRINGE, COMPARING DEPTHS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% figure
% for ii = n_g_syringes % ASSUMES same number (6) of syringes per bay
%     f(ii) = subplot(2,3,ii);
%     for jj = 1:n_GS_depths
%         semilogx(size_bins,GS((ii-1)*n_GS_depths+jj,:),'Color',colors{jj});
%         hold on
%     end
%     xlabel('Bin Size (mm)'); ylabel('% weight');
%     hold off
% end
% sgtitle(first_label);
% linkaxes(f)
% ylim([0 10])
% xlim([-inf 1])
% legend('0-0.5cm','0.5-1cm','2-3cm','4-5cm');
% 
% figure
% for ii = n_g_syringes % ASSUMES same number (6) of syringes per bay
%     f(ii) = subplot(2,3,ii);
%     for jj = 1:n_GS_depths
%         semilogx(size_bins,GS((ii-1)*n_GS_depths+24+jj,:),'Color',colors{jj});
%         hold on
%     end
%     xlabel('Bin Size (mm)'); ylabel('% weight');
% end
% sgtitle(second_label);
% linkaxes(f)
% ylim([0 10])
% xlim([-inf 1])
% legend('0-0.5cm','0.5-1cm','2-3cm','4-5cm');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure % San Pablo

f(1) = subplot(2,3,1);
semilogx(size_bins,GS(1,:),'Color',color1);
hold on
semilogx(size_bins,GS(2,:),'Color',color2);
semilogx(size_bins,GS(3,:),'Color',color3);
semilogx(size_bins,GS(4,:),'Color',color4);
xlabel('Bin Size (mm)'); ylabel('% weight');

legend('0-0.5cm','0.5-1cm','2-3cm','4-5cm');

f(2) = subplot(2,3,2);
semilogx(size_bins,GS(5,:),'Color',color1);
hold on
semilogx(size_bins,GS(6,:),'Color',color2);
semilogx(size_bins,GS(7,:),'Color',color3);
semilogx(size_bins,GS(8,:),'Color',color4);
xlabel('Bin Size (mm)'); ylabel('% weight');

f(3) = subplot(2,3,3);
semilogx(size_bins,GS(9,:),'Color',color1);
hold on
semilogx(size_bins,GS(10,:),'Color',color2);
semilogx(size_bins,GS(11,:),'Color',color3);
semilogx(size_bins,GS(12,:),'Color',color4);
xlabel('Bin Size (mm)'); ylabel('% weight');

f(4) = subplot(2,3,4);
semilogx(size_bins,GS(13,:),'Color',color1);
hold on
semilogx(size_bins,GS(14,:),'Color',color2);
semilogx(size_bins,GS(15,:),'Color',color3);
semilogx(size_bins,GS(16,:),'Color',color4);
xlabel('Bin Size (mm)'); ylabel('% weight');

f(5) = subplot(2,3,5);
semilogx(size_bins,GS(17,:),'Color',color1);
hold on
semilogx(size_bins,GS(18,:),'Color',color2);
semilogx(size_bins,GS(19,:),'Color',color3);
semilogx(size_bins,GS(20,:),'Color',color4);
xlabel('Bin Size (mm)'); ylabel('% weight');

f(6) = subplot(2,3,6);
semilogx(size_bins,GS(21,:),'Color',color1);
hold on
semilogx(size_bins,GS(22,:),'Color',color2);
semilogx(size_bins,GS(23,:),'Color',color3);
semilogx(size_bins,GS(24,:),'Color',color4);
xlabel('Bin Size (mm)'); ylabel('% weight');

linkaxes(f)
ylim([0 10])
xlim([-inf 1])
sgtitle(first_label);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EACH CORE IN SAN PABLO BAY: SAME DEPTHS COMPARED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure 

f(1) = subplot(2,3,1);
semilogx(size_bins,GS(25,:),'Color',color1);
hold on
semilogx(size_bins,GS(26,:),'Color',color2);
semilogx(size_bins,GS(27,:),'Color',color3);
semilogx(size_bins,GS(28,:),'Color',color4);
xlabel('Bin Size (mm)'); ylabel('% weight');

legend('0-0.5cm','0.5-1cm','2-3cm','4-5cm');

f(2) = subplot(2,3,2);
semilogx(size_bins,GS(29,:),'Color',color1);
hold on
semilogx(size_bins,GS(30,:),'Color',color2);
semilogx(size_bins,GS(31,:),'Color',color3);
semilogx(size_bins,GS(32,:),'Color',color4);
xlabel('Bin Size (mm)'); ylabel('% weight');

f(3) = subplot(2,3,3);
semilogx(size_bins,GS(33,:),'Color',color1);
hold on
semilogx(size_bins,GS(34,:),'Color',color2);
semilogx(size_bins,GS(35,:),'Color',color3);
semilogx(size_bins,GS(36,:),'Color',color4);
xlabel('Bin Size (mm)'); ylabel('% weight');

f(4) = subplot(2,3,4);
semilogx(size_bins,GS(37,:),'Color',color1);
hold on
semilogx(size_bins,GS(38,:),'Color',color2);
semilogx(size_bins,GS(39,:),'Color',color3);
semilogx(size_bins,GS(40,:),'Color',color4);
xlabel('Bin Size (mm)'); ylabel('% weight');

f(5) = subplot(2,3,5);
semilogx(size_bins,GS(41,:),'Color',color1);
hold on
semilogx(size_bins,GS(42,:),'Color',color2);
semilogx(size_bins,GS(43,:),'Color',color3);
semilogx(size_bins,GS(44,:),'Color',color4);
xlabel('Bin Size (mm)'); ylabel('% weight');

f(6) = subplot(2,3,6);
semilogx(size_bins,GS(45,:),'Color',color1);
hold on
semilogx(size_bins,GS(46,:),'Color',color2);
semilogx(size_bins,GS(47,:),'Color',color3);
semilogx(size_bins,GS(48,:),'Color',color4);
xlabel('Bin Size (mm)'); ylabel('% weight');

linkaxes(f)
ylim([0 10])
xlim([-inf 1])
sgtitle(second_label);

