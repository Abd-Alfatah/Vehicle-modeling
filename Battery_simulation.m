% Set the initial state of charge (SOC) of the battery
battery = lithiumionModel;
battery.SOC = 0.9;

% Set the temperature of the battery
battery.T = 25; % Set the temperature of the battery to 25 C

% Set the current that will be applied to the battery
current = -0.1; % Discharge at 1 A

% Set the time step (dt) and simulation time (tEnd)
dt = 1; % Time step of 1 second
tEnd = 3600; % Simulate for 1 hour
% Initialize the time, terminal voltage, and state of charge vectors
t = 0:dt:tEnd;
V = zeros(size(t));
SOC = zeros(size(t));

% Set the initial terminal voltage and state of charge
V(1) = battery.V;
SOC(1) = battery.SOC;

% Set the current that will be applied to the battery
battery.I = current;

% Run the simulation
for k = 2:length(t)
    % Advance the model by one time step
    battery = battery.step(dt);
    
    % Store the terminal voltage and state of charge
    V(k) = battery.V;
    SOC(k) = battery.SOC;
end

% Plot the results
figure
plot(t, V, 'LineWidth', 2)
xlabel('Time (s)')
ylabel('Terminal voltage (V)')

figure
plot(t, SOC, 'LineWidth', 2)
xlabel('Time (s)')
ylabel('State of charge (SOC)')
