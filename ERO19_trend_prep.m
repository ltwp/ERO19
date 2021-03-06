% Lukas WinklerPrins
% lukas_wp@berkeley.edu
% UC Berkeley / USGS PCMSC

% Last Edited 18 February 2020

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Some Trip Variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
trip_date_labels = {'1: June 12/13','2: June 26/27','3: July 9/10','4: July 18/19','5: Aug 6/7','6: Aug 14/15','7: Aug 21','8: Nov 25', '9'};
% Arbitrarily putting Trip Times at 08:00 !!! NOTE !!!
% Only indicates first day of two-day trips. 
trip_datetimes = [datetime(2019,6,12,8,0,0); datetime(2019,6,26,8,0,0); datetime(2019,7,9,8,0,0); datetime(2019,7,18,8,0,0); datetime(2019,8,6,8,0,0); datetime(2019,8,14,8,0,0); datetime(2019,8,21,8,0,0); datetime(2019,11,25,8,0,0); datetime(2020,1,13,8,0,0)];

sanpablo_datetimes = [datetime(2019,6,12,10,30,0), datetime(2019,6,27,9,15,00), datetime(2019,7,10,9,30,0), datetime(2019,7,19,7,15,0), datetime(2019,8,7,9,15,0), datetime(2019,8,15,10,15,0), datetime(2019,8,21,8,15,0), datetime(2019,11,25,8,50,0)];
grizzly_datetimes = [datetime(2019,6,13,9,0,0), datetime(2019,6,26,9,45,0), datetime(2019,7,9,10,0,0), datetime(2019,7,18,8,15,0), datetime(2019,8,6,10,0,0), datetime(2019,8,14,11,45,0), datetime(2019,8,21,11,0,0), datetime(2019,11,25,10,0,0)];

n_trips = length(trip_datetimes);
% n_trips = 7; % You can manually impose the trips you want to see, here. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting Prep
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Colors to represent change over time. 
% start_color = [41,28,19]./255; % dark brown
% end_color = [253,199,131]./255; % light tan
start_color = [149,111,49]./255; % light brown
end_color = [51,237,233]./255; % aqua
colors = [linspace(start_color(1),end_color(1),n_trips)',linspace(start_color(2),end_color(2),n_trips)',linspace(start_color(3),end_color(3),n_trips)'];

% SOFT TO STRONG RED/BLUE COLORING
start_color_r = [255,0,0]./255;
end_color_r = [255,200,200]./255;
colors_r = [linspace(start_color_r(1),end_color_r(1),n_trips)',linspace(start_color_r(2),end_color_r(2),n_trips)',linspace(start_color_r(3),end_color_r(3),n_trips)'];
start_color_b = [0,0,255]./255;
end_color_b = [200,200,255]./255;
colors_b = [linspace(start_color_b(1),end_color_b(1),n_trips)',linspace(start_color_b(2),end_color_b(2),n_trips)',linspace(start_color_b(3),end_color_b(3),n_trips)'];

% For Grain Size...

% Gradient of colors
color1 = '#FDC783';
color2 = '#EA915C';
color3 = '#815030';
color4 = '#291C13';
% colors = {color1, color2, color3, color4};

depth1 = '0-0.5cm depth';
depth2 = '0.5-1cm depth';
depth3 = '2-3cm depth';
depth4 = '4-5cm depth';
depth_titles = {depth1, depth2, depth3, depth4};