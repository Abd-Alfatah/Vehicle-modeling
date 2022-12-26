% Define constants
R = 0.01; % Resistance of electric motor (Ohms)
L = 0.1; % Inductance of electric motor (Henry)
Kt = 0.1; % Torque constant of electric motor (N*m/A)
Kv = 10; % Speed constant of electric motor (rad/s/V)
J = 0.1; % Rotor inertia (kg*m^2)
B = 0.01; % Damping coefficient (N*m*s/rad)

% Define state-space model for electric motor
A = [0 1; 0 -B/J];
B = [0; Kt/J];
C = [1 0];
D = 0;
sys = ss(A,B,C,D);

% Define input signal (step response)
t = 0:0.01:10; % Time vector
u = ones(size(t)); % Step input

% Simulate electric motor response
[y,t,x] = lsim(sys,u,t);

% Plot electric motor response
plot(t,y);
xlabel('Time (s)');
ylabel('Speed (rad/s)');
