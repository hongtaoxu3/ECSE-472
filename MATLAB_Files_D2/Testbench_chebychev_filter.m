% Testbench for Chebychev filter
% Use opAmps with Gain of 50

% Specify OpAmp Gain
A = 50; 

% load netlist
Circuit_chebychev_filter;

% Linearly spaced frequenchy points from 1Hz to 20000Hz
fpoints = linspace(1,20000,1024); 

% call the fsovle function to compute the frequency response
r = fsolve(fpoints , 10);

% compute the circuit gain in dB
Gain_dB = 10*log(abs(r));

% Compute the angle of hte transfer function in degrees
TF_Angle = angle(r)*180/pi;

% Load the reference solution for comparison
load Chebychev_reference_solution;

% plot voltage gain
figure(1)
hold off
clf;
semilogx(fpoints,Gain_dB,'LineWidth',2);
hold on
semilogx(fpoints,reference_gain,'r:','LineWidth',2);
xlabel('Frequency (Hz)')
ylabel('Voltage Gain (dB)')
grid
legend('My solution', 'Reference solution');
title('Active Chebychev Filter - Low Gain OpAmps')

% plot transfer function angle
figure(2)
hold off
clf;
semilogx(fpoints, TF_Angle,'LineWidth',2)
hold on
semilogx(fpoints,reference_angle,'r:','LineWidth',2);
xlabel('Frequency (Hz)')
ylabel('Angle of Transfer Function (dB)')
grid
legend('My solution', 'Reference solution');
title('Active Chebychev Filter - Low Gain OpAmps')


% The following outlines how the reference solution was obtained.
% The reference solution is the circuit solution plus some small random
% noise. We added the noise for our own verificaiton purposes. You can
% ignore it. 
% random_noise = normrnd(0, 1e-4, size(r));
% reference_gain = Gain_dB + random_noise;
% reference_angle = TF_Angle + random_noise;
% save Chebychev_reference_solution reference_gain reference_angle
% save Chebychev_noise random_noise

