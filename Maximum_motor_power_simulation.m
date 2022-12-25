% define the parameters of the motor and the load
ratedPower = 100; % rated power in W
ratedSpeed = 1000; % rated speed in rpm
ratedTorque = 10; % rated torque in N*m
loadTorque = 5; % load torque in N*m

% define the time-varying input voltage to the motor
time = 0:0.1:10; % time vector in s
voltage = 10*sin(time); % input voltage in V

% initialize the arrays for the simulation results
speed = zeros(size(time));
torque = zeros(size(time));
power = zeros(size(time));

% run the simulation loop to compute the motor's speed, torque, and output power at each time step
for i = 1:length(time)
    % compute the motor's speed and torque
    [speed(i), torque(i)] = motorModel(voltage(i), loadTorque,ratedSpeed,ratedTorque);
    
    % compute the output power
    power(i) = speed(i)*torque(i);
end

% plot the results
plot(time, power);
xlabel('Time (s)');
ylabel('Output Power (W)');

% define a function that computes the motor's speed and torque as a function of the input voltage and load torque
function [speed, torque] = motorModel(voltage, loadTorque,ratedSpeed,ratedTorque)
    % compute the motor's speed and torque using lookup tables or equations
    speed = ratedSpeed*voltage/10; % assume linear relationship between voltage and speed
    torque = ratedTorque*loadTorque/5; % assume linear relationship between load torque and torque
end
