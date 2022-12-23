% Open the text file
% source https://www.epa.gov/vehicle-and-fuel-emissions-testing/dynamometer-drive-schedules
fid = fopen('D:\Python_project_car_modeling\ProcessExplorer\ftpcol.txt', 'r');
disp(fid)
% Read the data from the file
data = textscan(fid, '%f %f', 'HeaderLines', 1);

% Close the file
fclose(fid);

% Extract the time and speed data
time = data{1};
speed_mph = data{2};

% Convert the speed data from mph to km/h
speed_kmh = speed_mph * 1.60934;

% Plot the speed versus time data
figure;
plot(time, speed_kmh, '-b');

% Add labels and title to the plot
xlabel('Time (s)');
ylabel('Speed (km/h)');
title('Urban Dynamometer Driving Schedule (FTP-75)');
