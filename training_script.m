%% PHASE 2: EXTRACT DATA & TRAIN ANN
clc;

% 1. Check if the data is inside the 'out' object
if exist('out', 'var')
    disp('Found the "out" object. Extracting data...');
    
    % Check if it saved as an Array or a Timeseries
    if isa(out.error_data, 'timeseries')
        % If saved as Timeseries (Simulink default)
        errors = out.error_data.Data;
        velocities = out.velocity_data.Data;
        voltages = out.voltage_data.Data;
    else
        % If successfully saved as an Array
        errors = out.error_data;
        velocities = out.velocity_data;
        voltages = out.voltage_data;
    end
else
    error('Could not find the "out" variable. Did the Simulink model run successfully?');
end

% 2. Ensure data is correctly oriented (Features x Samples)
% We need a 2xN matrix for inputs, and a 1xN matrix for targets
ann_inputs = [errors(:)'; velocities(:)']; 
ann_targets = voltages(:)';

% 3. Create and Train the Neural Network
disp('Training the Neural Network...');
net = fitnet(10); % 1 hidden layer, 10 neurons
net.trainParam.showWindow = true; % Show the training UI
[trained_ann, tr] = train(net, ann_inputs, ann_targets);

% 4. Generate the Simulink Block!
disp('Generating Simulink block...');
gensim(trained_ann, -1);