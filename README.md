# ANN versus PD control of a DC motor

**Author: Oluwaferanmi Esther Onifade — academic group project**

A MATLAB/Simulink study comparing a proportional-derivative (PD) controller with an artificial neural network (ANN) controller for a DC motor and gearbox. The project investigates whether a network trained on controller examples can reproduce the relationship between tracking error, velocity, and motor control voltage.

## Approach

The motor model uses electrical and mechanical parameters defined in `defined_params.m`, including motor resistance, inductance, torque and back-EMF constants, inertia, friction, and gearbox ratio. The PD parameters include Kp=40 and Kd=2.

The training script uses two inputs—error and velocity—and a control-voltage target. It trains a `fitnet` network with ten hidden neurons and uses `gensim` to generate a Simulink network block. It expects a simulation output named `out` containing `error_data`, `velocity_data`, and `voltage_data`.

## Repository contents

| File | Purpose |
| --- | --- |
| `defined_params.m` | Motor, gearbox, reference, and controller parameters |
| `dc_motor.slx` | Original motor/control model |
| `dc_motorANN.slx` | ANN-related model |
| `Combined.slx`, `THEMODEL.slx` | Additional submitted comparison models |
| `params.sldd` | Simulink data dictionary |
| `training_script.m` | ANN training and block generation |
| `training_data.mat` | Saved training-data artifact |

## Setup and workflow

Requires MATLAB, Simulink, and Deep Learning Toolbox. The parameter file records MATLAB R2024b.

1. Open the repository in MATLAB and run `defined_params.m`.
2. Open the models and check their data-dictionary links, referenced blocks, and signal logging.
3. Simulate the baseline model configured to produce the three required signals in `out`.
4. Run `training_script.m` to train the network and generate its Simulink block.
5. Inspect the ANN and comparison models, then compare responses under matching reference inputs and simulation conditions.

The final model entry point and submission workflow still need confirmation; the repository preserves all four original models instead of assigning an unverified final role to one.

## Results and remaining material

The source and training artifact are included. A saved trained ANN, final response plots, and a documented numerical comparison are still needed before publishing quantitative performance claims. Group collaborators should be credited once their names and contributions are confirmed.
