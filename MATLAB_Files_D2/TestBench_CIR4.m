clear all

% Load netlist file
CIR4

% call the fsovle function to compute the frequency response
fpoints = logspace(0,6,10000);
r = fsolve(fpoints , 4);

% compute the circuit gain in dB
Gain_dB = 10*log(abs(r));

% Compute the angle of hte transfer function in degrees
TF_Angle = unwrap(angle(r)*180/pi);

% Load the reference solution for comparison
load CIR4_solution;

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
title('CIR4 Solution')
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
title('CIR4 Solution')

% The following outlines how the reference solution was obtained.
% The reference solution is the circuit solution plus some small random
% noise. We added the noise for our own verificaiton purposes. You can
% ignore it. 
% random_noise = normrnd(0, 1e-4, size(r));
% reference_gain = Gain_dB + random_noise;
% reference_angle = TF_Angle + random_noise;
% save CIR4_solution reference_gain reference_angle
% save CIR4_noise random_noise

