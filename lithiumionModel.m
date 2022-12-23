% Set up the battery model
classdef lithiumionModel
    %LITHIUMIONMODEL Simple lithium-ion battery model
    
    properties
        % Model parameters
        R0 = 0.01; % Internal resistance at 0% SOC
        a = 0.003; % Resistance increase per % SOC
        C = 1000; % Capacity in Ah
        
        % State variables
        SOC = 0; % State of charge (0-1)
        V = 3.7; % Terminal voltage (V)
        I = 200; % Current (A)
        T = 25; % Temperature (C)
    end
    
    methods
        function obj = step(obj, dt)
            %STEP Advance the model by one time step
            %   obj = step(obj, dt) advances the model by one time step of
            %   size dt (in seconds).
            
            % Calculate the internal resistance
            R = obj.R0 + obj.a*obj.SOC;
            
            % Calculate the terminal voltage
            obj.V = obj.I*R + obj.I;
            
            % Calculate the state of charge
            obj.SOC = obj.SOC + obj.I*dt/obj.C;
            
            % Limit the state of charge to the range [0, 1]
            obj.SOC = max(min(obj.SOC, 1), 0);
        end
    end
end