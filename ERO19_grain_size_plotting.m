% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 22 July 2019

color1 = '#FDC783';
color2 = '#EA915C';
color3 = '#815030';
color4 = '#291C13';

n_depths = 4;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EACH CORE IN SAN PABLO BAY: SAME DEPTHS COMPARED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% figure
% for ii = 1:n_depths
%     f(ii) = subplot(n_depths,1,ii);
%     for jj = 1:n_sp_syringes
%         semilogx(size_bins,GS((jj-1)*n_depths+1,:));
%         hold on
%     end
%     xlabel('Bin Size (mm)'); ylabel('% weight');
%     title('0-0.5cm depth');
% end
% legend('1','2','3','4','5','6');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure

f(1) = subplot(4,1,1);
semilogx(size_bins,GS(1,:));
hold on
semilogx(size_bins,GS(5,:));
semilogx(size_bins,GS(9,:));
semilogx(size_bins,GS(13,:));
semilogx(size_bins,GS(17,:));
semilogx(size_bins,GS(21,:));
xlabel('Bin Size (mm)'); ylabel('% weight');
title('0-0.5cm depth');
legend('1','2','3','4','5','6');
mean_sp_1 = mean([GS(1,:); GS(5,:); GS(9,:); GS(13,:); GS(17,:); GS(21,:)]);
std_sp_1 = std([GS(1,:); GS(5,:); GS(9,:); GS(13,:); GS(17,:); GS(21,:)]);

f(2) = subplot(4,1,2);
semilogx(size_bins,GS(2,:));
hold on
semilogx(size_bins,GS(6,:));
semilogx(size_bins,GS(10,:));
semilogx(size_bins,GS(14,:));
semilogx(size_bins,GS(18,:));
semilogx(size_bins,GS(22,:));
xlabel('Bin Size (mm)'); ylabel('% weight');
title('0.5-1.0cm depth');
mean_sp_2 = mean([GS(2,:); GS(6,:); GS(10,:); GS(14,:); GS(18,:); GS(22,:)]);
std_sp_2 = std([GS(2,:); GS(6,:); GS(10,:); GS(14,:); GS(18,:); GS(22,:)]);

f(3) = subplot(4,1,3);
semilogx(size_bins,GS(3,:));
hold on
semilogx(size_bins,GS(7,:));
semilogx(size_bins,GS(11,:));
semilogx(size_bins,GS(15,:));
semilogx(size_bins,GS(19,:));
semilogx(size_bins,GS(23,:));
xlabel('Bin Size (mm)'); ylabel('% weight');
title('2-3cm depth');
mean_sp_3 = mean([GS(3,:); GS(7,:); GS(11,:); GS(15,:); GS(19,:); GS(23,:)]);
std_sp_3 = std([GS(3,:); GS(7,:); GS(11,:); GS(15,:); GS(19,:); GS(23,:)]);

f(4) = subplot(4,1,4);
semilogx(size_bins,GS(4,:));
hold on
semilogx(size_bins,GS(8,:));
semilogx(size_bins,GS(12,:));
semilogx(size_bins,GS(16,:));
semilogx(size_bins,GS(20,:));
semilogx(size_bins,GS(24,:));
xlabel('Bin Size (mm)'); ylabel('% weight');
title('4-5cm depth');
mean_sp_4 = mean([GS(4,:); GS(8,:); GS(12,:); GS(16,:); GS(20,:); GS(24,:)]);
std_sp_4 = std([GS(4,:); GS(8,:); GS(12,:); GS(16,:); GS(20,:); GS(24,:)]);

sgtitle('San Pablo Bay');
linkaxes(f)
ylim([0 10])
xlim([-inf 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EACH CORE IN GRIZZLY BAY: SAME DEPTHS COMPARED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure

f(1) = subplot(4,1,1);
semilogx(size_bins,GS(25,:));
hold on
semilogx(size_bins,GS(29,:));
semilogx(size_bins,GS(33,:));
semilogx(size_bins,GS(37,:));
semilogx(size_bins,GS(41,:));
semilogx(size_bins,GS(45,:));
xlabel('Bin Size (mm)'); ylabel('% weight');
title('0-0.5cm depth');
legend('1','2','3','4','5','6');
mean_g_1 = mean([GS(25,:); GS(29,:); GS(33,:); GS(37,:); GS(41,:); GS(45,:)]);
std_g_1 = std([GS(25,:); GS(29,:); GS(33,:); GS(37,:); GS(41,:); GS(45,:)]);

f(2) = subplot(4,1,2);
semilogx(size_bins,GS(26,:));
hold on
semilogx(size_bins,GS(30,:));
semilogx(size_bins,GS(34,:));
semilogx(size_bins,GS(38,:));
semilogx(size_bins,GS(42,:));
semilogx(size_bins,GS(46,:));
xlabel('Bin Size (mm)'); ylabel('% weight');
title('0.5-1.0cm depth');
mean_g_2 = mean([GS(26,:); GS(30,:); GS(34,:); GS(38,:); GS(42,:); GS(46,:)]);
std_g_2 = std([GS(26,:); GS(30,:); GS(34,:); GS(38,:); GS(42,:); GS(46,:)]);

f(3) = subplot(4,1,3);
semilogx(size_bins,GS(27,:));
hold on
semilogx(size_bins,GS(31,:));
semilogx(size_bins,GS(35,:));
semilogx(size_bins,GS(39,:));
semilogx(size_bins,GS(43,:));
semilogx(size_bins,GS(47,:));
xlabel('Bin Size (mm)'); ylabel('% weight');
title('2-3cm depth');
mean_g_3 = mean([GS(27,:); GS(31,:); GS(35,:); GS(39,:); GS(43,:); GS(47,:)]);
std_g_3 = std([GS(27,:); GS(31,:); GS(35,:); GS(39,:); GS(43,:); GS(47,:)]);

f(4) = subplot(4,1,4);
semilogx(size_bins,GS(28,:));
hold on
semilogx(size_bins,GS(32,:));
semilogx(size_bins,GS(36,:));
semilogx(size_bins,GS(40,:));
semilogx(size_bins,GS(44,:));
semilogx(size_bins,GS(48,:));
xlabel('Bin Size (mm)'); ylabel('% weight');
title('4-5cm depth');
mean_g_4 = mean([GS(28,:); GS(32,:); GS(36,:); GS(40,:); GS(44,:); GS(48,:)]);
std_g_4 = std([GS(28,:); GS(32,:); GS(36,:); GS(40,:); GS(44,:); GS(48,:)]);

sgtitle('Grizzly Bay');
linkaxes(f)
ylim([0 10])
xlim([-inf 1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BOUND PLOTS ACROSS DEPTHS, COMPARING BAYS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% http://kellyakearney.net/2016/06/10/boundedline.html.
% TEST SECTION
means_sp = [mean_sp_1; mean_sp_2; mean_sp_3; mean_sp_4];
means_g = [mean_g_1; mean_g_2; mean_g_3; mean_g_4];
stds_sp = [std_sp_1; std_sp_2; std_sp_3; std_sp_4];
stds_g = [std_g_1; std_g_2; std_g_3; std_g_4];

figure
for ii = 1:n_GS_depths
    f(ii) = subplot(n_GS_depths,1,ii);
    boundedline(log_size_bins,means_sp(ii,:),stds_sp(ii,:),'b','alpha');
    hold on
    boundedline(log_size_bins,means_g(ii,:),stds_g(ii,:),'r','alpha');
    xlabel('Log_1_0 Bin Size (mm)'); ylabel('% weight');
end
sgtitle('San Pablo (blue), Grizzly (red)');
linkaxes(f)
ylim([0 10])
xlim([-inf -1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EACH SYRINGE, COMPARING DEPTHS
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
sgtitle('San Pablo Bay');

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
sgtitle('Grizzly Bay');

