clear all


% Set filter components values
R1 = 50;	
L1 = 0.00310511;	
C1 = 3.53642e-06;
L2 = 0.0132337;	
C2 = 6.24524e-06;	
L3 = 0.0156131;
C3 = 5.29349e-06; 	
L4 = 0.00884106;	
C4 = 1.24205e-06;	
R2 = 50;


% Load netlist file
LCfilterOrder8

% call the fsovle function to compute the frequency response
fpoints = logspace(0,5,10000);
%fpoints=linspace(970,980,100);
r = fsolve(fpoints , 6);

% compute the circuit gain in dB
Gain_dB = 10*log(abs(r));

% Compute the angle of hte transfer function in degrees
TF_Angle = unwrap(angle(r)*180/pi);

% Load the reference solution for comparison
load LCfilter1_solution;

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
title('LC filter 1')
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
title('LC filter 1')

% The following outlines how the reference solution was obtained.
% The reference solution is the circuit solution plus some small random
% noise. We added the noise for our own verificaiton purposes. You can
% ignore it. 
% random_noise = normrnd(0, 1e-4, size(r));
% reference_gain = Gain_dB + random_noise;
% reference_angle = TF_Angle + random_noise;
% save LCfilter1_solution reference_gain reference_angle
% save LCfilter1_noise random_noise

