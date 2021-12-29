clear all


% Set filter components values


R1 = 50;	
L1 = 0.00946733;	
C1 = 4.56647e-06;
L2 = 0.0168696;	
C2 = 5.09614e-06;	
L3 = 0.0172675;
C3 = 4.97837e-06; 	
L4 = 0.015473;	
C4 = 2.79412e-06;	
R2 = 67.77;


% Load netlist file
LCfilterOrder8

% call the fsovle function to compute the frequency response
fpoints = logspace(0,4,10000);

r = fsolve(fpoints , 6);

% compute the circuit gain in dB
Gain_dB = 10*log(abs(r));

% Compute the angle of hte transfer function in degrees
TF_Angle = unwrap(angle(r)*180/pi);

% Load the reference solution for comparison
load LCfilter2_reference_solution;

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
title('LC filter 2')
% plot transfer function angle
figure(2)
hold off
clf;
semilogx(fpoints, unwrap(TF_Angle),'LineWidth',2)
hold on
semilogx(fpoints,reference_angle,'r:','LineWidth',2);
xlabel('Frequency (Hz)')
ylabel('Angle of Transfer Function (dB)')
grid
legend('My solution', 'Reference solution');
title('LC filter 2')


% The following outlines how the reference solution was obtained.
% The reference solution is the circuit solution plus some small random
% noise. We added the noise for our own verificaiton purposes. You can
% ignore it. 
% random_noise = normrnd(0, 1e-4, size(r));
% reference_gain = Gain_dB + random_noise;
% reference_angle = TF_Angle + random_noise;
% save LCfilter2_reference_solution reference_gain reference_angle
% save LCfilter2_noise random_noise

