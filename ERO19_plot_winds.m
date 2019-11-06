% Lukas WinklerPrins
% UC Berkeley / USGS PCMSC 
% lukas_wp@berkeley.edu

% Last Updated 10 October 2019

SP = readNOAABuoy('noaa/combined_sp_9415141.txt');
G = readNOAABuoy('noaa/combined_g_9415144.txt');

plot(SP.times,SP.wspd);
hold on
plot(G.times,G.wspd);

% Puts trip times at 08:00 arbitrarily. This line includes both days when
% trips were two-day. 
trip_datetimes_full = [datetime(2019,6,12,8,0,0); datetime(2019,6,13,8,0,0); datetime(2019,6,26,8,0,0); datetime(2019,6,27,8,0,0); datetime(2019,7,9,8,0,0); datetime(2019,7,10,8,0,0); datetime(2019,7,18,8,0,0); datetime(2019,7,19,8,0,0); datetime(2019,8,6,8,0,0); datetime(2019,8,7,8,0,0); datetime(2019,8,14,8,0,0); datetime(2019,8,15,8,0,0); datetime(2019,8,21,8,0,0)];
scatter(trip_datetimes_full,ones(size(trip_datetimes_full)).*mean([mean(G.wspd) mean(SP.wspd)]),'ks','MarkerFaceColor','k');

ylim([0 12]);
ylabel('Wind Speed (m/s)'); xlabel('Date');
legend('San Pablo','Grizzly');