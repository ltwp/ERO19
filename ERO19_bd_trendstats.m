% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Updated 6 November 2019

ERO19_prep

sanpablo_datetimes = [datetime(2019,6,12,10,30,0), datetime(2019,6,27,9,15,00), datetime(2019,7,10,9,30,0), datetime(2019,7,19,7,15,0), datetime(2019,8,7,9,15,0), datetime(2019,8,15,10,15,0),datetime(2019,8,21,8,15,0)];
grizzly_datetimes = [datetime(2019,6,13,9,0,0), datetime(2019,6,26,9,45,0), datetime(2019,7,9,10,0,0), datetime(2019,7,18,8,15,0), datetime(2019,8,6,10,0,0), datetime(2019,8,14,11,45,0), datetime(2019,8,21,11,0,0)];

top_two_grizzly = [];
top_two_sanpablo = [];
top_grizzly = [];
top_sanpablo = [];
second_grizzly = [];
second_sanpablo = [];
total_grizzly = [];
total_sanpablo = [];
dates_long_grizzly = [];
dates_long_sanpablo = [];

figure
hold on
for nn = 1:n_trips
    eval(strcat('run_trip_',num2str(nn)));
        % To Scatter all of the values...
    top_two_temp = (bulk_density(1,:)+bulk_density(2,:))./2;
    if is_grizzly_first
        top_two_grizzly = [top_two_grizzly top_two_temp(1:6)];
        top_two_sanpablo = [top_two_sanpablo top_two_temp(7:12)];
        top_grizzly = [top_grizzly bulk_density(1,1:6)];
        top_sanpablo = [top_sanpablo bulk_density(1,7:12)];
        second_grizzly = [second_grizzly bulk_density(2,1:6)];
        second_sanpablo = [second_sanpablo bulk_density(2,7:12)];
        total_grizzly = [total_grizzly mean(bulk_density(:,1:6))];
        total_sanpablo = [total_sanpablo mean(bulk_density(:,7:12))];
    else
        top_two_grizzly = [top_two_grizzly top_two_temp(7:12)];
        top_two_sanpablo = [top_two_sanpablo top_two_temp(1:6)];
        top_grizzly = [top_grizzly bulk_density(1,7:12)];
        top_sanpablo = [top_sanpablo bulk_density(1,1:6)];
        second_grizzly = [second_grizzly bulk_density(2,7:12)];
        second_sanpablo = [second_sanpablo bulk_density(2,1:6)];
        total_grizzly = [total_grizzly mean(bulk_density(:,7:12))];
        total_sanpablo = [total_sanpablo mean(bulk_density(:,1:6))];
    end
    for ii = 1:6
        dates_long_grizzly = [dates_long_grizzly datenum(grizzly_datetimes(nn))];
        dates_long_sanpablo = [dates_long_sanpablo datenum(sanpablo_datetimes(nn))];
        scatter(grizzly_datetimes(nn),top_two_temp(ii+6),'b*');
        scatter(sanpablo_datetimes(nn),top_two_temp(ii),'r*');
    end
end

ylabel('Bulk Density (g/cm^3)')
xlabel('Date')
legend('Grizzly','San Pablo');
title('Top-Two Sections Avg BD Trends');

[Rg,Pg] = corrcoef(dates_long_grizzly,top_two_grizzly);
[Rp,Pp] = corrcoef(dates_long_sanpablo,top_two_sanpablo);
% Averaged Top 2
% Grizzly p is 0.0156 so seems significant (-.37)
% San Pablo p is 0.0414 so juuust significant (.32)

% [Rg,Pg] = corrcoef(dates_long_grizzly,top_grizzly);
% [Rp,Pp] = corrcoef(dates_long_sanpablo,top_sanpablo);
% Just Top Section
% Grizzly p is 0.0103 so significant (-.39)
% San Pablo p is 0.33 so not significant (.15)

% [Rg,Pg] = corrcoef(dates_long_grizzly,second_grizzly);
% [Rp,Pp] = corrcoef(dates_long_sanpablo,second_sanpablo);
% Just Second Section
% Grizzly p is 0.09, not significant (-.26)
% San Pablo p is 0.0085! Significant! (.40)

% [Rg,Pg] = corrcoef(dates_long_grizzly,total_grizzly);
% [Rp,Pp] = corrcoef(dates_long_sanpablo,total_sanpablo);
% Average across all depths (!)
% Grizzly p is 0.0685, so not really significant (-.28)
% San Pablo p is 0.0387 so a bit significant (.32)
