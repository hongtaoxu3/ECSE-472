% Testbench for Chebychev filter
% Use opAmps with Gain of 5000

% Specify OpAmp Gain
A = 5000;

% Load netlist for filter with time domain source
Circuit_chebychev_filter_TD;

% Find the transient response using backward Euler
[tpoints,tranresp] = transient_beuler(0,20e-3,1e-6,10);


% Load chebychev filter with AC input
Circuit_chebychev_filter

% Set frequency point at 2000Hz
fpoint = 2000;

% Call the fsovle function to compute the frequency response
Fresp = fsolve(fpoint , 10);

% Sample the steady state output in the time domain
steadystate = abs(Fresp)*sin(2*pi*fpoint*tpoints + angle(Fresp));
figure(1)
hold off
clf
plot(1000*tpoints, 1000*tranresp,'b','LineWidth',2);
hold on
plot(1000*tpoints, 1000*steadystate,'r:','LineWidth',2);
grid on
xlabel('Time (mSec)','FontSize',20)
ylabel('Output Voltage (mV)','FontSize',20)
legend({'Transient', 'Steady State'},'FontSize',20);




