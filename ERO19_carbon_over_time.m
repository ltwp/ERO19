% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Updated 15 November 2019

ERO19_prep

% OVERWRITE
n_trips = 4;
n_c_depths = length(carbon_depths);

grizzly_TOC_means = zeros(n_trips,n_c_depths);
grizzly_TIC_means = zeros(n_trips,n_c_depths);
sanpablo_TOC_means = zeros(n_trips,n_c_depths);
sanpablo_TIC_means = zeros(n_trips,n_c_depths);

for nn = 1:n_trips
    for jj = 1:n_c_depths
        eval(strcat('run_trip_',num2str(nn)));
        grizzly_TOC_means(nn,jj) = mean([
    end
end

figure
hold on
for nn = 1:n_trips
    eval(strcat('run_trip_',num2str(nn)));
    if is_grizzly_first
        
        grizzly_TOC = TOC(1:18);
        grizzly_TIC = TIC(1:18);
        sanpablo_TOC = TOC(19:36);
        sanpablo_TIC = TIC(19:36);
        
        
    else
        grizzly_TOC = TOC(19:36);
        grizzly_TIC = TIC(19:36);
        sanpablo_TOC = TOC(1:18);
        sanpablo_TIC = TIC(1:18);   
    end
    
    for jj = 1:n_c_depths
            grizzly_TOC_means(nn,jj) = mean([grizzly_TOC(jj) grizzly_TOC(jj+3) grizzly_TOC(jj+6) grizzly_TOC(jj+9) grizzly_TOC(jj+12) grizzly_TOC(jj+15)]);
            grizzly_TIC_means(nn,jj) = mean([grizzly_TIC(jj) grizzly_TIC(jj+3) grizzly_TIC(jj+6) grizzly_TIC(jj+9) grizzly_TIC(jj+12) grizzly_TIC(jj+15)]);
            sanpablo_TOC_means(nn,jj) = mean([sanpablo_TOC(jj) sanpablo_TOC(jj+3) sanpablo_TOC(jj+6) sanpablo_TOC(jj+9) sanpablo_TOC(jj+12) sanpablo_TOC(jj+15)]);
            sanpablo_TIC_means(nn,jj) = mean([sanpablo_TIC(jj) sanpablo_TIC(jj+3) sanpablo_TIC(jj+6) sanpablo_TIC(jj+9) sanpablo_TIC(jj+12) sanpablo_TIC(jj+15)]);
    end

    for ii = 1:6
        f(1) = subplot(3,1,1);
        hold on
        yyaxis left
        scatter(grizzly_datetimes(nn),grizzly_TOC(ii*3-2),20,'b*');
        scatter(sanpablo_datetimes(nn),sanpablo_TOC(ii*3-2),20,'r*');
        ylabel('% Organic Carbon');
        yyaxis right
        scatter(grizzly_datetimes(nn),grizzly_TIC(ii*3-2),20,'bs');
        scatter(sanpablo_datetimes(nn),sanpablo_TIC(ii*3-2),20,'rs');
        ylabel('% Inorganic Carbon');
        xlabel('Date');
        

        f(2) = subplot(3,1,2);
        hold on
        yyaxis left
        scatter(grizzly_datetimes(nn),grizzly_TOC(ii*3-1),20,'b*');
        scatter(sanpablo_datetimes(nn),sanpablo_TOC(ii*3-1),20,'r*');
        ylabel('% Organic Carbon');
        yyaxis right
        scatter(grizzly_datetimes(nn),grizzly_TIC(ii*3-1),20,'bs');
        scatter(sanpablo_datetimes(nn),sanpablo_TIC(ii*3-1),20,'rs');
        ylabel('% Inorganic Carbon');
        xlabel('Date');

        f(3) = subplot(3,1,3);
        hold on
        yyaxis left
        scatter(grizzly_datetimes(nn),grizzly_TOC(ii*3),20,'b*');
        scatter(sanpablo_datetimes(nn),sanpablo_TOC(ii*3),20,'r*');
        ylabel('% Organic Carbon');
        yyaxis right
        scatter(grizzly_datetimes(nn),grizzly_TIC(ii*3),20,'bs');
        scatter(sanpablo_datetimes(nn),sanpablo_TIC(ii*3),20,'rs');
        ylabel('% Inorganic Carbon');
        xlabel('Date');
                
%         grizzly_TOC_means = [grizzly_TOC_means mean([grizzly_TOC(ii*3-2) grizzly_TOC(ii*3-1) grizzly_TOC(ii*3)
    end
    
end

% yyaxis left
% ylim([

title(f(1),'0-0.5cm Depth');
title(f(2),'0.5cm-1cm Depth');
title(f(3),'4-5cm Depth');
linkaxes(f);