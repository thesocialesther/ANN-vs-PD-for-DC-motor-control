# ANN versus PD control of a DC motor
Author: Oluwaferanmi Esther Onifade; academic group project.

MATLAB/Simulink models for DC motor control, PD-generated training examples, and a neural-network controller. Training uses error and velocity as two inputs and control voltage as the target, with ten hidden neurons.

## Files
- defined_params.m: motor, gearbox, and controller parameters.
- dc_motor.slx, dc_motorANN.slx, Combined.slx, THEMODEL.slx: original submitted models.
- params.sldd: Simulink data dictionary.
- training_script.m: network training and Simulink block generation.
- training_data.mat: saved training data, if included.

## Use
Requires MATLAB, Simulink, and Deep Learning Toolbox (fitnet and gensim). Run defined_params.m, inspect and simulate the relevant model, then run training_script.m. Training expects simulation output out with error_data, velocity_data, and voltage_data.

Review model relationships in Simulink before reproducing the comparison. No additional measured performance claim is made by this export. Group collaborators should be credited when their names are confirmed.
