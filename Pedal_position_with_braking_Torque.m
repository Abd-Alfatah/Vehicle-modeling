% Pedal position (0 to 1)
pedal_position = 0.5;

% Brake pad coefficient of friction
mu = 0.3;

% Brake rotor radius (m)
r = 0.25;

% Maximum brake force (N)
F_max = 1000;

% Exponent for brake force-pedal position relationship
n = 6;

% Calculate brake torque
F = F_max * exp(n * pedal_position);
T = mu * F * r;

% Print brake torque
fprintf('Brake torque: %f Nm\n', T);

% Calculate brake torque for a range of pedal positions
pedal_positions = linspace(0, 1, 100);
brake_torques = zeros(size(pedal_positions));
for i = 1:length(pedal_positions)
  F = F_max * exp(n * pedal_positions(i));
  brake_torques(i) = mu * F * r;
end

% Plot brake torque vs. pedal position
figure
plot(pedal_positions, brake_torques)
xlabel('Pedal position')
ylabel('Brake torque (Nm)')
