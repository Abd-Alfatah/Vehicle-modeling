% Define the range of SOC values to plot
SOC = 0:0.01:1;
% Define the parameters of the model
R1 = 0.01; % internal resistance [Ohm]
C1 = 2; % capacity [Ah]
Vmax = 4.2; % maximum voltage [V]
Vmin = 3.0; % minimum voltage [V]
% Calculate the OCV values for each SOC
OCV = OCV_model(SOC,Vmax,Vmin,R1,C1);

% Create a figure
figure;

% Use the plot function to plot the OCV curve
plot(SOC, OCV);

% Add labels to the x-axis and y-axis
xlabel('State of Charge (SOC)');
ylabel('Open Circuit Voltage (OCV)');

% Add a title to the plot
title('OCV Curve');

% Define the OCV function
function OCV = OCV_model(SOC,Vmax,Vmin,R1,C1)
    OCV = Vmax - R1*C1.*SOC.*log(SOC) + Vmin.*SOC;
end
