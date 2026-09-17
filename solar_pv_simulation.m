% Solar PV Cell I-V and P-V Characteristics Simulation
% Created for EEE Analysis & Research

clc; clear; close all;

% Module Parameters (Standard Test Conditions: 1000 W/m2, 25 deg C)
I_sc = 8.21;       % Short-circuit current (A)
V_oc = 32.9;       % Open-circuit voltage (V)
Imp = 7.61;        % Maximum power current (A)
Vmp = 26.3;        % Maximum power voltage (V)
Pmax = Vmp * Imp;  % Peak Power (W)

% Voltage Array
V = 0:0.1:V_oc;

% Varying Irradiance Levels (G in W/m^2)
G = [400, 600, 800, 1000];

figure('Name','Solar PV Characteristics','NumberTitle','off');

% Plotting I-V Curves
subplot(2,1,1);
hold on; grid on;
for i = 1:length(G)
    I = I_sc * (G(i)/1000) * (1 - (V/V_oc).^5);
    I(I < 0) = 0;
    plot(V, I, 'LineWidth', 2, 'DisplayName', sprintf('%d W/m^2', G(i)));
end
xlabel('Voltage (V)');
ylabel('Current (A)');
title('I-V Characteristics of Solar PV Array');
legend('Location', 'southwest');

% Plotting P-V Curves
subplot(2,1,2);
hold on; grid on;
for i = 1:length(G)
    I = I_sc * (G(i)/1000) * (1 - (V/V_oc).^5);
    I(I < 0) = 0;
    P = V .* I;
    plot(V, P, 'LineWidth', 2, 'DisplayName', sprintf('%d W/m^2', G(i)));
end
xlabel('Voltage (V)');
ylabel('Power (W)');
title('P-V Characteristics of Solar PV Array');
legend('Location', 'northwest');
